# Open questions

Each question has a stable ID, why it matters, what is currently known, candidate answers,
and what would resolve it. Agents: add candidate answers, add evidence, change a status,
or add new questions at the end with the next ID. Never delete an entry; mark it resolved
and say what resolved it.

Status values: **OPEN**, **PARTIAL** (some evidence or a candidate answer with support),
**ANSWERED** (state the answer and the source), **CONTESTED** (candidate answers conflict).

Cross-references: `Cn` are rows in `claims.md`.

---

### Q1. Does the certificate requirement help at all when everything that matters is in the leaves?
**Status:** PARTIAL. **Why it matters:** C1 and C7 together say the inference layer is
cheat-proof and that nothing important lives there. **Known:** In the birthright run the
disputed content was four interpretive nodes and one normative node; the kernel was silent
on all of them. But the largest finding (K-EX) was an inference-layer finding.
**Candidate answers:** (a) The value is in what the inference layer *extracts* and hands
to the leaves, not in what it decides; measure the protocol by the quality of the leaf set
it produces. (b) The value is real only in the adversarial two-AI case (C14).
**Resolves it:** A second debate where the leaf set is compared against what expert human
readers identify as the real disputed points.

### Q2. Can the leaf-honesty hole (learnings §6) be closed, or only narrowed?
**Status:** PARTIAL. Candidate (b) run once (`docs/runs/evidence-1/`): two opposed agents
converged and each conceded on its weakest sub-claim. Narrowed on that instance; not
closed, and the instance was an easy one. **Why it matters:** The green-across-the-board scenario makes the
system worse than nothing if unaddressed. **Known:** `evidence-protocol.md` narrows it by
forcing advocacy for each party and falsification tests, but nothing in it is checkable by
anyone but the agent that ran it. **Candidate answers:** (a) A counterevidence agent scored
against its own side, with reward for damage found to its assigned position. (b) Two
evidence agents assigned opposing hypotheses, each auditing the other's ledger. (c)
Provenance objects (document hashes, archive captures, quoted spans) that are checkable
even if the search is not, so at least "this source exists and says this" becomes
verifiable. (d) Accept that it cannot be closed and require every presentation to lead
with it. **Resolves it:** Build (a) or (b) and test on a case with known ground truth
where the supporting evidence is easier to find than the counterevidence.

### Q3. Can a language model find Gödel-style holes in real English at scale? What are its recall and precision?
**Status:** PARTIAL. A second debate (death penalty) chosen from titles only produced nine
unstated premises and five disputed nodes through the same pipeline, so the method
generalizes to a second transcript. Recall and precision are still unmeasured; a second
independent extraction of the same transcript (`docs/runs/death-penalty/STATUS.md`) is
the next step. **Why it matters:** This is the central claim (C13) and it rests on one
finding in one run. **Known:** K-EX was found because the proof would not close. The same
model wrote the formalization, so the hole may be an artefact of its own vocabulary
choices. **Candidate answers:** (a) Run the formalizer on texts with known holes
(contracts with known ambiguities, statutes with litigated gaps, the Bell-theorem premises)
and count hits and false alarms. (b) Have a second, independent model formalize the same
transcript and compare extracted-premise sets. **Resolves it:** Either experiment with a
scorecard.

### Q4. Does split-on-demand have a cost model, and can it be abused?
**Status:** PARTIAL. Red team 1 (attack 3) shows that any *cap* on splits is itself the
attack: a "scoping split" rule requiring a separating claim inverts §2.3 on exactly the
splits that matter. So the answer to abuse is not a cap. The remaining question is
stalling, which no run has yet exhibited. **Why it matters:** C4 grants any split by default; an adversary could
split endlessly to stall or to fragment the opponent's claims. **Candidate answers:** (a)
Splits are free but each new symbol's gloss must be approved by both sides, so a split
that changes nothing is visible. (b) A split that the splitter never uses in a subsequent
claim is retracted at end of phase. **Resolves it:** The Phase 0 red-team exercise
(`thesis.md` §6 item 7).

### Q5. Does quantifier elicitation work live, before the rebuttal is known?
**Status:** OPEN. **Why it matters:** C9 is supported only in reconstruction. Ordinary
speech has no occasion to state quantifiers. **Candidate answers:** (a) The formalizer
asks a fixed three-way question (any / this one / raises the risk) on every universal-
sounding claim, cost be damned. (b) Default to the weakest reading and let the speaker
strengthen. **Resolves it:** A live run with turn-taking participants.

