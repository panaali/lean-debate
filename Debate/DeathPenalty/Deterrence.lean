import Debate.Protocol

/-!
# Death penalty, deterrence branch

Scheck: the National Academy of Sciences found no evidence of deterrence, and if the
penalty is justified by deterrence and there is no evidence, abolition wins that point.
Scheidegger: deterrence is unproved either way and has not been disproved; incentives
matter, so a death penalty should deter; some studies find 5 to 18 lives saved per
execution. Blecker and Scheidegger both add that justice alone would justify the penalty.

Two things the formalization shows. The sharpest exchange, "no evidence" against "not
disproved", is not a disagreement. And Scheck's "we win that point" needs a premise that
both his opponents explicitly deny and he never states.
-/

namespace Debate.DeathPenalty.Deterrence

structure Vocab where
  /-- There is no persuasive evidence that the death penalty deters (Scheck, NAS). -/
  NoPersuasiveEvidence : Prop
  /-- The deterrent effect has been disproved. -/
  DeterrenceDisproved : Prop
  /-- The death penalty in fact deters. -/
  DeterrentEffectExists : Prop
  /-- Incentives matter: raising the cost of an act reduces how many choose it. -/
  IncentivesMatter : Prop
  /-- Prospective capital offenders perceive and weigh the difference between death and
  life (denied by Scheck and Rust-Tierney for the relevant population). -/
  OffendersPerceiveMargin : Prop
  /-- The death penalty's justification requires deterrence. -/
  JustificationRequiresDeterrence : Prop
  /-- The death penalty is justified. -/
  Justified : Prop
  /-- States that execute most have higher homicide rates (Scheck, Rust-Tierney). -/
  HighExecutionStatesHigherHomicide : Prop
  /-- Other determinants of homicide are comparable across the compared states. -/
  StatesComparable : Prop

/-- **S4 [Scheck, EMPIRICAL].** -/
def S4 (V : Vocab) : Prop := V.NoPersuasiveEvidence
/-- **K6 [Scheidegger, EMPIRICAL].** Deterrence has not been disproved. -/
def K6 (V : Vocab) : Prop := ¬ V.DeterrenceDisproved
/-- **S-D [extracted, NORMATIVE].** The penalty's justification requires deterrence.
Never stated by Scheck; explicitly denied by Scheidegger (K27) and Blecker (R12). -/
def S_needsDeterrence (V : Vocab) : Prop := V.JustificationRequiresDeterrence
/-- **K-P [extracted, EMPIRICAL].** Offenders perceive the margin. -/
def K_perceive (V : Vocab) : Prop := V.OffendersPerceiveMargin
/-- **S-C [extracted, EMPIRICAL].** The compared states are otherwise comparable. -/
def S_comparable (V : Vocab) : Prop := V.StatesComparable

/-- A world with no persuasive evidence either way, incentives mattering, the penalty
justified by desert, and high-execution states with higher homicide but not comparable. -/
def desertVocab : Vocab where
  NoPersuasiveEvidence := True
  DeterrenceDisproved := False
  DeterrentEffectExists := False
  IncentivesMatter := True
  OffendersPerceiveMargin := False
  JustificationRequiresDeterrence := False
  Justified := True
  HighExecutionStatesHigherHomicide := True
  StatesComparable := False

/-- **COMPATIBLE.** "No persuasive evidence that it deters" and "deterrence has not been
disproved" hold together; that is what "unproved either way" means. The audience heard a
rebuttal. -/
theorem compatible_noEvidenceNotDisproved : ∃ V : Vocab, S4 V ∧ K6 V :=
  ⟨desertVocab, trivial, fun h => h⟩

/-- **GAP.** From "no persuasive evidence of deterrence" nothing follows about whether the
penalty is justified. `desertVocab` has no evidence and a justified penalty. -/
theorem gap_noEvidenceToUnjustified : ¬ ∀ V : Vocab, S4 V → ¬ V.Justified :=
  fun h => h desertVocab trivial trivial

/-- **CERTIFIED.** With S-D, "no evidence" plus "justification requires deterrence" plus the
further premise that evidence is required to rest a justification on deterrence does the
work. The extracted premise is the one both opponents reject on the record. -/
theorem certified_noEvidenceToUnjustified (V : Vocab)
    (hd : S_needsDeterrence V)
    (hr : V.JustificationRequiresDeterrence → V.NoPersuasiveEvidence → ¬ V.Justified)
    (hs : S4 V) : ¬ V.Justified :=
  hr hd hs

/-- **GAP.** Incentives mattering in general does not deliver a deterrent effect for this
population. -/
theorem gap_incentivesToDeterrence :
    ¬ ∀ V : Vocab, V.IncentivesMatter → V.DeterrentEffectExists :=
  fun h => h desertVocab trivial

/-- **CERTIFIED.** With K-P and the bridge that perceived incentives produce the effect. -/
theorem certified_incentivesToDeterrence (V : Vocab)
    (hp : K_perceive V)
    (hb : V.IncentivesMatter → V.OffendersPerceiveMargin → V.DeterrentEffectExists)
    (hi : V.IncentivesMatter) : V.DeterrentEffectExists :=
  hb hi hp

/-- **GAP.** Higher homicide in high-execution states does not deliver "no deterrent
effect" without a comparability premise; this is Scheidegger's correlation point,
formalised. -/
theorem gap_stateComparison :
    ¬ ∀ V : Vocab, V.HighExecutionStatesHigherHomicide → ¬ V.DeterrentEffectExists :=
  fun h => h { desertVocab with DeterrentEffectExists := True } trivial trivial

/-- **CERTIFIED.** With comparability and the bridge. -/
theorem certified_stateComparison (V : Vocab)
    (hc : S_comparable V)
    (hb : V.StatesComparable → V.HighExecutionStatesHigherHomicide → ¬ V.DeterrentEffectExists)
    (hh : V.HighExecutionStatesHigherHomicide) : ¬ V.DeterrentEffectExists :=
  hb hc hh

end Debate.DeathPenalty.Deterrence
