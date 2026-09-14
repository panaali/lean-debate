/-!
# Bohr's 1935 reply: a context-indexed argument reconstruction

This file formalizes a small logical core of Bohr's reply to EPR.  It does not
formalize Hilbert-space quantum mechanics or derive the apparatus claims.  In
particular, `Predicts` and `ConditionsPreserved` are kept distinct, as are lack
of mechanical disturbance and preservation of the conditions that make a
prediction meaningful.
-/

namespace PaperStudies.Bohr

/-- The two conjugate quantities used in the EPR and Bohr discussions. -/
inductive Quantity where
  | position
  | momentum
  deriving DecidableEq, Repr

/-- Mutually exclusive experimental arrangements in the reconstruction. -/
inductive Arrangement where
  | positionFrame
  | momentumBalance
  deriving DecidableEq, Repr

/-- The argument-level data extracted from an experimental description. -/
structure Scenario where
  mechanicallyUndisturbed : Arrangement → Prop
  predicts : Arrangement → Quantity → Prop
  predictionConditionsPreserved : Arrangement → Quantity → Prop
  represents : Arrangement → Quantity → Prop

/-- EPR's criterion read without retaining the measurement arrangement. -/
def CoarseReality (s : Scenario) (q : Quantity) : Prop :=
  ∃ a, s.mechanicallyUndisturbed a ∧ s.predicts a q

/-- Bohr-style warrant: the quantity is indexed by the conditions of prediction. -/
def ContextualWarrant (s : Scenario) (a : Arrangement) (q : Quantity) : Prop :=
  s.mechanicallyUndisturbed a ∧ s.predicts a q ∧
    s.predictionConditionsPreserved a q

/-- Both complementary quantities are warranted in one and the same arrangement. -/
def JointWarrant (s : Scenario) : Prop :=
  ∃ a, ContextualWarrant s a .position ∧
    ContextualWarrant s a .momentum

/-- The two predictive procedures are available, though possibly in different contexts. -/
def AlternativePredictions (s : Scenario) : Prop :=
  (∃ a, ContextualWarrant s a .position) ∧
  (∃ a, ContextualWarrant s a .momentum)

/-- Mutual exclusion at the level relevant to the prediction, not merely apparatus labels. -/
def Complementary (s : Scenario) : Prop :=
  ∀ a, ¬ (s.predictionConditionsPreserved a .position ∧
          s.predictionConditionsPreserved a .momentum)

/-- Completeness restricted to what is warranted in each experimental context. -/
def ScopeComplete (s : Scenario) : Prop :=
  ∀ a q, ContextualWarrant s a q → s.represents a q

/-- Every quantity is represented in every context: stronger than `ScopeComplete`. -/
def AllContextsRepresented (s : Scenario) : Prop :=
  ∀ a q, s.represents a q

/-- A context-independent candidate assignment of elements of reality. -/
abbrev ExternalReality := Quantity → Prop

/-- Both quantities are real according to an external, context-independent assignment. -/
def SimultaneousReality (real : ExternalReality) : Prop :=
  real .position ∧ real .momentum

/-- Complementarity blocks a same-arrangement joint warrant. -/
theorem no_joint_warrant_of_complementary
    (s : Scenario) (h : Complementary s) : ¬ JointWarrant s := by
  intro hj
  obtain ⟨a, hp, hm⟩ := hj
  exact h a ⟨hp.2.2, hm.2.2⟩

/-- Alternative context-indexed predictions still imply both coarse reality claims. -/
theorem coarse_realities_of_alternatives
    (s : Scenario) (h : AlternativePredictions s) :
    CoarseReality s .position ∧ CoarseReality s .momentum := by
  constructor
  · obtain ⟨a, ha⟩ := h.1
    exact ⟨a, ha.1, ha.2.1⟩
  · obtain ⟨a, ha⟩ := h.2
    exact ⟨a, ha.1, ha.2.1⟩

/--
A deliberately strong bridge sufficient for a *joint predictive warrant*.
It is not EPR's locality premise: it transports prediction and its defining
conditions to every arrangement, while EPR denies that simultaneous prediction
is required for simultaneous reality.
-/
def WarrantTransport (s : Scenario) : Prop :=
  ∀ q, CoarseReality s q → ∀ a, ContextualWarrant s a q

/-- The joint conclusion follows once the missing transport bridge is stated explicitly. -/
theorem joint_warrant_of_transport
    (s : Scenario) (ht : WarrantTransport s)
    (hp : CoarseReality s .position) (hm : CoarseReality s .momentum) :
    JointWarrant s := by
  exact ⟨.positionFrame, ht .position hp .positionFrame,
    ht .momentum hm .positionFrame⟩

/-- A concrete, nonempty model of Bohr's context dependence. -/
def bohrScenario : Scenario where
  mechanicallyUndisturbed := fun _ => True
  predicts := fun a q =>
    (a = .positionFrame ∧ q = .position) ∨
    (a = .momentumBalance ∧ q = .momentum)
  predictionConditionsPreserved := fun a q =>
    (a = .positionFrame ∧ q = .position) ∨
    (a = .momentumBalance ∧ q = .momentum)
  represents := fun a q =>
    (a = .positionFrame ∧ q = .position) ∨
    (a = .momentumBalance ∧ q = .momentum)