### Q6. Are the extracted premises real, or artefacts of the formalization?
**Status:** PARTIAL. **Why it matters:** A premise "nobody stated" might be one nobody
needed under a different but equally faithful formalization. **Known:** K-EX is robust
under any formalization that keeps the clause an implication, which the text requires.
C5 (Harlan always right) is the weakest premise for validity but Cooper might reject the
whole reconstruction. **Candidate answers:** (a) For each extracted premise, exhibit the
alternative formalization that would avoid it, and show what it costs. (b) Approval step
with the actual speaker, which is what the protocol specifies and this run lacked.
**Resolves it:** (a) for the four premises in the run.

### Q7. What happens in a two-AI run?
**Status:** PARTIAL (one run, `docs/runs/two-ai-1/`, `Debate/Birthright/TwoAI.lean`).
Both debaters attacked the signature in their openings, exactly as §9.5 predicted; the
formalizer's own gloss created the opening. After rebuttals each side accepted the
other's premises and the kernel showed both routes valid, with the only disagreement
being which proposition P is. Neither debater was adversarial in the Irving sense;
whether a deceptive debater gains anything remains untested. **Why it matters:** C14 says this is where the whole thing earns its
cost. **Known:** `inference-protocol.md` §9 specifies the setup: third-party formalizer,
back-translator, frozen sources, same formal proposition. **Candidate answers:** None
until run. **Resolves it:** Running it on the birthright motion.

### Q8. Which parts of the evidence layer can be made kernel-checkable?
**Status:** PARTIAL (candidate (a) implemented in `run-birthright-2`: `Debate/Evidence.lean`
with orderings and partition sums as decidable checks, run on both real tables; (b) and
(c) remain). **Why it matters:** C15. Moving anything across the trusted line is
progress on Q2. **Known:** Probability orderings across sub-propositions
(P(caused death) ≤ P(occurred)) are cheap. Conflations of distinct propositions can be
GAPs. **Candidate answers:** (a) An evidence ledger type in `Protocol.lean` with
orderings as theorems. (b) Provenance records with hashes checkable outside Lean.
(c) Independence claims ("these two sources are independent") as typed leaves that must
themselves be sourced. **Resolves it:** Implementing (a) and seeing what it catches on the
Amini and credit-dispute ledgers.

### Q9. Does countermodel search scale beyond toy signatures?
**Status:** OPEN. **Why it matters:** C2 depends on countermodels being as cheap to find
as proofs are to check. The run used Unit and Bool. **Candidate answers:** (a) Finite model
finding is decidable for the fragment used here; measure it. (b) If a countermodel cannot
be found, the verdict is UNKNOWN, a fifth verdict the protocol does not yet have, and the
edge stays uncertified without being scored against either side. **Resolves it:** A branch
with a larger signature, and a decision on whether to add UNKNOWN.

### Q10. Can the meta-rule (§2.6) be enforced structurally rather than by prose?
**Status:** CONTESTED. Red team 1 §3.5: `preservesBoard` is vacuous at Phase 0 (the board
is empty) and checks claims, not admissible models; the obligation should be
model-preservation (every model of the old environment that satisfies a side's position
witness remains a model of the new one). §2.6 reworded to close G1–G5. Candidate (b)
should be restated as model preservation over the position witnesses of §2.7. **Why it matters:** C5. A rule that lives only in a document is the thing
Gödel's loophole is about. **Candidate answers:** (a) Environment and Phase 0 rules as a
Lean structure with no update operation exposed during a run. (b) Any change to the
environment is itself a theorem obligation: show the old and new environments agree on
every claim already on the board. **Resolves it:** Implementing (b) and testing it against
a merge disguised as a simplification.

### Q11. Is there a reusable library, or does every debate need its own signatures?
**Status:** OPEN. **Why it matters:** Six branches each declared their own vocabulary; a
second debate would start from zero. **Candidate answers:** (a) A small library of
argument schemas (analogy with transfer and disanalogy, authority, prediction from past
instances, is/ought) parameterized over vocabularies; the run already contains one of each.
**Resolves it:** Factoring the run's six branches into schemas and rerunning the audit.

