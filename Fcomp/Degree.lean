/-
  Degree.lean
  Definition of the degree of a term.
-/

import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta

namespace Fcomp.STLC

/-! ### Degree of a Term -/

/-- Compute the degree of a term. -/
@[simp]
def degree : Term → Nat
  | Term.var _ => 0
  | Term.abs _ _ t => (degree t) + 1
  | Term.app t₁ t₂ => Nat.max (degree t₁) (degree t₂)
  | Term.pair t₁ t₂ => Nat.max (degree t₁) (degree t₂)
  | Term.fst t => degree t
  | Term.snd t => degree t
  | Term.inl _ t => degree t
  | Term.inr _ t => degree t
  | Term.case t _ b₁ _ b₂ => Nat.max (degree t) (Nat.max (degree b₁) (degree b₂))
  | Term.abort _ t => degree t
  | Term.unitVal => 0

end Fcomp.STLC
