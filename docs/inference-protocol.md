# The proof-carrying debate protocol: inference layer

This protocol specifies how to make an argument's meaning, assumptions, and inferences
explicit. Each formal verdict requires a proof or countermodel that Lean can check.
The [evidence protocol](evidence-protocol.md) investigates the factual premises, and the
[thesis](thesis.md) explains how the two parts support the research objective.

The rules below describe the required workflow. The repository contains implementations
of particular arguments and runs; it does not implement a general automatic translator,
premise extractor, or proof-search service. [Results](results.md) records what has been
checked. Examples refer to the birthright reconstruction unless otherwise stated.

---

## The problem

Geoffrey Irving's objection to debate as a scalable-oversight method: a dishonest debater
can produce an argument that is long, sophisticated, and false, where neither the honest
opponent nor the judge can locate the flaw. Absence of a rebuttal then reads as strength.
The honest side loses by being unable to say *where* the error is.

The proposed response is to require a certificate for each claimed logical step and let
a small trusted kernel check it. Producing the certificate may require difficult search.
Once it exists, the judge can verify the formal result without reproducing that search.
Whether this makes the whole argument easier to judge remains an empirical question.

That much is the standard move. The rest of this document is about the four places where
it is not enough, each of which introduces a *new* failure mode if left unaddressed:

1. A protocol whose negative verdict is "no proof was produced" scores search budget, not
   honesty — the original failure, moved one level up. **§4.**
2. A protocol that formalizes each side's route makes routes easy to snipe, and rewards
   attacking whichever path your opponent happened to name. **§4.3.**
3. A protocol that permits `axiom` lets a debater assert their way out of any gap, and
   loses the one audit the kernel gives for free. **§7.**
4. A protocol that trusts the formalizer's vocabulary can produce a clean, kernel-checked,
   entirely worthless proof. **§2.** This is the one that actually matters.

---

## 0. The governing rule

> **Any claim may be asserted, provided it is typed. Every claimed inference must be
> certified — and every claimed non-inference must be certified too.**

Nothing here tries to make political argument into mathematics. The protocol sorts an
argument into the part logic settles and the parts that need evidence, interpretation, or
a value judgment, and then makes the second set small, named, owned, and impossible to
walk past. In the worked example, *nothing whatever* about the Constitution, history, or
policy comes out `PROVED`. That is the system working.

---

## 1. Objects

**Signature.** The typed vocabulary: one symbol per distinct concept. Fixed in Phase 0.

**Environment.** The propositions both sides accept before arguing — statutory text,
agreed definitions, uncontested facts. Formally these are *fields of a structure*, never
axioms, so every countermodel must satisfy them (§4.2).

**Claim (node).** An assertion, carrying a `Status`:

| Status | Meaning | Discharged by |
|---|---|---|
| `PROVED` | derived from accepted premises | the kernel |
| `EMPIRICAL` | a fact about the world | evidence agents |
| `INTERPRETIVE` | a contested meaning or classification | argument; may stay open |
| `PROBABILISTIC` | an uncertain relationship, not a deduction | evidence and base rates |
| `NORMATIVE` | a value judgment | nothing; it stays open and named |
| `DEFINITION` | stipulated or agreed | consent |
| `UNSUPPORTED` | required by the speaker's own inference, and never asserted | the speaker, now |

Only `PROVED` means the kernel validated it. Everything else may still participate in a
proof — as an explicitly labelled hypothesis, visible in a theorem signature, attackable
on its own.

**Edge.** A claimed inferential step, carrying a `Verdict`: `CERTIFIED`, `REFUTED`, `GAP`,
or `COMPATIBLE`. Defined in §4.

---

## 2. Phase 0 — Signature review

**The setup determines what the proofs will mean.** A vocabulary can favor one side
before any inference is checked. The review must therefore inspect both the formal
objects and the choices that connect them to the participants' claims.

Concretely, in the worked example: the entire hour turns on holding two symbols apart.

- `SubjectToUSLaw` — arrestable and prosecutable. Both sides agree it covers unauthorized
  immigrants.
