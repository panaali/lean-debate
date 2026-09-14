# EPR and Bohr, 1935: two auditable paper companions

Fixed before delegation, 14 September 2026. This is a separate Lake project. Work in
this experiment must not change the parent project's code, build configuration, run
artifacts, status files, or claim registers.

## Sources and question

- Einstein, Podolsky, Rosen, *Physical Review* 47, 777–780 (1935),
  DOI [10.1103/PhysRev.47.777](https://doi.org/10.1103/PhysRev.47.777).
- Bohr's reply, *Physical Review* 48, 696–702 (1935),
  DOI [10.1103/PhysRev.48.696](https://doi.org/10.1103/PhysRev.48.696).

Build a readable companion and Lean argument reconstruction for each original paper,
following [Scientific papers as auditable arguments](../../docs/scientific-papers.md).
Inspect the original papers. Keep source claims, modeling choices, checked consequences,
countermodels, and unresolved interpretations distinct. Preserve the original
position/momentum setting; do not substitute a later spin or Bell argument.

## Scope and acceptance

The immediate target is the principal argument of each paper, including its dependence
on predictions, measurement arrangements, the reality criterion, and completeness.
Mathematical or apparatus details not derived in Lean must appear in a coverage ledger
as assumptions or exclusions, never as completed formalizations.

Use Lean 4.24.0 core, explicit hypotheses, and concrete nonempty countermodels. No
`sorry`, user-declared axioms, or deferred proof obligations. Do not put the conclusion
into a hypothesis and call the result a conversion. Establish useful intermediate
steps and test what fails when a substantive bridge is removed.

Definitions of reality, disturbance, and completeness are contestable modeling choices.
Keep each author's reconstruction independent initially. Comparison must state the
translation between them rather than silently equating their terms. A countermodel is
a model of the stated logical signature, not a physically realized quantum system.

Deliver two documented Lean articles, an axiom audit, reproducible build/report commands,
source locators, coverage and assumption ledgers, and a comparison of what the checked
results establish. Author approval is unavailable; label these as reconstructions.

## Roles and ownership

| Owner | Reserved files |
|---|---|
| Parent of this experiment | EPR article; project scaffolding; source manifest; comparison; audit; report; README and status |
| Bohr subagent | `PaperStudies/Bohr.lean`, `BOHR.md` |

The Bohr agent will independently inspect the original reply and report theorem names,
source access, and remaining limitations. The parent will review and build both articles.
