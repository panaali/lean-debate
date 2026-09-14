/-!
# Proof-carrying debate: the protocol layer

This file contains no debate content. It defines the vocabulary the protocol uses
to talk about a debate: what kinds of justification a claim can have, and what
kinds of verdict Lean can return about an inferential *edge* between claims.

The governing rule of the protocol is:

> A debater may assert any premise they like, provided it is labelled with the
> kind of justification it needs. But every claimed *inference* between premises
> must compile.

So `Status` classifies nodes (things asserted) and `Verdict` classifies edges
(things inferred). Only `Status.proved` means Lean has validated the node.
-/

namespace Debate

/-- The kind of justification a node in the argument graph requires.
Only `proved` is discharged by Lean; every other status names an obligation that
must be met *outside* the proof system (evidence agents, interpretation, values). -/
inductive Status where
  /-- Lean derives it from premises already accepted. -/
  | proved
  /-- Requires external evidence about the world. -/
  | empirical
  /-- Disputed meaning or classification of a term. -/
  | interpretive
  /-- An uncertain relationship; not a deductive claim. -/
  | probabilistic
  /-- A value judgement. -/
  | normative
  /-- A stipulated or agreed definition. -/
  | definitional
  /-- The speaker needs this to make their inference compile but has not asserted,
  defended, or (usually) noticed it. Extracted by the protocol, sent back for approval. -/
  | unsupported
deriving Repr, DecidableEq

def Status.label : Status → String
  | .proved        => "PROVED"
  | .empirical     => "EMPIRICAL"
  | .interpretive  => "INTERPRETIVE"
  | .probabilistic => "PROBABILISTIC"
  | .normative     => "NORMATIVE"
  | .definitional  => "DEFINITION"
  | .unsupported   => "UNSUPPORTED"

/-- Who asserted it. `shared` = fixed in the common environment before the debate,
and therefore not attackable by either side without reopening the environment. -/
inductive Speaker where
  | mayes | newman | krikorian | cooper | moderator | shared
deriving Repr, DecidableEq

def Speaker.label : Speaker → String
  | .mayes     => "Mayes"
  | .newman    => "Newman"
  | .krikorian => "Krikorian"
  | .cooper    => "Cooper"
  | .moderator => "Moderator"
  | .shared    => "SHARED"

/-- Which side of the motion "Should America end birthright citizenship?". -/
def Speaker.side : Speaker → String
  | .mayes | .newman     => "against motion"
  | .krikorian | .cooper => "for motion"
  | .moderator           => "-"
  | .shared              => "-"

/-- A node of the argument graph. `english` is the controlled-English view that the
debater actually approves; `formal` names the Lean definition carrying it. The debater
is never asked to approve Lean source. -/
structure Claim where
  id      : String
  speaker : Speaker
  status  : Status
  english : String
  formal  : String
  note    : String := ""

/-- What Lean can say about a claimed inferential step. -/
inductive Verdict where
  /-- The conclusion follows from the listed premises. The edge compiles. -/
  | certified
  /-- Lean derives the negation of the target claim from the listed premises. -/
  | refuted
  /-- Not merely "no proof found": a countermodel exists in which every premise holds
  and the conclusion fails, so no proof *can* exist. The step is invalid as stated. -/
  | gap
  /-- A model exists satisfying both claims, so they are not in logical conflict —
  whatever the rhetoric suggested. -/
  | compatible
deriving Repr, DecidableEq

def Verdict.mark : Verdict → String
  | .certified  => "[OK]  CERTIFIED "
  | .refuted    => "[X]   REFUTED   "
  | .gap        => "[!]   GAP       "
  | .compatible => "[~]   COMPATIBLE"

/-- An edge of the argument graph: a claimed inferential step, plus Lean's verdict
and the name of the theorem that settles it. -/
structure Edge where
  id       : String
  premises : List String
  concl    : String
  verdict  : Verdict
  witness  : String
  note     : String := ""

/-! ## Rendering -/

def pad (s : String) (n : Nat) : String :=
  if s.length < n then s ++ String.mk (List.replicate (n - s.length) ' ') else s

/-- Wrap `s` to `width` columns, indenting continuation lines by `indent` spaces. -/
def wrap (s : String) (width : Nat) (indent : Nat) : String :=
  let ind := String.mk (List.replicate indent ' ')
  let step := fun (acc : String × String) (w : String) =>
    let (out, line) := acc
    if line.isEmpty then (out, w)
    else if line.length + 1 + w.length ≤ width then (out, line ++ " " ++ w)
    else (out ++ line ++ "\n" ++ ind, w)
  let (out, line) := (s.splitOn " ").foldl step ("", "")
  out ++ line

def Claim.render (c : Claim) : String :=
  pad c.id 6 ++ pad c.status.label 14 ++ pad c.speaker.label 11 ++
  wrap c.english 68 31 ++
  (if c.note.isEmpty then "" else "\n" ++ pad "" 31 ++ "-- " ++ wrap c.note 65 34)

def Edge.render (e : Edge) : String :=
  e.verdict.mark ++ "  " ++ pad e.id 7 ++
  (if e.premises.isEmpty then "" else String.intercalate " + " e.premises ++ "  ==>  ") ++
  e.concl ++ "\n" ++ pad "" 26 ++ "by " ++ e.witness ++
  (if e.note.isEmpty then "" else "\n" ++ pad "" 26 ++ wrap e.note 70 26)

def banner (title : String) : String :=
  "\n" ++ String.mk (List.replicate 78 '=') ++ "\n" ++ title ++ "\n" ++
  String.mk (List.replicate 78 '=')

def rule (title : String) : String :=
  "\n" ++ title ++ "\n" ++ String.mk (List.replicate 78 '-')

end Debate
