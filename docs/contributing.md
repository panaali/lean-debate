# Contributing

This is a working document set. Contributions can strengthen the arguments, improve the
writing, test the protocol, or challenge what the project claims to have shown. The
[README](../README.md) is the entry point; the [thesis](thesis.md) explains the proposal.

## Choose available work

Read the relevant run's `SETUP.md` and `STATUS.md`, or the
[red-team status](redteam-STATUS.md), before starting. Check `git status --short` and
inspect changes in files you intend to edit. A piece marked “not started” may already be
reserved for a session's next step; a missing `RESULTS.md` means unfinished, not unowned.
Reservations can include shared code and documentation outside the run folder.

Choose explicitly available work, an unclaimed OPEN question, or a CONTESTED claim.
Record your scope in the run's status when you own it, or in a dated
[review note](reviews/) for independent editorial work. If ownership is unclear, leave
a separate review instead of taking over another session's files. Recheck status before
editing or committing.

## Useful contributions

- **Attack an argument.** Find a step that does not follow, a status its evidence does
  not support, or an objection the author missed. Add evidence and objections to the
  [claims ledger](claims.md), or propose a new [question](open-questions.md).
- **Improve the prose.** Make the problem, claim, and reasoning easy to follow. Split
  passages that conflate ideas, replace misleading terms, and move repeated explanations
  to one place with links. The thesis should be readable in one sitting.
- **Improve the organization.** Give each document a clear purpose. Merge duplicate
  accounts while preserving their information; split sections when that improves
  navigation. Update the README's reading order when needed.
- **Check consistency.** Compare tallies, IDs, filenames, and section references across
  the README, results, overview, thesis, and registers. Attach counts to run tags and
  distinguish debate verdicts from supporting theorems.
- **Verify the evidence.** Search for “from general knowledge” and “not inspected”, then
  apply the evidence protocol. [Q17](open-questions.md#q17-is-the-legal-and-historical-content-in-the-docs-correct)
  tracks this work.
- **Simplify the Lean.** The two debates each have six branches with their own
  vocabularies. Factor reusable argument shapes into schemas
  ([Q11](open-questions.md#q11-is-there-a-reusable-library-or-does-every-debate-need-its-own-signatures))
  while preserving verdicts and the axiom audit.

These are standing invitations within available scope. They do not override a reservation.

## Keep the record clear

Reference proposal claims and questions by stable ID, such as C7 or Q2. Keep debate
claim and edge IDs stable too. Where IDs collide, qualify their origin: “proposal C5”
concerns the Phase 0 rules; “birthright C5” is Cooper's Harlan premise.

Preserve information when editing. Move material or replace repetition with a pointer.
Never delete a register row or question: mark it superseded or resolved and explain why.
Change a status only with evidence, and name that evidence in the commit message.
If a critique is not applied directly, put it in `docs/reviews/<date>-<topic>.md` and
reference the affected IDs. Follow the [review convention](reviews/README.md) when an
applied review is ready to be removed.

| Kind of change | Destination |
|---|---|
| Evidence or objection about the proposal | [Claims](claims.md) or [open questions](open-questions.md) |
| Finding that changes the project's frame | [Thesis](thesis.md), after its register entry |
| Detailed reference material or development history | [Project overview](project-overview.md) |
| Run-specific findings and changed tallies | The run's `RESULTS.md` and [project results](results.md) |
| Raw conversation | [Sources](sources/), with a descriptive name |
| Deferred critique or editorial proposal | [Reviews](reviews/) |

## Preserve reproducibility

Lean changes must pass `lake build`. Include each new theorem in the relevant
`Audit.lean`: the [birthright audit](../Debate/Birthright/Audit.lean) also covers the
two-AI and evidence work; the [death-penalty audit](../Debate/DeathPenalty/Audit.lean)
covers that debate. Every audited theorem must report no axioms. Inspect the affected
report after changing its ledger.

Git records what replaces an earlier formalization; sibling modules record alternatives
that coexist. Make fixes, renames, and protocol additions in place. Add an independent
formalization or alternative model as a sibling under the relevant branch namespace;
give a second debate its own namespace. Each alternative needs its own signature,
audited theorems, and a comparison in [results](results.md). Do not create version folders.

Before invoking agents for a new run, fix its proposition, environment, rules, and roles
in `docs/runs/<name>/SETUP.md`. Keep outputs in that folder and maintain a `STATUS.md`
with landed pieces, current producers, reserved next steps, and work outsiders may add.
A run is complete when its `RESULTS.md` exists, its Lean theorems are audited, and
[results](results.md), [claims](claims.md), and [open questions](open-questions.md)
record what changed.

Tag completed runs so their results remain reproducible as the protocol evolves.
`run-birthright-1` is the original 30-verdict development; `-2` added Article V and
the evidence types; `-3` records the first red-team repairs. Other completed runs have
their own tags, listed in the README. Use a separate checkout or temporary copy to
inspect an old tag while someone else is using the shared workspace.

Commit scoped changes as you go, with a message naming the relevant claim, question,
or review. Stage only your own files or hunks.
