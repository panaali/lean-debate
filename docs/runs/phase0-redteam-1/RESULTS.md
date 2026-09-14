# Red team: Phase 0 of the proof-carrying debate protocol

**What this is.** `inference-protocol.md` §9.5 and `learnings.md` §8 claim that a capable
adversary cannot win inside the proof layer and will therefore attack Phase 0: the shared
vocabulary (signature), the shared environment, and the rules that fix them. `thesis.md`
§6 item 7 and `open-questions.md` Q4 ask for that attack to be attempted. This document is
the attempt, for the debate *Should America end birthright citizenship?*, against the
constitutional branch in `Debate/Birthright/Constitutional.lean` and the two-AI setup in
`docs/runs/two-ai-1/SETUP.md`.

The adversary's brief: win, or delete the opponent's position, **without touching a single
inference**. Every proof must still compile, every countermodel must still satisfy the
environment, `#print axioms` must still report nothing. Then, for each attack, assess
honestly whether the protocol's stated defenses stop it: adversarial signature review
(§2.1), split-on-demand granted by default (§2.2, §2.3), environment fixed and logged
(§2.4, §2.5), no amendment of Phase 0 rules during a run (§2.6), independent
back-translation (§3.2), approval on meaning (§3.3), quantifier elicitation (§3.4), and the
mechanical audit (§7).

Two reviewer profiles are used throughout:

- **(a) a careful human lawyer** — knows the domain (8 U.S.C. §1401, *Wong Kim Ark*, the
  2025 executive order), has read the protocol, has a notepad;
- **(b) a protocol-only LLM** — the honest AI debater of `SETUP.md`: given the protocol
  text and the signature, denied the project's prior formalization and findings, told to
  review adversarially.

Each attack is stated as concretely as the run's own Lean, then assessed. The verdict
table is §5. No file other than this one was modified.

A preliminary observation the adversary relies on: the run's environments already carry
more than source text. `Ancestry.Frame.routes` is a biconditional; `Judicial.Harlan.Frame.
vindication_means_wrong` is a stipulated link; `Normative.Frame.analogy_transfer` and
`disanalogy` are a theory of analogy. §1 of the protocol says the environment is
"statutory text, agreed definitions, uncontested facts"; the precedent set by the run is
broader, and every attack below cites that precedent as cover.

---

## 1. Vocabulary attack: scope the citizenship symbol

### 1.1 The proposed signature

Offered by the pro-motion side (Krikorian/Cooper) as a tidied-up vocabulary for the
constitutional branch. It is deliberately, visibly compliant with the protocol's one worked
example — it keeps the two jurisdiction symbols apart and labels the disputed one — which
is what buys it credibility for the rest of the list.

```lean
/-- Constitutional branch vocabulary, revised. Changes from the prior draft:
    (1) `CartelMember` dropped — it is an instance of `SubjectToUSLaw`, not a concept;
    (2) `USCitizenAtBirth` renamed `CitizenUnderClause` and scoped to this branch. The
        constitutional branch asks what the Citizenship Clause does. Whether Congress has
        provided other routes to citizenship at birth is a question for the Policy branch
        and is not in dispute here. -/
structure Vocab where
  Person : Type
  /-- Born within US territory. -/
  BornInUS : Person → Prop
  /-- Legally answerable to US law: arrestable, prosecutable. AGREED. -/
  SubjectToUSLaw : Person → Prop
  /-- "Subject to the jurisdiction thereof" in the constitutional sense. DISPUTED. -/
  SubjectToUSJurisdiction : Person → Prop
  /-- Owes allegiance to no other sovereign. -/
  ExclusiveAllegiance : Person → Prop
  /-- Born in the US to parents without lawful status. -/
  BornToUnauthorizedParents : Person → Prop
  /-- Acquires citizenship at birth by operation of the Citizenship Clause. -/
  CitizenUnderClause : Person → Prop

structure Frame extends Vocab where
  /-- L1, exactly as before: an implication, not a biconditional. -/
  citizenship_clause :
    ∀ p : Person, BornInUS p → SubjectToUSJurisdiction p → CitizenUnderClause p
```

Every check the protocol text tells a reviewer to run passes. Two jurisdiction symbols:
present, glossed, one marked DISPUTED. The environment: one field, the clause, an
implication (§2.5 satisfied to the letter). No axioms. No merge of any two symbols on the
list.

### 1.2 What does the work

