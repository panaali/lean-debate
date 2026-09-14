# What the two conversions reveal

The useful output is the precise point where the arguments need different notions of
reality and completeness. The [EPR article](EPR.md) and [Bohr article](BOHR.md) are
independent reconstructions. Their comparison is itself checked in
[Comparison.lean](PaperStudies/Comparison.lean).

## Keep three propositions separate

1. Either quantity can be predicted by choosing the appropriate procedure.
2. Both quantities have definite physical values, independently of that choice.
3. Both quantities can be predictively warranted in one experimental arrangement.

The EPR reconstruction moves from the first proposition to the second using its reality
criterion and an explicit invariance assumption. Its `joint_reality` theorem does not
conclude the third proposition. The Bohr reconstruction excludes the third under its
complementarity premise. That exclusion alone does not refute the second.

This is a central fidelity check. EPR's final paragraph on p. 780 rejects the necessity
of simultaneous prediction for simultaneous reality. Bohr's decisive p. 700 passage
connects the application of physical-reality language to the conditions of prediction.
The formalization must expose that interpretive dispute rather than resolve it by
using a single symbol for reality and predictive warrant.

## What is aligned in Lean

The comparison explicitly maps EPR's two context labels to Bohr's two arrangement labels,
and position to position and momentum to momentum. CE1–CE3 prove that the chosen models
have matching tables for:

- Available predictions.
- Mechanical non-disturbance.
- Sharp representation in each arrangement.

CE4 proves that EPR's joint reality assignments coexist with Bohr's lack of joint
predictive warrant in these constructions. CE5 proves that the completeness verdicts
also coexist: EPR's `PairCompleteAt` fails, while Bohr's `ScopeComplete` holds.

That is possible because the tests quantify over different things. EPR's test requires
representation of the stipulated reality assignments. Bohr's test requires representation
of the quantities warranted within a context. The latter need not include everything
in the former. This is a checked distinction between the modeled tests, not a proof
that the historical disagreement was merely verbal.

## What the countermodels prevent us from claiming

| Tempting inference | Checked diagnosis |
|---|---|
| No mechanical disturbance, therefore invariant reality assignments | EPR's `contextual_countermodel` keeps the former and rejects the latter |
| Two separately available predictions, therefore one joint predictive warrant | Bohr's concrete scenario validates the alternatives and excludes the joint warrant |
| No joint warrant, therefore no simultaneous reality | Bohr's independent external reality assignment supplies a countermodel |
| Bohr's predictive critique succeeds, therefore his completeness claim is established | `noRepresentationScenario` has the same predictive critique and fails even `ScopeComplete` |
| A proof uses fewer explicit premises, therefore it assumes less | EPR's unindexed encoding puts reality invariance into the vocabulary |

Bohr's `WarrantTransport` is deliberately stronger than EPR's `RealityInvariance`:
it would transport predictive warrants, including predictions, into every arrangement.
It is one sufficient repair for a joint-warrant target, not a reconstruction of EPR's
locality premise and not a claim about the weakest possible repair.

## Independent review

The Bohr conversion was delegated to a separate agent. The parent reviewed its model
against the original passage and required explicit separation of joint reality from
joint predictive warrant, plus a countermodel to an unsupported completeness inference.
The Bohr agent then performed a read-only source-fidelity review of the EPR article.

Its back-translation of the main EPR result was: for a chosen context/description,
the five premises rule out representation of every position-or-momentum reality
assignment in that description. The review confirmed the two arithmetic signs and
flagged the context indexing and symmetric invariance premise as modeling choices.
Those qualifications are recorded in [EPR.md](EPR.md).

This was independent cross-review with source access. It was not a blind back-translation,
author approval, or review by independent domain experts.

## Limits of the experiment

Both articles use finite logical signatures. The countermodels demonstrate satisfiability
of those signatures, not physical realizability. Quantum correlations, canonical
sharpness restrictions, and the apparatus basis of complementarity remain named inputs.
The EPR arithmetic illustration is over integers; it does not verify continuous-variable
quantum mechanics. The complete coverage ledgers make those boundaries visible.

The experiment demonstrates what an auditable companion can look like: source-linked
claims, explicit interpretation choices, checked dependencies, and concrete countermodels.
It does not decide which account of quantum reality is correct or establish that the
method improves scientific review. Those require further argument and evaluation.
