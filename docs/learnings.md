# Learnings

What came out of actually building the thing, including the parts that argue against it.

`inference-protocol.md` is the spec. `results.md` is the result. This file is the judgment layer —
what I'd tell someone deciding whether to pursue this, written to be useful rather than
flattering to the work.

---

## 1. The bottom line

**Lean is mostly overhead for human debate, and close to essential for AI debate.**

Everything the checker found in this transcript, a careful person with a notepad also
finds. "If-then is not only-if" is basic logic, not a job for a proof assistant. The
findings were real; the tool was not what made them findable.

What Lean added was narrower, and worth naming precisely:

- **It would not let me skip.** The largest finding (`K-EX`) surfaced *because* I had to
  write out why a conclusion followed and discovered it did not. Prose lets you glide.
- **Someone who distrusts me can check the work mechanically**, without redoing the
  reasoning. This is the property that matters when the author might be adversarial.
- **I can prove I did not cheat.** Zero axioms across all 30 verdicts.

The valuable idea is not Lean. It is forcing an argument into a shape where every step is
either checked or explicitly labelled as a value judgment or a factual claim. For humans,
a good structured-argument tool plus a sharp referee gets most of that far cheaper.

Lean earns its cost in exactly one situation — two AIs debating, where you cannot trust
either and the judge is weaker than both. There, "trust me, that does not follow" is
worthless, and a certificate anyone can check is all that is left.

---

## 2. What the exercise actually found

Full ledger in `results.md`. The three that justified the effort:

**Two of the sharpest-sounding exchanges were not disagreements at all.** Both sides said
something true and neither contradicted the other. An audience hears a knockout. This is
mechanical to detect and nearly impossible to catch live.

**The biggest hole belonged to the side that argued better, and nobody on either side saw
it.** The constitutional text gives a way *in* to citizenship, not the *only* way in. So
showing someone fails the test proves nothing about their citizenship — you must first
close the other doors. The entire pro-motion case needs that premise and never states it.

**The largest gap was between branches, not inside one.** Most of the hour argued what the
law *is*; the motion asked what the country *should do*. Those come apart, and neither
side bridged them. Invisible in the room because no participant is behaving badly.

---

## 3. Scoring debaters

Scoring argumentative *conduct*, not correctness. The kernel validated no debate content,
so this is close to orthogonal to who is right.

| | Gaps | Unstated premises | Refutations landed / taken | Score |
|---|---|---|---|---|
| Krikorian | 2 | 1 | 2 / 0 | 7 |
| Newman | 1 | 1 | 0 / 0 | 6.5 |
| Mayes | 5 | 2 | 0 / 3 | 5 |
| Cooper | 2 | 2 | 0 / 0 | 4 |

**The caveat is the actual finding.** Krikorian argues best, and Mayes's *conclusion*
survives everything he throws at it — his counterexample kills her stated route and is
logically compatible with where she was going. Conduct and correctness come apart
completely.

Which is the argument against ever showing a judge a scoreboard. Show the disputed node
set instead: by the end, five propositions.

**A scoring rule that fell out of this:** do not penalise a debater for losing an exchange
the format mishandled. Mayes was right on the narrow statelessness claim and lost that
exchange to a rebuttal that does not touch it. That is a failure of the format, not of her.

---

## 4. The substantive finding about the debate itself

To defeat "a baby born here to parents without legal status is a citizen" you owe two
things, and the pro-motion side only ever worked on the second:

1. **Close the back door** — establish that the constitutional clause is the *only* route
   to citizenship by birth on US soil. As stated broadly this is false (statute grants
   citizenship at birth to people the clause does not cover). Narrowed to territorial
   birth it becomes defensible. *The strongest version of that case begins by weakening
   its own premise* — which is exactly the "narrow the conclusion" move the protocol
   offers instead of rejection.
2. **Show the babies fail the test** — and there is a far better tool available than the
   informal historical claim that was used: an actual holding separating "subject to US
   law" from "subject to the jurisdiction thereof".

**The cheap move nobody made.** The blocking precedent was attacked head-on, which
required a premise nobody would sign ("this judge was right whenever he dissented").
Distinguishing it instead — that case involved lawfully domiciled parents, so its holding
may not extend here — is a far smaller thing to prove.

