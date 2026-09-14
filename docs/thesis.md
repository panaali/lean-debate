# A logician for English

The main document of this project, written so that several agents can elaborate the idea,
attack it, and extend it. It states the problem, the claim, the method, one worked run,
the limits, and what comes next, in that order. The working surfaces are two companion
files: `claims.md`, every claim the proposal makes with a status and its strongest
objection, and `open-questions.md`, every unresolved question with candidate answers. Add
to those before adding here. Everything else in `docs/` is reference: `inference-protocol.md` and `evidence-protocol.md` are the two
specifications, `results.md` and `learnings.md` are the worked run and its assessment,
`project-overview.md` is the long reference, and `sources/` holds the raw conversations.
Appendices A to C at the end carry the supporting material.

---

## 1. The problem

Debate is proposed as a way for a weak judge to oversee strong reasoners: let two of them
argue and let the judge pick. Geoffrey Irving's objection is that a dishonest debater can
produce an argument that is long, sophisticated, and false, and that neither the honest
opponent nor the judge can say where the flaw is. Absence of a rebuttal then reads as
strength. In human experiments on physics questions this actually happened.

The same failure has an older illustration. In 1947 Kurt Gödel read the text of the United
States Constitution as a formal system and found what he believed was a legal path from
republic to dictatorship. At his citizenship hearing he told the judge "I can prove it".
The judge declined to hear the proof. Gödel never wrote it down, and constitutional
scholars still cannot reconstruct it. An honest, capable claimant, a judge who could not
evaluate the claim, and no certificate left behind.

## 2. The claim

**A logician can find real holes in real English, and that skill can now be run at scale
and made checkable.** Ordinary legal and political text has enough structure that its
unstated premises, missing bridges, and self-referential rules can be located by someone
who reads it as a system. Language models can do the reading and the formalizing. A proof
assistant can make the result an object that a person who distrusts the finder can verify
mechanically, without redoing the reasoning.

The product is never a verdict on the question. It is the extracted premise, the disputed
node set, and the countermodel, left behind in a form anyone can inspect. Nothing about
the Constitution, history, or policy ever comes out proved. Only the relationships between
claims do, and that is the design working.

**What this does not do, stated first.** The kernel validates no content. Whether a formal
claim means what the speaker meant is unprovable from inside the system. And the evidence
layer, where facts are checked, is still trusted rather than verified. Section 5 says
exactly how far that trust reaches.

## 3. The method

An argument has an inference layer and an evidence layer. The project has one
specification for each, and they share a single claim ledger.

**The inference layer** (`inference-protocol.md`, enforced by Lean). Every claim is a node
labelled by what would settle it: PROVED, EMPIRICAL, INTERPRETIVE, PROBABILISTIC,
NORMATIVE, DEFINITION, or UNSUPPORTED. Every claimed step between nodes is an edge, and
the kernel returns exactly one verdict per edge:

| Verdict | Meaning |
|---|---|
| CERTIFIED | the conclusion follows from the listed premises |
| REFUTED | the negation follows |
| GAP | a countermodel exists: every premise holds, the conclusion fails, so no proof can |
| COMPATIBLE | two claims that sounded like a clash hold together in one world |

The governing rule: any claim may be asserted provided it is typed, and every claimed
inference must be certified, including every claimed non-inference. There are no axioms.
The shared vocabulary is a signature, the agreed text is a structure field, arguments are
theorems over all models, and a GAP is always an exhibited world, never a failed search.

**The evidence layer** (`evidence-protocol.md`, run by an adversarial investigation
process). Every EMPIRICAL or PROBABILISTIC leaf is handed to it. It produces a claim
ledger with actor, action, object, date, scope, and qualifiers, a graded status
(established, strongly supported, plausible, unresolved, weakened, contradicted),
provenance rather than conclusions, calibrated probability ranges, and a record of the
challenges tested.

**The two were written separately and converged on the same rules.** That convergence is
the strongest evidence the decomposition is right:

- Split before you judge. Contact occurred versus what was said. Subject to US law versus
  subject to US jurisdiction. Any assault versus severe assault versus assault that caused
  death. One symbol for two things is where every case in this folder went wrong.
- A contradiction needs the same thing, period, and scope. Otherwise both sides were right.
- No promotion. A refuted premise returns the conclusion to unsupported, never to refuted.
- Fix the reading before the answer is known. Ask which quantifier the speaker means at
  assertion time, not after the rebuttal.
- Audit the loaded words. "Pressure", "admission", "punish", an analogy: each smuggles a
  premise. Extract it and make its owner approve it.
- Provenance, not conclusions. "Document D contains string S" and "S shows the speaker
  believed P" are two claims, and the second stays interpretive.

The roles this reproduces, and the same objects under the names science, law, and
journalism give them, are in Appendices A and B.

## 4. One worked run

