/-
  LambdaExamples.lean
  Examples demonstrating Simply Typed Lambda Calculus (STLC).

  This module contains examples of lambda term construction, substitution,
  free variables, type checking, and alpha equivalence.

  Part of Project 1.1: Simply Typed Lambda Calculus
-/

import Fcomp.Types
import Fcomp.Terms
import Fcomp.Context
import Fcomp.TypeChecker
import Fcomp.Substitution

namespace Fcomp.STLC.Examples

open Fcomp.STLC

/-! ### Basic terms and their properties -/

-- Identity function for booleans -/
def idBool : Term := λ "x" : boolTy => Term.var "x"

-- Identity function for natural numbers -/
def idNat : Term := λ "x" : natTy => Term.var "x"

-- Constant function (K combinator) -/
def const : Term := λ "x" : boolTy => λ "y" : natTy => Term.var "x"

-- Application of boolean identity to a variable -/
def idBoolApp : Term := Term.app idBool (Term.var "true")

-- Free variables examples --

#eval idBool.fv  -- Expected: []
#eval idBoolApp.fv  -- Expected: ["true"]
#eval (Term.var "x").fv  -- Expected: ["x"]
#eval (Term.app (Term.var "f") (Term.var "x")).fv  -- Expected: ["f", "x"]

/-! ### Substitution examples -/

-- Simple substitution: x[x↦y] = y -/
example : Term.substSimple (Term.var "x") "x" (Term.var "y") = Term.var "y" := rfl

-- Simple substitution doesn't affect unrelated variables: z[x↦y] = z -/
example : Term.substSimple (Term.var "z") "x" (Term.var "y") = Term.var "z" := rfl

-- Substitution in applications is applied to both terms -/
def appExample : Term := Term.app (Term.var "f") (Term.var "x")
def appSubst : Term := Term.substSimple appExample "x" (Term.var "y")
#eval appSubst.toString  -- Expected: "(f @ y)"

-- Substitution in abstractions requires care for variable capture --/

-- Case 1: substitution has no effect when the variable is bound --/
example : Term.subst idBool "x" (Term.var "y") = idBool := rfl

-- Case 2: substitution affects free variables -/
def abstractionWithFreeVar : Term := λ "x" : boolTy => Term.app (Term.var "x") (Term.var "y")
def abstractionSubst : Term := Term.subst abstractionWithFreeVar "y" (Term.var "z")
#eval abstractionSubst.toString
-- Expected: "(λx:Bool => (x @ z))"

-- Case 3: capture avoidance by variable renaming -/
def potential_capture : Term := λ "y" : boolTy => Term.var "x"
def capture_avoided : Term := Term.subst potential_capture "x" (Term.var "y")
#eval capture_avoided.toString
-- Expected: something like "(λy':Bool => y)" with variable renamed to avoid capture

/-! ### Alpha equivalence examples -/

-- Alpha equivalence of identical terms -/
example : AlphaEquiv idBool idBool := AlphaEquiv.refl idBool

/-- String literals "z" and "x" are distinct -/
theorem z_ne_x : "z" ≠ "x" := by
  intro h
  contradiction

-- Alpha equivalence with renamed bound variables -/
def idBool' : Term := λ "z" : boolTy => Term.var "z"

example : AlphaEquiv idBool idBool' :=
  AlphaEquiv.abs_rename
    (by
      -- Show that "z" is not in the free variables of the body of idBool
      -- The body of idBool is just Term.var "x"
      simp [Term.fv]
      -- Now we need to show "z" ∉ ["x"]
      intro h
      -- Since "z" ≠ "x", it cannot be in ["x"]
      exact z_ne_x h)
    (by
      -- Show that Term.var "z" is alpha-equivalent to (Term.var "x")[x↦z]
      -- First compute the substitution
      simp [Term.substSimple]
      -- Now use the var constructor of AlphaEquiv
      exact AlphaEquiv.var "z")

-- Alpha equivalence is an equivalence relation -/
example (t₁ t₂ t₃ : Term) (h₁ : t₁ =α t₂) (h₂ : t₂ =α t₃) : t₁ =α t₃ :=
  AlphaEquiv.trans h₁ h₂

example (t₁ t₂ : Term) (h : t₁ =α t₂) : t₂ =α t₁ :=
  AlphaEquiv.symm h

/-! ### Type checking examples -/

-- Identity function is well-typed -/
example : HasType Context.empty idBool (boolTy ⟶ boolTy) :=
  HasType.t_abs (HasType.t_var (lookup_extend_same Context.empty "x" boolTy))

/-- String literals "y" and "x" are distinct -/
theorem y_ne_x : "y" ≠ "x" := by
  intro h
  contradiction

-- Constant function is well-typed -/
example : HasType Context.empty const (boolTy ⟶ natTy ⟶ boolTy) :=
  HasType.t_abs (
    HasType.t_abs (
      HasType.t_var (
        by
          -- First extend context with x:bool, then look up x in context with y:nat
          let Γ₁ := Context.empty ▷ "x" : boolTy
          let Γ₂ := Γ₁ ▷ "y" : natTy
          -- Use lookup_extend_other to show that looking up x skips over y
          have h₁ : Γ₂ ⟨ "x" ⟩ = Γ₁ ⟨ "x" ⟩ := lookup_extend_other Γ₁ "y" "x" natTy y_ne_x
          have h₂ : Γ₁ ⟨ "x" ⟩ = some boolTy := lookup_extend_same Context.empty "x" boolTy
          -- Chain the equalities
          rw [h₁, h₂]
      )
    )
  )

