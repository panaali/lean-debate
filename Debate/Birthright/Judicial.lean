import Debate.Protocol

/-!
# Judicial branch: Harlan's dissents, and predicting the Supreme Court

Two arguments about courts, one from each side, failing in the same way: an authority
premise doing work that only a substantive premise can do.
-/

namespace Debate.Birthright.Judicial

/-! ## Cooper on Justice Harlan

Cooper: Harlan dissented in *Plessy* and history vindicated him; Harlan also dissented in
*Wong Kim Ark*; so *Wong Kim Ark* was wrongly decided. -/

namespace Harlan

structure Vocab where
  Case : Type
  Judge : Type
  harlan : Judge
  plessy : Case
  wongKimArk : Case
  Dissented : Judge → Case → Prop
  /-- History came to agree with the dissent. -/
  DissentVindicated : Judge → Case → Prop
  RightlyDecided : Case → Prop

/-- **[SHARED / DEFINITION].** If history vindicated the dissent in a case, the case was
wrongly decided. Both sides use the *Plessy* example this way, so it is common ground.

Including it matters: it stops the gap below from being won cheaply. The countermodel has
to honour the very link Cooper is relying on and *still* break his argument. -/
structure Frame extends Vocab where
  vindication_means_wrong :
    ∀ (j : Judge) (c : Case), DissentVindicated j c → ¬ RightlyDecided c

/-- **C1 [Cooper].** Harlan dissented in *Plessy*. -/
def dissentedPlessy (V : Vocab) : Prop := V.Dissented V.harlan V.plessy
/-- **C2 [Cooper, HISTORICAL].** That dissent was vindicated. -/
def vindicatedPlessy (V : Vocab) : Prop := V.DissentVindicated V.harlan V.plessy
/-- **C3 [Cooper].** Harlan also dissented in *Wong Kim Ark*. -/
def dissentedWKA (V : Vocab) : Prop := V.Dissented V.harlan V.wongKimArk
/-- **C4 [Cooper, conclusion].** *Wong Kim Ark* was wrongly decided. -/
def wkaWronglyDecided (V : Vocab) : Prop := ¬ V.RightlyDecided V.wongKimArk

/-- **C5 [extracted, UNSUPPORTED].** Whenever Harlan dissented, the case was wrongly
decided. Stating it out loud is most of the refutation — no one would approve this — and
that is the point of making the protocol extract it. -/
def harlanAlwaysRight (V : Vocab) : Prop :=
  ∀ c : V.Case, V.Dissented V.harlan c → ¬ V.RightlyDecided c

/-- A world where Harlan dissents in both cases, is vindicated in *Plessy*, and *Wong Kim
Ark* is nevertheless rightly decided. It respects the shared vindication link. -/
def mixedVocab : Vocab where
  Case := Bool
  Judge := Unit
  harlan := ()
  plessy := false
  wongKimArk := true
  Dissented := fun _ _ => True
  DissentVindicated := fun _ c => c = false
  RightlyDecided := fun c => c = true

def mixedFrame : Frame where
  toVocab := mixedVocab
  vindication_means_wrong := fun _ _ hv hr => Bool.noConfusion (hv.symm.trans hr)

/-- **GAP.** Being vindicated in one case is not being vindicated in another. A judge's
record is not a premise about the merits of a different question. -/
theorem gap_harlanAuthority :
    ¬ ∀ F : Frame, dissentedPlessy F.toVocab → vindicatedPlessy F.toVocab →
        dissentedWKA F.toVocab → wkaWronglyDecided F.toVocab :=
  fun h => h mixedFrame trivial rfl trivial rfl

/-- **CERTIFIED, on an unacceptable premise.** The argument is valid given C5 and only
given C5. The protocol's reply is therefore: either approve "Harlan was right whenever he
dissented", or state the substantive premise from Harlan's *reasoning* that your
conclusion actually rests on.

That second route is the productive one, and it does not stay in this branch: Harlan's
reasoning in *Wong Kim Ark* is an allegiance reading of the jurisdiction clause, which is
`K_exclusiveReading` in the constitutional branch. So the protocol's effect here is to
delete a rhetorical shortcut and route the argument back to the node where the debate was
already happening. -/
theorem certified_harlanAuthority (F : Frame)
    (h5 : harlanAlwaysRight F.toVocab) (h3 : dissentedWKA F.toVocab) :
    wkaWronglyDecided F.toVocab :=
  h5 F.wongKimArk h3

end Harlan

/-! ## Mayes on how the courts will rule

Mayes: every judge who has looked at this has ruled against the pro-motion position, and
they will keep doing so up to the Supreme Court. -/

namespace Prediction

structure Vocab where
  Ruling : Type
  /-- Already handed down at the time of the debate. -/
  AlreadyDecided : Ruling → Prop
  /-- Went against the pro-motion position. -/
  Against : Ruling → Prop
  /-- The Supreme Court ruling still to come. -/
  scotus : Ruling

/-- **P1 [Mayes, EMPIRICAL].** Every ruling so far has gone against the position. -/
def allSoFarAgainst (V : Vocab) : Prop := ∀ r : V.Ruling, V.AlreadyDecided r → V.Against r
/-- **P2.** The Supreme Court has not ruled yet — this is what makes it a prediction. -/
def scotusPending (V : Vocab) : Prop := ¬ V.AlreadyDecided V.scotus
/-- **P3 [Mayes, conclusion as stated].** It will go the same way. -/
def scotusWillBeAgainst (V : Vocab) : Prop := V.Against V.scotus

/-- **P4 [extracted, UNSUPPORTED].** All rulings on this question agree. -/
def rulingsUniform (V : Vocab) : Prop := ∀ r₁ r₂ : V.Ruling, V.Against r₁ → V.Against r₂

def breakVocab : Vocab where
  Ruling := Bool
  AlreadyDecided := fun r => r = false
  Against := fun r => r = false
  scotus := true

/-- **GAP.** A run of past rulings is not a premise about a future one. No amount of
lower-court unanimity deductively constrains a court that has not ruled. -/
theorem gap_prediction :
    ¬ ∀ V : Vocab, allSoFarAgainst V → scotusPending V → scotusWillBeAgainst V :=
  fun h => Bool.noConfusion
    (h breakVocab (fun _ hd => hd) (fun hd => Bool.noConfusion hd))

/-- **CERTIFIED, on an unacceptable premise.** Deductive validity is purchasable here only
at the price of P4, which asserts that courts cannot disagree — plainly false, and it
would make the pending case pointless. -/
theorem certified_prediction (V : Vocab)
    (h4 : rulingsUniform V) (h : ∃ r : V.Ruling, V.AlreadyDecided r ∧ V.Against r) :
    scotusWillBeAgainst V :=
  match h with | ⟨r, _, hag⟩ => h4 r V.scotus hag

/-- **RECLASSIFIED.** The protocol's actual output here is not a rejection. Mayes is not
making a deductive claim and should not be scored as if she were; the honest label is
`PROBABILISTIC`, and the claim becomes that the past rulings raise the probability of the
future one. That is a perfectly good thing to assert, it is what she meant, and it moves
the dispute to the evidence and base-rate layer where it belongs.

Recording the reclassification as a `def` rather than a `theorem` is deliberate: this node
is asserted, not proved, and nothing in the development may cite it as established. -/
def scotusProbablyAgainst : String :=
  "P(SCOTUS rules against | all prior rulings against) > P(SCOTUS rules against)"

end Prediction

end Debate.Birthright.Judicial
