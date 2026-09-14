import Debate.Protocol

/-!
# Policy branch: statelessness

Mayes: ending birthright citizenship would leave a generation of children without
citizenship status — a new stateless underclass.

Krikorian: other developed countries handle this by statute; Australia grants citizenship
after ten years' residence, France lets the child opt in at eighteen. So the problem is
administrative, not inherent.

To a listener these land as claim and rebuttal. Whether they actually conflict depends
entirely on the quantifier in Mayes's claim, which she never has occasion to make
explicit — and the two readings behave in exactly opposite ways.
-/

namespace Debate.Birthright.Policy

structure Vocab where
  Policy : Type
  EndsBirthright : Policy → Prop
  CreatesStatelessClass : Policy → Prop
  /-- The executive order actually before the courts. -/
  eo : Policy
  /-- A delayed-choice or residence-qualification design, à la France or Australia. -/
  delayedChoice : Policy

/-- **S-∀ [Mayes, strong reading].** Any policy ending birthright citizenship creates a
stateless class. -/
def S_universal (V : Vocab) : Prop :=
  ∀ pol : V.Policy, V.EndsBirthright pol → V.CreatesStatelessClass pol

/-- **S-P [Mayes, weak reading].** The policy actually on the table does. -/
def S_particular (V : Vocab) : Prop :=
  V.EndsBirthright V.eo ∧ V.CreatesStatelessClass V.eo

/-- **S-K [Krikorian].** Some design ends birthright citizenship without creating a
stateless class. -/
def K_alternative (V : Vocab) : Prop :=
  ∃ pol : V.Policy, V.EndsBirthright pol ∧ ¬ V.CreatesStatelessClass pol

/-- Both the executive order and the delayed-choice design end birthright citizenship;
only the first creates a stateless class. -/
def mixedVocab : Vocab where
  Policy := Bool
  EndsBirthright := fun _ => True
  CreatesStatelessClass := fun p => p = true
  eo := true
  delayedChoice := false

/-- **REFUTED.** Against the strong reading, Krikorian's single design is decisive. -/
theorem krikorian_refutes_universal (V : Vocab) (h : K_alternative V) : ¬ S_universal V :=
  fun hu => match h with | ⟨pol, hends, hno⟩ => hno (hu pol hends)

/-- **COMPATIBLE.** Against the weak reading it is not a rebuttal at all. `mixedVocab` is
a world where Krikorian's alternative design exists *and* the policy actually before the
courts creates a stateless class. Both speakers are saying something true and they are
not disagreeing.

This is the single most useful verdict the system produces on this debate. In the room the
exchange reads as a decisive answer, and the audience has no way to see that its force
depends on which claim Mayes was making — a distinction never drawn, because ordinary
speech has no occasion to draw it. The protocol draws it before the exchange happens, by
asking Mayes which claim she is approving. -/
theorem compatible_particular_and_alternative :
    ∃ V : Vocab, K_alternative V ∧ S_particular V :=
  ⟨mixedVocab, ⟨false, trivial, fun h => Bool.noConfusion h⟩, trivial, rfl⟩

/-- **GAP.** The moderator's intervention, formalised. Mayes's evidence concerns the
executive order; the motion concerns ending birthright citizenship in general. Facts about
one policy do not transfer to all policies of its kind. -/
theorem gap_domainSubstitution :
    ¬ ∀ V : Vocab, S_particular V → S_universal V :=
  fun h => Bool.noConfusion ((h mixedVocab ⟨trivial, rfl⟩) false trivial)

/-- **CERTIFIED.** The narrowing the interface would offer instead of rejecting her claim:
from the particular case she does get the existential, which is enough to support "this
counts against *this* policy" without overreaching to all policies. -/
theorem certified_narrowed (V : Vocab) (h : S_particular V) :
    ∃ pol : V.Policy, V.EndsBirthright pol ∧ V.CreatesStatelessClass pol :=
  ⟨V.eo, h.1, h.2⟩

end Debate.Birthright.Policy
