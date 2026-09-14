import Debate.Protocol

/-!
# Death penalty, the alternative: life without parole

Blecker: corrections officers see their job as safety, not punishment; lifers get
television, films, recreation; there is no punishment going on; the death penalty is the
closest thing to serious punishment left. Scheck: maximum-security prison is violent and
terrible. Rust-Tierney: whether life punishes enough is a different conversation; the
moderator agreed.

Finding: the hours of footage reduce to one proportionality premise, which Blecker does
state (R35), once he concedes that loss of liberty is punishment (R31). The prison
conditions do no logical work at all.
-/

namespace Debate.DeathPenalty.Alternative

structure Vocab where
  Person : Type
  someone : Person
  WorstOfWorst : Person → Prop
  /-- Life without parole is a sufficient punishment for p. -/
  LWOPSufficientFor : Person → Prop
  /-- Life in prison is relatively comfortable (Blecker's footage). -/
  LifeComfortable : Prop
  /-- Loss of liberty is punishment (Blecker concedes). -/
  LossOfLibertyIsPunishment : Prop
  /-- The worst crime deserves the worst available punishment. -/
  ProportionalityRequiresWorst : Prop
  /-- Death is the worst available punishment. -/
  DeathIsWorstAvailable : Prop

/-- **R5 [Blecker, EMPIRICAL].** Life is comfortable. Scheck denies (S29). Evidence layer. -/
def R5 (V : Vocab) : Prop := V.LifeComfortable
/-- **R31 [Blecker, NORMATIVE, conceded].** Loss of liberty is punishment. -/
def R31 (V : Vocab) : Prop := V.LossOfLibertyIsPunishment
/-- **R35 [Blecker, NORMATIVE].** Proportionality: the worst deserve the worst available. -/
def R35 (V : Vocab) : Prop :=
  V.ProportionalityRequiresWorst ∧ V.DeathIsWorstAvailable ∧
  ∀ p : V.Person, V.WorstOfWorst p → ¬ V.LWOPSufficientFor p
/-- **R36 [Blecker, conclusion].** For some person life is not sufficient. -/
def R36 (V : Vocab) : Prop := ∃ p : V.Person, ¬ V.LWOPSufficientFor p

/-- A comfortable prison in which life is nonetheless sufficient for everyone. -/
def comfortableVocab : Vocab where
  Person := Unit
  someone := ()
  WorstOfWorst := fun _ => False
  LWOPSufficientFor := fun _ => True
  LifeComfortable := True
  LossOfLibertyIsPunishment := True
  ProportionalityRequiresWorst := True
  DeathIsWorstAvailable := True

/-- **GAP.** Comfortable conditions do not deliver "life is insufficient for someone".
`comfortableVocab` is comfortable and sufficient for all. The footage is not an argument. -/
theorem gap_conditionsToInsufficient : ¬ ∀ V : Vocab, R5 V → R36 V :=
  fun h => match h comfortableVocab trivial with | ⟨_, hn⟩ => hn trivial

/-- **CERTIFIED.** With R35 and one worst-of-worst person, life is insufficient for that
person. Every premise is normative and stated; the conditions are not among them. -/
theorem certified_proportionality (V : Vocab) (h35 : R35 V)
    (hw : ∃ p : V.Person, V.WorstOfWorst p) : R36 V :=
  match hw with | ⟨p, hp⟩ => ⟨p, h35.2.2 p hp⟩

/-- **COMPATIBLE.** "Life is comfortable" and "maximum security is violent" are a factual
clash on the same proposition and go to the evidence layer; but Blecker's conclusion R36
is compatible with Scheck's denial of comfort, because R36 does not depend on it. -/
theorem compatible_R36_notComfortable : ∃ V : Vocab, R36 V ∧ ¬ R5 V :=
  ⟨{ comfortableVocab with LWOPSufficientFor := fun _ => False, LifeComfortable := False },
    ⟨(), fun h => h⟩, fun h => h⟩

end Debate.DeathPenalty.Alternative