-- Application is well-typed when function and argument types match -/
example :
  HasType ((Context.empty ▷ "f" : (boolTy ⟶ boolTy)) ▷ "x" : boolTy)
          (Term.app (Term.var "f") (Term.var "x"))
          boolTy :=
  let Γ := (Context.empty ▷ "f" : (boolTy ⟶ boolTy)) ▷ "x" : boolTy
  HasType.t_app
    (HasType.t_var (lookup_extend_same Γ "f" (boolTy ⟶ boolTy)))
    (HasType.t_var (lookup_extend_same Γ "x" boolTy))

/-! ### Church encodings (bonus) -/

-- Church encoding for true: λx.λy.x -/
def churchTrue : Term := λ "x" : boolTy => λ "y" : boolTy => Term.var "x"

-- Church encoding for false: λx.λy.y -/
def churchFalse : Term := λ "x" : boolTy => λ "y" : boolTy => Term.var "y"

-- Church encoding for if-then-else: λb.λt.λf.b t f -/
def churchIf : Term :=
  λ "b" : (boolTy ⟶ boolTy ⟶ boolTy) =>
  λ "t" : boolTy =>
  λ "f" : boolTy =>
    Term.app (Term.app (Term.var "b") (Term.var "t")) (Term.var "f")

-- Church encoding for the pair constructor: λx.λy.λf.f x y -/
def churchPair : Term :=
  λ "x" : boolTy =>
  λ "y" : boolTy =>
  λ "f" : (boolTy ⟶ boolTy ⟶ boolTy) =>
    Term.app (Term.app (Term.var "f") (Term.var "x")) (Term.var "y")

-- Church encoding for the first projection: λp.p (λx.λy.x) -/
def churchFst : Term :=
  λ "p" : ((boolTy ⟶ boolTy ⟶ boolTy) ⟶ boolTy) =>
    Term.app (Term.var "p") churchTrue

-- Church encoding for the second projection: λp.p (λx.λy.y) -/
def churchSnd : Term :=
  λ "p" : ((boolTy ⟶ boolTy ⟶ boolTy) ⟶ boolTy) =>
    Term.app (Term.var "p") churchFalse

/-! ### Additional examples -/

-- Function composition combinator: λf.λg.λx.f (g x) -/
def compose : Term :=
  λ "f" : (boolTy ⟶ boolTy) =>
  λ "g" : (boolTy ⟶ boolTy) =>
  λ "x" : boolTy =>
    Term.app (Term.var "f") (Term.app (Term.var "g") (Term.var "x"))

-- Proof that function composition is well-typed -/
example : HasType Context.empty compose
  ((boolTy ⟶ boolTy) ⟶ (boolTy ⟶ boolTy) ⟶ boolTy ⟶ boolTy) :=
  HasType.t_abs (
    HasType.t_abs (
      HasType.t_abs (
        let Γ := ((Context.empty ▷ "f" : (boolTy ⟶ boolTy)) ▷ "g" : (boolTy ⟶ boolTy)) ▷ "x" : boolTy
        HasType.t_app
          (HasType.t_var (lookup_extend_same Γ "f" (boolTy ⟶ boolTy)))
          (HasType.t_app
            (HasType.t_var (lookup_extend_same Γ "g" (boolTy ⟶ boolTy)))
            (HasType.t_var (lookup_extend_same Γ "x" boolTy)))
      )
    )
  )

-- Church numerals: representing natural numbers as functions -/
def church0 : Term := λ "f" : (natTy ⟶ natTy) => λ "x" : natTy => Term.var "x"
def church1 : Term := λ "f" : (natTy ⟶ natTy) => λ "x" : natTy => Term.app (Term.var "f") (Term.var "x")
def church2 : Term := λ "f" : (natTy ⟶ natTy) => λ "x" : natTy =>
  Term.app (Term.var "f") (Term.app (Term.var "f") (Term.var "x"))

-- Church numeral successor function -/
def churchSucc : Term :=
  λ "n" : ((natTy ⟶ natTy) ⟶ natTy ⟶ natTy) =>
  λ "f" : (natTy ⟶ natTy) =>
  λ "x" : natTy =>
    Term.app (Term.var "f") (
      Term.app (Term.app (Term.var "n") (Term.var "f")) (Term.var "x")
    )

-- Church numeral addition: λm.λn.λf.λx.m f (n f x) -/
def churchAdd : Term :=
  λ "m" : ((natTy ⟶ natTy) ⟶ natTy ⟶ natTy) =>
  λ "n" : ((natTy ⟶ natTy) ⟶ natTy ⟶ natTy) =>
  λ "f" : (natTy ⟶ natTy) =>
  λ "x" : natTy =>
    Term.app
      (Term.app (Term.var "m") (Term.var "f"))
      (Term.app (Term.app (Term.var "n") (Term.var "f")) (Term.var "x"))

