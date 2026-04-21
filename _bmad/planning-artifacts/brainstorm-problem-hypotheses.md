# Brainstorm — Problems Duble Slash Solves (Hypotheses + Research Plan)

**Date:** 2026-04-21
**Facilitator:** Mary (Analyst agent), via `/bmad-brainstorming`
**Status:** Hypothesis set locked. Research plan drafted. **Nothing here is validated yet — do not use in investor deck without clearing the evidence threshold per theme.**

---

## HMW framing

> *How might we define the problems Duble Slash solves — with evidence strong enough for an investor deck, not just founder intuition?*

This brainstorm is **problem-discovery**, not solution-design. Output is a hypothesis list + a research plan to validate each, so that deck copy stands on evidence, not vibes.

---

## 1. Hypothesis set

All 12 hypotheses below are **unvalidated claims**. Each is written to be testable and falsifiable.

### Tal's original 5 (restated as testable hypotheses)

- **H1 — AI work needs a layer, not another destination app.** Teams won't adopt "Linear-for-AI." They already have Linear, Jira, Slack, Notion — and they use Claude, Cursor, ChatGPT alongside. The gap is that no existing tool is the right *shape*: an always-on layer that works where the work already happens, instead of asking teams to move into a new destination app.
- **H2 — AI context is lost at every boundary.** Claude, ChatGPT, Cursor each maintain siloed memory. Users re-explain context across sessions, devices, and teammates — and this costs measurable hours/week.
- **H3 — Individual AI use doesn't compound into team process.** Every person talks to their own AI; insights don't surface across the team; the same question gets asked 4× in a week.
- **H4 — Teams have no operating model for human-AI collaboration.** Even as AI agents become methodology-aware, there's no shared vocabulary, no named phases, no ritual for who decides what when a human and an AI are working on the same thing. Teams re-invent this operating model badly, every time. (This stays a problem even if every AI ships smart methodology — the gap is in how *humans + AIs* coordinate, not in AI's own capabilities.)
- **H5 — Install is the adoption ceiling — complexity AND trust.** Non-engineers can't self-serve onto AI-power tooling because (a) install means CLIs, API keys, MCP configs, permissions, AND (b) trust gates further — "what is this installing? what can it see? what does it send where?" Both blockers stack; solving one without the other doesn't move the needle.

### Expanded 7 (candidates Tal didn't list but likely apply)

- **H6 — Invisible AI work debt.** Drafts proliferate in DMs and local files. Nobody knows what's been drafted, by whom, against what prompt. Review/dedupe has no surface.
- **H7 — The pain is the handoff, not the session.** AI is great within a session, terrible across. Users don't complain about "bad AI" — they complain about restarting.
- **H8 — No shared vocabulary for AI-collaboration maturity.** "We're AI-enabled" is as vague as "we're Agile" was in 2010. Without a methodology, teams plateau unevenly.
- **H9 — Agile is breaking under AI throughput.** Sprint ceremonies assume human-paced work; AI ships a prototype in a morning. Teams sense this but can't name the mechanism.
- **H10 — Personal-account shadow AI.** Employees use personal Claude/ChatGPT because enterprise AI is locked down. IP + context leak silently; leaders can't see it.
- **H11 — Leaders can't observe AI adoption.** Is the team actually using AI or performing it? No telemetry without invasive monitoring.
- **H12 — Context is trapped in tool silos.** A user's Claude history, ChatGPT history, and Cursor history never merge. Switching tools = starting over. Cost paid per session.

---

## 2. Analogies (adjacent markets that have validated the shape)

- **Notion / Linear — "shared context for humans"** validated a multi-billion market. H1+H3 assert the same gap exists for humans + AI.
- **1Password — "trust UI for sensitive flows"** made security self-serve for non-admins. Parallels H5 and H10.
- **Figma vs. Sketch — "multiplayer beats single-player for creative tools."** H3 makes the same bet: team AI beats solo AI, once coordination primitives exist.
- **Strava — "make invisible work legible after the fact."** Parallels H6 and H11 — the replay is the product.

Analogies are useful for hypothesis generation and deck narrative. They are **not evidence** on their own.

---

## 3. Converge — five investor-grade problem themes

Grouping the 12 hypotheses into 5 themes. Each theme is a **deck slide candidate**, pending validation.

