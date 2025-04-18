
namespace Fcomp.STLC

/-!
  # Propositions and Basic Logic

  This file defines basic logical propositions and connectives within the STLC framework.
  Currently, it focuses on defining conjunction (And).
-/

/--
  The proposition `P ∧ Q` (And P Q) is true if both P and Q are true.
-/
inductive And (P Q : Prop) : Prop where
  /-- Introduction rule for And: If we have proofs of P and Q, we can construct a proof of P ∧ Q. -/
  | intro : P → Q → And P Q

notation:80 P_prop  " ∧ " Q_prop => And P_prop Q_prop

/-- Elimination rule 1: Extract the proof of P from a proof of P ∧ Q. -/
def And.left {P Q : Prop} (h : Fcomp.STLC.And P Q) : P :=
  match h with
  | And.intro hp _ => hp

/-- Elimination rule 2: Extract the proof of Q from a proof of P ∧ Q. -/
def And.right {P Q : Prop} (h : Fcomp.STLC.And P Q) : Q :=
  match h with
  | And.intro _ hq => hq

/-- Theorem: Conjunction is commutative. -/
theorem and_commutative (P Q : Prop) : Fcomp.STLC.And P Q → Fcomp.STLC.And Q P :=
  fun hpq : Fcomp.STLC.And P Q =>
  have hp : P := And.left hpq
  have hq : Q := And.right hpq
  show Fcomp.STLC.And Q P from And.intro hq hp

/-! ### Disjunction (Or) -/

/--
  The proposition `P ∨ Q` (Or P Q) is true if at least one of P or Q is true.
-/
inductive Or (P Q : Prop) : Prop where
  /-- Introduction rule 1: If we have a proof of P, we have a proof of P ∨ Q. -/
  | inl : P → Or P Q
  /-- Introduction rule 2: If we have a proof of Q, we have a proof of P ∨ Q. -/
  | inr : Q → Or P Q

notation:75 P_prop " ∨ " Q_prop => Or P_prop Q_prop

/-- Elimination rule for Or (Proof by Cases): If P ∨ Q is true, and we can prove R from P and R from Q, then R is true. -/
def Or.elim {P Q R : Prop} (h_or : Fcomp.STLC.Or P Q) (h_p_implies_r : P → R) (h_q_implies_r : Q → R) : R :=
  match h_or with
  | Or.inl hp => h_p_implies_r hp
  | Or.inr hq => h_q_implies_r hq

/-- Theorem: Disjunction is commutative. -/
theorem or_commutative (P Q : Prop) : Fcomp.STLC.Or P Q → Fcomp.STLC.Or Q P :=
  fun h_or : Fcomp.STLC.Or P Q =>
  Or.elim h_or
    (fun hp : P => Or.inr hp)  -- Case 1: If P is true, then Q ∨ P is true (using inr).
    (fun hq : Q => Or.inl hq)  -- Case 2: If Q is true, then Q ∨ P is true (using inl).

/-- Theorem: Disjunction is associative. -/
theorem or_assoc (P Q R : Prop) : (Fcomp.STLC.Or (Fcomp.STLC.Or P Q) R) ↔ (Fcomp.STLC.Or P (Fcomp.STLC.Or Q R)) :=
  Iff.intro
    (fun h_pqr : Fcomp.STLC.Or (Fcomp.STLC.Or P Q) R =>
      Or.elim h_pqr
        (fun h_pq : Fcomp.STLC.Or P Q =>
          Or.elim h_pq
            (fun hp : P => Or.inl hp)              -- P -> P ∨ (Q ∨ R)
            (fun hq : Q => Or.inr (Or.inl hq)))   -- Q -> Q ∨ R -> P ∨ (Q ∨ R)
        (fun hr : R => Or.inr (Or.inr hr)))       -- R -> Q ∨ R -> P ∨ (Q ∨ R)
    (fun h_pqr : Fcomp.STLC.Or P (Fcomp.STLC.Or Q R) =>
      Or.elim h_pqr
        (fun hp : P => Or.inl (Or.inl hp))          -- P -> P ∨ Q -> (P ∨ Q) ∨ R
        (fun h_qr : Fcomp.STLC.Or Q R =>
          Or.elim h_qr
            (fun hq : Q => Or.inl (Or.inr hq))       -- Q -> P ∨ Q -> (P ∨ Q) ∨ R
            (fun hr : R => Or.inr hr)))             -- R -> (P ∨ Q) ∨ R

