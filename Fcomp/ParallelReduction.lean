/-
  ParallelReduction.lean
  Implementation of parallel reduction for Simply Typed Lambda Calculus.

  This module defines parallel reduction, which reduces multiple redexes simultaneously.
  Parallel reduction is used to prove the Church-Rosser theorem because it satisfies
  the diamond property more directly than single-step beta reduction.
-/

import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta
import Fcomp.CRDefinitions

namespace Fcomp.STLC.CR

open Fcomp.STLC

/-! ### Parallel Reduction -/

/--
  Parallel reduction (⇒) allows reducing multiple β-redexes simultaneously.
  It is defined inductively with the following rules:

  1. Variables reduce to themselves
  2. If t₁ ⇒ t₁' and t₂ ⇒ t₂', then (t₁ @ t₂) ⇒ (t₁' @ t₂')
  3. If t ⇒ t', then (λx.t) ⇒ (λx.t')
  4. If t₁ ⇒ t₁' and t₂ ⇒ t₂', then ((λx.t₁) @ t₂) ⇒ t₁'[x↦t₂']
  5. Similar rules for pairs, sums, and unit
-/
inductive ParRed : Term → Term → Prop where
  | var {x : String} :
    ParRed (Term.var x) (Term.var x)

  | app {t₁ t₂ t₁' t₂' : Term} :
    ParRed t₁ t₁' →
    ParRed t₂ t₂' →
    ParRed (Term.app t₁ t₂) (Term.app t₁' t₂')

  | abs {x : String} {τ : Ty} {t t' : Term} :
    ParRed t t' →
    ParRed (Term.abs x τ t) (Term.abs x τ t')

  | beta {x : String} {τ : Ty} {t₁ t₂ t₁' t₂' : Term} :
    ParRed t₁ t₁' →
    ParRed t₂ t₂' →
    ParRed (Term.app (Term.abs x τ t₁) t₂) (Term.subst t₁' x t₂')

  | unit :
    ParRed Term.unitVal Term.unitVal

  | pair {t₁ t₂ t₁' t₂' : Term} :
    ParRed t₁ t₁' →
    ParRed t₂ t₂' →
    ParRed (Term.pair t₁ t₂) (Term.pair t₁' t₂')

  | fst {t t' : Term} :
    ParRed t t' →
    ParRed (Term.fst t) (Term.fst t')

  | snd {t t' : Term} :
    ParRed t t' →
    ParRed (Term.snd t) (Term.snd t')

  | fst_beta {t₁ t₂ t₁' t₂' : Term} :
    ParRed t₁ t₁' →
    ParRed t₂ t₂' →
    ParRed (Term.fst (Term.pair t₁ t₂)) t₁'

  | snd_beta {t₁ t₂ t₁' t₂' : Term} :
    ParRed t₁ t₁' →
    ParRed t₂ t₂' →
    ParRed (Term.snd (Term.pair t₁ t₂)) t₂'

  | inl {τ : Ty} {t t' : Term} :
    ParRed t t' →
    ParRed (Term.inl τ t) (Term.inl τ t')

  | inr {τ : Ty} {t t' : Term} :
    ParRed t t' →
    ParRed (Term.inr τ t) (Term.inr τ t')

  | case {t t' t₁ t₁' t₂ t₂' : Term} {x y : String} :
    ParRed t t' →
    ParRed t₁ t₁' →
    ParRed t₂ t₂' →
    ParRed (Term.case t x t₁ y t₂) (Term.case t' x t₁' y t₂')

  | case_inl {τ : Ty} {t t' t₁ t₁' t₂ : Term} {x y : String} :
    ParRed t t' →
    ParRed t₁ t₁' →
    ParRed (Term.case (Term.inl τ t) x t₁ y t₂) (Term.subst t₁' x t')

  | case_inr {τ : Ty} {t t' t₁ t₂ t₂' : Term} {x y : String} :
    ParRed t t' →
    ParRed t₂ t₂' →
    ParRed (Term.case (Term.inr τ t) x t₁ y t₂) (Term.subst t₂' y t')

  | abort {τ : Ty} {t t' : Term} :
    ParRed t t' →
    ParRed (Term.abort τ t) (Term.abort τ t')

notation:50 t₁ " ⇒ " t₂ => ParRed t₁ t₂

/--
  Parallel reduction is reflexive: t ⇒ t
-/
theorem par_refl (t : Term) : ParRed t t := by
  induction t with
  | var x => exact ParRed.var
  | app t₁ t₂ ih₁ ih₂ => exact ParRed.app ih₁ ih₂
  | abs x τ t ih => exact ParRed.abs ih
  | unitVal => exact ParRed.unit
  | pair t₁ t₂ ih₁ ih₂ => exact ParRed.pair ih₁ ih₂
  | fst t ih => exact ParRed.fst ih
  | snd t ih => exact ParRed.snd ih
  | inl τ t ih => exact ParRed.inl ih
  | inr τ t ih => exact ParRed.inr ih
  | case t x t₁ y t₂ ih ih₁ ih₂ => exact ParRed.case ih ih₁ ih₂
  | abort τ t ih => exact ParRed.abort ih

/--
  Parallel reduction includes beta reduction: if t →β t', then t ⇒ t'
-/
theorem beta_implies_par {t t' : Term} : BetaStep t t' → ParRed t t'
  | BetaStep.beta => ParRed.beta (par_refl _) (par_refl _)
  | BetaStep.app_left h => ParRed.app (beta_implies_par h) (par_refl _)
  | BetaStep.app_right h => ParRed.app (par_refl _) (beta_implies_par h)
  | BetaStep.abs h => ParRed.abs (beta_implies_par h)
  | BetaStep.pair_left h => ParRed.pair (beta_implies_par h) (par_refl _)
  | BetaStep.pair_right h => ParRed.pair (par_refl _) (beta_implies_par h)
  | BetaStep.fst_beta => ParRed.fst_beta (par_refl _) (par_refl _)
  | BetaStep.snd_beta => ParRed.snd_beta (par_refl _) (par_refl _)
  | BetaStep.fst h => ParRed.fst (beta_implies_par h)
  | BetaStep.snd h => ParRed.snd (beta_implies_par h)
  | BetaStep.inl h => ParRed.inl (beta_implies_par h)
  | BetaStep.inr h => ParRed.inr (beta_implies_par h)
  | BetaStep.case_inl => ParRed.case_inl (par_refl _) (par_refl _)
  | BetaStep.case_inr => ParRed.case_inr (par_refl _) (par_refl _)
  | BetaStep.case_scrut h => ParRed.case (beta_implies_par h) (par_refl _) (par_refl _)
  | BetaStep.case_left h => ParRed.case (par_refl _) (beta_implies_par h) (par_refl _)
  | BetaStep.case_right h => ParRed.case (par_refl _) (par_refl _) (beta_implies_par h)
  | BetaStep.abort h => ParRed.abort (beta_implies_par h)

/--
  Multi-step parallel reduction
-/
inductive ParRedMulti : Term → Term → Prop where
  | refl {t : Term} : ParRedMulti t t
  | step {t₁ t₂ t₃ : Term} :
    ParRed t₁ t₂ →
    ParRedMulti t₂ t₃ →
    ParRedMulti t₁ t₃

notation:50 t₁ " ⇒* " t₂ => ParRedMulti t₁ t₂

/--
  Multi-step parallel reduction is transitive
-/
theorem par_multi_trans {t₁ t₂ t₃ : Term}
  (h₁₂ : ParRedMulti t₁ t₂) (h₂₃ : ParRedMulti t₂ t₃) :
  ParRedMulti t₁ t₃ := by
  induction h₁₂ with
  | refl => exact h₂₃
  | step h_step _ ih =>
    exact ParRedMulti.step h_step (ih h₂₃)

end Fcomp.STLC.CR