theorem bohr_alternative_predictions : AlternativePredictions bohrScenario := by
  constructor
  · exact ⟨.positionFrame, True.intro, Or.inl ⟨rfl, rfl⟩, Or.inl ⟨rfl, rfl⟩⟩
  · exact ⟨.momentumBalance, True.intro, Or.inr ⟨rfl, rfl⟩,
      Or.inr ⟨rfl, rfl⟩⟩

theorem bohr_coarse_position_and_momentum :
    CoarseReality bohrScenario .position ∧
      CoarseReality bohrScenario .momentum :=
  coarse_realities_of_alternatives bohrScenario bohr_alternative_predictions

theorem bohr_complementary : Complementary bohrScenario := by
  intro a h
  cases a with
  | positionFrame =>
      rcases h.2 with hbad | hbad
      · exact Quantity.noConfusion hbad.2
      · exact Arrangement.noConfusion hbad.1
  | momentumBalance =>
      rcases h.1 with hbad | hbad
      · exact Arrangement.noConfusion hbad.1
      · exact Quantity.noConfusion hbad.2

theorem bohr_no_joint_warrant : ¬ JointWarrant bohrScenario :=
  no_joint_warrant_of_complementary bohrScenario bohr_complementary

/-- No joint warrant is compatible with an external assignment of both realities. -/
theorem no_joint_warrant_compatible_with_simultaneous_reality :
    ∃ real : ExternalReality,
      SimultaneousReality real ∧ ¬ JointWarrant bohrScenario := by
  exact ⟨fun _ => True, ⟨True.intro, True.intro⟩, bohr_no_joint_warrant⟩

theorem bohr_transport_fails : ¬ WarrantTransport bohrScenario := by
  intro ht
  have hp : CoarseReality bohrScenario .position :=
    bohr_coarse_position_and_momentum.1
  have h := ht .position hp .momentumBalance
  rcases h.2.2 with hbad | hbad
  · exact Arrangement.noConfusion hbad.1
  · exact Quantity.noConfusion hbad.2

/-- Mechanical non-disturbance alone does not preserve prediction conditions. -/
theorem mechanical_non_disturbance_is_not_condition_preservation :
    bohrScenario.mechanicallyUndisturbed .momentumBalance ∧
    ¬ bohrScenario.predictionConditionsPreserved .momentumBalance .position := by
  constructor
  · trivial
  · intro h
    rcases h with hbad | hbad
    · exact Arrangement.noConfusion hbad.1
    · exact Quantity.noConfusion hbad.2

theorem bohr_scope_complete : ScopeComplete bohrScenario := by
  intro a q h
  exact h.2.2

/-- Scope completeness does not entail representation in every context. -/
theorem scope_complete_not_all_contexts_represented :
    ScopeComplete bohrScenario ∧ ¬ AllContextsRepresented bohrScenario := by
  constructor
  · exact bohr_scope_complete
  · intro h
    have hbad := h .positionFrame .momentum
    rcases hbad with hbad | hbad
    · exact Quantity.noConfusion hbad.2
    · exact Arrangement.noConfusion hbad.1

/-- Same predictive structure as `bohrScenario`, with no representation premise. -/
def noRepresentationScenario : Scenario where
  mechanicallyUndisturbed := bohrScenario.mechanicallyUndisturbed
  predicts := bohrScenario.predicts
  predictionConditionsPreserved := bohrScenario.predictionConditionsPreserved
  represents := fun _ _ => False

theorem noRepresentation_alternative_predictions :
    AlternativePredictions noRepresentationScenario :=
  bohr_alternative_predictions

theorem noRepresentation_complementary :
    Complementary noRepresentationScenario :=
  bohr_complementary

theorem noRepresentation_no_joint_warrant :
    ¬ JointWarrant noRepresentationScenario :=
  no_joint_warrant_of_complementary noRepresentationScenario
    noRepresentation_complementary

theorem noRepresentation_not_scope_complete :
    ¬ ScopeComplete noRepresentationScenario := by
  intro h
  exact h .positionFrame .position
    ⟨True.intro, Or.inl ⟨rfl, rfl⟩, Or.inl ⟨rfl, rfl⟩⟩

/--
Alternative predictions and complementarity, the core of the modeled critique,
are compatible with failure of even scope-relative completeness.
-/
theorem critique_alone_does_not_entail_scope_completeness :
    AlternativePredictions noRepresentationScenario ∧
    Complementary noRepresentationScenario ∧
    ¬ JointWarrant noRepresentationScenario ∧
    ¬ ScopeComplete noRepresentationScenario :=
  ⟨noRepresentation_alternative_predictions,
   noRepresentation_complementary,
   noRepresentation_no_joint_warrant,
   noRepresentation_not_scope_complete⟩

end PaperStudies.Bohr
