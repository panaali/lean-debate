import Debate.Protocol

/-!
# The motion itself

The motion is *Should America end birthright citizenship?* Most of the debate is spent on
the constitutional branch — what the Fourteenth Amendment means, what *Wong Kim Ark* held,
what "subject to the jurisdiction thereof" meant in 1868.

That branch is about what the law currently **is**. The motion asks what we **should** do.
Article V exists, so those come apart, and neither side supplies the premise that would
connect them. This is the largest structural finding in the transcript, and it is
invisible in the room precisely because it is a gap between branches rather than a flaw
inside one.
-/

namespace Debate.Birthright.Motion

structure Vocab where
  /-- The Constitution as it stands requires birthright citizenship. -/
  ConstitutionRequires : Prop
  /-- The motion: America should end birthright citizenship. -/
  ShouldEnd : Prop
  /-- The Constitution is amendable by the Article V process. -/
  AmendableByArticleV : Prop

/-- **NB1 [extracted, NORMATIVE].** What the Constitution currently requires settles what
we should do — i.e. amendment is off the table as a matter of practical politics or of
principle. This is what the anti-motion side needs to convert its constitutional case into
a verdict on the motion. -/
def entrenchmentDecisive (V : Vocab) : Prop := V.ConstitutionRequires → ¬ V.ShouldEnd

/-- **NB2 [extracted, NORMATIVE].** Nothing constitutionally required is worth keeping for
its own sake — what the pro-motion side needs to convert a constitutional win into a
verdict on the motion. -/
def permissionIsReason (V : Vocab) : Prop := ¬ V.ConstitutionRequires → V.ShouldEnd

/-- A world in which the Constitution requires birthright citizenship, is amendable, and
should be amended. -/
def amendVocab : Vocab where
  ConstitutionRequires := True
  ShouldEnd := True
  AmendableByArticleV := True

/-- A world in which the Constitution does not require birthright citizenship and it
should be kept anyway — by statute, as a good policy. -/
def statutoryVocab : Vocab where
  ConstitutionRequires := False
  ShouldEnd := False
  AmendableByArticleV := True

/-- **GAP.** Winning the constitutional branch does not settle the motion. Even granting
Mayes and Newman everything — the clause requires birthright citizenship, *Wong Kim Ark*
was rightly decided, every judge agrees — the motion asks whether America should amend, and
that question is untouched. -/
theorem gap_isOught :
    ¬ ∀ V : Vocab, V.ConstitutionRequires → ¬ V.ShouldEnd :=
  fun h => h amendVocab trivial trivial

/-- **GAP.** And symmetrically. Even granting Krikorian and Cooper everything — the clause
never covered these children, *Wong Kim Ark* was wrong — it does not follow that America
should end birthright citizenship. Constitutional permission to end a practice is not a
reason to end it; Congress could keep it by statute. -/
theorem gap_oughtFromPermission :
    ¬ ∀ V : Vocab, ¬ V.ConstitutionRequires → V.ShouldEnd :=
  fun h => h statutoryVocab (fun hx => hx) |>.elim

/-- **CERTIFIED.** Each side's constitutional case reaches the motion only through its own
normative bridge. Both bridges are contestable, neither is stated, and — the point — they
are *different* bridges. The two sides are not even disagreeing about the same
proposition when they argue about 1868.

The practical upshot for the protocol: a debate run this way would have flagged, in the
first minute, that the constitutional dispute cannot decide the motion by itself, and
asked both sides to state their bridge. The hour that follows would then be about
something the audience is actually being asked to vote on. -/
theorem certified_bridges (V : Vocab)
    (hb : entrenchmentDecisive V) (hc : V.ConstitutionRequires) : ¬ V.ShouldEnd :=
  hb hc

theorem certified_bridges' (V : Vocab)
    (hb : permissionIsReason V) (hc : ¬ V.ConstitutionRequires) : V.ShouldEnd :=
  hb hc

end Debate.Birthright.Motion