/-! ### Truth -/

/-- The proposition `True` is always true. -/
inductive True : Prop where
  /-- Introduction rule: `True` has exactly one proof. -/
  | trivial : True

/-! ### Falsity -/

/-- The proposition `False` is always false and has no proof. -/
inductive False : Prop where
  -- No constructors, representing impossibility

/-- Elimination rule for False (Ex Falso Quodlibet): From falsehood, anything follows. -/
def False.elim {P : Prop} (h : False) : P :=
  nomatch h

/-! ### Negation (Not) -/

/-- Negation `¬P` is defined as `P → False`. -/
def Not (P : Prop) : Prop := P → False

prefix:90 "¬" => Not

/-! ### Implication (Implies) -/

-- Implication `P → Q` is represented by Lean's built-in function type.
-- We don't need a separate definition.

/-! ### Equivalence (Iff) -/

/-- Equivalence `P ↔ Q` means P implies Q and Q implies P. -/
def Iff (P Q : Prop) : Prop := Fcomp.STLC.And (P → Q) (Q → P)

notation:70 P_prop " ↔ " Q_prop => Iff P_prop Q_prop

/-- Introduction rule for Iff: If we have proofs of P → Q and Q → P, we have P ↔ Q. -/
def Iff.intro {P Q : Prop} (h_pq : P → Q) (h_qp : Q → P) : Fcomp.STLC.Iff P Q :=
  And.intro h_pq h_qp

/-- Elimination rule 1 (modus ponens direction): From P ↔ Q and P, we can deduce Q. -/
def Iff.mp {P Q : Prop} (h_iff : Fcomp.STLC.Iff P Q) (hp : P) : Q :=
  (And.left h_iff) hp -- Extract P → Q and apply P

/-- Elimination rule 2 (modus ponens reverse direction): From P ↔ Q and Q, we can deduce P. -/
def Iff.mpr {P Q : Prop} (h_iff : Fcomp.STLC.Iff P Q) (hq : Q) : P :=
  (And.right h_iff) hq -- Extract Q → P and apply Q

/-! ### Theorems about Iff -/

/-- Theorem: Iff is reflexive. -/
theorem iff_refl (P : Prop) : Fcomp.STLC.Iff P P :=
  Iff.intro (fun hp : P => hp) (fun hp : P => hp)

/-- Theorem: Iff is symmetric. -/
theorem iff_symm {P Q : Prop} (h_iff : Fcomp.STLC.Iff P Q) : Fcomp.STLC.Iff Q P :=
  Iff.intro (Iff.mpr h_iff) (Iff.mp h_iff)

/-- Theorem: Iff is transitive. -/
theorem iff_trans {P Q R : Prop} (h_pq : Fcomp.STLC.Iff P Q) (h_qr : Fcomp.STLC.Iff Q R) : Fcomp.STLC.Iff P R :=
  Iff.intro
    (fun hp : P => Iff.mp h_qr (Iff.mp h_pq hp)) -- P → Q → R
    (fun hr : R => Iff.mpr h_pq (Iff.mpr h_qr hr)) -- R → Q → P

/-! ### Theorems about Not -/

/-- Theorem: Principle of Contradiction -/
theorem contradiction (P : Prop) : Fcomp.STLC.Not (Fcomp.STLC.And P (Fcomp.STLC.Not P)) :=
  fun h_pandnp : Fcomp.STLC.And P (Fcomp.STLC.Not P) =>
  let hp : P := And.left h_pandnp
  let hnp : Fcomp.STLC.Not P := And.right h_pandnp
  hnp hp -- Apply ¬P (which is P → False) to P to get False

