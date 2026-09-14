# Proof-carrying debate: birthright citizenship

A machine-checked formalization of one real political debate — *Should America End
Birthright Citizenship?* (Open to Debate, June 2026; for the motion: Krikorian, Cooper;
against: Mayes, Newman).

This is the concrete test the source discussion in `sources/lean-in-social-science.md` kept
deferring: not a toy example, but an hour of constitutional argument, historical
counterexample, statistical prediction, analogy and moral principle, pushed all the way
through a proof assistant to see what survives.

`inference-protocol.md` is the protocol itself, rewritten around what the exercise turned up —
including §9 on running it between two AIs, which is where it earns its cost.

`learnings.md` is the judgment layer: what the exercise is worth, which of Irving's
problems it actually addresses, and a worked example of the one it does not. Read §6 there
before showing any of this to anyone.

## Running it

```bash
lake build       # builds the library and prints the axiom audit
lake exe report  # prints the judge-facing ledger
```

Plain Lean 4 (v4.24.0), no Mathlib — the whole development needs only core logic, and
stays a few-second build.

If you don't have Lean, `curl https://elan.lean-lang.org/elan-init.sh -sSf | sh` then
`source $HOME/.elan/env`. (Already installed on this machine.)

## What it does

Each speaker's argument becomes an argument graph. Nodes are claims, labelled with the
kind of justification they need. Edges are claimed inferences, and every edge gets a
verdict from the kernel:

| verdict | meaning |
|---|---|
| `CERTIFIED` | the conclusion follows from the listed premises |
| `REFUTED` | the negation follows |
| `GAP` | **a countermodel exists** — the step is invalid, and that is itself proved |
| `COMPATIBLE` | two claims that sounded like a clash are jointly satisfiable |

`GAP` is the load-bearing one. It never means "no proof found" — it means a fully
specified world was exhibited in which the shared constitutional text holds, every premise
the speaker asserted holds, and the conclusion is false. Invalidity is certified, not
merely unrefuted. Nobody wins by being harder to refute than their opponent can manage.

There are **no `axiom` declarations anywhere**. The debate vocabulary is a signature, the
agreed constitutional text is a structure field, arguments are theorems quantified over
all models. `Debate/Birthright/Audit.lean` prints `#print axioms` for all 30 verdicts;
every one reports *does not depend on any axioms*.

## Results

```
edges certified .......... 14
edges refuted ............ 3
edges with proved gaps ... 11    (countermodel exhibited; no proof exists)
apparent clashes that are
  not clashes ............ 2

premises needing evidence  8
contested meanings ....... 7
value premises ........... 3
premises nobody stated ... 4
```

**Nothing in the debate is `PROVED`.** Not one substantive claim about the Constitution,
history or policy. Every verdict concerns the *relationship* between claims. That is the
design working as intended.

### The four premises nobody stated

Each is required by its own speaker's argument, and none is uttered in the debate.

- **M-JB** (Mayes) — being born in the US is by itself enough to be subject to US
  jurisdiction. Needed by her one-condition restatement of a two-condition clause.
- **K-EX** (Krikorian) — the Citizenship Clause is the *only* route to citizenship at
  birth. The converse of the shared text. Without it the pro-motion constitutional case
  does not reach its conclusion at all, and no one on either side notices.
- **C5** (Cooper) — whenever Harlan dissented, the case was wrongly decided. The only
  premise that makes the Harlan argument valid, and nobody would approve it.
- **P4** (Mayes) — all rulings on this question go the same way. What deductive validity
  would cost; it would make the pending case pointless.

### Findings worth the trouble

- **Both sides drop a condition, and only one gets caught.** Mayes states the clause with
  two conditions and restates it with one (`E1`). The symmetric error on the other side is
  larger and invisible: the clause is an implication, so failing it settles nothing, and
  Krikorian's whole case silently needs the converse (`E9`, `E10`).
- **Krikorian's counterexample is valid, and wins less than it appears to.** It refutes
  Mayes's stated bridge (`E6`) but nothing follows about her conclusion (`E7`) — the two
  are jointly satisfiable (`E11`).
- **The statelessness exchange is not a disagreement.** Whether Krikorian's rebuttal lands
  depends entirely on a quantifier Mayes never had occasion to make explicit. Against the
  strong reading it is decisive (`E19`); against the weak one it is not a rebuttal at all
  (`E20`).
- **The bank-robbery analogy reduces to one proposition** (`E25`): is ending birthright
  citizenship relevantly like recovering stolen money? Nothing else Cooper says about bank
  robbers bears on the conclusion. Newman's real reply sits at that joint (`E26`) — and
  the debate as held never reaches it.
- **The ancestry argument runs the full pipeline.** Lean cannot evaluate "without
  birthright citizenship none of us would be citizens" — it is a counterfactual about
  history. It can drive it down to an ordinary documentary question (`A4`), which the
  evidence layer then refutes: naturalisation existed from 1790 (`E14`).
- **The largest gap is between branches, not inside one.** Most of the hour is spent on
  what the law *is*; the motion asks what America *should do*. Article V exists, so those
  come apart, and neither side supplies the bridge (`E27`, `E28`). Winning the
  constitutional argument outright settles nothing about the motion — in either direction.

## Layout

```
Debate/Protocol.lean               statuses, verdicts, rendering — no debate content
Debate/Birthright/
  Constitutional.lean              the Citizenship Clause; "subject to the jurisdiction"
  Ancestry.lean                    "none of us would be citizens"
  Judicial.lean                    Harlan's dissents; predicting the Supreme Court
  Policy.lean                      statelessness; the moderator's domain objection
  Normative.lean                   punishing children; the stolen-money analogy
  Motion.lean                      the is/ought gap between branches and the motion
  Audit.lean                       #print axioms for all 30 verdicts
  Ledger.lean                      the judge-facing report
```

## What this does not do

Lean validated no debate content. Whether each formal claim means what the speaker meant
is unproven and unprovable from inside the system — that is what the debater's approval
step is for, and it is the trusted component. This was reconstruction from a transcript,
not live operation. See `inference-protocol.md` §10, and §2 for the attack surface that matters: the
whole thing turns on keeping `SubjectToUSLaw` and `SubjectToUSJurisdiction` as two
symbols, and a formalizer that merged them would produce a clean, kernel-checked,
worthless proof. Splitting a symbol is safe; merging is not — so the protocol grants any
demand to split, by default.
