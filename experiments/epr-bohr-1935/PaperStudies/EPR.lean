/-!
# EPR (1935): a Lean argument companion

Source: Einstein, Podolsky, Rosen, Physical Review 47, 777–780.
https://doi.org/10.1103/PhysRev.47.777

This is a reconstruction of the principal argument, with an explicit coverage boundary.
It does not derive the original generalized wavefunctions, Fourier expansions, or the
physical adequacy of an ideal preparation. `EPR.md` maps hypotheses to source pages.

The distinction made explicit here is between absence of mechanical disturbance and
invariance of reality assignments across alternative measurements. EPR's identification
of the distant reality (p. 779) supplies the latter; it is not a theorem of the former.
The two contexts are alternative arrangements, not simultaneous measurements.
-/

namespace PaperStudies.EPR

inductive Quantity where
  | position | momentum
  deriving DecidableEq, Repr

inductive Context where
  | position | momentum
  deriving DecidableEq, Repr

def Context.measured : Context → Quantity
  | .position => .position
  | .momentum => .momentum

/-- Independent propositions; no physical or interpretive principle is a structure field. -/
structure Scenario where
  predicts : Context → Quantity → Prop
  mechanicallyUndisturbed : Context → Prop
  realIn : Context → Quantity → Prop
  represented : Context → Quantity → Prop

/-- E1: the two ideal alternative predictions. The wavefunction derivation is external. -/
def Correlations (s : Scenario) : Prop :=
  s.predicts .position .position ∧ s.predicts .momentum .momentum

/-- E2: a premise about the absence of mechanical disturbance to the distant system. -/
def Separation (s : Scenario) : Prop := ∀ c, s.mechanicallyUndisturbed c

/-- E3: a sufficient criterion, not a definition or a necessary condition of reality. -/
def RealityCriterion (s : Scenario) : Prop :=
  ∀ c q, s.predicts c q → s.mechanicallyUndisturbed c → s.realIn c q

/-- E4: the same distant reality across alternative undisturbing measurement choices.
This explicit interpretive premise implements the identification made on p. 779. -/
def RealityInvariance (s : Scenario) : Prop :=
  ∀ c d q, s.mechanicallyUndisturbed c → s.mechanicallyUndisturbed d →
    s.realIn c q → s.realIn d q

/-- E5: the selected canonical pair has no joint sharp representation in one description.
This is stronger than merely saying two arbitrary operators fail to commute globally. -/
def QuantumRestriction (s : Scenario) : Prop :=
  ∀ c, ¬ (s.represented c .position ∧ s.represented c .momentum)

/-- E6: the paper's necessary completeness condition restricted to its two quantities.
Rejecting this condition rejects any stronger notion requiring the same representation.
Satisfying it does not certify unrestricted physical completeness. -/
def PairCompleteAt (s : Scenario) (c : Context) : Prop :=
  ∀ q, s.realIn c q → s.represented c q

def JointRealityAt (s : Scenario) (c : Context) : Prop :=
  s.realIn c .position ∧ s.realIn c .momentum

def Premises (s : Scenario) : Prop :=
  Correlations s ∧ Separation s ∧ RealityCriterion s ∧
    RealityInvariance s ∧ QuantumRestriction s

/-! ## EE1–EE4: the conditional derivation -/

/-- EE1: each alternative warrants its own reality assignment under E1–E3. -/
theorem separate_realities (s : Scenario)
    (h1 : Correlations s) (h2 : Separation s) (h3 : RealityCriterion s) :
    s.realIn .position .position ∧ s.realIn .momentum .momentum :=
  ⟨h3 .position .position h1.1 (h2 .position),
   h3 .momentum .momentum h1.2 (h2 .momentum)⟩

/-- EE2: E4 supplies the transport of those assignments into one context. -/
theorem joint_reality (s : Scenario)
    (h1 : Correlations s) (h2 : Separation s) (h3 : RealityCriterion s)
    (h4 : RealityInvariance s) (c : Context) : JointRealityAt s c := by
  have hr := separate_realities s h1 h2 h3
  exact ⟨h4 .position c .position (h2 .position) (h2 c) hr.1,
         h4 .momentum c .momentum (h2 .momentum) (h2 c) hr.2⟩

/-- EE3: joint reality and pair completeness conflict with E5. -/
theorem complete_excludes_joint_reality (s : Scenario)
    (h5 : QuantumRestriction s) (c : Context) (hc : PairCompleteAt s c) :
    ¬ JointRealityAt s c :=
  fun hr => h5 c ⟨hc .position hr.1, hc .momentum hr.2⟩

/-- EE4: the principal result, conditional on all five separately named premises. -/
theorem incomplete (s : Scenario)
    (h1 : Correlations s) (h2 : Separation s) (h3 : RealityCriterion s)
    (h4 : RealityInvariance s) (h5 : QuantumRestriction s) (c : Context) :
    ¬ PairCompleteAt s c :=
  fun hc => complete_excludes_joint_reality s h5 c hc
    (joint_reality s h1 h2 h3 h4 c)

