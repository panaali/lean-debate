import Debate.Birthright.Ledger
import Debate.DeathPenalty.Ledger

/-- `lake exe report` prints the birthright ledger; `lake exe report deathpenalty` the
death-penalty ledger; `lake exe report all` both. -/
def main (args : List String) : IO Unit :=
  match args with
  | ["deathpenalty"] => IO.println Debate.DeathPenalty.Ledger.render
  | ["all"] => do
      IO.println Debate.Birthright.Ledger.render
      IO.println Debate.DeathPenalty.Ledger.render
  | _ => IO.println Debate.Birthright.Ledger.render