/-- Theorem: Double Negation Introduction -/
theorem double_neg_intro (P : Prop) : P → Fcomp.STLC.Not (Fcomp.STLC.Not P) :=
  fun hp : P =>
  fun hnp : Fcomp.STLC.Not P => -- Assume ¬P for the inner negation
  hnp hp           -- Apply ¬P to P to get False, proving ¬¬P

/-! ### Distributivity Theorems -/

/-- Theorem: Conjunction distributes over disjunction. -/
theorem and_distrib_or (P Q R : Prop) :
  Fcomp.STLC.Iff
    (Fcomp.STLC.And P (Fcomp.STLC.Or Q R))
    (Fcomp.STLC.Or (Fcomp.STLC.And P Q) (Fcomp.STLC.And P R)) :=
  Iff.intro
    -- Forward direction: P ∧ (Q ∨ R) → (P ∧ Q) ∨ (P ∧ R)
    (fun h_pandqr : Fcomp.STLC.And P (Fcomp.STLC.Or Q R) =>
      let hp := And.left h_pandqr
      let h_qr := And.right h_pandqr
      Or.elim h_qr
        (fun hq : Q => Or.inl (And.intro hp hq)) -- Case Q: P ∧ Q, so (P ∧ Q) ∨ (P ∧ R)
        (fun hr : R => Or.inr (And.intro hp hr)) -- Case R: P ∧ R, so (P ∧ Q) ∨ (P ∧ R)
    )
    -- Backward direction: (P ∧ Q) ∨ (P ∧ R) → P ∧ (Q ∨ R)
    (fun h_or_ands : Fcomp.STLC.Or (Fcomp.STLC.And P Q) (Fcomp.STLC.And P R) =>
      Or.elim h_or_ands
        -- Case P ∧ Q
        (fun h_pq : Fcomp.STLC.And P Q =>
          let hp := And.left h_pq
          let hq := And.right h_pq
          And.intro hp (Or.inl hq) -- P and Q, so P ∧ (Q ∨ R)
        )
        -- Case P ∧ R
        (fun h_pr : Fcomp.STLC.And P R =>
          let hp := And.left h_pr
          let hr := And.right h_pr
          And.intro hp (Or.inr hr) -- P and R, so P ∧ (Q ∨ R)
        )
    )

/-- Theorem: Disjunction distributes over conjunction. -/
theorem or_distrib_and (P Q R : Prop) :
  Fcomp.STLC.Iff
    (Fcomp.STLC.Or P (Fcomp.STLC.And Q R))
    (Fcomp.STLC.And (Fcomp.STLC.Or P Q) (Fcomp.STLC.Or P R)) :=
  Iff.intro
    -- Forward direction: P ∨ (Q ∧ R) → (P ∨ Q) ∧ (P ∨ R)
    (fun h_porqr : Fcomp.STLC.Or P (Fcomp.STLC.And Q R) =>
      Or.elim h_porqr
        -- Case P
        (fun hp : P =>
          let h_pq : Fcomp.STLC.Or P Q := Or.inl hp
          let h_pr : Fcomp.STLC.Or P R := Or.inl hp
          And.intro h_pq h_pr -- P implies P ∨ Q and P implies P ∨ R
        )
        -- Case Q ∧ R
        (fun h_qr : Fcomp.STLC.And Q R =>
          let hq := And.left h_qr
          let hr := And.right h_qr
          let h_pq : Fcomp.STLC.Or P Q := Or.inr hq
          let h_pr : Fcomp.STLC.Or P R := Or.inr hr
          And.intro h_pq h_pr -- Q ∧ R implies P ∨ Q and P ∨ R
        )
    )
    -- Backward direction: (P ∨ Q) ∧ (P ∨ R) → P ∨ (Q ∧ R)
    (fun h_and_ors : Fcomp.STLC.And (Fcomp.STLC.Or P Q) (Fcomp.STLC.Or P R) =>
      let h_pq := And.left h_and_ors
      let h_pr := And.right h_and_ors
      Or.elim h_pq
        -- Case P (from P ∨ Q)
        (fun hp : P => Or.inl hp) -- If P holds, then P ∨ (Q ∧ R) holds
        -- Case Q (from P ∨ Q)
        (fun hq : Q =>
          -- We also know P ∨ R holds. We need to use it.
          Or.elim h_pr
            -- Case P (from P ∨ R)
            (fun hp' : P => Or.inl hp') -- If P holds, then P ∨ (Q ∧ R) holds
            -- Case R (from P ∨ R)
            (fun hr : R =>
              -- Here we have Q and R
              Or.inr (And.intro hq hr) -- Q ∧ R, so P ∨ (Q ∧ R) holds
            )
        )
    )

