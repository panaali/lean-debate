import Debate.Protocol
import Debate.Evidence

/-!
# Death penalty: the ledger

Second debate run through the protocol. Chosen from titles only before reading
(`docs/runs/death-penalty/SETUP.md`); extracted by a separate agent; formalized in the six
sibling branch files. Every entry names the definition or theorem that backs it.
-/

namespace Debate.DeathPenalty.Ledger

open Debate

def claims : List Claim :=
  [ { id := "S13", speaker := .scheck, status := .empirical,
      formal := "Innocence.S13", english := "At least one innocent person has been executed."
      note := "DeLuna, Willingham. Scheidegger disputes Willingham; neither side engages the DNA count." }
  , { id := "S-T", speaker := .scheck, status := .unsupported,
      formal := "Innocence.S_threshold",
      english := "If any innocent has been executed, the risk is unacceptable."
      note := "The tolerable error rate. The moderator asked for it twice; nobody gave one." }
  , { id := "B-T", speaker := .blecker, status := .unsupported,
      formal := "Innocence.B_transfer",
      english := "A risk acceptable for convenience is acceptable for justice."
      note := "What the ceiling-and-Broadway analogy asserts without stating." }
  , { id := "R18", speaker := .blecker, status := .empirical,
      formal := "Innocence.Vocab.RiskInfinitesimal",
      english := "The risk of executing an innocent is infinitesimal; there is no 4 percent rate."
      note := "Against S11 (4.1 percent). Same proposition. Evidence layer." }
  , { id := "K-U", speaker := .scheidegger, status := .unsupported,
      formal := "Innocence.K_reviewDominates",
      english := "Funded review catches errors before execution often enough to outweigh the execution risk."
      note := "Needed for 'innocents are better off on death row'. Never stated." }
  , { id := "S4",  speaker := .scheck, status := .empirical,
      formal := "Deterrence.S4", english := "There is no persuasive evidence that the death penalty deters." }
  , { id := "K6",  speaker := .scheidegger, status := .empirical,
      formal := "Deterrence.K6", english := "Deterrence has not been disproved." }
  , { id := "S-D", speaker := .scheck, status := .unsupported,
      formal := "Deterrence.S_needsDeterrence",
      english := "The death penalty's justification requires deterrence."
      note := "Needed for 'we win that point'. Denied on the record by both opponents (K27, R12)." }
  , { id := "K-P", speaker := .scheidegger, status := .unsupported,
      formal := "Deterrence.K_perceive",
      english := "Prospective capital offenders perceive and weigh the difference between death and life."
      note := "Needed for 'incentives matter, so it deters'. Scheck and Rust-Tierney deny it; K32 partly answers." }
  , { id := "S-C", speaker := .scheck, status := .unsupported,
      formal := "Deterrence.S_comparable",
      english := "Other determinants of homicide are comparable across the compared states."
      note := "Needed for the Texas-versus-Vermont comparison. Scheidegger's correlation objection is this node." }
  , { id := "R8a", speaker := .blecker, status := .normative,
      formal := "Desert.R8a", english := "Some people deserve to die." }
  , { id := "R8b", speaker := .blecker, status := .normative,
      formal := "Desert.R8b", english := "Whoever deserves death, society is obliged to execute." }
  , { id := "R-S", speaker := .blecker, status := .unsupported,
      formal := "Desert.R_selects",
      english := "The system in practice executes only those who deserve it."
      note := "Needed to go from an obligation about the deserving to retaining the institution. It is the innocence question from the other side." }
  , { id := "D16", speaker := .rustTierney, status := .empirical,
      formal := "Desert.D16",
      english := "For everyone not among the worst of the worst, justice is served by a long sentence." }
  , { id := "K19", speaker := .scheidegger, status := .normative,
      formal := "Desert.K19",
      english := "For some of the worst, justice is not served without death." }
  , { id := "K2",  speaker := .scheidegger, status := .normative,
      formal := "Desert.K2", english := "Deterrence is a legitimate reason to punish." }
  , { id := "R12", speaker := .blecker, status := .normative,
      formal := "Desert.R12", english := "Deterrence is not a legitimate reason to punish."
      note := "The negation of K2, from the same side of the motion." }
  , { id := "S1",  speaker := .scheck, status := .normative,
      formal := "Desert.S1", english := "The question is decided by weighing costs against benefits."
      note := "Entered as framing; it is a premise. Blecker denies it (R34)." }
  , { id := "R34", speaker := .blecker, status := .normative,
      formal := "Desert.R34", english := "Desert cannot be traded off against costs." }
  , { id := "D8",  speaker := .rustTierney, status := .empirical,
      formal := "Race.D8", english := "Race of victim predicts a death sentence after legitimate controls."
      note := "Scheidegger denies; Blecker accepts. Evidence layer." }
  , { id := "D-R", speaker := .rustTierney, status := .unsupported,
      formal := "Race.D_reason",
      english := "A disparity in whom the penalty is sought against is a reason to abolish rather than to equalize."
      note := "Needed for 'race effect, therefore abolish'. Blecker offers equalizing instead." }
  , { id := "R21", speaker := .blecker, status := .interpretive,
      formal := "Race.R21", english := "The race-of-victim effect is real and does not show devaluation of Black life." }
  , { id := "R22", speaker := .blecker, status := .empirical,
      formal := "Race.R22", english := "The disparity is removable by removing the robbery aggravator." }
  , { id := "S24", speaker := .scheck, status := .probabilistic,
      formal := "Race.S24", english := "That redefinition will not happen." }
  , { id := "R5",  speaker := .blecker, status := .empirical,
      formal := "Alternative.R5", english := "Life in a maximum-security prison is relatively comfortable."
      note := "Scheck denies (S29). Same proposition. Evidence layer." }
  , { id := "R31", speaker := .blecker, status := .normative,
      formal := "Alternative.R31", english := "Loss of liberty is punishment."
      note := "Conceded." }
  , { id := "R35", speaker := .blecker, status := .normative,
      formal := "Alternative.R35",
      english := "The worst crime deserves the worst available punishment, which is death, so life is insufficient for the worst of the worst."
      note := "Stated. The only premise the prison footage was standing in for." }
  , { id := "F-B", speaker := .scheck, status := .unsupported,
      formal := "Motion.F_bridge",
      english := "A penalty with any of the identified defects should be abolished."
      note := "The For side's bridge from every empirical branch to the motion. Never stated." }
  , { id := "N-F", speaker := .rustTierney, status := .normative,
      formal := "Motion.N_perSe",
      english := "State killing is wrong in itself, so abolish even if fixed."
      note := "What the moderator's hypothetical asked for. Neither For speaker asserted it; S22 says others hold it." }
  , { id := "D13", speaker := .rustTierney, status := .probabilistic,
      formal := "Motion.D13", english := "The system cannot be fixed."
      note := "The answer actually given to the hypothetical: a prediction in place of a value." }
  , { id := "R17", speaker := .blecker, status := .normative,
      formal := "Motion.R17", english := "Justice is a fundamental value that warrants accepting very small risks of error."
      note := "The Against side's bridge. Stated." }
  ]

