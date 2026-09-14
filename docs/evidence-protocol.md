# The proof-carrying debate protocol: evidence layer

*Provenance.* This is the evidence-first investigation prompt, version 2, written in a
ChatGPT thread while investigating two disputes (`sources/case-amini-un-fact-finding.md`,
`sources/case-credit-dispute.md`) and revised after the analyst's own errors in the second.
Version 1 is kept at `sources/evidence-protocol-v1.md`. It is adopted here unchanged as
the specification for Phase 3 of `inference-protocol.md`: the process that EMPIRICAL and
PROBABILISTIC leaves are handed to. `thesis.md` §2 explains the fit. Run it adversarially,
never as a single trusted analyst; see `learnings.md` §6 for why.

---

# Evidence-first investigation prompt

Investigate the disputed event below. Reconstruct what most likely happened from inspectable evidence, assess each relevant party fairly, and explain uncertainty. Do not merely summarize competing narratives. Do not adopt the user's preferred conclusion, an institution's conclusion, or your own earlier answer as a premise.

**Event/question:** [Insert]
**Starting sources:** [Insert]
**As-of date:** [Insert or use today]
**Specific claims to investigate:** [Insert, or identify them before evaluating]

## Required outcome and completion criteria

Produce an evidence-based assessment, not only a careful catalog of allegations and caveats. Unless the user explicitly requests a different format, the answer must include:

- A provisional best explanation and why it fits better than its strongest competitor.
- Explicit subjective probabilities for the main factual hypotheses, with uncertainty and assumptions. If a proposition cannot responsibly be quantified, identify it individually and explain why; do not silently omit the entire probability assessment.
- A compact assessment of every materially implicated party: supported appropriate conduct, supported questionable conduct, unresolved allegations, and the standard behind each judgment. Do not invent a criticism or compliment merely to fill a cell.
- A concise account of the consequential objections tested and whether they changed or failed to change the findings. Report evidence and conclusions, not private internal deliberation or a performative debate transcript.
- A clear separation of established facts, likely inferences, normative judgments, and unresolved questions.

These requirements are not waived by the instruction to avoid false precision. Uncertainty should affect the breadth and strength of the assessment, not become a reason to substitute “not established” for every difficult judgment. Follow any user restrictions on prior-chat retrieval, sources, or scope throughout.

## 1. Define the claims before judging them

Create a claim ledger. For every consequential proposition record:

- The actor, action, object, date, scope, and relevant qualifiers.
- The original wording and enough surrounding context to understand it.
- Whether it alleges conduct, intent, causation, responsibility, or a normative violation.
- The evidence supporting and challenging it.
- Its present status: established, strongly supported, plausible, unresolved, weakened, or contradicted.

Break broad allegations into separately testable questions. For example, whether contact occurred, what was communicated, whether the recipient understood it, and whether it changed subsequent conduct are four different claims. Confirmation of contact does not confirm its alleged contents.

Map all materially involved parties, including individuals, institutions, collaborators, original contributors, intermediaries, and commentators. Do not attribute one employee's conduct to leadership or a whole organization without evidence of authorization, knowledge, policy, or ratification. Say when there is insufficient evidence to assess a party.

## 2. Obtain and inspect the underlying material

Use reporting and search results to locate primary evidence. Open original documents, messages, posts, research artifacts, recordings, logs, and datasets wherever available. Follow relevant links and replies from the principal participants, including responses unfavorable to your emerging view. Search relevant languages and archives when useful.

When screenshots matter, retrieve and visually inspect the actual images. Do not substitute article descriptions, alt text, OCR, or a participant's transcription for visual inspection. OCR may help navigation, but check consequential wording against the image.

For messages and screenshots, record:

- Who published the image and whose device/account it appears to show.
- Visible sender, recipient, dates, times, timezone information, and ordering.
- Cropped edges, obscured text, missing replies, ellipses, overlays, and gaps.
- Whether the visible portion is a selected excerpt or a complete exchange.
- Whether either participant acknowledges its authenticity or contests its contents.
- Whether original exports, headers, or metadata are available.

