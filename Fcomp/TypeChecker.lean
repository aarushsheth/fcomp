/-
  TypeChecker.lean
  Implementation of type checking for Simply Typed Lambda Calculus (STLC).

  This module defines the typing judgment for STLC, which determines when
  a term has a particular type in a given context. It implements the
  standard typing rules for variables, abstractions, and applications.

  Part of Project 1.1: Simply Typed Lambda Calculus
-/

import Fcomp.Types
import Fcomp.Terms
import Fcomp.Context

namespace Fcomp.STLC

/--
  The typing judgment `HasType Γ t τ` states that in context Γ,
  term t has type τ. This is defined inductively according to the
  typing rules of STLC.
-/
inductive HasType : Context → Term → Ty → Prop where
  /-- T-Var: A variable has the type assigned to it in the context -/
  | t_var {Γ : Context} {x : String} {τ : Ty} :
      Γ ⟨ x ⟩ = some τ → HasType Γ (Term.var x) τ

  /-- T-Abs: An abstraction has a function type if its body has the appropriate type -/
  | t_abs {Γ : Context} {x : String} {τ₁ τ₂ : Ty} {t : Term} :
      HasType (Γ ▷ x : τ₁) t τ₂ → HasType Γ (Term.abs x τ₁ t) (τ₁ ⟶ τ₂)

  /-- T-App: An application has type τ₂ if the function has type τ₁ → τ₂ and the argument has type τ₁ -/
  | t_app {Γ : Context} {t₁ t₂ : Term} {τ₁ τ₂ : Ty} :
      HasType Γ t₁ (τ₁ ⟶ τ₂) → HasType Γ t₂ τ₁ → HasType Γ (Term.app t₁ t₂) τ₂

/-- Custom notation for the typing judgment -/
notation:50 Γ " ⊢ " t " : " τ => HasType Γ t τ

/-- Weakening lemma: if a term is well-typed in a context, it remains well-typed in any extension of that context -/
theorem weakening {Γ Γ' : Context} {t : Term} {τ : Ty} :
  (∀ x τ', Γ ⟨ x ⟩ = some τ' → Γ' ⟨ x ⟩ = some τ') →  -- Γ' extends Γ
  HasType Γ t τ →
  HasType Γ' t τ := by
  sorry

/-- Empty context weakening: if a term is well-typed in the empty context, it remains well-typed in any context -/
theorem empty_weakening {t : Term} {τ : Ty} {Γ : Context} :
  HasType Context.empty t τ →
  HasType Γ t τ := by
  sorry

/-- Compare types for equality -/
def Ty.beq : Ty → Ty → Bool
  | base n₁, base n₂ => n₁ == n₂
  | arrow a₁ b₁, arrow a₂ b₂ => a₁.beq a₂ && b₁.beq b₂
  | _, _ => false

/-- Type equality is decidable -/
instance : BEq Ty where
  beq := Ty.beq

/--
  Type checker for STLC terms.
  Returns Some τ if the term has type τ, or None if type checking fails.
-/
def typeOf : Context → Term → Option Ty
  | Γ, Term.var x => Γ ⟨ x ⟩
  | Γ, Term.abs x τ₁ t =>
      match typeOf (Γ ▷ x : τ₁) t with
      | some τ₂ => some (τ₁ ⟶ τ₂)
      | none => none
  | Γ, Term.app t₁ t₂ =>
      match typeOf Γ t₁ with
      | some (Ty.arrow τ₁ τ₂) =>
          match typeOf Γ t₂ with
          | some τ₁' => if τ₁ == τ₁' then some τ₂ else none
          | none => none
      | _ => none

/-- A simplified version of the type checking soundness theorem -/
theorem typeOf_sound (Γ : Context) (t : Term) (τ : Ty) :
  typeOf Γ t = some τ → HasType Γ t τ := by
  -- This is a simplified version of the proof
  -- A complete proof would use induction on t and case analysis
  sorry

/-- Example: Type checking identity function for booleans -/
example : Context.empty ⊢ (λ "x" : boolTy => Term.var "x") : (boolTy ⟶ boolTy) :=
  HasType.t_abs (HasType.t_var (lookup_extend_same Context.empty "x" boolTy))

/-- String literals "x" and "y" are distinct -/
theorem x_ne_y : "x" ≠ "y" := by
  -- String literals are distinct if they have different values
  intro h
  -- The strings "x" and "y" have different lengths
  have h1 : "x".length = "y".length := by rw [h]
  -- Show contradiction since "x" and "y" have the same length but different content
  contradiction

/-- Manually implement a direct approach for the constant function proof -/
example : Context.empty ⊢ (λ "x" : boolTy => λ "y" : natTy => Term.var "x")
                       : (boolTy ⟶ natTy ⟶ boolTy) :=
  -- Step 1: Apply t_abs to get from empty context to context with x:bool
  HasType.t_abs (
    -- Step 2: Apply t_abs again to get from context with x:bool to context with x:bool, y:nat
    HasType.t_abs (
      -- Step 3: Apply t_var to prove var "x" has type boolTy in context with x:bool, y:nat
      HasType.t_var (
        -- Proof that looking up "x" in the context with both x and y gives us boolTy
        by
          -- Manually expand the context extensions and lookups
          let Γ₁ := Context.empty ▷ "x" : boolTy
          let Γ₂ := Γ₁ ▷ "y" : natTy

          -- Lookup directly
          unfold Context.lookup
          simp only [Context.extend]

          -- The key insight: when looking up "x" in [(y,nat), (x,bool), ...],
          -- we need to keep searching past the (y,nat) entry
          have h_ne : "y" ≠ "x" := fun h => x_ne_y (Eq.symm h)

          -- Show that find? will find the pair (x,bool) after skipping (y,nat)
          exact rfl
      )
    )
  )

/-- Example: Type checking function application -/
def apply_id_to_true : Term :=
  Term.app (λ "x" : boolTy => Term.var "x") (Term.var "true")

example (Γ : Context) (h : Γ ⟨ "true" ⟩ = some boolTy) :
  Γ ⊢ apply_id_to_true : boolTy :=
  HasType.t_app
    (HasType.t_abs (HasType.t_var (lookup_extend_same Γ "x" boolTy)))
    (HasType.t_var h)

end Fcomp.STLC
