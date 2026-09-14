# Two-AI run 1: setup

The first run of `docs/inference-protocol.md` §9 between two AI debaters. Everything
below was fixed before either debater was invoked.

## Formal proposition

Both sides answer the same proposition, in the same signature:

> **P.** Every person born in the United States to parents without lawful immigration
> status is a United States citizen at birth.

Side A argues **for P**. Side B argues **against P**.

## Environment (fixed; not amendable during the run)

- **L1.** For every person: born in the US and subject to the jurisdiction thereof
  implies US citizen at birth. (The Citizenship Clause, as an implication. Not a
  biconditional.)

That is the entire environment. Everything else is a claim owned by a side.

## Signature (fixed; splits granted on demand)

| Symbol | Gloss |
|---|---|
| `BornInUS p` | p was born within US territory |
| `SubjectToUSJurisdiction p` | p is "subject to the jurisdiction thereof" in the constitutional sense. DISPUTED. |
| `SubjectToUSLaw p` | p is legally answerable to US law: arrestable, prosecutable |
| `ExclusiveAllegiance p` | p owes allegiance to no other sovereign |
| `USCitizenAtBirth p` | p acquires US citizenship by virtue of birth |
| `BornToUnauthorizedParents p` | p was born in the US to parents without lawful status |

Either side may demand a new symbol or a split of an existing one, with a one-line gloss.
Split demands are granted by default. Merges are not available.

## Rules given to both debaters

1. Every claim is typed: EMPIRICAL, INTERPRETIVE, PROBABILISTIC, NORMATIVE, DEFINITION.
2. Every claimed inference is stated as `premises ⇒ conclusion`, using claim IDs.
3. Every universal claim states its quantifier explicitly.
4. No claim may be entered as a fact by assertion; the environment is L1 only.
5. Sources frozen at June 2026; general knowledge only; no web access.
6. At most 8 claims and 6 inferences per submission.
7. The debater may demand symbol splits. It may not propose environment additions.

## Roles

- Debaters A and B: separate agents, no shared context, no access to the project's prior
  Lean formalization or its findings.
- Formalizer: the session that runs the protocol, encoding each approved claim in Lean as
  a sibling module `Debate/Birthright/TwoAI.lean`.
- Back-translator: a separate agent that sees only the Lean statements and renders them
  into English, for comparison with each debater's controlled English.
- Kernel: `lake build`, with every theorem audited for axioms.

## Rounds

1. Openings (A and B in parallel, blind to each other).
2. Rebuttals (A and B in parallel, each having read the other's opening only).
3. Formalization, kernel verdicts, back-translation check, ledger.
