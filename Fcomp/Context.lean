/-
  Context.lean
  Definition of typing contexts for Simply Typed Lambda Calculus (STLC).

  This module defines typing contexts which map variables to their types.
  A context is a list of variable-type pairs, with the most recently
  added bindings appearing first in the list.

-/

import Fcomp.Types
import Fcomp.Terms

namespace Fcomp.STLC

/--
  A typing context (Γ) is a list of variable-type pairs.
  The head of the list represents the most recently added binding.
-/
def Context : Type := List (String × Ty)

/-- Empty context -/
def Context.empty : Context := []

/-- Add a variable binding to the context -/
def Context.extend (Γ : Context) (x : String) (τ : Ty) : Context :=
  (x, τ) :: Γ

/-- Check if a variable is bound in the context -/
def Context.contains (Γ : Context) (x : String) : Bool :=
  Γ.any (λ p => p.1 = x)

/-- Look up the type of a variable in the context -/
def Context.lookup (Γ : Context) (x : String) : Option Ty :=
  match Γ.find? (λ p => p.1 = x) with
  | some (_, τ) => some τ
  | none => none

/-- Domain of the context (all variables) -/
def Context.dom (Γ : Context) : List String :=
  Γ.map (λ p => p.1)

/-- Custom notation for context extension -/
notation:60 Γ " ▷ " x " : " τ => Context.extend Γ x τ

/-- Custom notation for context lookup -/
notation:80 Γ " ⟨ " x " ⟩" => Context.lookup Γ x

/-- Properties of context operations -/

theorem lookup_extend_same (Γ : Context) (x : String) (τ : Ty) :
  (Γ ▷ x : τ) ⟨ x ⟩ = some τ := by
  simp [Context.lookup, Context.extend]
  simp [List.find?]

theorem lookup_extend_other (Γ : Context) (x y : String) (τ : Ty) (h : x ≠ y) :
  (Γ ▷ x : τ) ⟨ y ⟩ = Γ ⟨ y ⟩ := by
  simp [Context.lookup, Context.extend]
  simp [List.find?]
  simp [h]

theorem dom_extend (Γ : Context) (x : String) (τ : Ty) :
  Context.dom (Γ ▷ x : τ) = x :: Context.dom Γ := by
  simp [Context.dom, Context.extend]

-- Simplified version of the theorem relating contains and lookup
theorem contains_iff_lookup (Γ : Context) (x : String) :
  Context.contains Γ x = true ↔ (∃ τ, Γ ⟨ x ⟩ = some τ) := by
  -- Note: This is a simplified version that skips the detailed proof
  -- A complete proof would use induction on Γ and case analysis
  sorry
  -- TODO: Complete the proof --

/-- Example contexts -/
def emptyCtx : Context := Context.empty
def singleVarCtx : Context := (Context.empty ▷ "x" : boolTy)
def twoVarCtx : Context := ((Context.empty ▷ "x" : boolTy) ▷ "y" : natTy)

/-- Shadow earlier bindings with the same name -/
theorem lookup_shadow (Γ : Context) (x : String) (τ₁ τ₂ : Ty) :
  ((Γ ▷ x : τ₁) ▷ x : τ₂) ⟨ x ⟩ = some τ₂ := by
  simp [Context.lookup, Context.extend]
  simp [List.find?]

end Fcomp.STLC