-- Example of Church-encoded boolean NOT function -/
def churchNotSimple : Term :=
  λ "b" : (boolTy ⟶ boolTy ⟶ boolTy) =>
    λ "x" : boolTy => λ "y" : boolTy =>
      Term.app (Term.app (Term.var "b") (Term.var "y")) (Term.var "x")

-- Proof that churchNotSimple is well-typed -/
example : HasType Context.empty churchNotSimple
           ((boolTy ⟶ boolTy ⟶ boolTy) ⟶ boolTy ⟶ boolTy ⟶ boolTy) :=
  HasType.t_abs (
    HasType.t_abs (
      HasType.t_abs (
        let Γ := ((Context.empty ▷ "b" : (boolTy ⟶ boolTy ⟶ boolTy)) ▷ "x" : boolTy) ▷ "y" : boolTy
        HasType.t_app
          (HasType.t_app
            (HasType.t_var (lookup_extend_same Γ "b" (boolTy ⟶ boolTy ⟶ boolTy)))
            (HasType.t_var (lookup_extend_same Γ "y" boolTy)))
          (HasType.t_var (lookup_extend_same Γ "x" boolTy))
      )
    )
  )

-- Example of composing two functions with churchNotSimple -/
def churchNotTwice' : Term :=
  λ "b" : (boolTy ⟶ boolTy ⟶ boolTy) =>
    Term.app churchNotSimple (Term.app churchNotSimple (Term.var "b"))

-- Proof that churchNotTwice' is well-typed -/
example : HasType Context.empty churchNotTwice'
           ((boolTy ⟶ boolTy ⟶ boolTy) ⟶ boolTy ⟶ boolTy ⟶ boolTy) :=
  HasType.t_abs (
    let Γ := Context.empty ▷ "b" : (boolTy ⟶ boolTy ⟶ boolTy)

    -- First prove that churchNotSimple is well-typed in the empty context
    have h_not_type : HasType Context.empty churchNotSimple
                      ((boolTy ⟶ boolTy ⟶ boolTy) ⟶ boolTy ⟶ boolTy ⟶ boolTy) :=
      HasType.t_abs (
        HasType.t_abs (
          HasType.t_abs (
            let Γ₁ := ((Context.empty ▷ "b" : (boolTy ⟶ boolTy ⟶ boolTy)) ▷ "x" : boolTy) ▷ "y" : boolTy
            HasType.t_app
              (HasType.t_app
                (HasType.t_var (lookup_extend_same Γ₁ "b" (boolTy ⟶ boolTy ⟶ boolTy)))
                (HasType.t_var (lookup_extend_same Γ₁ "y" boolTy)))
              (HasType.t_var (lookup_extend_same Γ₁ "x" boolTy))
          )
        )
      );

    -- By weakening, churchNotSimple has the same type in context Γ
    have h_not_in_ctx : HasType Γ churchNotSimple
                       ((boolTy ⟶ boolTy ⟶ boolTy) ⟶ boolTy ⟶ boolTy ⟶ boolTy) :=
      empty_weakening h_not_type;

    -- The variable b has type (boolTy ⟶ boolTy ⟶ boolTy) in context Γ
    have h_b_type : HasType Γ (Term.var "b") (boolTy ⟶ boolTy ⟶ boolTy) :=
      HasType.t_var (lookup_extend_same Γ "b" (boolTy ⟶ boolTy ⟶ boolTy));

    -- First application: churchNotSimple applied to b
    have h_not_b : HasType Γ (Term.app churchNotSimple (Term.var "b"))
                   (boolTy ⟶ boolTy ⟶ boolTy) :=
      HasType.t_app h_not_in_ctx h_b_type;

    -- Second application: churchNotSimple applied to (churchNotSimple b)
    HasType.t_app h_not_in_ctx h_not_b
  )

-- Remove the incorrect churchNot and churchNotTwice
-- Example of function composition with simple boolean functions -/
def notBool : Term :=
  λ "x" : boolTy => Term.var "x"  -- Placeholder for actual boolean negation

-- Proof that notBool is well-typed -/
example : HasType Context.empty notBool (boolTy ⟶ boolTy) :=
  HasType.t_abs (HasType.t_var (lookup_extend_same Context.empty "x" boolTy))

-- Example of composing two functions -/
def notTwice : Term :=
  λ "x" : boolTy =>
    Term.app notBool (Term.app notBool (Term.var "x"))

-- Proof that composing not with itself is well-typed -/
example : HasType Context.empty notTwice (boolTy ⟶ boolTy) :=
  HasType.t_abs (
    let Γ := Context.empty ▷ "x" : boolTy
    HasType.t_app
      (HasType.t_abs (HasType.t_var (lookup_extend_same Context.empty "x" boolTy)))
      (HasType.t_app
        (HasType.t_abs (HasType.t_var (lookup_extend_same Context.empty "x" boolTy)))
        (HasType.t_var (lookup_extend_same Γ "x" boolTy)))
  )

end Fcomp.STLC.Examples
