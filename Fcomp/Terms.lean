/-
  Terms.lean
  Definition of terms for Simply Typed Lambda Calculus (STLC).

  This module defines the syntax of lambda terms which consists of:
  1. Variables (represented as strings)
  2. Abstractions (lambda terms)
  3. Applications (function application)

-/

import Fcomp.Types

namespace Fcomp.STLC

/--
  The type of lambda terms in Simply Typed Lambda Calculus.
  @param var Variables represented as strings
  @param abs Lambda abstractions with variable name, type, and body
  @param app Function application of two terms
  @param unitVal Unit value
  @param pair Pair of terms
  @param fst First projection
  @param snd Second projection
  @param inl Left injection
  @param inr Right injection
  @param case Case expression
  @param abort Abort term
-/
inductive Term where
  | var : String → Term
  | abs : String → Ty → Term → Term  -- λx:τ.t
  | app : Term → Term → Term         -- t₁ t₂
  | unitVal : Term                   -- () : Unit
  | pair : Term → Term → Term        -- (t₁, t₂) : τ₁ × τ₂
  | fst : Term → Term                -- fst t
  | snd : Term → Term                -- snd t
  | inl : Ty → Term → Term           -- inl t : τ₁ + τ₂ (needs τ₂)
  | inr : Ty → Term → Term           -- inr t : τ₁ + τ₂ (needs τ₁)
  | case : Term → String → Term → String → Term → Term -- case t of inl x => t₁ | inr y => t₂
  | abort : Ty → Term → Term         -- abort τ t : τ (from t : Empty)
  deriving Inhabited, BEq

/-- Custom notation for lambda terms -/
notation "λ " x " : " τ " => " t => Term.abs x τ t  -- Lambda abstraction
notation t₁:90 " @ " t₂:90 => Term.app t₁ t₂        -- Application

/-- Pretty printing for terms -/
def Term.toString : Term → String
  | var x => x
  | abs x τ t => s!"(λ{x}:{τ.toString} => {t.toString})"
  | app t₁ t₂ => s!"({t₁.toString} @ {t₂.toString})"
  | unitVal => "()"
  | pair t₁ t₂ => s!"⟨{t₁.toString}, {t₂.toString}⟩"
  | fst t => s!"(fst {t.toString})"
  | snd t => s!"(snd {t.toString})"
  | inl τ t => s!"(inl {t.toString} : + {τ.toString})"
  | inr τ t => s!"(inr {t.toString} : {τ.toString} +)"
  | case t x t₁ y t₂ => s!"(case {t.toString} of inl {x} => {t₁.toString} | inr {y} => {t₂.toString})"
  | abort τ t => s!"(abort {t.toString} : {τ.toString})"

instance : ToString Term where
  toString := Term.toString

/-- Examples of term construction -/
def id_bool : Term := Term.abs "x" boolTy (Term.var "x")
def const_term (τ₁ τ₂ : Ty) : Term := Term.abs "x" τ₁ (Term.abs "y" τ₂ (Term.var "x"))
def sample_pair : Term := Term.pair (Term.var "true") (Term.var "0") -- Assuming vars exist

/-- Free variables in a term -/
def Term.fv : Term → List String
  | var x => [x]
  | abs x _ t => t.fv.filter (· ≠ x)
  | app t₁ t₂ => t₁.fv ++ t₂.fv
  | unitVal => []
  | pair t₁ t₂ => t₁.fv ++ t₂.fv
  | fst t => t.fv
  | snd t => t.fv
  | inl _ t => t.fv
  | inr _ t => t.fv
  | case t x t₁ y t₂ => t.fv ++ (t₁.fv.filter (· ≠ x)) ++ (t₂.fv.filter (· ≠ y))
  | abort _ t => t.fv

/-- Size of a term, used for termination proofs -/
def Term.size : Term → Nat
  | var _ => 1
  | abs _ _ t => Nat.add t.size 1
  | app t₁ t₂ => Nat.add (Nat.add t₁.size t₂.size) 1
  | unitVal => 1
  | pair t₁ t₂ => Nat.add (Nat.add t₁.size t₂.size) 1
  | fst t => Nat.add t.size 1
  | snd t => Nat.add t.size 1
  | inl _ t => Nat.add t.size 1
  | inr _ t => Nat.add t.size 1
  | case t x t₁ y t₂ => Nat.add (Nat.add (Nat.add t.size t₁.size) t₂.size) 1
  | abort _ t => Nat.add t.size 1

