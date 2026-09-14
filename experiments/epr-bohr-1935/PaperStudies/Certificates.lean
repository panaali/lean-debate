import Lean

/-!
Each report item carries an actual proof of an explicit proposition. Its declaration
name and proof term are generated from the same Lean identifier. English captions are
still editorial interpretations; the kernel does not check their meaning.
-/

namespace PaperStudies

structure Certificate where
  id : String
  description : String
  theoremName : String
  statement : Prop
  proof : statement

def Certificate.ofProof {p : Prop} (id description theoremName : String) (h : p) :
    Certificate :=
  ⟨id, description, theoremName, p, h⟩

syntax "checked " str str " using " ident : term

macro_rules
  | `(checked $id:str $description:str using $thm:ident) => do
    let name := Lean.Syntax.mkStrLit thm.getId.toString
    `(Certificate.ofProof $id $description $name @$thm)

def Certificate.render (c : Certificate) : String :=
  c.id ++ "  " ++ c.description ++ "\n  " ++ c.theoremName

end PaperStudies
