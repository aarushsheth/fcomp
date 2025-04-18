import Fcomp.Prop
import Fcomp.Judgement
import Fcomp.SimpleProp

namespace Fcomp.STLC.ND

/-!
  # Natural Deduction Proof Trees (using SimpleProp)

  This file defines an explicit data structure (`ProofTree`) to represent
  the syntax of natural deduction proof derivations for `SimpleProp`.
  The structure mirrors the inference rules defined for the `Proves` judgment.
-/

-- Use definitions from previous files
open Fcomp.STLC -- General STLC components
open Fcomp.STLC.ND -- For SimpleNDContext, Proves
open Fcomp.STLC.SimpleProp -- For SimpleProp constructors

/-- Evidence that syntactic proposition P is present in the context Γ -/
inductive Assumption : SimpleNDContext → SimpleProp → Type where
  /-- The proposition is the first element of the context. -/
  | here  {Γ : SimpleNDContext} {P : SimpleProp} : Assumption (P :: Γ) P
  /-- The proposition is further down in the context. -/
  | there {Γ : SimpleNDContext} {P Q : SimpleProp} : Assumption Γ P → Assumption (Q :: Γ) P

/-- Convert Assumption evidence to a de Bruijn-like index. -/
def Assumption.toIndex : {Γ : SimpleNDContext} → {P : SimpleProp} → Assumption Γ P → Nat
  | _, _, here => 0
  | _, _, there a' => 1 + toIndex a'

/--
  An explicit representation of a Natural Deduction proof derivation tree for SimpleProp.
  A `ProofTree Γ P` represents a specific derivation showing that `Γ ⊢ P`.
-/
inductive ProofTree : SimpleNDContext → SimpleProp → Type where
  /-- Rule: Assumption (Hypothesis/Variable)
      Uses evidence `Assumption Γ P` that P is in the context.
  -/
  | assumption {Γ : SimpleNDContext} {P : SimpleProp} : Assumption Γ P → ProofTree Γ P

  /-- Rule: Implication Introduction (→I) -/
  | imp_intro {Γ : SimpleNDContext} {P Q : SimpleProp} :
      ProofTree (P :: Γ) Q → SimpleProp → ProofTree Γ (SimpleProp.imp P Q)

  /-- Rule: Implication Elimination (→E) / Modus Ponens -/
  | imp_elim {Γ : SimpleNDContext} {P Q : SimpleProp} :
      ProofTree Γ (SimpleProp.imp P Q) → ProofTree Γ P → ProofTree Γ Q

  /-- Rule: Conjunction Introduction (∧I) -/
  | and_intro {Γ : SimpleNDContext} {P Q : SimpleProp} :
      ProofTree Γ P → ProofTree Γ Q → ProofTree Γ (SimpleProp.and P Q)

  /-- Rule: Conjunction Elimination 1 (∧E₁) -/
  | and_elim_left {Γ : SimpleNDContext} {P Q : SimpleProp} :
      ProofTree Γ (SimpleProp.and P Q) → ProofTree Γ P

  /-- Rule: Conjunction Elimination 2 (∧E₂) -/
  | and_elim_right {Γ : SimpleNDContext} {P Q : SimpleProp} :
      ProofTree Γ (SimpleProp.and P Q) → ProofTree Γ Q

  /-- Rule: Disjunction Introduction 1 (∨I₁) -/
  | or_intro_left {Γ : SimpleNDContext} {P Q : SimpleProp} :
      ProofTree Γ P → SimpleProp → ProofTree Γ (SimpleProp.or P Q)

  /-- Rule: Disjunction Introduction 2 (∨I₂) -/
  | or_intro_right {Γ : SimpleNDContext} {P Q : SimpleProp} :
      ProofTree Γ Q → SimpleProp → ProofTree Γ (SimpleProp.or P Q)

  /-- Rule: Disjunction Elimination (∨E) / Proof By Cases -/
  | or_elim {Γ : SimpleNDContext} {P Q R : SimpleProp} :
      ProofTree Γ (SimpleProp.or P Q) → ProofTree (P :: Γ) R → ProofTree (Q :: Γ) R → ProofTree Γ R

  /-- Rule: True Introduction (⊤I) -/
  | true_intro {Γ : SimpleNDContext} : ProofTree Γ SimpleProp.true_prop

  /-- Rule: False Elimination (⊥E) / Ex Falso Quodlibet -/
  | false_elim {Γ : SimpleNDContext} {P : SimpleProp} :
      ProofTree Γ SimpleProp.false_prop → SimpleProp → ProofTree Γ P

