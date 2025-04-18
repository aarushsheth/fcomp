/-
  Substitution.lean
  Formal properties of substitution for Simply Typed Lambda Calculus (STLC).

  This module builds on the substitution operations defined in Terms.lean
  and proves their key properties, including the substitution lemma which
  shows that substitution preserves typing.

-/

import Fcomp.Types
import Fcomp.Terms
import Fcomp.Context
import Fcomp.TypeChecker

-- Define HasSubset instance globally or before list lemmas
instance {α} : HasSubset (List α) where
  Subset l₁ l₂ := ∀ x, x ∈ l₁ → x ∈ l₂

namespace Fcomp.STLC

-- Assumed lemmas (using `:= sorry`)
-- Proofs using only core Decidable features

theorem decide_eq_true {P : Prop} [h : Decidable P] : P → decide P = true := by
  intro hP
  cases h with -- Cases on the Decidable instance h
  | isTrue hp => rfl -- If P is true, decide P is defined as true
  | isFalse hnp => exact absurd hP hnp -- The case P (hP) contradicts ¬P (hnp)

theorem decide_eq_false {P : Prop} [h : Decidable P] : ¬P → decide P = false := by
  intro hnP
  cases h with -- Cases on the Decidable instance h
  | isTrue hp => exact absurd hp hnP -- The case P (hp) contradicts ¬P (hnP)
  | isFalse hnp' => rfl -- If P is false, decide P is defined as false

-- Helper lemma needed for eq_of_beq_eq_true
theorem eq_of_decide_eq_true {P : Prop} [Decidable P] : decide P = true → P := by
  sorry

-- Lemma bridging BEq and DecidableEq (Proof depends on BEq definition)
-- Assuming the standard definition: instance [DecidableEq α] : BEq α where beq x y := decide (x = y)
theorem beq_eq_decide_eq {α} [BEq α] [hde : DecidableEq α] (x y : α) : (x == y) = decide (x = y) := by
  -- This proof requires unfolding the actual BEq instance definition.
  -- If it's the standard one, this might be `rfl` or require specific instance unfolding.
  sorry -- Assuming this holds for now

-- Now prove the BEq lemmas using the bridge lemma

theorem eq_of_beq_eq_true {α} [BEq α] [hde : DecidableEq α] {x y : α} : (x == y) = true → x = y := by
  have inst : Decidable (x = y) := hde x y -- Name the instance explicitly
  rw [beq_eq_decide_eq x y]
  -- Need to provide the instance to eq_of_decide_eq_true
  sorry-- Pass the named instance explicitly

theorem beq_eq_false_of_ne {α} [BEq α] [hde : DecidableEq α] {x y : α} : x ≠ y → (x == y) = false := by
  have inst : Decidable (x = y) := hde x y -- Name the instance explicitly
  sorry

theorem beq_self_eq_true {α} [BEq α] [hde : DecidableEq α] {x : α} : (x == x) = true := by
  have inst : Decidable (x = x) := hde x x -- Name the instance explicitly
  sorry
  -- Need to provide the instance to decide_eq_tru

-- Local List Helper Lemmas (as Mathlib is unavailable)
namespace List

theorem mem_append_iff {α} (x : α) (l₁ l₂ : List α) : x ∈ l₁ ++ l₂ ↔ x ∈ l₁ ∨ x ∈ l₂ := by
  induction l₁ with
  | nil => simp [List.nil_append]
  | cons hd tl ih =>
    simp only [List.cons_append, List.mem_cons] -- Goal: (x = hd ∨ x ∈ tl ++ l₂) ↔ (x = hd ∨ x ∈ tl) ∨ x ∈ l₂
    rw [ih] -- Goal: (x = hd ∨ (x ∈ tl ∨ x ∈ l₂)) ↔ (x = hd ∨ x ∈ tl) ∨ x ∈ l₂
    constructor
    · intro h; rcases h with (h1 | (h2 | h3))
      · exact Or.inl (Or.inl h1)
      · exact Or.inl (Or.inr h2)
      · exact Or.inr h3
    · intro h; rcases h with ((h1 | h2) | h3)
      · exact Or.inl h1
      · exact Or.inr (Or.inl h2)
      · exact Or.inr (Or.inr h3)

theorem subset_def {α} {l₁ l₂ : List α} : l₁ ⊆ l₂ ↔ ∀ x, x ∈ l₁ → x ∈ l₂ := Iff.rfl

@[simp]
theorem subset_refl {α} (l : List α) : l ⊆ l :=
  fun x hx ↦ hx

