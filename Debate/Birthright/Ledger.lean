import Debate.Protocol
import Debate.Evidence

/-!
# The ledger

The judge-facing output. Every entry corresponds to a definition or theorem in the
branch files; the `witness` field names it, so nothing here is an unbacked assertion.

Read the `UNSUPPORTED` block first. Those are premises no one in the room stated, that
their own arguments require, and that the protocol would have put on screen for approval.
-/

namespace Debate.Birthright.Ledger

open Debate

def claims : List Claim :=
  [ { id := "L1",   speaker := .shared,    status := .definitional,
      formal := "Constitutional.Frame.citizenship_clause",
      english := "Born in the US and subject to its jurisdiction implies citizenship at birth."
      note := "Source-verified text. Note it is an implication, not a biconditional." }
  , { id := "M-JB", speaker := .mayes,     status := .unsupported,
      formal := "Constitutional.M_birthImpliesJurisdiction",
      english := "Being born in the US is by itself enough to be subject to US jurisdiction."
      note := "Never stated. Required by her one-condition restatement of the clause." }
  , { id := "J17",  speaker := .mayes,     status := .interpretive,
      formal := "Constitutional.J17",
      english := "Anyone legally answerable to US law is subject to the jurisdiction thereof."
      note := "The real disputed node of the constitutional branch." }
  , { id := "M-L",  speaker := .mayes,     status := .empirical,
      formal := "Constitutional.childrenSubjectToLaw",
      english := "Children born here to unauthorized parents are answerable to US law."
      note := "Uncontested by either side." }
  , { id := "K1",   speaker := .krikorian, status := .interpretive,
      formal := "Constitutional.K1",
      english := "Some persons were prosecutable by US authorities yet outside the clause's jurisdiction condition."
      note := "His reservation-Indians counterexample. Historical; for the evidence agents." }
  , { id := "K-R",  speaker := .krikorian, status := .interpretive,
      formal := "Constitutional.K_exclusiveReading",
      english := "'Subject to the jurisdiction thereof' means owing exclusive allegiance to the US." }
  , { id := "K-A",  speaker := .krikorian, status := .interpretive,
      formal := "Constitutional.K_childrenNotExclusive",
      english := "Children of unauthorized parents do not owe exclusive allegiance to the US." }
  , { id := "K-EX", speaker := .krikorian, status := .unsupported,
      formal := "Constitutional.K_clauseExhaustive",
      english := "The Citizenship Clause is the only route to citizenship at birth."
      note := "Never stated by anyone. The converse of L1. Without it the pro-motion constitutional case does not reach its conclusion at all." }
  , { id := "A2",   speaker := .mayes,     status := .empirical,
      formal := "Ancestry.allDescendFromImmigrants",
      english := "Everyone descends from immigrants." }
  , { id := "A4",   speaker := .mayes,     status := .empirical,
      formal := "Ancestry.noOtherRouteForImmigrantDescendants",
      english := "Descent from immigrants closes off every non-birthright route to citizenship."
      note := "Extracted, then REFUTED by evidence: naturalisation existed from 1790." }
  , { id := "C2",   speaker := .cooper,    status := .empirical,
      formal := "Judicial.Harlan.vindicatedPlessy",
      english := "History vindicated Harlan's dissent in Plessy." }
  , { id := "C5",   speaker := .cooper,    status := .unsupported,
      formal := "Judicial.Harlan.harlanAlwaysRight",
      english := "Whenever Harlan dissented, the case was wrongly decided."
      note := "The only premise that makes the Harlan argument valid. Nobody would approve it." }
  , { id := "P1",   speaker := .mayes,     status := .empirical,
      formal := "Judicial.Prediction.allSoFarAgainst",
      english := "Every ruling so far has gone against the pro-motion position." }
  , { id := "P3",   speaker := .mayes,     status := .probabilistic,
      formal := "Judicial.Prediction.scotusProbablyAgainst",
      english := "The prior rulings raise the probability that the Supreme Court rules the same way."
      note := "Reclassified from deductive. This is what she meant, and it is assertable." }
  , { id := "P4",   speaker := .mayes,     status := .unsupported,
      formal := "Judicial.Prediction.rulingsUniform",
      english := "All rulings on this question go the same way."
      note := "What deductive validity would cost. It would make the pending case pointless." }
  , { id := "S-P",  speaker := .mayes,     status := .empirical,
      formal := "Policy.S_particular",
      english := "The executive order now before the courts would create a stateless class." }
  , { id := "S-A",  speaker := .mayes,     status := .empirical,
      formal := "Policy.S_universal",
      english := "Any policy ending birthright citizenship creates a stateless class."
      note := "The strong reading. REFUTED by S-K. Which reading she holds is never settled aloud." }
  , { id := "S-K",  speaker := .krikorian, status := .empirical,
      formal := "Policy.K_alternative",
      english := "Some design ends birthright citizenship without creating a stateless class."
      note := "France's opt-in at 18, Australia's ten-year rule." }
  , { id := "V17",  speaker := .newman,    status := .normative,
      formal := "Normative.V17",
      english := "A child should not be penalized solely for a parent's conduct."
      note := "Not disputed by Cooper. The disagreement is over whether the policy falls under it." }
  , { id := "N-C",  speaker := .newman,    status := .interpretive,
      formal := "Normative.N_classification",
      english := "Ending birthright citizenship penalizes a child solely for parental conduct." }
  , { id := "C-A",  speaker := .cooper,    status := .interpretive,
      formal := "Normative.C_analogy",
      english := "Ending birthright citizenship is relevantly like recovering stolen money."
      note := "Extracted from the bank-robbery story. The entire analogy reduces to this one node." }
  , { id := "N-R",  speaker := .newman,    status := .interpretive,
      formal := "Normative.N_ownRight",
      english := "Citizenship by birth is the child's own entitlement, not a parental transfer." }
  , { id := "N-D",  speaker := .newman,    status := .interpretive,
      formal := "Normative.N_disanalogy",
      english := "Removing a person's own entitlement is not relevantly like recovering what they hold by transfer."
      note := "Was an environment field until run-birthright-3; red team 1 identified it as Newman's premise. Now his to defend." }
  , { id := "NB1",  speaker := .newman,    status := .normative,
      formal := "Motion.entrenchmentDecisive",
      english := "What the Constitution currently requires settles what America should do."
      note := "Never stated. Without it the anti-motion constitutional case does not reach the motion." }
  , { id := "NB2",  speaker := .cooper,    status := .normative,
      formal := "Motion.permissionIsReason",
      english := "If the Constitution does not require birthright citizenship, America should end it."
      note := "Never stated. Without it the pro-motion constitutional case does not reach the motion." }
  , { id := "G-S",  speaker := .shared,    status := .interpretive,
      formal := "Motion.suber",
      english := "Article V limits procedure, not content: any non-entrenched provision can lawfully be removed by amendment."
      note := "Suber's reading of Godel's loophole. Introduced by the protocol after the run; either side may contest it." }
  , { id := "G-E",  speaker := .shared,    status := .definitional,
      formal := "Motion.notEntrenched",
      english := "Birthright citizenship is not among the provisions Article V entrenches." }
  , { id := "G-A",  speaker := .shared,    status := .definitional,
      formal := "Motion.amendable",
      english := "The Constitution is amendable by the Article V process." }
  , { id := "G-C",  speaker := .shared,    status := .definitional,
      formal := "Motion.congressMayLegislate",
      english := "Where the Constitution does not require a provision, Congress may keep it by statute." }
  ]

