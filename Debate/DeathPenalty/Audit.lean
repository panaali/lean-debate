import Debate.DeathPenalty.Innocence
import Debate.DeathPenalty.Deterrence
import Debate.DeathPenalty.Desert
import Debate.DeathPenalty.Race
import Debate.DeathPenalty.Alternative
import Debate.DeathPenalty.Motion

/-! # Audit: death penalty. Every line must read "does not depend on any axioms". -/

namespace Debate.DeathPenalty.Audit
open Debate.DeathPenalty

#print axioms Innocence.gap_executedToUnacceptable
#print axioms Innocence.certified_withThreshold
#print axioms Innocence.gap_blecker
#print axioms Innocence.certified_blecker
#print axioms Innocence.compatible_executedAndInfinitesimal
#print axioms Innocence.gap_reviewToBetterOff
#print axioms Innocence.certified_reviewToBetterOff

#print axioms Deterrence.compatible_noEvidenceNotDisproved
#print axioms Deterrence.gap_noEvidenceToUnjustified
#print axioms Deterrence.certified_noEvidenceToUnjustified
#print axioms Deterrence.gap_incentivesToDeterrence
#print axioms Deterrence.certified_incentivesToDeterrence
#print axioms Deterrence.gap_stateComparison
#print axioms Deterrence.certified_stateComparison

#print axioms Desert.certified_obligation
#print axioms Desert.gap_obligationToRetain
#print axioms Desert.certified_obligationToRetain
#print axioms Desert.gap_mostToAll
#print axioms Desert.compatible_D16_K19
#print axioms Desert.refuted_K2_by_R12
#print axioms Desert.gap_costBenefit
#print axioms Desert.certified_costBenefit

#print axioms Race.gap_effectToAbolish
#print axioms Race.certified_effectToAbolish
#print axioms Race.compatible_D8_R21
#print axioms Race.compatible_R22_S24

#print axioms Alternative.gap_conditionsToInsufficient
#print axioms Alternative.certified_proportionality
#print axioms Alternative.compatible_R36_notComfortable

#print axioms Motion.certified_defectsToAbolish
#print axioms Motion.gap_fixed
#print axioms Motion.certified_fixedWithPerSe
#print axioms Motion.compatible_D13_keepIfFixed
#print axioms Motion.position_witness_for
#print axioms Motion.position_witness_against

end Debate.DeathPenalty.Audit
