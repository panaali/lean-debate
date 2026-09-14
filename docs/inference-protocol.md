# The proof-carrying debate protocol: inference layer

A specification for the inference layer of an argument: which claimed steps between claims
hold, checked by a proof assistant. Its companion, `evidence-protocol.md`, specifies the
evidence layer that the leaves of this graph are handed to (§5). `thesis.md` explains how
the two fit together. The companion Lean development in `Debate/` is one full run of it against
a real transcript; wherever a rule below looks fussy, the citation next to it is the place
in that debate where the loose version breaks.

---

## The problem

Geoffrey Irving's objection to debate as a scalable-oversight method: a dishonest debater
can produce an argument that is long, sophisticated, and false, where neither the honest
opponent nor the judge can locate the flaw. Absence of a rebuttal then reads as strength.
The honest side loses by being unable to say *where* the error is.

The fix is to stop asking anyone to find the flaw. Require that every claimed logical step
carry a certificate, and let a small trusted kernel check it. Proof generation is hard;
proof checking is mechanical. The judge no longer needs to be as capable as the debaters.

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

**This is the phase to get right.** Everything downstream is mechanical; this is where a
debate can be silently decided before it starts.

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

**2.6 — The rules of this phase, and of Phase 1, are fixed before Phase 0 opens and are
not amendable by anyone during a run.** (Reworded after red team 1, which found five gaps
in the first version.) Specifically: from the moment the run's setup is published, no
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

**2.7 — Position witnesses.** (Added after red team 1.) Before argument, each side
exhibits a model of the environment in which its whole stated position holds. The
formalizer checks both. This proves the environment is satisfiable, so no edge can be
certified from an inconsistent environment (which `#print axioms` does not detect); and
it proves that no environment addition has silently deleted a side's position, since an
addition must remain consistent with both witnesses. In the worked run these are
`Constitutional.position_witness_mayes` and `position_witness_krikorian` (E35, E36).

**2.8 — Phase 0 is back-translated too.** (Added after red team 1.) The signature and
the environment go to the back-translator with symbol names replaced by opaque
identifiers, so it must work from glosses; and each side's *uttered* conclusion, as
spoken, is back-translated against the signature before argument begins. A signature in
which a side's uttered conclusion cannot be expressed is defective, and this is the
check that catches a vocabulary narrowed by deletion rather than by merge. The initial
signature receives the same adversarial review as any later addition, from reviewers who
have the domain context, not only the protocol text.

**2.9 — Countermodels are nonempty.** (Added after red team 1.) Every signature carries a
nonemptiness witness, and any individual both sides agree exists must inhabit every
countermodel. Otherwise the empty domain refutes every existential for free.

**2.5 — Log what the environment's form commits you to.** In the example, the Citizenship
Clause enters as an implication, because that is what the text says. It is *not* a
biconditional — and that single structural fact is what the pro-motion side's whole case
silently needs and never gets (`K-EX`, §4.4).

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

The generic reading was added after red team 1, which noted it is the natural reading of
most of what is said in a room and that forcing a choice between "any" and "raises the
risk" makes universals cheap to refute and probabilistic claims impossible to refute, so
the dominant strategy becomes never asserting a universal. Two further rules follow. A
rebuttal is typed and paired with its target: a PROBABILISTIC rebuttal to a universal is
not a refutation and is recorded as COMPATIBLE unless it is; a single instance against a
generic claim is an exception, not a refutation. And a PROBABILISTIC claim owes
evidence-layer work before it counts for anything; it cannot be used as an unattackable
placeholder.

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

All 11 gaps in the worked run are countermodels. None is a report of failure.

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

When an edge fails, the system computes the weakest premise that would repair it, attributes
it to the debater whose inference needed it, and puts it back to them:

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

Three of the four would be rejected on sight if anyone had to say them out loud. That is
why they work.

### 4.5 `COMPATIBLE` — checked automatically, on every rebuttal

Whenever B is entered as a rebuttal to A, the system attempts to construct a model
satisfying both, **before anything else happens**. If it succeeds, it says so.

In the worked run this fires on two of the sharpest-sounding exchanges in the hour
(`E11`, `E20`). In both, the audience hears a decisive answer and there is no
disagreement at all. This is the single highest-value verdict the system produced on real
material, and it costs nothing to run.

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
motion on the floor. And (after red team 1) every *identification* of a symbol in one
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

**The audit is mechanical.** `#print axioms` runs over every verdict at build time. In the
worked development all 30 report *does not depend on any axioms* — including all 11
countermodels, which is what makes a `GAP` a proof of unprovability rather than a report
of defeat. Every claim is therefore either a labelled hypothesis visible in a signature,
or derived. There is no third category and no way to add one.

---

## 8. What the judge sees

Not the proofs. Three things, in this order (reordered after red team 1; the first
version put tallies first, which `learnings.md` §3 had already argued against, and which
lets a side farm CERTIFIED edges by over-asserting and accepting the narrowed version):

1. **The disputed node set** — five propositions, in this case.
2. **The unstated premises**, with owners.
3. **The tallies**, last and least: `16 certified · 3 refuted · 13 proved gaps · 4
   non-clashes`, and by status: `8 empirical · 9 contested meanings · 3 values · 4 nobody
   stated`. Never as a score.

A weak judge can engage with *"is citizenship at birth the child's own entitlement, or
something the parents conferred?"* A weak judge cannot engage with an hour of rhetoric.
That gap is the entire proposition.

---

## 9. Running it between two AIs

This is where the protocol earns its cost, and several things change.

**9.1 — The debaters approve their own formalizations, and that is fine.** Approval is a
*commitment*, and commitments are attackable. The incentive points the right way: approve
something weaker than you meant and you have given away ground; approve something stronger
and you have to defend it.

**9.2 — The formalizer must be a third party.** Neither debater may formalize its own or
its opponent's speech. With the back-translator (§3.2) that is three independent models
between an utterance and the graph.

**9.3 — The deductive layer needs no human judge at all.** Every edge verdict is
kernel-checked and machine-scorable. Human attention goes entirely to the disputed leaves
— which is the scalable-oversight decomposition the whole exercise is aiming at.

**9.4 — A superhuman liar gains nothing inside the graph.** It cannot produce a Lean proof
of a false consequence, and it cannot stop the honest side producing a countermodel, since
countermodel-checking is as mechanical as proof-checking. The 30-minute sophisticated mush
has nowhere to go: it either compiles into edges, or the missing premises get extracted
and named.

**9.5 — So the entire attack surface migrates to §2 and §3**, and should be resourced
accordingly. Expect a capable adversary to attack the signature, not the proofs: to argue
for a merge that looks like a simplification, to accept a formalization slightly stronger
than the opponent meant, to let a quantifier stay ambiguous. Adversarial signature review,
mandatory split-on-demand, and quantifier elicitation at assertion time are the defenses,
and they are the parts to build first.

**9.6 — Fix the record.** Both AIs answer the same formal proposition, in the same
environment, with the source material frozen at a stated date.

**9.7 — The formalizer is not exempt.** (Added after red team 1.) When the formalizer
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
