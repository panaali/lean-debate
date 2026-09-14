import Debate.Protocol

/-!
# Death penalty, race branch

Rust-Tierney: forty years of studies show race of victim is the most reliable predictor of
a death sentence; the system values some lives more; therefore abolish. Scheidegger: the
effect vanishes under full controls; the studies are soft science. Blecker: the effect is
real but does not show devaluation of Black life; and it comes from how the penalty is
defined (the robbery aggravator), so removing that aggravator would remove it. Scheck:
that is not going to happen.

Findings: whether the effect exists is an evidence-layer question the two sides simply
assert against each other; Blecker and Rust-Tierney do not disagree about its existence;
and "abolish" needs a premise that disparity is a reason to abolish rather than equalize.
-/

namespace Debate.DeathPenalty.Race

structure Vocab where
  /-- Race of victim predicts death sentences after legitimate controls. -/
  RaceOfVictimEffect : Prop
  /-- The effect shows the system values white lives more (Rust-Tierney's reading). -/
  EffectShowsDevaluation : Prop
  /-- The disparity is removable by redefining the offence (Blecker). -/
  RemovableByRedefinition : Prop
  /-- The redefinition will in fact happen (Scheck denies). -/
  RedefinitionWillHappen : Prop
  /-- A disparity in whom the penalty is sought against is a reason to abolish rather than
  to equalize. -/
  DisparityIsReasonToAbolish : Prop
  Abolish : Prop

/-- **D8 [Rust-Tierney, EMPIRICAL].** The effect exists. Scheidegger denies it (K22); Blecker
accepts it (R21). For the evidence layer. -/
def D8 (V : Vocab) : Prop := V.RaceOfVictimEffect
/-- **D-R [extracted, NORMATIVE].** Disparity is a reason to abolish, not to equalize. -/
def D_reason (V : Vocab) : Prop := V.DisparityIsReasonToAbolish
/-- **R21 [Blecker, INTERPRETIVE].** The effect does not show devaluation. -/
def R21 (V : Vocab) : Prop := V.RaceOfVictimEffect ∧ ¬ V.EffectShowsDevaluation
/-- **R22 [Blecker, EMPIRICAL].** Removable by redefinition. -/
def R22 (V : Vocab) : Prop := V.RemovableByRedefinition
/-- **S24 [Scheck, PROBABILISTIC].** It will not happen. -/
def S24 (V : Vocab) : Prop := ¬ V.RedefinitionWillHappen

def equalizeVocab : Vocab where
  RaceOfVictimEffect := True
  EffectShowsDevaluation := False
  RemovableByRedefinition := True
  RedefinitionWillHappen := False
  DisparityIsReasonToAbolish := False
  Abolish := False

/-- **GAP.** The effect, granted, does not deliver abolition; `equalizeVocab` has the effect
and answers it by redefinition. -/
theorem gap_effectToAbolish : ¬ ∀ V : Vocab, D8 V → V.Abolish :=
  fun h => h equalizeVocab trivial

/-- **CERTIFIED.** With D-R and the bridge. -/
theorem certified_effectToAbolish (V : Vocab) (hr : D_reason V)
    (hb : V.DisparityIsReasonToAbolish → V.RaceOfVictimEffect → V.Abolish) (he : D8 V) :
    V.Abolish :=
  hb hr he

/-- **COMPATIBLE.** Rust-Tierney's effect claim and Blecker's "not devaluation" hold
together; Blecker grants the effect. The dispute between them is the interpretive node
`EffectShowsDevaluation`, not the fact. -/
theorem compatible_D8_R21 : ∃ V : Vocab, D8 V ∧ R21 V :=
  ⟨equalizeVocab, trivial, trivial, fun h => h⟩

/-- **COMPATIBLE.** "Removable by redefinition" and "it will not happen" hold together.
Scheck's reply to Blecker is about feasibility, not about the mechanism. -/
theorem compatible_R22_S24 : ∃ V : Vocab, R22 V ∧ S24 V :=
  ⟨equalizeVocab, trivial, fun h => h⟩

end Debate.DeathPenalty.Race