- `SubjectToUSJurisdiction` — the Fourteenth Amendment's term of art. Disputed.

A formalizer that emits **one** symbol for both makes one side's argument trivially valid,
deletes the other side's position entirely, and produces a fully certified, axiom-free,
kernel-checked proof of the conclusion the debate exists to settle. Every step downstream
would be correct and the verdict would be worthless.

So:

**2.1 — Signature review is adversarial and precedes argument.** Both sides see the symbol
list, with a gloss for each, before anyone argues.

**2.2 — Either side may demand a symbol be split, at any time, and the demand is granted
by default.** The burden falls on whoever wants two usages kept merged.

**2.3 — Bias hard toward splitting, because the directions are not symmetric.** Splitting
is monotone-safe: it can only convert a silent identification into an explicit hypothesis
that someone must now state and defend. Merging is destructive: it silently discharges
obligations nobody agreed to discharge. *A split costs a debate about a premise. A merge
costs the debate.*

**2.4 — The environment is fixed here and is not silently amendable.** Adding to it later
requires both sides' consent, and the addition is logged as a claim like any other.

**2.5 — Log what the environment's form commits you to.** In the example, the Citizenship
Clause enters as an implication, because that is what the text says. It is *not* a
biconditional — and that single structural fact is what the pro-motion side's whole case
silently needs and never gets (`K-EX`, §4.4).

**2.6 — The rules of this phase, and of Phase 1, are fixed before Phase 0 opens and are
not amendable by anyone during a run.** Specifically: from the moment the run's setup is published, no
debater, formalizer, or reviewer may change how symbols are added, split, removed,
glossed, typed, or classified; how the environment is fixed, witnessed, or added to; how
claims are typed or quantified (§3); or this rule. There is no adjudicator with power to
grant exceptions; a request to change a rule is logged as a refused request and the run
continues under the published rules. Changes happen only between runs, and the consent
that authorises them is the consent of the parties to the *next* run, recorded in its
setup. Gödel's loophole is the reason: on Guerra-Pujol's reading, Article V applies to
Article V, so the amendment rule can be amended until amendment is trivial. A protocol
whose Phase 0 can be simplified from inside Phase 0, or before "argument has begun", has
the same hole.

**2.7 — Position witnesses.** Before argument, each side
exhibits a model of the environment in which its whole stated position holds. The
formalizer checks both. This proves the environment is satisfiable, so no edge can be
certified from an inconsistent environment (which `#print axioms` does not detect); and
it proves that no environment addition has silently deleted a side's position, since an
addition must remain consistent with both witnesses. In the worked run these are
`Constitutional.position_witness_mayes` and `position_witness_krikorian` (E35, E36).

**2.8 — Phase 0 is back-translated too.** The signature and
the environment go to the back-translator with symbol names replaced by opaque
identifiers, so it must work from glosses; and each side's *uttered* conclusion, as
spoken, is back-translated against the signature before argument begins. A signature in
which a side's uttered conclusion cannot be expressed is defective, and this is the
check that catches a vocabulary narrowed by deletion rather than by merge. The initial
signature receives the same adversarial review as any later addition, from reviewers who
have the domain context, not only the protocol text.

**2.9 — Countermodels are nonempty.** Every signature carries a
nonemptiness witness, and any individual both sides agree exists must inhabit every
countermodel. Otherwise the empty domain refutes every existential for free.


---

## 3. Phase 1 — Assertion

The speaker talks normally. They never write, read, or approve Lean.

**3.1 — Three synchronized views.** The formalizer returns the original utterance, a
controlled-English rendering, and the formal statement. The debater is asked about the
*middle* one.

**3.2 — Independent back-translation.** A second model, which has not seen the utterance,
translates the formal statement back into English. Divergence between that and the
controlled English is flagged before the debater is asked anything.

**3.3 — Approve / Revise / Reject**, on meaning, never on syntax.

