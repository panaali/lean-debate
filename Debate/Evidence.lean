import Debate.Protocol

/-!
# Evidence layer: types, and the slice of it that is kernel-checkable

`Debate.Protocol` types the *inference* layer. This file types the *evidence* layer
specified in `docs/evidence-protocol.md`, and carves out the part of it that can be
checked mechanically rather than trusted.

Two things live here.

1. **Records.** An evidence `Grade` (the evidence protocol's status scale), a `Provenance`
   record that says what was inspected and never what it means, and an `Entry` that ties a
   leaf claim to its grade and its provenance. These are for the judge-facing report: an
   EMPIRICAL leaf should carry its evidence grade, not a bare label.

2. **Coherence.** Calibrated credences as percent intervals, with two decidable checks:
   if P entails Q then Pr(P) ≤ Pr(Q) must be satisfiable by the stated intervals, and a
   partition into exclusive, exhaustive scenarios must admit point values summing to 100.
   These are weak, and that is the point: they catch an incoherent table, never a
   lopsided search (see `docs/learnings.md` §6). They are the first piece of the evidence
   layer that moves from trusted to checked (`docs/open-questions.md` Q8, Q15 in
   `docs/claims.md`).

Nothing here says whether any evidence is true. Every grade is a labelled judgement with a
stated basis, and the report says so.
-/

namespace Debate.Evidence

open Debate

/-- The evidence protocol's status scale for a leaf claim (`docs/evidence-protocol.md` §1). -/
inductive Grade where
  | established
  | stronglySupported
  | plausible
  | unresolved
  | weakened
  | contradicted
deriving Repr, DecidableEq

def Grade.label : Grade → String
  | .established       => "ESTABLISHED"
  | .stronglySupported => "STRONGLY SUPPORTED"
  | .plausible         => "PLAUSIBLE"
  | .unresolved        => "UNRESOLVED"
  | .weakened          => "WEAKENED"
  | .contradicted      => "CONTRADICTED"

/-- What was inspected, never what it means. "Document D exists in archive A and contains
string S" is a provenance fact; "S shows the speaker believed P" is interpretive and does
not belong here. -/
structure Provenance where
  source    : String
  locator   : String := ""
  /-- Directly inspected (`true`), or available only through quotation (`false`). -/
  inspected : Bool := false
  quote     : String := ""

/-- An evidence-layer entry for one leaf of the inference graph. -/
structure Entry where
  claim       : String
  grade       : Grade
  supporting  : List Provenance := []
  challenging : List Provenance := []
  /-- Who graded it and on what basis. A grade assigned from general knowledge must say so. -/
  basis       : String := ""

/-! ## Coherence: the checkable slice -/

/-- A calibrated credence as a percent interval `[lo, hi]`. Subjective, evidence-weighted,
never a frequency; the evidence protocol's §9. -/
structure Credence where
  lo : Nat
  hi : Nat
  ok : lo ≤ hi := by decide

/-- If P entails Q, then Pr(P) ≤ Pr(Q). Two stated intervals are coherent with that
entailment exactly when some point of the first is at most some point of the second. -/
def Credence.entailsCoherent (p q : Credence) : Prop := p.lo ≤ q.hi

instance (p q : Credence) : Decidable (p.entailsCoherent q) :=
  inferInstanceAs (Decidable (p.lo ≤ q.hi))

/-- If P entails (Q or R), then Pr(P) ≤ Pr(Q ∨ R), and Pr(Q ∨ R) is at most Pr(Q) + Pr(R)
but at least max(Pr(Q), Pr(R)); the weakest check that is always sound is against the
larger upper bound. -/
def Credence.entailsEitherCoherent (p q r : Credence) : Prop := p.lo ≤ max q.hi r.hi

instance (p q r : Credence) : Decidable (p.entailsEitherCoherent q r) :=
  inferInstanceAs (Decidable (p.lo ≤ max q.hi r.hi))

/-- Two analysts' intervals for the same proposition overlap. If they do not, either the
two are not estimating the same proposition, or one of them is wrong. -/
def Credence.overlaps (p q : Credence) : Prop := p.lo ≤ q.hi ∧ q.lo ≤ p.hi

instance (p q : Credence) : Decidable (p.overlaps q) :=
  inferInstanceAs (Decidable (_ ∧ _))

/-- A set of mutually exclusive, collectively exhaustive scenarios must admit point values
summing to 100: the lows must not exceed 100 and the highs must reach it. -/
def partitionCoherent (cs : List Credence) : Prop :=
  (cs.map (·.lo)).sum ≤ 100 ∧ 100 ≤ (cs.map (·.hi)).sum

instance (cs : List Credence) : Decidable (partitionCoherent cs) :=
  inferInstanceAs (Decidable (_ ∧ _))

/-! ## The meta-rule, made structural

`docs/inference-protocol.md` §2.6 says the environment is not amendable during a run.
`docs/open-questions.md` Q10 asks whether that can be enforced rather than stated. This is
candidate (b): a change of environment is admissible only if every claim already on the
board keeps its truth value across the change. Stating it as a proposition makes any
proposed amendment a proof obligation rather than a request. -/
def preservesBoard {α : Type} (holdsBefore holdsAfter : α → Prop) (board : List α) : Prop :=
  ∀ c, c ∈ board → (holdsBefore c ↔ holdsAfter c)

/-! ## Rendering -/

def Provenance.render (mark : String) (p : Provenance) : String :=
  "\n" ++ pad "" 26 ++ mark ++ " " ++ p.source ++
  (if p.locator.isEmpty then "" else ", " ++ p.locator) ++
  (if p.inspected then "  [inspected]" else "  [not inspected]")

def Entry.render (e : Entry) : String :=
  pad e.claim 6 ++ pad e.grade.label 20 ++ wrap e.basis 52 26 ++
  String.join (e.supporting.map (Provenance.render "+")) ++
  String.join (e.challenging.map (Provenance.render "-"))

end Debate.Evidence
