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

## Entry 2. After both openings, before rebuttals

**Split demands unified.** A demands `BornInUSProper` (a State, DC, or an incorporated
territory: where the Clause applies of its own force). B demands `BornInUSConst` (born "in
the United States" in the constitutional sense as construed by the courts). The glosses
coincide. One symbol, `BornInUSConst`, carries both; `BornInUSTerritory` keeps the
original territorial gloss. A's constant `WongKimArk` is granted. B's `BornInAmericanSamoa`
and `ParentsUndocumentedAliens` are granted.

**The disputed reading of P is now explicit.** A's A1 asserts (as a DEFINITION) that
P's "born in the United States" means `BornInUSConst`. B's B3 asserts (as a DEFINITION)
that it means `BornInUSTerritory`. Both are typed DEFINITION and they conflict, which
means neither is a definition: the meaning of P's subject term is a contested node. The
formalizer should have elicited it at setup (§3.4). Both readings are carried as
`P_territory` and `P_const`; each side's route is checked against both.

**Each side has pre-empted the other.** A's A6–A8 block an exclusive-allegiance reading
of the jurisdiction clause; B does not use that reading. B's American Samoa witness is
exactly what A's A1 scopes out. So the rebuttal round starts with each side's main
defensive move already aimed at an attack the other did not make.


## Entry 3. After both rebuttals

**Encoded** as `Debate/Birthright/TwoAI.lean`, a sibling of `Constitutional.lean`. Eight
verdicts, all axiom-free. B1 downgraded to PROBABILISTIC as both sides anticipated; A1
retyped from DEFINITION to INTERPRETIVE at A's own request, and B3 likewise; both were
the reading node in disguise.

**What the kernel says.** P under the constitutional reading is CERTIFIED from A2, A3, A4
and L1, and B accepted every one of those premises. Not-P under the territorial reading
is CERTIFIED from B1, B2, B4, and A accepted every one of those. A's premises do not
reach the territorial P (GAP, B's own two-person world). B's premises do not reach
not-P-constitutional (GAP, same world). A1 as first stated is REFUTED by B's witness.
Everything either side asserted, apart from the reading node, is jointly satisfiable in
one world with P-constitutional true and P-territorial false.

**Back-translation** run per §2.8 on an opaque-identifier version of the file; see
`back-translation.md` and RESULTS.md.
