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

-- Ensure the STLC namespace is open to access Ty and Term constructors
open Fcomp.STLC

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

  /-- T-Unit: The unit value has the unit type -/
  | t_unit {Γ : Context} :
      HasType Γ Term.unitVal Ty.unit

  /-- T-Pair: A pair has a product type if its components have the corresponding types -/
  | t_pair {Γ : Context} {t₁ t₂ : Term} {τ₁ τ₂ : Ty} :
      HasType Γ t₁ τ₁ → HasType Γ t₂ τ₂ → HasType Γ (Term.pair t₁ t₂) (Ty.prod τ₁ τ₂)

  /-- T-Fst: First projection yields the first type of the product -/
  | t_fst {Γ : Context} {t : Term} {τ₁ τ₂ : Ty} :
      HasType Γ t (Ty.prod τ₁ τ₂) → HasType Γ (Term.fst t) τ₁

  /-- T-Snd: Second projection yields the second type of the product -/
  | t_snd {Γ : Context} {t : Term} {τ₁ τ₂ : Ty} :
      HasType Γ t (Ty.prod τ₁ τ₂) → HasType Γ (Term.snd t) τ₂

  /-- T-Inl: Left injection creates a sum type from the left type -/
  | t_inl {Γ : Context} {t₁ : Term} {τ₁ τ₂ : Ty} :
      HasType Γ t₁ τ₁ → HasType Γ (Term.inl τ₂ t₁) (Ty.sum τ₁ τ₂)

  /-- T-Inr: Right injection creates a sum type from the right type -/
  | t_inr {Γ : Context} {t₂ : Term} {τ₁ τ₂ : Ty} :
      HasType Γ t₂ τ₂ → HasType Γ (Term.inr τ₁ t₂) (Ty.sum τ₁ τ₂)

  /-- T-Case: Case analysis on a sum type -/
  | t_case {Γ : Context} {t t₁ t₂ : Term} {x y : String} {τ₁ τ₂ τ₃ : Ty} :
      HasType Γ t (Ty.sum τ₁ τ₂) →
      HasType (Γ ▷ x : τ₁) t₁ τ₃ →
      HasType (Γ ▷ y : τ₂) t₂ τ₃ →
      HasType Γ (Term.case t x t₁ y t₂) τ₃

  /-- T-Abort: Aborting from Empty yields any type -/
  | t_abort {Γ : Context} {t : Term} {τ : Ty} :
      HasType Γ t Ty.empty → HasType Γ (Term.abort τ t) τ

/-- Compare types for equality -/
def Ty.beq : Ty → Ty → Bool
  | base n₁, base n₂ => n₁ == n₂
  | arrow a₁ b₁, arrow a₂ b₂ => a₁.beq a₂ && b₁.beq b₂
  | _, _ => false

/-- Type equality is decidable -/
instance : BEq Ty where
  beq := Ty.beq

/-- Lemma: Boolean equality on types implies actual equality -/
theorem ty_eq_of_beq {τ₁ τ₂ : Ty} : τ₁.beq τ₂ = true → τ₁ = τ₂ := by
  intro h
  induction τ₁ generalizing τ₂ with
  | base n₁ =>
      cases τ₂ with
      | base n₂ => simp [Ty.beq] at h; subst h; exact rfl
      | arrow _ _ => simp [Ty.beq] at h
      | unit => simp [Ty.beq] at h
      | empty => simp [Ty.beq] at h
      | prod _ _ => simp [Ty.beq] at h
      | sum _ _ => simp [Ty.beq] at h
  | arrow a₁ b₁ ih_a ih_b =>
      cases τ₂ with
      | base _ => simp [Ty.beq] at h
      | arrow a₂ b₂ =>
          simp [Ty.beq] at h
          have h_a := ih_a h.1
          have h_b := ih_b h.2
          subst h_a h_b; exact rfl
      | unit => simp [Ty.beq] at h
      | empty => simp [Ty.beq] at h
      | prod _ _ => simp [Ty.beq] at h
      | sum _ _ => simp [Ty.beq] at h
  | unit =>
      cases τ₂ with
      | base _ => simp [Ty.beq] at h
      | arrow _ _ => simp [Ty.beq] at h
      | unit => simp [Ty.beq] at h
      | empty => simp [Ty.beq] at h
      | prod _ _ => simp [Ty.beq] at h
      | sum _ _ => simp [Ty.beq] at h
  | empty =>
      cases τ₂ with
      | base _ => simp [Ty.beq] at h
      | arrow _ _ => simp [Ty.beq] at h
      | unit => simp [Ty.beq] at h
      | empty => simp [Ty.beq] at h
      | prod _ _ => simp [Ty.beq] at h
      | sum _ _ => simp [Ty.beq] at h
  | prod a₁ b₁ ih_a ih_b =>
      cases τ₂ with
      | base _ => simp [Ty.beq] at h
      | arrow _ _ => simp [Ty.beq] at h
      | unit => simp [Ty.beq] at h
      | empty => simp [Ty.beq] at h
      | prod a₂ b₂ =>
          simp [Ty.beq] at h
      | sum _ _ => simp [Ty.beq] at h
  | sum a₁ b₁ ih_a ih_b =>
      cases τ₂ with
      | base _ => simp [Ty.beq] at h
      | arrow _ _ => simp [Ty.beq] at h
      | unit => simp [Ty.beq] at h
      | empty => simp [Ty.beq] at h
      | prod _ _ => simp [Ty.beq] at h
      | sum a₂ b₂ =>
          simp [Ty.beq] at h

