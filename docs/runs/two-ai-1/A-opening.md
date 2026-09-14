# Debater A — Opening (for P)

## Symbol demands

- Split `BornInUS p` → new symbol `BornInUSProper p`: p was born in a State, the District of Columbia, or an incorporated territory of the United States (the area in which the Citizenship Clause applies of its own force; excludes outlying possessions such as American Samoa and Swains Island).
- New constant `WongKimArk`: the specific person Wong Kim Ark, born in San Francisco in 1873, petitioner in *United States v. Wong Kim Ark*, 169 U.S. 649 (1898).

## Claims

| ID | Type | Controlled English | Why I assert it |
|---|---|---|---|
| A1 | DEFINITION | For every person p, if BornToUnauthorizedParents p then BornInUSProper p. | P restates the Citizenship Clause question, so "born in the United States" in P carries the Clause's territorial meaning; outlying possessions (whose natives are non-citizen nationals under 8 U.S.C. §1408) and unincorporated territories (citizenship by separate statute) are outside P's subject. |
| A2 | DEFINITION | For every person p, if BornInUSProper p then BornInUS p. | Every State, DC, and incorporated territory is US territory; this is a strict narrowing of the fixed gloss. |
| A3 | EMPIRICAL | For every person p, if BornToUnauthorizedParents p then SubjectToUSLaw p at the moment of birth. | A person is "without lawful immigration status" only because US law reaches and governs them (removable; prosecutable under 8 U.S.C. §§1325–1326); their child holds no immunity of any kind (diplomatic immunity derives solely from accredited status, which such parents by definition lack) and is not born within a hostile occupation, so US law runs over the child without exemption. |
| A4 | INTERPRETIVE | For every person p, if BornInUSProper p and SubjectToUSLaw p then SubjectToUSJurisdiction p. | *Wong Kim Ark* (1898) holds that "subject to the jurisdiction thereof" means born within the territory and under the protection and laws of the United States, with exceptions confined to children of foreign ministers, of hostile occupying forces, born on foreign public ships, and of tribal Indians — each a case where US law does not run over the person; *Plyler v. Doe*, 457 U.S. 202, 211 n.10 (1982) states that no plausible distinction as to Fourteenth Amendment "jurisdiction" exists between aliens whose entry was lawful and those whose entry was unlawful; Congress re-enacted the same words in 8 U.S.C. §1401(a) (1952) against that settled reading; executive practice has been uniform since 1898. |
| A5 | INTERPRETIVE (derived) | For every person p, if BornToUnauthorizedParents p then SubjectToUSJurisdiction p. | Derived by IA1 from A1, A3, A4; not independently asserted. |
| A6 | EMPIRICAL | The specific person WongKimArk, born in the United States to parents who were subjects of the Emperor of China and were not diplomats, did not at birth owe allegiance exclusively to the United States (¬ExclusiveAllegiance WongKimArk). | Chinese law and practice (jus sanguinis) treated children of Chinese subjects as subjects of the Emperor; the *Wong Kim Ark* dissent pressed exactly this and the majority treated it as immaterial rather than false. |
| A7 | INTERPRETIVE | The specific person WongKimArk was subject to the jurisdiction of the United States in the constitutional sense (SubjectToUSJurisdiction WongKimArk). | The Supreme Court so held, 169 U.S. at 705; the symbol's gloss is "in the constitutional sense," which a holding of the Supreme Court fixes. |
| A8 | INTERPRETIVE (derived) | There exists a person p such that SubjectToUSJurisdiction p and not ExclusiveAllegiance p. | Derived by IA3 from A6, A7; not independently asserted. Blocks any reading on which constitutional jurisdiction requires exclusive allegiance. |

## Inferences

| ID | Premises | Conclusion | Route |
|---|---|---|---|
| IA1 | A1, A3, A4 | A5 | Fix any p with BornToUnauthorizedParents p; A1 gives BornInUSProper p, A3 gives SubjectToUSLaw p, so A4 gives SubjectToUSJurisdiction p; generalize over p. |
| IA2 | A1, A2, A5, L1 | P | Fix any p with BornToUnauthorizedParents p; A1 then A2 give BornInUS p, A5 gives SubjectToUSJurisdiction p, so L1 gives USCitizenAtBirth p; generalize over p. |
| IA3 | A6, A7 | A8 | WongKimArk witnesses the existential: conjoin A7 and A6 and introduce ∃. |

## What I expect the other side to attack

- **A4 (the interpretive core).** B will read "subject to the jurisdiction thereof" as requiring complete political jurisdiction or exclusive allegiance (*Elk v. Wilkins*, 1884; Trumbull's and Howard's 1866 floor remarks), and will confine *Wong Kim Ark* to children of aliens with lawful permanent domicile. My defense: *Elk* turned on tribal members not being generally subject to US law (tribes as quasi-sovereign "domestic dependent nations"), which is why *Wong Kim Ark* itself listed the Indian case among the exceptions where the laws do not run; the *Wong Kim Ark* Court described an alien's allegiance while within the territory as "local and temporary, but nonetheless allegiance," making domicile a fact of the case, not an element of the rule; and *Plyler* states the point for unlawful entrants in terms. A8, if it survives, makes the exclusive-allegiance reading formally untenable.
- **A3 (a universal over every such person).** B will hunt for an instance: a child born to members of a hostile occupying force, a birth on a foreign public vessel in US waters, or the objection that newborns are not "arrestable, prosecutable." My defense: the first two are exactly the cases where US law does not run, so the parents are not "without lawful immigration status" in P's sense but outside immigration law altogether, and no actual such person is known to exist; infancy is a defense to prosecution that citizens' newborns share equally and has never been thought to bear on jurisdiction.
- **A1 and A6 (the scoping definition and the Wong Kim Ark allegiance fact).** B may call A1 a gerrymander that narrows P to dodge American Samoa; my answer is that P is a question about the Clause, that the outlying-possession exclusion is the settled reading of "in the United States" (*Tuaua*, *Fitisemanu*), and that A1 removes nothing from P that any statute grants. On A6, B may deny that the infant Wong Kim Ark owed Chinese allegiance; but B's own route almost certainly requires that children inherit their parents' foreign allegiance, so denying A6 undercuts B's case against P.