/-- Substitute a term for a variable, without capture avoidance -/
def Term.substSimple (t_body : Term) (x : String) (s : Term) : Term :=
  match t_body with
  | var y => if x == y then s else Term.var y
  | abs y τ t => if x == y then Term.abs y τ t else Term.abs y τ (t.substSimple x s)
  | app t₁ t₂ => Term.app (t₁.substSimple x s) (t₂.substSimple x s)
  | unitVal => unitVal
  | pair t₁ t₂ => Term.pair (t₁.substSimple x s) (t₂.substSimple x s)
  | fst t => Term.fst (t.substSimple x s)
  | snd t => Term.snd (t.substSimple x s)
  | inl τ t => Term.inl τ (t.substSimple x s)
  | inr τ t => Term.inr τ (t.substSimple x s)
  | case t y t₁ z t₂ =>
      let t' := t.substSimple x s
      let t₁' := if x == y then t₁ else t₁.substSimple x s
      let t₂' := if x == z then t₂ else t₂.substSimple x s
      Term.case t' y t₁' z t₂'
  | abort τ t => Term.abort τ (t.substSimple x s)

/-- Generate a fresh variable name by appending primes. -/
partial def freshVarAux (base : String) (avoid : List String) (n : Nat) : String :=
  let candidate := base ++ String.mk (List.replicate n '\'')
  if n > 10 then -- Arbitrary limit to prevent infinite loops
    candidate ++ "_fresh" -- Fallback if too many primes needed
  else if avoid.contains candidate then
    freshVarAux base avoid (n + 1)
  else
    candidate

def freshVar (base : String) (avoid : List String) : String :=
  freshVarAux base avoid 0

/-- Capture-avoiding substitution t[x↦s]
    WARNING: Termination not formally proven, marked partial.
-/
partial def Term.subst (t_body : Term) (x : String) (s : Term) : Term :=
  match t_body with
  | var y => if y == x then s else Term.var y
  | abs y τ t =>
      if y == x then
        Term.abs y τ t
      else
        let fv_s := s.fv
        if fv_s.contains y then
          let y' := freshVar y (t.fv ++ fv_s)
          let t' := t.substSimple y (Term.var y')
          Term.abs y' τ (t'.subst x s)
        else
          Term.abs y τ (t.subst x s)
  | app t₁ t₂ => Term.app (t₁.subst x s) (t₂.subst x s)
  | unitVal => unitVal
  | pair t₁ t₂ => Term.pair (t₁.subst x s) (t₂.subst x s)
  | fst t => Term.fst (t.subst x s)
  | snd t => Term.snd (t.subst x s)
  | inl τ t => Term.inl τ (t.subst x s)
  | inr τ t => Term.inr τ (t.subst x s)
  | case t y t₁ z t₂ =>
      let t' := t.subst x s
      let fv_s := s.fv
      let (y', t₁') :=
        if y == x then
          (y, t₁)
        else if fv_s.contains y then
          let y_fresh := freshVar y (t₁.fv ++ fv_s)
          let t₁_renamed := t₁.substSimple y (Term.var y_fresh)
          (y_fresh, t₁_renamed.subst x s)
        else
          (y, t₁.subst x s)
      let (z', t₂') :=
        if z == x then
          (z, t₂)
        else if fv_s.contains z then
          let z_fresh := freshVar z (t₂.fv ++ fv_s)
          let t₂_renamed := t₂.substSimple z (Term.var z_fresh)
          (z_fresh, t₂_renamed.subst x s)
        else
          (z, t₂.subst x s)
      Term.case t' y' t₁' z' t₂'
  | abort τ t => Term.abort τ (t.subst x s)