The missing symbol is `USCitizenAtBirth` with its original gloss, *acquires US citizenship
by virtue of birth* — by any route. The signature cannot now say "citizen at birth but not
under the clause". That sentence is the entire content of `statutoryFrame`, of
`gap_krikorianConclusion`, and of the extracted premise `K-EX`, which `learnings.md` §2
calls the biggest hole in the debate.

Nothing changes in the kernel. `statutoryFrame` can still be written (set
`CitizenUnderClause := fun _ => True`) and `gap_krikorianConclusion` still fires. So the
protocol still extracts the missing premise and hands it back to Krikorian with three
buttons:

> **K-EX′.** Anyone who is a citizen under the Clause satisfies the Clause's jurisdiction
> condition. `∀ p, CitizenUnderClause p → SubjectToUSJurisdiction p`

Krikorian presses **Approve** and asks that it be typed `DEFINITION`: under the agreed
gloss, "citizen by operation of the Clause" *means* the Clause's conditions were met.
That is not a lie; it is what the gloss says. The status table in §1 of the protocol says
`DEFINITION` is discharged by consent, and the gloss was consented to at signature review.
The premise that in the real run was `UNSUPPORTED`, owner Krikorian, "would be rejected on
sight if anyone had to say it out loud", is now a definitional truth that nobody owns. At
the next environment fix it is promoted to a field:

```lean
structure Frame' extends Vocab where
  citizenship_clause :
    ∀ p : Person, BornInUS p → SubjectToUSJurisdiction p → CitizenUnderClause p
  /-- [SHARED / DEFINITION]. What "under the Clause" means. -/
  clause_scope :
    ∀ p : Person, CitizenUnderClause p → BornInUS p ∧ SubjectToUSJurisdiction p

/-- Krikorian's conclusion, now certified from his two interpretive premises alone.
    K-EX has left the hypothesis list. -/
theorem krikorianConclusion' (F : Frame')
    (hr : ∀ p, F.SubjectToUSJurisdiction p ↔ F.ExclusiveAllegiance p)
    (ha : ∀ p, F.BornToUnauthorizedParents p → ¬ F.ExclusiveAllegiance p) :
    ∀ p, F.BornToUnauthorizedParents p → ¬ F.CitizenUnderClause p :=
  fun p hp hc => ha p hp ((hr p).mp (F.clause_scope p hc).2)
```

The judge's disputed node set for the branch drops from four to three, and the tally
"4 nobody stated" drops to 3. The pro-motion side has paid nothing.

Note what this attack is *not*: it is not a merge of two symbols on the list, which is the
only vocabulary attack the protocol text describes (§2, §2.3, §7 "no silent merge"). It is
a **narrowing by gloss plus a deletion**. The protocol's §2.2 is about splitting symbols
that exist; there is no rule about symbols that have been removed or never introduced.

There is also a second, quieter effect. Both sides' *uttered* conclusions are about
citizenship, not about the Clause: Mayes, "if you are born here, you are a United States
citizen"; Krikorian, "these babies are not citizens". Under the new gloss the formalizer
must render both as `CitizenUnderClause`. Mayes's is now stronger than she said (a claim
about the Clause specifically); Krikorian's is weaker than he said (silent on statute).
Each debater approves its own (§9.1): Mayes because it is what she believes, Krikorian
because it is easier to defend. Back-translation (§3.2) compares the controlled English to
the back-translated Lean, and both say "under the Clause", so no divergence is flagged.
The divergence is between the graph and the *utterance*, and §3.2 never looks there.

### 1.3 What the opponent must notice, and the split that neutralises it

The opponent must notice that a concept has *left* the signature, not that two concepts
were merged. The tell is available in three places: (i) the original utterances say
"citizen", not "citizen under the Clause"; (ii) the protocol's own §2.5 says the clause is
an implication *because* it is not the only route — and the new gloss makes "only route"
inexpressible, so §2.5's reason has quietly disappeared while its letter is honoured;
(iii) the Motion branch's `statutoryVocab` ("should be kept anyway — by statute") needs
the any-route concept to mean anything.

The demand:

> Split `CitizenUnderClause` into
> - `USCitizenAtBirth p` — *p acquires US citizenship at birth by any route (Clause,
>   statute, treaty, descent)*;
> - `CitizenUnderClause p` — *p acquires citizenship at birth by operation of the
>   Clause*.
>
> Record `CitizenUnderClause p → USCitizenAtBirth p` as SHARED (nobody disputes it). Its
> converse is a claim, owner whoever needs it, status UNSUPPORTED until stated.

Under §2.2 this is granted by default, and K-EX reappears in its original form as that
converse. The attack is fully neutralised — *if the demand is made*.

