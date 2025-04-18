import Fcomp.Terms
import Fcomp.Types
import Fcomp.Context
import Fcomp.Beta
import Fcomp.Eta

namespace Fcomp.STLC

/-!
  # Reduction Strategies

  This file defines different reduction strategies for the Simply Typed Lambda Calculus.
  The main strategies are:
  1. Normal Order (leftmost-outermost): Reduces the leftmost-outermost redex first
  2. Applicative Order (leftmost-innermost): Reduces the leftmost-innermost redex first

  We also define weak head normal form (WHNF) and normal form (NF).
-/

/--
  A term is in weak head normal form (WHNF) if it is:
  1. A variable
  2. An abstraction
  3. A neutral term (a variable or constant applied to arguments)
  4. A constructor (pair, inl, inr) applied to terms
-/
inductive IsWHNF : Term → Prop where
  /-- Variables are in WHNF -/
  | var {x : String} : IsWHNF (Term.var x)

  /-- Abstractions are in WHNF -/
  | abs {x : String} {τ : Ty} {t : Term} : IsWHNF (Term.abs x τ t)

  /-- Unit value is in WHNF -/
  | unit : IsWHNF Term.unitVal

  /-- Pairs of terms are in WHNF -/
  | pair {t₁ t₂ : Term} : IsWHNF (Term.pair t₁ t₂)

  /-- Left injections are in WHNF -/
  | inl {τ : Ty} {t : Term} : IsWHNF (Term.inl τ t)

  /-- Right injections are in WHNF -/
  | inr {τ : Ty} {t : Term} : IsWHNF (Term.inr τ t)

/--
  A term is in normal form (NF) if it has no redexes anywhere,
  including under abstractions and in subterms.
-/
inductive IsNF : Term → Prop where
  /-- Variables are in NF -/
  | var {x : String} : IsNF (Term.var x)

  /-- Abstractions are in NF if their body is in NF -/
  | abs {x : String} {τ : Ty} {t : Term} :
      IsNF t → IsNF (Term.abs x τ t)

  /-- Applications are in NF if both terms are in NF and it's not a redex -/
  | app {t₁ t₂ : Term} :
      IsNF t₁ → IsNF t₂ →
      (∀ x τ t, t₁ ≠ Term.abs x τ t) →  -- Not a beta redex
      IsNF (Term.app t₁ t₂)

  /-- Unit value is in NF -/
  | unit : IsNF Term.unitVal

  /-- Pairs are in NF if both components are in NF -/
  | pair {t₁ t₂ : Term} :
      IsNF t₁ → IsNF t₂ → IsNF (Term.pair t₁ t₂)

  /-- First projection is in NF if the term is in NF and not a pair -/
  | fst {t : Term} :
      IsNF t →
      (∀ t₁ t₂, t ≠ Term.pair t₁ t₂) →  -- Not a pair
      IsNF (Term.fst t)

  /-- Second projection is in NF if the term is in NF and not a pair -/
  | snd {t : Term} :
      IsNF t →
      (∀ t₁ t₂, t ≠ Term.pair t₁ t₂) →  -- Not a pair
      IsNF (Term.snd t)

  /-- Left injection is in NF if its argument is in NF -/
  | inl {τ : Ty} {t : Term} :
      IsNF t → IsNF (Term.inl τ t)

  /-- Right injection is in NF if its argument is in NF -/
  | inr {τ : Ty} {t : Term} :
      IsNF t → IsNF (Term.inr τ t)

  /-- Case expression is in NF if all subterms are in NF and scrutinee is not an injection -/
  | case {t t₁ t₂ : Term} {x y : String} :
      IsNF t → IsNF t₁ → IsNF t₂ →
      (∀ τ t', t ≠ Term.inl τ t') →  -- Not a left injection
      (∀ τ t', t ≠ Term.inr τ t') →  -- Not a right injection
      IsNF (Term.case t x t₁ y t₂)

  /-- Abort is in NF if its argument is in NF -/
  | abort {τ : Ty} {t : Term} :
      IsNF t → IsNF (Term.abort τ t)

/--
  Normal order reduction (leftmost-outermost).
  This strategy reduces the leftmost-outermost redex first.
