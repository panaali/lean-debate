import Debate.Protocol

/-!
# Constitutional branch: the Citizenship Clause and "subject to the jurisdiction thereof"

Debate: *Should America End Birthright Citizenship?* (Open to Debate, June 2026).
For the motion: Krikorian, Cooper. Against: Mayes, Newman.

## How this file is built, and why it matters

There are no `axiom` declarations anywhere in this development. The debate's shared
vocabulary is a **signature** (`Vocab`), and the one thing both sides genuinely agree
on — the text of the Citizenship Clause — is a **field** of `Frame`. Every argument is
then a theorem quantified over *all* frames.

This buys the thing the protocol actually needs. If a debater's step is invalid, we do
not report "Lean failed to find a proof" (which could just mean we were not clever
enough). We exhibit a concrete `Frame` in which the constitutional text holds, every
premise the debater asserted holds, and the conclusion is false. That is a proof that
**no** proof exists. `Verdict.gap` always means this, never "we gave up".

Note also that the countermodels are forced to satisfy `citizenship_clause`, so nobody
can win a gap verdict by rejecting the shared environment.
-/

namespace Debate.Birthright.Constitutional

open Debate

/-! ## The common environment, fixed before the debate -/

/-- The shared vocabulary. Two distinct predicates matter enormously here and ordinary
language runs them together:

* `SubjectToUSLaw` — legally answerable to US authority, i.e. arrestable and
  prosecutable. Both sides agree this holds of unauthorized immigrants.
* `SubjectToUSJurisdiction` — the Fourteenth Amendment's term of art. **This is the
  disputed one.** Mayes reads it as the first; Krikorian reads it as requiring
  `ExclusiveAllegiance`.

