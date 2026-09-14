# A logician for English

This project investigates whether language models and formal proof can make complex
arguments easier to judge. Its central proposal is to expose an argument's assumptions,
check the reasoning that connects them, and leave a precise record of what still needs
to be settled.

The [claims ledger](claims.md) records the evidence and strongest objection for each
part of the proposal. [Open questions](open-questions.md) identifies what would resolve
the remaining uncertainties. This document develops the argument connecting them.

## 1. The problem

A persuasive argument can be wrong in ways that neither an opponent nor a judge can
identify. For AI oversight, this raises a difficult question: how can people evaluate
reasoning from systems more capable than themselves?

Debate offers one possible answer. Two systems argue opposing positions, and a judge
uses their exchange to decide what to believe. But disagreement alone does not ensure
that a flaw will be found. A complicated false argument may survive because the opponent
cannot explain where it fails. The absence of a successful rebuttal can then be mistaken
for evidence that the argument is sound. This is the failure discussed in the project's
[source conversation on Geoffrey Irving's work](sources/lean-in-social-science.md).

## 2. The claim

**AI may be able to act as a logician for ordinary language: exposing hidden
assumptions, making disagreements precise, and producing reasoning that can be checked
independently.**

Legal and political arguments contain structure that can be made explicit: a condition
that has been dropped, a generalization drawn from one example, an analogy that depends
on an unstated resemblance, or a recommendation that needs a value premise. Language
models can propose these reconstructions. A proof assistant can check the formal
relationships they identify.

The intended result is a record of what an argument establishes, which assumptions it
requires, and where disagreement remains. A reader can inspect a particular missing
premise or counterexample without reconstructing the whole exchange.

The experiments so far show instances of this process. They do not yet establish how
reliably it finds important problems, how often it introduces problems through its own
translation, or whether it works at scale. Those are the central tests of
[proposal C13 and Q3](open-questions.md#q3-can-a-language-model-find-gödel-style-holes-in-real-english-at-scale-what-are-its-recall-and-precision).

## 3. The method

The approach separates two questions: **does a conclusion follow from its premises,
and what justifies accepting those premises?** The inference and evidence protocols
address these questions through linked records of claims and their dependencies.

In the [inference layer](inference-protocol.md), the formalizer gives each claim a
precise reading and labels the kind of support it needs: proof, evidence,
interpretation, probabilistic assessment, a value judgment, or agreement on a definition.
An assumption needed by the argument but never asserted is marked `UNSUPPORTED` and
returned to its speaker.

Each proposed inference must then carry a proof or countermodel that Lean can check:

| Verdict | What the certificate establishes |
|---|---|
| CERTIFIED | The conclusion follows from the stated premises |
| REFUTED | The negation of the target follows from the stated premises |
| GAP | A model satisfies the environment and premises while falsifying the conclusion |
| COMPATIBLE | A model satisfies both claims, so their apparent conflict is not a logical contradiction |

A GAP is a demonstrated failure of entailment. Failure to find a proof is a separate
outcome and cannot by itself justify that verdict. The shared vocabulary and environment
are explicit; arguments are conditional theorems, and countermodels must respect the
same environment.

The [evidence layer](evidence-protocol.md) investigates factual and probabilistic claims.
It records the exact proposition, source provenance, supporting and challenging evidence,
a graded assessment, subjective probability ranges where justified, and consequential
revisions. Observation is kept separate from interpretation: a document containing a
sentence and that sentence establishing someone's intent are different claims.

Both protocols emphasize six habits: distinguish concepts before evaluating them;
match scope and time before declaring a contradiction; keep refutation of a premise
separate from refutation of a conclusion; fix readings before rebuttals; expose the
assumptions inside loaded language; and preserve source provenance. Their convergence
suggests a useful common structure, though their shared origins limit its evidential
weight ([C12 and Q13](open-questions.md#q13-is-the-two-layer-convergence-real-or-a-shared-prior)).

These requirements connect to practical ideas about rationality: unpack the assumptions
inside words, investigate how evidence was selected, and revise confidence when new
evidence arrives. [Related ideas](related-ideas.md#rationality-and-belief-revision) develops the
connections to the Sequences and identifies tests of whether the protocol makes
judgments less sensitive to biased presentation.

The repository currently contains formal reconstructions, evidence investigations, and
reports from specific runs. It does not implement a general service that automatically
translates any debate, finds the weakest missing premise, or searches every rebuttal for
a countermodel. Lean checks the supplied formal objects; the report's English descriptions
and theorem references require a separate correspondence review.

## 4. What the experiments show

The birthright case reconstructs *Should America End Birthright Citizenship?*
(Open to Debate, June 2026), with two speakers on each side. The
[results page](results.md) records its findings. Three findings illustrate what
the method contributes.

**Failing one condition does not rule out every route to a conclusion.** In the model,
the Citizenship Clause supplies a sufficient condition for citizenship. Showing that
someone fails that condition does not establish non-citizenship unless other routes
are excluded. The reconstruction exposes that additional premise as `K-EX`. It emerged
when the attempted proof needed an assumption the speaker had not stated.

**A rebuttal can defeat an argument while leaving its conclusion untouched.** The
historical-counterexample exchange has a model in which Krikorian's counterexample and
Mayes's conclusion both hold. The statelessness exchange has the same pattern under
the narrower reading of Mayes's claim. Making the claims precise reveals which
proposition the rebuttal actually reaches.

**A conclusion about the law needs a further premise to become a recommendation.**
The debate's constitutional arguments concern what the law requires; its motion asks
what the country should do. The Motion branch makes the missing value premises explicit.
The Article V extension adds conditional results about what can lawfully be changed,
using Suber's reading as a contestable premise. Those results still do not supply a
recommendation by themselves.

At `run-birthright-3`, the ledger contains 16 certified edges, 3 refutations, 13 gaps,
and 4 compatibility results, with 4 unstated premises. Two compatibility results concern
the exchanges above; the other two show that each side's stated position is consistent
with the environment. The current main audit also includes the two-AI and evidence work
described below.

Other completed experiments examine different parts of the method:

- **[Death penalty](runs/death-penalty/RESULTS.md):** a second debate, selected from titles
  only and extracted by a separate agent, yielded 35 verdicts and 9 unstated premises.
  The gap between factual claims and policy recommendations recurred. The moderator
  asked for the missing value premise during the debate.
- **[Two-AI debate](runs/two-ai-1/RESULTS.md):** both sides accepted the premises supporting
  the other's conclusion under a different reading of the question. Eight verdicts and
  a matching back-translation exposed the ambiguity introduced by the initial signature.
  Both participants were cooperative; deliberate deception remains untested.
- **[Adversarial evidence review](runs/evidence-1/RESULTS.md):** two agents with opposing
  assignments converged on a narrower reading of the pivotal historical claim K1.
  Their findings entered the ledger. Checks of their probability intervals establish
  arithmetic constraints, not the adequacy of their evidence search.
- **[Phase 0 red team](redteam-phase0.md):** ten attacks targeted the setup rather than
  the proofs. One exposed a substantive premise hidden in the project's own environment.
  The current requirements make substantive assumptions explicit and require nonempty
  domains and models witnessing each side's position.

Together the main development audits 90 theorems, all reporting no axioms. The
[results register](results.md) gives the breakdown and the limits of each run.

## 5. Limits

**Translation remains a judgment.** A valid proof may formalize the wrong claim.
Speaker approval, independent back-translation, and domain review can expose discrepancies.
The human-debate reconstructions did not have the speakers' approval.

**The evidence search can remain biased.** An analyst may find several real supporting
sources and miss decisive counterevidence. Every formal inference could then check while
the resulting assessment remains wrong. The evidence protocol requires opposing advocacy
and explicit challenges, but the evidence run used a case whose counterevidence was readily
available. It does not establish resistance to harder cases
([Learnings §6](learnings.md#6-the-hole-worked-through)).

**A clean audit does not establish a neutral model.** The zero-axiom audit reports proof
dependencies. It cannot tell whether an environment field gives one side an unjustified
advantage. The red team demonstrated this in its tests of the Normative branch. Position
witnesses establish satisfiability; neutrality still needs scrutiny.

**Finding a certificate can be difficult even when checking it is straightforward.**
The runs use small models. Larger arguments may exceed the available search budget.
A protocol must preserve that uncertainty rather than label unsuccessful search a
refutation.

**The benefit to judges remains unmeasured.** A careful reader can find many of these
logical gaps without Lean. Formalization forces the reconstruction to supply each step
and lets others check the resulting proofs. Whether that benefit justifies the cost,
especially when evaluating stronger AI systems, needs comparative tests.

**The method starts with proposed arguments.** It checks hypotheses and can suggest
missing premises; it does not explain how to generate good scientific or political
hypotheses in the first place. Reconstruction from a complete transcript is also easier
than handling claims as they arrive.

## 6. Next steps

The next experiments should test reliability, usefulness, and cost. The completed runs
supply examples; they do not yet provide comparative measurements.

1. **Measure the quality of the reconstruction.** Use independent extractions and domain
   review to count important problems found, problems missed, and false alarms introduced
   by formalization. Compare the disputed claim set with expert readers' assessments
   (Q1, Q3, Q6).
2. **Test deliberate deception.** Repeat the two-AI setup with a participant instructed
   to exploit the protocol, after independent review of its vocabulary (Q7). Red-team
   the revised Phase 0 rules, including whether a satisfiable environment can still
   favor one side (Q4, Q10).
3. **Make the evidence test harder.** Choose a claim whose counterevidence is difficult
   to find, score agents for useful challenges to their assigned position, and make source
   records independently inspectable (Q2, Q8, Q17).
4. **Test the cost and usefulness of the interface.** Measure proof and countermodel
   search on larger examples, try quantifier elicitation as claims arrive, and test
   whether unfamiliar judges can use the resulting report (Q5, Q9, Q16).
5. **Reuse what the examples share.** Factor argument schemas from the two debates
   (Q11) and evaluate the proposed extension to [scientific papers](scientific-papers.md).
   Training on checkable outcomes remains a further experiment, outside current means
   (Q14).

Further reference material: [seven roles](related-ideas.md#seven-roles-different-responsibilities),
[cross-domain concept map](related-ideas.md#a-concept-map-across-domains),
[implementation map](related-ideas.md#where-these-ideas-enter-the-project), and
[source discussions](sources/discussion-2026-09-13.md).
