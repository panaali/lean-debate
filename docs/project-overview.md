# Proof-carrying debate: project overview

This document describes the `debate` project as a whole: where it came from, what it
contains, what it found, and where it stands. It is written from the full record of the
one Claude Code session that produced the project (17–26 August 2026) and from every file
currently in the directory.

All documentation lives in `docs/`. Companion documents, each with a different job:

| File | Role |
|---|---|
| `sources/lean-in-social-science.md` | The source: a ChatGPT conversation that sketched the idea (originally "Lean in Social Science.md") |
| `sources/analytic-philosophy-and-bell.md` | Epistemology of graded evidence, and EPR/Bell as a worked example |
| `sources/case-amini-un-fact-finding.md` | Evidence-layer investigation of a contested death |
| `sources/case-credit-dispute.md`, `sources/case-credit-dispute-agent-run.md` | Evidence-layer investigation of a research-credit dispute, and the run that exposed the analyst's own errors |
| `sources/discussion-2026-09-13.md` | The session in which the evidence layer, the roles, EPR, Gödel's loophole, and the scientific method were connected to the project |
| `results.md` | The result: what was built and what it found (originally the README) |
| `inference-protocol.md` | The inference-layer specification, rewritten after the exercise (was PROTOCOL.md) |
| `learnings.md` | The judgment layer: what the exercise is worth, and where it fails |
| `project-overview.md` | This file: the project described end to end |
| `thesis.md` | The frame: why a logician for English, two layers one ledger, concept map, roadmap |
| `evidence-protocol.md` | The evidence-layer specification (Phase 3 of the protocol) |
| `sources/` | The raw conversations everything above was derived from |

---

## 1. What the project is

A machine-checked formalization of one real political debate, built as a test of a
protocol for "proof-carrying debate".

The debate is *Should America End Birthright Citizenship?*, an Open to Debate event
from June 2026. Mark Krikorian and Horace Cooper argued for the motion; Kris Mayes and
Chris Newman argued against it.

The project takes the arguments each speaker made and turns them into an **argument
graph**. Nodes are claims, each labelled with the kind of justification it needs. Edges
are the inferential steps speakers claimed between those nodes. Every edge is then
checked by the Lean 4 proof assistant and given exactly one verdict.

The point is not to decide who is right about birthright citizenship. Lean is never
asked to evaluate a claim about the Constitution, history, or policy. It is asked only
whether each step from premises to conclusion actually holds. The substantive claims
stay explicitly labelled as things that need evidence, interpretation, or a value
judgment.

The motivation is a problem in AI alignment. Geoffrey Irving has argued that debate
fails as an oversight method when a dishonest debater can produce a long, sophisticated,
false argument that neither the honest opponent nor the judge can find the flaw in. This
project tests one response: require every claimed logical step to carry a certificate a
small trusted kernel can check, so nobody has to find the flaw by hand.

---

## 2. How it came about

### 2.1 The source conversation

`sources/lean-in-social-science.md` is an exported ChatGPT conversation. It develops the idea
in stages:

1. What kinds of social-science argument can be written in Lean at all. The answer
   separates formal validity (Lean can check it) from empirical, interpretive, and
   normative justification (Lean cannot).
2. Whether ordinary two-person arguments can be formalized. Partly: the deductive
   structure can, but open-textured terms and defeasible reasoning need explicit models.
3. Irving's 80,000 Hours interview, and whether forcing debaters to state their
   arguments in Lean would block the "mushy false argument" failure. The conversation
   proposes a proof-carrying debate protocol with a fixed formal question, a fixed shared
   environment, mandatory proofs for deductive claims, and explicit exposure of every
   assumption.
4. A test against an Open to Debate transcript. The birthright citizenship debate was
   chosen because it mixes constitutional interpretation, historical claims, predictions,
   analogies, and values. The conversation proposes that AI formalizers convert what
   debaters say, that debaters approve, revise, or reject the controlled-English
   rendering rather than Lean source, that a separate AI back-translates the formal
   statement as a fidelity check, and that evidence agents investigate empirical leaves.
5. A first pass over roughly six minutes of the transcript, and a list of mistakes Lean
   would have caught: Mayes dropping the jurisdiction condition, the cartel example not
   reaching the children, the ancestry argument, Cooper's Harlan argument, Mayes's court
   prediction, and Cooper's bank-robbery analogy.

