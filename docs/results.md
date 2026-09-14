# Results from the proof-carrying debate experiments

The project has reconstructed two human debates, conducted a two-AI debate and an
adversarial evidence investigation, and red-teamed its setup rules. These experiments
expose missing premises, distinguish apparent rebuttals from contradictions, and show
how modeling choices can change what an argument appears to establish.

This page records the results and their limits. The [thesis](thesis.md) develops the
research argument; [learnings](learnings.md) assesses what formal checking adds.
Run records retain the source material, submissions, and evidence supporting each finding.

## Running it

Use the [README's prerequisites and commands](../README.md#run-the-reports).
`lake exe report` prints the birthright ledger, `lake exe report deathpenalty`
prints the death-penalty ledger, and `lake exe report all` prints both.

## What it does

Each speaker's argument becomes an argument graph. Nodes are claims, labelled with the
kind of justification they need. Edges record proposed inferences, and each verdict names a
Lean theorem supporting a formal relationship:

| verdict | meaning |
|---|---|
| `CERTIFIED` | the conclusion follows from the listed premises |
| `REFUTED` | the negation follows |
| `GAP` | **a countermodel exists** — the step is invalid, and that is itself proved |
| `COMPATIBLE` | two claims that sounded like a clash are jointly satisfiable |

A GAP requires a countermodel: a specified world in which the environment and asserted
premises hold while the conclusion fails. Failure to find a proof is insufficient.
Compatibility establishes that claims can hold together under the model; it does not
establish that they are true in the world.

The audits check theorem declarations. The report's descriptions, verdict labels, and
theorem references are maintained as metadata and require a correspondence review.
The formal results remain conditional on the environment and explicit premises.

## Results

The main development audits **90 theorems**, all reporting no axioms:

| Work | What is counted | Theorems |
|---|---|---:|
| Birthright reconstruction | 36 ledger verdicts, including 2 position witnesses | 36 |
| Death-penalty reconstruction | 35 ledger verdicts | 35 |
| Two-AI run 1 | 8 verdicts in its sibling module | 8 |
| Evidence layer | 4 initial examples and 7 checks added with evidence run 1 | 11 |
| **Total** | | **90** |

The completed human-debate reconstructions have these verdicts:

| Run | Tag | Certified | Refuted | Gap | Compatible | Unstated premises |
|---|---|---:|---:|---:|---:|---:|
| Birthright citizenship | `run-birthright-3` | 16 | 3 | 13 | 4 | 4 |
| Death penalty | `run-deathpenalty-1` | 13 | 1 | 12 | 9 | 9 |

Compatibility counts include models witnessing whole positions, as well as models of
claims exchanged during debate. In the birthright ledger, two concern exchanges and
two witness the participants' positions.

The birthright ledger records 8 empirical claims, 9 interpretive claims, and 3 value
premises, alongside its 4 unstated premises. No substantive debate claim is labeled
`PROVED`: the checked results concern relationships between claims.

### The four premises nobody stated

The first case reconstructs *Should America End Birthright Citizenship?* (Open to Debate,
June 2026; Krikorian and Cooper for, Mayes and Newman against). It identifies four
premises needed by the modeled arguments but not stated by their speakers. The speakers
did not approve the reconstructions, and a repair need not be the only possible one.

- **M-JB** (Mayes) — being born in the US is by itself enough to be subject to US
  jurisdiction. Needed by her one-condition restatement of a two-condition clause.
- **K-EX** (Krikorian) — the Citizenship Clause is the *only* route to citizenship at
  birth. The converse of the shared text. Without it the pro-motion constitutional case
  does not reach its conclusion at all, and no one on either side notices.
- **C5** (Cooper) — whenever Harlan dissented, the case was wrongly decided. A sufficient
  repair of the modeled deduction, committing the speaker to a much broader claim.
- **P4** (Mayes) — all rulings on this question go the same way. What deductive validity
  would cost; it would make the pending case pointless.

### Findings worth the trouble

**A sufficient condition was treated as a necessary one.** The model represents the
Citizenship Clause as an implication. Failing its antecedent does not establish
non-citizenship, so Krikorian's route needs the additional premise K-EX (E9, E10).
Mayes's restatement drops the jurisdiction condition in the other direction (E1).

**A refuted premise can leave the conclusion possible.** Given Krikorian's historical
counterexample, E6 refutes Mayes's jurisdiction bridge. E7 shows that her conclusion
does not thereby become false. E11 exhibits a model in which both hold.

**The scope of a claim determines whether a rebuttal reaches it.** Krikorian's
alternative policy refutes the universal statelessness claim (E19). It is compatible
with a claim about the particular order under discussion (E20). E22 derives the weaker
existential conclusion supported by that particular case.

**An analogy depends on a disputed resemblance.** Cooper's bank-robbery analogy needs
C-A, connecting the two policies in the model (E25). Newman's proposed response challenges
that connection (E26); after the red-team repair it explicitly requires his premise N-D.

**An extracted premise can identify a specific evidence question.** The ancestry
argument needs A4: immigrant descent forecloses every other route to citizenship.
E14 proves that one qualifying citizen by another route would refute A4. The original
ledger cites the Naturalization Act of 1790 as its uninspected historical basis;
the theorem assumes the witness and does not verify the source (Q17).

**A factual conclusion needs a value premise to support a recommendation.** The
constitutional branch concerns what the law requires. The motion asks what America
should do. E27 and E28 demonstrate the missing connections; E29 and E30 show how
explicit normative bridges would supply them.

### Legal availability and policy recommendations

The Motion branch distinguishes what the law requires, what can lawfully be changed,
and what should be done. Under Suber's reading (`G-S`), amendability (`G-A`) and
non-entrenchment (`G-E`), ending birthright citizenship is lawfully available even where
the Constitution currently requires it (`E31`), so "the Constitution requires it" does not
deliver "it cannot lawfully be ended" (`E32`, countermodel). Symmetrically, where the
Constitution does not require it, Congress may keep it by statute (`G-C`, `E33`), so "not
required" does not deliver "cannot lawfully be kept" (`E34`). These are conditional results about
legal availability. Each side still needs its normative bridge, NB1 or NB2, to turn
its legal argument into a recommendation. Suber's reading is entered as a SHARED,
INTERPRETIVE node so either side may contest it.

### Assumptions and evidence

The setup makes substantive assumptions explicit and requires nonempty domains and
models witnessing each side's position. In the birthright model, Newman's disanalogy
principle is claim N-D, and E26 depends on it. E35 and E36 establish that the environment
permits each side's constitutional position. These checks establish satisfiability;
they do not establish neutrality.

[Evidence.lean](../Debate/Evidence.lean) defines grades, provenance records, and
subjective probability intervals. [Examples.lean](../Debate/Evidence/Examples.lean)
checks selected orderings, partition sums, and overlaps. These are arithmetic guarantees,
not guarantees about calibration or the completeness of the source search.

The K1 ledger entry has an investigated basis from evidence run 1. Other entries retain
their stated limitations, including grades assigned from general knowledge or agreement
without inspection. The evidence run fixed its source cutoff at 6 June 2026; later legal
developments and verification are recorded separately in the
[run results](runs/evidence-1/RESULTS.md#formalizer-rulings). They do not retroactively
change the frozen run.

## Other completed experiments

Each run has a fixed setup, submissions, and a results record explaining its findings.

**[Death penalty](runs/death-penalty/RESULTS.md)** (`run-deathpenalty-1`).
Selected from titles only and extracted by a separate agent, the reconstruction yields
13 certified edges, 1 refutation, 12 gaps, and 9 compatibility results. It identifies
9 unstated premises and a disputed set of 5. The moderator asks whether abolition would
still be justified if the policy's defects were repaired; the response supplies a
prediction in place of the requested value premise. The single refutation is between
speakers on the same side.

**[Two-AI debate](runs/two-ai-1/RESULTS.md)** (`run-twoai-1`).
Both participants examine what “born in the United States” means in the setup.
Each accepts the premises supporting the other's conclusion under a different reading.
Eight verdicts isolate that difference, including a model in which both positions hold
together. Back-translation matches the controlled English. Both participants are
cooperative, so the run tests the mechanics rather than resistance to deception.

**[Adversarial evidence investigation](runs/evidence-1/RESULTS.md)** (`run-evidence-1`).
Two agents with opposing assignments investigate K1 without shared context. Their
assessments support its narrower historical components, with ranges of 75–98%, while
giving less support to extending the argument to children of unauthorized immigrants.
For that extension, the frozen comparison uses ranges of 15–35% and 12–25%; the run
record preserves the alternative assessments and source-cutoff ruling.

Each agent revises the sub-claim its assignment supports least well. Both tables pass
the selected arithmetic checks. Comparing intervals also prompts scrutiny of two readings
of K1c; non-overlap alone does not establish that analysts mean different propositions.
The K1 evidence entry in the main ledger records the investigation's findings and provenance.

## Layout

```
Debate/Protocol.lean               claim/edge records, statuses, verdicts, rendering
Debate/Evidence.lean               evidence-layer types; credence coherence; the meta-rule
Debate/Evidence/Examples.lean      coherence checks on two real probability tables
Debate/DeathPenalty/               second debate: six branches, ledger, audit
Debate/Birthright/
  TwoAI.lean                       two-AI run 1 on the constitutional proposition
  Constitutional.lean              the Citizenship Clause; "subject to the jurisdiction"
  Ancestry.lean                    "none of us would be citizens"
  Judicial.lean                    Harlan's dissents; predicting the Supreme Court
  Policy.lean                      statelessness; the moderator's domain objection
  Normative.lean                   punishing children; the stolen-money analogy
  Motion.lean                      the is/ought gap; Article V made load-bearing
  Audit.lean                       #print axioms for every birthright, two-AI and evidence theorem
  Ledger.lean                      the judge-facing report
```

## What this does not do

The human-debate runs reconstruct transcripts without speaker approval. Formal validity
does not establish fidelity to their arguments. The two-AI run checked back-translation
but did not include a deliberately deceptive participant. The evidence run investigated
one claim and left its source limitations explicit.

A successful proof, a faithful translation, an adequate evidence search, and a useful
judgment are different achievements. The [inference protocol's limits](inference-protocol.md#10-limits-stated-plainly)
and [open questions](open-questions.md) record the remaining obligations. The red team
also showed why separating concepts requires scrutiny of the environment and its rules.