/-! ### De Morgan's Law (Intuitionistic) -/

/-- Theorem: De Morgan's Law (¬(P ∨ Q) ↔ (¬P ∧ ¬Q)) -/
theorem de_morgan_not_or_not_and_not (P Q : Prop) :
  Fcomp.STLC.Iff
    (Fcomp.STLC.Not (Fcomp.STLC.Or P Q))
    (Fcomp.STLC.And (Fcomp.STLC.Not P) (Fcomp.STLC.Not Q)) :=
  Iff.intro
    -- Forward direction: ¬(P ∨ Q) → (¬P ∧ ¬Q)
    (fun h_not_porq : Fcomp.STLC.Not (Fcomp.STLC.Or P Q) =>
      -- We need to prove ¬P and ¬Q
      let hnp : Fcomp.STLC.Not P := fun hp : P => h_not_porq (Or.inl hp)
      let hnq : Fcomp.STLC.Not Q := fun hq : Q => h_not_porq (Or.inr hq)
      And.intro hnp hnq
    )
    -- Backward direction: (¬P ∧ ¬Q) → ¬(P ∨ Q)
    (fun h_npandnq : Fcomp.STLC.And (Fcomp.STLC.Not P) (Fcomp.STLC.Not Q) =>
      let hnp := And.left h_npandnq
      let hnq := And.right h_npandnq
      -- We need to prove ¬(P ∨ Q), which is (P ∨ Q) → False
      fun h_porq : Fcomp.STLC.Or P Q =>
      Or.elim h_porq
        (fun hp : P => hnp hp) -- Case P: ¬P gives False
        (fun hq : Q => hnq hq) -- Case Q: ¬Q gives False
    )

/-! ### Modus Tollens (Intuitionistic) -/

/-- Theorem: Modus Tollens ((P → Q) → (¬Q → ¬P)) -/
theorem modus_tollens (P Q : Prop) : (P → Q) → (Fcomp.STLC.Not Q → Fcomp.STLC.Not P) :=
  fun h_p_implies_q : P → Q =>
  fun h_not_q : Fcomp.STLC.Not Q =>
  fun hp : P =>
  let hq : Q := h_p_implies_q hp -- Derive Q from P
  h_not_q hq -- Apply ¬Q to Q to get False

/-! ### Currying -/

/-- Theorem: Currying ((P ∧ Q → R) ↔ (P → Q → R)) -/
theorem curry_equiv (P Q R : Prop) :
  Fcomp.STLC.Iff
    (Fcomp.STLC.And P Q → R)
    (P → Q → R) :=
  Iff.intro
    -- Forward direction: (P ∧ Q → R) → (P → Q → R)
    (fun h_pandq_implies_r : Fcomp.STLC.And P Q → R =>
      fun hp : P =>
      fun hq : Q =>
      h_pandq_implies_r (And.intro hp hq)
    )
    -- Backward direction: (P → Q → R) → (P ∧ Q → R)
    (fun h_p_implies_q_implies_r : P → Q → R =>
      fun h_pandq : Fcomp.STLC.And P Q =>
      let hp := And.left h_pandq
      let hq := And.right h_pandq
      h_p_implies_q_implies_r hp hq
    )

end Fcomp.STLC