| # | Theme | Hypotheses | Deck-ready one-liner (draft) | Impact | Feasibility to validate |
|---|---|---|---|---|---|
| A | **AI has no project memory — and no app will fix it** | H1, H2, H7, H12 | "The #1 cost of AI at work isn't compute — it's re-explaining. And the fix can't be another app to adopt." | H | H |
| B | **AI has no team memory** | H3, H6, H11 | "Every AI user on your team is working solo, even when they're in the same Slack." | H | M |
| C | **No operating model for human-AI teams** | H4, H8, H9 | "Agile was built for humans at human speed. Nobody has built the equivalent for teams running at AI speed." | H | M |
| D | **Install is gatekept — by complexity AND trust** | H5 | "Install stops non-engineers twice: once on complexity, once on trust. Solve one, the other still blocks." | M | H |
| E | **AI work is ungoverned** | H10, H11 | "Companies can't see or govern AI work. Security says no; usage happens anyway on personal accounts." | M | M |

**Mapping to product pillars:**
- Theme A ↔ context cloud + layer architecture (menubar, not a destination app)
- Theme B ↔ hosted platform (team sync, beacon)
- Theme C ↔ FISH methodology (OSS distribution)
- Theme D ↔ one-DMG install + trust receipts
- Theme E ↔ trust receipts + redaction (longer-term)

---

## 4. Research plan — separate doc

Full plan lives in [`research-plan-problem-validation.md`](./research-plan-problem-validation.md). That doc covers:

- The 30-person interview pool (design leaders + hands-on practitioners from Tal's network).
- A single unified interview guide with sections per theme (so each interview touches all five).
- A deep industry desk-research sweep (Anthropic Economic Index, State-of-AI-at-Work reports, GitHub Octoverse, etc.) with extraction targets per theme.
- Synthesis approach, timeline, and the validates-if / falsifies-if thresholds per theme.

---

## 5. Evidence weight — what counts for the deck

In order of credibility when an investor reads the slide:

1. **Primary interviews with quotes** (n≥8 per theme, role-diverse). Load-bearing.
2. **Recent industry reports** citing the specific pain — GitHub Octoverse, Anthropic Economic Index, Stack Overflow Dev Survey, State of AI at Work (Asana/Slack/GitHub). Load-bearing when quoted with numbers.
3. **Behavioral observations** — e.g. usability stopwatch data for Theme D. Load-bearing for that specific theme.
4. **Public forum evidence** (Reddit/HN threads with high engagement). Supporting only — never the sole citation.
5. **Founder intuition.** Zero weight. Useful for hypothesis generation (which is exactly how it was used above) — not for claim-making.

**Deck rule:** no one-liner from §3 may appear in an investor slide until its theme has cleared the validates-if threshold in §4.

---

## 6. Recommended direction

Ship Themes **A, B, C** as the deck's core "problems we solve" — **once validated**. They map cleanly onto the three product pillars (context cloud, platform, FISH/OSS) and are the strongest narratively. D and E are adjacent; treat them as "also true, also addressed," not headline slides.

**The single bet if forced to pick one: Theme C (no methodology).** It's the most differentiated — context and team memory have existing competitors (ChatGPT memory, Notion AI, Glean). "Agile broke, FISH replaces it" has nobody standing in that spot, and it's the narrative claim that carries the other two.

---

## 7. Open questions / watch-outs

- **Counter-evidence seriously considered.** If ChatGPT Projects / Claude Projects / Glean already solve Theme A for most users, the headline collapses. Research has to actively probe this, not assume it away.
- **Theme C is the most speculative.** "Agile is breaking" is a bold claim; may resonate strongly with some leads and fall flat with others. If < 50% volunteer AI as the reason unprompted, downgrade C from headline to supporting.
- **Theme E blur.** "Ungoverned AI" overlaps with existing shadow-IT narratives. Needs sharp differentiation or it gets absorbed into Copilot / ChatGPT Enterprise category.
- **Interview pool skew.** The 30-person pool is design leaders + hands-on practitioners from Tal's network — strong for Themes A/B/C/D, weaker for Theme E (which wants security/IT leads). Theme E may need supplemental interviews or desk-only evidence.

---

## 8. Next steps

- [ ] Execute the [research plan](./research-plan-problem-validation.md) — desk research first (no scheduling dependency), interviews in parallel once the guide is locked.
- [ ] Once evidence is in, rewrite the one-liners in §3 with **real numbers and quotes** — only then are they deck-ready.
- [ ] Update [`/website/index.html`](../../website/index.html) and the [pitch deck](./pitch-deck-duble-slash.md) copy to reflect validated problems (not before).
