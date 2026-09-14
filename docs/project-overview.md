# Proof-carrying debate: project overview

Proof-carrying debate investigates whether AI can make complex arguments easier to judge
by exposing their assumptions and making their reasoning independently checkable.
This page explains the approach, the implementation, and the project's development.

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

The work began with a birthright-citizenship debate and now includes a death-penalty
reconstruction, a two-AI debate, an adversarial evidence investigation, and a red team
of the setup rules. Extending the approach to [scientific papers](scientific-papers.md)
is a further research direction.

Formal validity and faithful interpretation remain separate obligations. A checked proof
establishes a relationship under stated assumptions. It does not establish that the
assumptions are true or that the formal statement captures the speaker's meaning.

## 2. How it came about

The [source conversation](sources/lean-in-social-science.md), originally titled
“Lean in Social Science”, developed the distinction between formal validity and empirical
justification. It connected this distinction to Geoffrey Irving's oversight problem,
proposed a translation-and-approval protocol, and tried the approach on roughly six
minutes of a birthright-citizenship transcript.

A Claude Code session then built the first reconstruction. The recorded chronology is:

| Date | Work recorded |
|---|---|
| 17 August 2026 | Lean 4 v4.24.0 installed through elan; the method checked against the official manual |
| 17 August 2026 | Protocol types, six branches, audit, ledger, and report implemented; a countermodel type error repaired |
| 17 August 2026 | Results written; design notes folded into the inference protocol; a private findings artifact published |
| 17–18 August 2026 | Follow-up analysis of scoring, surviving conclusions, stronger arguments, Lean's value, oversight failures, and reinforcement learning |
| 18 August 2026 | An unrelated document checked, outside this project's scope |
| 26 August 2026 | Learnings written and linked from the then-README |
| September 2026 | Evidence protocol and thesis developed; claim and question registers added; further runs and red-team repairs completed |

The initial development contained 30 verdicts, 16 model definitions, and about 1,315 lines
of Lean. Those are historical measurements, preserved at `run-birthright-1`.

The [September discussion record](sources/discussion-2026-09-13.md) explains how the
“logician for English” framing emerged. The
[archived overview](archive/2026-09-14-before-description-edit/docs/project-overview.md)
preserves the full original chronology, source inventory, branch descriptions, scores,
and substantive debate commentary.

## 3. The protocol

The [inference protocol](inference-protocol.md) specifies the workflow. Its phases
separate decisions about meaning, logic, evidence, and values.

1. **Review the vocabulary and assumptions.** Both sides inspect the setup before
   arguing. The revised rules also require models witnessing each side's position and
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

Claims are labeled by the kind of support they need. The seven statuses distinguish
proof, evidence, interpretation, probability, values, definitions, and unstated
assumptions. Verdicts describe formal relationships: `CERTIFIED`, `REFUTED`,
`GAP`, or `COMPATIBLE`. The [thesis](thesis.md#3-the-method) defines them.

The revised protocol puts disputed claims first in the judge's report, followed by
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

The source sketch used axioms for debate content. The implementation instead exposes
assumptions in structures and theorem signatures. This makes proof dependencies
inspectable, but an inconsistent environment can still make a conditional theorem
vacuous without introducing a Lean axiom. The red-team repairs therefore added models
witnessing each side's position. Satisfiability and neutrality remain different questions.

The report records English descriptions, verdict labels, and theorem references as
metadata. Lean checks the theorem declarations; the record types do not enforce that
a displayed description or reference matches the theorem's type. That correspondence
requires review. The executable also retains the original report order; changing it to
the revised protocol's judge-facing order remains implementation work.

## 5. Results

The main development audits 90 theorems: 36 birthright verdicts, 35 death-penalty
verdicts, 8 two-AI verdicts, and 11 evidence checks. All report no axioms.
[Results](results.md#results) distinguishes these counts and preserves their run history.

Across the human-debate reconstructions, recurring findings include unstated premises,
analogies that depend on a disputed resemblance, and apparent rebuttals that concern
different scopes. Both debates contain a gap between factual claims and recommendations.
The two-AI run showed how the initial vocabulary can create the ambiguity a debate
then has to resolve.

The first evidence run supplied a researched basis for K1 in the birthright ledger.
The red team found that one of the project's own environment fields encoded a
participant's substantive premise. The repair made that assumption an explicit,
contestable claim.

The original session's conduct scores remain in
[Learnings §3](learnings.md#3-scoring-debaters) and the archived overview.
They are the author's assessments, not kernel verdicts. The original exploration of a
stronger pro-motion argument remains in
[Learnings §4](learnings.md#4-the-substantive-finding-about-the-debate-itself);
its unverified legal and historical specifics are tracked under Q17.

## 6. Learnings and limits

The strongest demonstrated benefit is an explicit account of an argument's dependencies.
Formalization requires the reconstruction to supply each step. Another reader can then
check the formal artifact without repeating the proof search.

Several judgments remain outside that check. A precise model can misrepresent an
utterance. A satisfiable environment can favor one side. An evidence search can find real
support while missing decisive counterevidence. A judge may still struggle to use the
resulting report. [Learnings](learnings.md) develops these limits and the possible role
of training on checkable outcomes.

## 6a. Changes in run-birthright-2 (14 September 2026)

This tag records four additions to the original development:

- Evidence grades, provenance records, probability intervals, arithmetic coherence
  checks, and the proposed `preservesBoard` obligation in `Evidence.lean`.
- Four checked examples using the Amini and credit-dispute tables, including rejection
  of an incompatible interval ordering.
- Four Article V verdicts (E31–E34) and four claims (G-S, G-E, G-A, G-C).
- A ledger section displaying evidence grades and their unverified basis.

The verdict counts changed from 14/3/11/2 to 16/3/13/2
(certified/refuted/gap/compatible); contested meanings changed from 7 to 8, and the audit
grew from 30 to 38 theorems. [Results](results.md) records later additions and repairs.

## 7. The evidence layer

The evidence protocol developed in separate conversations about the
[Amini case](sources/case-amini-un-fact-finding.md) and
[research-credit dispute](sources/case-credit-dispute.md), including
[a run that exposed the analyst's own errors](sources/case-credit-dispute-agent-run.md).
It supplied the investigation process the inference protocol had left unspecified.

The Lean representation checks selected interval orderings, partition sums, and overlaps.
The relationships between the propositions and the quality of the evidence remain
external judgments. The [first adversarial evidence run](runs/evidence-1/RESULTS.md)
used opposing assignments on K1 and entered its findings in the birthright ledger.
Convergence on one claim does not establish a general guarantee against biased search.

## 8. What would come next

The [roadmap](thesis.md#6-next-steps) prioritizes independent fidelity review, deliberate
deception, harder evidence searches, and measurements of cost and usefulness.
Reusable argument schemas and scientific-paper conversion extend the work. Training
on checkable outcomes remains an untested possibility.

The original priorities—counterevidence agents, training, live operation, and adversarial
signature review—are preserved in [Learnings §9](learnings.md#9-what-i-would-build-next).

## 9. Artifacts and references

The [original reference list](archive/2026-09-14-before-description-edit/docs/project-overview.md#8-artifacts-and-references)
preserves the transcript reference, Irving interview, installation record, Gödel
discussion, Einstein–Infeld citation, and private artifact URL. The
[September discussion](sources/discussion-2026-09-13.md) supplies the session's fuller
reference list.

The private artifact is superseded: it shows the first run's 30-verdict tallies and none
of the later runs. Use [results](results.md) for current findings. Speaker paraphrases
and external factual claims remain distinct from the formal relationships checked by Lean.
