# Thesis: a logician for English

What this project is for, stated after reading everything in `docs/` together. `inference-protocol.md`
and `evidence-protocol.md` are the two specifications. `results.md` and `learnings.md` are
what one run produced. This file is the frame that holds them together, and the roadmap.

---

## 1. The reframing

In 1947 Kurt Gödel read the text of the United States Constitution the way he read a formal
system, and found what he believed was an inner contradiction: a legal path from republic
to dictatorship. He told Morgenstern and Einstein. He told the judge at his citizenship
hearing "I can prove it", and the judge declined to hear the proof. Gödel never wrote it
down, and constitutional scholars still cannot reconstruct it.

Three things in that story are the whole project.

1. **A logician can find a real hole in real English.** Ordinary legal and political text
   has enough structure that its unstated premises, its missing bridges, and its
   self-referential rules can be located by someone who reads it as a system. That skill
   is rare and slow. Advanced language models can do it at scale, and a proof assistant can
   make the result checkable by someone who does not trust the finder.
2. **The judge could not evaluate the claim, so he did not try.** That is Irving's failure
   with the roles reversed: an honest, capable claimant, a weaker judge, and no certificate.
3. **Nothing survived because nothing was written in a checkable form.** The product of
   this project is never the verdict. It is the extracted premise, the disputed node set,
   the countermodel, left behind as an object anyone can inspect.

The birthright citizenship run is a proof of concept for item 1. It found four premises
that carried a one-hour debate and that no participant stated, one of which, that the
Citizenship Clause is the only route to citizenship at birth, is a small Gödel-style
finding about the text of the Fourteenth Amendment. Nobody in the room saw it.

---

## 2. Two layers, one ledger

An argument has an inference layer and an evidence layer, and the two specifications in
this folder cover one each.

| Layer | Specification | Checked by | Output |
|---|---|---|---|
| Inference | `inference-protocol.md` | the Lean kernel | CERTIFIED, REFUTED, GAP with countermodel, COMPATIBLE |
| Evidence | `evidence-protocol.md` | an adversarial evidence process | claim ledger with graded status, provenance, calibrated probabilities |

They meet at the leaves. Every leaf of the inference graph is typed (EMPIRICAL,
INTERPRETIVE, PROBABILISTIC, NORMATIVE, DEFINITION), and every EMPIRICAL or PROBABILISTIC
leaf is a job for the evidence layer. The evidence layer's claim ledger, with actor, action,
object, date, scope, and qualifiers, is the same record as the inference layer's `Claim`,
with a finer status scale on the evidence side (established, strongly supported, plausible,
unresolved, weakened, contradicted).

The two specifications were written separately, from different source conversations, and
converged on the same rules. That convergence is the best evidence that the decomposition
is right. The shared rules:

- **Split before you judge.** Contact occurred versus what was communicated. Subject to
  US law versus subject to US jurisdiction. Any assault versus severe assault versus assault
  that caused death. Nonlocal correlation versus faster-than-light signalling. One symbol
  for two things is where every case in this folder went wrong.
- **A contradiction needs the same thing, period, and scope.** Otherwise the verdict is
  COMPATIBLE, and both sides were right.
- **No promotion.** A refuted premise returns the conclusion to unsupported, never to
  refuted. A non-significant result does not prove the null. Confirmation that contact
  happened does not confirm its contents.
- **Fix the reading before the answer is known.** Quantifier elicitation at assertion
  time; preregistration; identify two readings of an ambiguous phrase before choosing.
- **Audit the loaded words.** "Pressure", "admission", "punish", an analogy: each smuggles
  a premise. Extract it and make its owner approve it.
- **Provenance, not conclusions.** Document D contains string S is one claim. S implies
  the speaker believed P is another, and it stays interpretive.

---

## 3. The roles

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

---

## 4. Concept map

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

---

## 5. What each source added

- **`sources/lean-in-social-science.md`.** The original sketch, and the choice of the
  birthright debate as test case. Its `axiom` approach was replaced by signatures and
  models; see `inference-protocol.md` §7.
