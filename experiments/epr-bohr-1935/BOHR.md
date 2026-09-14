# Bohr 1935: an auditable reconstruction

This companion reconstructs the principal argument of Niels Bohr, “Can
Quantum-Mechanical Description of Physical Reality be Considered Complete?”,
*Physical Review* 48 (1935), 696–702,
[DOI 10.1103/PhysRev.48.696](https://doi.org/10.1103/PhysRev.48.696). The
[official APS PDF](https://journals.aps.org/pr/pdf/10.1103/PhysRev.48.696) was
checked page by page, including the equations, apparatus discussions, and
footnotes. The [CERN bibliographic record](https://cds.cern.ch/record/1060284)
was also reached, but its linked file was not independently verified here.
Author approval is
unavailable, so everything below is a reconstruction rather than an endorsed
formalization.

## Compact source synopsis

Bohr first restates the EPR criterion and their position/momentum conclusion.
He then argues through slit and diaphragm arrangements that an experimental
procedure supplies the reference conditions under which a classical quantity
can be applied unambiguously. In the two-particle case, measuring particle 1
does not mechanically disturb particle 2 at the final stage, but the choice of
measurement changes the conditions supporting predictions about particle 2.
That is the ambiguity he finds in EPR’s phrase “without in any way disturbing
a system” (p. 700). He presents complementarity as the mutual exclusion of
procedures that define conjugate quantities, and describes quantum mechanics
as complete only “within its scope,” rather than proving a context-free
metaphysical completeness theorem.

## Claims and formal counterparts

| ID | Source locator | Controlled reconstruction | Lean item | Status |
|---|---|---|---|---|
| B-01 | pp. 696–697; footnote begins p. 696 and continues p. 697 | The EPR correlations are consequences of the quantum transformation formalism. | `AlternativePredictions` is assumed as argument-level input; `bohr_alternative_predictions` realizes it in a finite model. | Modeled, not physically derived |
| B-02 | pp. 697–699 | Fixed and momentum-controlled diaphragm arrangements support different uses of position and momentum. | `Arrangement`, `ContextualWarrant`, `bohrScenario` | Modeled |
| B-03 | p. 699, main text and footnote | The two-slit preparation is tied to the EPR position/momentum state; either later measurement predicts the corresponding quantity of the other particle. | `bohr_alternative_predictions` | Logical shape checked; wavefunction equivalence assumed |
| B-04 | p. 700 | The last measurement need not mechanically disturb particle 2, yet it changes the conditions defining possible predictions. | `mechanical_non_disturbance_is_not_condition_preservation` | Checked in the model |
| B-05 | pp. 699–700 | Complementary procedures do not license simultaneous predictive warrant in one arrangement. This alone does not refute simultaneous reality. | `no_joint_warrant_of_complementary`, `bohr_no_joint_warrant`, `no_joint_warrant_compatible_with_simultaneous_reality` | Both directions distinguished by countermodel |
| B-06 | p. 700; compare EPR p. 780 | A very strong transport rule would yield joint predictive warrant, but it is not EPR’s locality premise and EPR does not require simultaneous prediction. | `bohr_transport_fails`, `joint_warrant_of_transport` | Strong sufficient repair isolated, not attributed to EPR |
| B-07 | pp. 700–701 | Complementarity is mutual exclusion of procedures permitting unambiguous definitions of complementary quantities. | `Complementary` | Modeling choice; consequence checked |
| B-08 | pp. 701–702 | Object/instrument discrimination and classical description of apparatus delimit quantum description. | `ScopeComplete` | Highly compressed model |
| B-09 | abstract, pp. 700–702 | Quantum mechanics may meet completeness demands within its scope. | `bohr_scope_complete` | Requires the model’s representation facts; checked only for the finite reconstruction |
| B-10 | p. 700 wording “does not justify” | The predictive critique alone does not establish even scope-relative completeness. | `noRepresentationScenario`, `critique_alone_does_not_entail_scope_completeness` | Checked by a second nonempty countermodel |

## Assumptions and interpretive choices

| ID | Choice or assumption | Why it is explicit |
|---|---|---|
| BE-01 | `Quantity` contains only position and momentum. | The reconstruction preserves the original example and makes no claim about all observables. |
| BE-02 | `Arrangement` has a position frame and a momentum balance. | These are abstractions of Bohr’s rigid-support and momentum-controlled procedures, not apparatus simulations. |
| BE-03 | `mechanicallyUndisturbed`, `predicts`, and `predictionConditionsPreserved` are independent fields. | This prevents “no mechanical disturbance” from silently implying that all predictive conditions remain fixed. |
| BE-04 | `CoarseReality` existentially forgets the arrangement. | This represents the reading of EPR that Bohr attacks; it is not asserted as EPR’s only possible meaning. |
| BE-05 | `ContextualWarrant` requires mechanical non-disturbance, a prediction, and preserved conditions in the same arrangement. | This is the formal reconstruction of the page-700 distinction. Bohr does not provide this formula. |
| BE-06 | `Complementary` forbids simultaneous preservation of both sets of prediction conditions. | The physical grounds are supplied by Bohr’s apparatus analysis but are assumptions in this propositional model. |
| BE-07 | `WarrantTransport` transports a prediction and its conditions to every context. | It is an explicitly over-strong sufficient premise for joint predictive warrant, not EPR’s own invariance-of-reality or locality premise. |
| BE-08 | `ScopeComplete` means representation of every contextually warranted quantity. | This makes “within its scope” precise for the toy signature; broader completeness notions remain open. |
| BE-09 | `ExternalReality` is independent of `Scenario` and its arrangements. | It tests the EPR-friendly possibility that both realities exist although no single arrangement warrants both predictions. |
| BE-10 | `noRepresentationScenario` retains all predictive and complementarity facts but sets `represents` to false. | It tests whether Bohr’s critique supplies a representation premise; it does not. |

The central dependency is:

```text
alternative procedures + context-specific conditions
                 |                         |
                 v                         v
       two coarse reality claims     complementarity
                 |                         |
                 |                 no common-context warrant
                 v
      joint predictive warrant only with BE-07 (transport across contexts)
```

The concrete `bohrScenario` is nonempty: both inductive types have constructors.
It validates each arrangement-specific prediction and both coarse reality
claims, while refuting a joint warrant and `WarrantTransport`. Separately, an
external assignment can call both quantities real in this same model. Thus no
joint predictive warrant is not identified with no simultaneous reality.

The `noRepresentationScenario` changes only `represents`, setting it to false.
It retains the alternative predictions, complementarity, and absence of joint
warrant, but is not scope-complete. In contrast, `bohrScenario` is
scope-complete because its representation relation was chosen to match its
warrants. This pair shows exactly where a representation premise is needed.

## Competing plausible reading

A plausible EPR-friendly reading treats “without disturbance” as referring
only to the physical state of particle 2. On that reading, the choice made at
particle 1 changes our evidence or description, not particle 2’s elements of
reality. EPR can therefore maintain a context-independent assignment of both
realities without claiming both quantities can be predicted in one arrangement.
Bohr instead treats the conditions for prediction as part of the phenomenon to
which physical-reality language applies. `WarrantTransport` is stronger than
this disagreement and is included only to mark a sufficient route to joint
predictive warrant. The Lean file does not adjudicate the rival accounts of
reality or derive either from experimental data.

## Coverage ledger

| Paper material | Treatment |
|---|---|
| Restatement of EPR and reply’s announced aim, p. 696 | Checked against original; summarized |
| Canonical-variable transformation, footnote pp. 696–697 | Visually checked; outside formal scope because no linear algebra or commutator model is introduced |
| Single-particle slit, rigid diaphragm, recoiling diaphragm, pp. 697–699 | Checked; compressed into BE-02 and BE-06 |
| Interference loss and uncertainty-relation reasoning, p. 698 | Checked as a source claim; assumed, not derived |
| Two-particle EPR diaphragm construction and its footnote, pp. 699–700 | Checked; logical prediction structure modeled; physical equivalence assumed |
| Decisive distinction between mechanical disturbance and prediction conditions, p. 700 | Checked and explicitly formalized |
| Time/energy and clock discussion, pp. 700–701 | Checked; outside the principal position/momentum formalization |
| Object/instrument cut and classical apparatus language, p. 701 | Checked; represented only by scope indexing |
| Relativity analogy, pp. 701–702 | Checked; interpretive analogy, outside formal scope |
| Diagrams | The published article contains no apparatus diagrams. Its p. 702 footnote says diagrams and fuller mathematical developments were left to a future paper. |

## What has and has not been established

Lean checks that complementarity, as defined, rules out one-arrangement joint
predictive warrant; that separate context-indexed predictions still yield the
two coarse claims; and that a strong transport premise would be sufficient to
recombine the predictive warrants. It checks that absence of joint warrant is
compatible with a context-independent assignment of both realities. A second
countermodel proves that the predictive critique alone entails no
scope-completeness result.

This is a finite logical signature, not a Hilbert-space reconstruction, an
apparatus dynamics, or an empirical verification of quantum mechanics. It does
not derive diffraction, uncertainty relations, conservation laws, interference
loss, the EPR wavefunction, or Bohr’s indispensability claim for classical
concepts. It does not use spin, Bell inequalities, or later no-go results.