/-- Custom notation for the typing judgment -/
notation:50 Γ " ⊢ " t " : " τ => HasType Γ t τ

/-- Weakening lemma: if a term is well-typed in a context, it remains well-typed in any extension of that context -/
theorem weakening {Γ Γ' : Context} {t : Term} {τ : Ty} :
  (h_extends : ∀ x τ', Γ ⟨ x ⟩ = some τ' → Γ' ⟨ x ⟩ = some τ') →  -- Γ' extends Γ
  (h_type : HasType Γ t τ) →
  HasType Γ' t τ := by sorry
  /-- intro h_extends h_type
   -- Manual induction on the structure of h_type
  cases h_type with
  | @t_var _ x _ h_lookup =>  -- Use underscores for unused variables from the pattern
    exact HasType.t_var (h_extends x _ h_lookup)
  | @t_abs _ x τ₁ _ t h_body => -- Use underscores for unused variables
    apply HasType.t_abs
    -- Prove that Γ' ▷ x : τ₁ extends Γ ▷ x : τ₁
    have h_extends' : (∀ y τ'', (Γ ▷ x : τ₁) ⟨ y ⟩ = some τ'' → (Γ' ▷ x : τ₁) ⟨ y ⟩ = some τ'') := by
      intro y τ'' h_lookup'
      cases String.decEq y x with
      | isTrue h_eq =>
        rw [h_eq] at h_lookup' ⊢
        rw [lookup_extend_same] at h_lookup'
        rw [lookup_extend_same]
        assumption
      | isFalse h_ne =>
        -- 1. Prove Γ ⟨ y ⟩ = some τ'' from h_lookup'
        have h_lookup_base : Γ ⟨ y ⟩ = some τ'' := by
          rw [← lookup_extend_other Γ x y τ₁ (Ne.symm h_ne)] -- Use Ne.symm
          exact h_lookup'
        -- 2. Apply h_extends to get Γ' ⟨ y ⟩ = some τ''
        have h_lookup_ext : Γ' ⟨ y ⟩ = some τ'' := h_extends y τ'' h_lookup_base
        -- 3. Rewrite the goal (Γ' ▷ x : τ₁) ⟨ y ⟩ = some τ'' using lookup_extend_other
        rw [lookup_extend_other Γ' x y τ₁ (Ne.symm h_ne)]
        -- 4. Apply the result from step 2
        exact h_lookup_ext
    -- Apply weakening recursively to the sub-derivation h_body
    exact weakening h_extends' h_body
  | @t_app _ _ _ _ _ h₁ h₂ =>
    -- Apply weakening recursively to the sub-derivations h₁ and h₂
    exact HasType.t_app (weakening h_extends h₁) (weakening h_extends h₂)
  | @t_unit _ =>
    exact HasType.t_unit
  | @t_pair _ _ _ _ _ h₁ h₂ =>
    exact HasType.t_pair (weakening h_extends h₁) (weakening h_extends h₂)
  | @t_fst _ _ _ _ h =>
    exact HasType.t_fst (weakening h_extends h)
  | @t_snd _ _ _ _ h =>
    exact HasType.t_snd (weakening h_extends h)
  | @t_inl _ _ _ _ h =>
    exact HasType.t_inl (weakening h_extends h)
  | @t_inr _ _ _ _ h =>
    exact HasType.t_inr (weakening h_extends h)
  | @t_case Γ t t₁ t₂ x y τ₁ τ₂ τ₃ h_t h_t₁ h_t₂ =>
    -- Need to prove weakening for the extended contexts in the branches
    let prove_ext_weakening (var : String) (ty : Ty) (sub_proof : HasType (Γ ▷ var : ty) _ τ₃) : HasType (Γ' ▷ var : ty) _ τ₃ :=
      -- Build the extended h_extends'
      have h_extends' : (∀ z τ', (Γ ▷ var : ty) ⟨ z ⟩ = some τ' → (Γ' ▷ var : ty) ⟨ z ⟩ = some τ') := by
        intro z τ'' h_lookup'
        cases String.decEq z var with
        | isTrue h_eq => -- Variable is the one added to the context
          rw [h_eq] at h_lookup' ⊢
          rw [lookup_extend_same] at h_lookup'
          rw [lookup_extend_same]
          assumption
        | isFalse h_ne => -- Variable is from the original context Γ
          have h_lookup_base : Γ ⟨ z ⟩ = some τ'' := by
            rw [← lookup_extend_other Γ var z ty (Ne.symm h_ne)]
            exact h_lookup'
          have h_lookup_ext : Γ' ⟨ z ⟩ = some τ'' := h_extends z τ'' h_lookup_base
          rw [lookup_extend_other Γ' var z ty (Ne.symm h_ne)]
          exact h_lookup_ext
      -- Apply weakening with the extended h_extends'
      weakening h_extends' sub_proof
    -- Apply the specific weakening proofs to the branches
    let h_t₁' := prove_ext_weakening x τ₁ h_t₁
    let h_t₂' := prove_ext_weakening y τ₂ h_t₂
    -- Apply weakening to the term being cased on and combine
    exact HasType.t_case (weakening h_extends h_t) h_t₁' h_t₂'
  | @t_abort _ _ _ h =>
    exact HasType.t_abort (weakening h_extends h)
--/

theorem empty_weakening {t : Term} {τ : Ty} {Γ : Context} :
  HasType Context.empty t τ →
  HasType Γ t τ := by
  intro h_type -- Introduce HasType Context.empty t τ
  -- Apply the weakening lemma with Γ₁ = Context.empty and Γ₂ = Γ
  apply weakening
  -- Goal 1: Prove that Γ extends Context.empty
  · intro x τ' h_lookup_empty -- Assume Context.empty ⟨ x ⟩ = some τ'
    -- Prove separately that lookup in empty context is none
    have h_contra : Context.lookup Context.empty x = none := by
      simp [Context.lookup, Context.empty, List.find?]
    -- Rewrite the hypothesis using this fact
    rw [h_contra] at h_lookup_empty
    -- Now the hypothesis is none = some τ', which is a contradiction
    contradiction
  -- Goal 2: Provide the original HasType proof
  · exact h_type

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
  | _, Term.unitVal => some Ty.unit
  | Γ, Term.pair t₁ t₂ =>
      match typeOf Γ t₁, typeOf Γ t₂ with
      | some τ₁, some τ₂ => some (Ty.prod τ₁ τ₂)
      | _, _ => none
  | Γ, Term.fst t =>
      match typeOf Γ t with
      | some (Ty.prod τ₁ _) => some τ₁
      | _ => none
  | Γ, Term.snd t =>
      match typeOf Γ t with
      | some (Ty.prod _ τ₂) => some τ₂
      | _ => none
  | Γ, Term.inl τ₂ t₁ =>
      match typeOf Γ t₁ with
      | some τ₁ => some (Ty.sum τ₁ τ₂)
      | none => none
  | Γ, Term.inr τ₁ t₂ =>
      match typeOf Γ t₂ with
      | some τ₂ => some (Ty.sum τ₁ τ₂)
      | none => none
  | Γ, Term.case t x t₁ y t₂ =>
      match typeOf Γ t with
      | some (Ty.sum τ₁ τ₂) =>
          match typeOf (Γ ▷ x : τ₁) t₁, typeOf (Γ ▷ y : τ₂) t₂ with
          | some τ₃, some τ₃' => if τ₃ == τ₃' then some τ₃ else none
          | _, _ => none
      | _ => none
  | Γ, Term.abort τ t =>
      match typeOf Γ t with
      | some Ty.empty => some τ
      | _ => none

/-- A simplified version of the type checking soundness theorem -/
theorem typeOf_sound (Γ : Context) (t : Term) (τ : Ty) :
  typeOf Γ t = some τ → HasType Γ t τ := by
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