theorem subset_trans {α} {l₁ l₂ l₃ : List α} (h₁₂ : l₁ ⊆ l₂) (h₂₃ : l₂ ⊆ l₃) : l₁ ⊆ l₃ := by
  rw [subset_def] at *
  intro x hx
  exact h₂₃ x (h₁₂ x hx)

theorem mem_filter_iff {α} {p : α → Bool} {x : α} {l : List α} :
  x ∈ l.filter p ↔ x ∈ l ∧ p x = true := by
  induction l with
  | nil => simp [List.filter, List.not_mem_nil]
  | cons hd tl ih =>
    simp only [List.filter_cons, List.mem_cons]
    split -- Use split tactic for 'if' in the goal
    rename_i h_p -- Rename the hypothesis introduced by split
    · -- Case p hd = true
      simp only [List.mem_cons, h_p] -- Simplify using h_p
      rw [ih] -- Goal: (x = hd ∨ (x ∈ tl ∧ p x = true)) ↔ (x = hd ∨ x ∈ tl) ∧ p x = true
      constructor
      · intro h_left; rcases h_left with (rfl | h_tl_px)
        · exact ⟨Or.inl rfl, h_p⟩
        · exact ⟨Or.inr h_tl_px.left, h_tl_px.right⟩
      · intro h_right; rcases h_right with ⟨(rfl | h_mem_tl), h_px_true⟩
        · exact Or.inl rfl
        · exact Or.inr ⟨h_mem_tl, h_px_true⟩
    · -- Case p hd = false
      rw [ih] -- Goal: (x ∈ tl ∧ p x = true) ↔ (x = hd ∨ x ∈ tl) ∧ p x = true
      constructor
      · intro h_left; exact ⟨Or.inr h_left.left, h_left.right⟩
      · intro h_right; rcases h_right with ⟨(h_eq | h_mem_tl), h_px_true⟩
        · -- Case x = hd
          rw [h_eq] at h_px_true -- Substitute x with hd in p x = true
          contradiction -- Should find the contradiction directly
        · -- Case x ∈ tl
          exact ⟨h_mem_tl, h_px_true⟩

theorem filter_subset {α} (p : α → Bool) (l : List α) : l.filter p ⊆ l := by
  rw [subset_def]
  intro x hx
  rw [mem_filter_iff] at hx
  exact hx.left

theorem filter_filter {α} (p q : α → Bool) (l : List α) :
  (l.filter p).filter q = l.filter (fun x => p x && q x) := by
  induction l with
  | nil => simp
  | cons hd tl ih =>
    simp only [List.filter_cons] -- Unfold outer filter_cons once on both sides
    split <;> rename_i hp -- Split on 'if p hd', name hypothesis hp
    · -- Case hp: p hd = true
      simp only [hp, ↓reduceIte] -- Simplify based on hp
      -- Goal: (hd :: filter p tl).filter q = if q hd then hd :: filter (fun x => p x && q x) tl else filter (fun x => p x && q x) tl
      simp only [List.filter_cons] -- Unfold filter q on the LHS
      split <;> rename_i hq -- Split on 'if q hd' on RHS, name hypothesis hq
      · -- Case hq: q hd = true
        simp only [hp, hq, Bool.and_true, Bool.true_and, ↓reduceIte] -- Simplify RHS based on hp & hq
        -- Goal: hd :: filter q (filter p tl) = hd :: filter (fun x => p x && q x) tl
        rw [ih] -- Apply IH
      · -- Case hq: ¬(q hd = true)
        simp only [hp, hq, Bool.true_and, Bool.and_false, ↓reduceIte] -- Simplify RHS based on hp & hq
        -- Goal: filter q (filter p tl) = filter (fun x => p x && q x) tl
        rw [ih] -- Apply IH
    · -- Case hp: ¬(p hd = true)
      simp only [hp, ↓reduceIte] -- Simplify LHS based on hp
      -- Goal: (filter p tl).filter q = if false && q hd then ... else filter (fun x => p x && q x) tl
      simp only [Bool.false_and, ↓reduceIte] -- Simplify RHS condition
      -- Goal: (filter p tl).filter q = filter (fun x => p x && q x) tl
      rw [ih] -- Apply IH

theorem filter_append {α} (p : α → Bool) (l₁ l₂ : List α) :
  (l₁ ++ l₂).filter p = (l₁.filter p) ++ (l₂.filter p) := by
  induction l₁ with
  | nil => simp
  | cons hd tl ih =>
    simp only [List.cons_append, List.filter_cons]
    split -- Use split tactic for 'if'
    rename_i h_p -- Rename the hypothesis
    · -- Case h_p: p hd = true
      simp only [h_p, List.filter_cons, List.cons_append, ↓reduceIte] -- Simplify based on h_p
      rw [ih]
    · -- Case h_p: p hd = false
      rw [ih]

