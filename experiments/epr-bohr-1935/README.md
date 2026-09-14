# EPR and Bohr: two scientific papers as auditable Lean articles

This experiment converts the principal arguments of the two original 1935 papers into
readable companions with checked Lean proofs, explicit assumptions, and countermodels.
It implements the format proposed in
[Scientific papers as auditable arguments](../../docs/scientific-papers.md).

**Read these first:**

| Paper | Readable article | Lean article |
|---|---|---|
| Einstein, Podolsky, Rosen (1935) | [EPR.md](EPR.md) | [EPR.lean](PaperStudies/EPR.lean) |
| Bohr's reply (1935) | [BOHR.md](BOHR.md) | [Bohr.lean](PaperStudies/Bohr.lean) |

Then read [the comparison](COMPARISON.md). The most consequential distinction is between
both quantities having physical reality and both being predictively warranted in one
arrangement. The Lean comparison preserves that distinction.

## What you can inspect

- Source locators, claim IDs, assumption ledgers, and coverage of the original papers.
- A conditional reconstruction of EPR's incompleteness argument.
- A reconstruction of Bohr's context-dependent predictive critique.
- Nonempty logical countermodels showing which inferences need additional premises.
- Explicit mappings between the models' prediction and representation tables.
- A report whose entries contain actual Lean proof terms.

These are reconstructions of the central arguments. The original quantum states,
Fourier/distribution calculations, and apparatus physics are not fully formalized.
The two article companions identify every such boundary. Neither a successful build
nor the axiom audit verifies the physical premises or the fidelity of the translation.

## Run it

This is an independent Lake project using the repository's Lean 4.24.0 toolchain and
core libraries, with no Mathlib or other downloaded package dependencies. From the
parent repository root:

```bash
cd experiments/epr-bohr-1935
lake build
lake exe report
```

Print the complete theorem audit explicitly after building:

```bash
lake env lean PaperStudies/Audit.lean
```

The build covers both paper articles, the comparison, the report, and the audit.
The report has **33 result entries**: 17 EPR, 11 Bohr, and 5 comparison entries.
The audit covers **44 theorem declarations**, including 11 supporting results that
do not have separate report entries. **42 have no axiom dependencies.** The two general
integer identities, `EPR.position_prediction` and `EPR.momentum_prediction`, depend on
Lean's standard propositional extensionality axiom (`propext`) through core integer
lemmas. There are no user-declared axioms or unfinished proofs. All central argument
proofs, countermodels, and comparisons have no axiom dependencies.

## Proofs and presentation

[Certificates.lean](PaperStudies/Certificates.lean) defines a report item with a
proposition and a proof of that proposition. The `checked` macro takes one theorem
identifier and derives both its displayed declaration name and its actual proof reference.
The report cannot be backed solely by an arbitrary string naming a nonexistent theorem.

English descriptions, source mappings, and the choice of what proposition to prove still
require review. The proof-bearing registry prevents one form of metadata drift; it does
not establish that a caption faithfully describes a scientific claim.

## Other files

| File | Purpose |
|---|---|
| [SOURCES.md](SOURCES.md) | Original papers, page conventions, and inspection limits |
| [SETUP.md](SETUP.md) | Source selection, scope, and roles fixed before delegation |
| [STATUS.md](STATUS.md) | Completion and validation record |
| [Comparison.lean](PaperStudies/Comparison.lean) | Explicit mappings and checked comparison |
| [Report.lean](PaperStudies/Report.lean) | Proof-bearing result entries and rendering |
| [Audit.lean](PaperStudies/Audit.lean) | Every theorem declaration in the experiment |
| [report.txt](report.txt) | Saved output of `lake exe report` |
| [audit.txt](audit.txt) | Saved explicit audit output |

The experiment has its own build outputs and does not add imports or change results
in the parent debate project. The [comparison](COMPARISON.md#independent-review)
records the delegated work and cross-review.
