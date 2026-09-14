# Project description draft

Proposed opening for the README and project overview. Related: proposal C1, C7, C13,
and C14. This draft is separate because another session is updating the shared docs.
It changes no claim statuses or run results.

## Proposed description

A persuasive argument can be wrong in ways that neither an opponent nor a judge can
identify. This is a central challenge for AI oversight: how can we evaluate an argument
from a system whose reasoning exceeds our own ability to check it?

**Proof-carrying debate investigates whether AI can act as a logician for ordinary
language: exposing hidden assumptions, making disagreements precise, and producing
reasoning that can be checked independently.**

The approach separates two questions: does a conclusion follow from its premises, and
what justifies accepting those premises? Language models translate arguments into
explicit claims and logical steps. A proof assistant, Lean, checks the formal reasoning.
An invalid inference can be challenged with a checked counterexample: a situation in
which its premises hold but its conclusion fails. A complementary evidence protocol
guides investigation of factual claims, while questions of interpretation and values
remain explicit.

The intended result is a record of what an argument establishes, which assumptions it
requires, and where disagreement remains. Formal checking cannot establish that the
premises are true or that the translation preserves the speaker's meaning. The project
therefore treats source investigation and scrutiny of the translation as essential
parts of the method.

The first case study reconstructs a debate on birthright citizenship. It identifies
unstated premises and apparent rebuttals that leave the opposing conclusion untouched,
with proofs and countermodels checked in Lean. Further experiments test whether this
approach remains useful when the participants are AI systems trying to win. The larger
ambition is to make sophisticated reasoning answerable to people who cannot reproduce
every step themselves.
