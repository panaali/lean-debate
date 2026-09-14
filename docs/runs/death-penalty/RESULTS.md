# Second debate: results

Motion: *Abolish the Death Penalty* (Intelligence Squared U.S., live April 2015; transcript
published by Open to Debate 23 July 2026). For: Barry Scheck, Diann Rust-Tierney. Against:
Kent Scheidegger, Robert Blecker. Chosen from titles only (`SETUP.md`); extracted by a
separate agent (`extraction.md`, 134 claims, 48 inferences, 27 clashes); formalized in
`Debate/DeathPenalty/` (six branches, 35 theorems, all axiom-free). `lake exe report
deathpenalty` prints the ledger.

## Tallies

```
edges certified .......... 13
edges refuted ............ 1
edges with proved gaps ... 12
apparent clashes that are
  not clashes ............ 9

premises needing evidence  8
contested meanings ....... 1
value premises ........... 11
premises nobody stated ... 9
```

## The disputed node set

Five propositions, once the certified and gapped steps are removed:

1. What error rate is tolerable (S-T), and what the rate is (S11's 4.1 percent against
   R18's "infinitesimal"). The moderator asked the first twice and nobody answered.
2. Whether the penalty's justification requires deterrence (S-D). Scheck's "we win that
   point" needs it; both opponents denied it on the record.
3. Whether cost-benefit decides (S1) or desert is untradeable (R34). The For side's
   framing is itself a premise.
4. Whether the race-of-victim effect survives controls (D8). A pure evidence question
   asserted against itself by both sides for several minutes.
5. Whether state killing is wrong in itself (N-F). The moderator's hypothetical asked for
   it; neither For speaker asserted it.

## The nine premises nobody stated

| Id | Owner | Premise |
|---|---|---|
| S-T | Scheck | any executed innocent makes the risk unacceptable (the tolerable rate is zero) |
| B-T | Blecker | a risk acceptable for convenience is acceptable for justice |
| K-U | Scheidegger | funded review catches errors before execution often enough to outweigh execution risk |
| S-D | Scheck | the justification requires deterrence |
| K-P | Scheidegger | prospective capital offenders perceive the margin between death and life |
| S-C | Scheck | the compared states are otherwise comparable |
| R-S | Blecker | the system executes only those who deserve it |
| D-R | Rust-Tierney | disparity is a reason to abolish rather than to equalize |
| F-B | For side | a penalty with any of the identified defects should be abolished |

## Findings

**Nine non-clashes in one hour.** The sharpest exchanges were mostly not disagreements.
"No persuasive evidence it deters" and "deterrence has not been disproved" are the same
state of knowledge (P8). "Most homicides get justice without death" and "not the worst"
hold together; Scheidegger conceded the majority and Rust-Tierney never claimed the worst
(P19). Blecker grants the race-of-victim effect; his dispute with Rust-Tierney is about
what it means (P25). "Removable by redefinition" and "it will not happen" are both true
(P26). Named executed innocents do not answer "there is no 4 percent rate" (P5).

**The moderator ran the protocol's Phase 4 live, and the For side declined it.** "If every
problem you name were fixed, would you still abolish?" is exactly the bridge question.
Formally, in the fixed world the For side's bridge delivers nothing (P31); abolition there
needs the per-se premise N-F (P32). The answer given, "it cannot be fixed" (D13), is a
prediction in place of a value, and it is compatible with "if fixed, keep it" (P33). The
Against side, by contrast, stated its bridge: justice warrants accepting small risks
(R17). The two sides are asymmetric on the one point the moderator probed.

**One side refuted itself.** Blecker's "deterrence is not a legitimate reason" is the
negation of Scheidegger's "three reasons: justice, incapacitation, deterrence" (P20). The
only REFUTED edge in the run is intra-side. The moderator noticed.

**Vivid material reduces to one premise each.** Blecker's hours of prison footage do no
logical work (P27); his conclusion follows from proportionality (R35), which he does state
(P28), and survives Scheck's denial of the conditions (P29). His ceiling-and-Broadway
analogy reduces to B-T (P4), exactly as the bank-robbery analogy reduced to one node in the
first run.

**Burden of proof dissolves.** Scheidegger put the burden on abolitionists (K5);
Rust-Tierney put it on proponents (D14). In the protocol neither claim has a place: every
conclusion is UNSUPPORTED until certified from its owner's premises, so "burden" is not a
move. Both burden claims were dropped from the ledger for that reason.

## Comparison with the birthright run

| | Birthright | Death penalty |
|---|---|---|
| certified / refuted / gap / compatible | 16 / 3 / 13 / 4 | 13 / 1 / 12 / 9 |
| premises nobody stated | 4 | 9 |
| disputed node set | 5 | 5 |
| value premises | 3 | 11 |
| contested meanings | 9 | 1 |
| is/ought gap between branches and motion | yes, both sides | yes, For side only; Against stated its bridge |
| an analogy reducing to one premise | bank robbery (C-A) | ceiling and Broadway (B-T) |
| a quantifier non-clash | statelessness (E20) | most homicides versus the worst (P19) |

What recurred: the is/ought gap, the analogy collapse, the quantifier non-clash, the
unstated premise carrying a side's whole case. What was new: the count of non-clashes (nine
against two), the shift from contested meanings to contested values (a debate about a
policy rather than a text), an intra-side refutation, and a moderator who asked the
protocol's own question and was not answered.

What this run cannot show: whether the formalizer's extractions are faithful. The
speakers did not approve them (Q6), and the extraction agent's paraphrases are a second
layer of interpretation between the transcript and the graph.