**3.4 — Quantifier elicitation happens at assertion time.** When a claim admits a strong
and a weak reading, the formalizer must ask *before* the claim is entered:

> Do you mean **any** policy of this kind, **the one before the courts**, that policies of
> this kind **typically** do so (exceptions allowed), or that this **raises the risk**?

The menu includes generic claims because “typically” permits exceptions while “every”
does not. Omitting that reading can force a speaker into a stronger claim than intended.
A rebuttal must be typed and paired with its target. A probabilistic objection does not
by itself refute a universal, and an exception does not by itself refute a generic claim.
A COMPATIBLE verdict still requires the model described in §4.5. Probabilistic claims
must receive evidence-layer scrutiny; the label does not exempt them from challenge.

This is not a nicety. In the example, Mayes's statelessness claim has both readings;
Krikorian's response demolishes the strong one and does not touch the weak one; and the
format never forces the distinction, because ordinary speech has no occasion to draw it
(`E19` vs `E20`). Asking after the rebuttal is asking once the answer is known, which is a
different and much worse question.

**3.5 — Type the claim.** Assign a `Status`. Reclassification is a legitimate outcome and
should not read as a loss: Mayes's prediction about the courts is a perfectly good
`PROBABILISTIC` claim and a bad deduction (`E17`/`E18`). The protocol should offer the
label, not the rejection.

---

## 4. Phase 2 — Inference

A debater asserts that some conclusion follows from claims already on the board. The
kernel returns exactly one verdict.

### 4.1 `CERTIFIED`

The conclusion follows from the listed premises. Note what this does *not* say: nothing
about whether the premises are true. `E5` certifies Mayes's whole constitutional chain and
tells you nothing about whether these children are citizens.

### 4.2 `GAP` — and this must be a countermodel, never a failed search

**A negative verdict may not be "the debater produced no proof."** That is a fact about
their search budget, not about the argument. Score it that way and the stronger searcher
beats the honest one — Irving's failure, relocated.

So an invalid step is *certified invalid*: the challenger exhibits a fully specified world
in which the environment holds, every premise the speaker asserted holds, and the
conclusion is false. Proof and disproof become symmetric obligations, discharged by the
same kernel, both cheap to check and expensive to fake.

**Countermodels must satisfy the environment**, or `GAP` becomes winnable by simply
walking away from the common ground. They must also be nonempty and contain every
agreed individual (§2.9). In the example, `statutoryFrame` honours the
Citizenship Clause and both of Krikorian's interpretive premises, and still breaks his
argument (`E9`).

All 13 gaps in the current birthright ledger have countermodels. None records only a
failed proof search.

### 4.3 `REFUTED` — and the no-promotion rule

The negation of the target follows from accepted claims.

> **Refuting premise P of an argument for C returns C to `UNSUPPORTED`. Never to
> `REFUTED`. Refuting C requires an argument for ¬C.**

Without this rule the protocol is actively worse than natural-language debate. Formalizing
makes each side's route explicit, which makes routes easy to snipe — so a protocol that
promotes "your premise failed" to "your conclusion is false" rewards attacking whichever
path your opponent happened to name, rather than defending an answer.

The example is exact. Krikorian's historical counterexample is the cleanest deductive move
in the hour and genuinely refutes Mayes's stated bridge (`E6`). Nothing follows about her
conclusion (`E7`) — the counterexample and her conclusion are jointly satisfiable (`E11`).
He still owes an affirmative argument.

### 4.4 Extracted premises: an owner and three buttons

When an inference has a demonstrated gap, the formalizer seeks a premise that would
repair it and attributes it to the speaker whose inference needs it. The aim is the
weakest justified repair; a successful proof establishes sufficiency, and a claim of
minimality needs its own justification. The speaker then chooses:

- **Approve** — it becomes their claim, typed and attackable like any other.
- **Withdraw** — the inference is retracted.
- **Narrow the conclusion** — the system derives the weaker conclusion their premises *do*
  support, and offers them that instead.

