**You:**

What type of discussions could be written in Lean, L-E-A-N? What type of argument or proof could be written there, and what type could not be done there? For example, in social sciences, can we use Lean?

* * *

**ChatGPT:**

Yes. Lean can be used in social science, but it helps to separate **formal validity** from **empirical or interpretive justification**.

Lean is a theorem prover: you state assumptions and definitions precisely, then prove that a conclusion follows from them. So the central question is not really “Is this mathematics?” but rather:

> **Can this argument be expressed with sufficiently precise definitions, assumptions, and inference rules?**

### What Lean is very good at

Lean works naturally for **deductive arguments**. For example:

> 1. Every person eligible under rule receives benefit .
> 2. Alice satisfies rule .
> 3. Therefore Alice receives benefit .

You can formalize the predicates, assumptions, and conclusion and have Lean verify that the conclusion actually follows.

Much more sophisticated examples are possible. In social science, Lean could formalize things such as:

* **Social choice theory:** proving properties of voting systems, Arrow-type results, majority relations, strategy-proofness.
* **Game theory:** Nash equilibria, preference relations, dominant strategies, bargaining models.
* **Economics:** properties of utility functions, equilibrium models, auction mechanisms, matching algorithms.
* **Political science:** formal coalition models, voting rules, legislative procedures, logical consequences of institutional rules.
* **Causal inference:** proving mathematical statements about estimators or identification given explicit causal assumptions.
* **Statistics:** proving that an estimator is unbiased, consistent, identifiable, etc., under specified assumptions.
* **Decision theory:** proving consequences of axioms concerning preferences or rational choice.
* **Formal theories of norms or institutions:** for example, “Given these rules about authority and delegation, is this decision procedurally valid?”

For instance, you could have a simplified Lean statement resembling:

```lean
theorem eligible_gets_benefit  (Eligible : Person → Prop)  (GetsBenefit : Person → Prop)  (rule : ∀ p, Eligible p → GetsBenefit p)  (alice_eligible : Eligible Alice) :  GetsBenefit Alice :=rule Alice alice_eligible
```

Lean certifies the **logical step** from the premises to the conclusion.

* * *

### Where things become more interesting in social science

Consider this argument:

> Increasing unemployment increases support for populist parties.

Lean cannot simply decide whether that statement is true about the world.

But you can formalize a more precise statement, such as:

> In model , assuming conditions , an increase in variable causes the equilibrium value of to increase.

Then Lean could potentially prove:

That is valuable, because Lean guarantees:

**If your assumptions and model are correct, the stated conclusion follows.**

It does **not** establish that describe actual societies.

That second question normally requires empirical evidence.

### What Lean cannot establish by proof alone

There are several important categories.

**1. Empirical premises**

Suppose you write:

> People with higher education are more politically tolerant.

Lean cannot prove this merely through logic. You need observations, surveys, experiments, administrative data, etc.

You could enter empirical facts as assumptions:

```
Assume: higher education causes greater tolerance.
```

Lean can reason from that assumption, but it hasn't independently established the assumption.

**2. Measurement validity**

Suppose a researcher defines:

> “Political tolerance” = score on questions 4–9 of this survey.

Lean can reason perfectly about the resulting variable.

It cannot prove, purely formally, that those six questions really measure the sociological concept of political tolerance. That requires substantive and methodological argument.

**3. Interpretive claims**

Consider:

> This interview suggests that the participant experiences migration primarily as a loss of identity.

You could construct a formal system representing rules of interpretation, but Lean cannot inherently determine that this is the best interpretation of the interview. Natural-language meaning, context, irony, cultural background, and competing readings don't automatically become mathematical propositions.

**4. Normative starting points**

For instance:

> Inequality of this kind is unjust.

You can formalize a theory of justice and prove:

> Given principles , this distribution is unjust.

But Lean does not prove that humanity **ought to accept** . Those are philosophical or normative commitments rather than logical consequences.

* * *

A useful way to visualize the boundary is:

| Claim | Lean? |
| --- | --- |
| “Given A and A → B, prove B” | **Yes** |
| “This voting system always has property X” | **Yes** |
| “Under this economic model, equilibrium exists” | **Yes** |
| “This estimator is unbiased under assumptions A–D” | **Yes** |
| “These causal assumptions imply identification” | **Yes** |
| “This survey found 61% support” | Data establishes it, not Lean |
| “The survey accurately represents the population” | Partly formalizable, partly empirical |
| “Education causes political tolerance” | Requires empirical/causal evidence |
| “This interview expresses alienation” | Primarily interpretive |
| “This policy is morally unjust” | Only relative to formalized normative premises |

And there is an important middle category: **arguments that contain both formal and non-formal components**. This is probably where Lean could become most interesting for social science.

Imagine an empirical paper whose reasoning is:

Lean could potentially verify substantial portions of the middle of that chain. It could make extremely explicit **exactly which assumptions are required for which conclusions**.

So a social scientist could say:

> “I am not asking Lean to prove that my theory of society is true. I am asking Lean to prove that, if my stated assumptions are accepted, my claimed conclusion really follows.”

That distinction is crucial.

In fact, this suggests a particularly interesting application of Lean outside pure mathematics: **formalizing the argumentative structure of a paper**. You could make assumptions, definitions, auxiliary results, causal assumptions, and conclusions machine-checkable, while leaving empirical evidence and interpretive judgments explicitly marked as external inputs.

That would not turn social science into mathematics. It would instead use formal verification to expose where **deduction ends and empirical, interpretive, or normative judgment begins**.

* * *

**You:**

How about discussions where two people are just arguing about something, just general discussions? Would we be able to write all of those in Lean? And what if it's like probabilistic or have some like quality that is not very quantitative?

* * *

**ChatGPT:**

Not all ordinary discussions can be meaningfully written as Lean proofs.

There are two different senses of “write it in Lean.” You could always store the sentences as text, but that does nothing interesting. The stronger sense is: **translate what the speakers mean into formal propositions so Lean can check which conclusions follow.** That is only possible to the extent that the meanings and inference rules can be made precise.

Suppose two people argue:

> A: “Remote work makes people less productive.”  
> B: “I don't think so. It depends on the kind of work, and some people actually concentrate better at home.”

There isn't yet a clean proposition for Lean to prove. Terms like “productive,” “depends,” “some people,” and even “remote work” need definitions. Once you formalize them, you might get something like:

