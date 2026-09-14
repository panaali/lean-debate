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

/-! ## Evidence run 1: two agents on K1, opposite assignments

Ranges from `docs/runs/evidence-1/FOR.md` and `AGAINST.md`. The ordering the setup fixed
was K1d ⇒ K1b ⇒ (K1a or K1c). Both agents' tables satisfy it. The two agents' K1d
ranges overlap; their K1c ranges do not, which is because AGAINST split K1c into two
readings and reported both, and its Reading-2 range is a different proposition from
FOR's K1c. The check found the split. -/

def forK1a : Credence := ⟨80, 92, by decide⟩
def forK1b : Credence := ⟨88, 95, by decide⟩
def forK1c : Credence := ⟨75, 88, by decide⟩
def forK1d : Credence := ⟨15, 35, by decide⟩

def againstK1a : Credence := ⟨93, 98, by decide⟩
def againstK1b : Credence := ⟨88, 95, by decide⟩
def againstK1c_some : Credence := ⟨75, 88, by decide⟩
def againstK1c_general : Credence := ⟨10, 25, by decide⟩
def againstK1d : Credence := ⟨5, 15, by decide⟩
/-- AGAINST's K1d if the June 30 decision is excluded as past the freeze. -/
def againstK1d_noBarbara : Credence := ⟨12, 25, by decide⟩

theorem for_K1d_le_K1b : forK1d.entailsCoherent forK1b := by decide
theorem for_K1b_le_K1aOrK1c : forK1b.entailsEitherCoherent forK1a forK1c := by decide
theorem against_K1d_le_K1b : againstK1d.entailsCoherent againstK1b := by decide
theorem against_K1b_le_K1aOrK1c : againstK1b.entailsEitherCoherent againstK1a againstK1c_some := by decide

/-- The two agents agree on K1d up to overlap (at 15 percent; wider without the June 30
decision). -/
theorem K1d_overlap : forK1d.overlaps againstK1d := by decide
theorem K1d_overlap_noBarbara : forK1d.overlaps againstK1d_noBarbara := by decide

/-- FOR's K1c and AGAINST's general-subjection K1c do not overlap: they are not the same
proposition. The disputed set is the reading of K1c, exactly as AGAINST reported. -/
theorem K1c_readings_differ : ¬ forK1c.overlaps againstK1c_general := by decide

/-! ## A rejection -/

/-- An analyst who put "assault caused death" at 30–40% while holding "any assault" at
10–20% would be caught here: no point values satisfy the entailment. -/
theorem rejects_incoherent :
    ¬ (Credence.mk 30 40 (by decide)).entailsCoherent (Credence.mk 10 20 (by decide)) := by
  decide

end Debate.Evidence.Examples
