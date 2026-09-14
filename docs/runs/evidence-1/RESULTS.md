# Evidence run 1: results

Leaf K1 of the birthright graph, investigated by two agents with opposite assignments,
each following `docs/evidence-protocol.md` in full, no shared context. Ledgers in `FOR.md`
and `AGAINST.md`. Coherence checks on both probability tables are theorems in
`Debate/Evidence/Examples.lean`.

## Formalizer rulings

**Freeze boundary.** The setup said "sources frozen at June 2026". The birthright debate
was held 6 June 2026. The AGAINST agent reports a Supreme Court decision on the 2025
birthright order dated 30 June 2026 and scores K1d with and without it. Ruling: the
freeze is the debate date, 6 June 2026, so the reported decision is excluded, and the
AGAINST agent's without-it range (12–25%) is the one used. The formalizer has not
verified that the decision exists; it is recorded as the agent's report, not as a fact.
The FOR agent did not search for it and said so.

**Globe page images.** Both agents quote the Congressional Globe (1866) from
transcriptions or OCR, not page images; both flag it. Every K1a grade below carries that
caveat.

## The two ledgers side by side

| Sub-claim | FOR grade, range | AGAINST grade, range | Agreement |
|---|---|---|---|
| K1a. Class recognised at ratification | strongly supported, 80–92 | established, 93–98 | yes; AGAINST higher on the CRA 1866 carve-out and the 30–10 vote |
| K1b. *Elk* held it, on the jurisdiction phrase | established, 88–95 | established with qualifier, 88–95 | identical ranges |
| K1c. Class in fact prosecutable | strongly supported, 75–88 | reading 1 (some prosecutability): 75–88; reading 2 (general subjection): 10–25 | identical on reading 1; AGAINST split the claim |
| K1d. Ground extends to children of unauthorized immigrants | weakened, 15–35 | contradicted as law, weakened as history, 5–15 (12–25 without the reported June 30 decision) | overlapping ranges |

Kernel-checked: both tables satisfy the ordering K1d ⇒ K1b ⇒ (K1a or K1c); the two K1d
ranges overlap; FOR's K1c and AGAINST's reading-2 K1c do not overlap, which is the check
detecting that they are different propositions.

## What the run found

**The agents converged, from opposite assignments.** The agent assigned to support K1
downgraded K1d from 25–45 to 15–35 after reading *Wong Kim Ark* in full and Senator
Howard's "intervenes and ousts" passage, and wrote the strongest counterargument to its
own side in full. The agent assigned to refute K1 raised K1c from about 60 to 75–88 after
finding that tribal members were in fact tried and convicted, and conceded K1 is
"literally true". Each moved toward the other on the sub-claim where its assignment was
weakest.

**K1 is true as stated and does not do the work Krikorian needed.** The drafters and
*Elk* did treat some persons prosecutable by US authorities as outside the jurisdiction
clause. So J17 as Mayes stated it, "answerable to US law implies subject to the
jurisdiction", is refuted, as the inference layer already certified conditionally. But the
stated ground was membership in a separate polity exercising jurisdiction inside US
territory, and the controlling case confines *Elk* to tribes. The corrected J17,
"answerable to US law and not a member of a separate sovereign implies subject to the
jurisdiction", survives K1, and it is that corrected premise Mayes's chain needs.

**The disputed set after the run is two nodes.** Which reading of K1c the argument needs
(some prosecutability, which holds, or general subjection, which does not), and K1d. K1a
and K1b are not in dispute between the agents.

**The birthright ledger has been updated.** The K1 evidence entry now reads strongly
supported with this basis, with the inspected and uninspected provenance listed, and the
reported June 30 decision recorded as unverified and past the freeze.

## What the run does not show

Two agents of the same model family, prompted by the same protocol, converging is
consistent with both having the same blind spot. Neither inspected the primary Globe
pages. Neither is scored, so `learnings.md` §6 stands: this was a case where the
counterevidence was easy to find (it is in the leading case), which is exactly the case
the hole is not about. The run answers Q2's candidate (b) for this leaf; it does not
close Q2.