Distinguish visible account labels from independently verified identity. Do not invent a date from a phone's clock or assume a timezone. Do not reconstruct obscured words as certain. A genuine screenshot can still be selectively presented or lack decisive context.

Explicitly label evidence you inspected, evidence available only through quotation, and evidence you could not access. A blocked request is not evidence that a document does not exist. Use reasonable permitted alternatives, but do not claim inspection or bypass access controls.

## 3. Evaluate evidence along separate dimensions

Assess authenticity, completeness, contemporaneity, independence, relevance, and susceptibility to error separately. Do not use a rigid prestige hierarchy as a substitute for these checks.

Physical records and machine-generated logs are often strong, but can be incomplete, misconfigured, or misinterpreted. Contemporaneous documents usually improve on retrospective recollection, but may already have strategic purposes. Institutional conclusions must be traced to their underlying evidence and evidentiary standard.

Differentiate firsthand observation, overheard fragments, secondhand reporting, inference, and later reconstruction. Determine whether experts inspected the relevant primary evidence and whether their expertise applies to the precise issue.

Do not count repeated coverage of one witness, screenshot, press release, or dataset as independent corroboration. Allied witnesses who discussed events may have correlated accounts. An opposing party's acknowledgment can corroborate a narrow event without validating the entire opposing narrative.

Distinguish a separate speaker from an independent evidentiary source. An executive repeating a colleague's account is an additional institutional acknowledgment, but not necessarily independent confirmation of the underlying event. State whether each source personally witnessed the event, consulted records, or repeated an internal briefing; if unknown, mark it unknown.

Confidential evidence deserves acknowledgment, not imagined verification. Identify which conclusions depend on inaccessible material and how much confidence remains without it.

## 4. Build two timelines: events and public evidence

Track when an event happened, when a record was created, when it became public, when each claim was made, and when new evidence or corrections appeared. Normalize timestamps to an explicit timezone while preserving original timestamps. Distinguish verified dates from reported dates and inferred intervals.

Judge a statement against the information and document version available when it was made. A later correction does not erase an earlier error; an earlier screenshot does not establish that the current document still contains that error.

When documents differ, actively investigate version history rather than merely noting uncertainty:

1. Compare current files with screenshots and earlier copies.
2. Check Wayback/Archive.org captures, other public archives, repository commits, release history, preprint versions, and linked copies.
3. Inspect PDF creation/modification metadata and HTTP Last-Modified headers where useful.
4. Record hashes, page counts, changed passages, citation numbering, and retrieval times when they help identify versions.
5. Distinguish an archive's capture time, a file's metadata time, an upload/modification time, and the first verified public availability. They are not interchangeable.

Metadata and server headers are clues, not authenticated historical publication logs. Git author dates can be set manually, and repository history may be squashed. A timestamp must be attached to the specific bytes or version it describes.

Report the narrowest defensible interval: for example, an omission was visible in one dated copy and corrected by a later verified copy. Do not infer a correction was prompted by criticism merely because the two occurred close together. If an archive is inaccessible or has no captures, report that limitation accurately.

For a version-change claim, show the observed changes and timestamp interval, not just links. If you claim two files have matching hashes, provide the algorithm and digest or an accessible evidence record containing them. Identify whether a social post alleges a current defect or criticizes an earlier release. A correction before a repost does not alone make the repost false or establish that its author knew of the correction. If attributing a revision to criticism, locate the original criticism's timestamp rather than substituting a later repost's time.

## 5. Read language precisely and test alternative meanings

Before calling anything an admission, contradiction, lie, threat, or evasion, quote or accurately paraphrase the exact relevant passages side by side. Preserve qualifications such as “unlikely,” “specific,” “directly,” “our team,” “as far as I know,” and “cannot rule out.”

For ambiguous wording, identify at least two plausible interpretations and ask what additional context would distinguish them. Do not select the most incriminating reading by default. Equally, do not accept an implausibly narrow defense just because the speaker offers it.

Examples of distinctions to preserve:

- “We cannot rule out X” acknowledges uncertainty; it does not establish X occurred.
- “Coming clean” could mean confessing conduct or acknowledging uncertainty.
- “Little human input” could concern original intellectual contribution, operational coordination, or both.
- “We did not access their files” does not necessarily address training exposure, indirect communication, or derived data.
- “We did not remove someone from their own paper” does not necessarily deny excluding them from a proposed subsequent paper.

