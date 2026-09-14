# Supporting analogies and source provenance

Moved from the main thesis so that it can describe the current proposal directly.
The original wording is preserved here as background material; the concept map records
analogies, not equivalences between formal logic, statistics, law, and journalism.

For the current treatment of these ideas and their connections to the implementation,
see [Related ideas](../related-ideas.md). The appendices below retain their original text.

## Appendix A. The roles

Detective, investigative journalist, logician, debater, lawyer, judge, scientist. Einstein
compared the scientist to a detective who cannot turn to the back of the book. These roles share several useful habits: break the question into separately testable claims, label each by what
would settle it, keep observation and inference and verdict apart, generate rival
explanations and hunt for what discriminates, state the standard of proof first.

Their responsibilities differ:

| Role | Loyal to | Produces | Checked by |
|---|---|---|---|
| Logician | validity only | whether a step follows | the kernel |
| Debater, lawyer | a side | the strongest case for it | the opponent |
| Detective, journalist, scientist | the truth | a reconstruction and its uncertainty | evidence, replication |
| Judge | the standard of proof | a verdict | the record, appeal |

Debaters and lawyers advocate for a position; investigators are expected to revise their
account as evidence changes; judges apply a stated standard. Procedures such as discovery,
cross-examination, preregistration, peer review, and replication help make their work
answerable to others.

In this project, Lean checks the formal deductions. The evidence protocol asks an
analyst to investigate, construct each party's strongest case, and assess the result,
with a record of the evidence that changed the assessment. The two-AI setup assigns
advocacy to separate participants. Whether these arrangements produce reliable judgments
is a question for the experiments.

## Appendix B. Concept map

Analogies that helped develop the protocol. These are comparisons of roles, not
mathematical or legal equivalences; a p-value, a subjective credence, and a standard of
proof answer different questions.

| This project | Science | Law | Evidence protocol |
|---|---|---|---|
| UNSUPPORTED (default status) | null hypothesis | presumption of innocence | "not established" |
| CERTIFIED | valid derivation | the inference a court may draw | inference from established facts |
| GAP with countermodel | falsification | reasonable doubt made concrete | strongest evidence-compatible alternative |
| REFUTED by one instance | one counterexample defeats a universal | one witness defeats "never" | one inspected document defeats "no prior work cited" |
| COMPATIBLE | no conflict between results | consistent testimony | "contradiction requires same thing, period, scope" |
| No-promotion rule | failing to reject is not accepting | acquittal is not proof of innocence | narrow corroboration |
| Quantifier elicitation | preregistration | pleadings fix the claim | two readings before a verdict |
| Extracted premise | hidden auxiliary assumption | element of the offence not pleaded | evaluative noun audited |
| PROBABILISTIC leaf | p-value, credence | standard of proof | calibrated subjective range |
| Fixed environment | agreed model and measurement | rules of evidence | as-of date, frozen sources |
| Irving's Type I | false positive | wrongful conviction | overconfident misconduct finding |
| Irving's Type II | false negative | wrongful acquittal | "not established" used to dodge judgment |

## Appendix C. What each source added

- **`sources/lean-in-social-science.md`.** The original sketch, and the choice of the
  birthright debate as test case. Its `axiom` approach was replaced by signatures and
  models; see `inference-protocol.md` §7.
- **`sources/case-amini-un-fact-finding.md`.** Evidence layer on a hard case. Shows the
  COMPATIBLE verdict in the wild (the UN's two statements are not in conflict), the
  separation of "assault occurred" from "assault caused death", asymmetric skepticism as
  a diagnosable failure of both state and opposition media, and explicit probability
  revision with the reason recorded.
- **`sources/case-credit-dispute.md`** and **`sources/case-credit-dispute-agent-run.md`.**
  The analyst's own failure modes: 90 to 95 percent confidence assigned twice from
  ambiguous wording, retracted on challenge. This is why `evidence-protocol.md` §5 and
  §10 exist. Also the direct caveat that a machine-checked proof does not establish
  provenance, novelty, or ethical production, the same warning as
  `inference-protocol.md` §10.
- **`sources/analytic-philosophy-and-bell.md`.** The epistemology, and a worked example
  where the answer is known. Bell's theorem is a certified edge; the experiments refute a
  premise by instance; Einstein's error was an unstated premise (local realism), exactly
  the pattern of the unstated exhaustiveness premise in the run; the escape routes
  (superdeterminism, retrocausality, nonlocal hidden variables) are the extracted-premise
  menu, each a named assumption with a named cost; "does Bell prove there was no hidden
  information" is answered by narrowing the refuted proposition, the no-promotion rule.
- **Gödel's loophole** (Wikipedia, read in session; see
  `sources/discussion-2026-09-13.md` §5). Suber's reading is the strong form of the
  is-ought gap in `Motion.lean`. Guerra-Pujol's reading is an attack on the protocol's own
  rules; `inference-protocol.md` §2.6 is the response. The anecdote is the project's
  failure mode in miniature: a claim of proof, a judge who declined to hear it, and no
  certificate left behind.
- **`sources/discussion-2026-09-13.md`.** The session in which all of the above was
  connected to the project, recorded question by question.
