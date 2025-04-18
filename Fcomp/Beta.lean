import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context

namespace Fcomp.STLC

/-!
  # Beta Reduction

  This file defines beta reduction for the Simply Typed Lambda Calculus.
  Beta reduction is the main computation rule that describes how to evaluate
  function application by substituting the argument into the function body.

  The main reduction rule is:
  (λx:τ.t₁) t₂ →β t₁[x↦t₂]

  We define both single-step (→β) and multi-step (→→β) reduction relations.
-/

/--
  Single-step beta reduction relation.
  t₁ →β t₂ means t₁ reduces to t₂ in one step of beta reduction.
-/
inductive BetaStep : Term → Term → Prop where
  /-- The main beta reduction rule: (λx:τ.t₁) t₂ →β t₁[x↦t₂] -/
  | beta {x : String} {τ : Ty} {t₁ t₂ : Term} :
      BetaStep (Term.app (Term.abs x τ t₁) t₂) (Term.subst t₁ x t₂)

  /-- Congruence rule for application (left): if t₁ →β t₁', then t₁ t₂ →β t₁' t₂ -/
  | app_left {t₁ t₁' t₂ : Term} :
      BetaStep t₁ t₁' → BetaStep (Term.app t₁ t₂) (Term.app t₁' t₂)

  /-- Congruence rule for application (right): if t₂ →β t₂', then t₁ t₂ →β t₁ t₂' -/
  | app_right {t₁ t₂ t₂' : Term} :
      BetaStep t₂ t₂' → BetaStep (Term.app t₁ t₂) (Term.app t₁ t₂')

  /-- Congruence rule for abstraction: if t →β t', then λx:τ.t →β λx:τ.t' -/
  | abs {x : String} {τ : Ty} {t t' : Term} :
      BetaStep t t' → BetaStep (Term.abs x τ t) (Term.abs x τ t')

  /-- Congruence rule for pairs (left): if t₁ →β t₁', then ⟨t₁,t₂⟩ →β ⟨t₁',t₂⟩ -/
  | pair_left {t₁ t₁' t₂ : Term} :
      BetaStep t₁ t₁' → BetaStep (Term.pair t₁ t₂) (Term.pair t₁' t₂)

  /-- Congruence rule for pairs (right): if t₂ →β t₂', then ⟨t₁,t₂⟩ →β ⟨t₁,t₂'⟩ -/
  | pair_right {t₁ t₂ t₂' : Term} :
      BetaStep t₂ t₂' → BetaStep (Term.pair t₁ t₂) (Term.pair t₁ t₂')

  /-- Reduction rule for first projection: fst ⟨t₁,t₂⟩ →β t₁ -/
  | fst_beta {t₁ t₂ : Term} :
      BetaStep (Term.fst (Term.pair t₁ t₂)) t₁

  /-- Reduction rule for second projection: snd ⟨t₁,t₂⟩ →β t₂ -/
  | snd_beta {t₁ t₂ : Term} :
      BetaStep (Term.snd (Term.pair t₁ t₂)) t₂

  /-- Congruence rule for first projection: if t →β t', then fst t →β fst t' -/
  | fst {t t' : Term} :
      BetaStep t t' → BetaStep (Term.fst t) (Term.fst t')

  /-- Congruence rule for second projection: if t →β t', then snd t →β snd t' -/
  | snd {t t' : Term} :
      BetaStep t t' → BetaStep (Term.snd t) (Term.snd t')

  /-- Congruence rule for left injection: if t →β t', then inl τ t →β inl τ t' -/
  | inl {τ : Ty} {t t' : Term} :
      BetaStep t t' → BetaStep (Term.inl τ t) (Term.inl τ t')

  /-- Congruence rule for right injection: if t →β t', then inr τ t →β inr τ t' -/
  | inr {τ : Ty} {t t' : Term} :
      BetaStep t t' → BetaStep (Term.inr τ t) (Term.inr τ t')

  /-- Reduction rule for case with left injection: case (inl τ t) x t₁ y t₂ →β t₁[x↦t] -/
  | case_inl {τ : Ty} {t t₁ t₂ : Term} {x y : String} :
      BetaStep (Term.case (Term.inl τ t) x t₁ y t₂) (Term.subst t₁ x t)

  /-- Reduction rule for case with right injection: case (inr τ t) x t₁ y t₂ →β t₂[y↦t] -/
  | case_inr {τ : Ty} {t t₁ t₂ : Term} {x y : String} :
      BetaStep (Term.case (Term.inr τ t) x t₁ y t₂) (Term.subst t₂ y t)

  /-- Congruence rule for case scrutinee: if t →β t', then case t x t₁ y t₂ →β case t' x t₁ y t₂ -/
  | case_scrut {t t' t₁ t₂ : Term} {x y : String} :
      BetaStep t t' → BetaStep (Term.case t x t₁ y t₂) (Term.case t' x t₁ y t₂)

  /-- Congruence rule for case left branch: if t₁ →β t₁', then case t x t₁ y t₂ →β case t x t₁' y t₂ -/
  | case_left {t t₁ t₁' t₂ : Term} {x y : String} :
      BetaStep t₁ t₁' → BetaStep (Term.case t x t₁ y t₂) (Term.case t x t₁' y t₂)

  /-- Congruence rule for case right branch: if t₂ →β t₂', then case t x t₁ y t₂ →β case t x t₁ y t₂' -/
  | case_right {t t₁ t₂ t₂' : Term} {x y : String} :
      BetaStep t₂ t₂' → BetaStep (Term.case t x t₁ y t₂) (Term.case t x t₁ y t₂')

  /-- Congruence rule for abort: if t →β t', then abort τ t →β abort τ t' -/
  | abort {τ : Ty} {t t' : Term} :
      BetaStep t t' → BetaStep (Term.abort τ t) (Term.abort τ t')

/-- Notation for single-step beta reduction -/
notation:50 t₁ " →β " t₂ => BetaStep t₁ t₂

/--
  Multi-step beta reduction relation.
  t₁ →→β t₂ means t₁ reduces to t₂ in zero or more steps of beta reduction.
-/
inductive BetaMulti : Term → Term → Prop where
  /-- Reflexivity: t →→β t -/
  | refl {t : Term} : BetaMulti t t

  /-- Single step: if t₁ →β t₂, then t₁ →→β t₂ -/
  | step {t₁ t₂ : Term} : BetaStep t₁ t₂ → BetaMulti t₁ t₂

  /-- Transitivity: if t₁ →→β t₂ and t₂ →→β t₃, then t₁ →→β t₃ -/
  | trans {t₁ t₂ t₃ : Term} : BetaMulti t₁ t₂ → BetaMulti t₂ t₃ → BetaMulti t₁ t₃

/-- Notation for multi-step beta reduction -/
notation:50 t₁ " →→β " t₂ => BetaMulti t₁ t₂

end Fcomp.STLC
