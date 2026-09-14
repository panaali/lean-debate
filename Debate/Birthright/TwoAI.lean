import Debate.Protocol

/-!
# Two-AI run 1: the constitutional proposition, argued by two AI debaters

The first run of `docs/inference-protocol.md` §9. Setup, openings, rebuttals and the
formalizer's rulings are in `docs/runs/two-ai-1/`. This module is the formalizer's
encoding of what the two debaters actually asserted, after the split demands were
granted and unified.

Sibling to `Constitutional.lean` (the human debate on the same clause), not a
replacement: the two are meant to be compared, so they coexist (`README.md`, "How to
work on this").

## What happened

Both debaters attacked the signature, not each other's inferences. B took the fixed gloss
"born within US territory" literally and produced a single American Samoa witness. A
scoped "born in the United States" to where the Clause applies. The two split demands had
the same gloss and were unified into `BornInUSConst` beside `BornInUSTerritory`. After
rebuttals, every one of A's inferences was accepted as valid by B and every one of B's by
A; each side accepted every premise of the other's route. The entire disagreement is
which of two propositions P is. The kernel cannot decide that. It can show, and does,
that everything else is jointly satisfiable in one two-person world.
-/

namespace Debate.Birthright.TwoAI

structure Vocab where
  Person : Type
  someone : Person
  /-- Born anywhere under US sovereignty (the setup's fixed gloss for `BornInUS`). -/
  BornInUSTerritory : Person → Prop
  /-- Born "in the United States" in the constitutional sense as the courts construe it
  (a State, DC, an incorporated territory). A's `BornInUSProper`, B's `BornInUSConst`. -/
  BornInUSConst : Person → Prop
  SubjectToUSJurisdiction : Person → Prop
  SubjectToUSLaw : Person → Prop
  ExclusiveAllegiance : Person → Prop
  USCitizenAtBirth : Person → Prop
  /-- Born after 1941 in American Samoa (B's symbol). -/
  BornInAmericanSamoa : Person → Prop
  /-- Each parent a foreign national with no lawful status under any applicable regime
  (B's symbol). -/
  ParentsUndocumentedAliens : Person → Prop
  /-- The specific person Wong Kim Ark (A's constant). -/
  wongKimArk : Person

/-- **L1 [SHARED].** The Citizenship Clause. Both debaters read its antecedent as the
constitutional sense; the formalizer accepted that reading with both sides' consent. -/
structure Frame extends Vocab where
  citizenship_clause :
    ∀ p : Person, BornInUSConst p → SubjectToUSJurisdiction p → USCitizenAtBirth p

/-! ## The two readings of the proposition -/

/-- "Born in the US to parents without lawful status", territorial reading (B3). -/
def BTU_terr (V : Vocab) (p : V.Person) : Prop :=
  V.BornInUSTerritory p ∧ V.ParentsUndocumentedAliens p
/-- Same, constitutional reading (A9). -/
def BTU_const (V : Vocab) (p : V.Person) : Prop :=
  V.BornInUSConst p ∧ V.ParentsUndocumentedAliens p
/-- **P, territorial reading.** -/
def P_terr (V : Vocab) : Prop := ∀ p : V.Person, BTU_terr V p → V.USCitizenAtBirth p
/-- **P, constitutional reading.** -/
def P_const (V : Vocab) : Prop := ∀ p : V.Person, BTU_const V p → V.USCitizenAtBirth p

/-! ## A's claims (for P) -/

/-- **A1 [A, INTERPRETIVE, retyped from DEFINITION].** Anyone in P's territorial domain is
in the Clause's domain. This is the reading node, stated as a claim. -/
def A1 (V : Vocab) : Prop := ∀ p : V.Person, BTU_terr V p → V.BornInUSConst p
/-- **A2 [A, DEFINITION].** The constitutional sense is within the territorial sense. -/
def A2 (V : Vocab) : Prop := ∀ p : V.Person, V.BornInUSConst p → V.BornInUSTerritory p
/-- **A3 [A, EMPIRICAL].** Such children are answerable to US law. B accepts. -/
def A3 (V : Vocab) : Prop :=
  ∀ p : V.Person, V.BornInUSTerritory p → V.ParentsUndocumentedAliens p → V.SubjectToUSLaw p
/-- **A4 [A, INTERPRETIVE].** Born in the constitutional US and answerable to US law implies
subject to the jurisdiction (*Wong Kim Ark*, *Plyler*). B accepts, with reservation B10. -/
def A4 (V : Vocab) : Prop :=
  ∀ p : V.Person, V.BornInUSConst p → V.SubjectToUSLaw p → V.SubjectToUSJurisdiction p
/-- **A6 [A, EMPIRICAL].** Wong Kim Ark did not owe exclusive allegiance. -/
def A6 (V : Vocab) : Prop := ¬ V.ExclusiveAllegiance V.wongKimArk
/-- **A7 [A, INTERPRETIVE].** Wong Kim Ark was subject to the jurisdiction (the holding). -/
def A7 (V : Vocab) : Prop := V.SubjectToUSJurisdiction V.wongKimArk
/-- **A8 [A, derived].** Someone is subject to the jurisdiction without exclusive allegiance. -/
def A8 (V : Vocab) : Prop := ∃ p : V.Person, V.SubjectToUSJurisdiction p ∧ ¬ V.ExclusiveAllegiance p

/-! ## B's claims (against P) -/

/-- **B1 [B, PROBABILISTIC after downgrade].** Someone was born in American Samoa to
undocumented alien parents. Demographic inference, no named witness. -/
def B1 (V : Vocab) : Prop := ∃ p : V.Person, V.BornInAmericanSamoa p ∧ V.ParentsUndocumentedAliens p
/-- **B2 [B, EMPIRICAL].** American Samoa is US territory. -/
def B2 (V : Vocab) : Prop := ∀ p : V.Person, V.BornInAmericanSamoa p → V.BornInUSTerritory p
/-- **B4 [B, INTERPRETIVE].** Such a person is not a citizen at birth (§1408, *Tuaua*,
*Fitisemanu*). A accepts as the courts' current construction. -/
def B4 (V : Vocab) : Prop :=
  ∀ p : V.Person, V.BornInAmericanSamoa p → V.ParentsUndocumentedAliens p → ¬ V.USCitizenAtBirth p
/-- **B5 [B, INTERPRETIVE].** American Samoa is outside the Clause's "in the United States". -/
def B5 (V : Vocab) : Prop := ∀ p : V.Person, V.BornInAmericanSamoa p → ¬ V.BornInUSConst p
/-- **B7 [B, EMPIRICAL].** American Samoa-born persons are answerable to US law. -/
def B7 (V : Vocab) : Prop := ∀ p : V.Person, V.BornInAmericanSamoa p → V.SubjectToUSLaw p

/-! ## The joint world

B's own two-person model: Wong Kim Ark, and the American Samoa witness `w`. -/

def jointVocab : Vocab where
  Person := Bool
  someone := true
  BornInUSTerritory := fun _ => True
  BornInUSConst := fun b => b = true
  SubjectToUSJurisdiction := fun b => b = true
  SubjectToUSLaw := fun _ => True
  ExclusiveAllegiance := fun _ => False
  USCitizenAtBirth := fun b => b = true
  BornInAmericanSamoa := fun b => b = false
  ParentsUndocumentedAliens := fun _ => True
  wongKimArk := true

def jointFrame : Frame where
  toVocab := jointVocab
  citizenship_clause := fun _ _ hj => hj

/-! ## Verdicts -/

/-- **CERTIFIED (IA3).** A8 from A6 and A7. Blocks an exclusive-allegiance reading B never
adopted. -/
theorem certified_A8 (V : Vocab) (h6 : A6 V) (h7 : A7 V) : A8 V := ⟨V.wongKimArk, h7, h6⟩

/-- **CERTIFIED (IA2, constitutional reading).** P_const from A2, A3, A4 and L1. Every
premise was accepted by B. -/
theorem certified_Pconst (F : Frame) (h2 : A2 F.toVocab) (h3 : A3 F.toVocab) (h4 : A4 F.toVocab) :
    P_const F.toVocab :=
  fun p hp => F.citizenship_clause p hp.1 (h4 p hp.1 (h3 p (h2 p hp.1) hp.2))

/-- **GAP.** A's premises do not reach P_terr. In the joint world A2, A3, A4 and L1 hold and
the American Samoa witness is not a citizen. -/
theorem gap_A_Pterr : ¬ ∀ F : Frame, A2 F.toVocab → A3 F.toVocab → A4 F.toVocab → P_terr F.toVocab :=
  fun h => Bool.noConfusion
    (h jointFrame (fun _ _ => trivial) (fun _ _ _ => trivial) (fun _ hc _ => hc) false ⟨trivial, trivial⟩)

/-- **CERTIFIED (IB2, territorial reading).** Not P_terr from B1, B2, B4. Every premise was
accepted by A (B1 as probabilistic). -/
theorem certified_notPterr (V : Vocab) (h1 : B1 V) (h2 : B2 V) (h4 : B4 V) : ¬ P_terr V :=
  fun hp => match h1 with | ⟨w, ha, hu⟩ => h4 w ha hu (hp w ⟨h2 w ha, hu⟩)

/-- **GAP.** B's premises do not reach not-P_const. In the joint world all of B1, B2, B4,
B5, B7 hold and P_const holds. B said so itself. -/
theorem gap_B_Pconst :
    ¬ ∀ F : Frame, B1 F.toVocab → B2 F.toVocab → B4 F.toVocab → B5 F.toVocab → B7 F.toVocab →
        ¬ P_const F.toVocab :=
  fun h => h jointFrame ⟨false, rfl, trivial⟩ (fun _ _ => trivial)
    (fun _ hb _ hc => Bool.noConfusion (hb.symm.trans hc))
    (fun _ hb hc => Bool.noConfusion (hb.symm.trans hc))
    (fun _ _ => trivial) (fun _ hp => hp.1)

/-- **CERTIFIED (IA4).** From A4, B7, B4 and L1: the American Samoa witness is not in the
Clause's domain. A derives B5's instance from B4, so B cannot keep B4 and disown B5. -/
theorem certified_A11 (F : Frame) (h4 : A4 F.toVocab) (h7 : B7 F.toVocab) (hb4 : B4 F.toVocab) :
    ∀ p : F.toVocab.Person, F.toVocab.BornInAmericanSamoa p →
      F.toVocab.ParentsUndocumentedAliens p → ¬ F.toVocab.BornInUSConst p :=
  fun p ha hu hc => hb4 p ha hu (F.citizenship_clause p hc (h4 p hc (h7 p ha)))

/-- **REFUTED.** A1, the territorial-to-constitutional reading claim, is refuted by B1, B2,
B5. This is the only node the two sides actually contest, and it is refuted as A first
stated it; A withdrew it and re-entered it under the constitutional reading, where it is a
stipulation. -/
theorem refuted_A1 (V : Vocab) (h1 : B1 V) (h2 : B2 V) (h5 : B5 V) : ¬ A1 V :=
  fun hA1 => match h1 with | ⟨w, ha, hu⟩ => h5 w ha (hA1 w ⟨h2 w ha, hu⟩)

/-- **COMPATIBLE (joint position witness).** Everything both sides asserted, except the
reading node, holds together in one world, along with P_const and not-P_terr. The two
debaters were not disagreeing about anything the kernel can see. -/
theorem compatible_positions :
    ∃ F : Frame, A2 F.toVocab ∧ A3 F.toVocab ∧ A4 F.toVocab ∧ A6 F.toVocab ∧ A7 F.toVocab ∧
      B1 F.toVocab ∧ B2 F.toVocab ∧ B4 F.toVocab ∧ B5 F.toVocab ∧ B7 F.toVocab ∧
      P_const F.toVocab ∧ ¬ P_terr F.toVocab :=
  ⟨jointFrame,
    fun _ _ => trivial, fun _ _ _ => trivial, fun _ hc _ => hc, fun h => h, rfl,
    ⟨false, rfl, trivial⟩, fun _ _ => trivial,
    fun _ hb _ hc => Bool.noConfusion (hb.symm.trans hc),
    fun _ hb hc => Bool.noConfusion (hb.symm.trans hc),
    fun _ _ => trivial, fun _ hp => hp.1,
    fun hp => Bool.noConfusion (hp false ⟨trivial, trivial⟩)⟩

end Debate.Birthright.TwoAI
