/-
  NormSubstitution.lean
  Properties relating substitution, degree, and normalization.
-/

import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta
import Fcomp.Substitution -- Assuming substitution definitions are here
import Fcomp.Degree       -- Depends on degree definition

namespace Fcomp.STLC

/-! ### Substitution and Degree -/

-- We need the definition of substitution, likely from Fcomp.Substitution
-- Assuming `subst x v t` denotes substituting `v` for `x` in `t`.

-- Proving the lemma for Term.substSimple, which is not partial.
-- The correct bound seems to be degree t + degree v, not max.

theorem degree_substSimple_le (t v : Term) (x : String) :
  degree (Term.substSimple t x v) ≤ degree t + degree v := by
  induction t generalizing v x with
  | var y =>
    -- Manually rewrite based on substSimple definition for var
    rw [show Term.substSimple (Term.var y) x v = (if x == y then v else Term.var y) by rfl]
    by_cases h_beq : (x == y)
    · rw [if_pos h_beq]
      simp only [degree, Nat.zero_add]
      apply Nat.le_refl
    · rw [if_neg h_beq]
      simp only [degree, Nat.zero_add]
      apply Nat.zero_le

  | abs y τ t_body ih =>
    -- Manually rewrite based on substSimple definition for abs
    rw [show Term.substSimple (Term.abs y τ t_body) x v = (if x == y then Term.abs y τ t_body else Term.abs y τ (t_body.substSimple x v)) by rfl]
    by_cases h_beq : (x == y)
    · rw [if_pos h_beq]
      simp only [degree]
      apply Nat.le_add_right
    · rw [if_neg h_beq]
      simp only [degree]
      specialize ih v x
      let step1_proof := Nat.add_le_add_right ih 1
      apply Nat.le_trans step1_proof
      apply Nat.le_of_eq
      rw [Nat.add_assoc, Nat.add_comm (degree v) 1, Nat.add_assoc]

  | app t₁ t₂ ih₁ ih₂ =>
    simp only [Term.substSimple, degree]
    specialize ih₁ v x
    specialize ih₂ v x
    rw [Nat.max_le]
    constructor
    · apply Nat.le_trans ih₁ -- Uses IH₁, need deg T₁ + deg V ≤ max (deg T₁) (deg T₂) + deg V
      apply Nat.add_le_add_right -- Need deg T₁ ≤ max (deg T₁) (deg T₂)
      apply Nat.le_max_left
    · apply Nat.le_trans ih₂ -- Uses IH₂, need deg T₂ + deg V ≤ max (deg T₁) (deg T₂) + deg V
      apply Nat.add_le_add_right -- Need deg T₂ ≤ max (deg T₁) (deg T₂)
      apply Nat.le_max_right

  | pair t₁ t₂ ih₁ ih₂ =>
    simp only [Term.substSimple, degree]
    specialize ih₁ v x
    specialize ih₂ v x
    rw [Nat.max_le]
    constructor
    · apply Nat.le_trans ih₁; apply Nat.add_le_add_right; apply Nat.le_max_left
    · apply Nat.le_trans ih₂; apply Nat.add_le_add_right; apply Nat.le_max_right

  | fst t_body ih =>
    simp only [Term.substSimple, degree]
    specialize ih v x
    exact ih

  | snd t_body ih =>
    simp only [Term.substSimple, degree]
    specialize ih v x
    exact ih

  | inl τ t_body ih =>
    simp only [Term.substSimple, degree]
    specialize ih v x
    exact ih

  | inr τ t_body ih =>
    simp only [Term.substSimple, degree]
    specialize ih v x
    exact ih

  | case t_cond y₁ b₁ y₂ b₂ ih_cond ih₁ ih₂ =>
    -- Manually rewrite based on substSimple definition for case
    rw [show Term.substSimple (Term.case t_cond y₁ b₁ y₂ b₂) x v =
             (Term.case (t_cond.substSimple x v)
                        y₁ (if x == y₁ then b₁ else b₁.substSimple x v)
                        y₂ (if x == y₂ then b₂ else b₂.substSimple x v)) by rfl]
    simp only [degree]
    -- Goal: max (deg S_c) (max (deg S₁) (deg S₂)) ≤ max (deg T_c) (max (deg T₁) (deg T₂)) + deg V
    specialize ih_cond v x -- ih_c: deg S_c ≤ deg T_c + deg V
    specialize ih₁ v x     -- ih₁: deg (subst T₁) ≤ deg T₁ + deg V
    specialize ih₂ v x     -- ih₂: deg (subst T₂) ≤ deg T₂ + deg V

    -- We need to show the inequality holds. It depends on the ifs for S₁ and S₂.
    rw [Nat.max_le] -- Show LHS ≤ RHS
    constructor
    · -- Goal 1: deg S_c ≤ max (deg T_c) (max (deg T₁) (deg T₂)) + deg V
      apply Nat.le_trans ih_cond -- Need: deg T_c + deg V ≤ max (deg T_c) (max (deg T₁) (deg T₂)) + deg V
      apply Nat.add_le_add_right -- Need: deg T_c ≤ max (deg T_c) (max (deg T₁) (deg T₂))
      apply Nat.le_max_left
    · -- Goal 2: max (deg S₁) (deg S₂) ≤ max (deg T_c) (max (deg T₁) (deg T₂)) + deg V
      rw [Nat.max_le] -- Show deg S₁ ≤ RHS and deg S₂ ≤ RHS
      constructor
      · -- Goal 2a: deg S₁ ≤ max (deg T_c) (max (deg T₁) (deg T₂)) + deg V
        -- S₁ = if x == y₁ then b₁ else b₁.substSimple x v
        by_cases h_beq1 : (x == y₁)
        · -- Case x == y₁. S₁ = b₁. Need deg b₁ ≤ RHS
          rw [if_pos h_beq1]
          -- Goal: deg b₁ <= max (deg T_c) (max (deg T₁) (deg T₂)) + deg V
          -- Proof: Show deg b₁ <= R, then use Nat.le_add_right to show deg b₁ <= R + deg V
          -- where R = max (deg T_c) (max (deg T₁) (deg T₂))
          apply Nat.le_trans (m := max (degree t_cond) (Nat.max (degree b₁) (degree b₂)))
          · -- Prove deg b₁ ≤ R
            let prf1 : degree b₁ ≤ Nat.max (degree b₁) (degree b₂) := Nat.le_max_left _ _
            let prf2 : Nat.max (degree b₁) (degree b₂) ≤ Nat.max (degree t_cond) (Nat.max (degree b₁) (degree b₂)) := Nat.le_max_right _ _
            exact Nat.le_trans prf1 prf2
          · -- Prove R <= R + deg V
            apply Nat.le_add_right

        · -- Case x != y₁. S₁ = substSimple b₁ x v. Need deg S₁ ≤ RHS
          rw [if_neg h_beq1]
          apply Nat.le_trans ih₁ -- Need: deg T₁ + deg V <= RHS
          apply Nat.add_le_add_right -- Need: deg T₁ <= max (deg T_c) (max (deg T₁) (deg T₂))
          let prf1 : degree b₁ ≤ Nat.max (degree b₁) (degree b₂) := Nat.le_max_left _ _
          let prf2 : Nat.max (degree b₁) (degree b₂) ≤ Nat.max (degree t_cond) (Nat.max (degree b₁) (degree b₂)) := Nat.le_max_right _ _
          exact Nat.le_trans prf1 prf2

      · -- Goal 2b: deg S₂ ≤ max (deg T_c) (max (deg T₁) (deg T₂)) + deg V
        -- S₂ = if x == y₂ then b₂ else b₂.substSimple x v
        by_cases h_beq2 : (x == y₂)
        · -- Case x == y₂. S₂ = b₂. Need deg b₂ ≤ RHS
          rw [if_pos h_beq2]
          -- Goal: deg b₂ <= max (deg T_c) (max (deg T₁) (deg T₂)) + deg V
          -- Proof: Show deg b₂ <= R, then use Nat.le_add_right to show deg b₂ <= R + deg V
          -- where R = max (deg T_c) (max (deg T₁) (deg T₂))
          apply Nat.le_trans (m := max (degree t_cond) (Nat.max (degree b₁) (degree b₂)))
          · -- Prove deg b₂ <= R
            let prf1 : degree b₂ ≤ Nat.max (degree b₁) (degree b₂) := Nat.le_max_right _ _
            let prf2 : Nat.max (degree b₁) (degree b₂) ≤ Nat.max (degree t_cond) (Nat.max (degree b₁) (degree b₂)) := Nat.le_max_right _ _
            exact Nat.le_trans prf1 prf2
          · -- Prove R <= R + deg V
            apply Nat.le_add_right

        · -- Case x != y₂. S₂ = substSimple b₂ x v. Need deg S₂ <= RHS
          rw [if_neg h_beq2]
          apply Nat.le_trans ih₂ -- Need: deg T₂ + deg V <= RHS
          apply Nat.add_le_add_right -- Need: deg T₂ <= max (deg T_c) (max (deg T₁) (deg T₂))
          -- Proof is same as above
          let prf1 : degree b₂ ≤ Nat.max (degree b₁) (degree b₂) := Nat.le_max_right _ _
          let prf2 : Nat.max (degree b₁) (degree b₂) ≤ Nat.max (degree t_cond) (Nat.max (degree b₁) (degree b₂)) := Nat.le_max_right _ _
          exact Nat.le_trans prf1 prf2

  | abort τ t_body ih =>
    simp only [Term.substSimple, degree]
    specialize ih v x
    exact ih

  | unitVal =>
    simp only [Term.substSimple, degree]
    simp only [Nat.zero_add]
    apply Nat.zero_le

end Fcomp.STLC
