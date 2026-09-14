import Debate.Protocol

/-!
# Death penalty, desert branch

Blecker: some people deserve to die and society is obliged to execute them; they can be
identified in advance; deterrence and incapacitation are not legitimate reasons, only
desert is. Scheidegger: three reasons, justice, incapacitation, deterrence, all to be
weighed. Rust-Tierney: most homicides get justice through long sentences, so justice does
not require death. Scheck and Rust-Tierney: this is a cost-benefit policy question.
Blecker: it is not; desert is not tradeable.

Findings: the "most homicides" exchange is a quantifier non-clash; the two speakers on the
same side contradict each other on whether deterrence is a legitimate reason; and the
cost-benefit framing is itself a premise the other side denies.
-/

namespace Debate.DeathPenalty.Desert

structure Vocab where
  Person : Type
  someone : Person
  DeservesDeath : Person → Prop
  WorstOfWorst : Person → Prop
  /-- Justice is served for p by a long sentence without death. -/
  JusticeServedWithoutDeath : Person → Prop
  /-- Society is obliged to execute p. -/
  ObligedToExecute : Person → Prop
  /-- The class that deserves death can be identified in advance. -/
  IdentifiableInAdvance : Prop
  /-- The system in practice executes only those who deserve it. -/
  SystemSelectsCorrectly : Prop
  /-- Deterrence is a legitimate reason to punish. -/
  DeterrenceIsLegitimateReason : Prop
  /-- The question is decided by weighing costs against benefits. -/
  CostBenefitDecides : Prop
  /-- Desert can be traded off against costs. -/
  DesertTradeable : Prop
  CostsExceedBenefits : Prop
  Abolish : Prop
  Retain : Prop

/-- **R8a [Blecker, NORMATIVE].** Some people deserve to die. -/
def R8a (V : Vocab) : Prop := ∃ p : V.Person, V.DeservesDeath p
/-- **R8b [Blecker, NORMATIVE].** Whoever deserves death, society is obliged to execute. -/
def R8b (V : Vocab) : Prop := ∀ p : V.Person, V.DeservesDeath p → V.ObligedToExecute p
/-- **R-S [extracted, EMPIRICAL].** The system selects correctly in practice. Needed to go
from an obligation about deserving persons to retaining the institution; it is the
innocence branch's question, seen from this side. -/
def R_selects (V : Vocab) : Prop := V.SystemSelectsCorrectly
/-- **D16 [Rust-Tierney, EMPIRICAL].** For everyone not among the worst of the worst,
justice is served without death. This is what "the vast majority of homicides" states. -/
def D16 (V : Vocab) : Prop := ∀ p : V.Person, ¬ V.WorstOfWorst p → V.JusticeServedWithoutDeath p
/-- **D16' [Rust-Tierney, conclusion as stated].** Justice never requires death. -/
def D16conc (V : Vocab) : Prop := ∀ p : V.Person, V.JusticeServedWithoutDeath p
/-- **K19 [Scheidegger, NORMATIVE].** For some of the worst, justice is not served without
death. -/
def K19 (V : Vocab) : Prop := ∃ p : V.Person, V.WorstOfWorst p ∧ ¬ V.JusticeServedWithoutDeath p
/-- **K2 [Scheidegger, NORMATIVE].** Deterrence is a legitimate reason. -/
def K2 (V : Vocab) : Prop := V.DeterrenceIsLegitimateReason
/-- **R12 [Blecker, NORMATIVE].** Deterrence is not a legitimate reason. -/
def R12 (V : Vocab) : Prop := ¬ V.DeterrenceIsLegitimateReason
/-- **S1 [Scheck, framing, NORMATIVE].** Cost-benefit decides. -/
def S1 (V : Vocab) : Prop := V.CostBenefitDecides
/-- **R34 [Blecker, NORMATIVE].** Desert is not tradeable. -/
def R34 (V : Vocab) : Prop := ¬ V.DesertTradeable

/-- One worst-of-worst person unserved by life; everyone else served. Desert obligations
hold; the system does not select correctly. -/
def splitVocab : Vocab where
  Person := Bool
  someone := true
  DeservesDeath := fun b => b = true
  WorstOfWorst := fun b => b = true
  JusticeServedWithoutDeath := fun b => b = false
  ObligedToExecute := fun b => b = true
  IdentifiableInAdvance := True
  SystemSelectsCorrectly := False
  DeterrenceIsLegitimateReason := False
  CostBenefitDecides := False
  DesertTradeable := False
  CostsExceedBenefits := True
  Abolish := False
  Retain := False

/-- D16 holds in `splitVocab`: the only person not among the worst is served. -/
theorem splitD16 : D16 splitVocab :=
  fun b hb => match b with
    | true  => absurd rfl hb
    | false => rfl

/-- **CERTIFIED.** From "some deserve death" and "the deserving must be executed", society
is obliged to execute someone. Both premises are value claims and both are Blecker's. -/
theorem certified_obligation (V : Vocab) (ha : R8a V) (hb : R8b V) :
    ∃ p : V.Person, V.ObligedToExecute p :=
  match ha with | ⟨p, hd⟩ => ⟨p, hb p hd⟩

/-- **GAP.** An obligation to execute the deserving does not deliver "retain the
institution" without the premise that the institution executes the deserving. -/
theorem gap_obligationToRetain :
    ¬ ∀ V : Vocab, (∃ p : V.Person, V.ObligedToExecute p) → V.Retain :=
  fun h => h splitVocab ⟨true, rfl⟩

/-- **CERTIFIED.** With R-S and the bridge. -/
theorem certified_obligationToRetain (V : Vocab)
    (hs : R_selects V)
    (hb : V.SystemSelectsCorrectly → (∃ p : V.Person, V.ObligedToExecute p) → V.Retain)
    (ho : ∃ p : V.Person, V.ObligedToExecute p) : V.Retain :=
  hb hs ho

/-- **GAP.** "Most homicides get justice without death" does not deliver "justice never
requires death". `splitVocab` serves everyone but the one worst-of-worst. -/
theorem gap_mostToAll : ¬ ∀ V : Vocab, D16 V → D16conc V :=
  fun h => Bool.noConfusion (h splitVocab splitD16 true)

/-- **COMPATIBLE.** Rust-Tierney's premise and Scheidegger's carve-out hold together. The
exchange was not a disagreement; Scheidegger conceded the majority case and she did not
claim the worst. -/
theorem compatible_D16_K19 : ∃ V : Vocab, D16 V ∧ K19 V :=
  ⟨splitVocab, splitD16, ⟨true, rfl, fun h => Bool.noConfusion h⟩⟩

/-- **REFUTED (intra-side).** Blecker's R12 is the negation of Scheidegger's K2. The two
speakers against the motion contradict each other on whether deterrence is a legitimate
reason; the moderator noticed. -/
theorem refuted_K2_by_R12 (V : Vocab) (hr : R12 V) : ¬ K2 V := hr

/-- **GAP.** "Costs exceed benefits" does not deliver abolition unless cost-benefit
decides, and whether it decides is exactly what Blecker denies. The framing is a premise. -/
theorem gap_costBenefit : ¬ ∀ V : Vocab, V.CostsExceedBenefits → V.Abolish :=
  fun h => h splitVocab trivial

/-- **CERTIFIED.** With S1 and the bridge. -/
theorem certified_costBenefit (V : Vocab) (hf : S1 V)
    (hb : V.CostBenefitDecides → V.CostsExceedBenefits → V.Abolish)
    (hc : V.CostsExceedBenefits) : V.Abolish :=
  hb hf hc

end Debate.DeathPenalty.Desert
