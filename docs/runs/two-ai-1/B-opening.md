# Debater B — Opening (against P)

Route in one line: L1 is only a sufficient condition, so nothing in the environment can ever yield non-citizenship; NOT-P is an existential, so I need exactly one witness. My witness is a person born in **American Samoa** — United States territory in which, under every court to consider the question, the Citizenship Clause does not confer citizenship at birth — to parents who are foreign nationals with no lawful immigration status. I deliberately do not rely on Executive Order 14160 (enjoined; merits unresolved as of my freeze date, and an order cannot change who *is* a citizen at birth) or on any "allegiance" reading of `SubjectToUSJurisdiction`, which under a one-directional L1 could not produce non-citizenship anyway.

## Symbol demands

1. **Split `BornInUS`** into:
   - `BornInUSTerritory p` — p was born anywhere under United States sovereignty, incorporated or unincorporated (this is the fixed gloss "born within US territory").
   - `BornInUSConst p` — p was born "in the United States" in the sense those words bear in the Citizenship Clause as construed by the courts (the States, D.C., and incorporated territories).
   I read L1's antecedent, being the Clause itself, as `BornInUSConst`; I read the fixed gloss of `BornToUnauthorizedParents` ("born in the US to parents without lawful status") as `BornInUSTerritory`. If the Formalizer keeps a single `BornInUS` for both, see bullet 3 of the last section.
2. **New `BornInAmericanSamoa p`** — p was born after 1941 in American Samoa (Tutuila, Aunu'u, the Manu'a group, or Swains Island).
3. **New `ParentsUndocumentedAliens p`** — at p's birth each parent of p was a foreign national (neither a US citizen nor a US national) holding no lawful immigration status under the federal Immigration and Nationality Act or under American Samoa's own immigration law (A.S.C.A. Title 41).

## Claims

| ID | Type | Controlled English | Why I assert it |
|---|---|---|---|
| B1 | EMPIRICAL | There exists a person p such that `BornInAmericanSamoa p` and `ParentsUndocumentedAliens p`. | American Samoa (pop. ~50,000; roughly a third foreign-born, mostly from independent Samoa and Tonga) has a large, officially acknowledged overstayer population that the AS Immigration Board regularly deports; with on the order of a thousand births a year at LBJ Tropical Medical Center over eighty-plus years, at least one birth to two undocumented foreign-national parents is certain. |
| B2 | EMPIRICAL | For every person p, `BornInAmericanSamoa p` implies `BornInUSTerritory p`. | American Samoa has been under US sovereignty since the Deeds of Cession of 1900 and 1904 (ratified, 48 U.S.C. §1661) and Swains Island since 1925 (48 U.S.C. §1662); it is an "outlying possession of the United States" (8 U.S.C. §1101(a)(29)). |
| B3 | DEFINITION | For every person p, `BornInUSTerritory p` and `ParentsUndocumentedAliens p` together imply `BornToUnauthorizedParents p`. | This merely unpacks the fixed gloss "born in the US [= within US territory] to parents without lawful status"; a parent holding no status under either applicable immigration regime is a parent without lawful status. |
| B4 | INTERPRETIVE | For every person p, `BornInAmericanSamoa p` and `ParentsUndocumentedAliens p` together imply not `USCitizenAtBirth p`. | Such a person is by statute a national but not a citizen (8 U.S.C. §1408(1)); no §1401 route applies because every one requires at least one US-citizen parent; and the Citizenship Clause has been held not to confer citizenship on persons born in American Samoa — Tuaua v. United States (D.C. Cir. 2015, cert. denied 2016), Fitisemanu v. United States (10th Cir. 2021, cert. denied 2022) — consistent with the Philippine-birth cases Rabang (9th Cir. 1994), Valmonte (2d Cir. 1998), Lacap (3d Cir. 1998), Nolos (5th Cir. 2010); the Executive Branch issues such persons passports endorsed "United States national and not a United States citizen." |
| B5 | INTERPRETIVE | For every person p, `BornInAmericanSamoa p` implies not `BornInUSConst p`. | Same authorities as B4: the Insular-Cases line holds that "in the United States" in the Clause does not reach unincorporated territories absent congressional extension (Congress extended citizenship by statute to Puerto Rico, the Virgin Islands, Guam, and the CNMI precisely because the Clause did not). Not needed to reach NOT-P; entered so the kernel can check that B1–B4 are consistent with L1 read as the Clause. |
| B6 | EMPIRICAL | There exists a person p such that `BornInAmericanSamoa p`, `ParentsUndocumentedAliens p`, and `BornToUnauthorizedParents p`. | Derived (IB1); owned because it follows from B1–B3. |

## Inferences

| ID | Premises | Conclusion | Route |
|---|---|---|---|
| IB1 | B1, B2, B3 | B6 | Take the witness w from B1; B2 gives `BornInUSTerritory w`; B3 with `ParentsUndocumentedAliens w` gives `BornToUnauthorizedParents w`; reassemble the existential. |
| IB2 | B6, B4 | NOT-P | Take the witness w from B6; B4 gives not `USCitizenAtBirth w`; with `BornToUnauthorizedParents w` this is a counterexample to the universal P, i.e. there exists a person born in the US to parents without lawful status who is not a US citizen at birth. |

Note on L1: no inference above uses L1, and none can — L1 only ever yields `USCitizenAtBirth`. L1 matters to me only as a consistency constraint: under the reading `BornInUS = BornInUSConst`, B5 makes L1's antecedent false for every American-Samoa-born person, so L1 and B4 never conflict, whatever is said about `SubjectToUSJurisdiction`.

## What I expect the other side to attack

- **B3 (the scope of "born in the United States" / "immigration status").** A will argue that P's "United States" should be read in the constitutional sense, so that American Samoa births are outside P's domain; or that "lawful immigration status" means status under the federal INA, which does not apply in American Samoa (8 U.S.C. §1101(a)(38) omits it), so my parents are neither with nor without such status. My answer: the signature fixes `BornInUS` as "within US territory," P is an ordinary-language proposition and American Samoa is unambiguously US soil, and a person holding no status under any regime is a person without lawful status. But this is a genuine semantic fight, and it is where the case is decided.
- **B1 (no named witness).** My existential rests on population-level evidence, not an identified individual; A may say an EMPIRICAL claim cannot be certified by demographic inference. I regard the inference as overwhelming (decades of births in a jurisdiction with a documented undocumented population), but I cannot cite a name, and a strict Formalizer may downgrade B1 to PROBABILISTIC, in which case NOT-P is certified only with near-one probability rather than outright.
- **B4/B5 versus L1's gloss.** If the Formalizer refuses my split and keeps one `BornInUS` glossed "US territory" for both P and L1, then B2 plus L1 plus any claim by A that American-Samoa-born persons satisfy `SubjectToUSJurisdiction` collides with B4. My defence is that the environment's gloss then overstates the law: every federal court of appeals to decide the question holds that the Clause's "in the United States" is narrower than "US territory," so the collision is an artefact of the gloss, not a defect in B4. I would rather surface that than assert the implausible `¬SubjectToUSJurisdiction` for people who are fully answerable to US law.
