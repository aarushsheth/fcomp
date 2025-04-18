/-
  WeakNormalization.lean
  Proof of Weak Normalization for STLC Beta Reduction.
-/

import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta
import Fcomp.MultiStep
import Fcomp.CRDefinitions     -- For HasNormalForm, IsNormalForm
import Fcomp.Degree
import Fcomp.NormSubstitution
import Fcomp.MaximalDegree
import Fcomp.CRConsequences   -- For uniqueness (maybe)
import Fcomp.TypeChecker      -- For HasType

namespace Fcomp.STLC
open Fcomp.STLC.CR -- Open CR namespace

/-! ### Weak Normalization -/

-- Note: We use HasNormalForm from CRDefinitions directly.

/-! ### Weak Normalization Predicate (Tait's Method) -/

/-- A term `t` is normalizing if it reduces to a normal form. -/
def IsNormalizing (t : Term) : Prop :=
  ∃ nf, (BetaMulti t nf ∧ IsNormalForm nf)

/--
  The predicate `WNF τ t` signifies that term `t` is "computable" or
  "weakly normalizing" with respect to type `τ`.
  Defined by recursion on the type `τ`.
-/
def WNF : Ty → Term → Prop
  | Ty.unit, t => IsNormalizing t
  | Ty.base _, t => IsNormalizing t -- Added missing case for base types

  | Ty.arrow τ₁ τ₂, t =>
      (IsNormalizing t) ∧ (∀ v, WNF τ₁ v → WNF τ₂ (Term.app t v))

  | Ty.prod τ₁ τ₂, t =>
      (WNF τ₁ (Term.fst t)) ∧ (WNF τ₂ (Term.snd t))

  | Ty.sum τ₁ τ₂, t =>
      (IsNormalizing t) ∧
      (∀ nf v₁, (BetaMulti t nf → nf = Term.inl τ₂ v₁ → WNF τ₁ v₁)) ∧
      (∀ nf v₂, (BetaMulti t nf → nf = Term.inr τ₁ v₂ → WNF τ₂ v₂))

  | Ty.empty, t => IsNormalizing t

-- Auxiliary theorem needed for t_var case (assumed for now)
axiom wnf_var {Γ : Context} {x : String} {τ : Ty} (h_lookup : Γ.lookup x = some τ) : WNF τ (Term.var x)

-- Auxiliary theorem needed for t_unit case
theorem is_normal_form_unit : IsNormalForm Term.unitVal := by
  unfold IsNormalForm; intro t h; cases h -- unitVal has no BetaStep

-- Auxiliary theorem needed for t_abs case (IsNormalizing part)
theorem beta_multi_abs {x : String} {τ : Ty} {t t' : Term} :
  BetaMulti t t' → BetaMulti (Term.abs x τ t) (Term.abs x τ t') := by sorry

theorem is_normal_form_abs {x : String} {τ : Ty} {nf : Term} :
  IsNormalForm nf → IsNormalForm (Term.abs x τ nf) := by sorry

-- Induction proof for fundamental theorem
theorem fundamental_theorem (Γ : Context) (t : Term) (τ : Ty) :
  (h_type : HasType Γ t τ) → WNF τ t := by
  intro h_type
  induction h_type with
  -- Case T-Var
  | t_var h_lookup => apply wnf_var h_lookup

  -- Case T-Abs
  | t_abs =>
    constructor
    · -- Prove IsNormalizing (λ x:τ₁. t)
      sorry

    · -- Prove ∀ v, WNF τ₁ v → WNF τ₂ (app (λ...) v)
      sorry -- Requires WNF substitution lemma and WNF reduction lemma

  -- Case T-App
  | t_app h_fn_type h_arg_type ih_fn ih_arg => sorry

  -- Case T-Unit
  | t_unit =>
    -- Goal: WNF Ty.unit Term.unitVal => IsNormalizing Term.unitVal
    -- Need proof of ∃ nf, (BetaMulti Term.unitVal nf ∧ IsNormalForm nf)
    -- Need proof of ∃ nf, (BetaMulti Term.unitVal nf ∧ IsNormalForm nf)
    exact Exists.intro Term.unitVal ⟨BetaMulti.refl, is_normal_form_unit⟩

  -- Case T-Pair
  | t_pair h₁ h₂ ih₁ ih₂ => sorry

  -- Case T-Fst
  | t_fst h_pair_type ih_pair =>
    -- Goal: WNF τ₁ (fst t)
    sorry

  -- Case T-Snd
  | t_snd h_pair_type ih_pair =>
    -- Goal: WNF τ₂ (snd t)
    sorry

  -- Case T-Inl
  | t_inl h₁ ih₁ =>
    -- Goal: WNF (τ₁ + τ₂) (inl τ₂ t₁)
    -- Definition: IsNormalizing (inl ...) ∧ (∀ nf v₁, ...) ∧ (∀ nf v₂, ...)
    sorry

  -- Case T-Inr
  | t_inr h₂ ih₂ =>
    -- Goal: WNF (τ₁ + τ₂) (inr τ₁ t₂)
    -- Definition: IsNormalizing (inr ...) ∧ (∀ nf v₁, ...) ∧ (∀ nf v₂, ...)
    sorry

  -- Case T-Case
  | t_case h_t h_t₁ h_t₂ ih_t ih₁ ih₂ =>
    -- Goal: WNF τ₃ (case t x t₁ y t₂)
    sorry

  -- Case T-Abort
  | t_abort h_empty ih_empty =>
    sorry

-- Auxiliary theorem needed for the prod case (restored)
theorem is_normalizing_fst_snd_imp_self {t : Term} {τ₁ τ₂ : Ty} :
  IsNormalizing (Term.fst t) → IsNormalizing (Term.snd t) → IsNormalizing t := by
  sorry -- Proof depends on reduction rules for pairs/projections

-- Theorem relating WNF back to IsNormalizing
theorem wnf_implies_normalizing (τ : Ty) (t : Term) :
  WNF τ t → IsNormalizing t := by
  intro h_wnf
  cases τ with
  | unit => exact h_wnf
  | base b => exact h_wnf
  | arrow τ₁ τ₂ => exact h_wnf.1
  | prod τ₁ τ₂ =>
    -- Proof requires auxiliary theorem and proper handling of recursion/IH.
    sorry -- Reverted to sorry
  | sum τ₁ τ₂ => exact h_wnf.1
  | empty => exact h_wnf

-- The final Weak Normalization theorem
theorem weak_normalization (Γ : Context) (t : Term) (τ : Ty) :
  (HasType Γ t τ) → IsNormalizing t := by
  intro h_typing
  have h_wnf : WNF τ t := fundamental_theorem Γ t τ h_typing
  exact wnf_implies_normalizing τ t h_wnf

end Fcomp.STLC