/-- Helper lemma to convert Assumption evidence to a Proves term. -/
def lookup_proves {Γ : SimpleNDContext} {P : SimpleProp} : Assumption Γ P → Fcomp.STLC.ND.Proves Γ P
  | Assumption.here => Fcomp.STLC.ND.Proves.assumption
  | Assumption.there a' => Fcomp.STLC.ND.Proves.weakening (lookup_proves a')

/--
  Check/Validate a ProofTree by converting it into a term of the `Proves` type.
  This effectively runs the proof rules represented by the tree.
-/
def ProofTree.check : {Γ : SimpleNDContext} → {P : SimpleProp} → ProofTree Γ P → Fcomp.STLC.ND.Proves Γ P
  | _, _, assumption a => lookup_proves a
  | _, _, imp_intro tree_pq _ => Fcomp.STLC.ND.Proves.imp_intro (check tree_pq)
  | _, _, imp_elim tree_imp tree_p => Fcomp.STLC.ND.Proves.imp_elim (check tree_imp) (check tree_p)
  | _, _, and_intro tree_p tree_q => Fcomp.STLC.ND.Proves.and_intro (check tree_p) (check tree_q)
  | _, _, and_elim_left tree_and => Fcomp.STLC.ND.Proves.and_elim_left (check tree_and)
  | _, _, and_elim_right tree_and => Fcomp.STLC.ND.Proves.and_elim_right (check tree_and)
  | _, _, or_intro_left tree_p _ => Fcomp.STLC.ND.Proves.or_intro_left (check tree_p)
  | _, _, or_intro_right tree_q _ => Fcomp.STLC.ND.Proves.or_intro_right (check tree_q)
  | _, _, or_elim tree_or tree_pr tree_qr => Fcomp.STLC.ND.Proves.or_elim (check tree_or) (check tree_pr) (check tree_qr)
  | _, _, true_intro => Fcomp.STLC.ND.Proves.true_intro
  | _, _, false_elim tree_false _ => Fcomp.STLC.ND.Proves.false_elim (check tree_false)

/-! ### Pretty Printing Proof Trees -/

-- Helper to create indentation string
private def indent (level : Nat) : String := String.mk (List.replicate (level * 2) ' ')

-- Auxiliary function for recursive printing with indentation
-- Marked partial; termination depends on ProofTree structure not growing infinitely.
-- Note: Does not print the concluded proposition due to difficulty stringifying SimpleProp without a specific instance.
partial def ProofTree.toStringAux (level : Nat) : {Γ : SimpleNDContext} → {P : SimpleProp} → ProofTree Γ P → String
  | _, _, ProofTree.assumption a => s!"{indent level}Assume({Assumption.toIndex a})"
  | _, _, ProofTree.imp_intro subProof _ =>
    s!"{indent level}ImpIntro\n{(toStringAux (level + 1) subProof)}"
  | _, _, ProofTree.imp_elim proofImp proofP =>
    s!"{indent level}ImpElim\n{(toStringAux (level + 1) proofImp)}\n{(toStringAux (level + 1) proofP)}"
  | _, _, ProofTree.and_intro proofP proofQ =>
    s!"{indent level}AndIntro\n{(toStringAux (level + 1) proofP)}\n{(toStringAux (level + 1) proofQ)}"
  | _, _, ProofTree.and_elim_left proofAnd =>
    s!"{indent level}AndElimL\n{(toStringAux (level + 1) proofAnd)}"
  | _, _, ProofTree.and_elim_right proofAnd =>
    s!"{indent level}AndElimR\n{(toStringAux (level + 1) proofAnd)}"
  | _, _, ProofTree.or_intro_left proofP _ =>
    s!"{indent level}OrIntroL\n{(toStringAux (level + 1) proofP)}"
  | _, _, ProofTree.or_intro_right proofQ _ =>
    s!"{indent level}OrIntroR\n{(toStringAux (level + 1) proofQ)}"
  | _, _, ProofTree.or_elim proofOr proofCaseP proofCaseQ =>
    s!"{indent level}OrElim\n{(toStringAux (level + 1) proofOr)}\n{(toStringAux (level + 1) proofCaseP)}\n{(toStringAux (level + 1) proofCaseQ)}"
  | _, _, ProofTree.true_intro => s!"{indent level}TrueIntro"
  | _, _, ProofTree.false_elim proofFalse _ =>
    s!"{indent level}FalseElim\n{(toStringAux (level + 1) proofFalse)}"

/-- Convert a ProofTree to an indented string representation. -/
def ProofTree.toString {Γ : SimpleNDContext} {P : SimpleProp} (tree : ProofTree Γ P) : String := ProofTree.toStringAux 0 tree

-- Instance to use `toString` for ProofTree
-- Potentially needs a ToString instance for SimpleProp if we want to print the conclusion.
-- instance : ToString (ProofTree Γ P) where
--   toString tree := ProofTree.toStringAux 0 tree

end Fcomp.STLC.ND
