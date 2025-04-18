import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta

namespace Fcomp.STLC

/-!
  # Eta Reduction

  This file defines eta reduction for the Simply Typed Lambda Calculus.
  Eta reduction captures the extensionality principle: two functions are
  equal if they give the same output for all inputs.

  The main reduction rule is:
  λx:τ.(f x) →η f    when x is not free in f

  We define both single-step (→η) and multi-step (→→η) reduction relations.
-/

/--
  Single-step eta reduction relation.
  t₁ →η t₂ means t₁ reduces to t₂ in one step of eta reduction.
-/
inductive EtaStep : Term → Term → Prop where
  /-- The main eta reduction rule: λx:τ.(f x) →η f when x ∉ fv(f) -/
  | eta {x : String} {τ : Ty} {f : Term} :
      x ∉ f.fv →  -- x not free in f
      EtaStep (Term.abs x τ (Term.app f (Term.var x))) f

  /-- Congruence rule for application (left): if t₁ →η t₁', then t₁ t₂ →η t₁' t₂ -/
  | app_left {t₁ t₁' t₂ : Term} :
      EtaStep t₁ t₁' → EtaStep (Term.app t₁ t₂) (Term.app t₁' t₂)

  /-- Congruence rule for application (right): if t₂ →η t₂', then t₁ t₂ →η t₁ t₂' -/
  | app_right {t₁ t₂ t₂' : Term} :
      EtaStep t₂ t₂' → EtaStep (Term.app t₁ t₂) (Term.app t₁ t₂')

  /-- Congruence rule for abstraction: if t →η t', then λx:τ.t →η λx:τ.t' -/
  | abs {x : String} {τ : Ty} {t t' : Term} :
      EtaStep t t' → EtaStep (Term.abs x τ t) (Term.abs x τ t')

  /-- Eta rule for pairs: λx:τ.⟨fst x, snd x⟩ →η x -/
  | eta_pair {x : String} {τ : Ty} :
      EtaStep (Term.abs x τ (Term.pair (Term.fst (Term.var x)) (Term.snd (Term.var x)))) (Term.var x)

  /-- Congruence rule for pairs (left): if t₁ →η t₁', then ⟨t₁,t₂⟩ →η ⟨t₁',t₂⟩ -/
  | pair_left {t₁ t₁' t₂ : Term} :
      EtaStep t₁ t₁' → EtaStep (Term.pair t₁ t₂) (Term.pair t₁' t₂)

  /-- Congruence rule for pairs (right): if t₂ →η t₂', then ⟨t₁,t₂⟩ →η ⟨t₁,t₂'⟩ -/
  | pair_right {t₁ t₂ t₂' : Term} :
      EtaStep t₂ t₂' → EtaStep (Term.pair t₁ t₂) (Term.pair t₁ t₂')

  /-- Congruence rule for first projection: if t →η t', then fst t →η fst t' -/
  | fst {t t' : Term} :
      EtaStep t t' → EtaStep (Term.fst t) (Term.fst t')

  /-- Congruence rule for second projection: if t →η t', then snd t →η snd t' -/
  | snd {t t' : Term} :
      EtaStep t t' → EtaStep (Term.snd t) (Term.snd t')

  /-- Eta rule for sums: case t of inl x => inl x | inr y => inr y →η t -/
  | eta_sum {t : Term} {x y : String} {τ₁ τ₂ : Ty} :
      EtaStep (Term.case t x (Term.inl τ₂ (Term.var x)) y (Term.inr τ₁ (Term.var y))) t

  /-- Congruence rule for left injection: if t →η t', then inl τ t →η inl τ t' -/
  | inl {τ : Ty} {t t' : Term} :
      EtaStep t t' → EtaStep (Term.inl τ t) (Term.inl τ t')

  /-- Congruence rule for right injection: if t →η t', then inr τ t →η inr τ t' -/
  | inr {τ : Ty} {t t' : Term} :
      EtaStep t t' → EtaStep (Term.inr τ t) (Term.inr τ t')

  /-- Congruence rule for case scrutinee: if t →η t', then case t x t₁ y t₂ →η case t' x t₁ y t₂ -/
  | case_scrut {t t' t₁ t₂ : Term} {x y : String} :
      EtaStep t t' → EtaStep (Term.case t x t₁ y t₂) (Term.case t' x t₁ y t₂)

  /-- Congruence rule for case left branch: if t₁ →η t₁', then case t x t₁ y t₂ →η case t x t₁' y t₂ -/
  | case_left {t t₁ t₁' t₂ : Term} {x y : String} :
      EtaStep t₁ t₁' → EtaStep (Term.case t x t₁ y t₂) (Term.case t x t₁' y t₂)

  /-- Congruence rule for case right branch: if t₂ →η t₂', then case t x t₁ y t₂ →η case t x t₁ y t₂' -/
  | case_right {t t₁ t₂ t₂' : Term} {x y : String} :
      EtaStep t₂ t₂' → EtaStep (Term.case t x t₁ y t₂) (Term.case t x t₁ y t₂')

  /-- Congruence rule for abort: if t →η t', then abort τ t →η abort τ t' -/
  | abort {τ : Ty} {t t' : Term} :
      EtaStep t t' → EtaStep (Term.abort τ t) (Term.abort τ t')

/-- Notation for single-step eta reduction -/
notation:50 t₁ " →η " t₂ => EtaStep t₁ t₂

/--
  Multi-step eta reduction relation.
  t₁ →→η t₂ means t₁ reduces to t₂ in zero or more steps of eta reduction.
-/
inductive EtaMulti : Term → Term → Prop where
  /-- Reflexivity: t →→η t -/
  | refl {t : Term} : EtaMulti t t

  /-- Single step: if t₁ →η t₂, then t₁ →→η t₂ -/
  | step {t₁ t₂ : Term} : EtaStep t₁ t₂ → EtaMulti t₁ t₂

  /-- Transitivity: if t₁ →→η t₂ and t₂ →→η t₃, then t₁ →→η t₃ -/
  | trans {t₁ t₂ t₃ : Term} : EtaMulti t₁ t₂ → EtaMulti t₂ t₃ → EtaMulti t₁ t₃

/-- Notation for multi-step eta reduction -/
notation:50 t₁ " →→η " t₂ => EtaMulti t₁ t₂

end Fcomp.STLC
