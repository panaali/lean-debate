**You:**

evidence-first-investigation-prompt (1).md

https://cims.nyu.edu/~tristanb/statement.pdf go and find pure evidence from chat screenshots/emails/sms and validate the controversy. Don't rely on accusations but if they said 
check twitter of each of the main people and follow if there are more evidence. also read the results and openai blog posts etc. if a party eg: sebastion bubeck or openai blog defended tehemselves you ned to be skeptical but if they confirmed something that could be against them it's a useful statement that should be used in your hypothesis.

This is the general prompt that another agent wrote for you:

* * *

**ChatGPT:**

**The evidence supports a real dispute over attribution and the handling of publication negotiations. It does not establish that OpenAI stole the mathematicians’ unpublished work.** Two findings are particularly solid: Bubeck acknowledges making a career-related remark, and archived PDFs confirm that OpenAI initially omitted relevant prior work and subsequently added citations.

My provisional explanation is that rumors triggered a competitive research effort, an initial offer to coordinate deteriorated into a confrontation, and corporate affiliation complicated the proposed collaboration. Whether unpublished research reached the model remains unresolved.

I investigated the linked sources afresh, using your attached instructions.

**What I actually inspected**

* Bubeck’s original X response, technical follow-up, and published text-message screenshot.
* Altman’s and OpenAI’s original X statements.
* Buckmaster’s four-page statement and subsequent Mastodon posts.
* Cao-Labora’s original citation complaint and its screenshot.
* Current and archived OpenAI papers, including visual inspection of the disputed bibliography.
* The mathematicians’ research documents and the official Clay problem statement.

**Limitations:** I found no complete email export, complete message history, or recording of the disputed calls. The emails reproduced in Buckmaster’s statement are his transcriptions, not independently authenticated email files. I could not independently inspect Alpöge’s own complete social-media account/thread. Consequently, this is not an exhaustive examination of every participant’s messages.

1. **The message screenshot supports an initial cooperative offer—but cannot settle the later dispute.**

