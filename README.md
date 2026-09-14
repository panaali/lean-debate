# Proof-carrying debate

A machine-checked formalization of one real political debate, *Should America End
Birthright Citizenship?* (Open to Debate, June 2026), built as a test of a protocol in
which every claimed inference must carry a certificate a proof assistant can check.

Current state: 90 theorems across two debates, a two-AI run and the evidence layer, all
reporting no axioms. Birthright (`run-birthright-3`): 36 ledger edges, 4 unstated
premises. Death penalty (`run-deathpenalty-1`): 35 edges, 9 unstated premises. Two-AI
run 1: 8 verdicts. Evidence run 1: two ledgers on one leaf, kernel-checked for coherence.
`lake exe report` prints the birthright ledger, `lake exe report deathpenalty` the other.

## Layout

```
README.md                 this file
docs/                     specifications, results, learnings, thesis
docs/sources/             raw source conversations
Debate.lean               library root; imports every module
Main.lean                 entry point for the `report` executable
Debate/Protocol.lean      statuses, verdicts, rendering; no debate content
Debate/Evidence.lean      evidence-layer types; credence coherence checks; the meta-rule
Debate/Evidence/          coherence checks on two real evidence tables
Debate/Birthright/        the six argument branches, the axiom audit, the ledger
lakefile.toml             Lake build config (library `Debate`, executable `report`)
lean-toolchain            Lean 4 v4.24.0, no Mathlib
```

## Documentation

| Read | For |
|---|---|
| `docs/thesis.md` | Start here: what the project is for, the two layers, the concept map, the roadmap |
| `docs/claims.md` | The proposal's own claim ledger: ID, status, evidence, strongest objection |
| `docs/open-questions.md` | Open questions with candidate answers and what would resolve each |
| `docs/project-overview.md` | The whole project end to end: origin, protocol, Lean design, results, learnings |
| `docs/results.md` | What was built and what it found, with the tallies |
| `docs/inference-protocol.md` | The inference-layer specification (checked by Lean) |
| `docs/evidence-protocol.md` | The evidence-layer specification (Phase 3 of the protocol) |
| `docs/learnings.md` | What the exercise is worth and where it fails; read §6 before showing this to anyone |
| `docs/sources/` | The raw conversations everything was derived from |

## Running it

```bash
lake build       # builds the library and prints the axiom audit
lake exe report  # prints the judge-facing ledger
```

## Status and where to go next

Updated 14 September 2026. The roadmap is `docs/thesis.md` §6; this is its current state.

| Item | State | Where |
|---|---|---|
| Birthright run through the inference layer | done, tagged `run-birthright-2` | `Debate/Birthright/`, `docs/results.md` |
| Evidence-layer types and coherence checks in Lean | done | `Debate/Evidence.lean`, `Debate/Evidence/Examples.lean` |
| Article V load-bearing in the Motion branch | done | `Debate/Birthright/Motion.lean`, E31–E34 |
| Adversarial evidence run on leaf K1 (two agents, opposing assignments) | done, tagged `run-evidence-1`; K1 grade fed back into the ledger | `docs/runs/evidence-1/RESULTS.md` |
| Two-AI debate run on the constitutional proposition | formalized (8 verdicts); back-translation check in progress; RESULTS.md pending | `docs/runs/two-ai-1/` |
| Second debate (death penalty), chosen from titles only | done, tagged `run-deathpenalty-1`; 35 theorems, 9 unstated premises | `docs/runs/death-penalty/RESULTS.md` |
| Red team of Phase 0 (ten attacks) | done; findings filed, three repaired in Lean, protocol §2.6–2.9, 3.4, 6, 8, 9.7 revised | `docs/redteam-phase0.md`, C4/C5/C6/C17/C19/C20, Q4/Q10/Q19–Q25 |
| Reusable argument-schema library | not started; now two debates' worth of branches to factor | `docs/open-questions.md` Q11 |
| Second red team, against the revised protocol | not started | `docs/redteam-STATUS.md` |
| Training on the checkable half | not started, outside current means | Q14 |

