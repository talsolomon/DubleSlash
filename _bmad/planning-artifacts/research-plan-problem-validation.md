# Research Plan — Problem Validation for Duble Slash

**Date:** 2026-04-21
**Owner:** Tal
**Analyst support:** Mary
**Status:** Plan drafted; ready for execution pending interview pool confirmation.

> Companion to [`brainstorm-problem-hypotheses.md`](./brainstorm-problem-hypotheses.md). That doc holds the hypotheses (12) and themes (5). This doc is the **plan to validate or kill each**, sized to a realistic interview pool (~30 people from Tal's network) plus a deep industry desk sweep. Nothing in the brainstorm doc is deck-usable until the thresholds below clear.

---

## 1. Goals

Produce evidence strong enough that:

1. **Each theme** (A–E from the brainstorm) is either **validated** (one-liner promoted to the deck, backed by quotes + numbers), **modified** (reframed per findings), or **killed** (dropped from positioning).
2. **Investor conversations** can point to specific interview count, role mix, and report citations — not founder intuition.
3. **Product decisions** are anchored in what practitioners actually experience, especially for Themes C (operating model) and D (install + trust) where we have the strongest founder opinions and therefore the highest confirmation-bias risk.

### Success criteria

- At least **25 completed interviews** (out of the 30-person pool) — 80%+ completion rate.
- At least **10 cited desk sources** per theme (industry reports, surveys, peer-reviewed studies, high-signal community threads).
- A written **synthesis doc per theme** with: validates-if thresholds met (yes/no), top 5 quotes, 3 key numbers, and one deck-ready headline.
- A **kill list** — themes that failed their threshold, explicitly retired from the deck.

---

## 2. Interview pool

### Size and composition

- **Total target:** 30 interviewees. **Completion target:** 25 (accounting for no-shows and reschedule drift).
- **Source:** Tal's personal network. 39 design leaders were imported from LinkedIn connections on 2026-04-19 (see git: `e6b7ad5`) — the pool draws from this plus hands-on practitioners.

### Role split (target, not rigid)

| Role | Target | Why |
|---|---|---|
| Design leaders (Director+, Head of Design, VP) | 12 | Own methodology adoption; speak for teams; decision-makers on process and tooling |
| Hands-on designers / design engineers | 8 | Feel install and context pain most directly; use AI tools daily |
| PMs / design-adjacent PMs | 5 | Own rituals and process; see the Agile-vs-AI tension firsthand |
| Eng managers at design-heavy orgs | 5 | Bridge design-eng; validate Theme B (team memory) and Theme C (operating model) |

### Screening criteria

Include only if the interviewee:

- Uses at least **two** of: Claude, ChatGPT, Cursor, Copilot, Perplexity, Figma AI — **at least weekly** — for real work (not hobby).
- Works on a team of **≥ 3** (solo founders skew Theme B).
- Is at a company **not purely AI-infra** (want product teams using AI, not AI labs).

Explicitly *exclude*: pure AI-researchers, pure prompt-engineers, solo indie hackers. These aren't our ICP.

### Known pool gap

The 30-person pool is design-heavy. **Theme E (governance / shadow AI)** wants security / IT leads, which this pool doesn't cover. Two options:

1. Recruit 3–5 security leads separately (stretch goal).
2. Rely on desk research for Theme E and note the gap in the synthesis.

Default to option 2 unless the design interviews surface governance pain strongly enough to justify the extra recruitment.

---

## 3. Unified interview guide (~45 min)

**Format:** semi-structured. Remote video (Zoom / Meet). Audio-recorded with consent; transcribed via Whisper or Otter. Notes taken live in a shared template (see §5).

The guide is **one script for all interviewees**, organized by the 5 themes. Each interviewee touches every theme — this is efficient given a single pool and makes cross-theme analysis possible (e.g. "how often do people mention context AND methodology in the same breath").

Each section has: an **anchor question** (always asked), 1–2 **probes** (asked if time), and at least one **counter-probe** (actively tries to falsify the hypothesis, not just confirm it).

### Intro (3 min)

- Consent to record + use anonymized quotes in investor materials.
- "What's your role? Team size? Rough % of your work that involves AI tools right now?"
- "Which AI tools are you using weekly?" *(listen for 2+ — screening check)*

### Section 1 — Theme A: Context memory (6 min)

*Hypotheses: H1, H2, H7, H12*

- **Anchor:** "Walk me through the last time you had to re-explain context to Claude, ChatGPT, or Cursor. What happened, and how did it feel?"
- **Probe:** "Across the AI tools you use, where does context live? When you switch tools, what do you lose?"
- **Probe:** "How long does it typically take to get back into a session from yesterday or last week?"
- **Counter-probe:** "Do Claude Projects, ChatGPT memory, or Cursor's rules already solve this for you?"
- **Probe (for H1):** "If someone built a 'project management app for AI work' that you had to open and work inside — would you use it? Why or why not?"

### Section 2 — Theme B: Team memory (6 min)

*Hypotheses: H3, H6, H11*

- **Anchor:** "How does your team share what people have done with AI? Slack? Shared docs? Not at all?"
- **Probe:** "In the last 30 days, can you name a moment two people on your team solved the same thing with AI separately?"
- **Probe:** "If a teammate disappeared tomorrow, what AI work of theirs would be lost — and would anyone notice?"
- **Counter-probe:** "Does Slack + shared Notion already cover this? Where specifically does it break down?"

### Section 3 — Theme C: Operating model (8 min — highest priority)

*Hypotheses: H4 (revised), H8, H9*

- **Anchor:** "Does your team have a *named* process for working WITH AI? What do you call it?" *(Listen for: 'we don't really,' 'kind of Agile,' 'we're figuring it out.')*
- **Probe:** "Tell me about a time your team's existing process — Agile, Scrum, Shape Up, whatever — felt *wrong* for AI-assisted work."
- **Probe:** "Does AI ever feel like it's running too fast for your team's rhythm? Or too slow?"
- **Probe:** "If I said 'we run a Fish model — Head phase is explore, Body is build, Tail is ship, and every card is sized bigger-vs-smaller and known-vs-unknown' — does any part of that vocabulary map to something missing in your world?"
- **Counter-probe:** "Is Agile-with-AI basically fine for you, just faster? What would have to change for you to switch frameworks?"

### Section 4 — Theme D: Install + trust (6 min)

*Hypotheses: H5 (revised, with trust prong)*

- **Anchor:** "Walk me through the last AI tool you installed. What happened?"
- **Probe:** "Any AI tool you wanted to try but gave up on? Why?"
- **Probe (trust prong):** "When you install something AI-powered on your work machine, what goes through your head? Any hesitation about permissions, data, what it's watching?"
- **Counter-probe:** "For you, is install complexity the blocker, or is it something else — time, priority, permission from IT?"

### Section 5 — Theme E: Governance + ROI visibility (5 min, skip if not relevant)

*Hypotheses: H10, H11*

Skip if the interviewee has no manager / IT / compliance exposure.

- **Anchor:** "Does anyone on your team use personal Claude or ChatGPT accounts for work?" *(Ask casually — this surfaces shadow AI without judgment.)*
- **Probe:** "If your VP asked 'is AI paying off for your team,' could you answer with data?"
- **Probe:** "Has your company's security or legal team raised AI usage concerns? What happened?"

### Section 6 — Open-ended (5 min)

- **Anchor:** "What didn't I ask about that I should have? What AI-workflow pain have you hit that none of my questions touched?"
- **Probe:** "What pain in your AI workflow would you pay — actual money, not 'I'd try it' — to make go away?"

### Close (2 min)

- Thank.
- Ask for 1 referral (design leader or hands-on practitioner who should be in this research).
- Confirm anonymization preferences — name/company omitted, title/role OK, quotes OK.

---

## 4. Industry desk research — deep sweep

Runs in parallel with interviews. No scheduling dependency, so start immediately.

### Tier-1 sources (load-bearing for the deck)

These are the reports an investor would expect us to cite. Extract specific numbers and quotes.

| Source | Why | Extract targets |
|---|---|---|
| **Anthropic Economic Index** | Authoritative usage data from Claude itself | Task types, session durations, repeat-task rates; signals for Theme A (re-explanation) and C (workflow patterns) |
| **State of AI at Work** — Slack / Asana / Microsoft / GitHub editions | Industry benchmarks on adoption, time spent, pain points | Adoption %, hours-on-AI/week, "shadow AI" prevalence (Theme E), team-coordination gaps (Theme B) |
| **GitHub Octoverse** (latest) | Developer workflow + Copilot usage data | Multi-tool usage patterns, team-vs-individual stats (Theme B, D) |
| **Stack Overflow Developer Survey** (latest) | AI tool adoption, satisfaction, pain points across 60k+ devs | Install friction, tool-switching, satisfaction deltas (Theme D, A) |
| **a16z / Sequoia / Menlo "State of AI in Enterprise"** | VC-authored reports — literally what investors read | Market-sizing language, competitive landscape; use for positioning tone, not for our primary numbers |
| **Gartner AI adoption cycle reports** (where accessible) | Enterprise adoption curve + governance signals | Theme E — shadow AI adoption and governance gap |
| **McKinsey / BCG "AI at work" reports** | C-suite-readable productivity numbers | ROI-visibility claims (Theme E), adoption resistance (Theme D) |

### Tier-2 sources (color + qualitative texture)

Use for quotes and texture, not primary numbers.

| Source | Why |
|---|---|
| **Lenny's Newsletter** archives (AI at work series) | PM-perspective, very close to our ICP |
| **Latent Space podcast + newsletter** | AI practitioner voice; often has team-workflow insights |
| **Every.to — especially "Napkin Math" and "Source Code"** | Design + PM perspectives on AI workflow |
| **Intercom's "Teams using AI" series** | Case studies of real team adoption |
| **r/ClaudeAI, r/ChatGPTPro, r/ExperiencedDevs, r/cscareerquestions** | High-signal complaints; search for "context," "re-explain," "lost" — direct Theme A evidence |
| **Hacker News** threads on AI-workflow pain (high comment counts) | Ditto — especially for Theme D (install) |
| **Shape Up case studies + Basecamp writing** | Comparison point for Theme C (methodology alternatives) |

### Tier-3 sources (supporting only)

- Vendor blog posts (Anthropic, OpenAI, Cursor, Figma) — for understanding competitor positioning, not as evidence.
- X/Twitter threads — high risk of cherry-picking; use only for illustrative quotes, never as a load-bearing citation.

### Extraction targets per theme

Before doing any reading, define exactly what we want to find. This is the anti-confirmation-bias rule — we're looking for specific data points, not "interesting stuff."

| Theme | What to extract | What would kill it |
|---|---|---|
| **A — context memory** | Stats on context-loss hours/week, % of users citing re-explanation as a top pain, prevalence of multi-tool use (users with 2+ AI tools) | If Claude Projects / ChatGPT memory adoption is high AND satisfaction is high, the pain is being solved |
| **B — team memory** | % of teams reporting coordination gaps around AI, duplicate-work anecdotes, existing solutions in use (Glean, Notion AI) | If teams report Slack + Notion is sufficient and no duplicate-work pain |
| **C — operating model** | Agile-with-AI friction quotes, attempts at AI-specific methodologies, stats on process dissatisfaction in AI-heavy teams | If teams report Agile-with-AI works fine; or competing methodology has already claimed this space |
| **D — install + trust** | Time-to-first-value benchmarks for AI tools, abandonment stats, permission/security concerns in AI tool adoption | If install is trivial for target users; or trust is already solved by enterprise SSO/deployment |
| **E — governance + ROI** | % of employees using personal AI accounts for work, stats on enterprise AI governance gap, ROI-measurement attempts | If Copilot Enterprise / ChatGPT Enterprise / Gemini for Workspace have already closed this gap |

---

## 5. Notes template (per interview)

Every interview produces one file in [`_bmad/planning-artifacts/research/interviews/`](./research/interviews/). Template:

```markdown
# Interview — {Name-or-initials}, {Role}, {Company-size}

**Date:** YYYY-MM-DD
**Tools used weekly:** {Claude / ChatGPT / Cursor / etc.}
**Team size:** {n}
**Anonymization:** {name omitted | title OK | quotes OK}

## Theme A — Context memory
- Key quote:
- Specific example given:
- Counter-probe response:

## Theme B — Team memory
- ...

## Theme C — Operating model
- ...

## Theme D — Install + trust
- ...

## Theme E — Governance + ROI
- ...

## Section 6 — Open-ended
- What I didn't ask about:
- Would-pay pain:

## Tagged quotes (for cross-theme analysis)
- "{verbatim quote}" — tag: #A-reexplanation | #C-agile-broke | ...

## Signals
- Strong validation signals: ...
- Falsification signals: ...
- Surprises: ...
```

---

## 6. Synthesis approach

Every 5 interviews, run a rolling synthesis. Don't wait until all 25 are done — directional findings after interview 10 often change the guide for interviews 11–30.

### Per-interview coding

- Tag every quote with its theme (#A / #B / #C / #D / #E) and signal type (#validates / #falsifies / #surprise).
- Note a "would-pay" marker on any pain the interviewee explicitly says they'd pay to fix.

### Per-theme synthesis (after all interviews complete)

For each theme, produce one ~1-page synthesis:

1. **Count:** how many interviewees validated (named a specific pain matching the hypothesis), vs. falsified (explicitly said "not a problem for me").
2. **Top 5 quotes** — the most vivid, specific, memorable. These are the deck quotes.
3. **Three numbers** — specific stats the interviewees or the desk research produced. These are the deck numbers.
4. **Validates-if / falsifies-if check** — does this theme clear the threshold?
5. **Revised one-liner** — the deck headline, rewritten using the interview language (not founder language).
6. **Competitive watch-out** — what existing solution might already close this, based on what interviewees mentioned.

### Validates-if / falsifies-if thresholds (unchanged from brainstorm doc)

| Theme | Validates if | Falsifies if |
|---|---|---|
| **A** | ≥60% of interviewees name a specific recurring re-explanation pain; ≥3 quantify it (hours/week) | Users report context loss is trivial or already solved by ChatGPT memory / Claude Projects |
| **B** | ≥50% of teams admit duplicate work across AI users in last 30 days; ≥3 call it "worth paying to solve" | Teams already coordinate via Slack + shared Notion and don't feel the gap |
| **C** | ≥50% of leads say their process doesn't match how they actually work now AND volunteer AI as the reason without prompting | Leads report Agile-with-AI is working fine; or FISH vocabulary doesn't resonate |
| **D** | ≥50% can name a specific AI tool they gave up on; of those, ≥half cite trust concerns (not just complexity) | Most succeed with AI installs; or the blocker is purely time/priority, not complexity/trust |
| **E** | ≥40% of ICs admit using personal AI for work; and ≥2 interviewees unprompted flag governance as broken | Enterprises have solved this via Copilot / ChatGPT Enterprise; or ICs don't feel the tension |

---

## 7. Timeline

Assuming Tal runs interviews at ~4/week (realistic with scheduling + day job):

| Week | Activity |
|---|---|
| W1 | Recruit: send outreach to 40 from 30-target pool (expect 75% response). Lock interview guide. Start desk research — Tier 1 sources. |
| W2 | Interviews 1–4. First rolling synthesis. Desk: Tier 1 continues. |
| W3 | Interviews 5–9. Second rolling synthesis — adjust guide if needed. Desk: Tier 2 begins. |
| W4 | Interviews 10–14. Third rolling synthesis. Desk: Tier 2 continues. |
| W5 | Interviews 15–19. Fourth rolling synthesis. |
| W6 | Interviews 20–25. Desk research wrap. |
| W7 | Synthesis — per-theme writeups. Draft revised deck one-liners. |
| W8 | Buffer + stragglers + investor deck rewrite against validated themes. |

**Total: 8 weeks.** Compression possible if Tal can do 6 interviews/week — down to ~6 weeks.

---

## 8. What this produces

At the end of the research:

1. **Per-theme synthesis docs** (5 × ~1 page) — saved to `_bmad/planning-artifacts/research/`.
2. **Interview notes archive** — 25 files in `_bmad/planning-artifacts/research/interviews/`, redacted per consent.
3. **Desk research citation file** — one document with every cited source, page/URL, extracted data point, and which theme it supports.
4. **Revised deck problem slides** — the actual outputs that go into the investor deck, traceable back to specific interviews and citations.
5. **Kill list** — themes that failed their threshold, with the evidence that killed them. Saved as a footnote doc so future-us doesn't re-litigate.

---

## 9. Anti-bias checklist

Before each interview and each synthesis session, re-read:

- [ ] **Counter-probe on every theme.** Actively try to falsify — not to prove.
- [ ] **"Would you pay?" is the only validation that counts for investor decks.** "That'd be nice" is zero evidence. "I'd pay $X/seat" is gold.
- [ ] **Founder quotes are banned from synthesis.** If Tal said it, it's not evidence. Only interviewee quotes + desk citations count.
- [ ] **Track the surprises separately.** Things that didn't fit any theme — those often become the next product cycle's wedge.
- [ ] **One theme can fail without the deck failing.** Don't round up. A validated A+B+C is enough for a strong deck; forcing D/E to validate when they don't is how decks die in due diligence.

---

## 10. Open questions before kickoff

- [ ] Who owns scheduling the 30 interviews — Tal, or a research associate?
- [ ] Recording platform + transcription service — confirm and configure before interview 1.
- [ ] Compensation — are we offering anything (gift card, product early access) to interviewees? Affects response rate.
- [ ] Theme E scope — commit to option 1 (recruit security leads separately) or option 2 (desk-only for E). Default option 2.
- [ ] Confidentiality — is any interviewee at a competitor or potential strategic partner? Flag before interview to avoid awkwardness.
