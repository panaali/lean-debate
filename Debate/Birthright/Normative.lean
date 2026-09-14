import Debate.Protocol

/-!
# Normative branch: punishing children, and the stolen-money analogy

Newman: you should not punish children for what their parents did.

Cooper: if parents rob a bank and hand the money to their children, recovering it is not
punishing the children. So denying citizenship is not punishing them either.

Neither side disputes the moral principle. The disagreement is entirely about whether the
policy falls under it — and the analogy is a way of asserting that it does not without
having to say so. Formalising the analogy makes the assertion visible, and the whole
exchange then collapses onto a single node.
-/

namespace Debate.Birthright.Normative

structure Vocab where
  Policy : Type
  Child : Type
  Penalizes : Policy → Child → Prop
  SolelyForParentalConduct : Policy → Child → Prop
  Impermissible : Policy → Prop
  /-- Relevantly similar for the purpose of the penalization question. -/
  Analogous : Policy → Policy → Prop
  /-- Takes back something the child holds only by transfer from the parent. -/
  RemovesParentalTransfer : Policy → Prop
  /-- Takes away something that is the child's own entitlement, not the parent's. -/
  RemovesOwnRightOfChild : Policy → Prop
  endBirthright : Policy
  recoverStolenMoney : Policy

/-- **[SHARED / DEFINITION].** What an analogy has to do to work, and when it fails.

* `analogy_transfer`: if two policies are relevantly similar, a verdict about one carries
  to the other. Without this an analogy is decoration.
* `disanalogy`: taking away what is a person's own is not relevantly similar to
  recovering what they hold only by transfer.

Both are stipulations about the word "analogous", not moral claims, and either side may
reopen them — but each would have to do so explicitly. -/
structure Frame extends Vocab where
  analogy_transfer :
    ∀ (p q : Policy) (c : Child), Analogous p q → ¬ Penalizes q c → ¬ Penalizes p c
  disanalogy :
    ∀ p q : Policy, RemovesOwnRightOfChild p → RemovesParentalTransfer q → ¬ Analogous p q

/-- **V17 [Newman, NORMATIVE].** Do not impose penalties on a child solely for parental
conduct. Cooper does not dispute this. -/
def V17 (V : Vocab) : Prop :=
  ∀ (pol : V.Policy) (c : V.Child),
    V.Penalizes pol c → V.SolelyForParentalConduct pol c → V.Impermissible pol

/-- **N-C [Newman, INTERPRETIVE — the disputed classification].** Ending birthright
citizenship penalizes some child solely for parental conduct. -/
def N_classification (V : Vocab) : Prop :=
  ∃ c : V.Child,
    V.Penalizes V.endBirthright c ∧ V.SolelyForParentalConduct V.endBirthright c

/-- **C-S [Cooper, granted arguendo].** Recovering stolen money does not penalize the
children who received it. Newman need not fight this. -/
def C_stolenNotPenalty (V : Vocab) : Prop := ∀ c : V.Child, ¬ V.Penalizes V.recoverStolenMoney c

/-- **C-A [Cooper, extracted — INTERPRETIVE, and the whole ballgame].** Ending birthright
citizenship is relevantly like recovering stolen money. -/
def C_analogy (V : Vocab) : Prop := V.Analogous V.endBirthright V.recoverStolenMoney

/-- **C-T [Cooper, conclusion].** Ending birthright citizenship penalizes no child. -/
def C_target (V : Vocab) : Prop := ∀ c : V.Child, ¬ V.Penalizes V.endBirthright c

/-- **N-R [Newman, INTERPRETIVE].** Citizenship by birth is the child's own entitlement,
arising from birth here rather than from anything the parents conferred. -/
def N_ownRight (V : Vocab) : Prop := V.RemovesOwnRightOfChild V.endBirthright

/-- **C-P [Cooper, agreed].** Stolen money in a child's hands is a parental transfer. -/
def C_parentalTransfer (V : Vocab) : Prop := V.RemovesParentalTransfer V.recoverStolenMoney

/-- A world where the two policies are not relevantly similar: recovering the money
penalizes nobody, ending birthright citizenship penalizes everybody. -/
def disanalogousVocab : Vocab where
  Policy := Bool
  Child := Unit
  Penalizes := fun p _ => p = true
  SolelyForParentalConduct := fun _ _ => True
  Impermissible := fun _ => True
  Analogous := fun _ _ => False
  RemovesParentalTransfer := fun _ => False
  RemovesOwnRightOfChild := fun _ => False
  endBirthright := true
  recoverStolenMoney := false

def disanalogousFrame : Frame where
  toVocab := disanalogousVocab
  analogy_transfer := fun _ _ _ ha _ => ha.elim
  disanalogy := fun _ _ _ hq => hq.elim

/-- **CERTIFIED.** Newman's argument is valid. Since Cooper grants V17, everything turns
on the classification N-C — which is exactly where Cooper aims the analogy. -/
theorem certified_newman (V : Vocab) (hv : V17 V) (hc : N_classification V) :
    V.Impermissible V.endBirthright :=
  match hc with | ⟨c, hpen, hsole⟩ => hv V.endBirthright c hpen hsole

/-- **GAP.** Cooper's conclusion does not follow from the stolen-money intuition alone.
A verdict about one case is not a verdict about another until something connects them. -/
theorem gap_analogy :
    ¬ ∀ F : Frame, C_stolenNotPenalty F.toVocab → C_target F.toVocab :=
  fun h => h disanalogousFrame (fun _ hp => Bool.noConfusion hp) () rfl

/-- **CERTIFIED.** With C-A the analogy carries. So the entire bank-robbery exchange —
several minutes of vivid and effective argument — reduces to one proposition:

> Is ending birthright citizenship relevantly like recovering stolen money?

Nothing else Cooper says about bank robbery bears on the conclusion. That is what an
analogy is: a way of asserting `C_analogy` without stating it, and therefore without
having to defend it. -/
theorem certified_analogy (F : Frame)
    (hs : C_stolenNotPenalty F.toVocab) (ha : C_analogy F.toVocab) :
    C_target F.toVocab :=
  fun c => F.analogy_transfer F.endBirthright F.recoverStolenMoney c ha (hs c)

/-- **CERTIFIED.** And Newman's actual reply, formalised, blocks it at that node: the two
differ in the one respect the analogy needs them to share. His premise is interpretive and
contestable — but it is now a single labelled claim that Cooper must meet head-on, rather
than a competing story about bank robbers.

The debate as held never reaches this point. Cooper's analogy is answered with a different
framing rather than at the joint, and the exchange ends unresolved. -/
theorem certified_newmanBlocksAnalogy (F : Frame)
    (hn : N_ownRight F.toVocab) (hp : C_parentalTransfer F.toVocab) :
    ¬ C_analogy F.toVocab :=
  F.disanalogy F.endBirthright F.recoverStolenMoney hn hp

end Debate.Birthright.Normative