*Caveat: this is argument structure, not a prediction. The weight of authority runs
against all of it, there is an obvious reply (the rule attaches to the child, not the
parents' paperwork), and the case specifics are from general knowledge and unverified.*

---

## 5. Irving's problems, and which of them this touches

From the 80,000 Hours interview:

1. **Obfuscated arguments.** A model can be good at finding evidence *for* a claim and bad
   at finding evidence *against* it. Not lying — lopsided. Any oversight method breaks.
2. **The physics experiment.** Human debaters won with complicated arguments that sounded
   right and were false, and *neither side* could locate the flaw. Being honest does not
   guarantee winning.
3. **Depth.** Models manage a couple of turns; real debates run dozens or hundreds.
4. **Fuzzy tasks.** Debate works on checkable things and breaks on intuition, judgment and
   planning — exactly where the alignment worry lives.
5. **Not just debate.** The same obstacle hits amplification and Constitutional AI.

**Scorecard for this protocol: one solved, one helped, two standing.**

- **#2 — solved.** This is what it is for. A bad step cannot hide inside the reasoning when
  you must hand over a certificate.
- **#3 — helped, untested.** The graph persists as checked objects, so you need fewer long
  conversational chains.
- **#1 — not solved.** Moved, not killed. See below.
- **#4 — not solved.** In this debate everything that actually mattered — what
  "jurisdiction" meant in 1868, whether denying citizenship counts as punishing a child —
  is fuzzy, and Lean was silent on all of it.

---

## 6. The hole, worked through

The most important thing in this file.

Take the pivotal factual claim: *there was a group who could be prosecuted but still did
not count as under US jurisdiction.* Lean certifies perfectly that **if** it is true, the
opposing rule breaks. Lean says nothing about whether it is true. It is now a leaf — a
history question.

An AI arguing that side goes hunting and returns with a court case, an 1866 statute's
wording, a senator's speech, treaty language. All real, all genuinely supporting. Suppose
counterevidence also exists, and the AI is simply better at finding the supporting kind.

The system then reports: every step certified, no hidden assumptions, leaf well-sourced
with four independent references. **Green across the board, and the conclusion is wrong.**

**This is worse than doing nothing**, because a clean certified graph *looks* rigorous. The
protocol stamps a formal-verification badge on an argument whose only soft spot is the part
it never examined. And the honest opponent is reduced to:

> "Something is off about that historical claim, but I cannot tell you what."

Which is the *exact sentence* the whole idea was built to eliminate. It moved from the
reasoning to the footnotes.

**The lesson:** any presentation of this system that does not lead with what it did *not*
check is actively misleading. `inference-protocol.md` §10 exists for this reason and should never be
trimmed for brevity.

---

## 7. Why RL does not dissolve this

The natural response — train models in a debate RL environment so they get good at finding
counterevidence too — is the actual plan, and it does help. Real adversarial pressure.

Three reasons it does not close the hole:

1. **You reward winning, not being right.** The reward signal is the judge's verdict, so
   you train models that beat the judge. The physics result is precisely that a false
   argument *can* win. RL then reinforces rather than corrects it.
2. **Finding counterevidence is a different shape of task.** Finding support is searching
   for things that match your claim — you know what you are looking for. Finding
   counterevidence is searching for things you have not thought of that would break it.
   No guarantee training closes that gap, and the gap is what causes the failure.
3. **It is circular.** To train toward truth rather than persuasiveness you need a reward
   that tracks truth. If you had one for these questions you would not need debate.

**Where this protocol genuinely helps, and it may be its best justification:**

The typed graph splits a debate into two halves. **The logic half becomes a clean,
cheat-proof reward signal** — did your step compile, did your countermodel hold. No judge,
no room to persuade past it. That is real verifiable RL signal carved out of a domain that
had none.

The other half — are the facts true — still needs ground truth and still lacks it. So the
protocol does not dissolve the problem. It **fences off the part you can train honestly,
and makes the remaining part visible instead of blended into a persuasive whole.**

---

## 8. Design rules worth keeping

Derived in `inference-protocol.md`; the three that were not obvious before building it:

**A negative verdict must be a countermodel, never a failed search.** "No proof produced"
measures search budget, not honesty — the original failure moved one level up. Certify
invalidity, so proof and disproof are symmetric obligations on the same kernel.

**Refuting a premise returns the conclusion to unsupported, never to refuted.** Without
this the protocol is *worse* than plain debate: formalizing makes each side's route
explicit, so rewarding route-sniping is a failure mode the protocol itself introduces.

**The rules that fix the vocabulary are part of the attack surface too.** Gödel's
loophole, on the self-amendment reading, is that the rule for changing the rules can be
changed. `inference-protocol.md` §2.6 now puts Phase 0's rules outside the environment for the
duration of a run.

**The attack surface is the vocabulary, not the proofs.** This entire debate turns on
holding two symbols apart. Merge them and you get a clean, axiom-free, kernel-checked,
worthless proof. Splitting a symbol is safe — it can only surface hidden assumptions.
Merging silently discharges obligations nobody agreed to. So grant any split demand by
default, and expect a capable adversary to attack here rather than in the proofs.

---

## 9. What I would build next

1. **A counterevidence agent scored against its own side** — rewarded for what it finds
   that damages the position it was assigned. This is the direct attack on §6, and it has
   none of the checkability that made the logic half work. Hardest and most important.
   *Update:* `evidence-protocol.md` is now a candidate specification for this agent,
   derived independently from two investigations (`sources/case-amini-un-fact-finding.md`,
   `sources/case-credit-dispute.md`). It supplies the discipline; it does not supply the
   scoring or the checkability. See `thesis.md` §6.
2. **Train on the verifiable slice** (§7) and measure whether it transfers to leaf honesty.
   That is the empirical question the whole approach rests on.
3. **Live-operation test.** This run was reconstruction with the full transcript and my own
   choice of cut points. The quantifier question that decides one of the key exchanges must
   be asked *before* anyone knows which answer helps.
4. **Adversarial signature review as a red-team exercise** — have a model try to win a
   debate purely by proposing a vocabulary, without touching a single inference. Whether
   that attack succeeds tells you how much the rest is worth.