def edges : List Edge :=
  [ { id := "P1",  premises := ["S13"], concl := "the risk is unacceptable",
      verdict := .gap, witness := "Innocence.gap_executedToUnacceptable",
      note := "An executed innocent does not fix the tolerable rate at zero; that is a value." }
  , { id := "P2",  premises := ["S-T", "S13"], concl := "the risk is unacceptable",
      verdict := .certified, witness := "Innocence.certified_withThreshold" }
  , { id := "P3",  premises := ["we accept small risks for convenience", "R18"], concl := "the risk is acceptable",
      verdict := .gap, witness := "Innocence.gap_blecker",
      note := "The analogy does not carry without a transfer premise." }
  , { id := "P4",  premises := ["B-T", "we accept small risks for convenience", "R18"], concl := "the risk is acceptable",
      verdict := .certified, witness := "Innocence.certified_blecker",
      note := "The ceiling and Broadway reduce to B-T." }
  , { id := "P5",  premises := ["S13", "R18"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Innocence.compatible_executedAndInfinitesimal",
      note := "Named cases do not answer a rate claim. The clash is 4.1 percent versus infinitesimal." }
  , { id := "P6",  premises := ["death row brings funded review"], concl := "an innocent is better off on death row",
      verdict := .gap, witness := "Innocence.gap_reviewToBetterOff" }
  , { id := "P7",  premises := ["K-U", "death row brings funded review"], concl := "an innocent is better off on death row",
      verdict := .certified, witness := "Innocence.certified_reviewToBetterOff" }
  , { id := "P8",  premises := ["S4", "K6"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Deterrence.compatible_noEvidenceNotDisproved",
      note := "'No evidence' and 'not disproved' are the same state of knowledge. Heard as a rebuttal." }
  , { id := "P9",  premises := ["S4"], concl := "the penalty is not justified",
      verdict := .gap, witness := "Deterrence.gap_noEvidenceToUnjustified",
      note := "Desert may justify it. Scheck's 'we win that point' needs S-D." }
  , { id := "P10", premises := ["S-D", "S4"], concl := "the penalty is not justified",
      verdict := .certified, witness := "Deterrence.certified_noEvidenceToUnjustified",
      note := "Valid on a premise both opponents rejected aloud." }
  , { id := "P11", premises := ["incentives matter"], concl := "the penalty deters",
      verdict := .gap, witness := "Deterrence.gap_incentivesToDeterrence" }
  , { id := "P12", premises := ["K-P", "incentives matter"], concl := "the penalty deters",
      verdict := .certified, witness := "Deterrence.certified_incentivesToDeterrence" }
  , { id := "P13", premises := ["high-execution states have higher homicide"], concl := "no deterrent effect",
      verdict := .gap, witness := "Deterrence.gap_stateComparison",
      note := "Scheidegger's correlation objection, formalised: comparability is a premise." }
  , { id := "P14", premises := ["S-C", "high-execution states have higher homicide"], concl := "no deterrent effect",
      verdict := .certified, witness := "Deterrence.certified_stateComparison" }
  , { id := "P15", premises := ["R8a", "R8b"], concl := "society is obliged to execute someone",
      verdict := .certified, witness := "Desert.certified_obligation" }
  , { id := "P16", premises := ["society is obliged to execute someone"], concl := "retain the death penalty",
      verdict := .gap, witness := "Desert.gap_obligationToRetain",
      note := "An obligation about the deserving is not a verdict on an institution that may not select them." }
  , { id := "P17", premises := ["R-S", "society is obliged to execute someone"], concl := "retain",
      verdict := .certified, witness := "Desert.certified_obligationToRetain" }
  , { id := "P18", premises := ["D16"], concl := "justice never requires death",
      verdict := .gap, witness := "Desert.gap_mostToAll",
      note := "'Most' is not 'all'." }
  , { id := "P19", premises := ["D16", "K19"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Desert.compatible_D16_K19",
      note := "Scheidegger conceded the majority; she did not claim the worst. Not a disagreement." }
  , { id := "P20", premises := ["R12"], concl := "not K2",
      verdict := .refuted, witness := "Desert.refuted_K2_by_R12",
      note := "Intra-side. Blecker refutes his own partner's second reason." }
  , { id := "P21", premises := ["costs exceed benefits"], concl := "abolish",
      verdict := .gap, witness := "Desert.gap_costBenefit",
      note := "The cost-benefit framing is itself a premise." }
  , { id := "P22", premises := ["S1", "costs exceed benefits"], concl := "abolish",
      verdict := .certified, witness := "Desert.certified_costBenefit" }
  , { id := "P23", premises := ["D8"], concl := "abolish",
      verdict := .gap, witness := "Race.gap_effectToAbolish",
      note := "The effect, granted, could be answered by equalizing." }
  , { id := "P24", premises := ["D-R", "D8"], concl := "abolish",
      verdict := .certified, witness := "Race.certified_effectToAbolish" }
  , { id := "P25", premises := ["D8", "R21"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Race.compatible_D8_R21",
      note := "Blecker grants the effect. The dispute is its meaning." }
  , { id := "P26", premises := ["R22", "S24"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Race.compatible_R22_S24",
      note := "Feasibility is not mechanism." }
  , { id := "P27", premises := ["R5"], concl := "life is insufficient for someone",
      verdict := .gap, witness := "Alternative.gap_conditionsToInsufficient",
      note := "The footage does no logical work." }
  , { id := "P28", premises := ["R35", "someone is among the worst"], concl := "life is insufficient for someone",
      verdict := .certified, witness := "Alternative.certified_proportionality",
      note := "All premises normative and stated." }
  , { id := "P29", premises := ["R36", "not R5"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Alternative.compatible_R36_notComfortable",
      note := "Blecker's conclusion survives Scheck's denial of the conditions." }
  , { id := "P30", premises := ["F-B", "any identified defect"], concl := "abolish",
      verdict := .certified, witness := "Motion.certified_defectsToAbolish",
      note := "The For side's actual route to the motion, on its unstated bridge." }
  , { id := "P31", premises := ["F-B", "the defects are fixed"], concl := "abolish",
      verdict := .gap, witness := "Motion.gap_fixed",
      note := "The moderator's hypothetical, formalised." }
  , { id := "P32", premises := ["N-F", "state killing is wrong per se"], concl := "abolish",
      verdict := .certified, witness := "Motion.certified_fixedWithPerSe",
      note := "What the hypothetical was asking for. Not asserted." }
  , { id := "P33", premises := ["D13", "if fixed, keep it"], concl := "jointly satisfiable",
      verdict := .compatible, witness := "Motion.compatible_D13_keepIfFixed",
      note := "'It cannot be fixed' does not answer 'and if it could?'." }
  , { id := "P34", premises := ["For side's whole position"], concl := "satisfiable",
      verdict := .compatible, witness := "Motion.position_witness_for" }
  , { id := "P35", premises := ["Against side's whole position"], concl := "satisfiable",
      verdict := .compatible, witness := "Motion.position_witness_against" }
  ]

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
  banner "PROOF-CARRYING DEBATE  --  Abolish the Death Penalty\nIntelligence Squared U.S., April 2015 (transcript July 2026).  For: Scheck, Rust-Tierney.  Against: Scheidegger, Blecker." ++
  rule "\nDISPUTED NODES  (the debate, once the certified and gapped steps are removed)" ++
  "\n  S-T / R18 versus S11   what error rate is tolerable, and what the rate is\n" ++
  "  S-D                    whether justification requires deterrence\n" ++
  "  S1 versus R34          whether cost-benefit decides, or desert is untradeable\n" ++
  "  D8                     whether the race-of-victim effect survives controls\n" ++
  "  N-F                    whether state killing is wrong per se (never asserted)" ++
  rule "\nPREMISES NOBODY STATED" ++
  "\n" ++ String.intercalate "\n" (unsupported.map Claim.render) ++
  rule "\nCLAIMS  (only PROVED would mean Lean validated it; nothing here is PROVED)" ++
  "\n" ++ String.intercalate "\n" (claims.map Claim.render) ++
  rule "\nEDGES  (every claimed inferential step)" ++
  "\n" ++ String.intercalate "\n" (edges.map Edge.render) ++
  rule "\nSUMMARY  (tallies last, never as a score)" ++ "\n" ++ summary ++ "\n"

end Debate.DeathPenalty.Ledger