The user's stated intent in that conversation: this is not a framework for live human
debates with interruptions. It is for participants who follow an approve/reject
protocol, and specifically for two AIs debating this kind of topic.

### 2.2 The Claude Code session

One Claude Code session, run from this directory, did the rest. Its opening instruction
was to read the source document and complete the work for this specific debate.

Timeline, from the session record:

| Date | What happened |
|---|---|
| 17 Aug 2026 | Lean 4 (v4.24.0) installed via elan. The user asked to verify the install method against the official manual; it matched. |
| 17 Aug 2026 | The whole Lean development written and built: protocol layer, six debate branches, axiom audit, ledger, report executable. First build had one type error in a countermodel, fixed by narrowing the model. |
| 17 Aug 2026 | `results.md` written. A `DESIGN.md` of protocol corrections was written, then folded into a full `inference-protocol.md` and deleted. A findings page was published as a private artifact. |
| 17–18 Aug 2026 | Follow-up questions: scoring the debaters, what Mayes's conclusion was in plain terms, whether any argument could defeat it, whether Lean adds real value, Irving's full list of problems, a worked case where the protocol does not help, and whether RL training dissolves that case. |
| 18 Aug 2026 | The session was briefly used to check the logic of an unrelated document. That work is not part of this project. |
| 26 Aug 2026 | `learnings.md` written on request, and a pointer added to `results.md` (then named README.md). |

---

## 3. The protocol

`inference-protocol.md` is the specification. This section summarizes it.

### 3.1 Governing rule

Any claim may be asserted, provided it is typed. Every claimed inference must be
certified, and every claimed non-inference must be certified too.

### 3.2 Objects

**Signature.** The typed vocabulary, one symbol per distinct concept, fixed before
argument begins.

**Environment.** The propositions both sides accept before arguing: statutory text,
agreed definitions, uncontested facts. Formally these are fields of a structure, never
axioms, so every countermodel must satisfy them.

**Claim (node).** Carries a status:

| Status | Meaning | Discharged by |
|---|---|---|
| `PROVED` | derived from accepted premises | the kernel |
| `EMPIRICAL` | a fact about the world | evidence agents |
| `INTERPRETIVE` | a contested meaning or classification | argument; may stay open |
| `PROBABILISTIC` | an uncertain relationship, not a deduction | evidence and base rates |
| `NORMATIVE` | a value judgment | nothing; it stays open and named |
| `DEFINITION` | stipulated or agreed | consent |
| `UNSUPPORTED` | required by the speaker's own inference, never asserted | the speaker, now |

Only `PROVED` means the kernel validated the node.

**Edge.** A claimed inferential step, carrying a verdict:

| Verdict | Meaning |
|---|---|
| `CERTIFIED` | the conclusion follows from the listed premises |
| `REFUTED` | the negation of the target follows from accepted claims |
| `GAP` | a countermodel exists: every premise holds, the conclusion fails, so no proof can exist |
| `COMPATIBLE` | two claims that sounded like a clash are jointly satisfiable |

### 3.3 Phases

**Phase 0, signature review.** Adversarial, and before any argument. Either side may
demand that a symbol be split, and the demand is granted by default. Splitting can only
turn a silent identification into an explicit hypothesis; merging silently discharges
obligations nobody agreed to. The environment is fixed here and logged, including what
its form commits you to (for example, that the Citizenship Clause is an implication,
not a biconditional).

**Phase 1, assertion.** The speaker talks normally and never touches Lean. The
formalizer returns three synchronized views: the original utterance, a
controlled-English rendering, and the formal statement. A second model that has not
seen the utterance back-translates the formal statement; divergence is flagged. The
debater approves, revises, or rejects on meaning. Quantifier ambiguity is resolved at
assertion time, before anyone knows which reading helps. The claim is typed, and
reclassification (for example from deductive to probabilistic) is offered as a label,
not a rejection.

**Phase 2, inference.** The kernel returns exactly one verdict per edge. A negative
verdict must be a countermodel, never "no proof was produced", because the latter
measures search budget rather than honesty. Countermodels must satisfy the environment.
Refuting a premise of an argument for C returns C to `UNSUPPORTED`, never to `REFUTED`
(the no-promotion rule). When an edge fails, the system computes the weakest repairing
premise, attributes it to the debater, and offers three buttons: approve, withdraw, or
narrow the conclusion. Whenever B is entered as a rebuttal to A, the system first tries
to build a model satisfying both, and says so if it succeeds.

