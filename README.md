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
