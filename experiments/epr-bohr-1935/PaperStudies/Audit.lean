import PaperStudies.Report

/-!
# Full theorem audit

Every theorem declared in EPR.lean, Bohr.lean and Comparison.lean is listed below.
Expected: 42 entries have no axioms; the two integer prediction identities use
`propext` through Lean's core integer lemmas. No entry uses `sorryAx` or a
user-declared axiom. This checks formal dependencies, not physical truth,
authorial fidelity, or the neutrality of definitions/hypotheses.
-/

#print axioms PaperStudies.EPR.separate_realities
#print axioms PaperStudies.EPR.joint_reality
#print axioms PaperStudies.EPR.complete_excludes_joint_reality
#print axioms PaperStudies.EPR.incomplete
#print axioms PaperStudies.EPR.incomplete_model_premises
#print axioms PaperStudies.EPR.premises_satisfiable
#print axioms PaperStudies.EPR.contextual_countermodel
#print axioms PaperStudies.EPR.gap_without_invariance
#print axioms PaperStudies.EPR.separation_does_not_imply_invariance
#print axioms PaperStudies.EPR.separate_does_not_imply_joint
#print axioms PaperStudies.EPR.gap_without_reality_criterion
#print axioms PaperStudies.EPR.gap_without_quantum_restriction
#print axioms PaperStudies.EPR.reality_criterion_has_no_converse
#print axioms PaperStudies.EPR.unindexed_reality_is_invariant
#print axioms PaperStudies.EPR.unindexed_incomplete
#print axioms PaperStudies.EPR.position_prediction
#print axioms PaperStudies.EPR.momentum_prediction
#print axioms PaperStudies.EPR.projection_add
#print axioms PaperStudies.EPR.projection_scale
#print axioms PaperStudies.EPR.swap_add
#print axioms PaperStudies.EPR.swap_scale
#print axioms PaperStudies.EPR.noncommutation_allows_common_eigenvector
#print axioms PaperStudies.Bohr.no_joint_warrant_of_complementary
#print axioms PaperStudies.Bohr.criterion_eligibility_of_alternatives
#print axioms PaperStudies.Bohr.joint_warrant_of_transport
#print axioms PaperStudies.Bohr.bohr_alternative_predictions
#print axioms PaperStudies.Bohr.bohr_criterion_eligible_position_and_momentum
#print axioms PaperStudies.Bohr.bohr_complementary
#print axioms PaperStudies.Bohr.bohr_no_joint_warrant
#print axioms PaperStudies.Bohr.no_joint_warrant_compatible_with_simultaneous_reality
#print axioms PaperStudies.Bohr.bohr_transport_fails
#print axioms PaperStudies.Bohr.mechanical_non_disturbance_is_not_condition_preservation
#print axioms PaperStudies.Bohr.bohr_scope_complete
#print axioms PaperStudies.Bohr.scope_complete_not_all_contexts_represented
#print axioms PaperStudies.Bohr.noRepresentation_alternative_predictions
#print axioms PaperStudies.Bohr.noRepresentation_complementary
#print axioms PaperStudies.Bohr.noRepresentation_no_joint_warrant
#print axioms PaperStudies.Bohr.noRepresentation_not_scope_complete
#print axioms PaperStudies.Bohr.critique_alone_does_not_entail_scope_completeness
#print axioms PaperStudies.Comparison.prediction_alignment
#print axioms PaperStudies.Comparison.mechanical_alignment
#print axioms PaperStudies.Comparison.representation_alignment
#print axioms PaperStudies.Comparison.joint_reality_without_joint_warrant
#print axioms PaperStudies.Comparison.different_completeness_tests