**Phase 3, leaves.** Empirical leaves go to evidence agents with an adversarial critic,
returning provenance rather than conclusions. Interpretive and normative leaves stay
open and named.

**Phase 4, cross-branch bridges.** Before argument begins, each side must name the
premise connecting each branch to the motion on the floor.

### 3.4 Prohibitions

No `axiom`. No `sorry` or deferred obligations. No unapproved formalization enters the
graph. No promotion of a refuted premise to a refuted conclusion. No silent merge of
two symbols. The audit is mechanical: `#print axioms` runs over every verdict at build
time.

### 3.5 What the judge sees

Not the proofs. Three things: the tallies, the unstated premises with owners, and the
disputed node set.

### 3.6 Running it between two AIs

Debaters approve their own formalizations; approval is a commitment and commitments are
attackable. The formalizer must be a third party. The deductive layer needs no human
judge. A superhuman liar gains nothing inside the graph, so the attack surface migrates
to the signature and assertion phases, which should be built and resourced first. Both
AIs answer the same formal proposition in the same environment with sources frozen at a
stated date.

---

## 4. The Lean development

### 4.1 Build and layout

Plain Lean 4, version 4.24.0, no Mathlib, no external packages. Build takes a few
seconds.

```bash
lake build       # builds the library and prints the axiom audit
lake exe report  # prints the judge-facing ledger
```

```
Debate.lean                        imports every module
Main.lean                          entry point for the report executable
Debate/Protocol.lean               statuses, verdicts, claim and edge records, rendering
Debate/Birthright/
  Constitutional.lean              the Citizenship Clause; "subject to the jurisdiction"
  Ancestry.lean                    "none of us would be citizens"
  Judicial.lean                    Harlan's dissents; predicting the Supreme Court
  Policy.lean                      statelessness; the moderator's domain objection
  Normative.lean                   punishing children; the stolen-money analogy
  Motion.lean                      the is/ought gap between branches and the motion
  Audit.lean                       #print axioms for all 30 verdicts
  Ledger.lean                      the judge-facing report
```

Size at the end of the session: 30 theorems, 16 model definitions, about 1,315 lines
of Lean across the protocol and branch files.

### 4.2 The design decision that carries everything

The source conversation used `axiom` for every piece of debate content. The session
rejected that primitive, for three reasons: an axiom cannot be attacked from inside the
system, an inconsistent axiom set proves everything silently, and axioms destroy the
one free audit the kernel offers.

Instead, in every branch:

- The debate vocabulary is a `structure` called `Vocab`, a signature.
- The environment both sides accept is a `structure Frame extends Vocab` whose fields
  are the agreed propositions (for example `citizenship_clause`).
- Every speaker's premise is a `def` producing a `Prop` over a `Vocab`.
- Every argument is a `theorem` quantified over all frames, with the speaker's premises
  as explicit hypotheses in the signature.
- Every `GAP` verdict is a theorem of the form "it is not the case that for all frames,
  premises imply conclusion", proved by exhibiting a concrete frame (a countermodel)
  built from small types like `Unit` and `Bool`.
- Every `COMPATIBLE` verdict is an existence proof of a frame satisfying both claims.

Because countermodels are frames, they must satisfy the environment. Nobody can win a
gap by walking away from the common ground.

`Audit.lean` runs `#print axioms` over all 30 verdicts. Every one reports that it does
not depend on any axioms, countermodels included. The session's final grep of the source
found no `axiom` or `sorry` declarations anywhere.

### 4.3 The protocol layer

`Protocol.lean` contains no debate content. It defines the `Status` and `Verdict`
inductives with their labels, a `Speaker` type (the four debaters, the moderator, and
`shared` for environment claims), a `Claim` record (id, speaker, status, controlled
English, the name of the Lean definition carrying it, and a note), an `Edge` record
(id, premises, conclusion, verdict, the name of the witnessing theorem, and a note), and
text rendering helpers used by the ledger.

### 4.4 The branches

