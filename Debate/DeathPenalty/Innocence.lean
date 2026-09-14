import Debate.Protocol

/-!
# Death penalty, innocence branch

Scheck: innocents have been executed, the error rate is about 4.1 percent, so the risk is
unacceptable and the penalty should be abolished. Blecker: there is no 4 percent rate; we
accept tiny risks of death for convenience every day, so we should accept a tiny risk for
justice. Scheidegger: an innocent on death row is more likely to be exonerated than an
innocent lifer, because death sentences bring funded review.

The moderator asked the question the protocol would ask: what error rate would be
tolerable? Neither side answered it. That unanswered node is the threshold premise below.
-/

namespace Debate.DeathPenalty.Innocence

structure Vocab where
  Person : Type
  someone : Person
  Innocent : Person → Prop
  Executed : Person → Prop
  /-- The risk of executing an innocent is unacceptable. -/
  RiskUnacceptable : Prop
  /-- The risk is small enough to be accepted for the sake of justice (Blecker). -/
  RiskInfinitesimal : Prop
  /-- We accept comparably small risks of death for convenience (Blecker's premise). -/
  AcceptSmallRisksForConvenience : Prop
  /-- An innocent under a death sentence is more likely to be exonerated than an innocent
  serving life, because death sentences bring funded review (Scheidegger). -/
  MoreLikelyExoneratedOnDeathRow : Prop
  /-- An innocent person is better off with a death sentence than with life (Scheidegger's
  conclusion). -/
  InnocentBetterOffOnDeathRow : Prop

/-- **S13 [Scheck, EMPIRICAL].** At least one innocent person has been executed. -/
def S13 (V : Vocab) : Prop := ∃ p : V.Person, V.Innocent p ∧ V.Executed p

/-- **S-T [extracted, NORMATIVE].** If any innocent has been executed, the risk is
unacceptable. This is the threshold the moderator asked for and nobody stated: it says
the tolerable rate is zero. -/
def S_threshold (V : Vocab) : Prop := S13 V → V.RiskUnacceptable

/-- **B-T [extracted, NORMATIVE].** A risk acceptable for convenience is acceptable for
justice. This is what Blecker's ceiling-and-Broadway analogy asserts without stating. -/
def B_transfer (V : Vocab) : Prop :=
  V.AcceptSmallRisksForConvenience → V.RiskInfinitesimal → ¬ V.RiskUnacceptable

/-- **K-U [extracted, EMPIRICAL].** Funded review catches errors before execution often
enough that exoneration prospects outweigh the execution risk. -/
def K_reviewDominates (V : Vocab) : Prop :=
  V.MoreLikelyExoneratedOnDeathRow → V.InnocentBetterOffOnDeathRow

/-- A world with an executed innocent, a tiny stated risk, small risks accepted for
convenience, and the risk nonetheless judged acceptable. -/
def acceptVocab : Vocab where
  Person := Unit
  someone := ()
  Innocent := fun _ => True
  Executed := fun _ => True
  RiskUnacceptable := False
  RiskInfinitesimal := True
  AcceptSmallRisksForConvenience := True
  MoreLikelyExoneratedOnDeathRow := True
  InnocentBetterOffOnDeathRow := False

/-- Same facts, opposite judgement: the risk is unacceptable. -/
def rejectVocab : Vocab where
  Person := Unit
  someone := ()
  Innocent := fun _ => True
  Executed := fun _ => True
  RiskUnacceptable := True
  RiskInfinitesimal := True
  AcceptSmallRisksForConvenience := True
  MoreLikelyExoneratedOnDeathRow := True
  InnocentBetterOffOnDeathRow := True

/-- **GAP.** That an innocent was executed does not by itself make the risk unacceptable.
The step needs a threshold, and the threshold is a value judgement. -/
theorem gap_executedToUnacceptable : ¬ ∀ V : Vocab, S13 V → V.RiskUnacceptable :=
  fun h => h acceptVocab ⟨(), trivial, trivial⟩

/-- **CERTIFIED.** With the zero-tolerance threshold the argument is valid. -/
theorem certified_withThreshold (V : Vocab) (ht : S_threshold V) (hs : S13 V) :
    V.RiskUnacceptable :=
  ht hs

/-- **GAP.** Blecker's analogy: accepting small risks for convenience does not by itself
make the execution risk acceptable. `rejectVocab` accepts the convenience risks, has a
tiny execution risk, and still judges it unacceptable. -/
theorem gap_blecker :
    ¬ ∀ V : Vocab, V.AcceptSmallRisksForConvenience → V.RiskInfinitesimal →
        ¬ V.RiskUnacceptable :=
  fun h => h rejectVocab trivial trivial trivial

/-- **CERTIFIED.** With the transfer premise B-T the analogy carries, and the whole
ceiling-and-Broadway passage reduces to that one premise. -/
theorem certified_blecker (V : Vocab) (hb : B_transfer V)
    (hc : V.AcceptSmallRisksForConvenience) (hi : V.RiskInfinitesimal) :
    ¬ V.RiskUnacceptable :=
  hb hc hi

/-- **COMPATIBLE.** "An innocent has been executed" and "the risk is infinitesimal" hold
together. An existence claim does not contradict a rate claim, though the exchange in the
room treated Scheck's named cases as answering Blecker's "there is no 4 percent". The
actual clash is between two rate claims, 4.1 percent versus infinitesimal, and that is an
evidence-layer question. -/
theorem compatible_executedAndInfinitesimal :
    ∃ V : Vocab, S13 V ∧ V.RiskInfinitesimal :=
  ⟨acceptVocab, ⟨(), trivial, trivial⟩, trivial⟩

/-- **GAP.** Funded review on death row does not by itself make an innocent better off
there. The step needs the premise that review catches errors before execution often
enough to outweigh the execution risk, which Scheidegger never states. -/
theorem gap_reviewToBetterOff :
    ¬ ∀ V : Vocab, V.MoreLikelyExoneratedOnDeathRow → V.InnocentBetterOffOnDeathRow :=
  fun h => h acceptVocab trivial

/-- **CERTIFIED.** With K-U it follows. -/
theorem certified_reviewToBetterOff (V : Vocab) (hk : K_reviewDominates V)
    (hm : V.MoreLikelyExoneratedOnDeathRow) : V.InnocentBetterOffOnDeathRow :=
  hk hm

end Debate.DeathPenalty.Innocence
