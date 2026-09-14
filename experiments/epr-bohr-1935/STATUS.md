# Status: EPR and Bohr paper-conversion experiment

14 September 2026. Complete within the principal-argument scope fixed in
[SETUP.md](SETUP.md). Both paper companions, their Lean reconstructions, and the
comparison are ready to inspect. The coverage ledgers retain the unformalized physics.

| Piece | Owner | State |
|---|---|---|
| EPR Lean article and companion | parent | complete; source-fidelity review by Bohr agent |
| Bohr Lean article and companion | Bohr subagent; parent integration | complete; reviewed and revised |
| Source manifest, comparison, proof registry, audit, report | parent | complete; outputs saved |
| Build and audit | parent | passed with the explicit dependencies below |
| Scoped learnings | parent | [LEARNINGS.md](LEARNINGS.md) |

## Validation record

- `lake build` completed successfully: 17 jobs, Lean 4.24.0, no external packages.
- `lake env lean PaperStudies/Audit.lean` produced [audit.txt](audit.txt): all 44
  theorem declarations are covered exactly once. 42 have no axiom dependencies;
  the two integer prediction identities use only standard `propext` through core
  integer lemmas. No user-declared axioms or unfinished proofs occur.
- `lake exe report` produced [report.txt](report.txt): 33 unique entries, each
  containing a proof of an audited theorem (17 EPR, 11 Bohr, 5 comparison).
- Checked report references, theorem coverage, local document links, and whitespace.

The [comparison](COMPARISON.md#independent-review) records the delegated source
review. Finalization included local code/document consistency checks and the complete
build and audit above. Neither review nor the build establishes the fidelity of
every modeling choice.

This experiment has its own Lake project. The parent project's code, build targets,
and existing run artifacts were not changed by this work. Its CI does not currently
run this separate experiment; the validation recorded here was run locally.
