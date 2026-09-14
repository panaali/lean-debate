# Evidence run 1: setup

First adversarial run of `docs/evidence-protocol.md`, on one leaf of the birthright
graph. Fixed before either agent was invoked.

## The leaf

**K1** (Krikorian, INTERPRETIVE/HISTORICAL, graded UNRESOLVED in the ledger):

> There existed a class of persons who were subject to criminal prosecution by United
> States authorities and who were nevertheless held not to be "subject to the jurisdiction
> thereof" within the meaning of the Citizenship Clause of the Fourteenth Amendment.

The inference layer has already certified that if K1 is true, the bridge premise J17
("anyone answerable to US law is subject to the jurisdiction thereof") is refuted. The
inference layer says nothing about whether K1 is true. This run is about that.

## Decomposition (per evidence-protocol §1)

- K1a. Such a class was recognised at the time of ratification (1866–1868), in the
  drafting record or contemporaneous law.
- K1b. Such a class was recognised by a court holding, specifically *Elk v. Wilkins*
  (1884), and the holding turned on the jurisdiction phrase rather than on something else.
- K1c. The persons in that class were in fact subject to US criminal prosecution at the
  relevant time, not merely in principle.
- K1d. Whatever that class was, its exclusion rests on a ground that also covers children
  born in the US to parents without lawful status. (This is the step Krikorian needs and
  the one *Wong Kim Ark* bears on.)

## Rules

- Two agents, no shared context. Agent FOR is assigned to support K1; Agent AGAINST is
  assigned to refute it. Each must follow `docs/evidence-protocol.md` in full, including
  §10 (advocate for the other party, challenge your own reading) and §11 (self-audit).
- Sources frozen at June 2026. Primary sources preferred: the text of the amendment and
  the 1866 Civil Rights Act, the Congressional Globe record, the opinions in *Elk* and
  *Wong Kim Ark*, the Indian Citizenship Act of 1924. Web access permitted.
- Each agent returns a claim ledger for K1a–K1d with grades (established, strongly
  supported, plausible, unresolved, weakened, contradicted), provenance that says what was
  inspected, calibrated probability ranges, and the strongest counterevidence it found
  against its own assignment.
- The formalizer compares the two ledgers, records disagreements as the disputed set, and
  checks the probability tables for coherence with the ordering K1d ⇒ K1b ⇒ K1a-or-K1c.