**Constitutional** (`Constitutional.lean`). The vocabulary keeps two predicates apart:
`SubjectToUSLaw` (arrestable and prosecutable, agreed by both sides) and
`SubjectToUSJurisdiction` (the Fourteenth Amendment's term of art, disputed). Holding
them apart is most of the work; a formalizer that merged them would make the whole
debate trivially valid for one side. The environment field is the Citizenship Clause as
an implication: born in the US and subject to jurisdiction implies citizen at birth.

Findings in this branch:

- Mayes states the two-condition clause and restates it with one condition. That step
  is a gap; it becomes valid only with the extracted premise M-JB (birth alone implies
  jurisdiction).
- Her cartel example does not reach the children. The repair generalizes it into J17
  (answerable to US law implies subject to jurisdiction), which is exactly what
  Krikorian denies. With J17 and the uncontested claim that these children are
  answerable to US law, her whole chain certifies.
- Krikorian's counterexample (a class of people prosecutable yet outside the clause's
  jurisdiction condition) refutes J17 cleanly. One instance defeats a universal.
- But refuting J17 does not deliver his conclusion. A countermodel shows J17 false and
  every child of unauthorized parents still a citizen at birth.
- His affirmative route (exclusive-allegiance reading plus the claim that these
  children lack exclusive allegiance) certifies that they fail the jurisdiction
  condition, but not that they are not citizens. The clause gives a sufficient
  condition, not a necessary one. He silently needs K-EX: the clause is the only route
  to citizenship at birth. Nobody in the debate states, defends, or attacks it.
- Krikorian's counterexample and Mayes's conclusion are jointly satisfiable. Their
  apparent clash is an artefact of the route she offered.

**Ancestry** (`Ancestry.lean`). Mayes: without birthright citizenship, since everyone
descends from immigrants, none of us would be citizens. The environment says
citizenship is acquired by birthright or by some other route. The inference is a gap;
a world with no birthright citizenship where everyone is a citizen by statute satisfies
both premises. The extracted premise A4 (descent from immigrants closes every other
route) makes it valid, and A4 is an ordinary historical question that the evidence
layer refutes: naturalization existed from 1790. This is the one place the whole
pipeline runs end to end, from rhetoric to extracted premise to refuted fact.

**Judicial** (`Judicial.lean`). Two arguments about courts failing the same way.
Cooper: Harlan dissented in *Plessy* and was vindicated, and dissented in *Wong Kim
Ark*, so that case was wrongly decided. The environment grants that a vindicated dissent
means the case was wrong. The step is still a gap; validity requires C5, that whenever
Harlan dissented the case was wrongly decided, which nobody would approve. The
productive repair routes back to Harlan's actual reasoning, which is the
exclusive-allegiance reading already in the constitutional branch. Mayes: every ruling
so far has gone against the pro-motion side, so the Supreme Court will too. Gap;
validity requires P4, that all rulings on the question agree. The protocol's real output
is a reclassification to `PROBABILISTIC`, recorded as a `def` rather than a theorem so
nothing can cite it as established.

**Policy** (`Policy.lean`). Mayes: ending birthright citizenship creates a stateless
class. Krikorian: other countries avoid that by design (a residence rule, an opt-in at
adulthood). Whether these conflict depends on the quantifier in Mayes's claim. Against
the universal reading, Krikorian's single design refutes her. Against the particular
reading (the executive order before the courts creates a stateless class), the two are
jointly satisfiable and his reply is not a rebuttal at all. The moderator's intervention
(the debate is about the principle, not the executive order) is formalized as a gap
from the particular to the universal, and the narrowing the interface would offer is
certified: from the particular case she gets an existential.

**Normative** (`Normative.lean`). Newman: do not penalize a child solely for parental
conduct. Cooper: recovering stolen money from children who received it is not punishing
them, so ending birthright citizenship is not either. The environment stipulates what
an analogy must do (a verdict transfers between relevantly similar policies) and when it
fails (removing a person's own entitlement is not relevantly similar to recovering a
parental transfer). Newman's argument certifies, given his classification claim. Cooper's
analogy is a gap until the single premise C-A (ending birthright citizenship is
relevantly like recovering stolen money) is added. Several minutes of vivid argument
reduce to that one node. Newman's reply, that citizenship by birth is the child's own
entitlement, blocks the analogy at that node. The debate as held never reaches it.

