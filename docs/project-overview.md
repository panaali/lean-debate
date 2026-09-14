# Proof-carrying debate: project overview

Proof-carrying debate investigates whether AI can make complex arguments easier to judge
by exposing their assumptions and making their reasoning independently checkable.
This page explains the approach, implementation, and boundaries of the current system.

The [thesis](thesis.md) develops the research argument. [Results](results.md) records
what each experiment found. The [claims ledger](claims.md) and
[open questions](open-questions.md) track the evidence for the proposal itself.

## 1. What the project is

A judge may be unable to identify the flaw in a sophisticated argument, even with an
opponent trying to challenge it. The project asks whether a checkable account of each
inference can make that argument easier to evaluate.

Language models reconstruct the argument as explicit claims and logical steps.
Lean checks proofs and countermodels for the formal relationships. A complementary
evidence protocol investigates the factual premises. Questions of interpretation and
values remain visible and open to challenge.

The intended result is a record of what follows, what must be assumed, and what still
needs evidence or judgment. A reader might discover that two speakers mean different
things by the same term, that an analogy requires a disputed resemblance, or that a
recommendation needs a value premise the speaker never stated.

The project includes birthright-citizenship and death-penalty reconstructions, a two-AI
debate, an adversarial evidence investigation, and tests of the setup rules. Extending the approach to [scientific papers](scientific-papers.md)
is a further research direction.

Formal validity and faithful interpretation remain separate obligations. A checked proof
establishes a relationship under stated assumptions. It does not establish that the
assumptions are true or that the formal statement captures the speaker's meaning.

## 2. The protocol

The [inference protocol](inference-protocol.md) specifies the workflow. Its phases
separate decisions about meaning, logic, evidence, and values.

1. **Review the vocabulary and assumptions.** Both sides inspect the setup before
   arguing. The rules also require models witnessing each side's position and
   independent back-translation of the setup.
2. **Fix each assertion's meaning.** The formalizer presents the original utterance,
   controlled English, and a formal statement. An independent model back-translates the
   statement. The speaker approves, revises, or rejects the meaning before rebuttals.
3. **Check the inference.** A proof establishes a consequence; a countermodel establishes
   a gap or compatibility. A proposed repairing premise returns to its speaker, who can
   accept it, withdraw the inference, or narrow the conclusion.
4. **Investigate factual premises.** The [evidence protocol](evidence-protocol.md)
   records source provenance, competing explanations, uncertainty, and consequential
   revisions.
5. **Connect the argument to the motion.** Each side states the premises connecting its
   factual or interpretive arguments to its recommendation. These are requested before
   debate, even though the specification calls this Phase 4.

## 3. What is checked

Claims are labeled by the kind of support they need. The seven statuses distinguish
proof, evidence, interpretation, probability, values, definitions, and unstated
assumptions. Verdicts describe formal relationships: `CERTIFIED`, `REFUTED`,
`GAP`, or `COMPATIBLE`. The [thesis](thesis.md#3-the-method) defines them.

The protocol puts disputed claims first in the judge's report, followed by
unstated premises and then tallies. This reflects a central finding: a debater can defeat
an opponent's premise while leaving the opponent's conclusion possible. Counting
successful steps alone would conceal that distinction.

## 4. The Lean development

The main project uses Lean 4 v4.24.0 without Mathlib or external Lean packages.
The [README](../README.md#running-it) gives the build, report, and audit commands.

| Path | Role |
|---|---|
| [Debate.lean](../Debate.lean) | Library root and module imports |
| [Main.lean](../Main.lean) | Prints the birthright report, death-penalty report, or both |
| [Protocol.lean](../Debate/Protocol.lean) | Claims, edges, speakers, statuses, verdicts, and rendering |
| [Evidence.lean](../Debate/Evidence.lean) | Evidence records and arithmetic coherence constraints |
| [Evidence examples](../Debate/Evidence/Examples.lean) | Checks on the source tables and the evidence run |
| [Birthright](../Debate/Birthright/) | Six reconstruction branches, the two-AI module, ledger, and audit |
| [Death penalty](../Debate/DeathPenalty/) | Six reconstruction branches, ledger, and audit |

Separate experiments under `experiments/` have their own setup, status, and build scope.

Each branch defines a vocabulary, then a `Frame` containing the shared assumptions.
Claims are propositions over that vocabulary. Arguments are theorems with explicit
hypotheses. A countermodel constructs a frame satisfying the environment and asserted
premises while falsifying the conclusion; compatibility is an existence proof of a
frame satisfying the claims together.

Debate assumptions appear in structures and theorem signatures, making the proof's
dependencies inspectable. An inconsistent environment can still make a conditional
theorem vacuous without introducing a Lean axiom. The protocol therefore requires models
witnessing each side's position. Satisfiability and neutrality remain different questions.

The report records English descriptions, verdict labels, and theorem references as
metadata. Lean checks the theorem declarations; the record types do not enforce that
a displayed description or reference matches the theorem's type. That correspondence
requires review. The executable prints claims and edges before its summaries; aligning it with the
protocol's proposed judge-facing order remains implementation work.

## 5. Results

The main development audits 90 theorems: 36 birthright verdicts, 35 death-penalty
verdicts, 8 two-AI verdicts, and 11 evidence checks. All report no axioms.
[Results](results.md#results) distinguishes these counts and records the scope of each run.

Across the human-debate reconstructions, recurring findings include unstated premises,
analogies that depend on a disputed resemblance, and apparent rebuttals that concern
different scopes. Both debates contain a gap between factual claims and recommendations.
The two-AI run showed how the initial vocabulary can create the ambiguity a debate
then has to resolve.

The first evidence run supplied a researched basis for K1 in the birthright ledger.
The setup tests show why a participant's substantive premise must remain an explicit
claim: placing it in the environment can make a disputed argument appear settled.

## 6. Learnings and limits

The strongest demonstrated benefit is an explicit account of an argument's dependencies.
Formalization requires the reconstruction to supply each step. Another reader can then
check the formal artifact without repeating the proof search.

Several judgments remain outside that check. A precise model can misrepresent an
utterance. A satisfiable environment can favor one side. An evidence search can find real
support while missing decisive counterevidence. A judge may still struggle to use the
resulting report. [Learnings](learnings.md) develops these limits and the possible role
of training on checkable outcomes.

## 7. Research scope

The evidence representation checks selected interval orderings, partition sums, and
overlaps. It does not establish that the propositions have the assumed relationships or
that an investigation found the relevant counterevidence. Opposing assignments make
disagreement visible; convergence on one claim does not guarantee a reliable search.

The [roadmap](thesis.md#6-next-steps) prioritizes independent fidelity review, deliberate
deception, harder evidence searches, and measurements of cost and usefulness.
Reusable argument schemas and [scientific-paper conversion](scientific-papers.md)
extend the work. Training on checkable outcomes remains an untested possibility.

Run evidence remains in [docs/runs](runs/), source conversations in [docs/sources](sources/),
and historical descriptions and measurements in the [archive](archive/README.md).
