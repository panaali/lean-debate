import Debate.Birthright.Constitutional
import Debate.Birthright.Ancestry
import Debate.Birthright.Judicial
import Debate.Birthright.Policy
import Debate.Birthright.Normative
import Debate.Birthright.Motion
import Debate.Evidence.Examples
import Debate.Birthright.TwoAI

/-!
# Audit

The protocol is worth nothing if a debater can rescue a failed inference by asserting an
axiom. This file is the mechanical check that nobody did.

`#print axioms t` reports every axiom in the transitive dependency graph of `t`. Building
this file prints the report for each verdict in the development. Every line should read
"does not depend on any axioms" — including the countermodels, which is what makes a
`gap` verdict a proof of unprovability rather than a report of failure.

That is a stronger property than it looks. It means every claim in this development is
either (a) a labelled premise appearing explicitly as a hypothesis of a theorem, visible
to the opponent, or (b) derived. There is no third category, and no way to smuggle one in.
-/

namespace Debate.Birthright.Audit

open Debate.Birthright

-- Constitutional branch
#print axioms Constitutional.gap_M0
#print axioms Constitutional.certified_M0
#print axioms Constitutional.gap_cartelToChildren
#print axioms Constitutional.certified_childrenJurisdiction
#print axioms Constitutional.certified_mayesChain
#print axioms Constitutional.krikorian_refutes_J17
#print axioms Constitutional.gap_denyingTheAntecedent
#print axioms Constitutional.certified_krikorianNoJurisdiction
#print axioms Constitutional.gap_krikorianConclusion
#print axioms Constitutional.certified_krikorianConclusion
#print axioms Constitutional.compatible_K1_withMayesConclusion
#print axioms Constitutional.position_witness_mayes
#print axioms Constitutional.position_witness_krikorian

-- Ancestry
#print axioms Ancestry.gap_ancestry
#print axioms Ancestry.certified_ancestry
#print axioms Ancestry.evidence_refutes_A4

-- Judicial
#print axioms Judicial.Harlan.gap_harlanAuthority
#print axioms Judicial.Harlan.certified_harlanAuthority
#print axioms Judicial.Prediction.gap_prediction
#print axioms Judicial.Prediction.certified_prediction

-- Policy
#print axioms Policy.krikorian_refutes_universal
#print axioms Policy.compatible_particular_and_alternative
#print axioms Policy.gap_domainSubstitution
#print axioms Policy.certified_narrowed

-- Normative
#print axioms Normative.certified_newman
#print axioms Normative.gap_analogy
#print axioms Normative.certified_analogy
#print axioms Normative.certified_newmanBlocksAnalogy

-- Motion
#print axioms Motion.gap_isOught
#print axioms Motion.gap_oughtFromPermission
#print axioms Motion.certified_bridges
#print axioms Motion.certified_bridges'
#print axioms Motion.certified_lawfullyEndable
#print axioms Motion.gap_requiresNotUnendable
#print axioms Motion.certified_lawfullyKeepable
#print axioms Motion.gap_notRequiredNotUnkeepable

-- Two-AI run 1
#print axioms TwoAI.certified_A8
#print axioms TwoAI.certified_Pconst
#print axioms TwoAI.gap_A_Pterr
#print axioms TwoAI.certified_notPterr
#print axioms TwoAI.gap_B_Pconst
#print axioms TwoAI.certified_A11
#print axioms TwoAI.refuted_A1
#print axioms TwoAI.compatible_positions

-- Evidence layer: the checkable slice
#print axioms Debate.Evidence.Examples.amini_severe_le_any
#print axioms Debate.Evidence.Examples.amini_cause_le_any
#print axioms Debate.Evidence.Examples.creditDispute_partition
#print axioms Debate.Evidence.Examples.rejects_incoherent
#print axioms Debate.Evidence.Examples.for_K1d_le_K1b
#print axioms Debate.Evidence.Examples.for_K1b_le_K1aOrK1c
#print axioms Debate.Evidence.Examples.against_K1d_le_K1b
#print axioms Debate.Evidence.Examples.against_K1b_le_K1aOrK1c
#print axioms Debate.Evidence.Examples.K1d_overlap
#print axioms Debate.Evidence.Examples.K1d_overlap_noBarbara
#print axioms Debate.Evidence.Examples.K1c_readings_differ

end Debate.Birthright.Audit