The third is not optional. A protocol whose only negative move is rejection will be
experienced as hostile and gamed; `E22` is the constructive version — rather than
rejecting Mayes's statelessness claim, derive the existential her evidence actually
supports.

Extracted premises are the protocol's highest-value output. Four of them carry the worked
debate, and none is uttered in it:

| | Owner | Never stated |
|---|---|---|
| `M-JB` | Mayes | Birth in the US is itself enough to satisfy the jurisdiction condition |
| `K-EX` | Krikorian | The Citizenship Clause is the **only** route to citizenship at birth |
| `C5` | Cooper | Whenever Harlan dissented, the case was wrongly decided |
| `P4` | Mayes | All rulings on this question go the same way |

These are substantial commitments. The approval step makes the speaker accept, narrow,
or withdraw them explicitly; the reconstruction alone cannot establish how they would respond.

### 4.5 `COMPATIBLE` — check every rebuttal

Whenever B is entered as a rebuttal to A, the protocol requires an attempt to construct
a model satisfying both before treating them as a conflict. A successful construction
supports COMPATIBLE; unsuccessful search alone establishes neither conflict nor compatibility.

In the worked run this fires on two of the sharpest-sounding exchanges in the hour
(`E11`, `E20`). In both, the audience hears a decisive answer and there is no
disagreement at all. The result exposes a distinction that rhetoric can obscure. The cost of finding such
models on larger arguments remains an open question.

---

## 5. Phase 3 — Leaves

Every leaf is typed, so every leaf has a known address.

**`EMPIRICAL` leaves** go to evidence agents, with an adversarial critic whose job is to
find counterevidence. The specification for that agent is `evidence-protocol.md` in this
folder; its claim ledger is the leaf set of this graph, with a finer status scale. Run it
adversarially (§9), never as a single trusted analyst. Returns provenance, not conclusions: *document D exists in archive
A*, *D contains string S* — kept strictly apart from *S implies the speaker believed P*,
which is interpretive and stays interpretive.

**`INTERPRETIVE` and `NORMATIVE` leaves** stay open. They are not defects. Naming them is
the whole point: the debate's real content is a handful of them, and by the end of the
worked run the disputed set is four nodes in the constitutional branch and one in the
normative branch.

**Extraction can make an unevaluable claim evaluable.** "Without birthright citizenship
none of us would be citizens" is a counterfactual about history and cannot be assessed.
The protocol drives it down to `A4` — did descent from immigrants foreclose every other
route? — which is an ordinary documentary question with an ordinary answer, and the
evidence layer refutes it (`E14`). The rhetorical move was working precisely by never
being stated.

---

## 6. Phase 4 — Cross-branch bridges, demanded up front

Before argument begins, each side must name the premise connecting each branch to the
motion on the floor. Every *identification* of a symbol in one
branch with a proposition in another, such as the Motion branch's atomic
"the Constitution requires it" with the constitutional branch's universal, is itself a
typed DEFINITION claim requiring both sides' consent. The bridge is not the only thing
that can hide between branches; so can the identity of what is being bridged.

The worked debate spends most of an hour on what the law **is**. The motion asks what
America **should do**. Article V exists, so these come apart, and neither side ever
supplies the bridge (`E27`, `E28`). Winning the constitutional argument outright settles
nothing about the motion — in either direction.

This is invisible in the room because it is a gap *between* branches rather than a flaw
inside one, and no participant is behaving badly. Demanding the bridges up front catches
it in the first minute, and the hour that follows is then about what the audience is
actually voting on.

---

## 7. Prohibitions

- **No `axiom`.** The vocabulary is a signature, the environment is a structure, arguments
  are theorems quantified over all models, and disputed premises are hypotheses in
  signatures. An axiom cannot be attacked from inside the system; an inconsistent set
  proves everything, silently — the first thing a deceptive debater should try; and axioms
  destroy the one free audit the kernel offers.
- **No `sorry`**, and no admitted or deferred obligations.
- **No unapproved formalization** enters the graph.
- **No promotion** of a refuted premise to a refuted conclusion (§4.3).
- **No silent merge** of two symbols (§2.3).