The full pipeline was run on one real hour of argument: *Should America End Birthright
Citizenship?* (Open to Debate, June 2026). Two speakers for, two against. Results in
`results.md`; the Lean development in `Debate/`.

| | |
|---|---|
| edges certified | 16 |
| edges refuted | 3 |
| edges with proved gaps | 13 |
| apparent clashes that are not clashes | 2 |
| premises nobody stated | 4 |

(`run-birthright-2`. The original run had 14 certified and 11 gaps; the four added
verdicts are the Article V section below.)

Three findings justified the effort.

**The largest hole belonged to the side that argued better, and nobody saw it.** The
Citizenship Clause says born here and subject to jurisdiction implies citizen. That is a
way in, not the only way in. So showing a child fails the jurisdiction test proves nothing
about citizenship until every other route is closed. The entire pro-motion case needs that
premise and never states it. This is a small Gödel-style finding about the text of the
Fourteenth Amendment, and it surfaced only because the proof would not close without it.

**Two of the sharpest exchanges were not disagreements.** The statelessness exchange and
the historical-counterexample exchange each have a world in which both speakers are right.
An audience hears a knockout. The COMPATIBLE verdict is mechanical to produce and nearly
impossible to catch live.

**The largest gap is between branches.** Most of the hour argues what the law is. The
motion asks what the country should do. Article V exists, so those come apart, and neither
side supplies the bridge. Gödel's loophole, on Suber's reading that Article V limits
procedure but not content, is the strong form of this: no constitutional fact ever reaches
a "should" on its own.

Article V is now load-bearing in the formalization. Under Suber's reading, entered as a
contestable shared node, ending birthright citizenship is lawfully available even where
the Constitution requires it, and keeping it is lawfully available even where it does not.
So neither side's constitutional case can rest on legality; each rests only on its own
unstated normative bridge.

The audit is mechanical. All 38 theorems, countermodels included, report that they depend
on no axioms.

## 5. Limits

- **Lean is mostly overhead for human debate.** Everything the checker found, a careful
  reader with a notepad also finds. What Lean added is narrower: it would not let the
  author skip a step, a distrustful reader can check the work without redoing it, and the
  zero-axiom audit proves nothing was smuggled in. Lean earns its cost in one situation:
  two AIs debating, neither trustworthy, a judge weaker than both.
- **Fidelity is the trusted component.** That the formal claim means what the speaker
  meant is what the approval step is for. Back-translation narrows the gap. Nothing closes it.
- **The evidence layer is where a lopsided reasoner still wins.** Take the pivotal
  historical claim in the run. Lean certifies that if it is true, the opposing rule breaks,
  and says nothing about whether it is true. An agent better at finding support than
  counterevidence returns four real sources. The system then reports every step certified,
  no hidden assumptions, leaf well sourced. Green across the board, and wrong. This is
  worse than doing nothing, because a certified graph looks rigorous. The honest opponent
  is reduced to "something is off about that claim, but I cannot say what", the exact
  sentence the idea was built to eliminate. The evidence protocol narrows this by forcing
  advocacy for each party and explicit falsification tests. It does not close it, because
  nothing in it is checkable by anyone but the agent that ran it.
- **The attack surface is the vocabulary, not the proofs, and the rules that fix the
  vocabulary.** Merge two symbols and you get a clean, axiom-free, worthless proof. Amend
  the rule for amending the environment, Guerra-Pujol's reading of Gödel's loophole, and
  you can simplify the protocol from inside it. The protocol now grants any split by
  default and puts its Phase 0 rules outside the environment for the duration of a run.
- **This was reconstruction, not live operation**, with the full transcript and the
  author's own cut points. Live, the quantifier question must be asked before anyone knows
  which answer helps.
- **Nothing here generates hypotheses.** Einstein's detective invents the plot. These
  protocols only check it.

## 6. Next steps

Ordered by what unblocks the most. Items marked done were verified by a clean build with
every theorem reporting no axioms.

1. **Adopt `evidence-protocol.md` as Phase 3 and run it adversarially.** Two instances
   assigned opposing hypotheses, or one instance plus a critic scored on what it finds
   against its own side. This is the direct attack on the hole in Section 5.
2. **Done (`run-birthright-2`): an evidence ledger type.** `Debate/Evidence.lean`; the
   report's EVIDENCE section carries grade and provenance per leaf, every grade marked as
   unverified.
3. **Done (`run-birthright-2`): probability coherence constraints.** Entailment orderings
   and partition sums as decidable checks, run on the two real tables in `sources/`. Weak
   by design: they catch incoherence, not lopsided search.
4. **Done (`run-birthright-2`): Article V load-bearing.** See Section 4. Suber's reading
   is a contestable node, not an assumption.
5. **A second debate**, chosen before reading it, through both layers.
6. **A two-AI run** on the birthright motion, third-party formalizer, back-translator,
   sources frozen at a stated date.
