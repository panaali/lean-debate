import PaperStudies.Certificates
import PaperStudies.Comparison

namespace PaperStudies

def eprResults : List Certificate :=
  [ checked "EE1" "CERTIFIED: separate reality assignments under E1-E3"
      using EPR.separate_realities
  , checked "EE2" "CERTIFIED: joint reality via the explicit E4 bridge"
      using EPR.joint_reality
  , checked "EE3" "CERTIFIED: pair completeness and E5 exclude joint reality"
      using EPR.complete_excludes_joint_reality
  , checked "EE4" "CERTIFIED: E1-E5 entail failure of pair completeness"
      using EPR.incomplete
  , checked "EE5" "WITNESS: the EPR premise bundle is satisfiable"
      using EPR.premises_satisfiable
  , checked "EE6" "COUNTERMODEL: complete contextual assignments without E4"
      using EPR.contextual_countermodel
  , checked "EE7" "GAP: E1-E3 and E5 alone do not establish incompleteness"
      using EPR.gap_without_invariance
  , checked "EE8" "GAP: mechanical non-disturbance does not entail reality invariance"
      using EPR.separation_does_not_imply_invariance
  , checked "EE9" "COUNTERMODEL: separate assignments need not be joint"
      using EPR.separate_does_not_imply_joint
  , checked "EE10" "COUNTERMODEL: the reality criterion is a substantive dependency"
      using EPR.gap_without_reality_criterion
  , checked "EE11" "COUNTERMODEL: the representation restriction is a substantive dependency"
      using EPR.gap_without_quantum_restriction
  , checked "EE12" "GAP: the sufficient reality criterion has no converse"
      using EPR.reality_criterion_has_no_converse
  , checked "EE13" "ARITHMETIC: position offset fixes the sign (integer illustration)"
      using EPR.position_prediction
  , checked "EE14" "ARITHMETIC: zero total momentum fixes the sign (integer illustration)"
      using EPR.momentum_prediction
  , checked "EE15" "DIAGNOSTIC: noncommuting linear operators can share an eigenvector"
      using EPR.noncommutation_allows_common_eigenvector
  , checked "EE16" "ENCODING: invariance is built into an unindexed reality predicate"
      using EPR.unindexed_reality_is_invariant
  , checked "EE17" "CERTIFIED: the unindexed version of the conditional argument"
      using EPR.unindexed_incomplete
  ]

def bohrResults : List Certificate :=
  [ checked "BR1" "CERTIFIED: complementarity excludes joint predictive warrant"
      using Bohr.no_joint_warrant_of_complementary
  , checked "BR2" "CERTIFIED: alternative warrants give eligibility for both quantities under the reality criterion"
      using Bohr.criterion_eligibility_of_alternatives
  , checked "BR3" "REPAIR: strong warrant transport suffices; it is not EPR reality invariance"
      using Bohr.joint_warrant_of_transport
  , checked "BR4" "WITNESS: the alternative predictive procedures coexist"
      using Bohr.bohr_alternative_predictions
  , checked "BR5" "COUNTERMODEL: no joint predictive warrant in the concrete scenario"
      using Bohr.bohr_no_joint_warrant
  , checked "BR6" "COMPATIBLE: joint external reality and no joint predictive warrant"
      using Bohr.no_joint_warrant_compatible_with_simultaneous_reality
  , checked "BR7" "GAP: the strong warrant-transport bridge fails in the concrete model"
      using Bohr.bohr_transport_fails
  , checked "BR8" "DISTINCTION: mechanical non-disturbance versus prediction conditions"
      using Bohr.mechanical_non_disturbance_is_not_condition_preservation
  , checked "BR9" "WITNESS: a context-relative scope-complete representation"
      using Bohr.bohr_scope_complete
  , checked "BR10" "DISTINCTION: scope completeness versus all-context sharp representation"
      using Bohr.scope_complete_not_all_contexts_represented
  , checked "BR11" "GAP: the predictive critique alone does not establish scope completeness"
      using Bohr.critique_alone_does_not_entail_scope_completeness
  ]

def comparisonResults : List Certificate :=
  [ checked "CE1" "ALIGNMENT: same prediction data under explicit label translation"
      using Comparison.prediction_alignment
  , checked "CE2" "ALIGNMENT: same mechanical-non-disturbance data"
      using Comparison.mechanical_alignment
  , checked "CE3" "ALIGNMENT: same sharp-representation data"
      using Comparison.representation_alignment
  , checked "CE4" "COMPATIBLE: joint reality and no joint predictive warrant"
      using Comparison.joint_reality_without_joint_warrant
  , checked "CE5" "DISTINCTION: different completeness tests give compatible verdicts"
      using Comparison.different_completeness_tests
  ]

def renderSection (title : String) (cs : List Certificate) : String :=
  "\n" ++ title ++ " (" ++ toString cs.length ++ " result entries)\n" ++
    String.intercalate "\n" (cs.map Certificate.render) ++ "\n"

def report : String :=
  "EPR AND BOHR (1935): CHECKED ARGUMENT COMPANIONS\n" ++
  "Conditional logical reconstructions; no Hilbert-space or apparatus derivation.\n" ++
  "Each entry carries a Lean proof. English descriptions require fidelity review.\n" ++
  renderSection "EPR" eprResults ++ renderSection "BOHR" bohrResults ++
  renderSection "COMPARISON" comparisonResults ++
  "\nRead EPR.md, BOHR.md and COMPARISON.md for assumptions and source coverage.\n"

end PaperStudies
