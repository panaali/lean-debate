# Scientific papers as auditable arguments

Scientific papers connect observations, assumptions, models, and conclusions. A reader
must judge each of those connections, often across several areas of expertise. A result
may depend on an unstated assumption, a change in the meaning of a term, or a statistical
guarantee whose conditions the study has not established. These dependencies can be
difficult to reconstruct from prose alone.

This proposal extends proof-carrying debate to scientific writing: **develop a method
for turning papers into auditable arguments, linking conclusions to their evidence and
assumptions, checking the formal reasoning, and identifying the judgments that remain
open to challenge.**

The proposed output is a readable companion to a paper, with linked Lean definitions,
proofs, calculations, and evidence records. The amount that can be checked will vary
with the paper. Faithful, useful conversion across fields is a research objective;
automatic conversion of every paper is not an established capability.

## What the conversion would contain

The central distinction is between whether a conclusion follows from its premises and
what justifies accepting those premises. Lean supports proofs conditional on explicit
hypotheses, making this distinction part of the formal statement itself.
[Lean: propositions and proofs](https://docs.lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/)

Each consequential claim would retain its original passage and receive a precise
rendering. Its dependencies would distinguish definitions, model assumptions,
observations, computations, and interpretive judgments. Where possible, the companion
would include a proof of the claimed inference or a countermodel showing that it fails.
A step without either certificate would remain unresolved.

| Part of a paper | What the companion could check or expose |
|---|---|
| Definitions and models | Explicit objects, relationships, scope, and assumptions |
| Mathematical deductions | Proofs that the stated conclusions follow |
| Computations on supplied data | Correctness of specified calculations, given suitable formal implementations or certificates |
| Statistical guarantees | Properties of a procedure under a specified probability model and its assumptions |
| Observations and measurements | Source records, measurement procedures, and the external evidence needed to trust them |
| Causal and interpretive conclusions | Assumptions connecting the measurements and model to the scientific claim |

A checked calculation on a dataset establishes a property of the supplied data. Whether
those data accurately record the experiment remains an evidential question. Similarly,
a proof that an estimator is unbiased under a model does not establish that the model
describes the study, or that one realized estimate equals the true quantity.

## How the scope varies across fields

The relevant unit is the kind of claim, rather than the discipline's name. One paper
can contain several kinds of reasoning.

| Kind of paper | Likely focus of formalization |
|---|---|
| Mathematics, logic, or theoretical computer science | Definitions and deductive proofs; potentially much of the central argument, subject to precise statements and substantial formalization work |
| Physics or economics built around a formal model | The derivation from model to result, with assumptions about the model's applicability made explicit |
| Experimental or observational science | Data transformations, statistical reasoning, study-design assumptions, and the links from measured outcomes to broader claims |
| Qualitative or interpretive research | The structure of the argument, distinctions between concepts, and assumptions connecting sources to interpretations |

An interpretive paper may yield fewer formal theorems while still benefiting from a
precise account of its dependencies. Conversely, a highly mathematical paper can contain
a decisive empirical assumption that none of its proofs establishes.

## A worked illustration

Consider a paper concluding that a new teaching method improves learning. The companion
would separate at least five claims:

1. The supplied records show higher average test scores in the intervention group.
2. The statistical procedure has the stated properties under its assumed model.
3. The study design supports attributing the difference to the teaching method.
4. The test scores measure the intended concept of learning.
5. The finding applies to students or settings beyond those studied.

The first claim can be checked as a calculation. The second can be treated as a
mathematical statement about a statistical procedure. The third requires a causal model
and evidence that the design meets its conditions. The fourth requires measurement
validation. The fifth requires an argument for generalization.

This decomposition gives a reviewer specific questions to investigate. It also prevents
a successful calculation from silently becoming a guarantee about causation, measurement,
or applicability.

## Preserving meaning and exposing assumptions

Formalization makes choices. Giving a precise definition to “learning,” “intelligence,”
or “institutional quality” can alter the paper's claim. Using one symbol for two distinct
concepts can make an otherwise invalid argument appear valid.

The companion should therefore preserve the source passage, controlled-language
rendering, formal statement, and rationale for consequential modeling choices. Independent
back-translation and domain review can reveal discrepancies. Author approval would
strengthen evidence of fidelity; without it, the document should identify itself as a
reconstruction and record unresolved readings. Proof validity and correspondence with
the intended meaning remain distinct checks.
[Lean: validating proofs](https://lean-lang.org/doc/reference/latest/ValidatingProofs/)

Adding an assumption for every difficult step would make conversion easy and verification
uninformative. The report must show which substantive steps were proved and which were
assumed. A zero-axiom audit reports dependencies on declared axioms; it does not establish
the truth, neutrality, or adequacy of theorem hypotheses and model definitions.
[Lean: axioms](https://lean-lang.org/doc/reference/latest/Axioms/)

The project's current probability-coherence checks are an initial example of what can
be verified. They are not a ceiling: richer formalizations could check statistical
derivations, numerical error bounds, or joint constraints. None of those checks alone
establishes that the model fits the world or that the evidence search was adequate.

## What a reviewer would gain

A useful companion would provide:

- A dependency map from each conclusion to its evidence and assumptions.
- Missing premises needed to justify particular steps, with alternatives where relevant.
- Checked deductions and countermodels, each attached to the precise claim it addresses.
- Apparent contradictions that disappear when scope, definitions, or quantifiers are
  distinguished.
- A focused set of empirical and interpretive questions that determine whether the
  conclusion is warranted.

The value depends on whether this helps reviewers find consequential problems and
understand the remaining uncertainty. Counting compiled theorems is insufficient: many
easy lemmas can coexist with an unsupported central claim. The proposed workflow begins
with the paper's hypotheses and arguments; it makes no claim to automate the invention
of scientific explanations.

## Testing the proposal

A first evaluation could select papers before inspecting their conclusions, including
both known methodological problems and credible controls. For each paper, independent
domain reviewers would assess the fidelity of the formalization and the significance
of the issues it identifies.

Useful measurements include the proportion of central inferences actually checked,
important assumptions exposed, genuine problems detected, false alarms introduced by
the translation, reviewer time, and formalization cost. These would test the central
hypothesis: that making a paper's reasoning explicit and partly machine-checkable can
improve scientific review across fields.

This is a proposed extension of the project's [thesis](thesis.md),
[inference protocol](inference-protocol.md), and [evidence protocol](evidence-protocol.md).
It does not change the status of existing claims or report a completed scientific-paper
experiment.
