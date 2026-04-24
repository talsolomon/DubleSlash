---
marp: true
theme: default
class: invert
backgroundColor: "#0d0d0f"
color: "#e8e8ec"
paginate: true
style: |
  section {
    font-family: 'Inter', 'SF Pro Display', system-ui, sans-serif;
    padding: 52px 64px;
    font-size: 18px;
    line-height: 1.55;
  }
  h1 { font-size: 2.6rem; font-weight: 700; letter-spacing: -0.02em; margin-bottom: 0.3em; color: #f5f5f7; }
  h2 { font-size: 1.85rem; font-weight: 600; letter-spacing: -0.015em; color: #f5f5f7; border-bottom: 1px solid #2a2a30; padding-bottom: 0.25em; margin-bottom: 0.6em; }
  h3 { font-size: 1.25rem; font-weight: 600; color: #d0d0d6; margin-top: 1em; margin-bottom: 0.4em; }
  p, li { color: #c8c8ce; }
  strong { color: #f5f5f7; }
  em { color: #a0a0a8; }
  table { border-collapse: collapse; margin: 0.4em 0; font-size: 0.92em; }
  th { background: #1a1a20; color: #f5f5f7; border: 1px solid #2a2a30; padding: 6px 10px; text-align: left; }
  td { border: 1px solid #2a2a30; padding: 6px 10px; vertical-align: top; }
  code { background: #1a1a20; color: #e8e8ec; padding: 1px 5px; border-radius: 3px; font-size: 0.9em; }
  pre { background: #1a1a20; padding: 14px; border-radius: 6px; font-size: 0.82em; line-height: 1.35; overflow: hidden; }
  blockquote { border-left: 3px solid #4a4a52; padding-left: 14px; color: #a0a0a8; font-style: italic; }
  .small { font-size: 0.85em; color: #888; }
  .ai { background: #2a1f3a; color: #c8a8ff; padding: 1px 6px; border-radius: 3px; font-size: 0.8em; font-weight: 600; }
  .quad { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; margin: 0.8em 0; }
  .quad div { background: #16161c; border: 1px solid #2a2a30; border-radius: 8px; padding: 16px 18px; }
  .quad h4 { font-size: 1.05rem; font-weight: 700; color: #f5f5f7; margin: 0 0 0.4em 0; }
  .quad p { margin: 0.25em 0; font-size: 0.9em; }
  .axis-label { color: #7d7d85; font-size: 0.82em; letter-spacing: 0.08em; text-transform: uppercase; }
  .phase-flow { background: #16161c; border: 1px solid #2a2a30; border-radius: 8px; padding: 20px; margin: 0.8em 0; font-family: monospace; font-size: 0.9em; line-height: 1.7; text-align: center; }
---

# FLOW
## Agile, for the AI era.

A methodology that makes AI-assisted product work actually ship — with the designer / PM / dev in control, not watching.

<span class="small">**FLOW** — the AI-era evolution of the FISH model (Tal Solomon, 2024). Same fish types (Nemo / Tuna / Salmon / Willy); now in motion — iteration first-class, AI agents nudging the method, handoffs that travel across tools. Pairs with the company value *"flows, not frames."*</span>

<span class="small">Source methodology doc: [`methodology/flow.md`](../../../methodology/flow.md)</span>

---

## 1 · The pains we fix

What actually hurts when you build product with AI today — from designers, PMs, and devs we've heard:

- **"I don't know where I am."** Long AI sessions leave you disoriented — progress vs. loops feels the same.
- **"I don't trust any of this is saved."** Sessions feel ephemeral. When Claude closes, you're not sure what survived.
- **"The AI doesn't guide me through a process."** It responds. It doesn't shape the work.
- **"It has no UX instinct."** No questions about users. No journeys. Jumps straight to solutions.
- **"When I switch tools, I start over."** Claude → Cursor → Figma → back: every tool is a blank slate.
- **"I can't see the project — just pieces."** My project is scattered across 50 chat sessions. No consolidated view.
- **"There's no history of who decided what."** Can't audit AI decisions. Can't review. Can't show teammates.

These aren't process quibbles. These are the reasons AI-assisted projects ship late, drift off-brief, or quietly die.

---

## 2 · What FLOW is, in one line

> **FLOW is Agile for AI-era product work:** a **user-centered**, design-thinking-shaped flow that keeps the human oriented, the project consolidated, and the AI aligned to the *phase of thinking* the work is actually in.

**What it guarantees:**
- You always know where you are in the project.
- Context is saved across sessions, tools, and teammates.
- AI joins in the right *stance* (research vs. shape vs. build vs. release) instead of drifting.
- Handoffs — human↔human, human↔AI, AI↔AI — are explicit and resumable.
- The project has a history you can audit, review, and ship.

**User-centered — that's why Double Diamond is the backbone.** FLOW is here so your *users* win. The project's success is how you know the user won.

---

## 3 · From FISH to FLOW — what changed

| FISH (2024, Tal Solomon) | FLOW (2026) |
|---|---|
| Fish-shaped: linear head → body → tail | The fish *moves*: iteration inside every phase, reverse flow allowed |
| 4 fish types (Nemo / Tuna / Salmon / Willy) by size × familiarity | **Kept.** Same four; AI-era methods inside them. |
| PD leader per fish type | **Kept + upgraded:** PD leader picks the AI expert-agent that leads the card. |
| Brief-not-PRD, journey meetings, micro-brief | **Kept.** Core principles untouched. |
| Sprint-shaped delivery | **Dropped.** AI lets us ship continuously; no sprint cadence. |
| Designer / team running the method on their own discipline | **Replaced** by AI agents that keep the method running when the human is busy. |
| Artifacts in your head + Figma + a PRD | **Replaced** by a portable card that travels across tools + sessions + teammates. |

*FLOW is the same fish, in motion.*

---

## 4 · The 2×2 — two axes, four fish

<div class="axis-label">Top row: familiarity is <strong>high</strong> — you've shipped work like this before.<br/>Bottom row: familiarity is <strong>low</strong> — user / problem / domain are new.</div>

<div class="quad">
<div>
<h4>🐟 Tuna — big, familiar</h4>
<p>Multi-screen, established patterns.</p>
<p>Designer-led, light research.</p>
<p><em>e.g. billing redesign</em></p>
</div>
<div>
<h4>🐠 Nemo — small, familiar</h4>
<p>One screen / element / copy change.</p>
<p>No PRD, no long meetings.</p>
<p><em>e.g. tooltip copy fix</em></p>
</div>
<div>
<h4>🐋 Willy — big, unfamiliar</h4>
<p>Strategic. Full team.</p>
<p>Heavy research. Researcher + founder leading.</p>
<p><em>e.g. new product area</em></p>
</div>
<div>
<h4>🐡 Salmon — small, unfamiliar</h4>
<p>Few screens, unknown users.</p>
<p>Research-led. Validate before launch.</p>
<p><em>e.g. drop-off in onboarding step 3</em></p>
</div>
</div>

<div class="axis-label">Left column: bigger scope &nbsp; · &nbsp; Right column: smaller scope</div>

---

## 5 · The four fish, without sprints

| Fish | Size × familiarity | Shape | Partner involvement | Lead (PD) |
|---|---|---|---|---|
| **Nemo** | small × familiar | one session → ship same day | Low | Designer |
| **Tuna** | big × familiar | a few days → a couple weeks | Low | Designer |
| **Salmon** | small × unfamiliar | a few days → a couple weeks | High | Researcher |
| **Willy** | big × unfamiliar | weeks → a month+ | High | Researcher + founder / PM |

- **Nemo** — quick, conventional. No long meetings, no PRD.
- **Tuna** — bigger scope, established patterns. Multi-screen, storyboard-led.
- **Salmon** — research-led. Few refined screens. Validate problem before shipping.
- **Willy** — strategic. Full team. Maximum methodology.

<span class="ai">[AI-era]</span> *PD leader* picks which expert agent leads the card. Designer-led on top row; researcher-led on bottom.

---

## 6 · The four phases (with iteration)

<div class="phase-flow">
&#10140; &nbsp;&nbsp; Explore &nbsp;&#10233;&nbsp; Solidify &nbsp;&#10233;&nbsp; Build &nbsp;&#10233;&nbsp; Ship &nbsp; &#10140;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ⟲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ⟲ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ⟲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ⟲<br/>
<span class="small">each phase loops internally · reverse flow when a later phase exposes an earlier gap</span>
</div>

| Phase | Goal | You're done when… |
|---|---|---|
| **Explore** | Open the aperture. Surface options, questions, premises. | You can name the problem and its *shape* |
| **Solidify** | Converge on *one* shape. Lock decisions that unblock Build. | One brief / pitch exists — not five half-shapes |
| **Build** | Execute against the locked shape. | The thing runs; tests pass; AC met |
| **Ship** | Narrate, release, measure. | Released + trust receipt + first learning captured |

**Iteration is first-class:** micro-loops inside every phase (ask → answer → sharpen), and reverse flow (Build → Solidify) when a later phase exposes an earlier gap. The linear arrow is the *default*, not a cage.

---

## 7 · Method matrix — Explore + Solidify

Cells read **additively** — each bigger fish inherits the smaller fish's methods *plus* its own.

| Phase | 🐠 **Nemo** | 🐟 **Tuna** | 🐡 **Salmon** | 🐋 **Willy** |
|---|---|---|---|---|
| **Explore** | Competitor scan · Heuristic eval · Micro-brief · Abstraction laddering | *+* Journey meeting · OSD · Convention inventory · Stakeholder mapping | *+* User interviews · Fly-on-the-wall observation · JTBD · Journey map · **Affinity clustering** · Empathy map | *+* Contextual inquiry · Premortem · Scenario planning · Pitch outline · **Problem tree analysis** · 5 forces · Opportunity solution tree |
| **Solidify** | HMW · Problem framing · One sketch · 3–5 AC bullets | *+* Storyboard · Brief · Microinteractions · DS-extension · Journey meeting · Statement starters | *+* Concept test · Measurement plan · Evidence-informed AC · **Rose/thorn/bud** · Concept poster | *+* 5 whys · SWOT · Pitch/RFC · Decision log · Multi-level AC · **Importance/difficulty matrix** · **Bull's-eye diagram** · Kano · RICE · Impact mapping |

---

## 8 · Method matrix — Build + Ship

| Phase | 🐠 **Nemo** | 🐟 **Tuna** | 🐡 **Salmon** | 🐋 **Willy** |
|---|---|---|---|---|
| **Build** | Smallest change · Golden-path test · AC-as-tests | *+* Storyboarding · Fake prototypes · Iterative prototyping · Component-library-first · Motion principles · Joint review · **Creative matrix** · Crazy 8s | *+* Co-creation · Wizard-of-Oz prototyping · Instrumented build · **Think-aloud testing** · Iterate-once | *+* Thin vertical slice · Integrated requirements · Staged rollout per slice · Measure per slice · Marathons · Reversed solutions · Round robin · SCAMPER |
| **Ship** | Beta group · Heatmap · 1-line changelog · Trust receipt | *+* Feedback loops · Private preview · Release notes · Journey meeting · First-click test | *+* Usability · Baseline + post measurement · Learning log · Next-loop queue · ISO 9241 triad · First-impression test | *+* A/B test · Canary release · Staged rollout (internal → alpha → beta → GA) · Retrospective (Rose/thorn/bud, Sailboat, 4Ls) · Master trust receipt · Continuous-discovery interviews |

**The matrix is prescriptive.** Agents surface missing cell-methods before "done," not after.
<span class="small">All methods above are publicly-known design-research techniques — none are proprietary. See flow.md §8 for the full 100+ method catalog and adaptation-for-AI notes.</span>

---

## 9 · AI-era stream · Salmon Explore (end-to-end)

What the agent actually does — not a vague "run interviews."

| Step | AI does | Human does |
|---|---|---|
| 1. Frame the card | Proposes fish type from a 60-sec Q&A, writes the card summary | Confirm |
| 2. Discovery scan | Pulls competitor patterns, prior art, analytics; drafts a one-pager | Read + react |
| 3. Interview design | Drafts questions from the one-pager + recruiting criteria | Edit |
| 4. Scheduling wrap | Generates outreach emails, holds calendar slots, prepares consent form | Send / confirm |
| 5. The conversations | Live-transcribes, runs real-time note assist | **Actually talks to users** (5–8) |
| 6. Clustering | Affinity-clusters transcripts into themes (LUMA) | Rename + reject weak clusters |
| 7. Framing candidates | Drafts 3–5 problem framings with evidence citations | Pick the one the interviews *most* support |
| 8. Handoff | Generates the Solidify brief as a legible artifact (slide 10) | One-click approve or edit |

**AI wraps the grunt work. The human does the irreducible work** — having the conversation, making the judgement, picking the framing.

---

## 10 · The handoff as a real artifact

Not an XML blob. A brief the next phase can read in 30 seconds.

<div class="quad" style="grid-template-columns: 1fr;">
<div>
<h4>Explore → Solidify · card: onboarding-step3</h4>
<p><strong>Problem framing (locked):</strong> Users abandon step 3 because the password strength meter surfaces after typing, making them feel retroactively judged.</p>
<p><strong>Scope locked:</strong> step 3 only. SSO flow is a separate card (queued).</p>
<p><strong>Still open for Solidify:</strong> copy pattern (passive vs. instructional) · step placement (step 3 vs. step 1).</p>
<p><strong>Evidence:</strong> 7 interviews · affinity clusters (4 themes) · competitor scan (3 tools).</p>
<p><strong>Confidence to advance:</strong> 0.8. <em>Notes: two open items above are blocking Solidify; everything else deferred.</em></p>
</div>
</div>

### Where it lives + how the next session picks it up

- **Saved locally** to `.flow/cards/onboarding-step3/explore.md`.
- **Synced to Duble Slash Cloud** if enabled — teammates pick up where you left off.
- **Next day, any tool:** `//solidify onboarding-step3` → Solidifier reads the brief + evidence automatically.

### The project-status view — always, even in OSS

- `//project-status onboarding-step3` → **the consolidated project view**, right in the chat. Every phase's brief, evidence, decisions, trust receipts. Side-by-side. No cloud needed.
- `//projects` → list every active card with fish type + phase + last update.
- In **Duble Slash Cloud**: the same data as a real project dashboard (Kanban / timeline / handoff-graph views). Same file, richer UI.

*This is how we answer the slide-1 pains "I can't see the project — just pieces" and "no history of who decided what" — in OSS-Claude on day one.*

---

## 11 · Agent posture — the nudge

Agents don't refuse. They **nudge** — surface what you're skipping, offer the right-sized version, let you decide.

### Three intensity levels

- **Nudge (default, 95% of the time).** *"Before we sketch — want 5 minutes of competitor scan + one HMW? That's usually what lands this kind of card faster."*
- **Strong nudge.** *"I'll build this, but we're skipping measurement on a Salmon — that's usually the thing that makes this type of project fail. OK to skip, or quick plan first?"*
- **Hard stop (rare).** *"Blocking: you're shipping a Salmon without a measurement plan. Without it we can't tell if the project worked. Add a plan, or change the fish type."* Reserved for **real project risk**, not style preferences.

### What the agent never does

Silently do the wrong-phase work. Say "fine, whatever" and cave. Debate you in-character. The nudge is **persistent and kind** — a great design mentor, not a security guard.

---

## 12 · Four agent moves (shared vocabulary)

Every agent signal uses one of four types — so you always know what's expected.

| Move | Blocks? | When |
|---|---|---|
| **Question** | No — keep working | Mid-phase unknowns. Cheap. Default. |
| **Review** | Soft pause | Phase exit with low confidence. "Brief drafted — sign off?" |
| **Handoff** | No — normal transition | Phase exit. Emit the next-phase brief. |
| **Block** | Hard stop | Real project risk only. Sigil mismatch. Missing measurement on a research-led fish. |

**Rules:** always narrated in chat · **Handoff** is the only move that changes phase · **Block** is rare by design.

---

## 13 · Worked example · Nemo (tooltip fix)

**Sigil:** smaller × familiar · **Target shape:** 2 hours, one session.

| Phase | Time | AI | Human |
|---|---|---|---|
| **Explore** | 10 min | Heuristic-scan of tooltip; 3 competitor patterns; 1 HMW reframe draft | Confirm the reframe |
| **Solidify** | 20 min | Draft tooltip copy options (3); generate AC bullets | Pick copy; approve AC |
| **Build** | 30 min | Edit `ExportButton.tsx`; generate screen-reader test | Review diff; run test |
| **Ship** | 10 min | Draft commit + changelog + trust receipt | Approve & push |

**What FLOW did:** AI ran competitor scan, drafted the copy, wrote the test, generated the commit. Designer did the taste calls (which reframe, which copy, which AC matter). **Zero PRD. Zero long meeting. 2 hours.** The card is resumable if interrupted — all four handoffs saved to `.flow/cards/tooltip-csv-export/`.

---

## 14 · Worked example · Salmon (onboarding drop)

**Sigil:** smaller × unfamiliar · **Problem:** 40% drop at signup step 3.

| Phase | Span | AI | Human |
|---|---|---|---|
| **Explore** | 5 days | Discovery scan · interview guide · scheduling emails · transcripts · **affinity clusters** (4 themes) · 3 framing candidates | 7 user conversations · cluster validation · framing pick |
| **Solidify** | 3 days | Brief draft · measurement plan draft · concept-test script · AC draft | Concept test (5 users) · edits & final pick |
| **Build** | 2 days | Copy + meter-surface logic · instrumentation scaffold · usability test script | Usability test (4/4 passed) |
| **Ship** | 2 weeks | Baseline capture · post-release measurement · learning log draft · next-loop brief draft | Release decision · next-loop prioritization |

**Outcome:** step 3 completion **60% → 78%** (+18 pp). Real cause (meter placement, not wording) surfaced because Explore stayed heavy. **Human never babysat.** AI did the grunt work; designer did the irreducible work.

---

## 15 · Pain → fix (closing the loop from slide 1)

| The pain | How FLOW fixes it |
|---|---|
| *"I don't know where I am."* | Every moment, your card states its fish + phase. The AI echoes it back. |
| *"I don't trust any of this is saved."* | Every handoff is a file at `.flow/cards/<card-id>/`. Not in a chat, not in memory. On disk. |
| *"The AI doesn't guide me through a process."* | The agent's *job* is to run the process — surface missing methods, nudge the next step. |
| *"It has no UX instinct."* | Agents are phase-shaped. Explorer asks about users before anything else. Period. |
| *"When I switch tools, I start over."* | Card + handoffs move across tools via Duble Slash Cloud. Open Cursor, resume where Claude left off. |
| *"I can't see the project — just pieces."* | `//card <id>` shows every phase's brief + evidence + decisions in one view. |
| *"No history of who decided what."* | Every handoff logs `locked` decisions, `open` questions, AI vs. human contribution. Auditable. |

---

## 16 · What FLOW is — and what it replaces

**FLOW is Agile for the AI era — and it's user-centered, not outcome-driven.**

- Agile assumed humans owning process discipline.
- FLOW assumes AI is present and gives it a *role*.
- Double Diamond is the backbone because **the point is that the user wins**. The project's success is the *signal* that the user won.

### What FLOW replaces

- **Agile sprints** — replaced by continuous ship-ability per fish-shape.
- **PRDs** — replaced by phase-shaped briefs.
- **Standups** — replaced by project-level digests (`//project-status` + Duble Slash Cloud).
- **Vague "process" in AI tools** — replaced by phase-shaped, nudging agents.

### What FLOW is *not*

- Not project-management software — FLOW runs *one project's lifecycle*; portfolio view sits above.
- Not design-only — works for code, research, decisions, comms.
- Not tool-prescriptive — Figma, Claude, Cursor, VS Code, napkin. FLOW cares about phase + fish + handoff.
- Not a KPI-chasing framework — the project serves users first; metrics come from user outcomes, not the other way around.

---

## 17 · Lineage + what's next

### Lineage
- **Bánáthy** (1960s–70s) — divergence / convergence
- **Double Diamond** (UK Design Council, 2004 / 2019) — two-diamond model
- **FISH** (Tal Solomon, 2024 — [talsolomonux.com/p/0d2](https://www.talsolomonux.com/p/0d2)) — fish types, size × familiarity axes, brief-not-PRD, journey meetings, PD leader per fish
- **FLOW** (2026) — FISH in motion: iteration inside phases, reverse flow, AI-era method sets, machine-readable handoffs, cross-tool continuity

### What's next
- **Phase 1 — methodology ✅** ([`methodology/flow.md`](../../../methodology/flow.md); this deck)
- **Phase 2 — agent architecture** (BMAD-style skill study)
- **Phase 3a — 3 deep expert agents** (Design, PM, Dev)
- **Phase 3b — remaining 6 experts + 4 operators** (Dora, Sol, Bran, May)
- **Phase 4 — directory reorg + rename sweep**
- **Phase 5 — stretch test** (dogfood one real fish)
- **Phase 6 — install polish** (`npx @dubleslash/install` → menu-bar `//`)
- **Phase 7 — pitch-deck rebuild** for the rebuilt architecture

<span class="small">Decisions pending during audit: (1) final methodology name — FLOW / FLOW / other? (2) method catalog — expanded to public-domain methods only; AI-adaptation of each method is a future task; (3) whether the user-centered + Agile-replacement positioning lands.</span>