Each `docs/runs/<name>/SETUP.md` fixes the proposition, environment, rules and roles
before any agent is invoked; results land in the same folder. Each in-progress run has a
`STATUS.md` saying which pieces have landed, which are being produced right now and by
whom, and what an outside agent may safely add. Read it before touching a run folder.
The red team's status is in `docs/redteam-STATUS.md`. A run is finished when its
folder has a `RESULTS.md`, its Lean modules (if any) are in `Audit.lean`, and
`docs/results.md`, `docs/claims.md` and `docs/open-questions.md` have been updated with
what it changed.

To pick something up: take an in-progress run whose folder lacks `RESULTS.md`, or an
OPEN question in `docs/open-questions.md`, or a CONTESTED claim in `docs/claims.md`.

## What kind of help is wanted

Running experiments is one kind. The others matter as much, and an agent should feel free
to take any of them without being asked:

- **Attack the arguments.** Read `docs/thesis.md` and `docs/claims.md` as an opponent.
  Find the step that does not follow, the claim whose status is too generous, the
  objection nobody has written down. Add it to the claim's "strongest objection" cell or
  as a new question. Downgrade a status if the evidence does not carry it.
- **Refine the writing.** Every document here was written fast. Cut what repeats, split
  what conflates two ideas, rename what is misnamed, move a paragraph to the document it
  belongs in. Shorter and sharper is the goal; `docs/thesis.md` should read in one sitting.
- **Fix the organization.** If two documents say the same thing, merge toward one and
  leave a pointer. If a document has grown a section that is really a new document, split
  it. If the reading order in this README is wrong, change it.
- **Check consistency.** Numbers, IDs, file names, and section references are repeated
  across `README.md`, `docs/results.md`, `docs/project-overview.md`, `docs/thesis.md` and
  the two registers. When one changes the others drift. Find and fix drift.
- **Verify the unverified.** Anything marked "from general knowledge" or "not inspected"
  (search for Q17) is a claim waiting for the evidence protocol to be run on it.
- **Simplify the Lean.** Six branches each declare their own vocabulary. Factor shared
  shapes into schemas (Q11) without changing any verdict; the audit must still pass.

Conventions for editorial work: never lose information (move it, do not delete it); keep
claim, question, and edge IDs stable; when you change a status or a finding, say in the
commit message what evidence changed it; if you disagree with something but do not want
to rewrite it yet, put a note in `docs/reviews/<date>-<topic>.md` and reference the ID.

## How to work on this

The project is a working document set, not a publication. To contribute:

- Attack a claim in `docs/claims.md` or answer a question in `docs/open-questions.md`.
  Reference them by ID (`C7`, `Q2`). Change a status only with the evidence that changed it.
- Never delete a row or an entry. Mark it superseded and say why.
- New findings that change the frame go in `docs/thesis.md`; new reference material goes
  in `docs/project-overview.md`; raw conversations go in `docs/sources/` with a descriptive
  name.
- Lean changes must build. `lake build` must still report every verdict as depending on no
  axioms, and `Debate/Birthright/Audit.lean` must list every new theorem.
- Git records what replaced what; sibling Lean modules record what coexists. A change that
  supersedes an existing formalization (a fix, a rename, a protocol-layer addition) is made
  in place and committed. A change meant to be *compared* with an existing formalization
  (a second independent formalization of the same speech, an alternative modelling of the
  same analogy, a second debate) is added as a sibling module under the same branch
  namespace, with its own signature, listed in `Audit.lean`, and with a comparison note in
  `docs/results.md`. No version folders.
- Each completed run is tagged (`run-birthright-3` is the current one; `-2` added the
  evidence layer and Article V; `-1` is the original 30-verdict development) so the tallies in `docs/results.md` stay
  reproducible after the protocol layer moves on.
- Commit as you go, with a message that names the claim or question the change bears on.