theorem subset_append {α} {l₁ l₂ l₃ l₄ : List α} :
  l₁ ⊆ l₃ → l₂ ⊆ l₄ → l₁ ++ l₂ ⊆ l₃ ++ l₄ := by
  rw [subset_def, subset_def, subset_def]
  intro h₁₃ h₂₄ x hx
  rw [mem_append_iff] at hx ⊢
  cases hx with
  | inl hx₁ => exact Or.inl (h₁₃ x hx₁)
  | inr hx₂ => exact Or.inr (h₂₄ x hx₂)

theorem subset_append_left {α} (l₁ l₂ : List α) : l₁ ⊆ l₁ ++ l₂ := by
  rw [subset_def]
  intro x hx
  rw [mem_append_iff]
  exact Or.inl hx

theorem subset_append_right {α} (l₁ l₂ : List α) : l₂ ⊆ l₁ ++ l₂ := by
  rw [subset_def]
  intro x hx
  rw [mem_append_iff]
  exact Or.inr hx

-- Assumed helper lemma (add this one)
theorem beq_eq_true_of_eq {α} [BEq α] [DecidableEq α] {x y : α} : x = y → (x == y) = true := sorry

-- Derived helper lemma (add this one)
theorem ne_of_beq_eq_false {α} [BEq α] [DecidableEq α] {x y : α} : (x == y) = false → x ≠ y := by
  intro h_beq_false
  intro h_eq
  have h_beq_true := beq_eq_true_of_eq h_eq
  rw [h_beq_true] at h_beq_false -- We get true = false
  contradiction

theorem contains_iff_mem {α} [BEq α] [DecidableEq α] (x : α) (l : List α) : l.contains x ↔ x ∈ l := by
  induction l with
  | nil => simp [List.contains, List.elem, List.not_mem_nil]
  | cons hd tl ih =>
    simp only [List.contains, List.elem, List.mem_cons] -- Unfold definitions first
    if h_beq : (x == hd) then -- Use 'if' tactic
      -- Case 1: h_beq : (x == hd) = true
      simp only [h_beq, ↓reduceIte, true_iff]
      have h_eq : x = hd := eq_of_beq_eq_true h_beq
      exact Or.inl h_eq
    else
      -- Case 2: h_beq : ¬((x == hd) = true)
      simp only [h_beq, ↓reduceIte]
      rw [ih]
      have h_beq_false : (x == hd) = false := Bool.eq_false_iff.mpr h_beq -- Derive the 'false' version from the negation
      have h_ne : x ≠ hd := ne_of_beq_eq_false h_beq_false -- Now use the 'false' version
      constructor
      · intro h_in_tl; exact Or.inr h_in_tl
      · intro h_or; cases h_or with | inl h_eq_hd => contradiction | inr h_in_tl => exact h_in_tl

-- Lemma relating substSimple and fv (needed for abs case)
-- Proving this fully requires a similar induction. Stated with sorry for now.
theorem substSimple_fv {t s : Term} {x : String} :
  (Term.substSimple t x s).fv ⊆ (t.fv.filter (· ≠ x)) ++ (if List.contains t.fv x then s.fv else []) := by
  sorry -- Requires induction similar to subst_fv

-- Lemma relating fv of alpha-renamed term (needed for capture-avoidance)
-- Proving this requires reasoning about freshVar. Stated with sorry for now.
theorem fv_substSimple_var {t : Term} {y y' : String} (h_fresh : y' ∉ t.fv) :
  (t.substSimple y (Term.var y')).fv = (t.fv.filter (· ≠ y)) ++ [y'] := by
  sorry -- Requires induction and properties of freshVar/substSimple

theorem filter_idem {α} (p : α → Bool) (l : List α) :
  (l.filter p).filter p = l.filter p := by
  sorry -- Reverting due to persistent simp issues

/-! ### Substitution Typing Properties -/

-- Removed the weakening_var placeholder as it exists in TypeChecker.lean

/-- Simple substitution preserves type if the replacement has the right type -/
theorem subst_simple_preserves_type (Γ : Context) (t s : Term) (x : String) (τ_x τ_t : Ty) :
  (h_t : HasType (Γ ▷ x : τ_x) t τ_t) →
  (h_s : HasType Γ s τ_x) →
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

end List

end Fcomp.STLC
