/-
  Types.lean
  Definition of simple types for Simply Typed Lambda Calculus (STLC).

  This module defines the syntax of simple types which consists of:
  1. Base types (represented as strings)
  2. Function types (arrow types)

  Part of Project 1.1: Simply Typed Lambda Calculus
-/

namespace Fcomp.STLC

/--
  The type of simple types in Simply Typed Lambda Calculus.
  @param base A base type, represented as a string
  @param arrow A function type from one type to another
-/
inductive Ty where
  | base : String → Ty
  | arrow : Ty → Ty → Ty
  deriving Inhabited, BEq

/-- Custom notation for arrow types -/
notation:50 A:50 " ⟶ " B:50 => Ty.arrow A B

/-- Pretty printing for types -/
def Ty.toString : Ty → String
  | base s => s
  | arrow A B => s!"({A.toString} ⟶ {B.toString})"

instance : ToString Ty where
  toString := Ty.toString

/-- Examples of type construction -/
def boolTy : Ty := Ty.base "Bool"
def natTy : Ty := Ty.base "Nat"
def funTy : Ty := boolTy ⟶ natTy

/-- Basic type equality lemmas -/
@[simp]
theorem arrow_eq_arrow {A B C D : Ty} :
  (Ty.arrow A B = Ty.arrow C D) ↔ (A = C ∧ B = D) := by
  constructor
  · intro h; cases h; exact ⟨rfl, rfl⟩
  · intro ⟨h₁, h₂⟩; rw [h₁, h₂]

@[simp]
theorem base_eq_base {s₁ s₂ : String} :
  (Ty.base s₁ = Ty.base s₂) ↔ s₁ = s₂ := by
  constructor
  · intro h; cases h; rfl
  · intro h; rw [h]

theorem base_ne_arrow {s : String} {A B : Ty} :
  Ty.base s ≠ Ty.arrow A B := by
  intro h
  contradiction

end Fcomp.STLC