/-! ## EE5: a consistency witness for the premises

This is a finite logical model, not a quantum preparation. It rules out a vacuous
argument from an inconsistent premise bundle. Reality includes both quantities;
representation includes only the one selected by the context.
-/

def incompleteModel : Scenario where
  predicts := fun c q => c.measured = q
  mechanicallyUndisturbed := fun _ => True
  realIn := fun _ _ => True
  represented := fun c q => c.measured = q

theorem incomplete_model_premises : Premises incompleteModel := by
  refine ⟨⟨rfl, rfl⟩, ?_, ?_, ?_, ?_⟩
  · intro _; trivial
  · intro _ _ _ _; trivial
  · intro _ _ _ _ _ _; trivial
  · intro c h
    cases c with
    | position => exact Quantity.noConfusion h.2
    | momentum => exact Quantity.noConfusion h.1

theorem premises_satisfiable : ∃ s, Premises s :=
  ⟨incompleteModel, incomplete_model_premises⟩

/-! ## EE6–EE9: expose the context bridge with a countermodel -/

def contextualModel : Scenario where
  predicts := fun c q => c.measured = q
  mechanicallyUndisturbed := fun _ => True
  realIn := fun c q => c.measured = q
  represented := fun c q => c.measured = q

/-- EE6: all premises except invariance are compatible with pair completeness. -/
theorem contextual_countermodel :
    Correlations contextualModel ∧ Separation contextualModel ∧
    RealityCriterion contextualModel ∧ QuantumRestriction contextualModel ∧
    (∀ c, PairCompleteAt contextualModel c) ∧ ¬ RealityInvariance contextualModel := by
  refine ⟨⟨rfl, rfl⟩, ?_, ?_, ?_, ?_, ?_⟩
  · intro _; trivial
  · intro _ _ hp _; exact hp
  · intro c h
    cases c with
    | position => exact Quantity.noConfusion h.2
    | momentum => exact Quantity.noConfusion h.1
  · intro _ _ hr; exact hr
  · intro hi
    have bad := hi .position .momentum .position trivial trivial rfl
    exact Quantity.noConfusion bad

/-- EE7: E1, E2, E3 and E5 do not entail the incompleteness conclusion. -/
theorem gap_without_invariance :
    ¬ (∀ s : Scenario, Correlations s → Separation s → RealityCriterion s →
      QuantumRestriction s → ¬ PairCompleteAt s .position) := by
  intro h
  have hw := contextual_countermodel
  exact h contextualModel hw.1 hw.2.1 hw.2.2.1 hw.2.2.2.1
    (hw.2.2.2.2.1 .position)

/-- EE8: mechanical non-disturbance alone does not supply context invariance. -/
theorem separation_does_not_imply_invariance :
    ¬ (∀ s : Scenario, Separation s → RealityInvariance s) := by
  intro h
  exact contextual_countermodel.2.2.2.2.2
    (h contextualModel contextual_countermodel.2.1)

/-- EE9: two individually warranted assignments need not coexist in one context. -/
theorem separate_does_not_imply_joint :
    (contextualModel.realIn .position .position ∧
      contextualModel.realIn .momentum .momentum) ∧
    ¬ (∃ c, JointRealityAt contextualModel c) := by
  refine ⟨⟨rfl, rfl⟩, ?_⟩
  intro ⟨c, h⟩
  cases c with
  | position => exact Quantity.noConfusion h.2
  | momentum => exact Quantity.noConfusion h.1

/-! ## EE10–EE12: two further substantive dependencies and a one-way criterion -/

def emptyRealityModel : Scenario where
  predicts := fun c q => c.measured = q
  mechanicallyUndisturbed := fun _ => True
  realIn := fun _ _ => False
  represented := fun _ _ => False

/-- EE10: predictions and invariance cannot replace the reality criterion. -/
theorem gap_without_reality_criterion :
    ∃ s : Scenario, Correlations s ∧ Separation s ∧ RealityInvariance s ∧
      QuantumRestriction s ∧ (∀ c, PairCompleteAt s c) ∧ ¬ RealityCriterion s := by
  refine ⟨emptyRealityModel, ⟨rfl, rfl⟩, ?_, ?_, ?_, ?_, ?_⟩
  · intro _; trivial
  · intro _ _ _ _ _ hr; exact hr
  · intro _ h; exact h.1
  · intro _ _ hr; exact hr
  · intro hr; exact hr .position .position rfl trivial

def unrestrictedModel : Scenario where
  predicts := fun c q => c.measured = q
  mechanicallyUndisturbed := fun _ => True
  realIn := fun _ _ => True
  represented := fun _ _ => True

/-- EE11: the logical reality argument alone does not exclude a richer representation. -/
theorem gap_without_quantum_restriction :
    ∃ s : Scenario, Correlations s ∧ Separation s ∧ RealityCriterion s ∧
      RealityInvariance s ∧ (∀ c, PairCompleteAt s c) ∧ ¬ QuantumRestriction s := by
  refine ⟨unrestrictedModel, ⟨rfl, rfl⟩, ?_, ?_, ?_, ?_, ?_⟩
  · intro _; trivial
  · intro _ _ _ _; trivial
  · intro _ _ _ _ _ _; trivial
  · intro _ _ _; trivial
  · intro hr; exact hr .position ⟨trivial, trivial⟩