7. **Red team Phase 0.** Try to win purely by proposing a vocabulary, and separately by
   proposing a simplification to the Phase 0 rules.

---

## Appendix A. The roles

Detective, investigative journalist, logician, debater, lawyer, judge, scientist. Einstein
compared the scientist to a detective who cannot turn to the back of the book. All seven
run the same loop: break the question into separately testable claims, label each by what
would settle it, keep observation and inference and verdict apart, generate rival
explanations and hunt for what discriminates, state the standard of proof first.

What separates them is loyalty.

| Role | Loyal to | Produces | Checked by |
|---|---|---|---|
| Logician | validity only | whether a step follows | the kernel |
| Debater, lawyer | a side | the strongest case for it | the opponent |
| Detective, journalist, scientist | the truth | a reconstruction and its uncertainty | evidence, replication |
| Judge | the standard of proof | a verdict | the record, appeal |

The debater and the lawyer are not trying to be right. A good system is one where two of
them trying to win produce something a judge can use, and every profession that works has
a protocol that makes that conversion: burden of proof, rules of evidence, discovery,
cross-examination, preregistration, peer review, replication. They all fail the same way
when the protocol is missing: a persuasive case nobody can locate the flaw in.

This project's division of labour: the machine takes the logician's job entirely, so the
judge no longer needs to find the flaw. The evidence protocol makes one analyst rotate
through detective, counsel for each party, and judge, so no single loyalty dominates. The
two-AI setting in `inference-protocol.md` §9 puts side-loyal agents inside the fence.

## Appendix B. Concept map

The same objects under different names.

| This project | Science | Law | Evidence protocol |
|---|---|---|---|
| UNSUPPORTED (default status) | null hypothesis | presumption of innocence | "not established" |
| CERTIFIED | valid derivation | the inference a court may draw | inference from established facts |
| GAP with countermodel | falsification | reasonable doubt made concrete | strongest evidence-compatible alternative |
| REFUTED by one instance | one counterexample defeats a universal | one witness defeats "never" | one inspected document defeats "no prior work cited" |
| COMPATIBLE | no conflict between results | consistent testimony | "contradiction requires same thing, period, scope" |
| No-promotion rule | failing to reject is not accepting | acquittal is not proof of innocence | narrow corroboration |
| Quantifier elicitation | preregistration | pleadings fix the claim | two readings before a verdict |
| Extracted premise | hidden auxiliary assumption | element of the offence not pleaded | evaluative noun audited |
| PROBABILISTIC leaf | p-value, credence | standard of proof | calibrated subjective range |
| Fixed environment | agreed model and measurement | rules of evidence | as-of date, frozen sources |
| Irving's Type I | false positive | wrongful conviction | overconfident misconduct finding |
| Irving's Type II | false negative | wrongful acquittal | "not established" used to dodge judgment |

## Appendix C. What each source added

- **`sources/lean-in-social-science.md`.** The original sketch, and the choice of the
  birthright debate as test case. Its `axiom` approach was replaced by signatures and
  models; see `inference-protocol.md` §7.
- **`sources/case-amini-un-fact-finding.md`.** Evidence layer on a hard case. Shows the
  COMPATIBLE verdict in the wild (the UN's two statements are not in conflict), the
  separation of "assault occurred" from "assault caused death", asymmetric skepticism as
  a diagnosable failure of both state and opposition media, and explicit probability
  revision with the reason recorded.
- **`sources/case-credit-dispute.md`** and **`sources/case-credit-dispute-agent-run.md`.**
  The analyst's own failure modes: 90 to 95 percent confidence assigned twice from
  ambiguous wording, retracted on challenge. This is why `evidence-protocol.md` §5 and
  §10 exist. Also the direct caveat that a machine-checked proof does not establish
  provenance, novelty, or ethical production, the same warning as
  `inference-protocol.md` §10.
- **`sources/analytic-philosophy-and-bell.md`.** The epistemology, and a worked example
  where the answer is known. Bell's theorem is a certified edge; the experiments refute a
  premise by instance; Einstein's error was an unstated premise (local realism), exactly
  the pattern of the unstated exhaustiveness premise in the run; the escape routes
  (superdeterminism, retrocausality, nonlocal hidden variables) are the extracted-premise
  menu, each a named assumption with a named cost; "does Bell prove there was no hidden
  information" is answered by narrowing the refuted proposition, the no-promotion rule.
- **Gödel's loophole** (Wikipedia, read in session; see
  `sources/discussion-2026-09-13.md` §5). Suber's reading is the strong form of the
  is-ought gap in `Motion.lean`. Guerra-Pujol's reading is an attack on the protocol's own
  rules; `inference-protocol.md` §2.6 is the response. The anecdote is the project's
  failure mode in miniature: a claim of proof, a judge who declined to hear it, and no
  certificate left behind.
- **`sources/discussion-2026-09-13.md`.** The session in which all of the above was
  connected to the project, recorded question by question.