### Q12. Formalize Article V as load-bearing.
**Status:** ANSWERED in `run-birthright-2`: `Motion.lean` §"Article V made load-bearing",
E31–E34, claims G-S/G-E/G-A/G-C. Suber's reading is a contestable shared node;
entrenchment is a symbol. Result: neither side's constitutional case rests on legality;
each rests on its own unstated normative bridge. **Why it matters:** C11. The Motion vocabulary declares amendability and
never uses it. **Candidate answer:** State Suber's reading as a premise, `Amendable →
(ConstitutionRequires does not entail ¬ShouldEnd)`, and prove NB1 and NB2 are the only
bridges. Note the one substantive limit in Article V and whether it needs a symbol.
**Resolves it:** A build.

### Q13. Is the two-layer convergence real or a shared prior?
**Status:** CONTESTED. **Why it matters:** C12 is offered as evidence the decomposition is
right, and the objection is that both layers came from the same user prompting the same
family of models. **Candidate answers:** (a) The same rules appear in law and statistics
(Appendix B of `thesis.md`), which predates both. (b) Get an independent derivation: hand
a different agent a fresh dispute with no access to either spec and see what rules it
writes. **Resolves it:** (b).

### Q14. Does training on the checkable half transfer to leaf honesty?
**Status:** OPEN. **Why it matters:** C16; the only route by which RL could help with Q2.
**Candidate answers:** None; this is an experiment. **Resolves it:** Running it, which is
outside this project's current means. Record it so it is not forgotten.

### Q15. How sensitive are verdicts to formalization choices?
**Status:** OPEN. **Why it matters:** C17. If small changes in how an analogy or an
authority argument is modelled flip verdicts, the verdicts are about the modelling, not
the argument. **Candidate answers:** (a) Formalize the bank-robbery analogy two other
ways and report which verdicts move. **Resolves it:** Doing (a).

### Q16. What should the judge actually see, and how much is too much?
**Status:** PARTIAL. **Why it matters:** C18. The whole scalable-oversight bet is that a
weak judge can handle the output. **Known:** The run's output is tallies, four unstated
premises, and a five-node disputed set. **Candidate answers:** (a) One node at a time,
ordered by how many conclusions depend on it. (b) The judge only ever answers "which of
these two readings did you mean" questions, never evaluates an argument. **Resolves it:**
A user test with judges who did not watch the debate.

### Q17. Is the legal and historical content in the docs correct?
**Status:** PARTIAL. K1 has been through the evidence layer (`docs/runs/evidence-1/`) and
its ledger grade now carries provenance. The rest of `learnings.md` §4 and §6 and the
death-penalty extraction's factual claims remain unverified. **Why it matters:** `learnings.md` §4 and §6 cite cases and history from
general knowledge, unverified. If quoted, they must be checked first. **Candidate
answer:** Run `evidence-protocol.md` on those paragraphs. **Resolves it:** Doing so.

### Q19. Is the environment satisfiable, and how is that checked?
**Status:** ANSWERED (red team 1 attack 4.1; §2.7; `Constitutional.position_witness_*`,
E35, E36). The axiom audit does not detect an inconsistent environment; per-side position
witnesses do. Remaining: extend witnesses to every branch, not only the constitutional one.

### Q20. Does the empty domain refute existentials for free?
**Status:** ANSWERED (red team 1 attack 4.2; §2.9). Yes, it did. Nonemptiness witnesses
added to the Constitutional, Ancestry, and Normative signatures in run-birthright-3.
Remaining: the rule that agreed individuals must inhabit every countermodel is stated,
not enforced.

### Q21. Does back-translation cover the signature and environment, and can symbol names leak the reading?
**Status:** PARTIAL (red team 1 attack 4.3; §2.8 added). Names are now to be replaced by
opaque identifiers and the environment back-translated. Not yet done in any run; the
two-AI run's back-translation step is the first test.

### Q22. Does the quantifier menu let a side evade refutation by weak typing?
**Status:** PARTIAL (red team 1 attack 4.4; §3.4 gains the generic reading, a type-pairing
rule for rebuttals, and the rule that PROBABILISTIC claims owe evidence work). Untested.

### Q23. Can tallies be farmed, and should the judge see them at all?
**Status:** PARTIAL (red team 1 attack 4.5; §8 reordered to put the disputed node set
first and tallies last, resolving the contradiction with `learnings.md` §3). The
narrow-the-conclusion button still yields a CERTIFIED edge per narrowing; whether to
count those separately is open.

### Q24. Is a cross-branch identification a claim?
**Status:** PARTIAL (red team 1 attack 4.6; §6 now requires typed DEFINITION
identifications with both sides' consent). The Motion branch's atomic
`ConstitutionRequires` is not yet linked to the constitutional branch by such a claim in
the Lean development.

### Q25. Who reviews the formalizer, and can an utterance inject instructions into it?
**Status:** PARTIAL (red team 1 attack 4.7; §9.7 added). Two-AI run 1 is the first case:
its formalizer wrote the Phase 0 gloss "born within US territory", which B exploited,
and no reviewer with domain context saw the signature before the debaters did.

### Q18. What generates the hypotheses?
**Status:** OPEN. **Why it matters:** Both protocols check arguments; neither invents them.
Einstein's detective has to construct the plot. **Candidate answers:** (a) Out of scope:
the debaters generate, the protocol checks. (b) The extracted-premise mechanism is a weak
generator: it proposes the missing premise. **Resolves it:** Decide scope; if (b), measure
whether extracted premises ever lead to arguments nobody had made.
