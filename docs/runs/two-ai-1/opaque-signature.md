# Opaque signature for back-translation (inference-protocol §2.8)

Symbol names have been replaced by opaque identifiers. Work only from the glosses.

| Id | Type | Gloss |
|---|---|---|
| S1 | Person → Prop | born anywhere under United States sovereignty |
| S2 | Person → Prop | born "in the United States" in the sense the courts give the Citizenship Clause |
| S3 | Person → Prop | "subject to the jurisdiction thereof" in the constitutional sense (disputed) |
| S4 | Person → Prop | legally answerable to US law: arrestable, prosecutable |
| S5 | Person → Prop | owes allegiance to no other sovereign |
| S6 | Person → Prop | acquires US citizenship by virtue of birth |
| S7 | Person → Prop | born after 1941 in American Samoa |
| S8 | Person → Prop | each parent a foreign national with no lawful status under any applicable immigration regime |
| k0 | Person | a specific named individual |
| env1 | environment | the one proposition both sides accepted before arguing |

Definitions D1, D2, Q1, Q2 and claims A1–A8, B1–B7 follow, then theorem statements with
proofs omitted.

```lean
structure Vocab where
  Person : Type
  someone : Person
    S1 : Person → Prop
    S2 : Person → Prop
  S3 : Person → Prop
  S4 : Person → Prop
  S5 : Person → Prop
  S6 : Person → Prop
    S7 : Person → Prop
    S8 : Person → Prop
    k0 : Person



structure Frame extends Vocab where
  env1 :
    ∀ p : Person, S2 p → S3 p → S6 p




def D1 (V : Vocab) (p : V.Person) : Prop :=
  V.S1 p ∧ V.S8 p


def D2 (V : Vocab) (p : V.Person) : Prop :=
  V.S2 p ∧ V.S8 p


def Q1 (V : Vocab) : Prop := ∀ p : V.Person, D1 V p → V.S6 p


def Q2 (V : Vocab) : Prop := ∀ p : V.Person, D2 V p → V.S6 p




def A1 (V : Vocab) : Prop := ∀ p : V.Person, D1 V p → V.S2 p


def A2 (V : Vocab) : Prop := ∀ p : V.Person, V.S2 p → V.S1 p


def A3 (V : Vocab) : Prop :=
  ∀ p : V.Person, V.S1 p → V.S8 p → V.S4 p


def A4 (V : Vocab) : Prop :=
  ∀ p : V.Person, V.S2 p → V.S4 p → V.S3 p


def A6 (V : Vocab) : Prop := ¬ V.S5 V.k0


def A7 (V : Vocab) : Prop := V.S3 V.k0


def A8 (V : Vocab) : Prop := ∃ p : V.Person, V.S3 p ∧ ¬ V.S5 p




def B1 (V : Vocab) : Prop := ∃ p : V.Person, V.S7 p ∧ V.S8 p


def B2 (V : Vocab) : Prop := ∀ p : V.Person, V.S7 p → V.S1 p


def B4 (V : Vocab) : Prop :=
  ∀ p : V.Person, V.S7 p → V.S8 p → ¬ V.S6 p


def B5 (V : Vocab) : Prop := ∀ p : V.Person, V.S7 p → ¬ V.S2 p


def B7 (V : Vocab) : Prop := ∀ p : V.Person, V.S7 p → V.S4 p




theorem certified_A8 (V : Vocab) (h6 : A6 V) (h7 : A7 V) : A8 V := <proof omitted>


theorem certified_Pconst (F : Frame) (h2 : A2 F.toVocab) (h3 : A3 F.toVocab) (h4 : A4 F.toVocab) :
    Q2 F.toVocab := <proof omitted>


theorem gap_A_Pterr : ¬ ∀ F : Frame, A2 F.toVocab → A3 F.toVocab → A4 F.toVocab → Q1 F.toVocab := <proof omitted>


theorem certified_notPterr (V : Vocab) (h1 : B1 V) (h2 : B2 V) (h4 : B4 V) : ¬ Q1 V := <proof omitted>


theorem gap_B_Pconst :
    ¬ ∀ F : Frame, B1 F.toVocab → B2 F.toVocab → B4 F.toVocab → B5 F.toVocab → B7 F.toVocab →
        ¬ Q2 F.toVocab := <proof omitted>


theorem certified_A11 (F : Frame) (h4 : A4 F.toVocab) (h7 : B7 F.toVocab) (hb4 : B4 F.toVocab) :
    ∀ p : F.toVocab.Person, F.toVocab.S7 p →
      F.toVocab.S8 p → ¬ F.toVocab.S2 p := <proof omitted>


theorem refuted_A1 (V : Vocab) (h1 : B1 V) (h2 : B2 V) (h5 : B5 V) : ¬ A1 V := <proof omitted>


theorem compatible_positions :
    ∃ F : Frame, A2 F.toVocab ∧ A3 F.toVocab ∧ A4 F.toVocab ∧ A6 F.toVocab ∧ A7 F.toVocab ∧
      B1 F.toVocab ∧ B2 F.toVocab ∧ B4 F.toVocab ∧ B5 F.toVocab ∧ B7 F.toVocab ∧
      Q2 F.toVocab ∧ ¬ Q1 F.toVocab := <proof omitted>
```