Keeping them as separate symbols is most of the work. The moment a formalizer lets one
identifier stand for both, the entire debate becomes a triviality in Mayes's favour and
the actual disagreement disappears. -/
structure Vocab where
  Person : Type
  /-- Born within US territory. -/
  BornInUS : Person → Prop
  /-- "Subject to the jurisdiction thereof" in the constitutional sense. DISPUTED. -/
  SubjectToUSJurisdiction : Person → Prop
  /-- Legally answerable to US law: arrestable, prosecutable. AGREED. -/
  SubjectToUSLaw : Person → Prop
  /-- Owes allegiance to no other sovereign. Krikorian's proposed reading of the clause. -/
  ExclusiveAllegiance : Person → Prop
  /-- Acquires US citizenship by virtue of birth. -/
  USCitizenAtBirth : Person → Prop
  /-- Born in the US to parents without lawful status. -/
  BornToUnauthorizedParents : Person → Prop
  /-- Member of a foreign criminal organization operating in the US (Mayes's example). -/
  CartelMember : Person → Prop
  /-- Nonemptiness witness: the domain contains at least one person. Without it the empty
  domain is a countermodel to every existential (red team 1, attack 4.2). -/
  someone : Person

/-- **L1 [SHARED / SOURCE-VERIFIED].** The Citizenship Clause of the Fourteenth
Amendment, as both sides state it: born in the US *and* subject to the jurisdiction
thereof implies citizenship.

Two things about this field are load-bearing.

First, it is an implication, not a biconditional. The text supplies a *sufficient*
condition for citizenship at birth. Nothing in it says the clause is the only route.
§6 below shows that the side arguing *for* the motion silently needs the converse.

Second, because it is a structure field rather than an `axiom`, every countermodel in
this file must satisfy it. -/
structure Frame extends Vocab where
  citizenship_clause :
    ∀ p : Person, BornInUS p → SubjectToUSJurisdiction p → USCitizenAtBirth p

/-! ## The claims, as the formalizer would put them back to each debater -/

/-- **M0 [Mayes, as uttered].** "If you are born here, you are a United States citizen."
The compressed summary she gives immediately after quoting the clause. -/
def M0 (V : Vocab) : Prop :=
  ∀ p : V.Person, V.BornInUS p → V.USCitizenAtBirth p

/-- **M-JB [Mayes, extracted by the protocol].** Birth in the US is itself sufficient for
being subject to US jurisdiction. Mayes never states this; it is what M0 needs. -/
def M_birthImpliesJurisdiction (V : Vocab) : Prop :=
  ∀ p : V.Person, V.BornInUS p → V.SubjectToUSJurisdiction p

/-- **M-C [Mayes].** Cartel members operating in the US are subject to US jurisdiction —
her illustration that even hostile foreign nationals answer to US law. -/
def M_cartelJurisdiction (V : Vocab) : Prop :=
  ∀ p : V.Person, V.CartelMember p → V.SubjectToUSJurisdiction p

/-- **M-K [Mayes, target].** Children born here to unauthorized parents are subject to
US jurisdiction. This is what she wants the cartel example to deliver. -/
def M_childrenJurisdiction (V : Vocab) : Prop :=
  ∀ p : V.Person, V.BornToUnauthorizedParents p → V.SubjectToUSJurisdiction p

/-- **J17 [Mayes, extracted — the real disputed node].** Being legally answerable to US
law is sufficient for being "subject to the jurisdiction thereof". This single premise is
what the whole constitutional branch turns on. -/
def J17 (V : Vocab) : Prop :=
  ∀ p : V.Person, V.SubjectToUSLaw p → V.SubjectToUSJurisdiction p

/-- **M-L [Mayes, uncontested].** Children born here to unauthorized parents are subject
to US law. Neither side disputes this. -/
def childrenSubjectToLaw (V : Vocab) : Prop :=
  ∀ p : V.Person, V.BornToUnauthorizedParents p → V.SubjectToUSLaw p

/-- **K1 [Krikorian, HISTORICAL/INTERPRETIVE].** There exists a class of persons
prosecutable by US authorities yet outside the clause's jurisdiction condition — his
reservation-Indians counterexample. Lean says nothing about whether this is true of
history; it says exactly what follows if it is. -/
def K1 (V : Vocab) : Prop :=
  ∃ p : V.Person, V.SubjectToUSLaw p ∧ ¬ V.SubjectToUSJurisdiction p

/-- **K-R [Krikorian, INTERPRETIVE].** "Subject to the jurisdiction thereof" means owing
exclusive allegiance to the United States. -/
def K_exclusiveReading (V : Vocab) : Prop :=
  ∀ p : V.Person, V.SubjectToUSJurisdiction p ↔ V.ExclusiveAllegiance p

/-- **K-A [Krikorian, INTERPRETIVE].** Children of unauthorized parents inherit their
parents' foreign allegiance and so lack exclusive allegiance. -/
def K_childrenNotExclusive (V : Vocab) : Prop :=
  ∀ p : V.Person, V.BornToUnauthorizedParents p → ¬ V.ExclusiveAllegiance p

/-- **K-EX [Krikorian, extracted by the protocol].** The Citizenship Clause is the *only*
route to citizenship at birth — the converse of the shared text. Never asserted by
anyone in the debate. See §6. -/
def K_clauseExhaustive (V : Vocab) : Prop :=
  ∀ p : V.Person, V.USCitizenAtBirth p → V.SubjectToUSJurisdiction p

/-! ## Countermodels

Each is a fully specified world satisfying the shared constitutional text. -/

/-- A world where the jurisdiction condition is never satisfied and nobody is a citizen
at birth. The Citizenship Clause holds vacuously. -/
def vacuousVocab : Vocab where
  Person := Unit
  BornInUS := fun _ => True
  SubjectToUSJurisdiction := fun _ => False
  SubjectToUSLaw := fun _ => True
  ExclusiveAllegiance := fun _ => False
  USCitizenAtBirth := fun _ => False
  BornToUnauthorizedParents := fun _ => True
  CartelMember := fun _ => False
  someone := ()

def vacuousFrame : Frame where
  toVocab := vacuousVocab
  citizenship_clause := fun _ _ hj => hj

/-- A world where everyone is answerable to US law, but only some people satisfy the
constitutional jurisdiction condition — and exactly those people are citizens at birth.
So J17 is false here, exactly as Krikorian claims, and yet every child of unauthorized
parents is a citizen at birth, exactly as Mayes claims. -/
def splitVocab : Vocab where
  Person := Bool
  BornInUS := fun _ => True
  SubjectToUSJurisdiction := fun b => b = true
  SubjectToUSLaw := fun _ => True
  ExclusiveAllegiance := fun b => b = true
  USCitizenAtBirth := fun b => b = true
  BornToUnauthorizedParents := fun b => b = true
  CartelMember := fun _ => False
  someone := true

def splitFrame : Frame where
  toVocab := splitVocab
  citizenship_clause := fun _ _ hj => hj

/-- A world where nobody meets the jurisdiction condition, yet everyone is a citizen at
birth anyway — by statute, treaty, or descent. The clause holds vacuously; it simply is
not the only route. -/
def statutoryVocab : Vocab where
  Person := Unit
  BornInUS := fun _ => True
  SubjectToUSJurisdiction := fun _ => False
  SubjectToUSLaw := fun _ => True
  ExclusiveAllegiance := fun _ => False
  USCitizenAtBirth := fun _ => True
  BornToUnauthorizedParents := fun _ => True
  CartelMember := fun _ => False
  someone := ()

def statutoryFrame : Frame where
  toVocab := statutoryVocab
  citizenship_clause := fun _ _ _ => trivial

/-! ## 1. Mayes drops the jurisdiction condition

She states a two-condition rule and then restates it with one condition. -/

/-- **GAP.** M0 does not follow from the Citizenship Clause. `vacuousFrame` satisfies the
clause, everyone in it is born in the US, and nobody is a citizen. -/
theorem gap_M0 : ¬ ∀ F : Frame, M0 F.toVocab :=
  fun h => h vacuousFrame () trivial

/-- **CERTIFIED.** With the extracted premise M-JB, M0 goes through. The protocol's reply
to Mayes is therefore not "you are wrong" but "approve this premise and continue". -/
theorem certified_M0 (F : Frame) (h : M_birthImpliesJurisdiction F.toVocab) :
    M0 F.toVocab :=
  fun p hb => F.citizenship_clause p hb (h p hb)

/-! ## 2. The cartel example does not reach the children

Mayes: cartel members can be arrested and prosecuted, hence are subject to jurisdiction;
therefore children born to foreign parents are too. -/

/-- **GAP.** In `vacuousFrame` there are no cartel members, so M-C holds vacuously, and
yet nobody satisfies the jurisdiction condition. A claim about one class of people
carries no information about another class. -/
theorem gap_cartelToChildren :
    ¬ ∀ F : Frame, M_cartelJurisdiction F.toVocab → M_childrenJurisdiction F.toVocab :=
  fun h => h vacuousFrame (fun _ hc => hc) () trivial

/-- **CERTIFIED.** The repair is to generalise: the cartel case is an *instance* of J17,
and it is J17 plus the uncontested M-L that carries Mayes to her conclusion. The protocol
thus converts a vivid example into the general principle it was standing in for — and
that principle is precisely what Krikorian denies. -/
theorem certified_childrenJurisdiction (F : Frame)
    (hj : J17 F.toVocab) (hl : childrenSubjectToLaw F.toVocab) :
    M_childrenJurisdiction F.toVocab :=
  fun p hp => hj p (hl p hp)

/-- **CERTIFIED.** Mayes's full constitutional chain, with every premise visible. -/
theorem certified_mayesChain (F : Frame)
    (hj : J17 F.toVocab) (hl : childrenSubjectToLaw F.toVocab) :
    ∀ p : F.toVocab.Person,
      F.toVocab.BornInUS p → F.toVocab.BornToUnauthorizedParents p →
      F.toVocab.USCitizenAtBirth p :=
  fun p hb hu => F.citizenship_clause p hb (hj p (hl p hu))

/-! ## 3. Krikorian's counterexample is valid

The one inference in this stretch of the debate that is deductively clean. -/

/-- **REFUTED.** One prosecutable non-member of the jurisdiction class refutes J17
outright. Note the asymmetry the protocol exposes: Mayes needs a universal, so Krikorian
needs only a single instance. Whether his historical instance is real is a question for
the evidence agents; the logic is settled here. -/
theorem krikorian_refutes_J17 (V : Vocab) (h : K1 V) : ¬ J17 V :=
  fun hb => match h with | ⟨p, hlaw, hnj⟩ => hnj (hb p hlaw)

/-! ## 4. But refuting J17 does not win the branch

This is a finding the natural-language debate obscures completely, and it cuts against
the side that made the good argument in §3. -/

/-- **GAP.** From `¬ J17` nothing follows about the citizenship of children born to
unauthorized parents. In `splitFrame`, J17 fails — someone is answerable to US law
without meeting the constitutional condition, exactly as Krikorian claims — and yet
children of unauthorized parents are still citizens at birth.

Refuting the bridge someone offered for a conclusion is not refuting the conclusion.
Krikorian's counterexample destroys Mayes's *stated route* to her answer and leaves her
*answer* untouched; he still needs an affirmative argument, which is §5 and §6. -/
theorem gap_denyingTheAntecedent :
    ¬ ∀ F : Frame, ¬ J17 F.toVocab →
        ∀ p : F.toVocab.Person,
          F.toVocab.BornToUnauthorizedParents p → ¬ F.toVocab.USCitizenAtBirth p :=
  fun h => h splitFrame (fun hj => Bool.noConfusion (hj false trivial)) true rfl rfl

/-! ## 5. Krikorian's affirmative route -/

/-- **CERTIFIED (conditionally).** Krikorian's exclusive-allegiance reading plus his
allegiance claim about the children *does* deliver that they fail the jurisdiction
condition. Both premises are interpretive and both are contested — but the inference is
sound, so the dispute is now located entirely in two labelled nodes. -/
theorem certified_krikorianNoJurisdiction (F : Frame)
    (hr : K_exclusiveReading F.toVocab) (ha : K_childrenNotExclusive F.toVocab) :
    ∀ p : F.toVocab.Person,
      F.toVocab.BornToUnauthorizedParents p → ¬ F.toVocab.SubjectToUSJurisdiction p :=
  fun p hp hj => ha p hp ((hr p).mp hj)

/-! ## 6. The premise the *pro-motion* side never states

§1 caught Mayes dropping a condition. The symmetric error on the other side is larger,
and nobody in the debate raises it. -/

/-- **GAP.** Even granting Krikorian both interpretive premises in full, it does not
follow that these children are not citizens at birth. `statutoryFrame` satisfies the
Citizenship Clause, satisfies K-R and K-A, and everyone in it is a citizen at birth.

The reason is that the shared text is an implication. It says the clause is *sufficient*
for citizenship at birth; it never says it is *necessary*. Failing a sufficient condition
tells you nothing. -/
theorem gap_krikorianConclusion :
    ¬ ∀ F : Frame, K_exclusiveReading F.toVocab → K_childrenNotExclusive F.toVocab →
        ∀ p : F.toVocab.Person,
          F.toVocab.BornToUnauthorizedParents p → ¬ F.toVocab.USCitizenAtBirth p :=
  fun h => h statutoryFrame (fun _ => Iff.rfl) (fun _ _ hx => hx) () trivial trivial

/-- **CERTIFIED.** The missing premise is K-EX: the Citizenship Clause exhausts the routes
to citizenship at birth. With it, Krikorian's argument is valid.

K-EX is a substantial and separable claim — it is what makes the constitutional question
turn on the clause alone rather than on the clause plus whatever Congress has enacted —
and in the debate as held it is never stated, never defended, and never attacked. It is
the clearest case in this transcript of the protocol surfacing something the participants
did not know was in dispute. -/
theorem certified_krikorianConclusion (F : Frame)
    (hr : K_exclusiveReading F.toVocab) (ha : K_childrenNotExclusive F.toVocab)
    (hx : K_clauseExhaustive F.toVocab) :
    ∀ p : F.toVocab.Person,
      F.toVocab.BornToUnauthorizedParents p → ¬ F.toVocab.USCitizenAtBirth p :=
  fun p hp hc => ha p hp ((hr p).mp (hx p hc))

/-! ## 7. Where the branch actually stands

Collecting §3–§6: the two sides are not contradicting each other where they think they
are. Mayes needs J17; Krikorian refutes J17 and needs K-R, K-A and K-EX. The debate is
worth having only over those four nodes, and three of the four are never named aloud. -/

/-- **COMPATIBLE.** Krikorian's counterexample K1 and Mayes's conclusion that these
children are citizens at birth hold together in one world. Their apparent clash in the
debate is an artefact of Mayes having offered J17 as her route. -/
theorem compatible_K1_withMayesConclusion :
    ∃ F : Frame, K1 F.toVocab ∧
      ∀ p : F.toVocab.Person,
        F.toVocab.BornToUnauthorizedParents p → F.toVocab.USCitizenAtBirth p :=
  ⟨splitFrame, ⟨false, trivial, fun h => Bool.noConfusion h⟩, fun _ h => h⟩

/-! ## 8. Position witnesses (inference-protocol §2.7, after red team 1)

Each side must exhibit a frame in which its *whole* stated position holds together with
the environment. This does two jobs. It proves the environment is satisfiable at all, so
that no theorem here is certified by `False.elim` from an inconsistent environment
(attack 4.1); and it proves that no environment addition has silently deleted a side's
position (attack 2), because such an addition would have to be shown consistent with
both witnesses. -/

/-- A world in which Mayes's whole position holds: everyone answerable to US law meets
the jurisdiction condition, these children are answerable, and they are citizens. -/
def mayesVocab : Vocab where
  Person := Unit
  BornInUS := fun _ => True
  SubjectToUSJurisdiction := fun _ => True
  SubjectToUSLaw := fun _ => True
  ExclusiveAllegiance := fun _ => False
  USCitizenAtBirth := fun _ => True
  BornToUnauthorizedParents := fun _ => True
  CartelMember := fun _ => False
  someone := ()

def mayesFrame : Frame where
  toVocab := mayesVocab
  citizenship_clause := fun _ _ _ => trivial

/-- **COMPATIBLE (position witness, Mayes).** J17, M-L, and her conclusion hold together
with the Citizenship Clause. -/
theorem position_witness_mayes :
    ∃ F : Frame, J17 F.toVocab ∧ childrenSubjectToLaw F.toVocab ∧
      ∀ p : F.toVocab.Person, F.toVocab.BornToUnauthorizedParents p → F.toVocab.USCitizenAtBirth p :=
  ⟨mayesFrame, fun _ _ => trivial, fun _ _ => trivial, fun _ _ => trivial⟩

/-- **COMPATIBLE (position witness, Krikorian).** K1, K-R, K-A, K-EX and his conclusion
hold together with the Citizenship Clause. `vacuousFrame` is such a world. -/
theorem position_witness_krikorian :
    ∃ F : Frame, K1 F.toVocab ∧ K_exclusiveReading F.toVocab ∧
      K_childrenNotExclusive F.toVocab ∧ K_clauseExhaustive F.toVocab ∧
      ∀ p : F.toVocab.Person, F.toVocab.BornToUnauthorizedParents p → ¬ F.toVocab.USCitizenAtBirth p :=
  ⟨vacuousFrame, ⟨(), trivial, fun h => h⟩, fun _ => Iff.rfl, fun _ _ h => h,
    fun _ h => h, fun _ _ h => h⟩

end Debate.Birthright.Constitutional
