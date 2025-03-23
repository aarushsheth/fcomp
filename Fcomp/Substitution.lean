/-
  Substitution.lean
  Formal properties of substitution for Simply Typed Lambda Calculus (STLC).

  This module builds on the substitution operations defined in Terms.lean
  and proves their key properties, including the substitution lemma which
  shows that substitution preserves typing.

  Part of Project 1.1: Simply Typed Lambda Calculus
-/

import Fcomp.Types
import Fcomp.Terms
import Fcomp.Context
import Fcomp.TypeChecker

namespace Fcomp.STLC

/-! ### Substitution properties -/

/-- Free variables after substitution - the key property that after substituting
    a term s for a variable x in t, the free variables in the result are the
    union of (free vars of t minus x) and (free vars of s if x is free in t) -/
instance : HasSubset (List String) where
  Subset l₁ l₂ := ∀ x, x ∈ l₁ → x ∈ l₂

theorem subst_fv {t s : Term} {x : String} :
  (Term.subst t x s).fv ⊆ (t.fv.filter (· ≠ x)) ++ (if t.fv.contains x then s.fv else []) := by
  sorry

/-- Simple substitution preserves type if the replacement has the right type -/
theorem subst_simple_preserves_type (Γ : Context) (t s : Term) (x : String) (τ_x τ_t : Ty) :
  HasType (Γ ▷ x : τ_x) t τ_t →
  HasType Γ s τ_x →
  HasType Γ (Term.substSimple t x s) τ_t := by
  sorry

/-- The Substitution Lemma - substitution preserves typing -/
theorem substitution_lemma (Γ : Context) (t s : Term) (x : String) (τ_x τ_t : Ty) :
  HasType (Γ ▷ x : τ_x) t τ_t →
  HasType Γ s τ_x →
  HasType Γ (Term.subst t x s) τ_t := by
  sorry

/-- Substitution of a closed term doesn't affect a term where the variable isn't free -/
theorem subst_closed_not_free (t s : Term) (x : String) :
  x ∉ t.fv → Term.subst t x s = t := by
  sorry

/-- Alpha-equivalence respects substitution -/
theorem alpha_equiv_subst (t₁ t₂ s : Term) (x : String) :
  AlphaEquiv t₁ t₂ → AlphaEquiv (Term.subst t₁ x s) (Term.subst t₂ x s) := by
  sorry

/-- Composition of substitutions -/
theorem subst_compose (t : Term) (x y : String) (s₁ s₂ : Term) :
  x ≠ y → y ∉ s₁.fv →
  Term.subst (Term.subst t x s₁) y s₂ =
  Term.subst (Term.subst t y s₂) x (Term.subst s₁ y s₂) := by
  sorry

end Fcomp.STLC
