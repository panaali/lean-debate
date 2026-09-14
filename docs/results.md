# Results from the proof-carrying debate experiments

The project has reconstructed two human debates, conducted a two-AI debate and an
adversarial evidence investigation, and red-teamed its setup rules. These experiments
expose missing premises, distinguish apparent rebuttals from contradictions, and show
how modeling choices can change what an argument appears to establish.

This page records the results and their limits. The [thesis](thesis.md) develops the
research argument; [learnings](learnings.md) assesses what formal checking adds.
The [archive](archive/2026-09-14-before-description-edit/docs/results.md) preserves
the original account and its historical setup instructions.

## Running it

Use the [README's prerequisites and commands](../README.md#running-it).
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

The birthright tags preserve how the first reconstruction grew:

| Tag | Certified | Refuted | Gap | Compatible | Edges | Audited theorems |
|---|---:|---:|---:|---:|---:|---:|
| `run-birthright-1` | 14 | 3 | 11 | 2 | 30 | 30 |
| `run-birthright-2` | 16 | 3 | 13 | 2 | 34 | 38 |
| `run-birthright-3` | 16 | 3 | 13 | 4 | 36 | 40 |

The four supporting theorems in the latter two tags are the initial evidence checks.
Two compatibility results concern exchanges in the transcript; the two added in `-3`
witness each side's position. They are different kinds of result.

At `run-birthright-3`, the ledger records 8 empirical claims, 9 interpretive claims,
3 value premises, and 4 unstated premises. The interpretive count rose from 7 in `-1`
to 8 in `-2` and 9 in `-3`. No substantive debate claim is labeled `PROVED`:
the checked results concern relationships between claims.

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

### Article V made load-bearing (added in run-birthright-2)

Reading Gödel's loophole (Suber's hypothesis: Article V constrains procedure, not content)
showed that the Motion branch's `AmendableByArticleV` field was declared and never used.
Four verdicts now use it. Under Suber's reading (`G-S`), amendability (`G-A`) and
non-entrenchment (`G-E`), ending birthright citizenship is lawfully available even where
the Constitution currently requires it (`E31`), so "the Constitution requires it" does not
deliver "it cannot lawfully be ended" (`E32`, countermodel). Symmetrically, where the
Constitution does not require it, Congress may keep it by statute (`G-C`, `E33`), so "not
required" does not deliver "cannot lawfully be kept" (`E34`). These are conditional results about
legal availability. Each side still needs its normative bridge, NB1 or NB2, to turn
its legal argument into a recommendation. Suber's reading is entered as a SHARED,
INTERPRETIVE node so either side may contest it.

### Red team 1 repairs (run-birthright-3)

`docs/redteam-phase0.md` produced ten attacks on Phase 0; none touches an inference. Three
were repaired in the Lean development. The Normative branch's `disanalogy` environment
field was one side's premise in the environment; it is now claim `N-D`, owned by Newman,
and `E26` depends on it (contested meanings 8 → 9). Every signature with an existential
in play carries a nonemptiness witness, so the empty domain is no longer a free
countermodel. Each side of the constitutional branch has a position witness (`E35`,
`E36`, COMPATIBLE), proving the environment satisfiable and each whole position
consistent with it, which the axiom audit alone cannot show. Tallies: 16 certified, 3
refuted, 13 gaps, 4 compatible; 40 theorems audited, all axiom-free.

### Evidence layer (added in run-birthright-2)

`Debate/Evidence.lean` types the evidence layer: a grade scale, provenance records that
say what was inspected and never what it means, and calibrated credences as percent
intervals with two decidable coherence checks (entailment ordering, partition sum).
`Debate/Evidence/Examples.lean` runs those checks on the two real probability tables the
evidence layer produced in `docs/sources/` and shows the check rejecting an incoherent
table. The initial EVIDENCE section displayed grades assigned from general knowledge or debate
agreement without source inspection. Evidence run 1 later supplied an investigated
basis for K1, recorded separately from the remaining unverified entries (Q17).
The arithmetic checks establish selected constraints, not calibration of the estimates
or adequacy of the evidence search.

## Post-freeze note (verified 14 September 2026)

The debate was held 6 June 2026 and every verdict above is frozen at that date. On
30 June 2026 the Supreme Court decided *Trump v. Barbara*, No. 25-365, 6 to 3, striking
down the 2025 executive order and holding that the Citizenship Clause covers children
born in the United States to parents unlawfully or temporarily present. That is Mayes's
conclusion, which the run left UNSUPPORTED after Krikorian refuted her stated route.
Read against the graph: the holding supplies what the run said was missing, an
affirmative route to her conclusion that does not go through J17 as she stated it; it
settles the constitutional branch's disputed node set as a matter of controlling law; and
it leaves the motion exactly where E27 and E31–E34 put it, since a "should" does not
follow from what the Constitution now requires. The run's structural findings are
unchanged by the decision. Its evidence-layer grades for K1 and the constitutional
leaves would change if the freeze were moved.

## Later runs (14 September 2026)

Three further runs, each in `docs/runs/<name>/` with a `SETUP.md` fixed before any agent
was invoked and a `RESULTS.md` when finished.

**Second debate, death penalty** (`run-deathpenalty-1`, `Debate/DeathPenalty/`). Chosen
from titles only; extracted by a separate agent. 13 certified, 1 refuted (intra-side), 12
gaps, 9 compatible; 9 premises nobody stated; disputed set of 5. The is/ought gap
recurred, on the For side only; the moderator asked the protocol's bridge question live
and got a prediction in place of a value. The compatibility count includes exchanges and position witnesses. An analogy reduced
to one premise again. See `docs/runs/death-penalty/RESULTS.md`.

**Two-AI run 1** (`Debate/Birthright/TwoAI.lean`, sibling of `Constitutional.lean`). Two
AI debaters on the constitutional proposition, third-party formalizer, opaque-identifier
back-translation. Both attacked the signature, as the protocol predicted, not each
other's inferences. After rebuttals each side accepted every premise of the other's
route: P under the constitutional reading is certified on premises B accepted, not-P
under the territorial reading is certified on premises A accepted, and everything but
the reading node is jointly satisfiable in one two-person world. The formalizer's gloss
created the ambiguity. See `docs/runs/two-ai-1/`.

**Evidence run 1** (`docs/runs/evidence-1/`). Two evidence agents with opposite
assignments on leaf K1, no shared context. They converged: K1 is true as stated
(75–98% on its parts) and does not extend to children of unauthorized immigrants
(5–35%). Each moved toward the other on the sub-claim its assignment was weakest on.
Both tables pass the kernel's coherence checks; the interval comparison prompted inspection of two readings of a sub-claim.
Non-overlap alone does not establish that analysts mean different propositions. The K1 grade in this ledger's EVIDENCE section
now comes from that run.

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
