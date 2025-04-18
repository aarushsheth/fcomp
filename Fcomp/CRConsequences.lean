/-
  CRConsequences.lean
  Consequences of the Church-Rosser Theorem for STLC Beta Reduction.

  This module derives important properties that follow from the confluence
  of beta reduction, primarily the uniqueness of normal forms.
-/

import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta
import Fcomp.CRDefinitions
import Fcomp.CRTheorem -- Depends on beta_confluent from this file

namespace Fcomp.STLC.CR

open Fcomp.STLC

/-! ### Uniqueness of Normal Forms -/

-- A key property needed: Normal forms do not reduce further.
theorem normal_form_no_step {nf : Term} (h_nf : IsNormalForm nf) :
    ∀ nf', ¬(BetaStep nf nf') := by
  -- This follows directly from the definition of IsNormalForm
  unfold IsNormalForm at h_nf
  exact h_nf

-- Another property: If t reduces to nf and nf is normal, t cannot take a step from nf.
theorem beta_multi_to_normal_implies_no_step {t nf : Term}
    (h_multi : BetaMulti t nf) (h_nf : IsNormalForm nf) :
    ∀ nf', ¬(BetaStep nf nf') := by
  exact normal_form_no_step h_nf

-- If t →→β nf and nf is normal, then nf cannot reduce to anything else via BetaMulti except itself.
-- Proof using direct pattern matching on BetaMulti
theorem normal_form_unique_reduct {nf t' : Term} (h_nf : IsNormalForm nf)
    (h : BetaMulti nf t') : nf = t' := by
  induction h with
  | refl =>
    -- Base case: BetaMulti.refl means nf = t', goal nf = nf
    rfl
  | @step loc_nf loc_t₂ step_proof =>
    -- Step case: BetaMulti.step means nf →β t₂.
    -- loc_nf here must be the same as our nf.
    -- step_proof is BetaStep nf t₂
    -- This contradicts h_nf (nf is normal)
    exact absurd step_proof (normal_form_no_step h_nf loc_t₂)
  | @trans loc_nf loc_t₂ loc_t₃ h₁ h₂ ih₁ ih₂ =>
    -- Trans case: BetaMulti.trans means nf →→β t₂ and t₂ →→β t₃.
    -- loc_nf here must be the same as our nf.
    -- ih₁ : IsNormalForm loc_nf → loc_nf = loc_t₂
    -- ih₂ : IsNormalForm loc_t₂ → loc_t₂ = loc_t₃
    -- h_nf becomes IsNormalForm loc_nf in this context
    -- Apply h_nf to ih₁ to get the equality nf = t₂
    have eq_nf_t₂ : loc_nf = loc_t₂ := ih₁ h_nf
    -- Prove that t₂ is also a normal form
    have h_nf_t₂ : IsNormalForm loc_t₂ := by
      rw [← eq_nf_t₂] -- Use the equality nf = t₂
      exact h_nf      -- The goal becomes IsNormalForm loc_nf
    -- Apply h_nf_t₂ to ih₂ to get the equality t₂ = t₃
    have eq_t₂_t₃ : loc_t₂ = loc_t₃ := ih₂ h_nf_t₂
    -- Combine the equalities using transitivity
    exact eq_nf_t₂.trans eq_t₂_t₃


/--
  Theorem: Uniqueness of Normal Forms (up to alpha-equivalence).
  If a term `t` reduces to two normal forms `nf₁` and `nf₂`, then these normal
  forms are alpha-equivalent.
  This relies on the confluence of Beta reduction (`beta_confluent`).
-/
theorem uniqueness_of_normal_forms {t nf₁ nf₂ : Term}
    (h₁ : BetaMulti t nf₁) (h₂ : BetaMulti t nf₂)
    (h_nf₁ : IsNormalForm nf₁) (h_nf₂ : IsNormalForm nf₂) :
    AlphaEquiv nf₁ nf₂ := by
  -- Assume confluence of BetaStep
  have h_conf : IsConfluent BetaStep := beta_confluent

  -- Apply confluence to h₁ and h₂
  -- Definition of IsConfluent: ∃ t₃, (nf₁ →→β t₃) ∧ (nf₂ →→β t₃)
  let ⟨t₃, ⟨h_nf₁_t₃, h_nf₂_t₃⟩⟩ := h_conf t nf₁ nf₂ h₁ h₂

  -- Since nf₁ is normal, nf₁ →→β t₃ implies nf₁ = t₃
  have eq₁ : nf₁ = t₃ := normal_form_unique_reduct h_nf₁ h_nf₁_t₃

  -- Since nf₂ is normal, nf₂ →→β t₃ implies nf₂ = t₃
  have eq₂ : nf₂ = t₃ := normal_form_unique_reduct h_nf₂ h_nf₂_t₃

  -- Combine the equalities: nf₁ = t₃ and nf₂ = t₃ implies nf₁ = nf₂
  -- Since definitional equality implies alpha equivalence (AlphaEquiv.refl)
  rw [eq₁, eq₂] -- Rewrite goal to t₃ = t₃
  exact AlphaEquiv.refl t₃ -- Prove t₃ =α t₃

/-! ### Other Potential Consequences (Optional) -/

-- Example: If t₁ =α t₂ and both have normal forms, the normal forms are alpha-equivalent.
-- theorem alpha_equiv_implies_nf_alpha_equiv {t₁ t₂ nf₁ nf₂ : Term}
--     (h_aeq : AlphaEquiv t₁ t₂)
--     (h₁ : BetaMulti t₁ nf₁) (h₂ : BetaMulti t₂ nf₂)
--     (h_nf₁ : IsNormalForm nf₁) (h_nf₂ : IsNormalForm nf₂) :
--     AlphaEquiv nf₁ nf₂ := by
--   sorry -- Proof would likely involve properties relating alpha-equivalence and reduction

end Fcomp.STLC.CR