-/
inductive NormalOrder : Term → Term → Prop where
  /-- Beta reduction at the top level -/
  | beta {x : String} {τ : Ty} {t₁ t₂ : Term} :
      NormalOrder (Term.app (Term.abs x τ t₁) t₂) (Term.subst t₁ x t₂)

  /-- Eta reduction at the top level -/
  | eta {x : String} {τ : Ty} {f : Term} :
      x ∉ f.fv →
      NormalOrder (Term.abs x τ (Term.app f (Term.var x))) f

  /-- Reduce in the function position of an application -/
  | app_fun {t₁ t₁' t₂ : Term} :
      NormalOrder t₁ t₁' →
      ¬IsWHNF t₁ →
      NormalOrder (Term.app t₁ t₂) (Term.app t₁' t₂)

  /-- Reduce in the argument position of an application -/
  | app_arg {t₁ t₂ t₂' : Term} :
      NormalOrder t₂ t₂' →
      IsWHNF t₁ →
      NormalOrder (Term.app t₁ t₂) (Term.app t₁ t₂')

  /-- Reduce under an abstraction -/
  | abs {x : String} {τ : Ty} {t t' : Term} :
      NormalOrder t t' →
      NormalOrder (Term.abs x τ t) (Term.abs x τ t')

  /-- Reduce in the left component of a pair -/
  | pair_left {t₁ t₁' t₂ : Term} :
      NormalOrder t₁ t₁' →
      NormalOrder (Term.pair t₁ t₂) (Term.pair t₁' t₂)

  /-- Reduce in the right component of a pair -/
  | pair_right {t₁ t₂ t₂' : Term} :
      NormalOrder t₂ t₂' →
      IsWHNF t₁ →
      NormalOrder (Term.pair t₁ t₂) (Term.pair t₁ t₂')

  /-- Beta reduction for first projection -/
  | fst_beta {t₁ t₂ : Term} :
      NormalOrder (Term.fst (Term.pair t₁ t₂)) t₁

  /-- Beta reduction for second projection -/
  | snd_beta {t₁ t₂ : Term} :
      NormalOrder (Term.snd (Term.pair t₁ t₂)) t₂

  /-- Reduce under first projection -/
  | fst {t t' : Term} :
      NormalOrder t t' →
      ¬(∃ t₁ t₂, t = Term.pair t₁ t₂) →
      NormalOrder (Term.fst t) (Term.fst t')

  /-- Reduce under second projection -/
  | snd {t t' : Term} :
      NormalOrder t t' →
      ¬(∃ t₁ t₂, t = Term.pair t₁ t₂) →
      NormalOrder (Term.snd t) (Term.snd t')

  /-- Reduce under left injection -/
  | inl {τ : Ty} {t t' : Term} :
      NormalOrder t t' →
      NormalOrder (Term.inl τ t) (Term.inl τ t')

  /-- Reduce under right injection -/
  | inr {τ : Ty} {t t' : Term} :
      NormalOrder t t' →
      NormalOrder (Term.inr τ t) (Term.inr τ t')

  /-- Beta reduction for case with left injection -/
  | case_inl {τ : Ty} {t t₁ t₂ : Term} {x y : String} :
      NormalOrder (Term.case (Term.inl τ t) x t₁ y t₂) (Term.subst t₁ x t)

  /-- Beta reduction for case with right injection -/
  | case_inr {τ : Ty} {t t₁ t₂ : Term} {x y : String} :
      NormalOrder (Term.case (Term.inr τ t) x t₁ y t₂) (Term.subst t₂ y t)

  /-- Reduce in the scrutinee of a case -/
  | case_scrut {t t' t₁ t₂ : Term} {x y : String} :
      NormalOrder t t' →
      ¬(∃ τ t'', t = Term.inl τ t'') →
      ¬(∃ τ t'', t = Term.inr τ t'') →
      NormalOrder (Term.case t x t₁ y t₂) (Term.case t' x t₁ y t₂)

  /-- Reduce in the left branch of a case -/
  | case_left {t t₁ t₁' t₂ : Term} {x y : String} :
      NormalOrder t₁ t₁' →
      IsWHNF t →
      NormalOrder (Term.case t x t₁ y t₂) (Term.case t x t₁' y t₂)

  /-- Reduce in the right branch of a case -/
  | case_right {t t₁ t₂ t₂' : Term} {x y : String} :
      NormalOrder t₂ t₂' →
      IsWHNF t →
      IsWHNF t₁ →
      NormalOrder (Term.case t x t₁ y t₂) (Term.case t x t₁ y t₂')

  /-- Reduce under abort -/
  | abort {τ : Ty} {t t' : Term} :
      NormalOrder t t' →
      NormalOrder (Term.abort τ t) (Term.abort τ t')

/--
  Applicative order reduction (leftmost-innermost).
  This strategy reduces the leftmost-innermost redex first.
-/
inductive ApplicativeOrder : Term → Term → Prop where
  /-- Beta reduction at the top level when arguments are in normal form -/
  | beta {x : String} {τ : Ty} {t₁ t₂ : Term} :
      IsNF t₂ →
      ApplicativeOrder (Term.app (Term.abs x τ t₁) t₂) (Term.subst t₁ x t₂)

  /-- Eta reduction at the top level when body is in normal form -/
  | eta {x : String} {τ : Ty} {f : Term} :
      IsNF f →
      x ∉ f.fv →
      ApplicativeOrder (Term.abs x τ (Term.app f (Term.var x))) f

  /-- Reduce in the argument position of an application -/
  | app_arg {t₁ t₂ t₂' : Term} :
      ApplicativeOrder t₂ t₂' →
      ¬IsNF t₂ →
      ApplicativeOrder (Term.app t₁ t₂) (Term.app t₁ t₂')

  /-- Reduce in the function position of an application -/
  | app_fun {t₁ t₁' t₂ : Term} :
      ApplicativeOrder t₁ t₁' →
      IsNF t₂ →
      ¬IsNF t₁ →
      ApplicativeOrder (Term.app t₁ t₂) (Term.app t₁' t₂)

  /-- Reduce under an abstraction -/
  | abs {x : String} {τ : Ty} {t t' : Term} :
      ApplicativeOrder t t' →
      ApplicativeOrder (Term.abs x τ t) (Term.abs x τ t')

  /-- Reduce in the right component of a pair -/
  | pair_right {t₁ t₂ t₂' : Term} :
      ApplicativeOrder t₂ t₂' →
      IsNF t₁ →
      ¬IsNF t₂ →
      ApplicativeOrder (Term.pair t₁ t₂) (Term.pair t₁ t₂')

  /-- Reduce in the left component of a pair -/
  | pair_left {t₁ t₁' t₂ : Term} :
      ApplicativeOrder t₁ t₁' →
      ¬IsNF t₁ →
      ApplicativeOrder (Term.pair t₁ t₂) (Term.pair t₁' t₂)

  /-- Beta reduction for first projection when argument is in normal form -/
  | fst_beta {t₁ t₂ : Term} :
      IsNF t₁ → IsNF t₂ →
      ApplicativeOrder (Term.fst (Term.pair t₁ t₂)) t₁

  /-- Beta reduction for second projection when argument is in normal form -/
  | snd_beta {t₁ t₂ : Term} :
      IsNF t₁ → IsNF t₂ →
      ApplicativeOrder (Term.snd (Term.pair t₁ t₂)) t₂

  /-- Reduce under first projection -/
  | fst {t t' : Term} :
      ApplicativeOrder t t' →
      ¬IsNF t →
      ApplicativeOrder (Term.fst t) (Term.fst t')

  /-- Reduce under second projection -/
  | snd {t t' : Term} :
      ApplicativeOrder t t' →
      ¬IsNF t →
      ApplicativeOrder (Term.snd t) (Term.snd t')

  /-- Reduce under left injection -/
  | inl {τ : Ty} {t t' : Term} :
      ApplicativeOrder t t' →
      ¬IsNF t →
      ApplicativeOrder (Term.inl τ t) (Term.inl τ t')

  /-- Reduce under right injection -/
  | inr {τ : Ty} {t t' : Term} :
      ApplicativeOrder t t' →
      ¬IsNF t →
      ApplicativeOrder (Term.inr τ t) (Term.inr τ t')

  /-- Beta reduction for case with left injection when all subterms are in normal form -/
  | case_inl {τ : Ty} {t t₁ t₂ : Term} {x y : String} :
      IsNF t → IsNF t₁ → IsNF t₂ →
      ApplicativeOrder (Term.case (Term.inl τ t) x t₁ y t₂) (Term.subst t₁ x t)

  /-- Beta reduction for case with right injection when all subterms are in normal form -/
  | case_inr {τ : Ty} {t t₁ t₂ : Term} {x y : String} :
      IsNF t → IsNF t₁ → IsNF t₂ →
      ApplicativeOrder (Term.case (Term.inr τ t) x t₁ y t₂) (Term.subst t₂ y t)

  /-- Reduce in the right branch of a case -/
  | case_right {t t₁ t₂ t₂' : Term} {x y : String} :
      ApplicativeOrder t₂ t₂' →
      IsNF t → IsNF t₁ →
      ¬IsNF t₂ →
      ApplicativeOrder (Term.case t x t₁ y t₂) (Term.case t x t₁ y t₂')

  /-- Reduce in the left branch of a case -/
  | case_left {t t₁ t₁' t₂ : Term} {x y : String} :
      ApplicativeOrder t₁ t₁' →
      IsNF t →
      ¬IsNF t₁ →
      ApplicativeOrder (Term.case t x t₁ y t₂) (Term.case t x t₁' y t₂)

  /-- Reduce in the scrutinee of a case -/
  | case_scrut {t t' t₁ t₂ : Term} {x y : String} :
      ApplicativeOrder t t' →
      ¬IsNF t →
      ApplicativeOrder (Term.case t x t₁ y t₂) (Term.case t' x t₁ y t₂)

  /-- Reduce under abort -/
  | abort {τ : Ty} {t t' : Term} :
      ApplicativeOrder t t' →
      ¬IsNF t →
      ApplicativeOrder (Term.abort τ t) (Term.abort τ t')

end Fcomp.STLC