- **`sources/case-amini-un-fact-finding.md`.** Evidence layer on a hard case. Shows the
  COMPATIBLE verdict in the wild (the UN's two statements are not in conflict), the
  separation of "assault occurred" from "assault caused death", asymmetric skepticism as
  a diagnosable failure of both state and opposition media, and explicit probability
  revision with the reason recorded.
- **`sources/case-credit-dispute.md`** and **`sources/case-credit-dispute-agent-run.md`.** The
  analyst's own failure modes: 90 to 95 percent confidence assigned twice from ambiguous
  wording, retracted on challenge. This is why `evidence-protocol.md` §5 and §10 exist.
  Also the direct caveat that a machine-checked proof does not establish provenance,
  novelty, or ethical production, which is the same warning as `inference-protocol.md` §10.
- **`sources/analytic-philosophy-and-bell.md`.** The epistemology, and a worked example
  where the answer is known. Bell's theorem is a certified edge; the experiments refute a
  premise by instance; Einstein's error was an unstated premise (local realism), exactly
  the K-EX pattern; the escape routes (superdeterminism, retrocausality, nonlocal hidden
  variables) are the extracted-premise menu, each a named assumption with a named cost;
  "does Bell prove there was no hidden information" is answered by narrowing the refuted
  proposition, the no-promotion rule.
- **Gödel's loophole** (Wikipedia, read in session). Two lessons. First, Suber's reading
  (Article V limits procedure, not content) is the strong form of `Motion.lean`'s is-ought
  gap: no constitutional fact ever bridges to a "should" on its own. Second,
  Guerra-Pujol's reading (Article V applies to itself) is an attack on the protocol's own
  rules, not on any inference. `inference-protocol.md` §2.4 fixes the environment; nothing fixed the
  rule that fixes the environment. Now §2.6 does.

---

## 6. Roadmap

Ordered by what unblocks the most. Items marked **Lean** change the development and need
a build to verify; none has been made yet.

1. **Adopt `evidence-protocol.md` as Phase 3.** It is the specification `inference-protocol.md` §5
   deferred. Run it adversarially, not solo: two instances assigned opposing hypotheses, or
   one instance plus a critic scored on what it finds against the assigned side. This is
   `learnings.md` §9 item 1, now with a candidate spec.
2. **Lean: an evidence ledger type.** Extend `Protocol.lean` with the evidence-side status
   scale and a provenance record, so an EMPIRICAL leaf carries its evidence grade into the
   judge-facing report instead of a bare label.
3. **Lean: probability coherence constraints.** The subquestion probabilities the evidence
   layer produces have orderings that must hold: P(assault caused death) ≤ P(assault
   occurred) ≤ 1. These are cheap to state and check. They are the first piece of the
   evidence layer that becomes kernel-checkable rather than trusted.
4. **Lean: make Article V load-bearing.** `Motion.Vocab.AmendableByArticleV` is declared
   and never used. State the Suber reading as a premise and show that under it the two
   bridge premises NB1 and NB2 are the only routes from any constitutional fact to the
   motion, in either direction.
5. **Protocol: the meta-rule.** Added as §2.6: the rules of Phase 0 are outside the
   environment and cannot be amended by either debater during a run. Gödel's loophole is
   the reason.
6. **Second debate.** Everything here was tuned on one transcript. Run the full pipeline,
   both layers, on a second Open to Debate transcript chosen before reading it.
7. **Two-AI run.** `inference-protocol.md` §9, with a third-party formalizer and a back-translator,
   on the birthright motion, with sources frozen at a stated date.
8. **Red team Phase 0.** Have a model try to win purely by proposing a vocabulary, and
   separately by proposing a "simplification" to the Phase 0 rules. Whether either attack
   succeeds tells you how much the rest is worth.

---

## 7. What is still not solved

`learnings.md` §6 stands. A lopsided evidence agent following `evidence-protocol.md` to the
letter still reports "well sourced" on the side it searches better, and the graph above it
reads green. The evidence protocol narrows that gap by forcing self-advocacy for each party
and explicit falsification tests. It does not close it, because nothing in it is checkable
by anyone but the agent that ran it. Items 2 and 3 in the roadmap move a small part of the
evidence layer across that line. The rest of it stays trusted, and any presentation of this
project that does not say so first is misleading.
