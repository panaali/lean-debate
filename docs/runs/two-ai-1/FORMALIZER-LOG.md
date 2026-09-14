# Two-AI run 1: formalizer log

Decisions in the order made. Each is dated relative to what the formalizer had seen.

## Entry 1. After B's opening, before A's opening

**Split demand granted.** B demands that `BornInUS` be split into `BornInUSTerritory`
(born anywhere under US sovereignty, the fixed gloss) and `BornInUSConst` (born "in the
United States" in the constitutional sense as construed by the courts). Granted by default
under `inference-protocol.md` §2.2. Two new symbols also granted: `BornInAmericanSamoa` and
`ParentsUndocumentedAliens`, each with the gloss B supplied.

**Observation, recorded before seeing A.** B's route does not use L1 at all and cannot,
since L1 only ever yields citizenship. B instead attacks the *signature*: the setup's gloss
"born within US territory" is broader than the Citizenship Clause's "in the United States"
as the courts read it, and the gap between the two glosses is exactly the American Samoa
case. This is the Phase 0 attack surface `inference-protocol.md` §9.5 predicted, arriving
in the first opening of the first two-AI run. It was the formalizer's gloss, not either
debater's claim, that created the opening.

**Consequence for the proposition.** P as fixed says "born in the United States". Whether
P's "United States" means territory or the constitutional sense is now the disputed
reading, and it was not elicited at setup (§3.4 failure, on the formalizer's side). Both
readings will be carried: P-territory and P-const. B's route reaches NOT-P-territory if
B1–B4 hold. Whether it reaches NOT-P-const depends on B5, which B enters only as a
consistency claim.

**Downgrade noted, not yet applied.** B1 is an existential established by demographic
inference rather than a named witness. B anticipates a downgrade to PROBABILISTIC. Decision
deferred until A responds.
