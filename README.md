# Proof-carrying debate

A persuasive argument can be wrong in ways that neither an opponent nor a judge can
identify. This is a central challenge for AI oversight: how can we evaluate an argument
from a system whose reasoning exceeds our own ability to check it?

**Proof-carrying debate investigates whether AI can act as a logician for ordinary
language: exposing hidden assumptions, making disagreements precise, and producing
reasoning that can be checked independently.**

The approach separates two questions: does a conclusion follow from its premises, and
what justifies accepting those premises? Language models translate arguments into
explicit claims and logical steps. The Lean proof assistant checks proofs and
counterexamples for those steps. A complementary evidence protocol guides investigation
of factual claims, while questions of interpretation and values remain explicit.

The intended result is a record of what an argument establishes, which assumptions it
requires, and where disagreement remains. Formal checking cannot establish that the
premises are true or that the translation preserves the speaker's meaning. Source
investigation and scrutiny of the translation are therefore essential parts of the
method. The larger ambition is to make sophisticated reasoning answerable to people who
cannot reproduce every step themselves.

## What the project has shown

The first case study reconstructed a debate on birthright citizenship. It exposed
unstated premises and apparent rebuttals that left the opposing conclusion untouched.
A second debate, on the death penalty, produced similar patterns. In a separate two-AI
run, both sides' arguments were valid under different readings of the question; the
formalization made that difference explicit. An evidence run tested whether agents
assigned opposing positions would converge after investigating the same disputed claim.

These are initial demonstrations. Their value at scale, their fidelity to speakers'
intentions, and their resistance to a deceptive participant remain research questions.
The [thesis](docs/thesis.md) develops the case; [results](docs/results.md) records the
experiments and their limits.

The main development currently audits **90 theorems**: 36 birthright verdicts,
35 death-penalty verdicts, 8 two-AI verdicts, and 11 evidence checks. All report no axioms.
The two human-debate reconstructions identify 4 and 9 unstated premises respectively.
The theorem count records what was checked; it does not measure how much of a debate
was faithfully captured.

## Start reading

| Document | Purpose |
|---|---|
| [Thesis](docs/thesis.md) | The problem, central hypothesis, method, findings, and next experiments |
| [Results](docs/results.md) | What each run found, with reproducible tallies and limitations |
| [Learnings](docs/learnings.md) | What formal checking adds and where the approach still fails |
| [Claims ledger](docs/claims.md) | The proposal's claims, evidence, statuses, and strongest objections |
| [Open questions](docs/open-questions.md) | Candidate answers and what would resolve each question |
| [Inference protocol](docs/inference-protocol.md) | Rules for formalizing arguments and checking inferences |
| [Evidence protocol](docs/evidence-protocol.md) | Rules for investigating factual and probabilistic claims |
| [Project overview](docs/project-overview.md) | Development history and detailed explanation of the Lean design |
| [Scientific papers](docs/scientific-papers.md) | Proposed extension to papers with linked proofs and evidence records |
| [Contributing](docs/contributing.md) | Useful work, ownership checks, and editing conventions |
| [Source conversations](docs/sources/) | The discussions from which the project developed |

Read [Learnings §6](docs/learnings.md#6-the-hole-worked-through) before presenting the
project: checked reasoning can still rest on a biased or incomplete evidence search.

## Running it

Run from the repository root with `lake` on your PATH. The
[toolchain file](lean-toolchain) pins Lean 4 v4.24.0; the main build uses no Mathlib or
external Lean packages.

```bash
lake build                    # builds the library and report; runs both axiom audits
lake exe report               # birthright citizenship ledger
lake exe report deathpenalty  # death-penalty ledger
lake exe report all           # both ledgers
```

To inspect the audits explicitly after building:

```bash
lake env lean Debate/Birthright/Audit.lean
lake env lean Debate/DeathPenalty/Audit.lean
```

The executable renders existing ledgers. The debate, translation, and evidence workflows
are conducted through the documented runs. Lean checks their formal theorems; the
report's English labels and theorem references are maintained separately.

## Status and where to go next

Updated 14 September 2026. Run results record completed work; `STATUS.md` files record
ownership and available follow-up work.

| Work | State | Record |
|---|---|---|
| Birthright reconstruction and red-team repairs | complete, `run-birthright-3` | [Results](docs/results.md), [Lean](Debate/Birthright/) |
| Evidence types and initial coherence checks | complete, introduced in `run-birthright-2` | [Types](Debate/Evidence.lean), [examples](Debate/Evidence/Examples.lean) |
| Article V in the Motion branch | complete, E31–E34 in `run-birthright-2` | [Explanation](docs/results.md#article-v-made-load-bearing-added-in-run-birthright-2) |
| Adversarial evidence run on K1 | complete, `run-evidence-1`; findings entered in the ledger | [Results](docs/runs/evidence-1/RESULTS.md), [status](docs/runs/evidence-1/STATUS.md) |
| Two-AI constitutional debate | complete, `run-twoai-1`; 8 verdicts and matching back-translation | [Results](docs/runs/two-ai-1/RESULTS.md), [status](docs/runs/two-ai-1/STATUS.md) |
| Death-penalty reconstruction | complete, `run-deathpenalty-1`; selected from titles only | [Results](docs/runs/death-penalty/RESULTS.md), [status](docs/runs/death-penalty/STATUS.md) |
| First Phase 0 red team | complete; ten attacks, protocol revisions, and three Lean repairs | [Findings](docs/redteam-phase0.md), [status](docs/redteam-STATUS.md) |
| Reusable argument schemas | not started; two debates now supply examples | [Q11](docs/open-questions.md#q11-is-there-a-reusable-library-or-does-every-debate-need-its-own-signatures) |
| Second red team against the revised protocol | not started | [Available work](docs/redteam-STATUS.md) |
| Training on the checkable part | not started, outside current means | [Q14](docs/open-questions.md#q14-does-training-on-the-checkable-half-transfer-to-leaf-honesty) |

[Thesis §6](docs/thesis.md#6-next-steps) explains which experiments would be most
informative. Before taking work, read the relevant setup and status, and check
`git status --short`. An unfinished run is not necessarily available to take over.
Independent critiques can go in [reviews](docs/reviews/).

## Layout

```text
README.md                 project description and reading guide
docs/                     thesis, protocols, results, learnings, and registers
docs/sources/             raw source conversations
docs/runs/                fixed setups, submissions, status, and results
docs/reviews/             critiques and editorial drafts
Debate.lean               library root and module imports
Main.lean                 entry point for the report executable
Debate/Protocol.lean      claim/edge records, statuses, verdicts, rendering
Debate/Evidence.lean      evidence types, coherence checks, meta-rule proposition
Debate/Evidence/          worked evidence checks
Debate/Birthright/        six argument branches, two-AI run, audit, and ledger
Debate/DeathPenalty/      six argument branches, audit, and ledger
experiments/              separate experiments with their own setup and status
lakefile.toml             Lake build configuration
lean-toolchain            pinned Lean version
```