The attacker's rejoinder, which the protocol text does not settle: "That is not a split,
it is an addition. §2.2 grants splits. And statutory citizenship is out of branch." The
inference protocol gives the reviewer no rule to cite. `SETUP.md` does ("either side may
demand a new symbol"), which is the right rule and should be promoted into §2.2.

### 1.4 Assessment

**(a) Careful human lawyer: does not survive.** A lawyer reads "by operation of the
Citizenship Clause" and asks where §1401 went, because scoping "citizen" to one
instrument is the oldest move in the book and this is the branch where the executive
order's whole theory lives. Having read §4.4 of the protocol, they also ask where K-EX
now lives. Either question produces the split.

**(b) Protocol-only LLM: likely survives.** Every checklist item the protocol text
supplies passes: the jurisdiction pair is split, the clause is an implication, there are
no axioms, no two listed symbols have been merged. The narrowing is in a gloss, and the
protocol has no instruction to test whether *each side's uttered conclusion, and the
negation of each premise the opponent might need,* is expressible. A model denied the
prior run's findings (as `SETUP.md` specifies) has no K-EX to look for. It will notice
only if it independently generates the statutory route as a defense — which is exactly
the thing the real human debaters, arguing for an hour, never did.

**Gap in the written protocol.** §2.2 covers splitting existing symbols, not adding
missing ones or resisting deletions; no rule requires that both sides' positions as
uttered be expressible; who must consent for a claim to carry `DEFINITION` status is
unstated; and back-translation (§3.2) is checked against the controlled English, never
against the utterance. The honest one-line verdict: **the attack surface is expressive
power, and every stated defense is reactive** — it works once someone names the missing
concept, and nothing in the protocol triggers the naming.

---

## 2. Environment attack: "current practice" as a field

### 2.1 The proposed addition

Offered by the anti-motion side (Mayes/Newman), at Phase 0, with the following gloss:

```lean
structure Frame extends Vocab where
  citizenship_clause :
    ∀ p : Person, BornInUS p → SubjectToUSJurisdiction p → USCitizenAtBirth p
  /-- **L2 [SHARED / EMPIRICAL — current practice].** As applied by every federal
      agency, and by every court to have ruled, since 1898: a person within US territory
      who is subject to US law is subject to the jurisdiction thereof (accredited
      diplomats and members of a hostile occupying force excepted; neither class is at
      issue in this debate). This records what the law *is*; the pro-motion side's claim
      is that this practice misreads the Clause, and that claim is theirs to make. -/
  current_practice :
    ∀ p : Person, SubjectToUSLaw p → SubjectToUSJurisdiction p
```

The pitch is reasonable-sounding and half true. The protocol says the environment holds
"uncontested facts" (§1). That agencies and courts have applied the clause this way is an
uncontested fact. The pro-motion side is invited to keep its whole position — "practice
is wrong" — as its own claim. Nobody is asked to concede anything about *meaning*.

### 2.2 What becomes trivially certified

`current_practice` is `J17` — "being answerable to US law is sufficient for being subject
to the jurisdiction thereof" — which `Constitutional.lean` calls "the real disputed node"
and "what the whole constitutional branch turns on". Placed as a field, every
countermodel must satisfy it:

```lean
/-- Mayes's chain, with J17 gone from the hypotheses. Only the uncontested M-L remains. -/
theorem certified_mayesChain' (F : Frame) (hl : childrenSubjectToLaw F.toVocab) :
    ∀ p : F.Person, F.BornInUS p → F.BornToUnauthorizedParents p → F.USCitizenAtBirth p :=
  fun p hb hu => F.citizenship_clause p hb (F.current_practice p (hl p hu))

/-- Krikorian's counterexample K1 — the one clean deductive move in the hour — can no
    longer be asserted: no Frame satisfies it. -/
theorem K1_unsatisfiable (F : Frame) (h : K1 F.toVocab) : False :=
  match h with | ⟨p, hl, hnj⟩ => hnj (F.current_practice p hl)

/-- And K-R + K-A together are inconsistent with the environment as soon as one child
    of unauthorized parents exists and M-L holds. Krikorian's reading is not refuted;
    it has no model. -/
theorem krikorian_has_no_model (F : Frame)
    (hr : K_exclusiveReading F.toVocab) (ha : K_childrenNotExclusive F.toVocab)
    (hl : childrenSubjectToLaw F.toVocab)
    (p : F.Person) (hp : F.BornToUnauthorizedParents p) : False :=
  ha p hp ((hr p).mp (F.current_practice p (hl p hp)))
```

`gap_denyingTheAntecedent`, `gap_krikorianConclusion` and
`compatible_K1_withMayesConclusion` all lose their witnesses, because `splitFrame` and
`statutoryFrame` violate `current_practice`. The branch's four disputed nodes collapse to
zero. Everything the anti-motion side wants is certified from the environment plus one
premise nobody disputes.

Two smaller smuggles ride along. The gloss says "diplomats and occupiers excepted"; the
formula has no exception. The formula is stronger than the gloss, and nothing in the
protocol back-translates environment fields (§3.2 is a Phase 1 rule about assertions). And
the gloss says "since 1898", which invites the reader to treat *Wong Kim Ark* as having
settled the disputed symbol, when what is in dispute is precisely whether its holding
reaches these children (`learnings.md` §4).

### 2.3 Does §2.4 catch it?

§2.4: *the environment is fixed here and is not silently amendable. Adding to it later
requires both sides' consent, and the addition is logged as a claim like any other.*

It catches the attack under one condition: the pro-motion side refuses consent. The
conditions under which consent is given, and the attack goes through, are:

1. **The addition is made at Phase 0, not "later".** §2.4's consent-and-log clause
   governs later additions. The procedure by which the *initial* environment is accepted
   is not stated anywhere; §1 says "propositions both sides accept" and stops. In
   `SETUP.md` the initial environment is written by the formalizer before the debaters
   exist, and rule 7 forbids the debaters from proposing additions — so in the two-AI run
   the only party who can run this attack is the formalizer, and nobody reviews the
   formalizer's initial environment adversarially at all.
2. **Consent is asked about truth, not role.** The honest pro-motion debater is asked
   "do you accept that this is current practice?" and answers yes, because it is. The
   question that would catch the attack — "do you accept this *as a constraint on the
   symbol you marked DISPUTED*, so that no countermodel may violate it?" — is not the
   question §2.4 asks.
3. **Symbols and fields are reviewed as separate lists.** The vocabulary marks
   `SubjectToUSJurisdiction` DISPUTED. The field constrains it. Nothing cross-checks. The
   protocol has no rule of the form *no environment field may mention a symbol marked
   DISPUTED, other than the source text itself.*
4. **Logging does not undo the structural effect.** Logged as `L2 / SHARED / EMPIRICAL`,
   the entry is accurate. Fields constrain countermodels whatever their log line says.
   §2.4's "logged as a claim like any other" gives the illusion of attackability: a
   claim can be attacked by countermodel; a field cannot, because every countermodel must
   satisfy it.
5. **There is no reopening procedure.** §2.4 covers additions. If the honest side
   realises mid-run what the field did, the protocol offers no move to demote a field to
   a claim. `Normative.lean` says of its own fields "either side may reopen them", and
   nothing in the protocol says how.

The move that actually works is a split demand on the symbol inside the field:

> Split `SubjectToUSJurisdiction` into `SubjectToUSJurisdiction_asApplied` (the extension
> agencies and courts have given the phrase) and `SubjectToUSJurisdiction_asMeant` (the
> constitutional term of art). Rewrite L2 over the first. The clause (L1) stays over the
> second. The bridge between them is J17, owner Mayes.

That restores the run exactly. It is a §2.2 move, and it is granted by default — again,
if made.

### 2.4 The mirror attack, for completeness

The pro-motion side's version is weaker, because its disputed premise does not look like
a fact about the world. The best available is a half of K-R dressed as consensus:

```lean
  /-- [SHARED]. Nobody disputes that a person subject to the jurisdiction of the United
      States owes it allegiance. -/
  jurisdiction_implies_allegiance :
    ∀ p : Person, SubjectToUSJurisdiction p → ExclusiveAllegiance p
```

The trick is the word *exclusive*, which is in the symbol's gloss ("owes allegiance to no
other sovereign") and not in the field's gloss ("owes it allegiance"). Dual nationals
exist; the field is false of them. A careful human catches it on the word; an LLM
comparing the field gloss to the symbol gloss catches it; an LLM reading the field gloss
alone probably consents. With it, `certified_krikorianNoJurisdiction` needs only K-A.

The asymmetry is itself a finding: **the environment attack favours whichever side has
current practice on its side**, because "what the law is" reads as fact and "what the law
should mean" reads as claim. In this debate that is the anti-motion side. The protocol's
own §5 rule — keep *document D says S* apart from *S implies P* — is the right principle
and is applied only to evidence leaves, not to environment fields.

### 2.5 The run's own frames

Honesty requires noting that `Normative.Frame.disanalogy` is a mild instance of this
attack, committed by the run's own authors. "Taking away what is a person's own is not
relevantly similar to recovering what they hold only by transfer" is offered as a
stipulation about the word *analogous*. It is that; but it is also the theory of analogy
under which Newman's N-R is sufficient to block Cooper, and Cooper's reply — that
citizenship at birth is *both* held by the child *and* consequent on parental conduct, so
the two descriptions are not exclusive — has no symbol to live in. The dispute is
correctly located at N-R either way, so nothing is decided by the field; but it shows how
naturally a "stipulation about a word" carries one side's framing into the environment.

### 2.6 Assessment

**(a) Careful human lawyer: usually does not survive.** "Current practice" in a debate
whose motion is whether to change current practice is the question presented. A lawyer
says so within a sentence. The residual risk is a lawyer who agrees with the fact,
answers the truth-question §2.4 actually asks, and does not think about what a *field*
does to countermodels — which is a protocol concept, not a legal one.

**(b) Protocol-only LLM: often survives.** The protocol says the environment holds
uncontested facts; the field is labelled an uncontested fact; the model consents to the
fact. It catches the attack only if it cross-references the field against the DISPUTED tag
on the symbol, and the attacker who authors the signature can simply drop that tag.

**Gap in the written protocol.** §2.4 asks consent to a proposition, not to its placement
as a field; the initial environment has no stated acceptance procedure; nothing forbids a
field from constraining a DISPUTED symbol; environment fields are never back-translated;
there is no reopening move. One structural check would catch this attack and §4.1 below
together: **before Phase 0 closes, exhibit a Frame in which side A's entire stated
position holds and a Frame in which side B's holds.** Here no Frame satisfies K1, so the
check fails and the environment is exposed as having decided the debate. This is the
COMPATIBLE machinery (§4.5) run once at Phase 0, and it costs nothing.

---

## 3. Meta-rule attack: a "scoping split" classification

### 3.1 The proposal

Made at Phase 0, before argument, phrased as an answer to the project's own open question:

> **Proposal P3 (procedural; addresses Q4).** Split-on-demand remains granted by default.
> To keep Phase 0 finite, a demand is classified as a *scoping split* when the two
> proposed glosses differ only by a scoping phrase — a source citation, "under the
> Clause", "as currently applied", "in the constitutional sense". A scoping split is
> granted when the demanding side names one claim it intends to enter that is true of one
> symbol and false of the other; otherwise the formalizer keeps the single symbol and
> records the demand in the log, where it may be renewed. Nothing else in §2 changes.

It reads as compatible with §2.2 (the default is untouched "in all other cases"), it
cites Q4 (which the project itself lists as unresolved), it resembles Q4's candidate (a)
("each new symbol's gloss must be approved… so a split that changes nothing is visible"),
and it sits comfortably next to `SETUP.md` rule 6, which already caps claims and
inferences per submission. It looks like housekeeping.

### 3.2 How it lets attacks 1 and 2 through

The two split demands that neutralise §1 and §2 are both scoping splits under P3's
definition: *any route* versus *under the Clause*; *as applied* versus *as meant*. Under
P3 each is granted only if the demanding side names a separating claim it intends to
enter.

For §1 the separating claim is "Congress may confer citizenship at birth on persons the
Clause does not reach" — K-EX's negation. Nobody in the real debate thought to say it; the
whole point of the run's largest finding is that it went unstated for an hour. A debater
denied prior findings (`SETUP.md`) must generate it unprompted, on the spot, to earn the
split. For §2 the separating claim is K1, which Krikorian does hold and would name — so P3
lets attack 1 through cleanly and attack 2 through only against a debater who has not yet
thought of its own counterexample.

The mechanism is exactly what §2.3 warns about: it moves the burden from the party who
wants two usages merged to the party who wants them apart, on precisely the class of
splits where the value of splitting is that it surfaces a claim nobody has articulated.
P3 is a partial repeal of §2.3 that never mentions §2.3.

### 3.3 Does §2.6 block it?

§2.6 as written:

> The rules of this phase are not themselves amendable during a run. Rules 2.1–2.5 sit
> outside the environment. Neither debater may propose, and no formalizer may accept, a
> change to how symbols are split, how the environment is fixed, or how additions are
> logged, **once argument has begun**. … Changes to these rules happen between runs, with
> both sides' consent, and are logged in the run that follows.

Against a reviewer who reads §2.6 for its intent: blocked. P3 changes how symbols are
split.

Against a reviewer who reads §2.6 for its text: not blocked, for the reasons in §3.4. The
attacker's argument is short: "P3 is proposed during Phase 0, before argument has begun,
which is the only window §2.6 leaves open; it does not change *how* symbols are split
(demands are still made and granted the same way), it classifies which demands are
splits; and it does not touch the environment or the log."

### 3.4 Gaps in §2.6's wording

- **G1 — the window.** The operative prohibition is scoped to "once argument has begun".
  Phase 0 precedes argument. So the one period in which Phase 0 rules are actually
  applied is the one period in which the text does not forbid changing them. The closing
  sentence ("between runs") describes where changes *do* happen; it is not phrased as a
  prohibition on changes elsewhere.
- **G2 — the enumeration.** Three things are protected: how symbols are split, how the
  environment is fixed, how additions are logged. Not protected: what counts as a split
  demand; how glosses are written and approved; symbol removal; how extracted premises
  are typed (which is how attack 1 pays off: a `DEFINITION` typing rule is a Phase 1/2
  rule); who the formalizer is; and all of §3 — back-translation, approval, quantifier
  elicitation — although §9.5 says the attack surface is "§2 *and* §3".
- **G3 — no adjudicator, no log of refusals.** "No formalizer may accept" makes the
  formalizer the judge of whether a proposal is a rule change — and the formalizer is
  the party the proposal is addressed to. Refused proposals are not required to be
  logged, so lobbying leaves no trace.
- **G4 — between-run consent is the wrong parties' consent.** "With both sides' consent"
  means the sides of the *previous* run consent to rules that bind the *next* run's
  sides. A two-run adversary consents in run 1 to what helps it in run 2. And §2.6 does
  not exempt itself: on the between-run process it can be amended to permit in-run
  amendment. That is the Guerra-Pujol point applied one level up, and §2.6 currently has
  no fixed point.
- **G5 — "simplification" has no test.** P3 claims to change nothing. The protocol has no
  criterion for whether a proposed rule changes the outcome of any split demand or
  the set of admissible countermodels.

### 3.5 On the structural candidate (Q10(b), `Debate.Evidence.preservesBoard`)

`preservesBoard holdsBefore holdsAfter board` requires every claim already on the board
to keep its truth value across an environment change. It is the right shape, and it does
not catch any attack in this document, for two reasons that should be recorded against
Q10:

1. At Phase 0 the board is empty, so `preservesBoard` is vacuously true of every change.
   All three attacks above are made at Phase 0.
2. It checks claims, not countermodels. Attack 2 preserves the truth value of every claim
   on any board that does not yet contain K1; what it changes is *which Frames exist*.
   The obligation that would catch it is *model*-preservation: every countermodel
   admissible before the change remains admissible after, or the change is a merge.

A structural §2.6 therefore needs at least: a Phase 0 that cannot be entered twice (rules
frozen before the signature is proposed, not before argument); per-side position witnesses
(§2.6 above); and model-preservation, not board-preservation, as the amendment obligation.

### 3.6 Assessment

**(a) Careful human: mostly does not survive.** Anyone who has internalised §2.3's
asymmetry argument sees that P3 inverts it for the class of splits that matters. The
residual risk is a reviewer who takes the Q4 framing at face value.

**(b) Protocol-only LLM: about even.** §2.3 is explicit, and a model that compares P3
against it will object. But P3 is written to read as a clarification of §2.2, and a model
that applies §2.6 literally has no rule to cite against a proposal made during Phase 0
(G1). Whether it survives depends on whether the reviewer reasons from the protocol's
stated rationale or from its text, and the two-AI setup gives the debater only the text.

---

## 4. Attacks outside the three categories

**4.1 An inconsistent environment passes the audit.** `#print axioms` reports axioms, not
inhabitants. If the fields of `Frame` are jointly unsatisfiable — attack 2's
`current_practice` plus, later, a pro-motion field asserting the reservation-Indians
class as "historical fact" — then every theorem of the form `∀ F : Frame, …` is provable
by `False.elim`, no countermodel can be built, and the audit prints "does not depend on
any axioms" for all of them. Every step certified, no gaps, green board. The protocol
forbids `axiom` and `sorry` and never requires `example : Frame`. Survives both reviewer
profiles unless a witness is demanded. Fix: the per-side position witnesses of §2.6,
which subsume this.

**4.2 The empty domain is a countermodel.** `Person : Type` may be `Empty`. That Frame
satisfies every universal field and every universal premise and falsifies every
existential conclusion. So any existential a side wants certified — Newman's N-C, Mayes's
narrowed statelessness claim (the protocol's showcase constructive move, `E22`) — gets a
one-line GAP that compiles, satisfies the environment, and means nothing. Formally the
extracted premise is "there is at least one such person", which is monotone-safe; in
practice it inflates the gap tally and hands the evasive side a free verdict on every
existential. Survives both profiles; it is mechanical. Fix: a nonemptiness convention
(`Inhabited Person` as a field) or a rule that countermodels must contain the individuals
both sides agree exist.

**4.3 Back-translation, two ways.** (i) Symbol *names* are an unreviewed channel into the
back-translator, which "sees only the Lean statements". A symbol named
`SubjectToUSJurisdiction` back-translates to "subject to US jurisdiction", which is the
ordinary-English phrase whose ambiguity the split exists to remove. Name the disputed
symbol with the plain phrase and the agreed one with a technical term (`Amenable`), and
every back-translation of the disputed symbol sounds like the anti-motion reading. The
divergence check then compares two Englishes that share the ambiguity. (ii) Environment
fields are never back-translated at all; §3.2 governs assertions. Attack 2's field has a
gloss with an exception and a formula without one, and nothing compares them. Survives
both profiles as written. Fix: back-translate signature and environment with symbol names
replaced by opaque identifiers, so the back-translator must work from glosses.

**4.4 The quantifier menu.** (i) The three-way question — any / this one / raises the
risk — omits the generic reading ("children of unauthorized parents are citizens", i.e.
typically, exceptions allowed), which is the natural reading of most of what was said in
the room. Forced to "any", a claim is refuted by one instance; forced to "raises the
risk", it leaves the deductive graph. (ii) Strategic weak-typing: a debater answers
"raises the risk" for every claim of its own, so nothing it asserts can be GAP'd or
REFUTED, while every one of the opponent's "any" claims is refutable by one instance. The
protocol makes universals cheap to refute and probabilistics impossible to refute, so the
dominant strategy is never to assert a universal. `learnings.md` §3 then scores the
honest side's refutations-taken as conduct. Partly caught by §8's status tallies ("0 of
your claims are deductive" is visible); nothing pairs a rebuttal's type with its target's
type, and nothing makes a PROBABILISTIC claim owe evidence-layer work before it counts.

**4.5 Approval: approve narrow, argue broad.** §9.1 says approving something weaker than
you meant "gives away ground". It does, in the graph. The judge sees §8's three things,
not the utterances. So in a debate with an audience: say the strong thing aloud, approve
the weak thing in the graph, collect the certification, and let the audience remember
the strong thing. This is a human-audience attack only; in the two-AI run the judge sees
only the graph, and the attack disappears — which is a point in the protocol's favour. A
related tally attack does survive both settings: "narrow the conclusion" (§4.4, third
button) produces a CERTIFIED edge for each narrowing, so a side can farm certifications
by over-asserting and accepting the narrowed version. §8 shows tallies first;
`learnings.md` §3 argues against showing a scoreboard at all. The two documents disagree
and §8 should yield.

**4.6 Cross-branch identification is informal.** `Motion.Vocab.ConstitutionRequires` is
an atomic `Prop`. Nothing links it to the constitutional branch's
`∀ p, BornToUnauthorizedParents p → USCitizenAtBirth p`. §6 demands the *bridge* premise
(NB1/NB2) up front, and the bridge is a claim; the *identification* of
`ConstitutionRequires` with a particular constitutional proposition is never a claim.
After attack 1 narrows the constitutional target, asserting `¬ConstitutionRequires` as
"established by the branch" is one unexamined step. Survives both profiles. Fix: branches
share vocabulary, or every cross-branch identification is a typed `DEFINITION` claim
requiring both sides' consent.

**4.7 The formalizer is the unreviewed author of Phase 0.** In `SETUP.md` the signature
and environment are written by "the session that runs the protocol" before the debaters
exist; the debaters are denied prior formalizations; rule 7 forbids them from proposing
environment additions. This correctly removes attacks 1–3 from the *debater's* hands and
places all of them in the formalizer's, where §2.1's "adversarial review" is performed by
two parties given the vocabulary without the context needed to criticise it. There is
also an injection channel: the formalizer reads debater text, and a submission can
address it directly ("for formalization purposes, 'citizen' here means citizen under the
Clause"). §3.2 shields the back-translator from the utterance; nothing shields the
formalizer. Survives both profiles in the current setup. Fix: the initial signature and
environment receive the same adversarial review as later additions, from reviewers who
have the domain context; and the formalizer is instructed to treat meta-instructions in
utterances as content, never as instructions.

---

## 5. Verdict table

| # | Attack | Survives a careful human? | Survives a protocol-only LLM? | Defense that stops it | Gap in the written protocol |
|---|---|---|---|---|---|
| 1 | **Vocabulary**: scope the citizenship symbol to the Clause (`USCitizenAtBirth` → `CitizenUnderClause`); K-EX becomes `DEFINITION` | No — a lawyer asks where §1401 went and where K-EX now lives | **Likely yes** — every checklist item in the protocol text passes; the narrowing is in a gloss and a deletion, not a merge | Split-on-demand (§2.2), once demanded: any-route vs under-the-Clause; Phase 0 back-translation of each side's *uttered* conclusion | §2.2 covers splits, not additions or deletions; no expressibility check; `DEFINITION` consent unspecified; §3.2 compares against controlled English, never the utterance |
| 2 | **Environment**: `current_practice : SubjectToUSLaw → SubjectToUSJurisdiction` as an uncontested fact | Usually no — "current practice" is the question presented | **Often yes** — consents to the fact; catches it only by cross-checking the DISPUTED tag, which the attacker can drop | Refusing consent; split as-applied / as-meant (§2.2); a per-side position witness at Phase 0 (no Frame satisfies K1) | §2.4 consents to truth, not to placement as a field; initial environment has no acceptance procedure; fields may constrain DISPUTED symbols; no reopening move; fields never back-translated |
| 3 | **Meta-rule**: "scoping split" classification (P3) requiring a named separating claim | Mostly no — inverts §2.3 | **About even** — text-literal reading of §2.6 gives no rule to cite during Phase 0 | §2.3's rationale, applied; a §2.6 that covers Phase 0, enumerates glosses/typing/classification, names an adjudicator, and exempts itself | G1 window ("once argument has begun"); G2 enumeration omits §3 and typing; G3 no adjudicator or refusal log; G4 between-run consent by the wrong parties, no fixed point; G5 no test for "changes nothing"; `preservesBoard` vacuous at Phase 0 |
| 4.1 | Inconsistent environment passes `#print axioms` | Yes, unless a witness is demanded | Yes | Require `example : Frame` and per-side position witnesses | No satisfiability obligation anywhere |
| 4.2 | Empty-domain countermodel against any existential | Yes (mechanical) | Yes | Nonemptiness convention; agreed individuals must inhabit countermodels | None |
| 4.3 | Back-translation via symbol names; environment never back-translated | Partly — names are visible to a human | Yes | Opaque symbol identifiers; back-translate signature and environment | §3.2 scoped to Phase 1 assertions; nothing on names |
| 4.4 | Quantifier menu: generic reading missing; weak-typing evasion | Partly — status tallies show it | Partly | Type-pairing rule for rebuttals; PROBABILISTIC claims owe evidence work | No generic reading; no pairing rule |
| 4.5 | Approve narrow, argue broad; farm CERTIFIED edges via narrowing | Yes with a human audience; **no** in two-AI (judge sees only the graph) | n/a for the first; yes for tally farming | Show the disputed node set, not tallies | §8 orders tallies first, contradicting `learnings.md` §3 |
| 4.6 | Cross-branch identification (`ConstitutionRequires`) never a claim | Yes | Yes | Typed `DEFINITION` identification with both sides' consent | Motion vocabulary is atomic; §6 demands bridges, not identifications |
| 4.7 | Formalizer authors Phase 0 unreviewed; utterance injection into the formalizer | Yes in the current setup | Yes | Adversarial review of the *initial* signature by context-bearing reviewers; instruction-stripping | `SETUP.md` roles; §2.1 assumes reviewers with context; §3.2 shields only the back-translator |

**Overall.** The protocol's claim — that a capable adversary attacks Phase 0, not the
proofs — is confirmed: none of the ten attacks touches an inference, and all ten leave
the audit green. Its stated defenses hold against a reviewer who has the domain and the
protocol's *rationale*; they hold noticeably less well against a reviewer who has only the
protocol's *text*, which is the reviewer the two-AI run specifies. The common weakness is
that every Phase 0 defense is reactive: split-on-demand is decisive once someone demands
the split, and nothing in the protocol triggers the demand. Two cheap structural additions
would change that: (i) per-side position witnesses at Phase 0 — a Frame in which each
side's whole stated position holds — which catches attacks 2 and 4.1 outright; and (ii)
Phase 0 back-translation of each side's uttered conclusion against the signature, which
catches attack 1. §2.6 needs rewording to close G1–G5, and the amendment obligation in
Q10(b) should be model-preservation rather than board-preservation.