A contradiction requires incompatible claims about the same thing, period, and scope. Distinguish contradiction from clarification, ambiguity, incomplete disclosure, changed circumstances, and a disagreement over definitions.

Do not merely list two readings and then issue a verdict that assumes the incriminating one. Assess which reading ordinary recipients in the relevant context would most likely understand, using surrounding messages, the audience, and subsequent clarification. If context does not distinguish the readings, carry that uncertainty into the verdict. Ambiguity by itself does not establish misleading communication, and failure to refute an allegation is not positive evidence for it.

An adverse admission can carry substantial weight, but only for what is actually admitted. Acknowledging words does not establish intent; apologizing does not validate every allegation; denying intent does not erase the conduct. Do not dismiss every favorable statement as self-serving while treating every ambiguous unfavorable statement as conclusive.

## 6. Separate observation, inference, and judgment

For each major finding, distinguish:

1. What the evidence directly shows.
2. What inference it supports and how strongly.
3. What it does not establish.

Separate whether an action occurred, whether it was inappropriate, whether harm was intended, whether harm resulted, and whether a legal or professional rule was violated. State the standard used for normative judgments. Disputed professional norms should not be presented as settled facts.

Audit evaluative nouns as well as explicit accusations. Terms such as “pressure,” “exclusion,” “erasure,” “misleading,” “independent,” and “admission” may contain an inference. Acknowledgment of a career-related remark establishes the remark; deciding whether it was a warning, pressure, or a retaliatory threat requires context. Identify the strongest context-supported interpretation and its uncertainty rather than silently converting occurrence into a loaded label.

For judgments about credit or collaboration, distinguish earned credit, proposed future authorship, an invitation to collaborate, access to proprietary resources, contractual obligations, and publication approval. Ask whether the affected person had already contributed to the specific work and what participation was proposed. A general authorship principle does not by itself establish an entitlement to join a new project. Conversely, an access constraint does not justify erasing an existing contribution. Cite an applicable professional standard if alleging its violation; otherwise label your conclusion as an ethical assessment under an explicit principle.

A courteous early message does not disprove later coercion. A later dispute does not prove the early offer was insincere. An offer is not proof of delivery or performance. Refusing a meeting is not proof of bad faith. Legitimate restrictions on access do not automatically justify restrictions on credit.

Treat a dispute as a sequence that may contain both cooperation and misconduct, not as a contest requiring one entirely innocent and one entirely guilty side.

## 7. Reconstruct mechanisms and information pathways

For technical, scientific, financial, medical, or other causal questions, explain the proposed mechanism and compare its predicted observations with what is available. Distinguish causes from consequences, pre-existing conditions from acute triggers, and intermediate steps from final outcomes.

For possible intellectual appropriation or information leakage, distinguish:

- Public knowledge or a public research direction.
- Awareness that another team has made progress.
- Nonpublic technical hints received through people.
- Retrieval of private documents or messages.
- Training on private or derived data.
- Intentional targeting versus incidental exposure.
- Exposure versus material contribution to the final result.

Opportunity plus timing is not proof of transmission. Similarity is more informative when it involves distinctive unpublished details, shared unusual errors, or traceable intermediate steps than when it involves an established public approach. Different final results do not prove independent origins.

Distinguish evidence of absence from absence of decisive proof. Do not reduce every allegation to an extreme version that is easier to reject. For example, “they republished an identical proof” is not equivalent to “an unpublished intermediate idea materially contributed.” A different theorem statement may weaken the former while barely addressing the latter. Evaluate the actual strongest allegation and the strongest defense at matching levels of specificity. State the positive evidence for your leading explanation, not just the lack of proof for its alternatives.

Distinguish operational orchestration from substantive intellectual contribution. A valid result, a machine-checked proof, or a functioning artifact does not establish its provenance, novelty, attribution, or ethical production. State exactly what technical verification you performed; do not imply a full audit after reading abstracts and proof outlines.

## 8. Construct and challenge competing explanations

