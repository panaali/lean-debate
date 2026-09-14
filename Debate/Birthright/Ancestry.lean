import Debate.Protocol

/-!
# The ancestry argument

Mayes: birthright citizenship predates the Fourteenth Amendment; without it, since all
early Americans were immigrants, none of us would be citizens today.

This is the one place in the debate where the pipeline runs all the way through — the
protocol extracts a hidden premise, and the premise is then decidable by the evidence
layer, and it turns out to be false. The rhetorical flourish does not survive.
-/

namespace Debate.Birthright.Ancestry

open Debate

structure Vocab where
  Person : Type
  /-- Descends from immigrants (as Mayes says, at some point all of us do). -/
  HasImmigrantAncestor : Person → Prop
  /-- Acquired citizenship by being born in the country. -/
  CitizenByBirthright : Person → Prop
  /-- Acquired it some other way: naturalisation, statute, descent, treaty, annexation. -/
  CitizenByOtherRoute : Person → Prop
  Citizen : Person → Prop

/-- **[SHARED / DEFINITION].** Citizenship is acquired through some legal route: one is a
citizen exactly if one is a citizen by birthright or by some other route. Uncontroversial,
and both sides would approve it. -/
structure Frame extends Vocab where
  routes : ∀ p : Person, Citizen p ↔ (CitizenByBirthright p ∨ CitizenByOtherRoute p)

/-- **A1 [Mayes].** Counterfactually, there is no birthright citizenship. -/
def noBirthright (V : Vocab) : Prop := ∀ p : V.Person, ¬ V.CitizenByBirthright p

/-- **A2 [Mayes, EMPIRICAL].** Everyone descends from immigrants. -/
def allDescendFromImmigrants (V : Vocab) : Prop := ∀ p : V.Person, V.HasImmigrantAncestor p

/-- **A3 [Mayes, conclusion].** None of us would be citizens. -/
def nobodyIsCitizen (V : Vocab) : Prop := ∀ p : V.Person, ¬ V.Citizen p

/-- **A4 [extracted by the protocol, EMPIRICAL/HISTORICAL].** Descent from immigrants
closes off every non-birthright route to citizenship. Mayes never says this. It is what
her conclusion needs, and — unlike most extracted premises — it is a plain historical
question with a plain answer. -/
def noOtherRouteForImmigrantDescendants (V : Vocab) : Prop :=
  ∀ p : V.Person, V.HasImmigrantAncestor p → ¬ V.CitizenByOtherRoute p

/-- A world with no birthright citizenship at all, where everyone descends from
immigrants, and everyone is nonetheless a citizen — by statute. -/
def statuteVocab : Vocab where
  Person := Unit
  HasImmigrantAncestor := fun _ => True
  CitizenByBirthright := fun _ => False
  CitizenByOtherRoute := fun _ => True
  Citizen := fun _ => True

def statuteFrame : Frame where
  toVocab := statuteVocab
  routes := fun _ => ⟨fun _ => Or.inr trivial, fun _ => trivial⟩

/-- **GAP.** The conclusion does not follow. Abolishing one route to citizenship says
nothing about the others, and `statuteFrame` is a world satisfying both of Mayes's
premises in which everybody is a citizen. -/
theorem gap_ancestry :
    ¬ ∀ F : Frame, noBirthright F.toVocab → allDescendFromImmigrants F.toVocab →
        nobodyIsCitizen F.toVocab :=
  fun h => h statuteFrame (fun _ hb => hb) (fun _ => trivial) () trivial

/-- **CERTIFIED.** With A4 the argument is valid. So the protocol does not silence Mayes;
it hands her a specific premise to defend. -/
theorem certified_ancestry (F : Frame)
    (h1 : noBirthright F.toVocab) (h2 : allDescendFromImmigrants F.toVocab)
    (h4 : noOtherRouteForImmigrantDescendants F.toVocab) :
    nobodyIsCitizen F.toVocab :=
  fun p hc => match (F.routes p).mp hc with
    | Or.inl hb => h1 p hb
    | Or.inr ho => h4 p (h2 p) ho

/-- **REFUTED, by the evidence layer.** A4 is refuted by a single historical witness: one
person of immigrant descent who became a citizen by another route. The Naturalization Act
of 1790 supplied exactly that route, from the first Congress onward.

This is worth dwelling on, because it is the shape the whole architecture is aiming for.
Lean cannot evaluate "none of us would be citizens" — it is a counterfactual about
history. What Lean can do is drive the claim down to `A4`, which is not a counterfactual
at all but an ordinary documentary question, and hand that question to an agent that can
answer it. The rhetorical move was doing its work precisely by never being stated. -/
theorem evidence_refutes_A4 (V : Vocab)
    (h : ∃ p : V.Person, V.HasImmigrantAncestor p ∧ V.CitizenByOtherRoute p) :
    ¬ noOtherRouteForImmigrantDescendants V :=
  fun hA4 => match h with | ⟨p, hanc, hother⟩ => hA4 p hanc hother

end Debate.Birthright.Ancestry
