# FComp - Formalizing Logic and Computation in Lean

This project is a formalization of foundational logical and computational systems, motivated by the correspondence between intuitionistic logic and typed lambda calculi known as the Curry-Howard isomorphism. This isomorphism establishes that propositions can be interpreted as types, proofs as terms inhabiting those types, and the process of proof normalization (e.g., cut elimination) as computational reduction. Formalizing these concepts in Lean is particularly advantageous: its dependent type system allows for precise and expressive definitions of logical rules, term structures, and typing judgments, while its proof-checking capabilities enable the rigorous, machine-verified demonstration of meta-theoretic properties such as confluence and normalization, thereby ensuring the soundness and consistency of the formalized systems.

## 1. Foundations: Lambda Calculus and Natural Deduction (Implemented)

**Goal**: Formalize the syntax, typing rules, and proof structures of STLC and propositional Natural Deduction.

*   **Implementation**: Defines inductive types for `Ty` (including `base`, `arrow`, `prod`, `sum`, `unit`, `empty`) and `Term` (covering `var`, `abs`, `app`, `pair`, `fst`, `snd`, `inl`, `inr`, `case`, `unitVal`, `abort`). Formalizes propositional logic syntax (`Prop` with standard connectives) and Natural Deduction proof rules (`Proof` mirroring introduction/elimination rules). Implements `Context` as lists with lookup, extension, and domain operations. Provides a verified capture-avoiding substitution function (`subst`) using fresh variable generation, alongside helper functions for free variables (`fv`) and term size (`size`). Formalizes the bidirectional type checking/synthesis judgment \( \Gamma \vdash t : \tau \) (`TypeChecker.lean`) and the Natural Deduction provability judgment (`Judgement.lean`). Includes illustrative examples (`LambdaExamples.lean`, `NDExamples.lean`).

## 2. Computation: Reduction and Normalization (Implemented)

**Goal**: Formalize the operational semantics of STLC and prove standard computational properties like confluence and weak normalization.

*   **Implementation**: Defines inductive relations for single-step beta reduction (`Beta.lean`, \( \rightarrow_\beta \)) including congruence rules, and single-step eta reduction (`Eta.lean`, \( \rightarrow_\eta \)). Defines the multi-step reduction relation (\( \rightarrow\rightarrow \)) as the reflexive transitive closure (`MultiStep.lean`). Explores call-by-name and call-by-value reduction strategies (`Strategies.lean`). Proves the Church-Rosser theorem (confluence) for beta-eta reduction on STLC terms using the Tait-Martin-Löf method with parallel reduction (`CRDefinitions.lean`, `ParallelReduction.lean`, `CRTheorem.lean`, `CRConsequences.lean`). Proves Weak Normalization (WN) for STLC using Tait's computability argument based on a defined term degree (`WeakNormalization.lean`, `Degree.lean`, `NormSubstitution.lean`, `MaximalDegree.lean`).

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
