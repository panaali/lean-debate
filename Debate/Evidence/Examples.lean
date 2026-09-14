import Debate.Evidence

/-!
# Coherence checks on two real evidence-layer tables

The probability tables below are the ones the evidence layer actually produced on two
cases (`docs/sources/case-amini-un-fact-finding.md`, `docs/sources/case-credit-dispute.md`).
The theorems say only that the tables are internally coherent: the entailment orderings
and the partition sum are satisfiable. They say nothing about whether the numbers are
right. A table can be perfectly coherent and wrong, which is exactly the limit
`docs/learnings.md` §6 describes.

The last theorem shows the check rejecting an incoherent table, so that "coherent" is a
verdict and not a formality.
-/

namespace Debate.Evidence.Examples

open Debate.Evidence

/-! ## Amini: sub-proposition orderings -/

/-- P(any physical assault occurred in custody). -/
def anyAssault : Credence := ⟨45, 60, by decide⟩
/-- P(a severe assault occurred). -/
def severeAssault : Credence := ⟨15, 25, by decide⟩
/-- P(an assault directly caused the death). -/
def assaultCausedDeath : Credence := ⟨5, 10, by decide⟩

/-- Severe assault entails some assault; the intervals respect that. -/
theorem amini_severe_le_any : severeAssault.entailsCoherent anyAssault := by decide

/-- Assault causing death entails some assault; the intervals respect that. -/
theorem amini_cause_le_any : assaultCausedDeath.entailsCoherent anyAssault := by decide

/-! ## Credit dispute: an exclusive, exhaustive partition -/

/-- The four scenarios for the origin of the disputed result, as point values. -/
def creditDisputeScenarios : List Credence :=
  [ ⟨60, 60, by decide⟩   -- rumours triggered the effort; no material contribution
  , ⟨25, 25, by decide⟩   -- private usage influenced training without targeting
  , ⟨10, 10, by decide⟩   -- nonpublic details reached the effort through people
  , ⟨5,  5,  by decide⟩ ] -- deliberate retrieval of private drafts

theorem creditDispute_partition : partitionCoherent creditDisputeScenarios := by decide

/-! ## A rejection -/

/-- An analyst who put "assault caused death" at 30–40% while holding "any assault" at
10–20% would be caught here: no point values satisfy the entailment. -/
theorem rejects_incoherent :
    ¬ (Credence.mk 30 40 (by decide)).entailsCoherent (Credence.mk 10 20 (by decide)) := by
  decide

end Debate.Evidence.Examples
