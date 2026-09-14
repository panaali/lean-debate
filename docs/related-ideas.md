# Related ideas: reasoning, evidence, and judgment

Proof-carrying debate connects several practices: clarifying concepts, testing
inferences, investigating evidence, challenging a position, and deciding what the
result justifies. This page explains those connections and maps them to the project's
protocols, code, and open questions.

For an overview, start with the [seven roles](#seven-roles-different-responsibilities)
and [concept map](#a-concept-map-across-domains). The
[implementation map](#where-these-ideas-enter-the-project) locates the corresponding
claims, questions, and checks. The [Sequences](#connections-to-the-sequences) and
[cognitive biases](#cognitive-biases-as-test-targets) sections connect the design to
practices of belief revision and possible evaluation tasks.

## Seven roles, different responsibilities

The detective, investigative journalist, logician, debater, lawyer, judge, and scientist
offer useful perspectives on an argument. The following is a division of tasks for
this project, rather than a complete account of these professions.

| Role | Task it helps distinguish | What others should be able to inspect |
|---|---|---|
| Detective | Reconstruct events from incomplete traces and test rival explanations | The evidence connecting each step of the reconstruction |
| Investigative journalist | Establish what sources support and communicate the findings | Source provenance, corroboration, missing context, and uncertainty |
| Logician | Determine whether a conclusion follows from stated premises | A derivation or a countermodel |
| Debater | Present and challenge arguments for a position | The exact claim, its support, and the target of each rebuttal |
| Lawyer | Develop a party's case under specified rules and burdens | The premises and evidence needed to satisfy the relevant standard |
| Judge | Assess the record against a stated standard | Reasons for the decision and the questions it leaves unresolved |
| Scientist | Develop explanations, derive predictions, and test them | Assumptions, methods, observations, and reproducible analysis |

These tasks overlap, but success at one does not establish success at another. A strong
advocate can expose a defect without establishing their own position. A valid deduction
can rest on weak evidence. A carefully sourced account can still omit an alternative.

The [inference protocol](inference-protocol.md) assigns formal checking to Lean and
makes advocacy and interpretation explicit. The [evidence protocol](evidence-protocol.md)
asks investigators to build rival explanations and revise their assessment under
challenge. Assigning different agents to these tasks creates opportunities for review;
it does not guarantee independence or accuracy.

## Conceptual analysis and uncertain evidence

The connection to analytic philosophy begins with questions the project repeatedly
asks: what exactly does a claim mean, what reasons support it, and what follows from
those reasons? Splitting an ambiguous term, exposing a hidden premise, and distinguishing
a factual assertion from a value judgment make an argument easier to examine.

Conceptual clarity must preserve the question that mattered to the speaker. A precise
reconstruction can still lose context, formalize an irrelevant detail, or turn the
formalizer's intuitions into assumptions. Independent interpretation review and tests
of judge usefulness address these risks ([Q6](open-questions.md#q6-are-the-extracted-premises-real-or-artefacts-of-the-formalization),
[Q16](open-questions.md#q16-what-should-the-judge-actually-see-and-how-much-is-too-much)).

**Logical possibility, evidential support, and a decision standard answer different
questions.** A possible alternative defeats an asserted entailment if it satisfies the
premises and falsifies the conclusion. That does not make it a probable explanation of
an event. An empirical alternative needs support, relevant prior plausibility, and an
account of why the observations fit it. A decision additionally needs a stated standard
and, where relevant, values and consequences.

This is why the evidence layer includes competing explanations, subjective probability
ranges, and revision. Confidence can change as evidence changes even when the logical
relationship between the propositions stays fixed. Missing evidence matters when a
hypothesis predicts that the evidence should exist and the search was likely to find
it. Neither a remote possibility nor a demand for certainty should automatically
prevent an evidence-based assessment.

**Provenance is a separate question from correctness.** A checked proof establishes
neither who originated an idea nor whether it was credited appropriately. Similarly,
evidence that contact occurred does not establish what was communicated, and a source's
words do not by themselves establish the speaker's intent. These distinctions connect
the investigation tasks to the protocol's separate claims and dependency records.

## A concept map across domains

The useful connection is a shared discipline of making support and uncertainty explicit.
The terms below retain their meanings within their own domains.

| Project mechanism | Related practice | Boundary to preserve |
|---|---|---|
| An `UNSUPPORTED` claim must earn support | Burdens of proof; an investigation marking a claim unestablished | This is a claim status, not a statistical null hypothesis or an assumption that the claim is false. |
| `CERTIFIED` inference | A scientific derivation; reasoning from accepted evidence | The certificate checks the stated implication, not the empirical premises or a decision standard. |
| `GAP` with a countermodel | Testing an explanation against alternatives; attempted falsification | A logical construction refutes an entailment. An empirical test needs observations and justified measurement assumptions. |
| A counterexample to a universal claim | Testing assertions such as “every” or “never” | An observed instance must itself be established and belong to the stated scope. It need not refute a weaker frequency claim. |
| `COMPATIBLE` claims | Reconciling testimony or scientific results with different scopes | Joint satisfiability shows that the formal claims need not conflict; it does not establish that either is true. |
| Refuting a premise does not refute its conclusion | Distinguishing failed support from evidence against a claim | Likewise, failing to reject a statistical hypothesis does not establish it. The statistical and logical procedures remain different. |
| Fixing meanings and quantifiers before rebuttal | Preregistration; specifying the claim to be answered | These practices constrain changes to the question. They do not guarantee that the initial question or model is appropriate. |
| Extracting a missing premise | Finding an auxiliary assumption or an unproved element of a case | A premise that repairs an inference still needs justification. A sufficient repair need not be the weakest one. |
| Probability ranges and evidence grades | Statistical assessment; decisions under uncertainty | A subjective credence, a p-value, and a decision threshold are not interchangeable. |
| Reviewing the environment and source cutoff | Making a model, measurement procedure, or evidentiary record explicit | A fixed setup improves inspectability; it can still be incomplete or favor one side. |

Null-hypothesis testing belongs to the evidence side of this comparison. It evaluates
data under a specified statistical model. A p-value does not assign a probability to
the hypothesis, and crossing a significance threshold cannot by itself settle a
scientific or policy conclusion. The
[American Statistical Association's statement](https://www.amstat.org/asa/files/pdfs/p-valuestatement.pdf)
sets out these distinctions. The project does not currently implement such a test.

The broader concern about errors transfers more readily than the statistical labels:
an evaluator can accept a bad argument or fail to recognize a good one. In this project,
evaluation must specify what counts as an error and measure missed defects and false
alarms separately. An unsuccessful proof search is a search outcome, not evidence that
the inference is invalid.

## Scientific arguments: EPR, Bohr, and Bell

Scientific disagreements make the separation between premises, inference, interpretation,
and observation especially useful. The
[EPR and Bohr experiment](../experiments/epr-bohr-1935/README.md) gives a concrete example.
Its [comparison](../experiments/epr-bohr-1935/COMPARISON.md) keeps three claims apart:
either quantity can be predicted using the appropriate procedure; both have definite
physical values; and both predictions are warranted in one arrangement. Moving between
these claims requires additional premises. The checked comparison exposes those
dependencies without deciding which account of physical reality is correct.

[Bell's 1964 paper](https://csiflabs.cs.ucdavis.edu/~gusfield/Bell-paper.pdf) supplies a
related example of why a theorem's assumptions matter. It shows an incompatibility
between a specified local hidden-variable description and quantum predictions, while
explicitly distinguishing that result from a rejection of all hidden-variable accounts.
Its relevance here is the pattern of a conditional result: state the assumptions,
derive the constraint, and identify exactly what a conflicting result would challenge.

For a Bell-test reconstruction, the mathematical inequality and the empirical assessment
of measured correlations would be separate parts of the record. Rejecting their joint
assumptions would not, by logic alone, identify a unique replacement theory. The current
paper experiment reconstructs the two 1935 arguments; it does not formalize Bell's
theorem or audit Bell-test data.

## Rules, values, and institutional safeguards

Advocacy needs procedures that keep a position answerable to criticism. Cross-examination,
source scrutiny, independent review, and explicit burdens suggest different ways of
doing that. In this project, the corresponding design questions concern who may choose
the vocabulary, introduce an assumption, challenge a reading, or change the rules.

**Rules governing a debate are distinct from premises argued within it.**
[Phase 0](inference-protocol.md#2-phase-0--signature-review) fixes the procedural rules
during a run and requires review of the vocabulary, witnesses for each side's position,
back-translation, and nonempty countermodels. The self-amendment problem is concrete:
a participant must not remove a checking obligation by changing the rule that imposes
it. Some safeguards are specified in prose and others have formal witnesses; complete
structural enforcement remains an open problem.

**Permission, requirement, and recommendation must remain separate.**
[Motion.lean](../Debate/Birthright/Motion.lean) distinguishes what the Constitution
requires, what is lawfully changeable, and what should be done. Suber's reading of
Article V is represented as an explicit, contestable premise. Lean checks consequences
conditional on it, rather than settling that legal interpretation. Reaching a policy
recommendation still requires the relevant value premises.

## Rationality and belief revision

Proof-carrying debate shares a practical aim with the rationality writing collected in
LessWrong's [Original Sequences](https://www.lesswrong.com/w/original-sequences): make
beliefs answerable to evidence and make the reasoning behind them open to correction.
The project gives some of these practices a concrete form: explicit claims, visible
assumptions, checked inferences, source records, and unresolved questions.

In [What Do We Mean By “Rationality”?](https://www.lesswrong.com/posts/RcZCwxFiZzE6X7nsv/what-do-we-mean-by-rationality-1),
Eliezer Yudkowsky distinguishes improving the accuracy of beliefs from choosing actions
that achieve one's values. The project mainly addresses the first task. It also makes
the value premises behind recommendations explicit, so agreement about facts is not
mistaken for agreement about what to do.

The connections below are comparisons between ideas and protocol mechanisms. Whether
those mechanisms improve human or AI judgment is an empirical question, tracked in
[Q26](open-questions.md#q26-does-the-protocol-reduce-susceptibility-to-biased-presentation).

## Connections to the Sequences

**A model must remain answerable to what it represents.** The distinction between a
mental map and the world in
[What Do We Mean By “Rationality”?](https://www.lesswrong.com/posts/RcZCwxFiZzE6X7nsv/what-do-we-mean-by-rationality-1)
has a direct counterpart here: a formalization is a representation of an argument.
Lean checks relationships within that representation. Speaker review, independent
back-translation, and source investigation address whether it captures the intended
claim and rests on justified premises. These obligations remain separate in the
[inference protocol](inference-protocol.md#2-phase-0--signature-review).

**Words can conceal the steps an argument needs.**
[Words as Hidden Inferences](https://www.lesswrong.com/posts/3nxs2WYDGzJbzcLMp/words-as-hidden-inferences)
examines the assumptions carried by categories;
[Taboo Your Words](https://www.lesswrong.com/lw/nu/taboo_your_words)
asks people to describe what they mean without relying on the disputed label. The
project's explicit vocabulary, separate readings, and requests for missing premises
serve related purposes. The [two-AI run](runs/two-ai-1/RESULTS.md) provides an example:
the participants accepted each other's conclusions under different readings of the
question. Precise language exposed the disagreement's location.

**True statements can form a misleading selection.**
[What Evidence Filtered Evidence?](https://www.lesswrong.com/posts/kJiPnaQPiy4p9Eqki/what-evidence-filtered-evidence)
explains why the process selecting reported evidence matters to its interpretation.
This closely matches the project's central
[evidence-search problem](learnings.md#6-the-hole-worked-through): every cited fact and
formal inference may check while decisive counterevidence is missing. Opposing
investigators, source provenance, and competing explanations address parts of that
problem. Agreement between investigators does not establish that their search was
complete or independent.

**The decision to stop searching needs scrutiny.**
[Motivated Stopping and Motivated Continuation](https://www.lesswrong.com/posts/L32LHWzy9FzSDazEg/motivated-stopping-and-motivated-continuation)
describes how a preferred conclusion can influence whether someone seeks more evidence.
The [evidence protocol's revision loop](evidence-protocol.md#10-iterate-through-challenge-evidence-and-revision)
requires consequential challenges, reasons for revisions, and an explicit stopping
condition. Its stopping rule still relies on the investigator's judgment; a research
extension would make search budgets and stopping decisions independently reviewable.

**Confidence should respond to new evidence without recounting old support.**
[One Argument Against An Army](https://www.lesswrong.com/posts/WN73eiLQkuDtSC8Ag/one-argument-against-an-army)
warns against repeatedly using familiar supporting arguments to dismiss each new
objection. The [evidence protocol](evidence-protocol.md#9-calibrate-probabilities-without-manufacturing-certainty)
asks what changed an assessment, while its source rules distinguish independent
corroboration from repeated coverage. The Lean evidence checks establish selected
arithmetic constraints. They do not implement a complete Bayesian update or establish
that the probabilities are empirically calibrated.

**Factual claims should imply something that evidence could distinguish.**
[Making Beliefs Pay Rent](https://www.lesswrong.com/posts/a7n8GdKiAZRX86T5A/making-beliefs-pay-rent-in-anticipated-experiences)
connects beliefs to anticipated observations. The
[evidence protocol](evidence-protocol.md#8-construct-and-challenge-competing-explanations)
asks which observations support one explanation over another and which could falsify
it. This also informs the proposed extension to [scientific papers](scientific-papers.md).
A logical countermodel has a different role: it establishes that an inference fails
under the stated assumptions, without establishing that the countermodel occurs in
the world.

**An inspectable argument can reduce dependence on its author's authority.**
[Argument Screens Off Authority](https://www.lesswrong.com/posts/5yFRd3cjLpm3Nd6Di/argument-screens-off-authority)
connects the ability to evaluate an argument with reduced reliance on credentials.
The project's certificates pursue a narrow version of this aim: checking a supplied
proof need not depend on trusting the model that produced it. Expertise and source
credibility still matter when evaluating the premises and the translation.

## Cognitive biases as test targets

Wikipedia's [List of cognitive biases](https://en.wikipedia.org/wiki/List_of_cognitive_biases)
provides useful names for patterns that the project could test. The table maps selected
patterns to possible uses of the protocol. It does not diagnose any debate participant
or show that the protocol has reduced these effects.

| Pattern | Relevance to the project |
|---|---|
| **Belief bias:** judging an inference through the believability of its conclusion | Separate acceptance of premises from validity of the inference. Test whether readers correctly evaluate both believable and unbelievable conclusions. [Research reference](https://pubmed.ncbi.nlm.nih.gov/11089409/). |
| **Confirmation bias:** favoring evidence that supports an existing view | Test whether competing explanations and opposing evidence searches recover consequential counterevidence, including evidence against the investigator's assigned position. |
| **Anchoring and framing effects:** judgments influenced by an initial cue or presentation | Compare verdicts under changes in wording, ordering, and party labels while preserving the substantive claims. Reviewers must check that the variants retain the same meaning. |
| **Availability:** judging likelihood through readily recalled examples | Use source records to ask whether memorable examples represent the relevant population. A possible extension would require reference classes and denominators for frequency claims. |
| **Overconfidence:** confidence exceeding accuracy | Compare stated probabilities with outcomes across many resolved cases. Coherent probability intervals alone cannot establish calibration. |
| **Automation and authority bias:** excessive reliance on a system or an authoritative source | Test whether a checked report makes readers accept unsupported premises. Display the scope of each certificate alongside the assumptions and unresolved claims. |

An invalid inference, an incomplete evidence search, and a cognitive bias are different
findings. A countermodel can establish the first; identifying the psychological cause
of a judgment requires other evidence. The same standard applies to language models:
similar outputs do not by themselves establish a shared human mechanism.

[Knowing About Biases Can Hurt People](https://www.lesswrong.com/posts/AdYdLP2sRqPMoe8fb/knowing-about-biases-can-hurt-people)
warns that bias vocabulary can become a way to dismiss opponents. The appropriate
output here is a specific defect or uncertainty that someone can inspect: a missing
premise, a changed meaning, an omitted source, or a probability that conflicts with
another commitment.

## Where these ideas enter the project

The [claims ledger](claims.md) records the proposal's commitments and objections; the
[open questions](open-questions.md) distinguishes what is implemented from what remains
to be tested. These are the main connections to the current work:

| Idea | Where to inspect it | Current boundary |
|---|---|---|
| Precise meanings and procedures that constrain advocacy | C4, C20; [inference protocol §2](inference-protocol.md#2-phase-0--signature-review) | C4 remains contested. Permission to challenge a vocabulary needs effective review that actually finds defects. |
| Protection against changing the rules during a run | C5; [Q10](open-questions.md#q10-can-the-meta-rule-26-be-enforced-structurally-rather-than-by-prose); §2.6; `preservesBoard` in [Evidence.lean](../Debate/Evidence.lean) | C5 and Q10 remain contested. `preservesBoard` preserves truth values of listed claims; it is vacuous on an empty board and does not enforce the full rule. |
| Satisfiable positions, faithful readings, and nonempty models | C19; Q19–Q21; §§2.7–2.9; position witnesses in [Constitutional.lean](../Debate/Birthright/Constitutional.lean) | Witnesses establish particular satisfiability claims, not neutrality. Back-translation remains a separate review obligation. |
| The gap between legal facts and recommendations | C11; [Q12](open-questions.md#q12-formalize-article-v-as-load-bearing); [Motion.lean](../Debate/Birthright/Motion.lean) | Q12 is answered within the conditional model. The normative bridges and the Article V interpretation remain explicit premises. |
| Graded evidence with limited mechanical checks | C15; [Q8](open-questions.md#q8-which-parts-of-the-evidence-layer-can-be-made-kernel-checkable); [Evidence.lean](../Debate/Evidence.lean) | `entailsCoherent`, `overlaps`, and `partitionCoherent` check selected interval relationships. They do not perform null-hypothesis testing, validate source records, or establish empirical calibration. |
| Similar practices across inference and evidence | C12; [Q13](open-questions.md#q13-is-the-two-layer-convergence-real-or-a-shared-prior) | Similarity suggests a design connection; shared origins limit its value as independent evidence. |
| Generating explanations as well as checking them | [Q18](open-questions.md#q18-what-generates-the-hypotheses) | The protocols begin with proposed claims. Premise extraction may suggest new arguments, but general hypothesis generation is unresolved. |
| Whether these procedures improve judgment | [Q26](open-questions.md#q26-does-the-protocol-reduce-susceptibility-to-biased-presentation), Q2, Q16 | Comparative tests of evidence search, bias sensitivity, and judge usefulness remain open. |

## What would establish a benefit?

A useful evaluation would compare ordinary debate, a structured claim-and-evidence
report, and the same report with formal certificates. Matched tasks would vary a
conclusion's believability, the presentation of the argument, or the accessibility of
counterevidence. This would help separate the benefit of organizing information from
the additional benefit of formal checking.

Measure errors found, false alarms, unjustified acceptance of premises, probability
calibration, and time required. Evaluate people and models separately. The existing
runs demonstrate inspectable reconstructions; these comparative measurements remain
open in [Q26](open-questions.md#q26-does-the-protocol-reduce-susceptibility-to-biased-presentation),
alongside the evidence-search and judge-interface questions, Q2 and Q16.

Further reference material: the [source discussions](sources/discussion-2026-09-13.md),
the [analytic-philosophy and physics discussion](sources/analytic-philosophy-and-bell.md),
and the [archived background notes](archive/thesis-background.md). The discussions
preserve the full questions and examples; the archive retains the original formulations.
