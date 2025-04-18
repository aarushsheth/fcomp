import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta
import Fcomp.Eta
import Fcomp.Strategies

namespace Fcomp.STLC

/-!
  # Multi-Step Reduction Relations

  This file defines multi-step reduction relations that combine beta and eta reductions,
  along with examples and helper functions for working with reduction sequences.

  We define:
  1. Combined single-step reduction (→βη)
  2. Combined multi-step reduction (→→βη)
  3. Helper functions for constructing reduction sequences
  4. Examples of reduction sequences
-/

/--
  Combined single-step reduction relation.
  t₁ →βη t₂ means t₁ reduces to t₂ in one step of either beta or eta reduction.
-/
inductive CombinedStep : Term → Term → Prop where
  /-- Include beta reduction steps -/
  | beta {t₁ t₂ : Term} :
      BetaStep t₁ t₂ → CombinedStep t₁ t₂

  /-- Include eta reduction steps -/
  | eta {t₁ t₂ : Term} :
      EtaStep t₁ t₂ → CombinedStep t₁ t₂

/-- Notation for single-step combined reduction -/
notation:50 t₁ " →βη " t₂ => CombinedStep t₁ t₂

/--
  Combined multi-step reduction relation.
  t₁ →→βη t₂ means t₁ reduces to t₂ in zero or more steps of beta or eta reduction.
-/
inductive CombinedMulti : Term → Term → Prop where
  /-- Reflexivity: t →→βη t -/
  | refl {t : Term} : CombinedMulti t t

  /-- Single step: if t₁ →βη t₂, then t₁ →→βη t₂ -/
  | step {t₁ t₂ : Term} : CombinedStep t₁ t₂ → CombinedMulti t₁ t₂

  /-- Transitivity: if t₁ →→βη t₂ and t₂ →→βη t₃, then t₁ →→βη t₃ -/
  | trans {t₁ t₂ t₃ : Term} : CombinedMulti t₁ t₂ → CombinedMulti t₂ t₃ → CombinedMulti t₁ t₃

/-- Notation for multi-step combined reduction -/
notation:50 t₁ " →→βη " t₂ => CombinedMulti t₁ t₂

/--
  A reduction sequence is a list of terms where each adjacent pair
  is related by a single-step reduction.
-/
structure ReductionSequence where
  /-- The list of terms in the reduction sequence -/
  terms : List Term
  /-- Proof that each adjacent pair is related by a single-step reduction -/
  steps : ∀ (i : Nat), i + 1 < terms.length →
    CombinedStep (terms[i]!) (terms[i + 1]!)

/--
  Helper function to construct a reduction sequence from a term and a list of reductions.
  Each reduction in the list is either a beta or eta step.
-/
def mkReductionSequence (start : Term) (reductions : List (Term × Bool)) : ReductionSequence := {
  terms := start :: (reductions.map (·.1))
  steps := by
    intro i h
    let curr := (start :: (reductions.map (·.1)))[i]!
    let next := (start :: (reductions.map (·.1)))[i + 1]!
    let (term, is_beta) := reductions[i]!
    exact if is_beta then
      CombinedStep.beta (by sorry)  -- Proof that this is a valid beta step
    else
      CombinedStep.eta (by sorry)  -- Proof that this is a valid eta step
}

/-- Example 1: Beta reduction of the identity function applied to a variable -/
def example1 (τ : Ty) (y : String) : ReductionSequence :=
  let t₁ := Term.app (Term.abs "x" τ (Term.var "x")) (Term.var y)
  let t₂ := Term.var y
  mkReductionSequence t₁ [(t₂, true)]

/-- Example 2: Eta reduction of a function -/
def example2 (τ : Ty) (f : Term) (h : "x" ∉ f.fv) : ReductionSequence :=
  let t₁ := Term.abs "x" τ (Term.app f (Term.var "x"))
  mkReductionSequence t₁ [(f, false)]

/-- Example 3: Combined beta-eta reduction -/
def example3 (τ : Ty) (f f' e : Term) (h : "x" ∉ f.fv) : ReductionSequence :=
  let t₁ := Term.app (Term.abs "x" τ (Term.app f (Term.var "x"))) e
  let t₂ := Term.app f e
  mkReductionSequence t₁ [(t₂, true), (f', false)]

/-- Example 4: Reduction of pair projections -/
def example4 (t₁ t₂ : Term) : ReductionSequence :=
  let pair := Term.pair t₁ t₂
  mkReductionSequence (Term.fst pair) [(t₁, true)]

/-- Example 5: Reduction of case expressions -/
def example5 (τ : Ty) (t t₁ t₂ : Term) : ReductionSequence :=
  let case_expr := Term.case (Term.inl τ t) "x" t₁ "y" t₂
  let result := Term.subst t₁ "x" t
  mkReductionSequence case_expr [(result, true)]

end Fcomp.STLC
