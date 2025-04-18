/-
  CRDefinitions.lean
  Definitions for Church-Rosser properties in Simply Typed Lambda Calculus.

  This module defines the key concepts needed for proving the Church-Rosser theorem:
  - Diamond property
  - Confluence
  - Normal forms
-/

import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta

namespace Fcomp.STLC.CR

open Fcomp.STLC

/-! ### Diamond Property -/

/--
  The diamond property states that if a term `t` can reduce to both `t₁` and `t₂` in one step,
  then there exists a term `t₃` such that both `t₁` and `t₂` can reduce to `t₃` in one step.

  ```
       t
     ↙   ↘
    t₁    t₂
     ↘   ↙
       t₃
  ```
-/
def HasDiamondProperty (R : Term → Term → Prop) : Prop :=
  ∀ t t₁ t₂,
    R t t₁ →
    R t t₂ →
    ∃ t₃,
      R t₁ t₃ ∧
      R t₂ t₃

/-! ### Confluence (Church-Rosser Property) -/

/--
  Confluence (Church-Rosser property) states that if a term `t` can reduce to both `t₁` and `t₂`
  in multiple steps, then there exists a term `t₃` such that both `t₁` and `t₂` can reduce to `t₃`
  in multiple steps.

  ```
       t
    ↙*    ↘*
    t₁     t₂
    ↘*    ↙*
       t₃
  ```
-/
def IsConfluent (R : Term → Term → Prop) : Prop :=
  ∀ t t₁ t₂,
    BetaMulti t t₁ →
    BetaMulti t t₂ →
    ∃ t₃,
      BetaMulti t₁ t₃ ∧
      BetaMulti t₂ t₃

/-! ### Normal Forms -/

/--
  A term is in normal form with respect to a reduction relation R if it cannot
  be reduced further using that relation.
-/
def IsNormalForm (t : Term) : Prop :=
  ∀ t', ¬(BetaStep t t')

/--
  A term `t` has a normal form if there exists some term `t'` that:
  1. Can be reached from `t` by multi-step reduction
  2. Is in normal form
-/
def HasNormalForm (t : Term) : Prop :=
  ∃ t',
    BetaMulti t t' ∧
    IsNormalForm t'

/--
  A term `t` has a unique normal form if any two normal forms that can be reached
  from `t` by multi-step reduction are alpha-equivalent.
-/
def HasUniqueNormalForm (t : Term) : Prop :=
  ∀ t₁ t₂,
    BetaMulti t t₁ →
    BetaMulti t t₂ →
    IsNormalForm t₁ →
    IsNormalForm t₂ →
    AlphaEquiv t₁ t₂

/-! ### Strip Lemma -/

/--
  The strip lemma states that if we have a single-step reduction and a multi-step reduction
  from the same term, we can "strip" them to find a common reduct.

  ```
       t
     →   ↠
    t₁    t₂
     ↠   →*
       t₃
  ```
-/
def StripProperty (R : Term → Term → Prop) : Prop :=
  ∀ t t₁ t₂,
    R t t₁ →
    BetaMulti t t₂ →
    ∃ t₃,
      BetaMulti t₁ t₃ ∧
      (R t₂ t₃ ∨ t₂ = t₃)

end Fcomp.STLC.CR