Now you've created something Lean can reason about—but notice that **you have changed the conversation into a model**.

### Probabilistic arguments are quite possible

Probability itself isn't a problem. Lean can formalize probability theory, Bayesian reasoning, expectations, distributions, statistical models, and statements such as

meaning “evidence makes hypothesis more likely.”

So imagine:

> A: “I think John probably took the train because his car is in the shop.”  
> B: “But his wife could have driven him.”

You could model competing hypotheses:

and assign probabilities to evidence. Lean could then verify that your Bayesian calculation is correct.

But Lean doesn't magically know:

Someone has to supply or justify that number or probability model.

### The harder case is qualitative reasoning

Consider:

> “The movie was pretty good, but the ending felt emotionally dishonest.”

What exactly is _emotionally dishonest_?

You can certainly invent a formal predicate:

```lean
EmotionallyDishonest : Movie → Prop
```

and state:

```lean
EmotionallyDishonest movie
```

But that hasn't captured the reasoning that caused the speaker to make the judgment.

Ordinary discussion contains a lot of things whose meanings are **open-textured**:

* “fair”
* “reasonable”
* “mostly responsible”
* “kind of authoritarian”
* “more authentic”
* “probably”
* “usually”
* “a serious problem”
* “similar enough”
* “better”
* “socially acceptable”

There may not be one uniquely correct mathematical definition of any of these.

And there is an even deeper issue. People often make **defeasible** arguments:

> Birds normally fly.  
> Tweety is a bird.  
> Therefore Tweety probably flies.

Then someone says:

> Tweety is a penguin.

And we withdraw the conclusion.

Classical deductive reasoning doesn't behave that way: once a theorem is proved from fixed premises, additional premises don't normally make it “unproved.” Ordinary human argument uses defaults, exceptions, uncertain evidence, changing beliefs, analogies, relevance judgments, and so on.

You **can build formal systems for these things inside Lean**—probabilistic logic, fuzzy logic, defeasible logic, argumentation frameworks, modal logic, belief revision, etc. Lean is flexible enough to implement the formal system and prove properties about it.

But there is a crucial distinction:

> **Lean can verify reasoning inside whatever formal system you specify. It cannot guarantee that your formal system faithfully captures what the two people actually meant.**

So I would imagine a spectrum:

**Very formal:**

> “All X are Y; A is X; therefore A is Y.”

Nearly completely Lean-able.

**Probabilistic:**

> “Given these observations, hypothesis A is considerably more plausible than hypothesis B.”

Lean-able **once the probability model and evidence are specified**.

**Qualitative but structured:**

> “Policy A seems fairer than policy B because it distributes the burden according to ability to pay.”

Parts can be formalized, but concepts such as _fairness_ require an explicit theory.

**Highly interpretive:**

> “His remark was technically polite but obviously condescending.”

Formalizing this without losing much of its meaning becomes very difficult.

**Loose conversation:**

> “I don't know, it just feels like we're missing the bigger picture.”

There's generally no useful Lean theorem hiding there until somebody specifies what “bigger picture” means.

So the interesting limit isn't really **quantitative versus qualitative**. A qualitative concept can be formal if its rules are precise, while a numerical claim can be impossible to justify if its numbers are arbitrary.

The real divide is approximately:

versus

And that raises a fascinating possibility: you could formalize **only part of a real argument** in Lean and deliberately leave other steps marked as judgments or empirical assumptions. That might actually be more informative than trying to force the entire conversation into formal logic, because you could see exactly **which disagreements are logical disagreements and which are disagreements about meaning, evidence, probabilities, or values**.

* * *

**You:**

read https://80000hours.org/podcast/episodes/geoffrey-irving-superintelligence-alignment-theory/#transcript in full

* * *

**ChatGPT:**

