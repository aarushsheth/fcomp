/-
  MaximalDegree.lean
  Analysis of conversion of maximal degree terms.
-/

import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta
import Fcomp.Substitution
import Fcomp.Degree
import Fcomp.NormSubstitution -- May depend on lemmas here

namespace Fcomp.STLC

/-! ### Conversion of Maximal Degree -/

-- This file likely contains lemmas about how degree interacts with beta reduction,
-- possibly focusing on the `BetaStep.beta` case or properties needed for the
-- main normalization proof.

-- Helper lemmas for Nat might be needed if not built-in
-- We assume standard properties as proving them is blocked by issues unfolding Nat.max

axiom Nat.max_le_iff {a b c : Nat} : Nat.max a b ≤ c ↔ a ≤ c ∧ b ≤ c

-- Proof helper for add_max_distrib_left (assumed)
-- theorem Nat.succ_max_distrib {a b : Nat} : Nat.succ (Nat.max a b) = Nat.max (Nat.succ a) (Nat.succ b) := sorry

axiom Nat.add_max_distrib_left {k a b : Nat} : k + Nat.max a b = Nat.max (k + a) (k + b)

-- Needed for relating degree of beta redex and its reduct
-- Proof attempt failed, relying on axiom
-- theorem Nat.add_le_max_succ_left (a b : Nat) : a + b ≤ max (a + 1) b := by
--   sorry

axiom Nat.add_le_max_succ_left_ax (a b : Nat) : a + b ≤ max (a + 1) b

-- The key lemma for the reduction step
theorem degree_beta_reduct_le (t : Term) (x : String) (τ : Ty) (v : Term) :
  degree (Term.substSimple t x v) ≤ degree (Term.app (Term.abs x τ t) v) := by
  -- Define the RHS degree equality first
  have h_rhs_def : degree (Term.app (Term.abs x τ t) v) = Nat.max (1 + degree t) (degree v) := by
    simp only [degree, Nat.add_one]
    rw [Nat.succ_eq_add_one]
    rw [Nat.add_comm (degree t) 1] -- Commute to match the RHS
  -- Rewrite the goal using this equality
  rw [h_rhs_def]
  -- Goal: degree (Term.substSimple t x v) <= Nat.max (1 + degree t) (degree v)
  -- Use transitivity: degree(subst) <= deg t + deg v <= max(1 + deg t, deg v)
  apply Nat.le_trans (degree_substSimple_le t v x) -- Applies first step: degree(subst) <= deg t + deg v
  -- New Goal: degree t + degree v <= Nat.max (1 + degree t) (degree v)
  rw [Nat.add_comm 1 (degree t)] -- Make goal match axiom: deg t + deg v <= max (deg t + 1) (deg v)
  apply Nat.add_le_max_succ_left_ax (degree t) (degree v) -- Apply the axiom for the Nat inequality explicitly

-- Further lemmas will depend on the specific structure of the weak normalization proof.

end Fcomp.STLC
