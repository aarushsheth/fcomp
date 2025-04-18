namespace Fcomp.STLC

/-!
  # Syntactic Propositions

  Defines the `SimpleProp` inductive type for representing the syntax of
  propositions used in the Natural Deduction system, separate from Lean's `Prop`.
-/

/--
  A syntactic representation of propositions built from variables and standard connectives.
-/
inductive SimpleProp where
  | var : String → SimpleProp
  | and : SimpleProp → SimpleProp → SimpleProp
  | or : SimpleProp → SimpleProp → SimpleProp
  | imp : SimpleProp → SimpleProp → SimpleProp
  | true_prop : SimpleProp
  | false_prop : SimpleProp
  deriving Repr, BEq

end Fcomp.STLC
