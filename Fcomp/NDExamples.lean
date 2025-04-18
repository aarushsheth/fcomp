import Fcomp.Prop
import Fcomp.Judgement
import Fcomp.Proofs
import Fcomp.SimpleProp

namespace Fcomp.STLC.ND.Examples

/-!
  # Natural Deduction Examples

  This file demonstrates constructing and validating proof trees
  using the definitions from `Prop.lean`, `Judgement.lean`, and `Proofs.lean`.
-/

-- Open namespaces for convenience
open Fcomp.STLC
open Fcomp.STLC.ND
open Fcomp.STLC.SimpleProp

-- Define some simple propositions for examples
def PropP : SimpleProp := SimpleProp.var "P"
def PropQ : SimpleProp := SimpleProp.var "Q"
def PropR : SimpleProp := SimpleProp.var "R"

-- Use abbrev for aliases
abbrev P : SimpleProp := PropP
abbrev Q : SimpleProp := PropQ
abbrev R : SimpleProp := PropR

-- Define negation as implication to false
def not (p : SimpleProp) : SimpleProp := SimpleProp.imp p SimpleProp.false_prop

/-! ### Example 1: Proof of P → P -/

def proof_P_implies_P : ProofTree SimpleNDContext.empty (SimpleProp.imp P P) :=
  ProofTree.imp_intro
    (ProofTree.assumption Assumption.here)
    P

#eval ProofTree.toString proof_P_implies_P
#check ProofTree.check proof_P_implies_P

/-! ### Example 2: Proof of P ∧ Q → Q ∧ P -/

def proof_And_comm : ProofTree SimpleNDContext.empty (SimpleProp.imp (SimpleProp.and P Q) (SimpleProp.and Q P)) :=
  ProofTree.imp_intro
    (ProofTree.and_intro
      (ProofTree.and_elim_right (ProofTree.assumption Assumption.here))
      (ProofTree.and_elim_left (ProofTree.assumption Assumption.here)))
    (SimpleProp.and P Q)

#eval ProofTree.toString proof_And_comm
#check ProofTree.check proof_And_comm

/-! ### Example 3: Proof of P ∨ Q → Q ∨ P -/

def proof_Or_comm : ProofTree SimpleNDContext.empty (SimpleProp.imp (SimpleProp.or P Q) (SimpleProp.or Q P)) :=
  ProofTree.imp_intro
    (ProofTree.or_elim
      (ProofTree.assumption Assumption.here)
      (ProofTree.or_intro_right (ProofTree.assumption Assumption.here) Q)
      (ProofTree.or_intro_left (ProofTree.assumption Assumption.here) P))
    (SimpleProp.or P Q)

#eval ProofTree.toString proof_Or_comm
#check ProofTree.check proof_Or_comm

/-! ### Example 4: Proof of P ∧ ¬P → Q (Principle of Explosion) -/

def proof_explosion : ProofTree SimpleNDContext.empty (SimpleProp.imp (SimpleProp.and P (not P)) Q) :=
  ProofTree.imp_intro
    (ProofTree.false_elim
      (ProofTree.imp_elim
        (ProofTree.and_elim_right (ProofTree.assumption Assumption.here))
        (ProofTree.and_elim_left (ProofTree.assumption Assumption.here)))
      Q)
    (SimpleProp.and P (not P))

#eval ProofTree.toString proof_explosion
#check ProofTree.check proof_explosion



end Fcomp.STLC.ND.Examples