Done. I’ve read the full transcript and will treat it as context for our discussion, including Irving’s sections on **fuzzy/non-verifiable tasks, AI debate and obfuscated arguments, mathematical models of alignment, scalable oversight, personas, and automating conjecture/proof/counterexample search**. [![](https://www.google.com/s2/favicons?domain=https://80000hours.org&sz=128)80,000 Hours+2![](https://www.google.com/s2/favicons?domain=https://80000hours.org&sz=128)80,000 Hours+2](https://80000hours.org/podcast/episodes/geoffrey-irving-superintelligence-alignment-theory/)

Go ahead with your question about it.

* * *

**You:**

I want to know if we can force the debater to always specify their argument in lean and so avoid the issue that Geoffrey mentioned for two physicist debating and one come up with mushy argument.

* * *

**ChatGPT:**

Yes. **If the physics debate Irving describes can be fully formalized, requiring each debater to submit a Lean-checkable proof would directly block the particular “mushy false argument” failure mode.** Irving’s example is precisely that a false, complicated argument could sound plausible while neither the honest debater nor the liar could identify its hidden flaw. [![](https://www.google.com/s2/favicons?domain=https://80000hours.org&sz=128)80,000 Hours](https://80000hours.org/podcast/episodes/geoffrey-irving-superintelligence-alignment-theory/)

The reason Lean changes the game is important: the opponent no longer has to _find the flaw_. The claimant has to produce a proof object, and Lean’s small trusted kernel checks whether that proof actually follows from the declared definitions, theorems, and axioms. [![](https://www.google.com/s2/favicons?domain=https://lean-lang.org&sz=128)Lean Language+1](https://lean-lang.org/doc/reference/latest/ValidatingProofs/?utm_source=chatgpt.com)

So imagine the debate question has two possible answers, and , and everyone agrees on a formal theory . Instead of allowing:

> “Here is a 20-paragraph physics argument for .”

you require:

```lean
theorem answer_is_A (Γ...) : A := by  ...
```

If there is a subtle invalid inference on line 48 of the human argument, **it doesn't matter whether the honest debater can spot it.** Unless the liar can actually construct a valid proof of `A`, Lean rejects it.

That is a substantial response to Irving's obstacle.

### But there is a new attack surface

Lean establishes something narrower than:

> “What this debater says about reality is true.”

It establishes:

In words:

> **A follows from the formal assumptions Γ.**

So the dishonest debater's strategy shifts upward. Instead of hiding a bad inference _inside the proof_, they can try to hide the problem in the **formalization**.

For example:

Natural-language question:

> “Will this physical system remain stable?”

Debater submits a beautiful Lean theorem:

```lean
theorem system_stable    (h1 : friction = 0)    (h2 : temperature = 0)    (h3 : system_is_closed)    ...    : Stable system := by   ...
```

The proof might be flawless.

But perhaps the real system isn't closed, temperature isn't zero, or their definition of `Stable` isn't what the judge intended.

Lean cannot save you from that automatically.

And allowing arbitrary axioms would make the protocol almost useless. Lean itself explicitly warns that false or inconsistent axioms undermine proofs. [![](https://www.google.com/s2/favicons?domain=https://lean-lang.org&sz=128)Lean Language](https://lean-lang.org/doc/reference/latest/Axioms/?utm_source=chatgpt.com)

So I think the strongest version of your idea is **not merely “all arguments must be in Lean.”** It is something like a **proof-carrying debate protocol** with several layers:

1. **Formal question fixed in advance.**  
    Both debaters have to answer exactly the same Lean proposition.
2. **Trusted common environment fixed in advance.**  
    Definitions, physical laws, mathematical libraries, permitted empirical observations, etc. cannot be silently changed by a debater.
3. **Every deductive claim must carry a Lean proof.**  
    No “therefore clearly…” paragraphs count as evidence.
4. **Any new assumption must be explicitly exposed.**  
    For example:
    
    ```lean
    assumption h : Independent X Y
    ```
    
    rather than hiding it in prose.
5. **The debate focuses on assumptions that cannot themselves be proved.**  
    The human/weak judge can then ask much simpler questions:
    * Does this assumption actually describe the experiment?
    * Is this measurement trustworthy?
    * Is this definition what we meant by “stable”?
    * Is this approximation legitimate?

This is potentially a **much nicer scalable-oversight decomposition**.

Instead of asking a weak judge to understand:

you divide it into:

Lean completely handles the first box.

The oversight system only has to supervise the second.

* * *

### In Irving's exact physics example

He says the problematic strategy was a sufficiently complicated false argument where neither debater could locate the flaw; consequently it appeared to be a plausible argument with no rebuttal. [![](https://www.google.com/s2/favicons?domain=https://80000hours.org&sz=128)80,000 Hours](https://80000hours.org/podcast/episodes/geoffrey-irving-superintelligence-alignment-theory/)

Under your protocol:

**Liar:** “Answer is . Here's my argument.”

**Protocol:** “Give me `proof : A`.”

If Lean says ❌, the argument loses.

The honest debater doesn't have to say:

> “Somewhere around equations 63–94 something feels wrong, but I can't tell you what.”

The debate protocol simply says:

> **No valid certificate, no accepted deductive claim.**

That seems like a genuine improvement over the protocol Irving describes.

There is even an important asymmetry here. **Proof generation can be extremely difficult while proof checking can remain mechanically reliable.** Lean's tactics and AI assistance may be complicated, but ultimately they construct proof terms that are independently checked by the kernel. [![](https://www.google.com/s2/favicons?domain=https://lean-lang.org&sz=128)Lean Language](https://lean-lang.org/doc/reference/latest/Tactic-Proofs/?utm_source=chatgpt.com)

So you don't necessarily need the judge to be as intelligent as the debater.

* * *

### But this doesn't solve all of Irving's problem

There are three important remaining cases.

**A. The answer is mathematically/formally expressible.**

This is the ideal situation.

> “Given this model, is trajectory X possible?”

Potentially excellent for your scheme.

**B. The conclusion depends on empirical facts.**

For example:

> “Does this particular material become superconducting under these conditions?”

Lean could verify:

but it won't perform the experiment. Someone must establish the empirical premises.

**C. The question itself is fuzzy.**

For example:

> “Which research strategy looks most promising?”

or

> “Is this explanation more scientifically plausible?”

There may be no agreed Lean proposition corresponding to the question. Formalizing it could throw away exactly the information we care about.

And Irving explicitly discusses this broader distinction: current models differ in their performance on cleanly verifiable tasks versus “fuzzier” tasks involving intuition and planning. [![](https://www.google.com/s2/favicons?domain=https://80000hours.org&sz=128)80,000 Hours](https://80000hours.org/podcast/episodes/geoffrey-irving-superintelligence-alignment-theory/)

So I wouldn't claim:

I'd claim something more interesting:

That could be extremely valuable.

In fact, I think **your proposal points toward a concrete modification of AI debate that is stronger than ordinary natural-language debate**:

> **Every claim that purports to be a logical consequence must come with a machine-checkable certificate; natural-language debate is permitted only over the premises, definitions, formalization, and external evidence.**

Then the “mush” has nowhere to hide _inside the deductive chain_.

It can still hide in **what was formalized**, **what was assumed**, or **what was omitted**. But those are much more localized objects for the opponent/judge to attack.

And interestingly, Irving himself says immediately before the physics example that one goal of theory would be to obtain proofs of success and failure for scalable-oversight algorithms in toy settings. [![](https://www.google.com/s2/favicons?domain=https://80000hours.org&sz=128)80,000 Hours](https://80000hours.org/podcast/episodes/geoffrey-irving-superintelligence-alignment-theory/) So what you're suggesting is quite closely connected to his own theoretical direction—except you're proposing to put the formal verification **inside the debate protocol itself**, not merely use it to analyze the protocol from the outside.

That distinction seems worth exploring.

* * *

**You:**

look at https://opentodebate.substack.com/ debates, maybe find transcript of one of them as example and then tell me if we can have assistant AIs converting what the debators are saying to lean for them and the debators should approve/reject/ask for revise of the lean statement. I want to know if we can use lean for such discussions? I understand the evidence etc is a separate thing that lean doesn't validate. maybe another AI can try to find the accuracy and credability of the evidences. for example if it's about hillary clinton email files,  it's on net and could be verified. etc.

* * *

**ChatGPT:**

Yes. After looking at an actual Open to Debate transcript, I think your architecture is viable—and potentially much more useful than requiring the debaters themselves to know Lean.

The important modification is: **Lean should be the formal verification layer behind the debate, not the language humans have to speak.**

I used the June 2026 debate _“Should America End Birthright Citizenship?”_ as a test case. It is particularly useful because the discussion mixes constitutional interpretation, historical claims, predictions, statistics, analogies, and values. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

### A concrete example

Kris Mayes argues that the Fourteenth Amendment establishes birthright citizenship and then summarizes her position roughly as “if you are born here, you are a citizen.” [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

An assistant AI should **not** silently turn that into:

```lean
∀ p, BornInUS p → USCitizen p
```

because the actual constitutional language contains another condition: being “subject to the jurisdiction” of the United States. That phrase then becomes precisely what the opposing debaters dispute. Krikorian explicitly says the debate is over what that phrase means. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

A better formalization would look conceptually like:

```lean
axiom citizenship_clause :  ∀ p : Person,    BornInUS p →    SubjectToJurisdictionUS p →    USCitizen p
```

Now suppose Mayes's argument really depends on:

```lean
claim mayes_jurisdiction :  ∀ p : Person,    BornInUS p →    SubjectToJurisdictionUS p
```

while the other side rejects that characterization for certain children.

**That's excellent for your system.**

The original natural-language disagreement:

> “That's obviously what jurisdiction means.”

versus

> “No, that's not what the framers meant.”

gets transformed into a clearly visible disputed node:

The subsequent deduction can be machine checked. The dispute over that premise cannot.

And that's still enormously useful.

* * *

## I think your debate system should work like this

Imagine Debater A says:

> “Ending birthright citizenship would create a large population of stateless people, which would produce serious administrative problems.”

They don't touch Lean.

An **AI formalizer** immediately decomposes the statement into perhaps:

```
C1: Ending birthright citizenship substantially increases    the number of stateless US-born residents.
C2: A sufficiently large stateless US-born population    creates substantial administrative costs.
C3: Policies creating substantial avoidable administrative    costs count against adoption.
Therefore:C4: This consequence counts against ending    birthright citizenship.
```

Alongside that, it generates Lean representations.

The debater sees something like:

> **I understand you as claiming:**  
> If birthright citizenship ends under the policy being discussed, the expected number of stateless US-born residents increases substantially; this creates administrative costs; and you regard those costs as a reason against the policy.
> 
> **Approve / Revise / Reject**

They don't necessarily even need to see the Lean code.

If they press **Approve**, that formal statement becomes their official claim.

The Lean representation underneath might look roughly like:

```lean
def A := EndsBirthrightCitizenship policydef B := LargeIncrease StatelessUSBorndef C := SeriousAdministrativeBurden
axiom empirical_1 : A → Baxiom empirical_2 : B → Caxiom normative_1 : C → CountsAgainst policy
theorem argument : A → CountsAgainst policy := by  intro hA  exact normative_1 (empirical_2 (empirical_1 hA))
```

Lean verifies the last step.

But it also makes extremely obvious that there are **three leaves that Lean hasn't established**:

```
EMPIRICAL:A → B
EMPIRICAL/PREDICTIVE:B → C
NORMATIVE:C → CountsAgainst policy
```

Those are now things the other debater—or other AIs—can attack.

That is much cleaner than attacking an entire paragraph.

Lean's kernel is specifically designed to check proof terms, so the logical dependency checking here is exactly the sort of task Lean is good at. [![](https://www.google.com/s2/favicons?domain=https://lean-lang.org&sz=128)Lean Language+1](https://lean-lang.org/doc/reference/latest/?utm_source=chatgpt.com)

* * *

# Your second AI: evidence verification

I think this is the other half of the system.

You don't want to ask Lean:

> “Is empirical premise E true?”

You want another subsystem to attach **evidence objects** to E.

So the debate graph might contain:

```
CLAIM E27"There were N instances of X between dates D1 and D2."
Status: EMPIRICAL
Evidence:  Source 1: government dataset  Source 2: contemporaneous document  Source 3: peer-reviewed analysis
Evidence-verification AI:  ✓ source exists  ✓ quotation accurate  ✓ dates match  ✓ source actually supports proposition  △ disagreement about interpretation
```

Then Lean gets something analogous to:

```lean
axiom E27 : Instances X D1 D2 = N
```

but importantly the UI would **not** pretend Lean proved `E27`.

It would say:

> `E27` — externally supported premise  
> Confidence/evidence status: ...

And then Lean can tell us exactly **which conclusions depend on E27**.

That's powerful.

* * *

## Your Hillary Clinton email example fits this architecture

There are primary-source government records online relating to the Clinton email investigation, including FBI-released investigation documents in the FBI Vault. [![](https://www.google.com/s2/favicons?domain=https://www.fbi.gov&sz=128)FBI+1](https://www.fbi.gov/news/press-releases/fbi-releases-documents-in-hillary-clinton-e-mail-investigation?utm_source=chatgpt.com)

Suppose somebody says:

> “Clinton said X in an email on date Y.”

The evidence AI can do something like:

1. locate the purported email/document;
2. determine whether it comes from an authentic archive or a secondary reproduction;
3. match sender, recipient, date and text;
4. determine whether the quoted sentence actually occurs;
5. provide document provenance;
6. separate the actual document from someone's interpretation of it.

Then the system can establish something like:

```
DOCUMENT FACT:Document D contains string S.
PROVENANCE:D comes from archive A.
INTERPRETATION:S implies Clinton believed proposition P.
```

The first two may be strongly externally verifiable.

The third can still be controversial.

And that's precisely the distinction you want the debate system to expose.

* * *

# What happens with probabilistic claims?

These actually fit reasonably well.

Mathlib already contains substantial formal probability theory—probability measures, conditional probability, conditional expectation, independence, random variables, and related machinery. [![](https://www.google.com/s2/favicons?domain=https://leanprover-community.github.io&sz=128)Lean Community+1](https://leanprover-community.github.io/mathlib-overview.html?utm_source=chatgpt.com)

A debater might say:

> “Given A, I think B becomes significantly more likely.”

The assistant could propose:

and ask:

> Is that what you mean?

Maybe the debater says:

> “Yes, but I don't mean I know the exact probability.”

That's fine.

You don't have to assign `0.73`.

You can formalize merely:

```lean
P(B | A) > P(B)
```

or:

```lean
P(B | A) > P(B | ¬A)
```

or even an ordinal relationship:

```
B is more plausible given A than without A.
```

You can build an appropriate formal system for that.

So **non-numerical uncertainty isn't necessarily a problem.**

* * *

# What about very qualitative statements?

This is where I would _not_ force everything into Lean.

In the Open to Debate transcript, Newman says that the policy idea violates something “fundamentally American,” while other portions concern fears, national identity, fairness, and what kind of country America should be. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate+1](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

Consider:

> “You shouldn't punish children for what their parents did.”

An assistant could extract:

```
VALUE PRINCIPLE V17:Children should not bear adverse legal consequencessolely because of their parents' wrongdoing.
```

That's already useful.

You could encode it in Lean:

```lean
axiom child_nonpunishment :  ∀ c,    SoleCause (ParentWrongdoing c) →    ¬ Permissible (Penalize c)
```

But Lean doesn't prove the moral principle.

And that's okay.

It can still establish:

```
V17+Policy P penalizes children solely because of parental wrongdoing─────────────────────────────────────────────Policy P is impermissible
```

The deduction is formally valid.

The debate then becomes:

**Debater B can attack V17**, or more likely:

> “I accept V17, but denying automatic citizenship isn't a punishment.”

Excellent.

Now the disagreement has become:

```
DISPUTED CLASSIFICATION:
Does denying automatic citizenship count as"penalizing the child"?
```

That's much more informative than two people talking past each other.

* * *

# The most important thing: don't require every utterance to become a theorem

I would distinguish at least six types of debate objects:

| Type | Example | Lean's role |
| --- | --- | --- |
| Deductive | A and A→B, therefore B | **Verify completely** |
| Empirical | “There were 700 cases” | Treat as externally verified premise |
| Probabilistic | “A makes B more likely” | Formalize probability relationship |
| Interpretive | “This law means X” | Formalize competing interpretations |
| Normative | “X is unfair” | Explicit value premise |
| Rhetorical/analogy | “This is like punishing the child” | Extract proposed underlying inference |

That prevents the project from failing because someone says:

> “This policy just feels deeply un-American.”

Instead of replying **“cannot compile”**, the formalizer says:

> I think you're proposing the value claim:
> 
> **V21:** A policy that makes citizenship depend on ancestry conflicts with the speaker's conception of American civic equality.
> 
> Is that an accurate representation?
> 
> **Approve / Revise / Reject**

That's the important human-in-the-loop component you proposed.

* * *

# But I would change “approve the Lean statement” slightly

I wouldn't make the debaters approve **Lean source code**.

That creates another scalable-oversight problem: how do they know the generated code actually means what the AI says it means?

Instead, every formalization should have three synchronized views:

```
ORIGINAL:"If you're born here, you're a citizen."
CONTROLLED ENGLISH:For every person x, if x was born in the United Statesand x is subject to US jurisdiction, then x is a US citizen.
FORMAL:∀ x : Person,  BornInUS x →  SubjectToUSJurisdiction x →  USCitizen x
```

And then:

**Approve meaning / Request revision / Reject formalization.**

The system can additionally run a second independent AI that **back-translates the Lean into natural language**.

If:

```
speech → AI1 → Lean → AI2 → English
```

doesn't preserve meaning, flag it.

That matters because current autoformalization research is advancing quickly, but even translating mathematical natural language into Lean remains a research problem involving both type correctness and **semantic fidelity**. Recent systems such as ProofBridge explicitly evaluate semantic equivalence rather than treating “Lean code compiles” as sufficient. [![](https://www.google.com/s2/favicons?domain=https://arxiv.org&sz=128)arXiv](https://arxiv.org/abs/2510.15681?utm_source=chatgpt.com) Existing work is also overwhelmingly concentrated on mathematical language, so extending the approach to unrestricted political/social debate would be a substantial research problem, not merely an engineering wrapper around today's mathematical autoformalizers. [![](https://www.google.com/s2/favicons?domain=https://arxiv.org&sz=128)arXiv+1](https://arxiv.org/abs/2507.11275?utm_source=chatgpt.com)

* * *

# And this could address Irving's “mushy argument” problem in a stronger way than I initially described

The crucial object wouldn't actually be a linear Lean proof.

It would be an **argument dependency graph**:

```
                         ┌── E12 [empirical]                         │                 ┌── C7 ─┤                 │       └── I4 [interpretive]                 │FINAL CLAIM ─────┤                 │       ┌── E19 [empirical]                 └── C9 ─┤                         └── V3 [normative]
```

Every internal arrow that is supposed to be deductive is Lean-checked.

Every leaf is explicitly typed:

```
✓ FORMALLY PROVED✓ SOURCE VERIFIED? EMPIRICAL DISPUTE? INTERPRETATION DISPUTE? VALUE DISAGREEMENT? PROBABILISTIC ASSUMPTION
```

Now imagine Irving's deceptive AI produces 30 minutes of incredibly sophisticated mush.

Your system doesn't ask the opponent:

> “Find the flaw.”

It asks the deceptive AI:

> **Please convert that argument into this dependency graph and certify every deductive edge.**

If it can't:

> **Unverified inference.**

If it can, then there is no hidden logical error inside those edges. The attack has to reside in one of the exposed leaves—false evidence, questionable semantics, bad probability assumptions, a dubious value premise, etc.

That is a **much smaller search space for the honest debater and the judge**.

I think that's the core of the idea.

It doesn't solve truth in general. But it could transform debate from:

into:

And **that seems very relevant to the failure mode Geoffrey Irving was worried about.**

The next interesting step would be to take perhaps **5–10 actual minutes of this Open to Debate transcript** and manually construct what this system would output: the individual claims, Lean-like propositions, evidence leaves, normative leaves, disputed definitions, and machine-checkable deductions. That would tell us much more concretely whether the architecture works on real political argument rather than toy examples.

* * *

**You:**

yeah lets do that

* * *

**ChatGPT:**

Yes. This segment makes the architecture much more concrete. I’d freeze the record at the **June 6, 2026 debate itself** rather than use later legal developments to decide who “won.”

I used roughly **23:39–30:08**. In those six-and-a-half minutes, Kris Mayes argues from the Fourteenth Amendment and _Wong Kim Ark_; Horace Cooper disputes the historical interpretation; Mark Krikorian focuses on the meaning of “subject to the jurisdiction thereof” and gives a purported historical counterexample; then the discussion shifts to statelessness and implementation consequences. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)opentodebate.substack.com](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

## 1. Start with the proposition being debated

The overall question,

is **not itself a good Lean theorem**. “Should” bundles legal, empirical, predictive, and normative questions together.

The system should decompose it:

| ID | Proposition | Type |
| --- | --- | --- |
| L1 | The Constitution presently requires citizenship for category | Legal/interpretive |
| H1 | “Subject to jurisdiction” historically meant | Historical/interpretive |
| E1 | Ending automatic citizenship would produce substantial statelessness | Empirical/predictive |
| A1 | Alternative administrative systems can avoid statelessness | Empirical/policy-design |
| V1 | Creating a substantial stateless population strongly counts against a policy | Normative |
| FINAL | America should retain/end birthright citizenship | Normative conclusion |

Lean can connect these nodes. It doesn't have to establish every leaf.

* * *

# 2. Mayes makes a nearly perfect formalization candidate

Mayes points to the Citizenship Clause and argues, in effect:

> born in the United States + subject to U.S. jurisdiction → U.S. citizen.

That structure directly reflects the constitutional text; the official Constitution Annotated describes the Citizenship Clause in those terms. [![](https://www.google.com/s2/favicons?domain=https://constitution.congress.gov&sz=128)Congress.gov+1](https://constitution.congress.gov/browse/essay/amdt14-S1-1-2/ALDE_00000812/?utm_source=chatgpt.com)

Our formalization AI might propose:

```lean
constant Person : Typeconstant BornInUS : Person → Propconstant SubjectToUSJurisdiction : Person → Propconstant USCitizen : Person → Prop
axiom citizenship_clause :  ∀ p : Person,    BornInUS p →    SubjectToUSJurisdiction p →    USCitizen p
```

The AI shows Mayes controlled English:

> **L1:** For every person, if that person was born in the United States and is subject to the jurisdiction of the United States in the constitutional sense, then that person is a U.S. citizen.

And asks:

**Approve / Revise / Reject**

Mayes presumably approves something near this.

Notice that we've already improved the debate. Her conversational shorthand at one point is effectively “born here → citizen,” but her more detailed argument acknowledges the jurisdiction phrase. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)opentodebate.substack.com](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

So the AI should **not** silently formalize:

```lean
BornInUS p → USCitizen p
```

because that would erase precisely the condition being disputed.

* * *

# 3. Now we hit the real disagreement

Mayes then offers an argument based on legal accountability: people such as cartel members can be arrested, prosecuted, and subjected to U.S. law; therefore she argues they are subject to U.S. jurisdiction. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)opentodebate.substack.com](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

The formalizer might propose:

### Mayes M1

> If a person is legally answerable to U.S. criminal law, that person is “subject to the jurisdiction” of the United States for purposes of the Citizenship Clause.

Represent it as:

```lean
constant LegallyAnswerableToUS : Person → Prop
axiom mayes_jurisdiction_bridge :  ∀ p,    LegallyAnswerableToUS p →    SubjectToUSJurisdiction p
```

**And this should immediately get a special warning:**

> ⚠️ **INTERPRETIVE BRIDGE**  
> This is not a theorem of logic. It identifies an ordinary/legal concept (“legally answerable to”) with a disputed constitutional concept (“subject to the jurisdiction thereof”).

That's exactly the sort of thing Lean is useful for exposing.

* * *

# 4. Krikorian then gives a counterexample-shaped argument

Krikorian's response is particularly interesting for your idea.

He argues that Native Americans living on reservations could be prosecuted for offenses, yet were understood at the relevant historical period as outside the Citizenship Clause's jurisdiction condition. He uses this to reject Mayes's equation of “can be prosecuted” with the constitutional meaning of “subject to jurisdiction.” [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)opentodebate.substack.com](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

Abstract away from whether his historical claim is correct.

His logical argument is:

therefore it is false that

**That part is completely Lean-able.**

```lean
theorem counterexample_refutes_bridge    (Person : Type)    (P J : Person → Prop)    (h : ∃ p, P p ∧ ¬ J p) :    ¬ ∀ p, P p → J p := by  intro rule  rcases h with ⟨p, hp, hnj⟩  exact hnj (rule p hp)
```

Lean can verify this with certainty.

This is where your architecture becomes powerful.

It doesn't ask the judge:

> “Was Krikorian's long historical explanation persuasive?”

It says:

### Logical structure

**K1**

**M1**

**Lean result**

✅ **Valid inference.**

But then:

> **K1 itself:** externally disputed historical/interpretive proposition.

So the evidence AI goes investigate K1.

Lean has done everything it can do.

* * *

# 5. This is exactly where the evidence AI takes over

The debate system could display:

### Claim K1

> There existed a class of persons at the relevant historical time who were subject to criminal prosecution by U.S. authorities but were nevertheless not “subject to the jurisdiction thereof” within the Citizenship Clause.

**Classification:** Historical + legal interpretation

**Logical importance:** 🔴 Critical  
If true, it defeats Mayes's proposed general rule `Prosecutable → Jurisdiction`.

**Evidence agents:**

```
Agent 1 — primary legal sourcesAgent 2 — congressional debates / drafting historyAgent 3 — Supreme Court precedentAgent 4 — adversarial source critic
```

Then perhaps:

```
Existence of claimed historical category:     [evidence score]Were they prosecutable?:                       [evidence score]Were they excluded from citizenship?:          [evidence score]Was exclusion specifically because ¬J?:        [interpretive dispute]Does historical J determine today's meaning?:  [interpretive dispute]
```

That last distinction is important.

Even perfect evidence that historical group had properties and doesn't automatically establish why the law treated them that way.

So the system keeps decomposition going.

* * *

# 6. Now watch what happens with the statelessness argument

At around 28 minutes, the moderator raises Mayes's claim that ending birthright citizenship could create stateless children. Krikorian agrees this **could** happen and says it should be avoided, but argues that alternative policy designs can deal with the problem. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)opentodebate.substack.com](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

This reveals something natural-language debate hides extremely easily:

### What exactly is Mayes claiming?

Possibility?

Likelihood?

Necessity?

Or specifically:

These are **four very different propositions**.

An assistant formalizer should stop here—not the human debate—and ask Mayes:

> I detect an ambiguity. Are you claiming:
> 
> **A.** the particular executive order would create stateless children;
> 
> **B.** any abolition of birthright citizenship necessarily would;
> 
> **C.** abolition substantially increases the risk;
> 
> **D.** something else?

That's enormously useful.

* * *

# 7. Because Krikorian's response only refutes one version

Suppose Mayes approves:

```lean
∀ policy,  EndsAutomaticBirthright policy →  CreatesStatelessClass policy
```

Krikorian only needs one counterexample policy:

```lean
∃ policy,  EndsAutomaticBirthright policy ∧  ¬ CreatesStatelessClass policy
```

And Lean proves that Mayes's universal proposition is false, assuming Krikorian's example is real.

But suppose she instead approves:

> Ending birthright citizenship **substantially raises the risk** of statelessness.

Then Krikorian saying

> “There are conceivable ways to prevent it”

doesn't refute her claim at all.

Both statements can simultaneously be true:

and

**A normal debate audience can easily experience those statements as rebuttals. Lean says: no contradiction exists.**

That may be one of the biggest benefits of your idea.

* * *

# 8. The moderator actually catches another formalization problem

When Mayes starts talking specifically about problems created by the president's executive order, the moderator intervenes and says the debate isn't solely about that executive order; it's about birthright citizenship as a principle. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)opentodebate.substack.com](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

Your system would catch this automatically as a **domain substitution**:

```
QUESTION:Should ∃/∀ policies ending birthright citizenship be adopted?
ARGUMENT PRESENTED:TrumpExecutiveOrder has consequence C.
```

There is a missing bridge:

That implication is plainly not automatic.

So the interface might display:

> ⚠️ **Missing inference**
> 
> Your evidence presently concerns `TrumpExecutiveOrder`.
> 
> Your conclusion concerns `EndingBirthrightCitizenshipGenerally`.
> 
> Please supply a bridge proposition connecting them.

**Approve / Add premise / Narrow conclusion**

That's exactly what I'd want from this system.

* * *

# What the finished graph might look like

Something like:

```
                         CONSTITUTIONAL BRANCH
         Constitutional text [SOURCE VERIFIED]                         │                         ▼       Born ∧ Jurisdiction → Citizen                   [FORMAL RULE]                         │             ┌───────────┴───────────┐             │                       │             ▼                       ▼   MAYES READING M1          KRIKORIAN CHALLENGE K1 Prosecutable → J             ∃x Prosecutable(x) [INTERPRETIVE]                  ∧ ¬J(x)             │                   [HISTORICAL /             │                    INTERPRETIVE]             └───────────┬───────────┘                         │                Lean: incompatible                if K1 is accepted

                           POLICY BRANCH
                  End birthright citizenship                         │             ┌───────────┴────────────┐             ▼                        ▼    Statelessness risk        Alternative policy       increases              can avoid statelessness     [PREDICTIVE]             [EMPIRICAL/DESIGN]             │                        │             └───────────┬────────────┘                         │               NOT logically contradictory
```

That last label—**NOT logically contradictory**—is something debates badly need.

* * *

## So after doing this real example, I'd strengthen my answer

I think **yes, Lean can be useful for discussions like Open to Debate**, even though a large fraction of the substantive propositions aren't themselves provable in Lean.

The target isn't:

> “Convert the entire debate into mathematics.”

The target is:

Then label the leaves according to what kind of justification they need.

I would probably use these statuses:

**`PROVED`** — Lean derives it from accepted premises.  
**`EMPIRICAL`** — requires external evidence.  
**`INTERPRETIVE`** — disputed meaning/classification.  
**`PROBABILISTIC`** — uncertain empirical relationship.  
**`NORMATIVE`** — value judgment.  
**`DEFINITION`** — agreed or disputed definition.  
**`UNSUPPORTED`** — speaker hasn't supplied the needed bridge.

And crucially:

> **Only `PROVED` means Lean has validated it.**

Everything else can still participate in a Lean proof _as an explicitly labeled premise_.

### This also gives us a very concrete AI architecture

The speaker talks naturally.

**Formalizer AI** proposes atomic claims and logical relations.

**Back-translation AI** independently translates those formal claims back into ordinary English.

The **debater approves/revises/rejects the meaning**, not necessarily the Lean syntax.

**Lean** checks every deductive edge.

**Evidence AIs** investigate empirical/historical/documentary leaves.

**Adversarial evidence AI** actively searches for counterevidence.

And the **judge sees the resulting argument graph**, rather than having to parse an hour of rhetoric.

I think this real transcript actually makes the idea look **more promising**, not less. The major limitation isn't that political discourse is too qualitative for Lean. It's that we must be extremely careful about **semantic translation into and out of Lean**. Once the propositions are accurately represented, a surprising amount of the _relationship between them_ is formalizable.

The next thing I'd test is harder: take one **continuous 2–3 minute exchange with interruptions, rhetorical questions, implied premises, and people talking past each other**, and simulate the formalizer **utterance by utterance**, including the exact `Approve / Revise / Reject` prompts the debaters would receive. That would tell us whether the system could plausibly operate live rather than only reconstruct a debate afterward.

* * *

**You:**

actually I'm not planning to use this in real world for intruptions/talking past each other. this is not a framework for such debate. It requires the particiaptns follow the protocol of that i deisng for debate which requires approve/reject etc. I'm also actually thinking about using it for two ai debating for exactly this topic for example and I wonder if it's possible to formalize in lean. 
For this birthright citizenship have you found any mistake that lean could catch that any of the debators made?

* * *

**ChatGPT:**

Yes. Under **your protocol**, I found several places in this debate where Lean would have stopped a debater and said, in effect, **“that conclusion does not follow from the propositions you have approved so far.”** That is different from fact-checking.

The cleanest example is from Kris Mayes.

### 1. Mayes drops a condition from the rule she just stated

She quotes the Fourteenth Amendment as having two conditions:

and immediately summarizes it as “If you are born here, you are a United States citizen.” [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

If those are literally the approved propositions, Lean gets stuck:

```lean
variable (Person : Type)variable (Born Jurisdiction Citizen : Person → Prop)
axiom clause :  ∀ p, Born p → Jurisdiction p → Citizen p
theorem mayes_claim :  ∀ p, Born p → Citizen p := by  intro p hborn  apply clause p hborn  -- goal now:  -- Jurisdiction p
```

There is **no proof**. She needs another premise:

```lean
axiom jurisdiction_of_birth :  ∀ p, Born p → Jurisdiction p
```

Then it works.

So your system would respond:

> **Cannot certify conclusion. Missing premise:**  
> `∀ p, BornInUS p → SubjectToUSJurisdiction p`

Mayes could say, “Yes, that's part of my argument,” approve it, and continue.

That doesn't prove her wrong. It exposes **exactly what she needs to defend**.

* * *

### 2. Her attempted justification for that missing premise contains another gap

Mayes then argues that cartel members can be arrested and prosecuted in the United States, and therefore are subject to U.S. jurisdiction; she continues that therefore children born to foreign parents are also subject to U.S. jurisdiction. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

Formalized literally:

and she wants:

That simply doesn't follow.

In Lean:

```lean
axiom cartel_jurisdiction :  ∀ p, CartelMember p → Jurisdiction p
theorem children_jurisdiction :  ∀ p, BornToForeignParents p → Jurisdiction p := by  intro p hp  -- nothing available proves Jurisdiction p
```

She needs some **general principle**, perhaps:

plus a premise that these children are subject to U.S. law.

And that general bridge is exactly what Krikorian disputes when he says the constitutional phrase may mean something stronger than merely being prosecutable. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

So this is a very good example of what your system would accomplish. Instead of ten minutes debating “jurisdiction,” we get:

> **Disputed premise J17:**  
> `SubjectToUSLaw(x) → SubjectTo14thAmendmentJurisdiction(x)`

Now everybody knows precisely where the disagreement is.

* * *

### 3. An even clearer logical mistake: “without birthright citizenship, none of us would be citizens”

Later Mayes says, in substance:

> If the U.S. had not had birthright citizenship at its founding, none of us would be citizens, because at some point we were all immigrants. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

That doesn't follow deductively.

Suppose:

```
¬ BirthrightCitizenshipAncestorsWereImmigrants person
```

It does **not** follow that:

```
¬ Citizen person
```

because citizenship can arise through naturalization, citizenship by descent, later legislation, etc. Whether those particular mechanisms existed at particular times is an evidence/history question, but the logical problem comes first: the premises she gives aren't sufficient.

Lean would simply refuse:

```lean
theorem no_birthright_no_citizens    (h1 : ¬ BirthrightCitizenship)    (h2 : ∀ p, HasImmigrantAncestor p) :    ∀ p, ¬ Citizen p := by  -- impossible from h1 and h2
```

She would have to supply something much stronger:

which is plainly not what she originally argued.

So I'd classify this as a **genuine non sequitur that your Lean protocol would catch**.

* * *

### 4. Cooper's Justice Harlan argument would also get challenged

Horace Cooper emphasizes that Justice Harlan dissented in _Plessy_, history vindicated that dissent, and Harlan also dissented in _Wong Kim Ark_. He presents Harlan's second dissent as support for saying _Wong Kim Ark_ was wrongly decided. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

If part of the intended inference is:

Lean rejects it.

Harlan being correct in one case doesn't imply he was correct in another.

Cooper could still make a perfectly legitimate argument by formalizing **Harlan's actual reasons** concerning the meaning and history of the Fourteenth Amendment. Lean would then evaluate the inference from those premises.

So the protocol would have a nice effect:

> You cannot use “Harlan was vindicated before” as the missing logical bridge.  
> **Please state the substantive premise from Harlan's reasoning on which your conclusion depends.**

This is exactly the kind of rhetorical compression that normal debates permit but your system wouldn't.

* * *

### 5. Mayes makes an inductive prediction as though it followed from past decisions

Later she says that every judge who has looked at the issue has ruled against the opposing position and predicts that judges will continue to do so as the case reaches the Supreme Court. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

From:

you cannot deductively derive:

Lean would reject that implication.

But importantly, your system **doesn't have to prohibit the statement**. It can ask her to classify it:

> `PREDICTION`, not `DEDUCTIVE CONCLUSION`

She could instead claim:

and then the dispute concerns the probabilistic model/evidence.

That's precisely how your proposed system can accommodate ordinary uncertain reasoning without pretending everything is deductive.

* * *

### 6. Cooper's bank-robbery analogy exposes another missing premise

Cooper argues that if parents rob a bank, give the money to their children, and authorities recover the money, this isn't properly understood as punishing the children; he uses that analogy against the claim that denying citizenship punishes children for their parents' actions. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

Lean can't move from:

to a conclusion about:

without a bridge such as:

But **that is exactly the controversial proposition**.

So your protocol would probably produce something like:

> **Analogy detected. Missing bridge:**  
> Why does the relevant property of stolen money also apply to citizenship acquired at birth?

Cooper could propose:

Now Newman could immediately reject that premise or point out that he believes birth citizenship is an **independent legal right of the child**, not a benefit transferred from the parent.

The rhetoric disappears and the real disagreement becomes visible.

* * *

Interestingly, Krikorian makes one argument in the section we examined that is **logically quite clean**. Mayes's apparent principle is approximately:

Krikorian responds that reservation Indians at the relevant historical time were prosecutable yet, on his interpretation of the historical record, were excluded by the jurisdiction language. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

If his premises are accepted:

then Lean really can prove:

```lean
theorem counterexample    (h : ∃ x, Prosecutable x ∧ ¬ Jurisdiction x) :    ¬ ∀ x, Prosecutable x → Jurisdiction x := by  intro general  obtain ⟨x, hp, hnj⟩ := h  exact hnj (general x hp)
```

That deduction is valid. **Lean says nothing about whether Krikorian's historical premise is true or whether his interpretation of “jurisdiction” is correct.** Your evidence/interpretation agents handle those questions.

### This changes how I see your proposal

The protocol shouldn't say:

> “Every claim has to be proved in Lean.”

It should say:

> **Every claimed inferential relationship has to be certified in Lean.**

A debater is perfectly allowed to introduce:

```
E37: "X happened historically."          [empirical]I12: "The constitutional term means Y."  [interpretive]V8:  "Creating statelessness is bad."    [normative]P4:  "X probably increases Y."           [probabilistic]
```

Those don't need Lean proofs.

But if the AI then says:

**that arrow must compile.**

And arbitrary `axiom`s shouldn't be allowed to rescue a failed proof. If a debater needs another assumption, the system extracts it as a **new visible premise**, sends it back to the debater for approval, and exposes it to the opponent/evidence agents.

That means in this one ordinary political debate, I can already identify **at least three things Lean would have caught or forced clarification on**: Mayes dropping the jurisdiction condition, Mayes's immigration-ancestry → no-citizenship inference, and the implicit Harlan-correct-once → Harlan-correct-here move. Several other statements would be reclassified as probabilistic, analogical, or requiring an explicit bridge rather than being accepted as deductions. [![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate+2![](https://www.google.com/s2/favicons?domain=https://opentodebate.substack.com&sz=128)Open to Debate+2](https://opentodebate.substack.com/p/transcript-should-america-end-birthright)

That is much closer to the Geoffrey Irving application you're interested in: **the deceptive AI isn't allowed to hide a bad inference inside persuasive prose. It either produces the missing premise explicitly, or the edge in the argument graph remains uncertified.**