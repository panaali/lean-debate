import PaperStudies.EPR
import PaperStudies.Bohr

/-!
# Compare the two reconstructions without identifying reality with predictive warrant

The mappings below identify only the two quantity labels and the two alternative
arrangements. The concrete models share prediction, mechanical-non-disturbance, and
sharp-representation tables. Their distinct completeness tests quantify over distinct
domains: EPR reality assignments versus Bohr contextual warrants.

These are logical models of the explicit signatures, not Hilbert-space models. Joint
satisfiability here is not a historical or physical verdict on either author.
-/

namespace PaperStudies.Comparison

def arrangement : EPR.Context → Bohr.Arrangement
  | .position => .positionFrame
  | .momentum => .momentumBalance

def quantity : EPR.Quantity → Bohr.Quantity
  | .position => .position
  | .momentum => .momentum

/-- CE1: both constructions have the same table of available predictions. -/
theorem prediction_alignment (c : EPR.Context) (q : EPR.Quantity) :
    EPR.incompleteModel.predicts c q ↔
      Bohr.bohrScenario.predicts (arrangement c) (quantity q) := by
  cases c <;> cases q <;>
    dsimp [EPR.incompleteModel, Bohr.bohrScenario, arrangement, quantity,
      EPR.Context.measured] <;> decide

/-- CE2: the mechanical-non-disturbance table is also shared. -/
theorem mechanical_alignment (c : EPR.Context) :
    EPR.incompleteModel.mechanicallyUndisturbed c ↔
      Bohr.bohrScenario.mechanicallyUndisturbed (arrangement c) := Iff.rfl

/-- CE3: even the sharp-representation table is shared. -/
theorem representation_alignment (c : EPR.Context) (q : EPR.Quantity) :
    EPR.incompleteModel.represented c q ↔
      Bohr.bohrScenario.represents (arrangement c) (quantity q) :=
  prediction_alignment c q

/-- CE4: joint reality and failure of joint warrant are compatible in these reconstructions. -/
theorem joint_reality_without_joint_warrant :
    (∀ c, EPR.JointRealityAt EPR.incompleteModel c) ∧
    ¬ Bohr.JointWarrant Bohr.bohrScenario :=
  ⟨(fun _ => ⟨trivial, trivial⟩), Bohr.bohr_no_joint_warrant⟩

/-- CE5: the different completeness verdicts coexist because their domains differ. -/
theorem different_completeness_tests :
    (∀ c, ¬ EPR.PairCompleteAt EPR.incompleteModel c) ∧
    Bohr.ScopeComplete Bohr.bohrScenario := by
  refine ⟨?_, Bohr.bohr_scope_complete⟩
  intro c
  have h := EPR.incomplete_model_premises
  exact EPR.incomplete EPR.incompleteModel h.1 h.2.1 h.2.2.1
    h.2.2.2.1 h.2.2.2.2 c

end PaperStudies.Comparison
