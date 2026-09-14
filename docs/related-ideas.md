# Rationality, cognitive biases, and proof-carrying debate

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
