# Back-translation of opaque-signature.md

Written from the glosses only. Abbreviations: S1 = born anywhere under United States sovereignty; S2 = born "in the United States" in the sense the courts give the Citizenship Clause; S3 = "subject to the jurisdiction thereof" in the constitutional sense (disputed); S4 = legally answerable to US law (arrestable, prosecutable); S5 = owes allegiance to no other sovereign; S6 = acquires US citizenship by virtue of birth; S7 = born after 1941 in American Samoa; S8 = each parent a foreign national with no lawful status under any applicable immigration regime; k0 = a specific named individual.

## 1. Propositions

- **env1**: For every person, if that person is S2 and S3, then that person is S6.
- **D1(p)**: The person p is S1 and S8.
- **D2(p)**: The person p is S2 and S8.
- **Q1**: For every person, if that person satisfies D1 (S1 and S8), then that person is S6.
- **Q2**: For every person, if that person satisfies D2 (S2 and S8), then that person is S6.
- **A1**: For every person, if that person satisfies D1 (S1 and S8), then that person is S2.
- **A2**: For every person, if that person is S2, then that person is S1.
- **A3**: For every person, if that person is S1 and S8, then that person is S4.
- **A4**: For every person, if that person is S2 and S4, then that person is S3.
- **A6**: It is not the case that the specific individual k0 is S5 (k0 does not "owe allegiance to no other sovereign").
- **A7**: The specific individual k0 is S3.
- **A8**: There exists a person who is S3 and is not S5.
- **B1**: There exists a person who is S7 and S8.
- **B2**: For every person, if that person is S7, then that person is S1.
- **B4**: For every person, if that person is S7 and S8, then that person is not S6.
- **B5**: For every person, if that person is S7, then that person is not S2.
- **B7**: For every person, if that person is S7, then that person is S4.

## 2. Theorems

"A world" means a Frame: a vocabulary in which env1 holds. Theorems over a bare Vocab do not assume env1.

- **certified_A8**: If A6 and A7, then A8.
- **certified_Pconst**: If env1, A2, A3 and A4, then Q2.
- **gap_A_Pterr**: There is a world (env1 holds) in which A2, A3 and A4 hold and Q1 fails.
- **certified_notPterr**: If B1, B2 and B4 (env1 not needed), then Q1 is false.
- **gap_B_Pconst**: There is a world (env1 holds) in which B1, B2, B4, B5 and B7 all hold and "Q2 is false" fails, i.e. Q2 holds.
- **certified_A11**: If env1, A4, B7 and B4, then for every person, if that person is S7 and S8, then that person is not S2.
- **refuted_A1**: A1 is false whenever B1, B2 and B5 hold (env1 not needed).
- **compatible_positions**: There is a world in which all of env1, A2, A3, A4, A6, A7, B1, B2, B4, B5, B7, Q2 and not-Q1 hold.

## 3. Things I could not tell from the formal text

- **S1 vs S2** could be the same or nested notion ("born under US sovereignty" vs "born in the US in the courts' sense"). The text does not fix their relation: A2 (S2 implies S1) is only a claim, and B2 with B5 pulls them apart for S7 persons.
- **S3, S4, S5** all sound like jurisdiction/allegiance notions; S3 is glossed "disputed". Nothing says S4 or S5 defines S3; A4 links them only conditionally, and A6/A7 show S3 without S5 for k0.
- **A6** is a double negative under the gloss; I rendered it literally rather than as "owes allegiance to some other sovereign".
- **Missing numbers**: A5, B3, B6 are absent, and `certified_A11` names a claim A11 that is not defined; I stated its conclusion directly.
- **certified_notPterr** is labelled "certified" but concludes not-Q1, so it reads like a refutation of Q1.
- The `Vocab` field `someone` is never used. "Frame" is not glossed; "world" is my rendering of it.
