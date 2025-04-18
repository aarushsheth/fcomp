import Fcomp.Prop -- Keep for theorems if needed, but ND rules use SimpleProp
-- import Fcomp.Correspondence -- Remove this import to break cycle
import Fcomp.SimpleProp -- Need SimpleProp

namespace Fcomp.STLC.ND

/-!
  # Natural Deduction Judgments (using SimpleProp)

  This file defines the core judgment relation for the natural deduction system,
  operating on syntactic propositions (`SimpleProp`).
-/

-- Open namespaces
open Fcomp.STLC -- General STLC components
open Fcomp.STLC.SimpleProp -- Access SimpleProp constructors

/--
  A Natural Deduction context (Γ) is a list of assumed syntactic propositions.
-/
def SimpleNDContext : Type := List SimpleProp

/-- The empty context -/
def SimpleNDContext.empty : SimpleNDContext := []

/-- Add an assumption to the context -/
def SimpleNDContext.add (Γ : SimpleNDContext) (P : SimpleProp) : SimpleNDContext := P :: Γ

/--
  The judgment `Proves Γ P` asserts that syntactic proposition `P` is provable
  from the assumptions in the context `Γ`.
-/
inductive Proves : SimpleNDContext → SimpleProp → Prop where
  /-- Rule: Assumption (Hypothesis/Variable)
      In a context extended with P (P :: Γ), we can prove P.
  -/
  | assumption {Γ : SimpleNDContext} {P : SimpleProp} : Proves (P :: Γ) P

  /-- Rule: Implication Introduction (→I) -/
  | imp_intro {Γ : SimpleNDContext} {P Q : SimpleProp} :
      (Proves (P :: Γ) Q) → Proves Γ (SimpleProp.imp P Q)

  /-- Rule: Implication Elimination (→E) / Modus Ponens -/
  | imp_elim {Γ : SimpleNDContext} {P Q : SimpleProp} :
      (Proves Γ (SimpleProp.imp P Q)) → (Proves Γ P) → Proves Γ Q

  /-- Rule: Conjunction Introduction (∧I) -/
  | and_intro {Γ : SimpleNDContext} {P Q : SimpleProp} :
      (Proves Γ P) → (Proves Γ Q) → Proves Γ (SimpleProp.and P Q)

  /-- Rule: Conjunction Elimination 1 (∧E₁) -/
  | and_elim_left {Γ : SimpleNDContext} {P Q : SimpleProp} :
      (Proves Γ (SimpleProp.and P Q)) → Proves Γ P

  /-- Rule: Conjunction Elimination 2 (∧E₂) -/
  | and_elim_right {Γ : SimpleNDContext} {P Q : SimpleProp} :
      (Proves Γ (SimpleProp.and P Q)) → Proves Γ Q

  /-- Rule: Disjunction Introduction 1 (∨I₁) -/
  | or_intro_left {Γ : SimpleNDContext} {P Q : SimpleProp} :
      (Proves Γ P) → Proves Γ (SimpleProp.or P Q)

  /-- Rule: Disjunction Introduction 2 (∨I₂) -/
  | or_intro_right {Γ : SimpleNDContext} {P Q : SimpleProp} :
      (Proves Γ Q) → Proves Γ (SimpleProp.or P Q)

  /-- Rule: Disjunction Elimination (∨E) / Proof By Cases -/
  | or_elim {Γ : SimpleNDContext} {P Q R : SimpleProp} :
      (Proves Γ (SimpleProp.or P Q)) → (Proves (P :: Γ) R) → (Proves (Q :: Γ) R) → Proves Γ R

  /-- Rule: True Introduction (⊤I) -/
  | true_intro {Γ : SimpleNDContext} : Proves Γ SimpleProp.true_prop

  /-- Rule: False Elimination (⊥E) / Ex Falso Quodlibet -/
  | false_elim {Γ : SimpleNDContext} {P : SimpleProp} :
      (Proves Γ SimpleProp.false_prop) → Proves Γ P

  /-- Rule: Weakening -/
  | weakening {Γ : SimpleNDContext} {P Q : SimpleProp} :
      (Proves Γ P) → Proves (Q :: Γ) P

/-- Custom notation for the provability judgment: Γ ⊢ P -/
-- Operates on SimpleNDContext and SimpleProp
notation:50 Γ " ⊢ " P => Proves Γ P

end Fcomp.STLC.ND