**Motion** (`Motion.lean`). Most of the hour argues what the law is. The motion asks
what America should do. Both directions are gaps: the Constitution requiring birthright
citizenship does not settle that America should keep it (Article V exists), and the
Constitution not requiring it does not settle that America should end it (Congress could
keep it by statute). Each side reaches the motion only through its own unstated
normative bridge, NB1 for the anti-motion side and NB2 for the pro-motion side, and
they are different bridges.

### 4.5 Ledger and report

`Ledger.lean` holds two lists: 24 claims and 30 edges, each entry naming the Lean
definition or theorem that backs it. `render` produces the judge-facing report: the
claims, the edges with verdicts, the unstated premises, and the tallies. `Main.lean`
prints it. The header of the report states explicitly that nothing in it is `PROVED`.

---

## 5. Results

### 5.1 Tallies

```
edges certified .......... 14
edges refuted ............ 3
edges with proved gaps ... 11    (countermodel exhibited; no proof exists)
apparent clashes that are
  not clashes ............ 2

premises needing evidence  8
contested meanings ....... 7
value premises ........... 3
premises nobody stated ... 4
```

Nothing substantive about the Constitution, history, or policy comes out `PROVED`.
Every verdict concerns the relationship between claims. That is the design working.

### 5.2 The four premises nobody stated

| Id | Owner | Premise |
|---|---|---|
| M-JB | Mayes | Birth in the US is by itself enough to be subject to US jurisdiction |
| K-EX | Krikorian | The Citizenship Clause is the only route to citizenship at birth |
| C5 | Cooper | Whenever Harlan dissented, the case was wrongly decided |
| P4 | Mayes | All rulings on this question go the same way |

Each is required by its owner's own argument and never uttered. Three of the four would
be rejected on sight if said aloud.

### 5.3 Findings worth the effort

- **Both sides drop a condition, and only one gets caught.** Mayes's is audible. The
  pro-motion side's is larger and silent: failing a sufficient condition settles
  nothing, and Krikorian's case needs the converse of the shared text.
- **The best argument in the hour wins less than it appears to.** Krikorian's
  counterexample refutes Mayes's stated route and leaves her conclusion untouched. He
  knocked out her argument, not her answer. Her conclusion is left `UNSUPPORTED`, not
  `REFUTED`.
- **Two sharp-sounding exchanges were not disagreements.** The statelessness exchange
  and the counterexample exchange both have models where each side is right.
- **The bank-robbery analogy reduces to one proposition**, and the debate never reaches
  the reply that sits at that joint.
- **The ancestry argument runs the full pipeline** and the extracted premise turns out
  to be false.
- **The largest gap is between branches.** Winning the constitutional argument settles
  nothing about the motion, in either direction, and neither side supplies the bridge.

### 5.4 Scoring the debaters

Asked for scores out of 10, the session scored argumentative conduct, not correctness,
since the kernel validated no debate content.

| | Gaps | Unstated premises | Refutations landed / taken | Score |
|---|---|---|---|---|
| Krikorian | 2 | 1 | 2 / 0 | 7 |
| Newman | 1 | 1 | 0 / 0 | 6.5 |
| Mayes | 5 | 2 | 0 / 3 | 5 |
| Cooper | 2 | 2 | 0 / 0 | 4 |

The caveat is the actual finding: Krikorian argues best and Mayes's conclusion survives
everything he throws at it. Conduct and correctness come apart, which is the argument
for showing a judge the disputed node set rather than a scoreboard. One scoring rule
fell out: do not penalize a debater for losing an exchange the format mishandled.

### 5.5 What a stronger pro-motion case would need

Asked whether any argument could defeat Mayes's conclusion, the session answered from
the structure: two things are owed, and the pro-motion side worked on only the second.

1. Close the back door: establish that the clause is the only route to citizenship by
   birth on US soil. As stated broadly this is false (statute grants citizenship at
   birth to some people the clause does not cover); narrowed to territorial birth it is
   defensible. The strongest version of the case begins by weakening its own premise.
2. Show the children fail the jurisdiction test, for which an actual holding separating
   "subject to US law" from "subject to the jurisdiction thereof" is a better tool than
   an informal historical claim.

The blocking precedent was attacked head-on, at the cost of an indefensible premise. The
cheaper move nobody made is to distinguish it rather than overrule it. The session
flagged that these case specifics came from general knowledge and were not verified
against sources.

---

## 6. Learnings and limits

`learnings.md` is the judgment layer. Its main points:

