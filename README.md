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

## What is implemented

The project includes formal reconstructions of birthright-citizenship and death-penalty
debates, a two-AI debate, an adversarial evidence investigation, and tests of the setup
rules. The reconstructions expose missing premises and apparent rebuttals that leave
the opposing conclusion possible. The two-AI run makes a disagreement over the meaning
of the question explicit.

The main Lean development audits **90 theorems**, all reporting no axioms. These are
initial demonstrations: their fidelity, usefulness at scale, and resistance to deliberate
deception remain research questions. [Results](docs/results.md) records what each run
establishes and what it leaves open.

A separate [EPR and Bohr experiment](experiments/epr-bohr-1935/README.md) applies the
approach to scientific papers, with readable companions and a report that carries Lean
proof terms. Its scope and audit are documented independently of the 90-theorem debate build.

## Read the project

| Document | Purpose |
|---|---|
| [Thesis](docs/thesis.md) | The central argument, findings, limits, and next experiments |
| [Project overview](docs/project-overview.md) | Current architecture, workflow, and implementation boundaries |
| [Results](docs/results.md) | Completed experiments, checked outcomes, and source limitations |
| [Learnings](docs/learnings.md) | What formal checking adds and where the approach can still fail |
| [Inference protocol](docs/inference-protocol.md) | Rules for making arguments precise and checking their inferences |
| [Evidence protocol](docs/evidence-protocol.md) | Rules for investigating factual and probabilistic premises |
| [Claims](docs/claims.md) and [open questions](docs/open-questions.md) | Evidence for the proposal and tests that would resolve its uncertainties |
| [Scientific papers](docs/scientific-papers.md) | The proposed extension to papers with linked proofs and evidence records |
| [Related ideas](docs/related-ideas.md) | Connections to rationality, philosophy, science, law, and investigation, with a map to the implementation |

[Learnings §6](docs/learnings.md#6-the-hole-worked-through) explains the central remaining
risk: checked reasoning can still rest on a biased or incomplete evidence search.

## Run the reports

Run from the repository root with `lake` on your PATH. The
[toolchain](lean-toolchain) pins Lean 4 v4.24.0. The main build uses no Mathlib or
external Lean packages.

```bash
lake build                    # builds the main project and runs both axiom audits
lake exe report               # birthright citizenship ledger
lake exe report deathpenalty  # death-penalty ledger
lake exe report all           # both ledgers
```

The executable renders existing ledgers. The translation, debate, and evidence
investigations are conducted through the documented runs. Separate experiments have
their own setup and build scope.

## Contribute

Use the [roadmap](docs/thesis.md#6-next-steps) and
[contributor guide](docs/contributing.md) to choose useful work. Independent fidelity
checks, deliberate-deception tests, harder evidence searches, and studies of judge
usefulness would most directly test the proposal.

Before editing, read the relevant `SETUP.md` and `STATUS.md` and check
`git status --short`. Run records are in [docs/runs](docs/runs/);
[red-team status](docs/runs/phase0-redteam-1/STATUS.md) lists available follow-up work.
An unfinished task may already belong to another session.

## Repository map

| Location | Contents |
|---|---|
| [Debate/](Debate/) | Protocol types, argument formalizations, evidence checks, ledgers, and audits |
| [docs/](docs/) | Thesis, specifications, results, and research questions |
| [docs/runs/](docs/runs/) | Setups, submissions, extractions, evidence, and results |
| [experiments/](experiments/) | Separate experiments with their own scope and build instructions |
| [docs/sources/](docs/sources/) | Preserved source conversations |
| [docs/archive/](docs/archive/README.md) | Superseded descriptions, background material, and earlier measurements |
