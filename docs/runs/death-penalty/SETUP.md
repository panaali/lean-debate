# Second debate: setup

`docs/thesis.md` §6 item 5: a second debate, chosen before reading it, through both layers.

## Choice, made from titles only

Sixteen Open to Debate transcripts were listed by title and date (transcript posts began
late May 2026; the birthright debate was excluded). Chosen: **Should the Death Penalty Be
Abolished?**, 23 July 2026, https://opentodebate.substack.com/p/transcript-should-the-death-penalty.

Reason for the choice, recorded before reading: it is a "should" motion like the first
run, so the is/ought gap between branches can be tested again; it is likely to mix
constitutional interpretation (the Eighth Amendment), empirical prediction (deterrence,
error rates), and moral principle, which exercises every status in the protocol; and it is
a subject on which both sides have well-developed standard arguments, so unstated
premises should be findable.

Nothing about the debate's content was known to the formalizer at the time of choice
beyond the title, date, and the general public shape of the topic.

## Procedure

1. A separate agent extracts each speaker's argumentative claims from the transcript as
   short factual paraphrases, grouped by branch, without evaluating them.
2. The formalizer builds argument graphs per branch as sibling modules under
   `Debate/DeathPenalty/`, with the same protocol layer, the same no-axiom rule, and a
   ledger and audit of their own.
3. Results are compared with the first run in `docs/results.md`: which findings recur
   (unstated premises, non-clashes, is/ought), and which are new.
