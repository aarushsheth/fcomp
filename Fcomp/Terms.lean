/-
  Terms.lean
  Definition of terms for Simply Typed Lambda Calculus (STLC).

  This module defines the syntax of lambda terms which consists of:
  1. Variables (represented as strings)
  2. Abstractions (lambda terms)
  3. Applications (function application)

  Part of Project 1.1: Simply Typed Lambda Calculus
-/

import Fcomp.Types

namespace Fcomp.STLC

/--
  The type of lambda terms in Simply Typed Lambda Calculus.
  @param var Variables represented as strings
  @param abs Lambda abstractions with variable name, type, and body
  @param app Function application of two terms
-/
inductive Term where
  | var : String → Term
  | abs : String → Ty → Term → Term  -- λx:τ.t
  | app : Term → Term → Term         -- t₁ t₂
  deriving Inhabited, BEq

/-- Custom notation for lambda terms -/
notation "λ " x " : " τ " => " t => Term.abs x τ t  -- Lambda abstraction
notation t₁:90 " @ " t₂:90 => Term.app t₁ t₂        -- Application

/-- Pretty printing for terms -/
def Term.toString : Term → String
  | var x => x
  | abs x τ t => s!"(λ{x}:{τ.toString} => {t.toString})"
  | app t₁ t₂ => s!"({t₁.toString} @ {t₂.toString})"

instance : ToString Term where
  toString := Term.toString

/-- Examples of term construction -/
def id_bool : Term := Term.abs "x" boolTy (Term.var "x")
def const_term (τ₁ τ₂ : Ty) : Term := Term.abs "x" τ₁ (Term.abs "y" τ₂ (Term.var "x"))

/-- Free variables in a term -/
def Term.fv : Term → List String
  | var x => [x]
  | abs x _ t => t.fv.filter (· ≠ x)
  | app t₁ t₂ => t₁.fv ++ t₂.fv

/-- Size of a term, used for termination proofs -/
def Term.size : Term → Nat
  | var _ => 1
  | abs _ _ t => t.size + 1
  | app t₁ t₂ => t₁.size + t₂.size + 1

/-- Substitute a term for a variable, without capture avoidance -/
def Term.substSimple (t : Term) (x : String) (s : Term) : Term :=
  match t with
  | var y => if y = x then s else Term.var y
  | abs y τ t' =>
      if y = x then Term.abs y τ t'  -- x is bound, no substitution in body
      else Term.abs y τ (t'.substSimple x s)
  | app t₁ t₂ => Term.app (t₁.substSimple x s) (t₂.substSimple x s)

/-- Append n apostrophes to a string -/
def addPrimes (s : String) (n : Nat) : String :=
  s ++ String.mk (List.replicate n '\'')

/-- Choose a variable name that doesn't appear in the given list -/
def freshVar (base : String) (used : List String) : String :=
  let candidates := List.map (addPrimes base) (List.range 10)
  match candidates.find? (λ name => !used.contains name) with
  | some name => name
  | none => base ++ "_fresh"  -- Fallback

/-- Substitution with capture avoidance: t[x↦s] -/
def Term.subst (t : Term) (x : String) (s : Term) : Term :=
  match t with
  | var y => if y = x then s else Term.var y
  | abs y τ t' =>
    if y = x then
      -- Bound variable shadows the substitution variable
      Term.abs y τ t'
    else if s.fv.contains y then
      -- Need α-conversion to avoid capture
      let y' := freshVar (y ++ "'") (t'.fv ++ s.fv)
      -- First rename the bound variable, then perform substitution
      let t'' := t'.substSimple y (Term.var y')
      Term.abs y' τ (t''.substSimple x s)
    else
      -- No risk of capture
      Term.abs y τ (t'.substSimple x s)
  | app t₁ t₂ => Term.app (t₁.subst x s) (t₂.subst x s)

#check Term.subst  -- Verify definition is accepted

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