def edges : List Edge :=
  [ { id := "E1",  premises := ["L1"], concl := "M0: born here implies citizen",
      verdict := .gap, witness := "Constitutional.gap_M0",
      note := "Mayes states the two-condition rule, then restates it with one." }
  , { id := "E2",  premises := ["L1", "M-JB"], concl := "M0",
      verdict := .certified, witness := "Constitutional.certified_M0" }
  , { id := "E3",  premises := ["M-C: cartel members are subject to jurisdiction"],
      concl := "M-K: these children are too",
      verdict := .gap, witness := "Constitutional.gap_cartelToChildren",
      note := "A claim about one class of people carries no information about another." }
  , { id := "E4",  premises := ["J17", "M-L"], concl := "M-K",
      verdict := .certified, witness := "Constitutional.certified_childrenJurisdiction",
      note := "The repair generalises the cartel example into J17 - which is what Krikorian denies." }
  , { id := "E5",  premises := ["L1", "J17", "M-L"], concl := "these children are citizens at birth",
      verdict := .certified, witness := "Constitutional.certified_mayesChain" }
  , { id := "E6",  premises := ["K1"], concl := "not J17",
      verdict := .refuted, witness := "Constitutional.krikorian_refutes_J17",
      note := "Mayes needs a universal, so Krikorian needs only one instance." }
  , { id := "E7",  premises := ["not J17"], concl := "these children are not citizens",
      verdict := .gap, witness := "Constitutional.gap_denyingTheAntecedent",
      note := "Refuting the route someone offered is not refuting where they were going." }
  , { id := "E8",  premises := ["K-R", "K-A"], concl := "these children fail the jurisdiction condition",
      verdict := .certified, witness := "Constitutional.certified_krikorianNoJurisdiction" }
  , { id := "E9",  premises := ["K-R", "K-A"], concl := "these children are not citizens at birth",
      verdict := .gap, witness := "Constitutional.gap_krikorianConclusion",
      note := "L1 gives a sufficient condition. Failing it settles nothing." }
  , { id := "E10", premises := ["K-R", "K-A", "K-EX"], concl := "these children are not citizens at birth",
      verdict := .certified, witness := "Constitutional.certified_krikorianConclusion" }
  , { id := "E11", premises := ["K1", "Mayes's conclusion"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Constitutional.compatible_K1_withMayesConclusion" }
  , { id := "E12", premises := ["A1", "A2"], concl := "A3: none of us would be citizens",
      verdict := .gap, witness := "Ancestry.gap_ancestry",
      note := "Closing one route to citizenship says nothing about the others." }
  , { id := "E13", premises := ["A1", "A2", "A4"], concl := "A3",
      verdict := .certified, witness := "Ancestry.certified_ancestry" }
  , { id := "E14", premises := ["one citizen of immigrant descent by another route"], concl := "not A4",
      verdict := .refuted, witness := "Ancestry.evidence_refutes_A4",
      note := "The extracted premise turns out to be an ordinary documentary question, and false." }
  , { id := "E15", premises := ["C1", "C2", "C3"], concl := "C4: Wong Kim Ark wrongly decided",
      verdict := .gap, witness := "Judicial.Harlan.gap_harlanAuthority",
      note := "Vindication in one case is not a premise about the merits of another." }
  , { id := "E16", premises := ["C5", "C3"], concl := "C4",
      verdict := .certified, witness := "Judicial.Harlan.certified_harlanAuthority",
      note := "Valid only on a premise nobody would approve. The productive repair routes back to K-R." }
  , { id := "E17", premises := ["P1", "P2"], concl := "the Supreme Court will rule against",
      verdict := .gap, witness := "Judicial.Prediction.gap_prediction" }
  , { id := "E18", premises := ["P4"], concl := "the Supreme Court will rule against",
      verdict := .certified, witness := "Judicial.Prediction.certified_prediction",
      note := "The price of validity. Better: reclassify as P3." }
  , { id := "E19", premises := ["S-K"], concl := "not S-A",
      verdict := .refuted, witness := "Policy.krikorian_refutes_universal" }
  , { id := "E20", premises := ["S-K", "S-P"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Policy.compatible_particular_and_alternative",
      note := "Heard as a decisive rebuttal. Against the weak reading it is not a rebuttal at all." }
  , { id := "E21", premises := ["S-P"], concl := "S-A",
      verdict := .gap, witness := "Policy.gap_domainSubstitution",
      note := "The moderator's intervention, formalised: evidence about one policy, conclusion about all." }
  , { id := "E22", premises := ["S-P"], concl := "some policy ending it creates a stateless class",
      verdict := .certified, witness := "Policy.certified_narrowed",
      note := "What the interface offers instead of rejecting the claim: narrow the conclusion." }
  , { id := "E23", premises := ["V17", "N-C"], concl := "the policy is impermissible",
      verdict := .certified, witness := "Normative.certified_newman" }
  , { id := "E24", premises := ["C-S: recovering stolen money penalizes no child"],
      concl := "C-T: ending birthright penalizes no child",
      verdict := .gap, witness := "Normative.gap_analogy" }
  , { id := "E25", premises := ["C-S", "C-A"], concl := "C-T",
      verdict := .certified, witness := "Normative.certified_analogy",
      note := "Minutes of vivid argument reduce to C-A. That is what an analogy is: a way of asserting a premise without stating it." }
  , { id := "E26", premises := ["N-D", "N-R", "C-P"], concl := "not C-A",
      verdict := .certified, witness := "Normative.certified_newmanBlocksAnalogy",
      note := "Newman's real reply, at the joint. The debate as held never reaches this point." }
  , { id := "E27", premises := ["the Constitution requires birthright citizenship"],
      concl := "America should not end it",
      verdict := .gap, witness := "Motion.gap_isOught",
      note := "Article V exists. Winning the constitutional branch does not settle the motion." }
  , { id := "E28", premises := ["the Constitution does not require it"], concl := "America should end it",
      verdict := .gap, witness := "Motion.gap_oughtFromPermission",
      note := "Symmetrically. Congress could keep it by statute." }
  , { id := "E29", premises := ["NB1", "the Constitution requires it"], concl := "America should not end it",
      verdict := .certified, witness := "Motion.certified_bridges" }
  , { id := "E30", premises := ["NB2", "the Constitution does not require it"], concl := "America should end it",
      verdict := .certified, witness := "Motion.certified_bridges'" }
  , { id := "E31", premises := ["G-S", "G-A", "G-E"], concl := "ending it is lawfully available",
      verdict := .certified, witness := "Motion.certified_lawfullyEndable",
      note := "Article V made load-bearing. Holds even where the Constitution currently requires it." }
  , { id := "E32", premises := ["G-S", "G-A", "G-E", "the Constitution requires it"], concl := "it cannot lawfully be ended",
      verdict := .gap, witness := "Motion.gap_requiresNotUnendable",
      note := "The anti-motion legal case, granted in full, leaves the motion where NB1 alone can carry it." }
  , { id := "E33", premises := ["G-C", "the Constitution does not require it"], concl := "keeping it is lawfully available",
      verdict := .certified, witness := "Motion.certified_lawfullyKeepable" }
  , { id := "E34", premises := ["G-C", "the Constitution does not require it"], concl := "it cannot lawfully be kept",
      verdict := .gap, witness := "Motion.gap_notRequiredNotUnkeepable",
      note := "Symmetrically: the pro-motion legal case leaves the motion where NB2 alone can carry it." }
  , { id := "E35", premises := ["L1", "J17", "M-L", "Mayes's conclusion"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Constitutional.position_witness_mayes",
      note := "Position witness (protocol 2.7): the environment is satisfiable and Mayes's whole position lives in it." }
  , { id := "E36", premises := ["L1", "K1", "K-R", "K-A", "K-EX", "Krikorian's conclusion"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Constitutional.position_witness_krikorian",
      note := "Position witness (protocol 2.7) for the pro-motion side." }
  ]

/-! ## Evidence layer: grades for the leaves

Every grade below was assigned by the author during reconstruction from general knowledge.
None of the provenance was inspected. This is recorded in each `basis` and in the report
header, and it is `docs/open-questions.md` Q17. The table exists so that the report shows
what the evidence layer *would* carry, and so that a real evidence run has a place to write. -/

open Debate.Evidence in
def evidence : List Debate.Evidence.Entry :=
  let unverified := "graded from general knowledge during reconstruction; not inspected (Q17)"
  [ { claim := "A4",  grade := .contradicted, basis := unverified,
      challenging := [{ source := "Naturalization Act of 1790", locator := "1 Stat. 103" }] }
  , { claim := "M-L", grade := .established, basis := "uncontested by both sides in the debate; consent, not inspection" }
  , { claim := "A2",  grade := .plausible, basis := unverified }
  , { claim := "C2",  grade := .stronglySupported, basis := unverified,
      supporting := [{ source := "Brown v. Board of Education (1954), overruling Plessy" }] }
  , { claim := "P1",  grade := .unresolved, basis := "not checked; the lower-court record at the debate date was not pulled" }
  , { claim := "S-P", grade := .unresolved, basis := "prediction about an order not yet in force; needs the order's text and a mechanism" }
  , { claim := "S-K", grade := .plausible, basis := unverified,
      supporting := [{ source := "French nationality code, acquisition at majority" },
                     { source := "Australian Citizenship Act 2007, ten-year rule" }] }
  , { claim := "K1",  grade := .unresolved, basis := "historical/interpretive; the run's evidence step was never taken",
      supporting := [{ source := "Elk v. Wilkins (1884)" }],
      challenging := [{ source := "United States v. Wong Kim Ark (1898)" }] }
  ]

/-! ## Tallies -/

def countStatus (s : Status) : Nat := (claims.filter (·.status == s)).length
def countVerdict (v : Verdict) : Nat := (edges.filter (·.verdict == v)).length

def summary : String :=
  "  edges certified .......... " ++ toString (countVerdict .certified) ++ "\n" ++
  "  edges refuted ............ " ++ toString (countVerdict .refuted) ++ "\n" ++
  "  edges with proved gaps ... " ++ toString (countVerdict .gap) ++
    "   (countermodel exhibited; no proof exists)\n" ++
  "  apparent clashes that are\n" ++
  "    not clashes ............ " ++ toString (countVerdict .compatible) ++ "\n\n" ++
  "  premises needing evidence  " ++ toString (countStatus .empirical) ++ "\n" ++
  "  premises that are\n" ++
  "    contested meanings ..... " ++ toString (countStatus .interpretive) ++ "\n" ++
  "  premises that are values . " ++ toString (countStatus .normative) ++ "\n" ++
  "  premises nobody stated,\n" ++
  "    but their own argument\n" ++
  "    requires ............... " ++ toString (countStatus .unsupported) ++ "   <-- read these first"

def unsupported : List Claim := claims.filter (·.status == .unsupported)

def render : String :=
  banner "PROOF-CARRYING DEBATE  --  Should America End Birthright Citizenship?\nOpen to Debate, June 2026.  For: Krikorian, Cooper.  Against: Mayes, Newman." ++
  rule "\nCLAIMS  (only PROVED would mean Lean validated it; nothing here is PROVED)" ++
  "\n" ++ String.intercalate "\n" (claims.map Claim.render) ++
  rule "\nEDGES  (every claimed inferential step)" ++
  "\n" ++ String.intercalate "\n" (edges.map Edge.render) ++
  rule "\nPREMISES NOBODY STATED" ++
  "\n" ++ String.intercalate "\n" (unsupported.map Claim.render) ++
  rule "\nEVIDENCE  (leaf grades; every grade below is a labelled judgement, nothing was inspected)" ++
  "\n" ++ String.intercalate "\n" (evidence.map Debate.Evidence.Entry.render) ++
  rule "\nSUMMARY" ++ "\n" ++ summary ++ "\n"

end Debate.Birthright.Ledger
