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
  /-- Protected by Article V's one substantive limit (equal suffrage in the Senate). -/
  Entrenched : Prop
  /-- Ending birthright citizenship is available by some lawful process. -/
  LawfullyEndable : Prop
  /-- Keeping birthright citizenship is available by some lawful process. -/
  LawfullyKeepable : Prop

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
  Entrenched := False
  LawfullyEndable := True
  LawfullyKeepable := True

/-- A world in which the Constitution does not require birthright citizenship and it
should be kept anyway — by statute, as a good policy. -/
def statutoryVocab : Vocab where
  ConstitutionRequires := False
  ShouldEnd := False
  AmendableByArticleV := True
  Entrenched := False
  LawfullyEndable := True
  LawfullyKeepable := True

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

/-! ## Article V made load-bearing (Gödel's loophole, Suber's reading)

The field `AmendableByArticleV` was declared above and, until this section, used by no
theorem. Gödel's loophole is the reason it should be. On Peter Suber's reading (*The
Paradox of Self-Amendment*, 1990) Article V constrains procedure only, not content: any
provision not protected by Article V's single substantive limit can be lawfully removed.
The consequence for this debate is that even the purely *legal* proposition "the
Constitution requires birthright citizenship" does not deliver "it cannot lawfully be
ended". The anti-motion side's constitutional case therefore cannot rest on legality at
all; it rests on the normative bridge NB1, and only on that. Symmetrically, "the
Constitution does not require it" does not deliver "it cannot lawfully be kept", because
Congress may legislate; the pro-motion side rests only on NB2. -/

/-- **G-S [SHARED, INTERPRETIVE].** Suber's reading of Article V: if the Constitution is
amendable and the provision is not entrenched, ending it is lawfully available. Introduced
by the protocol, not by any speaker; either side may contest it as a labelled node. -/
def suber (V : Vocab) : Prop := V.AmendableByArticleV → ¬ V.Entrenched → V.LawfullyEndable

/-- **G-E [SHARED, DEFINITION].** Birthright citizenship is not among the provisions Article
V entrenches. The clause protects equal suffrage in the Senate and nothing else. -/
def notEntrenched (V : Vocab) : Prop := ¬ V.Entrenched

/-- **G-A [SHARED, DEFINITION].** The Constitution is amendable by Article V. -/
def amendable (V : Vocab) : Prop := V.AmendableByArticleV

/-- **G-C [SHARED, DEFINITION].** Where the Constitution does not require a provision,
Congress may keep it by statute. -/
def congressMayLegislate (V : Vocab) : Prop := ¬ V.ConstitutionRequires → V.LawfullyKeepable

/-- **CERTIFIED.** Under Suber's reading, ending birthright citizenship is lawfully available
even in a world where the Constitution currently requires it. -/
theorem certified_lawfullyEndable (V : Vocab)
    (hs : suber V) (ha : amendable V) (he : notEntrenched V) : V.LawfullyEndable :=
  hs ha he

/-- **GAP.** "The Constitution requires it" does not deliver "it cannot lawfully be ended".
`amendVocab` satisfies Suber's reading, amendability, non-entrenchment, and the
constitutional requirement, and ending is lawful there. So the anti-motion side's legal
victory, granted in full, leaves the motion exactly where NB1 alone can carry it. -/
theorem gap_requiresNotUnendable :
    ¬ ∀ V : Vocab, suber V → amendable V → notEntrenched V →
        V.ConstitutionRequires → ¬ V.LawfullyEndable :=
  fun h => h amendVocab (fun _ _ => trivial) trivial (fun hx => hx) trivial trivial

/-- **CERTIFIED.** Symmetrically: where the Constitution does not require it, keeping it is
lawfully available. -/
theorem certified_lawfullyKeepable (V : Vocab)
    (hc : congressMayLegislate V) (hn : ¬ V.ConstitutionRequires) : V.LawfullyKeepable :=
  hc hn

/-- **GAP.** "The Constitution does not require it" does not deliver "it cannot lawfully be
kept". The pro-motion side's legal victory, granted in full, leaves the motion exactly
where NB2 alone can carry it. -/
theorem gap_notRequiredNotUnkeepable :
    ¬ ∀ V : Vocab, congressMayLegislate V → ¬ V.ConstitutionRequires → ¬ V.LawfullyKeepable :=
  fun h => h statutoryVocab (fun _ => trivial) (fun hx => hx) trivial

end Debate.Birthright.Motion