def unpredictedRealityModel : Scenario where
  predicts := fun _ _ => False
  mechanicallyUndisturbed := fun _ => True
  realIn := fun _ _ => True
  represented := fun _ _ => True

/-- EE12: a sufficient reality criterion does not make prediction necessary. -/
theorem reality_criterion_has_no_converse :
    RealityCriterion unpredictedRealityModel ∧
    unpredictedRealityModel.realIn .position .position ∧
    ¬ unpredictedRealityModel.predicts .position .position := by
  exact ⟨(fun _ _ _ _ => trivial), trivial, (fun h => h)⟩

/-! ## An alternative encoding: put the common reality in the vocabulary

This deliberately omits the context index on reality and sharp representation. The
invariance premise then becomes automatic. The comparison records where the substantive
choice went; it does not identify a second independent empirical result.
-/

structure UnindexedScenario where
  predicts : Context → Quantity → Prop
  mechanicallyUndisturbed : Context → Prop
  real : Quantity → Prop
  represented : Quantity → Prop

def UnindexedScenario.indexed (u : UnindexedScenario) : Scenario where
  predicts := u.predicts
  mechanicallyUndisturbed := u.mechanicallyUndisturbed
  realIn := fun _ => u.real
  represented := fun _ => u.represented

theorem unindexed_reality_is_invariant (u : UnindexedScenario) :
    RealityInvariance u.indexed :=
  fun _ _ _ _ _ hr => hr

theorem unindexed_incomplete (u : UnindexedScenario)
    (h1 : Correlations u.indexed) (h2 : Separation u.indexed)
    (h3 : RealityCriterion u.indexed) (h5 : QuantumRestriction u.indexed) :
    ¬ (∀ q, u.real q → u.represented q) :=
  incomplete u.indexed h1 h2 h3 (unindexed_reality_is_invariant u) h5 .position

/-! ## EE13–EE14: an arithmetic illustration of the ideal correlations

EPR equations (12)–(16), p. 780, give remote momentum -p and position x+x0.
The following calculations use integers solely to check the signs and uniqueness of
the corresponding affine relations. They do not construct the distributional state,
prove continuous-variable quantum correlations, or model measurement errors.
-/

def PositionRelation (offset left right : Int) : Prop := right - left = offset
def MomentumRelation (left right : Int) : Prop := left + right = 0

theorem position_prediction (offset left right : Int) :
    PositionRelation offset left right ↔ right = left + offset := by
  unfold PositionRelation
  constructor
  · intro h
    rw [← Int.sub_add_cancel right left, h]
    exact Int.add_comm offset left
  · intro h
    rw [h, Int.add_comm left offset, Int.add_sub_cancel]

theorem momentum_prediction (left right : Int) :
    MomentumRelation left right ↔ right = -left := by
  unfold MomentumRelation
  constructor
  · intro h
    exact (Int.neg_eq_of_add_eq_zero h).symm
  · intro h
    rw [h, Int.add_right_neg]

/-! ## EE15: do not overgeneralize noncommutation

These integer matrices are linear operators with a common nonzero eigenvector although
their compositions differ. This is an original diagnostic of the abstraction used in
E5, not a quantum counterexample to EPR's canonical position/momentum commutator.
-/

abbrev Vector3 := Int × Int × Int
def vadd (u v : Vector3) : Vector3 := (u.1 + v.1, u.2.1 + v.2.1, u.2.2 + v.2.2)
def vscale (a : Int) (v : Vector3) : Vector3 := (a * v.1, a * v.2.1, a * v.2.2)
def projection (v : Vector3) : Vector3 := (v.1, v.2.1, 0)
def swap (v : Vector3) : Vector3 := (v.1, v.2.2, v.2.1)
def e1 : Vector3 := (1, 0, 0)
def e2 : Vector3 := (0, 1, 0)

theorem projection_add (u v : Vector3) :
    projection (vadd u v) = vadd (projection u) (projection v) := rfl

theorem projection_scale (a : Int) (v : Vector3) :
    projection (vscale a v) = vscale a (projection v) := by
  exact congrArg (fun z : Int => (a * v.1, a * v.2.1, z)) (Int.mul_zero a).symm

theorem swap_add (u v : Vector3) : swap (vadd u v) = vadd (swap u) (swap v) := rfl

theorem swap_scale (a : Int) (v : Vector3) :
    swap (vscale a v) = vscale a (swap v) := rfl

theorem noncommutation_allows_common_eigenvector :
    projection (swap e2) ≠ swap (projection e2) ∧
    projection e1 = e1 ∧ swap e1 = e1 ∧ e1 ≠ (0, 0, 0) := by
  decide

end PaperStudies.EPR
