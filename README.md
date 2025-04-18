# FComp - Formalizing Logic and Computation in Lean

This project is a formalization of foundational logical and computational systems within Lean 4, motivated by the profound structural correspondence between intuitionistic logic and typed lambda calculi, often referred to as the Curry-Howard isomorphism. This isomorphism establishes that propositions can be interpreted as types, proofs as terms inhabiting those types, and the process of proof normalization (e.g., cut elimination) as computational reduction. Formalizing these concepts in Lean is particularly advantageous: its dependent type system allows for precise and expressive definitions of logical rules, term structures, and typing judgments, while its proof-checking capabilities enable the rigorous, machine-verified demonstration of crucial meta-theoretic properties such as confluence and normalization, thereby ensuring the soundness and consistency of the formalized systems.

## 1. Foundations: Lambda Calculus and Natural Deduction (Implemented)

**Goal**: Formalize the syntax, typing rules, and proof structures of STLC and propositional Natural Deduction.

*   ** Implementation**: Defines inductive types for `Ty` (base, arrow, prod, sum, unit, empty), `Term` (var, abs, app, pair, fst, snd, inl, inr, case, unitVal, abort), `Prop` (connectives), `Context`, and `Proof` (ND rules). Implements `Context` operations, capture-avoiding `subst`, term `fv` and `size`. Formalizes the typing/provability judgement \( \Gamma \vdash t : \tau \) (`TypeChecker.lean`) and ND judgements (`Judgement.lean`). Includes various examples (`LambdaExamples.lean`, `NDExamples.lean`).

## 2. Computation: Reduction and Normalization (Implemented)

**Goal**: Formalize the operational semantics of STLC and prove standard computational properties like confluence and weak normalization.

*   ** Implementation**: Defines single-step beta (`Beta.lean`) and eta (`Eta.lean`) reduction relations (\( \rightarrow_\beta \), \( \rightarrow_\eta \)). Defines multi-step reduction (\( \rightarrow\rightarrow \)) (`MultiStep.lean`). Explores reduction strategies (`Strategies.lean`). Proves the Church-Rosser theorem (confluence) for STLC using parallel reduction (`CRDefinitions.lean`, `ParallelReduction.lean`, `CRTheorem.lean`, `CRConsequences.lean`). Proves Weak Normalization (WN) for STLC using Tait's method (`WeakNormalization.lean`, `Degree.lean`, `NormSubstitution.lean`, `MaximalDegree.lean`).

## 3. Sequent Calculus and Its Relationship to Natural Deduction (Planned)

**Goal**: Formalize sequent calculus rules and relate it to the Natural Deduction system, including proving cut elimination.

## 4. Strong Normalization and Advanced Type Systems (Planned)

**Goal**: Prove strong normalization for STLC (e.g., via reducibility) and extend the formalization to systems like Gödel's System T.

## 5. Polymorphic Lambda Calculus (System F) (Planned)

**Goal**: Formalize System F, including polymorphic types, terms, type checking, evaluation, and encodings.

## 6. Denotational Semantics (Planned)

**Goal**: Explore denotational semantics for STLC and related systems, potentially using coherence spaces.

## 7. Advanced Topics and Integration (Planned)

**Goal**: Investigate topics like representation theorems and integrate the various formalized components.

## 8. Linear Logic (Optional Extension) (Planned)

**Goal**: Optionally extend the framework to formalize concepts from linear logic.

## How to Use

This is a Lean 4 project. You can build the project and verify the implemented definitions and proofs using:
```bash
lake build
```
