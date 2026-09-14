# Proof-carrying debate

A machine-checked formalization of one real political debate, *Should America End
Birthright Citizenship?* (Open to Debate, June 2026), built as a test of a protocol in
which every claimed inference must carry a certificate a proof assistant can check.

## Layout

```
README.md                 this file
docs/                     specifications, results, learnings, thesis
docs/sources/             raw source conversations
Debate.lean               library root; imports every module
Main.lean                 entry point for the `report` executable
Debate/Protocol.lean      statuses, verdicts, rendering; no debate content
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
- Each completed run is tagged (`run-birthright-1` is the current one) so the tallies in
  `docs/results.md` stay reproducible after the protocol layer moves on.
- Commit as you go, with a message that names the claim or question the change bears on.