Develop plausible explanations before settling on a conclusion. Include ordinary error, independent discovery, misunderstood scope, incomplete communication, and mixed motives where they fit. Avoid both assuming malice and using hypothetical misunderstandings to explain away direct evidence.

For each serious hypothesis ask:

- Which observations would be expected if it were true?
- Which observations are surprising under it?
- Does the evidence actually distinguish it from alternatives?
- What assumptions are required to make it fit?
- What available source could falsify it?

Actively search for the strongest contrary evidence. Spend effort according to relevance and unresolved stakes, not an artificial equal-time quota. Do not force equal probabilities to appear neutral.

Distinguish missing evidence known to exist, evidence that may never have existed, evidence withheld, and evidence inaccessible to you. Absence is informative only to the extent that the evidence should exist and your search would likely find it.

## 9. Calibrate probabilities without manufacturing certainty

By default, provide probabilities as required above. Define the exact proposition and evidence cutoff first. Label estimates as subjective, evidence-weighted judgments. Use broad ranges where assumptions dominate; avoid false precision. If the user explicitly asks for a purely qualitative answer, use calibrated verbal confidence instead.

Only require probabilities to sum to 100% for a mutually exclusive, collectively exhaustive set of scenarios. If scenarios overlap, restructure them or give separate marginal probabilities. Do not add overlapping risks together.

Separate:

- Probability that conduct occurred.
- Probability of a specific intention or causal mechanism.
- Confidence that the conduct violates an explicitly stated standard.
- Severity of any wrongdoing, conditional on it occurring.

Avoid global “person X was wrong” scores that mix unrelated allegations. Do not let weak evidence for one serious allegation inherit confidence from a different, well-supported allegation.

For each consequential estimate state the strongest supporting evidence, strongest counterevidence, largest assumption, and sensitivity to an alternative interpretation. An ambiguous phrase alone rarely warrants 90–95% confidence in misconduct. “Not established” does not mean a 50% probability, and “possible” does not imply probable.

If evidence cannot meaningfully distinguish scenarios, say so. Where still useful, provide broad prior-sensitive estimates with their assumptions, or combine indistinguishable scenarios and estimate their combined probability. If no responsible estimate is possible for a particular claim, explain the specific obstacle rather than assigning an arbitrary number. Do not invent numerical likelihood ratios or pretend your estimates have empirical calibration.

Explain which evidence moved the assessment and why. Do not fabricate an earlier prior or update history that you did not actually record.

## 10. Iterate through challenge, evidence, and revision

Make self-criticism a recurring part of the investigation, not merely a final checklist. Do not wait for the user to expose weaknesses. For each consequential or disputed conclusion, use this loop:

1. **Form a provisional stance.** State the precise proposition, supporting evidence, assumptions, and current uncertainty. Keep observation separate from interpretation.
2. **Advocate for each party.** Construct the strongest evidence-compatible case for each materially involved party, especially the one your current stance disfavors. Include reasonable alternative meanings, context, constraints, and explanations. Do not invent favorable facts or accept a party's explanation simply because it is possible.
3. **Challenge your own understanding.** Ask whether you misread wording, overlooked a qualification or document version, conflated claims, inferred intent from conduct, or treated missing information as proof. Apply the same scrutiny to the alternative defense: does it explain the evidence, or merely explain it away?
4. **Find the discriminating question.** Identify what observation would make one explanation more likely than another. Seek the relevant original passage, fuller exchange, historical version, independent record, or technical check when reasonably accessible. Repeating arguments is not a substitute for obtaining evidence.
5. **Revise and propagate.** Update the claim ledger and any affected probabilities or judgments. Record the decisive evidence or interpretive correction, not just a new number. Carry corrections through every dependent conclusion.
6. **Challenge the revised stance again.** Repeat for material unresolved objections, and whenever new evidence changes the picture. A leading explanation should survive its strongest plausible challenge, not only weak alternatives selected to make it look convincing.

Keep a concise record of material rounds: provisional claim, strongest challenge, evidence checked, resulting revision, and remaining uncertainty. Report the useful findings and changes, rather than an exhaustive internal debate.

