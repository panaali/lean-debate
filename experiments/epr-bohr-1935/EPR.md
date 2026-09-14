# EPR 1935: an auditable Lean article

**Checked result:** under five explicit premises, the modeled wavefunction description
fails a necessary completeness condition for position and momentum. A second model
shows that omitting the identification of reality across measurement choices removes
that conclusion. These are conditional logical results, not a verdict on quantum theory.

The accompanying [Lean article](PaperStudies/EPR.lean) reconstructs the principal
argument of Einstein, Podolsky, and Rosen, *Physical Review* 47, 777–780 (1935),
[DOI 10.1103/PhysRev.47.777](https://doi.org/10.1103/PhysRev.47.777).
The [original APS scan](https://journals.aps.org/pr/pdf/10.1103/PhysRev.47.777)
is the source. Author approval is unavailable; this is an interpretation for review.

## Source argument, briefly

The paper distinguishes a theory's correctness from its completeness. Its proposed
reality criterion is sufficient: a certain prediction made without disturbing the
system warrants an element of reality. For an ideal two-particle preparation, the
choice of measurement on one particle permits a prediction of the other's position
or momentum. EPR identifies the distant reality across those choices and argues that
both quantities are real, although a wavefunction cannot sharply represent both.
The closing objection explicitly distinguishes simultaneous reality from simultaneous
measurement or prediction. EPR leaves construction of a complete alternative theory open.

## What the Lean vocabulary means

`Context.position` and `Context.momentum` are alternative remote measurement choices.
They are not a claim that both measurements occur. `Quantity` contains only the two
quantities used in this argument.

A `Scenario` supplies four independent relations:

| Field | Reading in this reconstruction |
|---|---|
| `predicts c q` | In context `c`, the value of `q` can be predicted with certainty |
| `mechanicallyUndisturbed c` | The distant system is mechanically untouched in context `c` |
| `realIn c q` | The reality assignment in context `c` includes a definite value of `q` |
| `represented c q` | The description associated with context `c` sharply represents `q` |

The fields do not enforce implications between these notions. Every substantive
connection appears as a named hypothesis. In particular, `realIn` is not defined as
predictability. This preserves the sufficient, one-way character of the reality criterion.
The particular numerical values are abstracted out of this logical signature.

## Assumptions and their source locations

| ID | Lean hypothesis or definition | Source anchor | Treatment |
|---|---|---|---|
| E1 | `Correlations` | pp. 779–780, equations (7)–(16) | Ideal alternative predictions assumed; quantum derivation external |
| E2 | `Separation` | p. 779, discussion after (8) | Mechanical non-disturbance assumed |
| E3 | `RealityCriterion` | pp. 777–778 | A sufficient interpretive criterion, explicitly assumed |
| E4 | `RealityInvariance` | p. 779, identification of the distant reality; p. 780 closing objection | Cross-context identification explicitly assumed |
| E5 | `QuantumRestriction` | p. 778; p. 780 canonical commutator | No joint sharp representation of this pair, assumed |
| E6 | `PairCompleteAt` | p. 777 completeness condition; p. 778 representation argument | Necessary completeness condition restricted to the pair |

E4 is **not a premise the authors forgot to state**. The conversion gives a distinct
formal name to their identification of reality across alternatives. Whether E2 warrants
E4 is precisely a point that should remain visible to a reviewer.

E2 deliberately captures only mechanical non-disturbance; the paper's inference from
no interaction to no real change is separated into E4. The symmetric, all-context form
of E4 is stronger than the particular position/momentum transports needed in the proof.
That generalization is a modeling choice, not a claim that the paper states this exact
quantified formula.

`PairCompleteAt s c` means every reality assignment in context `c` is represented by
the corresponding description. Refuting this condition would refute any stronger
completeness demand that implies it. Satisfying this two-quantity condition would not
establish completeness for all physical phenomena.

## The checked argument

```text
E1 predictions + E2 separation + E3 sufficient reality criterion
                             |
                     EE1: separate assignments
                             |
                     E4: same-reality identification
                             |
                     EE2: joint reality in one context
                             |
             E5 + E6 would require an excluded joint representation
                             |
                     EE4: not pair-complete
```

The main statement, with its actual Lean vocabulary, is:

```lean
theorem incomplete (s : Scenario)
    (h1 : Correlations s) (h2 : Separation s) (h3 : RealityCriterion s)
    (h4 : RealityInvariance s) (h5 : QuantumRestriction s) (c : Context) :
    ¬ PairCompleteAt s c
```

| Result | What the proof establishes |
|---|---|
| EE1 `separate_realities` | E1–E3 license the two assignments under their respective choices |
| EE2 `joint_reality` | E4 transports both assignments into any one undisturbed context |
| EE3 `complete_excludes_joint_reality` | E5 and pair completeness exclude joint reality |
| EE4 `incomplete` | E1–E5 jointly reject pair completeness |
| EE5 `premises_satisfiable` | The five premises have a concrete logical model |
| EE6–EE9 | A complete contextual model refutes the attempted derivation without E4 |
| EE10–EE11 | Removing the reality criterion or the representation restriction also permits complete models |
| EE12 | The reality criterion does not imply its converse |

The countermodel for EE6–EE9 assigns reality and representation only to the quantity
selected in each context. Each prediction is valid in its own context, and mechanical
non-disturbance holds in both. Every reality assignment is represented, yet the
cross-context identification fails. This is a witness about the logical signature;
it is not a construction of a physical quantum system.

The consistency witness for EE5 instead assigns both quantities to reality in both
contexts while representing only the selected quantity. All five premises hold, and
pair completeness fails. The principal proof therefore does not depend on an
inconsistent collection of premises.

## Check how the vocabulary changes the proof

`UnindexedScenario` supplies an alternative encoding with one context-independent
`real` predicate and one `represented` predicate. In that encoding,
`unindexed_reality_is_invariant` is automatic, and `unindexed_incomplete` needs no
separate E4 argument.

This is a sensitivity check: the substantive identification can appear either as a
hypothesis or inside the vocabulary. Its disappearance from a theorem signature does
not establish that the scientific assumption has disappeared.

## Two small mathematical checks

EE13–EE14 check the affine relations behind the signs in the ideal predictions:

```text
x₂ − x₁ = x₀   iff   x₂ = x₁ + x₀
p₁ + p₂ = 0    iff   p₂ = −p₁
```

The implementation uses integers as an arithmetic illustration. It does not replace
the continuous variables, generalized eigenstates, or delta distributions of the paper.
These two proofs use core integer lemmas that depend on Lean's standard `propext`
axiom. The [audit](audit.txt) records this dependency; neither identity is a premise
of the conditional incompleteness proof.

EE15 is a diagnostic for E5. Two explicit linear integer-matrix operators do not commute
but share a nonzero eigenvector. Four supporting lemmas verify their linearity. This
shows why global noncommutation of arbitrary operators is too weak a premise for a
general exclusion of common eigenvectors. E5 retains the stronger restriction needed
for the selected canonical pair. The diagnostic does not refute the canonical
position/momentum relation.

## Coverage and remaining work

| Original material | Coverage in this conversion |
|---|---|
| p. 777: correctness, completeness, and reality criterion | Definitions and explicit assumptions |
| p. 778, equations (1)–(6): eigenstates and single-particle illustration | Sharp representation abstracted; no analytic derivation |
| p. 778: completeness versus simultaneous reality | EE3–EE4 conditional proof |
| p. 779, equations (7)–(8): expansions and reduction | Alternative-prediction input; expansion and reduction rules not proved |
| pp. 779–780, equations (9)–(17): ideal correlated state | E1; sign calculations EE13–EE14 only |
| p. 780: canonical commutator | E5 assumption; generic noncommutation diagnostic EE15 |
| pp. 779–780: same reality across measurement choices | E4, explicit countermodel, alternative unindexed encoding |
| p. 780: concluding inference and objection | Conditional incompleteness; reality/prediction distinction preserved |
| p. 780: possibility of a more complete theory | Left open; no replacement theory constructed |

The conversion does not formalize a Hilbert space, the Schrödinger equation, generalized
wavefunctions, normalization or limiting procedures, measurement dynamics, experimental
data, or the truth of the reality criterion. Claims that these physical constructions
realize the logical predicates remain external obligations. No spin reformulation,
Bell inequality, or later experimental result is used to decide the 1935 exchange.

Read the [Bohr companion](BOHR.md) and [comparison](COMPARISON.md) next. Build and audit
instructions are in the [experiment README](README.md).