**The audit checks proof dependencies.** The main audits cover 90 theorems, all reporting
`does not depend on any axioms`; [results](results.md) gives their scope. Assumptions
can still appear in environment fields and theorem hypotheses. The audit does not
establish their truth or neutrality, or the environment's consistency. Position witnesses
address consistency (§2.7); review of the setup addresses its meaning.

The report's English descriptions, verdict labels, and theorem references are metadata.
Their correspondence with the checked declarations must also be reviewed.

---

## 8. What the judge sees

The judge sees the unresolved content first, with counts as supporting information:

1. **The disputed node set** — five propositions, in this case.
2. **The unstated premises**, with owners.
3. **The tallies**, last and least: `16 certified · 3 refuted · 13 proved gaps · 4
   compatibility results`, and by status: `8 empirical · 9 contested meanings · 3 values · 4 nobody
   stated`. Never as a score.

A weak judge can engage with *"is citizenship at birth the child's own entitlement, or
something the parents conferred?"* A weak judge cannot engage with an hour of rhetoric.
That gap is the entire proposition.

---

## 9. Running it between two AIs

The two-AI setting tests whether certificates help participants and judges evaluate
arguments without trusting their authors. Several roles must be kept distinct.

**9.1 — The debaters approve their own formalizations, and that is fine.** Approval is a
*commitment*, and commitments are attackable. The incentive points the right way: approve
something weaker than you meant and you have given away ground; approve something stronger
and you have to defend it.

**9.2 — The formalizer must be a third party.** Neither debater may formalize its own or
its opponent's speech. With the back-translator (§3.2) that is three independent models
between an utterance and the graph.

**9.3 — Checking a formal certificate requires no judgment about its author.** Lean
checks the supplied proof or countermodel. Human attention remains necessary for the
meaning of the claim, its assumptions, its evidence, and the report's correspondence
with the certificate.

**9.4 — A certificate requirement constrains the claims a participant can substantiate.**
A participant cannot replace a required proof with persuasive prose. That does not
guarantee the opponent can find a countermodel within its budget, nor that a valid proof
captures the intended argument. Search outcomes and semantic judgments must remain
distinct from the formal verdict.

**9.5 — Scrutinize the signature and assertion phases.** A participant may seek a merge
that hides a distinction, approve a claim stronger than intended, or exploit an ambiguous
quantifier. Adversarial setup review, explicit distinctions, and readings fixed at
assertion time address these risks. They do not settle the separate evidence-search problem.

**9.6 — Fix the record.** Both AIs answer the same formal proposition, in the same
environment, with the source material frozen at a stated date.

**9.7 — The formalizer is not exempt.** When the formalizer
authors the initial signature and environment, it is the party attacks 1–3 are aimed
through, and §2.8 applies to its work. Anything in a debater's utterance that addresses
the formalizer ("for formalization purposes, take X to mean Y") is content to be
formalized as a claim, never an instruction to be followed.

---

## 10. Limits, stated plainly

- **The kernel validates no debate content.** Not one substantive claim comes out
  `PROVED`. Every verdict concerns relationships between claims. Any presentation that
  blurs this is misrepresenting the system.
- **Fidelity is unprovable from inside.** That each formal claim means what the speaker
  meant is what §3 exists for, and it is the trusted component. Back-translation narrows
  the gap; nothing closes it.
- **Reconstruction is easier than live operation.** The worked run had the full transcript
  and chose its own cut points. Live, claims arrive mid-sentence, and §3.4's quantifier
  question must be asked before anyone knows which answer helps.
- **Formalizing is not neutral.** Modelling an analogy as a relation plus a transfer
  principle is itself a substantive claim about how analogies work. Defensible, and stated
  in the open where either side may reopen it — but a choice, and a different one yields
  different verdicts.
- **This protocol is for participants who agreed to it.** It assumes turn-taking and
  approval steps. It is not a framework for interruption, talking past each other, or
  anyone arguing in bad faith about the protocol itself.