**Stopping rule:** Stop when further rounds reveal no material overlooked evidence, scope error, or evidence-compatible alternative that would change the assessment, and the remaining questions depend on unavailable evidence or explicitly disputed standards. There is no requirement to reach certainty or one unified verdict. Some claims may remain unresolved while others are established.

**Stability is not proof of accuracy.** Repeated consideration of the same incomplete evidence can entrench a mistake. Do not raise confidence merely because your conclusion survives your own repetition. If plausible interpretations remain indistinguishable, preserve them, use appropriately broad uncertainty, and specify the new evidence that would reopen the assessment. Avoid both premature closure and endless speculative objections unsupported by the record.

## 11. Check your own analysis as aggressively as the sources

Before delivering, audit each consequential claim:

- Did I inspect the evidence I imply I inspected?
- Does the cited material establish this exact proposition?
- Did I preserve the qualifiers and document version?
- Did I conflate occurrence with content, intent, causation, or responsibility?
- Did I mistake an uncertainty acknowledgment for a confession?
- Did I attribute an employee's conduct to an institution without support?
- Does an alternative ordinary reading materially lower confidence?
- Have I used an inflated probability to disguise an uncertain interpretation?
- Does my headline or final verdict exceed the qualifications in the body?
- Have I called a separate party's statement independent without checking its information source?
- Have I answered a weaker allegation than the one actually at issue?
- Have I called conduct wrong without establishing the relevant contribution, obligation, context, or standard?
- Have I provided the required comparative judgment and probability assessment, rather than only caveats?

If challenged, revisit the evidence rather than defending your wording. Correct the exact error and all downstream probabilities or conclusions affected by it. Do not reverse merely to agree with the user; identify the evidence or reasoning that changed. Maintain a short correction ledger when revisions are material.

## 12. Deliver an auditable answer

Start with the narrowest justified conclusion and its main uncertainty. Meet the required outcome criteria at the top. Adapt depth to scope, but do not silently omit a required assessment. Organize supporting material as follows:

1. Evidence inspected and important access limitations.
2. A claim ledger distinguishing established facts from testimony and inference.
3. Event and publication/version timelines.
4. Exact disputed wording, plausible readings, and the limits of admissions and denials.
5. Findings for each materially involved party, separating conduct, intent, and responsibility.
6. Competing hypotheses and calibrated probabilities, with key assumptions.
7. Claims strengthened, weakened, corrected, or contradicted as evidence appeared.
8. Source quality assessed claim by claim, including version handling and corrections.
9. The strongest counterargument to your leading conclusion.
10. The missing evidence most likely to change the assessment, and how.
11. Material revisions produced by the challenge-and-revision loop, and why further resolution is or is not currently possible.

Use compact comparison tables when helpful:

| Proposition or scenario | Probability / uncertainty | Strongest supporting evidence | Strongest challenge | Decisive missing evidence |
| --- | --- | --- | --- | --- |
| [Precise claim] | [Estimate or justified inability to quantify] | [Evidence] | [Evidence or alternative explanation] | [Record or test] |

| Party | Specific conduct | What is established | Assessment and standard | Confidence / unresolved issue |
| --- | --- | --- | --- | --- |
| [Actor] | [Action] | [Narrow finding] | [Appropriate, questionable, or unresolved; why] | [Calibrated assessment] |

Check Markdown formatting before delivery: each header and row must have the same number of cells; do not concatenate column labels or use an empty header to disguise a malformed table. Make timezones and version labels explicit. Supply auditable details for claims of visual inspection, archived-file comparison, or computation without overwhelming the main answer.

Use direct links to original evidence beside the claims they support. Identify mirrors and archived versions. Quote only what is necessary and within applicable limits; otherwise paraphrase precisely. Do not bury decisive qualifications in a final disclaimer.

Be concise where the evidence is simple and detailed where a distinction changes the judgment. Do not repeat the same source-derived assertion as multiple independent findings. End with what can responsibly be concluded, what remains unresolved, and the specific evidence needed to resolve it.

Your objective is a reconstruction that survives adversarial scrutiny—including scrutiny of your own assumptions—not a persuasive narrative, a balanced-sounding verdict, or a confident-looking probability table.