**Bottom line.** Lean is mostly overhead for human debate and close to essential for AI
debate. Everything the checker found, a careful person with a notepad also finds. What
Lean added: it would not let the author skip a step (the largest finding surfaced only
because the proof would not close), someone who distrusts the author can check the work
mechanically, and the zero-axiom audit proves nothing was smuggled in. The valuable idea
is not Lean; it is forcing an argument into a shape where every step is either checked
or explicitly labelled. Lean earns its cost when two AIs debate, neither can be trusted,
and the judge is weaker than both.

**Irving's problems, and which this touches.** From the interview: obfuscated or
lopsided evidence-finding; the physics experiment where a false argument won and nobody
could find the flaw; limited debate depth; fuzzy tasks; and the fact that the obstacle
hits amplification and Constitutional AI too. Scorecard: the physics problem is solved
(a bad step cannot hide inside reasoning that must carry a certificate); depth is
helped but untested; lopsided evidence-finding is moved, not killed; fuzzy tasks are
untouched, and in this debate everything that mattered was fuzzy.

**The hole, worked through.** Take Krikorian's pivotal factual claim. Lean certifies
that if it is true, Mayes's rule breaks, and says nothing about whether it is true. An
AI on that side returns with four real supporting sources and is simply worse at finding
the counterevidence that also exists. The system then reports every step certified, no
hidden assumptions, leaf well-sourced. Green across the board, and the conclusion is
wrong. This is worse than doing nothing, because a clean certified graph looks rigorous,
and the honest opponent is reduced to "something is off about that claim, but I cannot
say what", the exact sentence the idea was built to eliminate. Any presentation of the
system that does not lead with what it did not check is misleading.

**Why RL does not dissolve this.** Training in a debate environment rewards winning as
judged, so a false argument that wins is reinforced. Finding counterevidence is a
different shape of search from finding support. And it is circular: a truth-tracking
reward for these questions would remove the need for debate. What the protocol
genuinely offers is that the logic half becomes a clean, cheat-proof reward signal, and
the remaining factual half is made visible instead of blended into a persuasive whole.

**Design rules that were not obvious before building.** A negative verdict must be a
countermodel, never a failed search. Refuting a premise returns the conclusion to
unsupported, never to refuted. The attack surface is the vocabulary, not the proofs, so
grant any split demand by default.

**Stated limits.** The kernel validates no debate content. Fidelity between formal claim
and speaker's meaning is unprovable from inside; the approval step is the trusted
component. This run was reconstruction from a transcript with the author choosing the
cut points, which is easier than live operation. Formalizing an analogy as a relation
plus a transfer principle is itself a substantive choice. The protocol assumes
participants who agreed to it.

---

## 7. The evidence layer

`evidence-protocol.md` arrived separately, from a ChatGPT thread investigating two
unrelated disputes, and turned out to be the specification that `inference-protocol.md` §5 deferred:
the evidence agent for EMPIRICAL leaves. `thesis.md` §2 sets out how the two layers share
one claim ledger and why their independent convergence on the same rules matters. The
project is now two specifications and one worked run of the first.

## 8. What would come next

`thesis.md` §6 is the current roadmap. The original list from `learnings.md` §9:

1. A counterevidence agent scored against its own side. The direct attack on the hole
   above, and it has none of the checkability that made the logic half work.
2. Train on the verifiable slice and measure whether it transfers to leaf honesty.
3. A live-operation test, where the quantifier question must be asked before anyone
   knows which answer helps.
4. Adversarial signature review as a red-team exercise: try to win a debate purely by
   proposing a vocabulary, without touching an inference.

---

## 8. Artifacts and references

- Findings page published from the session (private unless shared):
  https://claude.ai/code/artifact/6c67c01c-a57b-4b48-9ec2-50377366aada
- Debate transcript used as source: Open to Debate, *Should America End Birthright
  Citizenship?*, June 2026 (opentodebate.substack.com).
- Interview the alignment framing comes from: 80,000 Hours podcast with Geoffrey Irving.
- Lean install used: elan, per the official manual at lean-lang.org/install/manual.

Two things in the repository are the author's paraphrases rather than verified fact and
should be checked before being quoted: the formalizations of what each speaker argued,
which a live system would have the debaters approve, and the legal and historical case
specifics in `learnings.md` §4 and §6.
