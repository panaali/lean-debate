import Debate.Birthright.Constitutional
import Debate.Birthright.Ancestry
import Debate.Birthright.Judicial
import Debate.Birthright.Policy
import Debate.Birthright.Normative
import Debate.Birthright.Motion
import Debate.Evidence.Examples

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

-- Evidence layer: the checkable slice
#print axioms Debate.Evidence.Examples.amini_severe_le_any
#print axioms Debate.Evidence.Examples.amini_cause_le_any
#print axioms Debate.Evidence.Examples.creditDispute_partition
#print axioms Debate.Evidence.Examples.rejects_incoherent

end Debate.Birthright.Audit