/-- Alpha equivalence of lambda terms -/
inductive AlphaEquiv : Term → Term → Prop where
  | refl (t : Term) : AlphaEquiv t t
  | symm {t₁ t₂ : Term} : AlphaEquiv t₁ t₂ → AlphaEquiv t₂ t₁
  | trans {t₁ t₂ t₃ : Term} : AlphaEquiv t₁ t₂ → AlphaEquiv t₂ t₃ → AlphaEquiv t₁ t₃
  | var (x : String) : AlphaEquiv (Term.var x) (Term.var x)
  | abs_same {x : String} {τ : Ty} {t₁ t₂ : Term} :
      AlphaEquiv t₁ t₂ → AlphaEquiv (Term.abs x τ t₁) (Term.abs x τ t₂)
  | abs_rename {x y : String} {τ : Ty} {t₁ t₂ : Term} :
      y ∉ t₁.fv →  -- y is fresh for t₁
      AlphaEquiv t₂ (t₁.substSimple x (Term.var y)) →
      AlphaEquiv (Term.abs x τ t₁) (Term.abs y τ t₂)
  | app {t₁ t₂ s₁ s₂ : Term} :
      AlphaEquiv t₁ t₂ → AlphaEquiv s₁ s₂ →
      AlphaEquiv (Term.app t₁ s₁) (Term.app t₂ s₂)
  | unit : AlphaEquiv Term.unitVal Term.unitVal
  | pair {t₁ t₂ s₁ s₂ : Term} :
      AlphaEquiv t₁ s₁ → AlphaEquiv t₂ s₂ → AlphaEquiv (Term.pair t₁ t₂) (Term.pair s₁ s₂)
  | fst {t s : Term} : AlphaEquiv t s → AlphaEquiv (Term.fst t) (Term.fst s)
  | snd {t s : Term} : AlphaEquiv t s → AlphaEquiv (Term.snd t) (Term.snd s)
  | inl {t s : Term} {τ : Ty} : AlphaEquiv t s → AlphaEquiv (Term.inl τ t) (Term.inl τ s)
  | inr {t s : Term} {τ : Ty} : AlphaEquiv t s → AlphaEquiv (Term.inr τ t) (Term.inr τ s)
  | case_same {t s t₁ s₁ t₂ s₂ : Term} {x y : String} :
      AlphaEquiv t s → AlphaEquiv t₁ s₁ → AlphaEquiv t₂ s₂ →
      AlphaEquiv (Term.case t x t₁ y t₂) (Term.case s x s₁ y s₂)
  | case_rename_left {t s t₁ s₁ t₂ s₂ : Term} {x x' y : String} :
      x' ∉ t₁.fv → -- Freshness for the new left binder x'
      AlphaEquiv t s →
      AlphaEquiv s₁ (t₁.substSimple x (Term.var x')) → -- Body 1 equiv after rename
      AlphaEquiv t₂ s₂ → -- Body 2 equiv (no change here)
      AlphaEquiv (Term.case t x t₁ y t₂) (Term.case s x' s₁ y s₂)
  | case_rename_right {t s t₁ s₁ t₂ s₂ : Term} {x y y' : String} :
      y' ∉ t₂.fv → -- Freshness for the new right binder y'
      AlphaEquiv t s →
      AlphaEquiv t₁ s₁ → -- Body 1 equiv (no change here)
      AlphaEquiv s₂ (t₂.substSimple y (Term.var y')) → -- Body 2 equiv after rename
      AlphaEquiv (Term.case t x t₁ y t₂) (Term.case s x s₁ y' s₂)
  | abort {t s : Term} {τ : Ty} : AlphaEquiv t s → AlphaEquiv (Term.abort τ t) (Term.abort τ s)

/-- Notation for alpha equivalence -/
notation:50 t₁ " =α " t₂ => AlphaEquiv t₁ t₂

/-- Basic equality lemmas -/
@[simp]
theorem abs_eq_abs {x₁ x₂ : String} {τ₁ τ₂ : Ty} {t₁ t₂ : Term} :
  (Term.abs x₁ τ₁ t₁ = Term.abs x₂ τ₂ t₂) ↔ (x₁ = x₂ ∧ τ₁ = τ₂ ∧ t₁ = t₂) := by
  constructor
  · intro h; cases h; exact ⟨rfl, rfl, rfl⟩
  · intro ⟨h₁, h₂, h₃⟩; rw [h₁, h₂, h₃]

@[simp]
theorem app_eq_app {t₁ t₂ s₁ s₂ : Term} :
  (Term.app t₁ t₂ = Term.app s₁ s₂) ↔ (t₁ = s₁ ∧ t₂ = s₂) := by
  constructor
  · intro h; cases h; exact ⟨rfl, rfl⟩
  · intro ⟨h₁, h₂⟩; rw [h₁, h₂]

@[simp]
theorem var_eq_var {x y : String} :
  (Term.var x = Term.var y) ↔ x = y := by
  constructor
  · intro h; cases h; rfl
  · intro h; rw [h]

/-- Discriminant theorems -/
theorem var_ne_abs {x : String} {y : String} {τ : Ty} {t : Term} :
  Term.var x ≠ Term.abs y τ t := by
  intro h; contradiction

theorem var_ne_app {x : String} {t₁ t₂ : Term} :
  Term.var x ≠ Term.app t₁ t₂ := by
  intro h; contradiction

theorem abs_ne_app {x : String} {τ : Ty} {t t₁ t₂ : Term} :
  Term.abs x τ t ≠ Term.app t₁ t₂ := by
  intro h; contradiction

end Fcomp.STLC
