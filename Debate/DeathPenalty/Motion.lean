import Debate.Protocol

/-!
# Death penalty, the motion: "Abolish the death penalty"

The moderator opened the second round with the question the protocol would have asked
first: if every defect you name were fixed, would you still abolish? Rust-Tierney and
Scheck answered that it cannot be fixed. That answer substitutes a prediction for the
value premise the question was after.

Findings: the For side's whole case reaches the motion only through a bridge it never
states, and in the fixed world it needs a premise it declined to assert. The Against side
did state its bridge (Blecker's R17: justice warrants accepting small risks). The two
sides are asymmetric on exactly the point the moderator probed.
-/

namespace Debate.DeathPenalty.Motion

structure Vocab where
  /-- The identified defects: error risk, race effect, arbitrariness. -/
  ErrorRisk : Prop
  RaceEffect : Prop
  Arbitrary : Prop
  /-- The system can be fixed (Rust-Tierney and Scheck: no). -/
  Fixable : Prop
  /-- State killing is wrong in itself, independent of the defects. -/
  StateKillingWrongPerSe : Prop
  /-- Some people deserve death and justice warrants accepting small risks to deliver it. -/
  JusticeWarrantsRisk : Prop
  Abolish : Prop

/-- The fixed world of the moderator's hypothetical. -/
def Fixed (V : Vocab) : Prop := ¬ V.ErrorRisk ∧ ¬ V.RaceEffect ∧ ¬ V.Arbitrary

/-- **F-B [extracted, NORMATIVE].** A penalty with any of these defects should be
abolished. The For side's bridge from every empirical branch to the motion. -/
def F_bridge (V : Vocab) : Prop := (V.ErrorRisk ∨ V.RaceEffect ∨ V.Arbitrary) → V.Abolish
/-- **N-F [never asserted, NORMATIVE].** State killing is wrong per se, so abolish even
when fixed. Scheck mentions that many people hold it (S22); neither speaker asserts it. -/
def N_perSe (V : Vocab) : Prop := V.StateKillingWrongPerSe → V.Abolish
/-- **D13 [Rust-Tierney, PROBABILISTIC].** It cannot be fixed. -/
def D13 (V : Vocab) : Prop := ¬ V.Fixable
/-- **R17 [Blecker, NORMATIVE, stated].** Justice warrants accepting small risks. -/
def R17 (V : Vocab) : Prop := V.JusticeWarrantsRisk

/-- The fixed world, with the For side's bridge honoured, and no abolition. -/
def fixedVocab : Vocab where
  ErrorRisk := False
  RaceEffect := False
  Arbitrary := False
  Fixable := True
  StateKillingWrongPerSe := False
  JusticeWarrantsRisk := True
  Abolish := False

/-- **CERTIFIED.** With F-B, any of the defects delivers the motion. This is the For side's
actual route, and F-B is the premise that carries it. -/
theorem certified_defectsToAbolish (V : Vocab) (hb : F_bridge V)
    (hd : V.ErrorRisk ∨ V.RaceEffect ∨ V.Arbitrary) : V.Abolish :=
  hb hd

/-- **GAP.** In the fixed world the For side's bridge delivers nothing. This is the
moderator's hypothetical, formalised: it asked for N-F and got D13. -/
theorem gap_fixed : ¬ ∀ V : Vocab, F_bridge V → Fixed V → V.Abolish :=
  fun h => h fixedVocab (fun hd => hd.elim id (fun hd => hd.elim id id))
    ⟨fun hx => hx, fun hx => hx, fun hx => hx⟩ |>.elim

/-- **CERTIFIED.** With N-F and its antecedent, abolition follows in the fixed world too. -/
theorem certified_fixedWithPerSe (V : Vocab) (hn : N_perSe V) (hw : V.StateKillingWrongPerSe) :
    V.Abolish :=
  hn hw

/-- **COMPATIBLE.** "It cannot be fixed" and "if it were fixed it should be kept" hold
together. D13 does not answer the hypothetical; it changes the subject from a value to a
prediction. -/
theorem compatible_D13_keepIfFixed :
    ∃ V : Vocab, D13 V ∧ (Fixed V → ¬ V.Abolish) :=
  ⟨{ fixedVocab with Fixable := False }, fun h => h, fun _ h => h⟩

/-- **POSITION WITNESS (For).** The For side's whole position is satisfiable. -/
theorem position_witness_for :
    ∃ V : Vocab, F_bridge V ∧ V.ErrorRisk ∧ D13 V ∧ V.Abolish :=
  ⟨{ fixedVocab with ErrorRisk := True, Fixable := False, Abolish := True },
    fun _ => trivial, trivial, fun h => h, trivial⟩

/-- **POSITION WITNESS (Against).** The Against side's whole position is satisfiable. -/
theorem position_witness_against :
    ∃ V : Vocab, R17 V ∧ V.Fixable ∧ ¬ V.Abolish :=
  ⟨fixedVocab, trivial, trivial, fun h => h⟩

end Debate.DeathPenalty.Motion