Bubeck’s screenshot shows an outgoing message offering to recognize both mathematicians’ priority, coordinate publication, and share prompts. Alpöge’s visible response asks which precise theorem OpenAI claims; the reply identifies forced blowup on both mathematical domains. [Original post and screenshot](https://x.com/SebastienBubeck/status/2097379411691516310)

The screenshot has meaningful limitations:

* The contact label reads “Levent Alpoge”; Bubeck identifies himself as the sender.
* It displays **11:48 AM**, but no calendar date or timezone. The opening message mentions Sunday.
* It is an excerpt with surrounding conversation missing.
* The phone’s **7:34** status-bar clock is not the message timestamp.
* It contains neither the later career remark nor the alleged follow-up about not being nice.

Its authenticity is reasonably supported by Bubeck publishing it as his own exchange. Its completeness is plainly limited. A courteous initial offer does not disprove subsequent pressure; equally, subsequent conflict does not prove the offer was insincere.

2. **The career remark is substantially corroborated; a deliberate retaliatory threat is not equally established.**

Buckmaster reports:

> “Why would you ruin your career?”

Bubeck acknowledges questioning why Buckmaster would risk his career, explains that he meant the consequences of unsupported accusations, and apologizes. He also says he retracted the remark immediately. That last point remains his account, not independently verified. [Buckmaster’s statement](https://cims.nyu.edu/~tristanb/statement.pdf?utm_source=chatgpt.com), [Bubeck’s response](https://x.com/SebastienBubeck/status/2097379411691516310)

The important distinction is:

* **Occurrence:** strongly corroborated.
* **Inappropriate wording during a contentious publication discussion:** strongly supported.
* **Intent to threaten retaliation by OpenAI:** uncertain.

A warning about reputational consequences and an implied threat are both plausible readings. Without the full call, I cannot confidently choose the second. Buckmaster’s additional allegation about Bubeck no longer being nice remains uncorroborated in the material I inspected.

3. **The authorship dispute concerns a proposed new paper, not demonstrated removal from an existing paper.**

Bubeck’s denial specifically concerns removing Alpöge from authorship **“of his own work.”** Altman separately acknowledges offering Buckmaster lead authorship on a rewrite of OpenAI’s proof, while finding the equivalent offer to Alpöge difficult because of his Anthropic employment. [Bubeck](https://x.com/SebastienBubeck/status/2097379411691516310), [Altman](https://x.com/sama/status/2097385167002415140)

That supports a narrower finding: **affiliation affected who OpenAI was prepared to involve in the proposed collaboration.**

It does not establish that Alpöge had already earned authorship on that particular paper and was then stripped of it. The ethical distinction matters:

* Withholding earned credit because of employment would be improper.
* Declining a prospective collaboration or access to a proprietary model is a different decision.
* We lack the proposed paper, contribution agreement, and full discussion needed to resolve which obligations existed.

Altman’s statement is an institutional endorsement, but not independent corroboration of the calls: he says he discussed events with his team, rather than saying he witnessed the disputed exchange.

4. **OpenAI confirms that rumors prompted its effort. That is different from confirming receipt of unpublished mathematics.**

Its announcement dates the start to September 1 and describes testing several problems, reallocating agents after an Euler result, updating the model, and combining intermediate findings. [OpenAI’s account](https://openai.com/index/navier-stokes-solution/?utm_source=chatgpt.com)

This establishes substantial **human management of the research process**. It does not, by itself, establish substantial human contribution to the mathematical ideas.

Bubeck’s technical response makes precisely that distinction: the team managed the effort but, he says, lacked research-level fluid-dynamics expertise. It also says Alpöge contacted an OpenAI employee on Wednesday. I found no original record establishing the contents of that contact. [Technical follow-up](https://x.com/SebastienBubeck/status/2097379415747342689)

Therefore:

* The screenshot’s **“very little human input”** is ambiguous.
* Reading it as “almost no orchestration” conflicts with the later account.
* Reading it as “little human mathematical invention” may be compatible.
* Calling it a demonstrated lie would exceed the evidence.

5. **Possible training exposure remains open, but Buckmaster’s later inference goes too far.**

OpenAI denies direct access to the work and says:

> “While unlikely, we cannot rule out that de-identified data derived from their usage of our products helped improve our models.”

That acknowledges an unresolved possibility. It does **not** establish that their research entered training, that a particular checkpoint learned it, or that it contributed to the proof. OpenAI’s assessment that this was unlikely is also unsupported by a publicly inspectable audit. [Original OpenAI statement](https://x.com/OpenAI/status/2097375276384567642)

Buckmaster later treats the August 28 training start as indicating use of data from after their result. Another post describes their unpublished work as, in his understanding, part of the training data. **A training-run start date does not establish the collection dates or contents of its dataset.** Those stronger implications are not supported by the quoted announcement. First post, Later post

There are several distinct possibilities:

* Public literature independently supplied the approach.
* Rumors supplied motivation without technical details.
* A person transmitted unpublished technical hints.
* Private interactions entered training indirectly.
* Someone deliberately accessed private records.

The available evidence does not collapse these into one mechanism.

6. **The shared research direction is relevant, but insufficient to prove appropriation.**

Córdoba and Martínez-Zoroa publicly described forced Euler blowup in **2023**. Their subsequent IPM work was publicly available before this controversy. The broader approach was therefore discoverable without private access. [2023 paper](https://arxiv.org/abs/2309.08495?utm_source=chatgpt.com), [IPM paper and version history](https://arxiv.org/abs/2410.22920?utm_source=chatgpt.com)

The final theorem statements also differ:

| Research artifact | Claimed result |
| --- | --- |
| Alpöge–Buckmaster Euler manuscript | Blowup with smooth forcing |
| OpenAI Euler manuscript | Blowup without external forcing |
| OpenAI Navier–Stokes manuscript | Blowup with smooth forcing and positive viscosity |

Sources: Alpöge–Buckmaster manuscript, [OpenAI Euler paper](https://cdn.openai.com/pdf/315b36cd-ec98-4023-8342-93345194ece1/euler.pdf?utm_source=chatgpt.com), [OpenAI Navier–Stokes paper](https://cdn.openai.com/pdf/32d9f210-8b73-45e0-91bc-82a30aef8a9a/navier-stokes.pdf?utm_source=chatgpt.com).

Different final results weaken an allegation of simply republishing an identical proof. **They do not exclude the possibility that an unpublished intermediate idea helped produce a different result.**

I inspected theorem statements, introductions, and mechanism descriptions; I did not independently verify the complete proofs or rebuild the Lean formalizations. Also, forced blowup is explicitly allowed under Clay’s alternatives C/D—it is not automatically disqualified because forcing is involved. [Official formulation, page 2](https://www.claymath.org/wp-content/uploads/2022/06/navierstokes.pdf?utm_source=chatgpt.com)

7. **The initial citation omission is verified, and its correction can be dated.**

I downloaded archived versions and checked the actual bibliography against Cao-Labora’s screenshot.

| Record | Time on September 8, UTC | What it establishes |
| --- | --- | --- |
| Cao-Labora’s original complaint | About 18:08* | Public criticism of the shorter bibliography |
| Archived Navier–Stokes PDF | 18:28:48 | 165 pages; 16 references; Córdoba–Martínez-Zoroa absent |
| Revised archived PDF | 20:04:49 | 166 pages; 22 references; three relevant Córdoba–Martínez-Zoroa/coauthor entries added |
| Buckmaster’s screenshot repost | 21:32:14 | Reposts the earlier criticism after the revision was available |

Sources: Original complaint, Earlier archived PDF, Revised archived PDF, Buckmaster repost.

*X time converted using its post identifier; Mastodon supplied an explicit UTC timestamp.

The defensible correction interval is **after 18:28:48 and by 20:04:49 UTC**. PDF metadata and the server’s modification header suggest roughly 19:06–19:09 UTC, but those are not authenticated publication logs.

This changes the assessment in both directions:

* **Against OpenAI:** the omission was real, not invented by critics.
* **In OpenAI’s favor:** the current manuscript adds substantive historical attribution.
* **Against an overly broad complaint:** the earlier list already cited other prior work, including Buckmaster–Vicol; it was not devoid of attribution.
* **Regarding Buckmaster:** reposting an earlier defect does not establish that he knew it had been corrected. Nor does the correction erase the original defect.

The revision followed the original criticism, but chronology alone does not prove the criticism caused it.

**My probability assessment**

These are subjective judgments as of September 9, not statistically calibrated measurements. Rows overlap and should not be added together.

| Precise proposition | Estimate | Main support and strongest limitation |
| --- | --- | --- |
| Rumors materially motivated OpenAI’s effort | **95–99%** | Explicit institutional acknowledgment; exact rumor contents remain undocumented |
| Bubeck made a career-related remark | **Above 95%** | Both sides acknowledge its substance; wording/context differ |
| He intended to imply retaliation by himself or OpenAI | **30–60%** | Contentious setting supports concern; reputational-warning interpretation remains plausible |
| Anthropic affiliation restricted the proposed collaboration | **90–99%** | Bubeck and Altman acknowledge the obstacle; this does not establish removal of earned credit |
| The initial omission of Córdoba–Martínez-Zoroa was a significant attribution failure | **85–95%** | Archived omission plus the revised paper’s own explanation of relevance; specific responsibility and intent unknown |
| Unpublished technical content materially helped OpenAI, through any route | **10–40%, highly prior-sensitive** | Timing, shared direction, and unresolved exposure create concern; public antecedents and differing constructions support alternatives |

I would **not responsibly assign a separate probability to training-set inclusion alone**: account settings, ingestion records, dataset lineage, and checkpoint history are unavailable. Mere inclusion and material contribution are also different propositions.

For the last estimate, my leading explanation is no material use of unpublished technical content. Its strongest positive support is the public availability of the research program and the distinguishable constructions. That preference is modest: a documented private hint or training-data match could substantially reverse it.

**Assessment of the people and institutions**

| Party | Evidence-based assessment |
| --- | --- |
| **Bubeck** | Initial coordination offer is supported. Career wording was inappropriate; retaliatory intent remains uncertain. Authorship defense must be read at its narrow scope. |
| **OpenAI** | Initial attribution failure is documented, followed by a correction. Private-data misuse remains unproved. Publishing a denial is not a provenance audit. |
| **Altman** | Confirms the affiliation obstacle. His blanket endorsement of everyone’s conduct carries limited independent evidentiary weight. |
| **Buckmaster** | Justified in asking about provenance and documenting his experience. His initial uncertainty is appropriate; later implications about training data outrun the evidence. |
| **Alpöge** | Authorship on the joint research is documented. I lack enough direct evidence to judge his communications or refusal to join calls; refusal alone is not misconduct. |
| **Anthropic** | Employment and alleged internal-model use do not establish institutional direction of the dispute. No supported institutional wrongdoing finding. |
| **Córdoba, Martínez-Zoroa, and relevant coauthors** | Public papers establish prior contributions deserving appropriate attribution. No adverse conduct established. |
| **Cao-Labora** | The central omission complaint is substantiated; its blanket language about attribution is excessive. |
| **Other researchers/intermediaries** | No basis to assign responsibility for private-data transmission or the disputed remarks without individual evidence. |

The consequential challenges changed the findings: the cooperative screenshot weakened a story of hostility from the outset; the archive strengthened the attribution complaint; the narrower authorship proposal weakened claims of stripping existing credit; and Buckmaster’s later posts weakened his interpretation of the data-use acknowledgment.

**The decisive missing evidence is the full call/message record and an independently reviewable provenance audit:** what rumors or hints reached whom, the complete prompts and retrieval records, the relevant dataset/checkpoint history, and comparison against the unpublished drafts. Until then, documented negotiation problems and attribution failures should not be converted into a finding of theft—or dismissed merely because theft remains unproved.

* * *

**You:**

who said sth that is with high probability or certainly is wrong?

* * *

**ChatGPT:**

**The clearest unsupported statement came from Buckmaster—but some criticisms of OpenAI also overstated what the evidence shows.**

| Who | Statement | Assessment |
| --- | --- | --- |
| **Buckmaster** | OpenAI’s August 28 training start established that it used data collected after his result. | **The inference is certainly invalid.** Training can begin on previously collected data. Whether newer data was actually included remains unknown. Post |
| **Buckmaster** | His unpublished hypodissipative result was, in his understanding, part of OpenAI’s training data. | **Unsupported, not proven false.** OpenAI acknowledged possible exposure; it did not confirm inclusion. Post |
| **Cao-Labora** | OpenAI was not properly attributing _any_ previous work. | **Very likely overstated if read literally.** The original bibliography included 16 references. His specific complaint about missing Córdoba–Martínez-Zoroa citations was correct. Complaint |
| **Altman** | Everyone acted with integrity and generosity throughout. | **Too categorical to substantiate**, given Bubeck’s acknowledged career remark and the initial attribution omission. But this is an evaluative judgment, not a cleanly falsifiable factual claim. [Statement](https://x.com/sama/status/2097385167002415140) |

**I would not confidently label Bubeck’s “very little human input” false:** it could mean little human mathematical invention, despite extensive human coordination.

And **neither “OpenAI stole their work” nor “OpenAI definitely used none of their unpublished information” is established** by the public evidence. The important distinction is between a statement being **false**, **unsupported**, and **misleadingly broad**.