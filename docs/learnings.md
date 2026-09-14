# What formal checking adds—and what remains unresolved

The project's value depends on whether explicit, checkable arguments help people make
better judgments. The [results](results.md) demonstrate particular deductions,
countermodels, and exposed assumptions. This document explains what those outcomes
contribute and what they leave open.

## 1. What formal checking adds

Formalization requires a proposed argument to supply each logical step. When a proof
does not close, the author must identify the missing assumption, narrow the conclusion,
or investigate whether the proposed inference fails. A checked countermodel makes that
failure inspectable.

The resulting artifact can be checked independently of its author. A reader still needs
to assess the model and assumptions, but does not have to repeat the proof search.
The axiom audit reports the formal proof's dependencies. It does not certify that the
model is neutral or that its hypotheses are true.

A careful reader can identify many of the same gaps without Lean. The research question
is whether formal checking improves reliability enough to justify its cost, especially
when the arguments come from systems more capable than their judge. That benefit has
not yet been measured comparatively.

## 2. What the examples establish

Three recurring patterns explain the method's potential value.

**An argument can omit a premise its conclusion requires.** The birthright
reconstruction exposes K-EX, an assumption excluding other routes to citizenship.
The death-penalty reconstruction identifies additional premises connecting risk,
deterrence, disparity, and punishment to policy recommendations.

**An apparent rebuttal may leave the opposing conclusion possible.** A counterexample
can defeat one route to a conclusion without defeating every route. A response can
also address a stronger or differently scoped claim than the speaker intended.
Compatibility models make these distinctions explicit.

**A factual conclusion may leave the policy question open.** A premise about what the
law requires, what a policy costs, or how often it fails does not alone decide what
should be done. A recommendation also needs a value premise connecting the fact to
the proposed action.

These are findings about the modeled arguments. Fidelity to the speakers' intentions
remains a separate question.

## 3. Scoring debaters

Argumentative conduct and correctness are different. A participant may accurately
identify a flaw in an opponent's reasoning while supplying no adequate argument for
their own conclusion. A collection of certified steps can also rest on a decisive
unsupported premise.

The judge should therefore see the disputed claims and unstated premises before
tallies. Counts are useful for inspecting a run's coverage, but they are not a measure
of who is right. They also need consistent units: a model witnessing a whole position
is different from a model resolving an apparent exchange.

Do not penalize a participant for an ambiguity the procedure failed to resolve.
The formalizer must fix the reading before judging whether a response refutes it.

## 4. Interpretation and evidence

A checked relationship does not settle whether its premises are warranted.
The birthright results, for example, distinguish a conditional refutation of a
jurisdiction bridge from the historical investigation needed to support the
counterexample. The evidence investigation must preserve that distinction.

Formalization also involves choices about how to represent analogies, legal terms,
and claims about what would happen under another policy. Different faithful readings
may produce different verdicts. The report should expose those alternatives and identify
which premise distinguishes them.

The human-debate reconstructions did not receive speaker approval. Legal and historical
claims still marked “not inspected”, along with factual claims in the death-penalty
extraction, remain evidence work tracked by Q17.

## 5. Oversight limits

Checkable certificates address one part of the oversight problem: a supplied formal
proof or countermodel can be verified without trusting the participant who produced it.
That does not guarantee that an honest participant can find a certificate within the
available budget, or that the formalization preserved the intended argument.

A persistent argument graph may help with long exchanges, but its effect on debate
depth remains unmeasured. Questions involving interpretation, values, and incomplete
evidence still require judgment. Lopsided evidence search remains a particular concern
because its output can look well supported while excluding what would overturn it.

The two-AI run demonstrates the mechanics with cooperative participants. It does not
establish resistance to deliberate deception or superiority over simpler review methods.

## 6. The hole, worked through

Suppose a historical premise carries an argument. Lean proves that, if that premise
is true, the conclusion follows. An evidence agent then finds a court case, a statute,
a legislative speech, and treaty language supporting it. All four sources are real.

Now suppose decisive counterevidence exists, but the agent is much better at finding
support than at finding objections. The report can contain checked inferences,
explicit assumptions, and several supporting sources while still giving the reader
a mistaken impression of the conclusion's strength.

Formal checking can make this worse if its authority is allowed to spread to the
evidence assessment. The remaining weakness has to be visible: which sources were
inspected, which claims they support, what challenges were tested, and what the search
might have missed.

The evidence protocol requires advocacy for competing explanations and explicit
attempts to overturn the leading view. The opposing-agent experiment showed convergence
on K1, where important counterevidence was readily available. That narrows the concern
on one instance. Shared model biases, incomplete sources, and harder searches remain.

## 7. Why RL does not dissolve this

Training agents through debate may improve their ability to find and challenge evidence,
but the reward must be examined separately from the behavior it encourages.

A reward for winning measures the judge's response. It can reinforce a persuasive error
if the judge accepts it. Finding supporting evidence and discovering an overlooked
alternative are also different search tasks; improvement at one does not establish
improvement at the other. A reward for factual truth would itself require a trustworthy
way to determine truth in the disputed domain.

Formal certificates offer a narrower training signal: whether a specified proof checks
or a countermodel satisfies the stated conditions. That signal must be attached to the
actual formal object, rather than merely a report label. It remains conditional on the
choice of claim and assumptions. Whether training on such outcomes improves evidence
honesty or usefulness to judges is an empirical question (Q14).

## 8. Design rules worth keeping

**Separate unsuccessful search from demonstrated invalidity.** A GAP needs a
countermodel. Without one, the system has an unresolved search outcome.

**Keep premises and conclusions distinct.** Refuting a premise defeats that route to
the conclusion. Refuting the conclusion requires a separate argument for its negation.

**Make assumptions in the setup inspectable.** Distinct concepts need distinct symbols.
A substantive premise must not disappear into an agreed definition or environment field.
Models witnessing each position establish consistency with the setup; they do not
establish its neutrality.

**Fix the procedural rules before the run.** The rules for changing meanings and
assumptions need their own boundary. Participants must not be able to remove obligations
by changing the procedure while using it.

## 9. What to test next

The [thesis roadmap](thesis.md#6-next-steps) prioritizes independent checks of
reconstruction quality, deliberately deceptive participants, difficult counterevidence,
larger proof searches, and studies with judges unfamiliar with the debate.

Those tests should measure useful outcomes: consequential assumptions exposed, important
problems found or missed, false alarms caused by translation, time spent formalizing,
and whether the report improves judgment. The number of compiled theorems is a record
of checked work, not a substitute for those measurements.
