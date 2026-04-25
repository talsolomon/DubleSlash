---
name: FLOW — the method (one doc)
description: The canonical FLOW methodology — the AI-era evolution of the 2024 Fish Model. One file, every concept. Axes, fish types, phases, curated method sets per cell, per-fish streams, handoff contract, agent posture, worked examples. Merges and supersedes the prior fish/ folder.
type: methodology-spec
owner: Tal
version: 2.0.1
renamed_from: FISH
revised: 2026-04-24 (rev-2: certainty-before-size decision order)
lineage: Bánáthy (1960s–70s) → Double Diamond (UK Design Council, 2004/2019) → Fish Model (Tal Solomon, 2024) → FLOW (this spec, 2026)
---

# FLOW — the method

> *"Communication is the key to success."* — Tal Solomon, [talsolomonux.com/p/0d2](https://www.talsolomonux.com/p/0d2), 2024
>
> *תקשורת היא המפתח שלנו להצלחה.*

**FLOW** is how you run one unit of design / product / engineering work — from messy problem to shipped artifact — so that humans, AI agents, and teammates all describe the same work the same way, at the right intensity, with clean handoffs between phases.

The method has two audiences and two origin stories:

- **Origin A — designers, 2024 →** the **Fish Model** (Tal Solomon, [talsolomonux.com/p/0d2](https://www.talsolomonux.com/p/0d2)) — an anti-waterfall alternative to "every project is a six-month PRD-driven sprint." Sized work by *kind of fish* (Nemo / Tuna / Salmon / Willy); let the intensity of ritual match the kind. Used by design teams on their own discipline.
- **Origin B — AI-era, 2026 →** **FLOW** — the Fish Model in motion: iteration first-class, AI agents nudging the method forward, machine-readable handoffs that travel across sessions / tools / teammates. The fish was a static diagram; FLOW is the fish moving. Agents make discipline cheap — humans-alone often skip their own method; agents don't.

This doc is one source of truth for both. Where a section is an AI-era addition that extends the original Fish Model, it is marked **[AI-era]**. Every other section is preserved from the original.

**The work-classification noun is still "fish"** — you ask *"what fish is this?"* and get Nemo / Tuna / Salmon / Willy. **The methodology is FLOW** — the discipline that runs around the fish. (Pairs with the company value *"Flows, not frames."*)

---

## Table of contents

1. [Why FLOW exists](#1-why-flow-exists)
2. [The method in one screen](#2-the-method-in-one-screen)
3. [The sigil](#3-the-sigil)
4. [The four archetypes](#4-the-four-archetypes)
5. [The four phases (fish anatomy)](#5-the-four-phases-fish-anatomy)
6. [The archetype × phase matrix — methods, not adjectives](#6-the-archetype--phase-matrix--methods-not-adjectives)
7. [Per-archetype streams](#7-per-archetype-streams)
8. [Method catalog](#8-method-catalog)
9. [The `<FLOW-handoff>` block](#9-the-flow-handoff-block)
10. [The four agent moves — Question / Review / Handoff / Block](#10-the-four-agent-moves--question--review--handoff--block) **[AI-era]**
11. [Reverse transitions, sigil changes, skips](#11-reverse-transitions-sigil-changes-skips)
12. [Agent posture — firm redirect, not acquiesce](#12-agent-posture--firm-redirect-not-acquiesce) **[AI-era]**
13. [What AI changes — the four failure modes](#13-what-ai-changes--the-four-failure-modes) **[AI-era]**
14. [Worked examples — one per archetype](#14-worked-examples--one-per-archetype)
15. [What FLOW is *not*, and lineage](#15-what-flow-is-not-and-lineage)

---

## 1. Why FLOW exists

The original 2024 Fish Model (Tal Solomon) was written for design teams drowning under uniform "two-week sprint of unknown shape" process: every project gets the same PRD, the same ceremony, the same research burden — whether it's a tooltip fix or a year-long platform rebuild. Intensity didn't match the work.

Fish replaced that with: **decide what kind of fish you're catching, then run the lifecycle at the intensity that fish demands.**

**[AI-era]** In 2026, AI co-workers broke something else — they broke the designer's *orientation*. Users report a specific cluster of pains: *"I don't know where I am. I don't trust any of this is saved. The AI doesn't guide me. It has no UX instinct. Switching tools means starting over. I can't see the project — just pieces. There's no history of who decided what."* (Seven real pains, each mapped to a FLOW fix, in §13.)

FLOW-in-2026 is the fix: the same Fish Model, now **operable by AI agents** that nudge the method forward, *and* **portable across tools / sessions / teammates** so the project stays consolidated.

**Positioning:** FLOW is **Agile for the AI era** — **user-centered**, design-thinking-shaped, AI-native. Double Diamond is the backbone because *the user* is the point; the project's success is the signal that the user won. It replaces sprint cadence, PRDs, and standups with a continuously-shippable per-card lifecycle that the AI can run alongside you without taking over. See §15 for what it replaces, what it is, and what it is not.

One shared vocabulary throughout — **sigil → archetype → phase → curated methods → handoff** — that humans and agents both speak fluently.

---

## 2. The method in one screen

A card — the unit of work — sits on two axes. The pair is its **sigil**. The sigil picks an **archetype** (the kind of fish). The archetype decides **how intense each of four phases runs** and **which specific methods are used in each cell**. Every transition between phases emits a `<FLOW-handoff>` block that the next phase (or tomorrow's session, or a teammate) can read cold.

**Order of decision:** certainty first, then size. Size estimates are unreliable in a space the team doesn't understand, so you check familiarity before guessing surface area (see §3).

```
       ▲ known / high familiarity
       │
       │    Tuna (known × bigger)     Nemo (known × smaller)
       │    1+ sprint                 ≤1 sprint
       │    low partner involvement   low partner involvement
       │    PD lead: designer         PD lead: designer
       │
  ─────┼─────────────────────────────────────────────────▶  scope (bigger ← → smaller)
       │
       │    Willy (unknown × bigger) Salmon (unknown × smaller)
       │    3+ sprints                2+ sprints
       │    high partner involvement  high partner involvement
       │    PD lead: researcher       PD lead: researcher
       │    + founder / PM
       │
       ▼ unknown / low familiarity
```

Phases (fish anatomy, left to right):

```
   head  ─────▶  left body  ─────▶  right body  ─────▶  tail
  Explore        Solidify           Build                Ship
  (למידה)        (מסגור)            (עיצוב)              (מימוש)
  open           converge on        execute against       release,
  aperture       one shape          locked shape          narrate, measure
```

Every phase has a **curated method set per archetype** — not adjectives ("heavy / heaviest") but specific named methods (see §6). A Nemo Explore is *exactly* a heuristic scan + competitor scan + micro-brief. A Willy Explore is *exactly* interviews + contextual inquiry + JTBD + premortem + scenario planning + pitch outline. The intensity matrix is a recipe, not a vibe.

---

## 3. The sigil

Every card carries a **sigil** — the pair `(certainty, size)`. The sigil is:

- **First-class.** Every card has one; no unsigiled cards.
- **Machine-readable.** Used by agents (and handoffs) verbatim.
- **Mutable.** Can change mid-lifecycle if the work turns out to be less familiar or bigger than expected. Sigil changes are *announced*, never smuggled (§11).
- **Decided in order:** certainty first, then size. Rationale in §3.1.

```
sigil:
  certainty: known  | unknown
  size:      smaller | bigger
```

### 3.1 Certainty axis — prior familiarity (היכרות מוקדמת) · **decide first**

Measured by **the team's prior familiarity with the user and the solution space**, not technical complexity.
- **Known** — we have shipped similar work; conventions, users, and patterns exist.
- **Unknown** — at least one of `{user, problem, domain, solution space}` is new to this team.

**Familiarity is per-team.** A billing flow is Known for a payments team, Unknown for a greenfield startup. A mobile-web interaction is Known for an e-commerce squad, Unknown for a data-engineering squad that hasn't touched UX in two years.

**Why certainty is decided first:** size estimates are unreliable in a space you don't understand. If you size before you check what you know, you will confidently under-estimate every card whose surface area is concealing unknowns. A "small copy fix" in an unfamiliar flow regularly reveals itself — three days in — to be a redesign. The honest move is to check familiarity first (five-minute assessment: competitor glance, team parallels, four-part familiarity check), and only then estimate size.

### 3.2 Size axis — scope (היקף) · **decide after certainty**

Measured by **expected surface area of the final artifact**, not effort.
- **Smaller** — fits in one session; ≤ 1–3 screens; one acceptance-criterion category.
- **Bigger** — multi-session; multi-screen or system-level; multiple AC categories.

**Default rule:** when the space is unknown or the team is uncertain, default to bigger. Over-sizing costs a bit of process overhead; under-sizing skips research and ships broken work.

### 3.3 Sigil examples

```
sigil: { certainty: known,   size: smaller }  → Nemo
sigil: { certainty: known,   size: bigger  }  → Tuna
sigil: { certainty: unknown, size: smaller }  → Salmon
sigil: { certainty: unknown, size: bigger  }  → Willy
```

Selection is mechanical — no debate. If the card owner can't pick, the Explorer agent assists in the first 5 minutes of Explore; the card always leaves Explore with a sigil.

### 3.4 Sigil changes mid-card

Legitimate. Explore is the most common place they happen.

Rule: the current agent **emits a sigil-change handoff** before continuing. The receiving phase re-evaluates against the new archetype's cell in the matrix. A card that was Nemo but is now Salmon needs heavier Explore — the agent extends Explore rather than advancing. See §11.

---

## 4. The four archetypes

Each archetype is a **recipe for lifecycle intensity** — sprint capacity, partner involvement, leadership assignment, and (§6) curated method selection per phase. Archetypes are derived mechanically from the sigil.

| Archetype | Hebrew | Sigil (certainty × size) | Shape (continuous, not sprint-based) | Partner involvement | PD leader |
|---|---|---|---|---|---|
| **Nemo** | נמו | known × smaller | one session → same-day ship | Low | Designer (מעצבת) |
| **Tuna** | טונה | known × bigger | a few days → a couple weeks | Low | Designer |
| **Salmon** | סלמון | unknown × smaller | a few days → a couple weeks | High | Researcher (חוקרת) |
| **Willy** | ווילי | unknown × bigger | weeks → a month+ | High | Researcher + founder / PM |

> **Note (AI-era):** the original 2024 Fish Model used sprint-band estimates (≤1 sprint, 1+, 2+, 3+). With AI agents running method discipline continuously, FLOW doesn't assume sprint cadence anymore — work ships when the phase exits cleanly, not when a sprint clock rolls over. Sprint bands retained as rough calibration only; not a schedule contract.

Short posture per fish:

- **Nemo** — quick, conventional, heuristic-driven. "לא צריך PRD או ישיבות ארוכות" (no PRD, no long meetings). Brief meetings; designer completes within one sprint using conventions.
- **Tuna** — bigger scope, established patterns. Multiple screens, light research phase, storyboards to map flow, reliance on known patterns.
- **Salmon** — heavy research-led phase; deep user interviews and stakeholder engagement. Few refined screens; intent is problem validation before launch. Led by a dedicated UX researcher.
- **Willy** — strategic, month-long initiative; full team mobilization. Maximum methodology application; roadmap-committed.

### 4.1 How "PD leader" reads

The PD (product / design) leader is the **primary owner of methodological choices** for the card — not the only contributor, but the person whose judgement carries on methodology decisions when the team disagrees.

- **Designer-led (Nemo / Tuna):** a designer runs the card; the PM assists. The team is following conventions; design judgement is the load-bearing call.
- **Researcher-led (Salmon):** a dedicated UX researcher runs the card; designer and PM assist. The bottleneck is understanding the user, not shipping.
- **Researcher + founder / PM (Willy):** the UX researcher co-leads with the founder / strategic PM. Willys shape the roadmap; methodology and product-strategy calls are inseparable.

**[AI-era]** PD-leader assignment **directly picks the Layer-2 expert agent** that leads the card. A Nemo or Tuna is Design-agent-led; a Salmon is Researcher-agent-led (leans on the Analyst / Research expert); a Willy pulls in the strategic PM expert. See [agents-overview.md §5](./agents-overview.md) for the agent lifecycle.

### 4.2 Partner involvement

- **Low (Nemo / Tuna):** few stakeholder check-ins; designer can decide unilaterally inside the shape; review at handoffs.
- **High (Salmon / Willy):** continuous stakeholder engagement — users for research, cross-functional teammates for framing and prioritization. Cards at this level cannot be run alone.

**[AI-era]** Partner involvement maps directly to the V1 multiplayer handoff layer — low-involvement fish rarely need teammate sync; high-involvement fish invoke the Handoff / Relay / Beacon system agents constantly.

### 4.3 Archetype selection — mechanical, not political

Archetype comes from the sigil. The sigil comes from the designer's honest read of scope and familiarity. If the team argues over archetype, they're really arguing over the sigil — settle that first. FLOW does not negotiate archetype vs. schedule: *you don't get to call a Salmon a Tuna because the deadline is Tuesday.* The sigil either changes (with a narrated reason) or it doesn't.

---

## 5. The four phases (fish anatomy)

Every card — regardless of archetype — passes through four phases named after fish anatomy. **Phases are never skipped.** Archetype determines *intensity per phase*, not phase presence.

```
              ┌─────── left body ────┬──── right body ──────┐
              │                      │                      │
            ╭─┴─╮                                          ╭─┴─╮
  head ─▶   │ 1 │   Solidify (2)     │     Build (3)       │ 4 │  ─▶  tail
            ╰─┬─╯   shape            │     execute         ╰─┬─╯
              │                                              │
           Explore                                          Ship
           למידה      מסגור                 עיצוב            מימוש
```

| # | Anatomy | Phase (EN) | Phase (HE) | One-line goal |
|---|---|---|---|---|
| 1 | Head | **Explore** | למידה | Open the aperture. Surface options, questions, premises. Refuse to commit. |
| 2 | Left body | **Solidify** | מסגור | Reduce unknowns to one shape. Lock decisions that unblock Build. |
| 3 | Right body | **Build** | עיצוב | Execute against the locked shape. Don't re-open settled questions. |
| 4 | Tail | **Ship** | מימוש | Narrate, release, measure. Make past-work legible to future-you. |

### 5.1 Why four, not two — and why iteration is first-class

Classical Double Diamond has two diamonds: *problem space* and *solution space*. FLOW splits each into its own phase — with its own agent, artifact, and handoff contract — so that:

- Humans and AI can locate themselves in the lifecycle without jargon.
- Transitions are explicit events, not blurred regions.
- Each phase has a single shaped deliverable (options list, brief, built artifact, trust receipt) rather than "something somewhere in this diamond."

**[AI-era] Iteration is not an edge case.** Real work loops:

- **Inside each phase** — micro-loops (ask → answer → sharpen the question) that AI makes fast. A Salmon Explore might run the clustering loop five times in a day. FLOW makes each loop visible without demanding a phase transition.
- **Between phases** — reverse flow (§11). Build reveals a Solidify gap → reverse handoff to Sol. Ship reveals an Explore gap → reverse handoff to Dora. Reverse is **normal, narrated, and expected**, not a failure.

The linear arrow Explore → Solidify → Build → Ship is the *default path*, not a cage. FLOW's job is to make loops and reverses **legible**, not to prevent them.

**The four-phase split is essential for agent nudging.** Two-diamond "problem space" is too coarse — an agent told "stay in problem space" can't tell whether the user is asking for more research (Explore) or asking for a brief (Solidify). Four phases give the agent a shared vocabulary with the human: *"you're asking for Solidify work while we're still in Explore — want the 5-minute Explore close first, or jump now?"*

### 5.2 Per-phase summary

Each phase deepens from here — see §7 for per-archetype streams, §8 for the method catalog, §14 for worked examples. What follows is the load-bearing per-phase spec every agent must honor.

#### Phase 1 — Explore (head) · למידה

- **Goal:** open the aperture. Surface options, questions, premises, unknowns. Refuse to commit.
- **Posture:** divergent. Breadth over depth. Three shallow threads beat one deep one at this phase.
- **Verbs:** ask, enumerate, diagram, compare, interview, map.
- **Primary risk:** silent drift into Solidify (shaping) or Build (sketching). The Explorer refuses both.
- **Entry:** a problem statement (can be vague) + a proposed sigil (or request to set one).
- **Exit:** problem framing stable enough that the next natural question is *"what shape?"* not *"what are we solving?"* — sigil confirmed — at least one entry-unknown resolved or explicitly deferred.
- **Artifacts:** raw notes, interview transcripts, journey maps, competitor screenshots, HMW reframes, nugget board, one-paragraph framing summary, `<FLOW-handoff>` to Solidifier.
- **Anti-patterns:** "Exploring" that produces wireframes. Interviewing to confirm, not discover. Nemo-sized Explore for a Salmon card. Willy-sized Explore for a Nemo card. Silent sigil change.

#### Phase 2 — Solidify (left body) · מסגור

- **Goal:** reduce unknowns to one shape. Lock decisions that unblock Build.
- **Posture:** convergent. Decisions over discussion. Offer defaults and ask the human to accept / amend / reject — not open "what do you think?" questions.
- **Verbs:** decide, shape, sketch, spec, agree.
- **Primary risk:** five half-shapes instead of one lock. Solidify produces **one** thing.
- **Entry:** `<FLOW-handoff>` from Explorer with a framing, unknowns list, and artifacts (or — for Nemo / Tuna — a one-sentence brief if entering Solidify directly).
- **Exit:** one shape doc exists (not five half-shapes) — AC written, each independently checkable — `open` list contains no build-blocking items — for Salmon / Willy, validation evidence from at least one concept test.
- **Artifacts:** the brief (Nemo / Tuna / Salmon) or pitch / RFC (Willy); acceptance criteria; decision log (Willy); measurement plan (Salmon / Willy); deferred-scope list.
- **Anti-patterns:** PRD sprawl (if the brief has a table of contents, you're hiding deferred scope). Open-ended "what do you think?" instead of default + accept / amend / reject. Skipping concept test on a Salmon. Willy without a measurement plan.

#### Phase 3 — Build (right body) · עיצוב

- **Goal:** execute against the locked shape. No re-opening settled questions.
- **Posture:** executional. Smallest change that satisfies the contract. Diverge only where the brief leaves explicit latitude.
- **Verbs:** implement, prototype, test, integrate.
- **Primary risk:** scope creep + silent re-design. The Builder surfaces disagreement *once*, then either proceeds under the contract or hands back (§11).
- **Entry:** `<FLOW-handoff>` from Solidifier with shape locked, AC written, `open` empty of blockers. For Salmon / Willy: a measurement plan.
- **Exit:** artifact runnable (for code) or reviewable (for design) — golden path verified — `locked` edge cases covered — measurement hooks exist where the plan required them.
- **Artifacts:** built code / designs / docs; test output; run instructions; instrumentation changes (Salmon / Willy); staged rollout plan (Willy).
- **Anti-patterns:** re-designing in Build. Horizontal-layer builds instead of vertical slices. "Tests after." Gold-plating a Nemo. Willys built as one giant lump.

> **Naming note.** The Hebrew name for this phase is עיצוב ("design") — from the original Fish Model's design-led framing. FLOW renames it **Build** because in the AI-era this phase includes engineering execution, not only design-mode prototyping. The method set here spans both (see §6).

#### Phase 4 — Ship (tail) · מימוש

- **Goal:** narrate, release, make the work legible to future-you. Close the loop.
- **Posture:** curatorial. Write the short "what changed and why" that the team, the user, and the next Explore cycle will read.
- **Verbs:** release, document, measure, hand off.
- **Primary risk:** a release without a narrative. A commit with no "why" is technical debt.
- **Entry:** `<FLOW-handoff>` from Builder with runnable / reviewable artifact. Any measurement plan from Solidify is implemented.
- **Exit:** work is available to its audience — trust receipt emitted — at least one learning captured for the next loop.
- **Artifacts:** release notes / changelog / commit; trust receipt; learning log (Salmon / Willy); measurement readouts (Salmon / Willy); retrospective (Willy).
- **Anti-patterns:** release with no narrative (commit messages that say "fixes" or "update"). Skipping the trust receipt even solo. No measurement on a Salmon or Willy. Papering over Builder bugs instead of handing back.

> **Naming note.** Hebrew מימוש ("realize") is release-plus-validation. FLOW shortens to **Ship** to emphasize the release act; validation happens in-Ship via instrumentation, not as a separate phase.

### 5.3 Why each phase has **one** artifact

If a phase produces five artifacts, it has four things the next phase can ignore. The artifact discipline is load-bearing:

- **Explore:** one framing summary (scratch evidence is support, not the artifact).
- **Solidify:** one brief or one pitch — not both, not five.
- **Build:** one runnable thing (code, design, doc — one of them).
- **Ship:** one trust receipt per release.

Multiple phase-internal artifacts are fine (a Willy Explore has interviews, nuggets, journey maps, premortem) — but **one is canonical**, the rest are evidence.

---

## 6. The archetype × phase matrix — methods, not adjectives

This is the operational core. Given a card's archetype, each phase agent knows **which specific methods it runs** — not adjectives like "heavy" or "light," but named techniques from §8.

| Phase | **Nemo** (known × small) | **Tuna** (known × big) | **Salmon** (unknown × small) | **Willy** (unknown × big) |
|---|---|---|---|---|
| **Explore** (למידה) | Competitor scan · Micro-brief · Heuristic evaluation | + Journey meetings · OSD · Convention inventory | + User interviews · Observations · JTBD · Nugget board · TZUMI · Task analysis | + Contextual inquiry · Goal-Directed Design · Premortem · Scenario planning · Pitch outline |
| **Solidify** (מסגור) | HMW · Problem framing · One sketch · AC (3–5 bullets) | + Storyboard · Journey map · Brief · Microinteraction specs · Design-system extension · Journey meeting | + Concept test · Affinity / action / cognitive analysis · Measurement plan · Evidence-informed AC | + 5 whys · SWOT · Spectrum mapping · Pitch / RFC · Decision log · Multi-level AC · Stakeholder journey meetings |
| **Build** (עיצוב) | Smallest change · Golden-path test · AC as tests | + Storyboarding · Fake prototypes · Design Sprint · Iterative prototyping · Component-library-first · Motion principles · Joint review · "No boundaries" | Crazy 6 · Co-creation · Instrumented build · Usability test (3–5 users) · Iterate-once | + Marathons · Reversed solutions · Thin vertical slice · Integrated requirements · Joint product reviews · Staged rollout per slice · Measurement per slice |
| **Ship** (מימוש) | Beta groups · Heatmaps · One-line changelog · Trust receipt | + Feedback loops · Private preview · Full changelog · Release notes · Journey meeting · Trust receipt | Usability · Heatmaps · Baseline + post measurement · ISO 9241 triad · Learning log · Next-loop queue | + A/B test · Theater screen · Canary release · Staged rollout (internal → alpha → beta → GA) · Per-stage measurement · Retrospective · Master trust receipt |

### 6.1 Reading rules

1. **An agent in phase P facing archetype A runs cell (P, A).** Not lighter. Not heavier.
2. **Bigger archetypes include smaller archetypes' methods.** A Willy Explore includes Nemo's heuristic scan and Salmon's interviews, plus its own additions. The cell reads cumulatively.
3. **Phases are never skipped.** A Nemo's "competitor scan + micro-brief + heuristic scan" *is* Explore — not "skip Explore."
4. **If the sigil changes mid-card, re-evaluate the current phase against the new cell.** A Nemo that becomes a Salmon needs interviews; add them before continuing.
5. **Teams may add methods to a cell, but the canonical cell holds until the team writes its own `flow.yaml` override.** Removing a method from a cell is harder — requires a team-level decision.

### 6.2 The matrix is prescriptive, not aspirational

Without this matrix, "intensity" is adjectival — *"do a heavy Explore for a Willy"* can mean anything from three interviews to thirty. With the matrix, a Willy Explore is *specifically* {interviews, contextual inquiry, JTBD, premortem, scenario planning, pitch outline}. Agents refuse to call something "done" until the cell's methods are accounted for (run or explicitly deferred with reason).

**[AI-era]** The matrix is what the Layer-1 operator agents (Explorer / Solidifier / Builder / Shipper) mechanically enforce. When a user on a Nemo asks the Explorer to "run interviews," the agent names the cell: *"Interviews are in the Salmon and Willy cells. Nemos run competitor scan, micro-brief, heuristic eval. Want to re-sigil to Salmon, or stay Nemo?"* — see §12.

---

## 7. Per-archetype streams

Each cell from §6 expands into a **stream**: the ordered, step-by-step checklist the agent runs for one (archetype × phase) combination. Streams are deterministic — run top to bottom — and budget-boxed.

> Naming: a *stream* is the per-archetype, per-phase instruction set. A Nemo Explore stream ≠ a Salmon Explore stream. Read your card's stream, not all four.

### 7.1 Explore streams

#### Nemo Explore (known × smaller) — budget 10–30 min

1. Name the sigil out loud. Confirm `known × smaller → Nemo`.
2. Heuristic scan — pick 2–3 Nielsen heuristics most likely to be violated.
3. One HMW reframe — rewrite the problem as a single "how might we…" question.
4. Skim a competitor pattern — one parallel, note same/different.
5. Hick's Law check if the card touches choice-density.
6. Close — list 1–3 concrete remaining unknowns (if any). Emit handoff to Solidifier.

#### Tuna Explore (known × bigger) — budget half-day to full day

1. Confirm sigil (`known × bigger → Tuna`).
2. Convention inventory — design-system components, patterns, prior art.
3. Journey map at mid-fidelity — one swim-lane per persona touching the flow.
4. OSD (operational sequence diagram) if the flow crosses systems or roles.
5. Competitor scan — 3–5 parallels. Note deviations that matter.
6. Shortlist 2–3 structural directions for Solidify.
7. Close — handoff. `locked` = framing + applicable patterns; `open` = which direction to converge on.

#### Salmon Explore (unknown × smaller) — budget multi-day

1. Confirm sigil. Most of the card's effort lives here.
2. User interviews — 5–8 semi-structured sessions, recorded if consent.
3. TZUMI (צומ"י): Go-Learn (exploratory) → One-User (validate one insight with one user) → Hand-in-Hand (shadow or pair with a user).
4. Nugget board — capture findings as atomic, tagged nuggets rather than long reports.
5. Task analysis of the specific flow the card will change.
6. Journey mapping, anchored in real interview quotes.
7. Synthesize 3–5 framings; pick the 1 with the most interview support for Solidify.
8. Close — handoff. `locked` = chosen framing + evidence; `open` = unresolved interview tensions worth flagging.

#### Willy Explore (unknown × bigger) — budget 2+ weeks

1. Confirm sigil. Prepare to re-confirm mid-phase — Willys often split.
2. Market / competitive scan — deeper than Tuna; map positioning axes.
3. User interviews — 8–15 sessions across personas.
4. TZUMI across multiple cohorts.
5. Contextual inquiry if the work is a developer / operator tool or user environment matters.
6. Goal-Directed Design — surface End / Experience / Life goals per persona.
7. JTBD pass — functional, emotional, social jobs.
8. OSD across the whole end-to-end flow.
9. Premortem — imagine this ships and fails; invert to find risks.
10. Scenario planning — happy path + two alternative branches + a worst-case.
11. Draft pitch / RFC outline (not the full pitch — that's Solidify's).
12. Close — handoff. `locked` = framing + non-negotiables; `open` = 3–5 concept directions for Solidify to test.

### 7.2 Solidify streams

#### Nemo Solidify — budget 30 min to 2 hours

1. Pick one HMW (the framing Explorer surfaced).
2. One sketch — napkin-level. Solves exactly the HMW, nothing more.
3. Write 3–5 AC bullets — each independently checkable.
4. Check against Hick's Law / Recognition-over-Recall.
5. Reuse from design system — no bespoke components for a Nemo.
6. Close — handoff. `locked` = sketch + AC; `open` = empty (Nemo Solidify empties the list).

#### Tuna Solidify — budget 1–3 days

1. Storyboard the end-to-end flow — 6–10 frames.
2. Journey map with storyboard overlaid. Confirm gaps.
3. Extend the design system where needed. Justify any new component.
4. Draft the brief (journey-structured, not feature-list).
5. Microinteraction specs for anything novel — Triggers / Rules / Feedback / Loops / Modes (Saffer).
6. AC — multi-category (functional, UX, a11y, perf).
7. Review meeting — journey meeting, not feature meeting.
8. Close — handoff. `locked` = brief + AC + component list; `open` = non-blocking.

#### Salmon Solidify — budget 2–5 days

1. Pick one framing from Explore's shortlist — the one with strongest interview support.
2. Write a one-page brief — Problem / Journey / Shape / AC / Deferred.
3. Concept test — 3–5 users, low-fidelity. Validate the shape *before* Build.
4. Iterate once based on concept-test feedback.
5. Write AC, now evidence-informed.
6. Plan measurement — what behavioral signal will tell us this worked in Ship?
7. Close — handoff. `locked` = brief + validated shape + AC + measurement plan.

#### Willy Solidify — budget 1–3 weeks

1. Write a pitch / RFC — the full shape. Replaces the brief for Willys.
2. Run 2–3 concept tests across concept directions from Explore.
3. Map tradeoffs on spectrum axes (flexibility ↔ usability, cost ↔ speed).
4. Define personas using Goal-Directed Design if not already done in Explore.
5. Multi-level AC — functional, UX, performance, compliance, business.
6. Stakeholder alignment — journey-meeting format, not slide-deck review.
7. Decision log — every major Solidify decision with reasoning and alternatives.
8. Measurement plan — baseline, target, instrumentation. Willys without a measurement plan are vanity projects.
9. Close — handoff. `locked` = pitch + AC + decision log + measurement plan; `open` = explicit Build latitude.

### 7.3 Build streams

#### Nemo Build — budget one session (15 min to 4 hours)

1. Re-read `locked` — treat as contract.
2. Make the smallest change that satisfies AC. No refactoring neighbors.
3. Golden-path test — does the happy flow work?
4. Edge cases from `locked` — the ones Solidify named. Nothing more.
5. Close — handoff to Shipper. `locked` = what was built; `open` = defer-to-v2 items.

#### Tuna Build — budget multi-sprint

1. Component library first — which library's primitives (Material, Radix, MUI, Ant) are we composing with?
2. Iterative prototyping — designer + developer in a shared tool (Figma, Storybook, Zeplin).
3. Build in thin vertical slices — one user-visible capability per slice, not horizontal layers.
4. Microinteractions per Saffer — Triggers / Rules / Feedback / Loops-Modes.
5. Apply motion principles — 100–500ms, easing, restraint.
6. Run AC as test cases.
7. Joint review — designer + dev + PM review against the brief.
8. Close — handoff. `locked` = built artifact + test status; `open` = follow-ups, known limitations.

#### Salmon Build — budget 1–3 days; small but instrumented

1. Build the validated shape — Solidify already validated; just implement.
2. Instrument per the measurement plan — add the analytics events.
3. Usability test with 3–5 users.
4. Iterate once more if usability reveals friction.
5. Close — handoff. `locked` = built + instrumented artifact; `open` = any test-observed friction deferred.

#### Willy Build — budget month+, staged

1. Break into Tuna-sized sub-cards — each its own sigil, each its own mini-lifecycle. The parent Willy tracks progress across sub-cards.
2. Start with a thin vertical slice — smallest demo-able path through the full system.
3. Integrated requirements — devs involved from spec, not thrown over the wall.
4. Joint product reviews — designer + dev + PM co-review at each slice.
5. Roll out staged — internal → alpha → beta → general. Each stage emits its own `<FLOW-handoff>` (intra-Build).
6. Measure per slice.
7. Close — handoff. `locked` = staged artifact + measurement baseline; `open` = per-slice follow-ups.

### 7.4 Ship streams

#### Nemo Ship — budget 15–30 min

1. One-line changelog entry.
2. Commit message — what + why (one sentence "why").
3. Release — merge, push, publish.
4. Trust receipt — even solo. 30 seconds.
5. Close — terminal, or Ship → Explore if a next loop is queued.

#### Tuna Ship — budget half-day

1. Changelog entry — journey-structured, not feature-listed.
2. Update doc pages the change affects.
3. Release notes — short, audience-appropriate.
4. Commit / PR with context + brief linked.
5. Announce where appropriate.
6. Trust receipt.
7. Close — handoff to next Explore if applicable; otherwise terminal.

#### Salmon Ship — budget 1–2 days spread over a measurement window

1. Release with instrumentation confirmed live.
2. Baseline measurement before traffic.
3. Effectiveness / Efficiency / Satisfaction (ISO 9241 triad) check after 1–2 weeks.
4. Learning log — what did the measurement reveal?
5. Trust receipt.
6. Iteration loop decision — queue a next loop, or close? Most Salmons queue one.
7. Close — handoff to next Explore.

#### Willy Ship — budget multi-week; partial per stage

1. Staged rollout — internal → alpha → beta → GA. Each stage has its own mini-Ship.
2. Per-stage measurement — compare against Solidify's plan.
3. Narrate per stage — short release note per stage.
4. Retrospective after GA — what happened? What runs differently next Willy?
5. Trust receipt per stage; master trust receipt at GA.
6. Hand to next-loop Explore. Willys almost always loop.
7. Close — handoff to Explore.

---

## 8. Method catalog

Every method a FLOW agent may reference. Grouped by purpose. Each carries phase tag(s) and source / lineage where relevant.

### 8.0 How to read this catalog

**All methods listed are publicly available design-research techniques.** No proprietary systems are claimed. Where a technique has a known origin (Nielsen, Cooper, Saffer, Christensen, Ericsson & Simon, Hayakawa, Jake Knapp at GV, AirBnB, Tomer Sharon, etc.) it's credited. Descriptive names are used throughout so teams can pick the technique regardless of which playbook (LUMA, IDEO, Frog, Shape Up, Continuous Discovery Habits, The Mom Test, Measure What Matters, etc.) first introduced them to it.

**[AI-era — future work]** Every method in this catalog is currently specified for *human execution*, with AI as an assistant. **A separate effort will adapt each method for AI-native execution** — e.g., what does "contextual inquiry" look like when AI can transcribe, pre-cluster, and surface patterns in real time? What about when the AI runs the first-click test as a simulated cohort? That adaptation is its own workstream (tracked in `planning/task-board.md`), not scope for this doc.

Phases are abbreviated: **E** = Explore · **S** = Solidify · **B** = Build · **R** = Ship (release).

### 8.1 Generative research (interviews & conversation)

- **User interviews** — 1:1 semi-structured conversations. *E.* Salmon / Willy standard; optional Tuna; skip Nemo.
- **JTBD interviews** (Christensen / Klement) — probe the "job" a user "hires" the product for. *E, S.*
- **The Mom Test interviews** (Rob Fitzpatrick) — ask about behaviors and past events, not opinions or futures. *E.*
- **Continuous discovery interviews** (Teresa Torres) — weekly customer contact woven into ongoing design work. *E, ongoing.*
- **5 Whys** (Toyota) — iterative why-chain to root cause. *E, S.*
- **What's on your radar** — surface what's top-of-mind for a participant as a ranked radar diagram. *E.*
- **Statement starters** — prompt sentences ("What I need is…", "I wish I could…") to catalyze interview narrative. *E.*
- **Critical reading checklist** — structured read of research inputs for bias, method fit, applicability. *E, S.*

### 8.2 Observation & ethnographic

- **Contextual inquiry** (Beyer & Holtzblatt) — joint observation of users in their real environment. *E.*
- **Fly on the wall** — passive observation without interaction. *E.*
- **Walk-a-mile immersion** — designer does the user's task end-to-end themselves. *E.*
- **Observations (תצפיות)** — watch users without interviewing. *E.*
- **Journaling / diary studies** — longitudinal self-recording by participants. *E.*
- **Secondary research** — literature scan, analytics review, prior-art audit. *E.*

### 8.3 Analysis & sense-making

- **Affinity clustering / affinity analysis (ניתוח זיקות)** — cluster raw findings into themes. *E → S.*
- **Nugget board** (Tomer Sharon) — atomic, tagged findings over long reports. *E → S.*
- **Concept mapping** — node-and-edge diagram of how ideas relate. *E, S.*
- **Abstraction laddering** (Hayakawa) — move up/down between general and specific formulations of a problem. *E, S.*
- **Problem tree analysis** — decompose a problem into causes and effects. *E, S.*
- **Experience diagramming** — visualize the user's lived experience across a period of use. *E, S.*
- **Statement analysis** — break down customer statements into needs / wants / jobs / expectations. *E, S.*
- **Action analysis (ניתוח פעולות)** — decompose the user actions required by a flow. *S.*
- **Cognitive analysis (ניתוח קוגניטיבי)** — map the cognitive load at each step. *S.*
- **Critical reading checklist** — structured review of documents for bias, rigor, applicability. *E, S.*
- **Triangulation** — validate a finding through multiple independent sources. *E, S.*

### 8.4 Framing & modeling

- **HMW — How Might We** — reframe a problem as an open "how might we…" prompt. *E → S.*
- **Problem framing / problem statement** — one-sentence canonical framing. *S.*
- **Personas** (Alan Cooper) — archetypal users built from research. *E (create), S (apply).*
- **Goal-Directed Design** (Cooper) — End / Experience / Life goals per persona. *E, S.*
- **JTBD framing** — product framed around functional / emotional / social jobs. *E, S.*
- **OSD — Operational Sequence Diagram** — swim-lane of a journey across stakeholders and time. *E, S.*
- **Journey mapping** — persona's end-to-end path across touchpoints. *E, S.*
- **Service blueprint** — journey map + backstage ops + supporting processes. *E, S.*
- **Stakeholder mapping** — every person / group with interest + influence. *E.*
- **Empathy map** — "says / thinks / does / feels" quadrant per user. *E, S.*
- **Scenario planning** — happy path + alternative branches + worst case. *E, S.*
- **Home position (עמדת הבית)** — the stance you return to when disoriented in the work. *E.*
- **Problem simplification / decomposition** — reduce multi-dimensional problem to solvable version. *E, S.*
- **Mental vs. conceptual model gap** — design to close the delta between user expectation and system behavior. *S, B.*
- **Spectrum mapping / tradeoff axes** — place candidate solutions on tradeoff axes. *S.*

### 8.5 Strategy, prioritization, business framing

- **Lean canvas** (Maurya) — one-page strategic brief. *E, S.*
- **Business Model Canvas** (Osterwalder) — 9-block business framing. *E, S.*
- **Value proposition canvas** (Osterwalder) — product → customer-jobs/pains/gains alignment. *E, S.*
- **5 forces** (Porter) — competitive dynamics analysis. *E.*
- **PESTEL analysis** — political / economic / social / technological / environmental / legal landscape scan. *E.*
- **SWOT** — strengths / weaknesses / opportunities / threats. *E, S.*
- **Kano model** — feature classification (threshold / performance / delighter). *S.*
- **MoSCoW** — must / should / could / won't prioritization. *S.*
- **RICE scoring** — reach × impact × confidence / effort. *S.*
- **WSJF** (SAFe) — weighted shortest job first. *S.*
- **Impact mapping** — goals → actors → impacts → deliverables tree. *S.*
- **Opportunity solution tree** (Torres) — outcome → opportunities → solutions → experiments. *E, S.*
- **Importance / difficulty matrix (קושי / חשיבות)** — 2×2 prioritization. *S.*
- **Bull's-eye diagramming** — concentric rings of "must have → maybe → not now". *S.*
- **Visualize the vote** — tally team preferences on a candidate set. *S.*
- **Rose / thorn / bud** (AirBnB, pre-LUMA retrospective) — positives / negatives / opportunities. *E (review), R (retro).*
- **Shape Up pitch** (Basecamp) — 5-part bet proposal: problem / appetite / solution / rabbit holes / no-gos. *S.*
- **Betting table** (Basecamp) — fixed-cadence bet selection. *S.*
- **Hill chart** (Basecamp) — figuring-it-out / making-it-happen S-curve per deliverable. *B.*

### 8.6 Ideation

- **Brainstorming (classic)** — time-boxed divergent idea generation. *E, S, B.*
- **Crazy 8s / Crazy 6** (Design Sprint, also 6 המשוגע) — 8 sketches in 8 minutes. *S, B.*
- **Design Sprint** (Jake Knapp / GV) — 5-day cycle: understand → sketch → decide → prototype → test. *E → S → B.*
- **Co-creation** — ideation with real users in the room. *E, S, B.*
- **Round robin** — structured turn-taking on an idea sheet. *S, B.*
- **Alternative worlds** — "how would Disney / IKEA / Apple solve this?" as a divergence technique. *S, B.*
- **SCAMPER** — substitute / combine / adapt / modify / put-to-other-use / eliminate / reverse. *S, B.*
- **6 thinking hats** (de Bono) — structured perspective-taking (facts / emotion / optimism / risk / creativity / process). *E, S.*
- **Creative matrix** — 2-axis grid to force idea generation across combinations. *S, B.*
- **Design studio method** — structured group-sketching session across rounds of divergence + critique. *S, B.*
- **Whiteboard session** — collaborative live exploration. *E, S.*
- **Symmetry / pattern recognition** — use parallel interfaces in the world as ideation seeds. *S.*
- **Marathons (מרתונים)** — multi-day deep work blocks on one problem. *B.*
- **Reversed solutions (פתרונות הפוכים)** — start from "how would we make this worse?" *B.*
- **"No boundaries" (בלי גבולות)** — generate without feasibility filter. *B.*

### 8.7 Prototyping & shaping

- **Iterative prototyping** (Cooper) — progressive refinement as design-dev collaboration backbone. *S, B.*
- **Storyboarding** — sequential frames bridging journey map and UI. *S.*
- **Thumbnail sketching** — micro-sketches, many per page, low commitment. *S.*
- **Cover story mock-up** — design the "future press release" / launch cover. *S.*
- **Concept poster** — one-page visualization of a candidate solution. *S.*
- **Video scenario** — dramatized walkthrough of a user hitting the product. *S, B.*
- **Schematic diagramming** — block-and-arrow system diagram. *S, B.*
- **Rough & ready prototyping** — deliberately low-fidelity mockup for fast reaction. *B.*
- **Fake prototypes (פייק פרוטוטייפס)** — minimal-fidelity prototype to validate shape before real build. *B.*
- **Paper prototyping** — pencil-and-paper UI simulated by a human operator. *B.*
- **Wizard of Oz prototyping** — simulated functionality delivered by a human behind the scenes. *B.*
- **Experience prototyping** — enact the experience physically rather than render it. *S, B.*
- **Build your own** — participants build their ideal version; observe their choices. *B.*
- **Quick reference guide** — one-page summary of a concept for recurring use. *S.*
- **Microinteractions** (Saffer) — Triggers → Rules → Feedback → Loops / Modes. *S, B.*
- **HTA — Hierarchical Task Analysis** — decompose tasks into sub-goals. *S, B.*
- **Motion principles** — 100–500ms, easing curves, restraint. *B.*
- **Component library strategy** — joint designer + dev selection of a library as shared substrate. *S, B.*
- **Shared-tool workflow** (Figma / Storybook / Zeplin) — equal-access tooling for design + dev. *S, B.*
- **Joint product reviews** — designer + dev + PM co-review in progress. *S, B.*
- **Integrated requirements process** — devs involved from spec through conceptual model. *S, B.*
- **Thin vertical slice** — one user-visible capability end-to-end before the next. *B.*

### 8.8 Validation & usability

- **Concept testing** — test a low-fi concept with users before commit. *S.*
- **Usability testing** — observe users completing tasks on the built / near-built artifact. *B, R.*
- **Think-aloud testing** (Ericsson & Simon) — participant verbalizes thoughts while completing tasks. *B, R.*
- **First-click testing** — measure whether users' first click matches the designed intent. *B, R.*
- **Tree testing** — test information architecture independent of UI. *S, B.*
- **Card sorting** (open / closed / hybrid) — surface how users mentally group items. *E, S.*
- **First impression test** — measure reactions to first 5–10 seconds of a flow. *B, R.*
- **Eye tracking** — visual attention measurement. *R.*
- **Heuristic evaluation** (Nielsen) — expert audit against usability heuristics. *E, R.*
- **Effectiveness / Efficiency / Satisfaction** (ISO 9241) — post-ship triad. *R.*
- **Hick's Law** — more options → longer response time. *S, B, R (heuristic).*
- **Fitts's Law** — time to acquire a target is a function of distance and size. *S, B.*
- **Recognition over recall** — users identify cues faster than they retrieve from memory. *S, B.*
- **Competitor / pattern scan** — survey parallel interfaces; note conventions and deviations. *E.*
- **Premortem** — imagine shipped-and-failed; invert to find risks. *E, S.*

### 8.9 Release & measurement

- **Acceptance criteria (AC)** — bulleted, independently checkable definition of done. *S.*
- **Measurement plan** — baseline + target + instrumentation. *S.*
- **Baseline measurement** — capture metric values before the release. *R.*
- **Post-release measurement** — measure the same metrics after the release window. *R.*
- **Fake door testing** — measure demand for an unbuilt feature via a clickable entry point. *S, R.*
- **Smoke testing** — tiny-cohort release to verify basic operation. *R.*
- **Concierge test** — manually deliver the service behind a simple UI. *R.*
- **Private preview (פרייבט פריוויו)** — select-audience release before broader rollout. *R.*
- **Beta group (קבוצות בטא)** — opt-in pre-release cohort. *R.*
- **Canary release** — staged rollout to a traffic % with automated rollback. *R.*
- **A/B test (מבחן א/ב)** — randomized controlled rollout of variants. *R.*
- **Feature flags** — runtime-controllable feature toggles for gradual exposure. *B, R.*
- **Feedback loops (לולאות מישוב)** — structured channels for post-release user feedback. *R.*
- **Heat maps (מפות חום)** — click / attention / scroll-depth visualization. *R.*
- **Session replay** — replay user sessions to diagnose friction. *R.*
- **Customer advisory board** — structured ongoing forum with key customer voices. *R, E (next loop).*
- **Theater screen (מסך תיאטרון)** — dramatized walkthrough of a release for internal / customer audiences. *R.*

### 8.10 Retrospective & learning

- **Retrospective (plain)** — post-ship: what happened, what runs differently next. *R.*
- **Rose / thorn / bud retro** — positives / negatives / opportunities. *R.*
- **Sailboat retrospective** — wind (helped) / anchors (blocked) / rocks (risks) / island (goal). *R.*
- **Start / stop / continue** — three-bucket team decision. *R.*
- **4Ls** — liked / learned / lacked / longed-for. *R.*
- **Futurespective** — imagine future state and reverse-engineer what had to be true. *R, E.*
- **Mad / sad / glad** — emotional-register retrospective. *R.*
- **Learning log** — running doc of insights captured across loops. *R.*
- **Next-loop queue** — explicit list of follow-ups for the next Explore. *R.*

### 8.11 Narrative, brief, documentation

- **Brief (not PRD)** — one-page journey-structured doc: Problem / Journey / Shape / AC / Deferred. *S.*
- **Micro-brief (בריפים קצרים)** — one-paragraph brief for Nemos and Tunas. *S.*
- **Pitch / RFC** — longer Willy shape doc with tradeoffs, alternatives, decision log. *S.*
- **Decision log** — every major decision with reasoning and alternatives. *S.*
- **ADR — Architecture Decision Record** — tight document per technical decision. *S, B.*
- **Journey meetings (פגישות מסע)** — decision forums organized around a user journey. *S, R.*
- **Design-system extension** — add or extend components; justify any new primitive. *S, B.*
- **Changelog entry** — journey-structured, audience-appropriate. *R.*
- **Release notes** — short-form, audience-appropriate summary. *R.*
- **Trust receipt** **[AI-era]** — signed summary of what shipped, what was redacted, who approved. Append-only. *R.*

### 8.12 Handoff & process

- **`<FLOW-handoff>`** — universal transition block (§9). Emitted at every phase exit.
- **Sigil assist** — first-5-minutes method during Explore to settle on a sigil.
- **Stream recap** — short narrative at phase exit: which stream steps ran, which were deferred, why.
- **Handback** — reverse transition (§11).
- **`//project-status` view** **[AI-era]** — consolidated card view in-chat: every phase's brief + evidence + decisions + trust receipts, side-by-side. Works in OSS with local files; gets a richer UI in Duble Slash Cloud.

### 8.13 Method additions

The catalog is not closed. New methods are welcome; they must declare:

1. Which phase(s) they run in.
2. Which archetype cell(s) they belong to (or "all").
3. What artifact they produce.
4. What they replace (nothing, or an existing method).
5. **[AI-era]** How AI wraps this method (prep? execution? analysis? all three?).

Teams may add methods to cells in their own `flow.yaml` without changing the canonical matrix. **Retired methods** stay in the catalog as "retired" (with replacement named) — so existing cards referencing them still parse.

---

## 9. The `<FLOW-handoff>` block

Every phase transition emits this. It is the single mechanism by which state passes between phases, between sessions, and — in V1 — between collaborators.

```
<FLOW-handoff>
from: explorer
to: solidifier
card_id: onboarding-redesign-2026-04
sigil:
  certainty: unknown
  size: bigger
archetype: willy
phase_exited: explore
locked:
  - "Problem framing: users abandon at step 3 because password strength surfaces late"
  - "Out of scope for this card: SSO flows (new card queued)"
open:
  - "Which copy pattern for the strength meter — passive or instructional?"
  - "Is step 3 the right place to educate on password hygiene, or step 1?"
artifacts:
  - "notes/onboarding-interviews-2026-04-18.md"
  - "notes/competitor-scan-2026-04-19.md"
  - "decisions/in-scope-vs-out-of-scope.md"
confidence_to_advance: 0.7
notes: |
  Ran Willy-intensity Explore (5 interviews + competitor scan + premortem).
  Two open items above are blocking Solidify; everything else deferred.
  Recommended Solidify approach: one-page brief + two concept validations.
</FLOW-handoff>
```

### 9.1 Field contract

| Field | Required | Meaning |
|---|---|---|
| `from` | yes | The exiting phase's agent name (lowercase: explorer / solidifier / builder / shipper). |
| `to` | yes | The entering phase's agent name. For a loop start, `to: explorer` is valid. |
| `card_id` | yes | Stable identifier for the unit of work. Source of truth across sessions. |
| `sigil.certainty` | yes | `known` or `unknown`. (Decided first — see §3.1.) |
| `sigil.size` | yes | `smaller` or `bigger`. |
| `archetype` | yes | `nemo` / `tuna` / `salmon` / `willy`. Derived from sigil; present explicitly so agents don't re-derive. |
| `phase_exited` | yes | Which phase is ending. Must match `from`. |
| `locked` | yes (can be empty) | Decisions the next agent must treat as settled. One bullet per decision, imperative / declarative. |
| `open` | yes (can be empty) | Questions the next agent must resolve (or explicitly defer). |
| `artifacts` | yes (can be empty) | Paths / URLs to material produced in this phase. |
| `confidence_to_advance` | yes | Float 0.0–1.0. Outgoing agent's honest read on whether this is done. **Advisory, not a gate** (§9.3). |
| `notes` | yes (can be empty) | Free-text. Sigil changes, skips, method choices, anything that doesn't fit above. |

### 9.2 Why this shape

- `locked` + `open` together form the minimum state an incoming agent needs to pick up without re-asking.
- `sigil` + `archetype` let the next agent sanity-check that the phase transition is warranted *for this kind of card*.
- `confidence_to_advance` is advisory — the agent's honest read. An Explorer returning `0.3` is saying "I don't think you're done exploring yet." The human may override; the override is logged.
- Plain text (not JSON) is deliberate: the block must round-trip through Claude Desktop, Cursor, ChatGPT, a Slack paste, a PR description, and a human skim-read.

### 9.3 `confidence_to_advance` is advisory, not a gate

The outgoing agent reports an honest number. The human reads it.

- **0.8 – 1.0** — clear green; the next agent proceeds without caveat.
- **0.5 – 0.8** — proceed but mark the handoff as *low-confidence advance*. The next agent should re-verify at least one `locked` item.
- **Below 0.5** — the outgoing agent is asking for more phase time. The next agent asks: *proceed anyway, loop back one phase, or stay here for another pass?*

**The human always has the override.** `//advance --force` or the equivalent proceeds despite low confidence. The override is logged in `notes`.

### 9.4 V1 multiplayer fields (forward-compatible)

In V1, `<FLOW-handoff>` gains three optional fields:

| Field | Purpose |
|---|---|
| `requester` | Who is pushing the handoff (the teammate asking for the next phase). |
| `reviewer` | Optional — who should review the receiving agent's output before the next handoff. |
| `sla` | Optional — by when. Soft signal for async rhythm, not an enforced deadline. |

These are designed so a solo OSS-launch handoff is forward-compatible — the V1 block is a superset, not a new format.

---

## 10. The four agent moves — Question / Review / Handoff / Block

**[AI-era]** Phase transitions aren't the only moments an agent needs to signal upward. Entry-condition failures, scope changes, and mid-phase concerns all require a move. FLOW uses four typed moves — same vocabulary across all agents — so the human reading chat can tell at a glance whether work can proceed:

| Move | What it means | Blocks work? | Example |
|---|---|---|---|
| **Question** | Ask the human; keep working while you wait. | No | Explorer: *"Should I include admin users in this research, or scope to end-users only?"* |
| **Review** | Hand to the human for explicit approval before continuing. | Soft — work pauses. | Solidifier: *"Brief is drafted — need sign-off before I hand to the Builder."* |
| **Handoff** | Emit `<FLOW-handoff>` to the next-phase agent. | No — normal transition. | Builder → Shipper at Build exit. |
| **Block** | Halt. Cannot proceed without the human resolving this. | Yes — hard stop. | Explorer: *"Scope changed from Salmon to Willy mid-phase. Blocking until you confirm the new sigil."* |

### 10.1 Rules

- A move is **always narrated in chat** — never silent. ("Blocking: …" / "Question: …" / emitting `<FLOW-handoff>`.)
- **Block** is reserved for cases where continuing would cause irreversible consequences (scope change, sigil mismatch, missing required input). Overuse trains humans to ignore it.
- **Review** is the right move at phase exits where `confidence_to_advance < 0.5` — the human green-lights rather than the agent auto-advancing.
- **Question** is the default mid-phase move. Use it freely; it's cheap.
- **Handoff** is the *only* move that changes phase. Everything else stays in the current phase.

---

## 11. Reverse transitions, sigil changes, skips

### 11.1 Reverse transitions (handbacks)

Reverse motion is **legitimate and expected** — especially for Salmons and Willys.

A Builder who discovers the shape is wrong hands back to Solidify. A Solidifier who discovers the problem is wrong hands back to Explore. Reverse transitions use the same `<FLOW-handoff>` format:

```
<FLOW-handoff>
from: builder
to: solidifier
phase_exited: build
...
notes: |
  Reverse transition. Discovered during implementation that the locked
  decision "password strength meter lives at step 3" conflicts with the
  research finding from Explore that users abandon at step 3 for
  unrelated reasons. Re-opening the step-placement question.
</FLOW-handoff>
```

**Rules:**

- The `from` phase is the one you're leaving, even going backward.
- The `notes` field must state **why** we are reversing (one sentence). Reverse without reason = silent redesign = bug.
- The receiving agent confirms with the human before re-opening. The human can say "no, hold the decision and unblock Build differently."

Reverse is not failure. **Silently redesigning without reversing is failure.**

### 11.2 Sigil changes mid-card

Legitimate, and Explore is the most common place they happen. Rules:

- **Sigil change is announced explicitly** — current agent emits a partial handoff (or a fresh `<FLOW-handoff>` with the new sigil and `phase_exited: same-phase-sigil-change`) before continuing.
- **Current phase re-evaluates** against the new archetype's cell in the matrix. A card that was Nemo but is now Salmon needs heavier Explore — the agent extends Explore rather than advancing.
- **`handoff_log`** on the card preserves the old sigil for audit.

Example: starting as Nemo (known × small), Explore interviews reveal the team has no idea how users actually reach step 3. Sigil becomes Salmon (unknown × small). Explore continues, now with interview-driven intensity.

### 11.3 Skips

"Any → Any" is allowed but noisy. Common valid skips:

- **Explore → Build** — user has an extremely clear Nemo with a validated shape from elsewhere. The Builder should still ask: *"Confirming we're skipping Solidify — is the `locked` list already correct?"*
- **Solidify → Ship** — documentation-only change or a pure copy fix. The Shipper should still ask: *"Confirming there's no Build step — we're releasing the spec change directly?"*

Skips are **never** the agent's decision alone. The receiving agent must:

1. **Flag the skip** in chat.
2. **Ask whether to proceed or retreat** one phase.
3. **Record the skip** in the handoff `notes`.

Repeated skips of the same phase across cards = signal that your team's default archetype is shifting. The Flow-checker agent (V2) will surface this; for now, humans see it in retrospectives.

---

## 12. Agent posture — the nudge

**[AI-era]** This is the single most important behavioral rule for the four operator agents (Explorer / Solidifier / Builder / Shipper).

### 12.1 Agents nudge. They don't refuse.

A great design-thinking mentor doesn't say *"I refuse to sketch yet"* when you ask to sketch too early. They say *"Sure — before we do, can I show you what three competitors just did, and ask you two things about users? Five minutes, then we sketch with a much better foundation."*

**That's the posture.** Operator agents:

- **Surface what you're about to skip.** The matrix cell names the methods that usually land this kind of card. The agent shows you the gap before you step over it.
- **Offer the right-sized version of the missing work.** Not the full Willy stream — the *cell-appropriate* version for this fish. A Nemo Explore "close" is 5 minutes; a Willy Explore "close" is an afternoon.
- **Let you decide.** You can always say *"skip it, I'm going."* You'll do so *knowing* what you're skipping — which is the whole point.
- **Keep finding opportunities across the session.** The nudge is persistent but kind — if you skip a research moment now, the agent will surface it again at the next natural opening, in a differently-sized form.

The nudge is **how** the operator stays firm on the method without being a security guard.

### 12.2 Three intensity levels

Not every nudge is equally loud. The agent calibrates by **project risk**, not taste.

| Level | When | What the agent says |
|---|---|---|
| **Nudge** (default — 95%) | Phase-shape mismatch; missing-but-recoverable method; intensity-cell drift | *"Before we sketch, want 5 minutes on competitor scan + one HMW? Usually lands this kind of card faster."* |
| **Strong nudge** | A project-health method is being skipped (measurement on a Salmon, AC on a Build) | *"I'll build this, but we're skipping measurement on a Salmon — that's usually what makes this kind of project fail. OK to skip, or 10-minute measurement plan first?"* |
| **Hard stop** (rare, reserved) | Real project risk: sigil mismatch, missing required artifact that makes the project unrunnable, shipping without evidence on research-led fish | *"Blocking — you're shipping a Salmon without a measurement plan. Without it we can't tell if the project worked. Add a plan, or change the fish type."* |

**Rule:** hard stops are for **real project risk**, not stylistic preference. Overuse of Block trains users to ignore it. Keep it rare.

### 12.3 What the agent never does

- **Silently do the cross-phase work and hope you don't notice.** Silent drift is the bug FLOW exists to prevent.
- **Say "fine, whatever" and cave.** There is no "disagreed but complied" mode.
- **Debate in-character across many turns.** One nudge, one offer, move on. Persistent does not mean naggy.

### 12.4 The two escape hatches (when you don't want to do the nudged work)

When the nudge isn't what you want, there are two clean paths:

1. **Re-sigil.** If the card's real scope or familiarity is different than you thought, update the sigil. The fish type changes; the matrix cell changes; the nudged methods change. The method adapts to the real shape.
2. **Switch agent.** Hand to the phase that owns this work. The user gets what they need; a different agent does it; the skip is logged in `notes` per §11.3.

Both are **overt**, both are **logged**. What's off the table is *"nudged-and-ignored-without-trace."* The card's history should always be able to answer the question *"was this method run, deferred with reason, or skipped?"*

### 12.5 Why operators can hold the line while still being nudgers

Operators are **phase-bound coaches**. Their value is that they *know the cell* — they know what a Salmon Explore *actually looks like done well*, because the matrix and methods are their knowledge. When you ask them to skip it, they're not being precious — they're telling you a real thing that's usually true about this kind of card.

The nudge is firm *because the method is real*, not because the agent has authority. That's design-thinking posture, not process-enforcement posture.

### 12.6 What about expert agents?

The Layer-2 expert agents (Design, PM, Dev, DesignOps, TechPM, Architect, QA, Analyst, AssetCreator) are **phase-agnostic specialists**, not phase-bound operators. They nudge within their domain (*"before we finalize the API shape, let's write one endpoint against the real data"*) but don't enforce phase.

**Phase still holds when an expert is loaned.** If Bran (Builder) has surfaced that the card is missing Solidify work, loaning in `@growth-pm` doesn't bypass that — it adds a growth-PM lens to Bran's current nudge. Phase boundaries are an operator's concern, not an expert's.

### 12.7 What this replaces

Earlier drafts of this section used a "firm refuse" posture with an `OVERRIDE-LOG` primitive — user forces, agent complies, logs it. That was wrong twice over: (1) it made acquiescence a feature; (2) it framed the agent as a guard rather than a mentor. §12 replaces both. The agent nudges (design-thinking coaching). If the user wants to skip a nudge, they re-sigil or switch agents — overt, logged, intentional. The only hard stops are real project-risk situations, not taste.

---

## 13. What AI changes — real pains, real fixes

**[AI-era]** The original 2024 Fish Model assumed humans running the method with their own discipline. AI changed the conversation, and not always for the better. What follows are the *actual* pains designers, PMs, and devs report when building product with AI in 2026 — and how FLOW addresses each.

### 13.1 Seven pains, seven fixes

| What users feel | What's actually happening | How FLOW fixes it |
|---|---|---|
| **"I don't know where I am."** | Long AI sessions feel like progress but might be spinning. No external marker for "you're in phase X working on card Y." | Every card carries a live state: fish type + phase + sigil. The agent echoes it back every turn. You always have an answer to *"where am I?"* |
| **"I don't trust any of this is saved."** | Chat sessions feel ephemeral. When Claude closes, what survived? | Every phase exit writes a handoff file to `.flow/cards/<card-id>/<phase>.md`. Not in memory, not in a chat — on disk. Resumable anywhere. |
| **"The AI doesn't guide me through a process."** | It responds; it doesn't shape the work. No method on the AI's side. | The operator agent's *job* is to run the method — nudging the next step, surfacing what's missing from the current cell, proposing the right-sized work. |
| **"It has no UX instinct."** | Jumps to "here's a solution" without asking about users or context. | Operators are phase-shaped. Dora (Explorer) asks about users *before* anything else. The phase boundary *is* the instinct. |
| **"When I switch tools, I start over."** | Claude → Cursor → Figma: every tool is a blank slate. | The card lives in files (local) + Duble Slash Cloud (synced). Open the next tool, type `//solidify <card-id>`, and the Solidifier reads the Explore handoff automatically. |
| **"I can't see the project — just pieces."** | Work is scattered across 50 chat sessions with no consolidated view. | `//card <card-id>` shows the whole project in one view: every phase's handoff, evidence, decisions, trust receipts. The *project* exists, not just the pieces. |
| **"There's no history of who decided what."** | Can't audit. Can't review. Can't show a teammate. | Every handoff logs `locked` decisions + `open` questions + AI vs. human contribution. Trust receipts on every ship. The card *is* the audit trail. |

These are the reasons AI-assisted projects drift, ship late, or quietly die. FLOW addresses each one mechanically — not through good intentions.

### 13.2 None of this requires a new tool

FLOW doesn't want you to leave Claude / Cursor / ChatGPT. It wants your AI to *finally behave like a methodology knows what it's doing*. The method is a shared vocabulary the AI can read and run. The artifact is a card + handoffs that survives sessions and tools. That's it.

### 13.3 What the agents specifically do

- **Dora (Explorer)** nudges you to open the aperture before you sketch. Runs the Explore cell for the current fish. Refuses to silently wireframe; offers to handoff to Sol if you're asking for shape.
- **Sol (Solidifier)** nudges you to lock one shape before you build. Produces the brief, AC, measurement plan. Refuses to silently research-more; hands back to Dora if unknowns are blocking.
- **Bran (Builder)** nudges you to execute against the locked shape, no re-opening. Produces the runnable thing. Hands back to Sol on real upstream contradictions.
- **May (Shipper)** nudges you to narrate every release — even a tooltip fix. Produces commit + changelog + trust receipt. Queues the next loop.

See [agents-overview.md](./agents-overview.md) for the full 13-agent roster, including the 9 Layer-3 system agents (Duble Slash Cloud) that extend FLOW across sessions and teammates.

---

## 14. Worked examples — one per archetype

Each of the four archetypes runs end-to-end below. These are the calibration examples — read the one that matches your current card's sigil before you start, so you know what *appropriately sized* looks like.

### 14.1 Nemo — tooltip copy fix

**Context:** Support flagged that users misinterpret the tooltip on the "Export as CSV" button. Two tickets this week asked "does this export *current view* or *all data*?"

**Sigil + archetype:** `certainty: known` · `size: smaller` · **Nemo**. Budget target: under 2 hours.

**Explore (10 min):** Confirmed sigil. Heuristic scan flagged "match between system and real world" violation. One HMW: *"How might we make the export-scope choice obvious before the user clicks?"* Competitor scan of 3 tools — two use dropdown, one confirmation modal. No Hick's Law concern. Handoff emitted (`confidence 0.9`).

**Solidify (20 min):** Picked tooltip-rewrite over dropdown (minimal surface change). Sketch: tooltip now reads *"Exports the rows currently visible. Change filters first to export more."* Three AC (string, 200ms hover, screen-reader). Reuses existing Tooltip primitive — no design-system extension. Handoff (`confidence 1.0`, `open = []`).

**Build (30 min):** Replaced string in `components/ExportButton.tsx`. Screen-reader test passed. No refactor.

**Ship (10 min):** Commit `fix(export): clarify CSV export scope in tooltip copy`. Changelog: *"Clearer copy on the CSV export tooltip."* Trust receipt: 1 line changed, 0 redactions.

**What FLOW did:** 2 hours total, no scope creep. Explorer refused to wireframe a dropdown; Solidifier refused to spin a dropdown-redesign into this card. Zero PRD. Zero journey meeting. Four handoffs, each 30 seconds. Card is resumable if interrupted.

### 14.2 Tuna — billing history redesign

**Context:** Customers have asked for a better billing history view. Current view shows invoices as a flat list; customers want grouped by period and downloadable.

**Sigil + archetype:** `certainty: known` · `size: bigger` · **Tuna**. Budget: 2-week sprint.

**Explore (1 day):** Convention inventory (invoice detail, date-range picker, download button primitives). Journey map of current flow in 5 swim-lanes. OSD for download path. Competitor scan of Stripe, Linear, Notion billing. Shortlisted 3 directions: period-grouped list / detail-drawer / hybrid. Handoff (`confidence 0.8`).

**Solidify (2 days):** 8-frame storyboard (arrive → filter → expand → detail → download → success → error → empty). Journey meeting with engineering. Went **hybrid**. New `<PeriodGroup>` component (design-system extension, justified). One-page brief, journey-structured. 14 AC bullets. Microinteraction specs for group expand/collapse. Handoff (`locked = brief + AC + components`).

**Build (1.5 weeks):** Component library first. Iterative prototyping in Storybook. Vertical slices: list → drawer → download → empty. AC run as tests — 14/14 pass. Joint review: designer + PM + BE. One friction on download timing → added loading state mid-Build.

**Ship (half-day):** Changelog: *"Billing history redesigned. Invoices now group by period; one-click download per period."* Docs updated. Release note to paying customers. Trust receipt: 17 files changed, 1 new component, 2 redactions (customer name in screenshot, internal endpoint).

**What FLOW did:** Brief replaced PRD. Storyboard was the meeting material; AC was the spec; trust receipt was the QA artifact. No translation layer between design and engineering. Reusable journey map is now the foundation for the next billing Tuna.

### 14.3 Salmon — onboarding step-3 abandonment

**Context:** Analytics flagged 40% drop at step 3 of signup. No deep user interviews since the flow was built 18 months ago.

**Sigil + archetype:** `certainty: unknown` · `size: smaller` · **Salmon**. Budget: 1.5 weeks.

**Explore (5 days):** Sigil confirmed (warned it might flip to Willy). 7 user interviews, semi-structured, recorded with consent. TZUMI: Go-Learn → One-User → Hand-in-Hand. Nugget board with 28 atomic findings. Task analysis of step 3. Journey map anchored in interview quotes. Synthesized 3 framings; winner: *"Users abandon step 3 because the password-strength meter surfaces after typing, making them feel retroactively judged."* Handoff (`confidence 0.8`).

**Solidify (3 days):** Picked instructional copy pattern (strongest interview support). 1-page brief, journey-structured. Concept test with 5 users on low-fi prototype — 4/5 completed, 1/5 surfaced minor copy ambiguity. Iterated copy once. AC evidence-informed, 6 bullets. Measurement plan: track step-3 completion; target +20 pp within 30 days. Handoff.

**Build (2 days):** Built copy change + meter-surfacing logic. Instrumented: added `signup_step3_completed` event. Usability-tested with 4 users — 4/4 completed without friction.

**Ship (spread over 2 weeks):** Released with instrumentation live. Baseline captured pre-release. Measured 2 weeks post: step-3 rose 60% → 78% (+18 pp, just under target). ISO 9241 triad: all three improved. Learning log: *"Meter placement matters more than wording. Instructional copy helped but most of the lift came from surfacing the meter earlier."* Queued next loop: step-3 education vs. step-1 education. Trust receipt.

**What FLOW did:** Kept Explore heavy where it belonged. Without the 7-interview discipline, the team would have shipped a cosmetic copy fix and missed the real cause (meter placement). Measurement plan in Solidify, not Ship, so Ship could actually measure. Next-loop handoff meant the follow-up question went back to Explore with a fresh sigil, not to `/dev/null`.

### 14.4 Willy — multiplayer handoff (V1)

**Context:** Duble Slash's own V1 roadmap. The killer demo is Sarah (designer, Claude) handing off to Marcus (developer, VS Code) via Duble Slash Cloud. Nothing like this exists in our product yet.

**Sigil + archetype:** `certainty: unknown` · `size: bigger` · **Willy**. Budget: 4 months.

**Explore (3 weeks):** Sigil confirmed, warned about sub-splits. Market scan of Granola, Rewind, Linear+AI, Cursor Teams. 12 interviews across 3 personas (Senior IC, Team Lead, New Joiner). TZUMI across two cohorts. Contextual inquiry with two teams (4 hours each, Shenhav pairing). Goal-Directed Design personas. JTBD pass. OSD for Sarah → Marcus across 5 tool boundaries. Premortem surfaced 3 failure modes (trust leak, presence-notification fatigue, no canonical card id). Scenario planning: happy path + "Marcus offline" + "Sarah's handoff has a secret" + "three teammates on same card." Pitch outline drafted. Handoff (`confidence 0.75`).

**Solidify (2 weeks):** Pitch (RFC) — 5 pages, journey-structured. 3 concept tests across 3 directions; push-button won. Tradeoff axes: privacy ↔ speed, explicitness ↔ ambient. Personas finalized. Multi-level AC: functional, UX (teammate sees within 5s), perf (sub-500ms under 100-card load), compliance (EU data residency). 3 journey meetings with design + eng + GTM. Decision log with 14 major decisions, alternatives, reasoning. Measurement plan: time-to-pickup, handoff acceptance rate, post-handoff satisfaction (1–5 after 30 days).

**Build (10 weeks, staged):** Broke into 6 Tuna-sized sub-cards: (a) hosted backend + auth, (b) Capture-to-Cloud, (c) Handoff routing, (d) Desktop client pickup, (e) Team view, (f) Slack integration. Thin vertical slice first: Sarah's Claude session → handoff → Marcus's VS Code pickup, end-to-end in 3 weeks. Integrated requirements (Shenhav on backend from Solidify). Weekly joint product reviews. Staged rollout plan: internal → 5-team alpha → beta → GA. Measurement hooks live per sub-card.

**Ship (4 weeks, staged):**
- *Internal dogfood (week 1):* Used ourselves. 3 bugs found, fixed. Trust receipt.
- *Alpha (weeks 2–3):* 5 teams. Time-to-pickup ~12s (target <60s). Acceptance 72%. Trust receipt per team.
- *Beta (weeks 3–4):* 30 teams. Handoff satisfaction 4.2/5. Two Salmons spawned for presence-fatigue.
- *GA:* full release + announcement post.
- *Retrospective:* surfaced that Willys with >3 sub-cards should add a sub-card health meter — logged for next Willy.
- *Master trust receipt* covers the whole V1 handoff with all child sigils, measurements, approvers.
- *Queued 3 next-loop Explores:* presence fatigue, cross-team handoff, mobile pickup.

**What FLOW did:** Willy-sized Explore protected against the "Sarah → Marcus seems simple" trap — the premortem's 3 failure modes became design inputs, not launch bugs. Break-into-Tunas kept the Willy build-able. Staged Ship meant measurement didn't wait for GA. Decision log became the onboarding doc for the next Willy — institutional memory instead of archaeology.

---

## 15. What FLOW is, what it replaces, and lineage

### 15.1 What FLOW is

**FLOW is Agile for the AI era.** A **user-centered**, design-thinking-shaped methodology built on the assumption that AI is present and gets a *role*. The output is a project that **ships** — with faster iteration, consolidated context, reviewable decisions, and human judgement preserved.

**User-centered, not KPI-driven.** Double Diamond is the backbone because the user is the point. A project's "success" is the signal that the user won — not a metric detached from the user's life. FLOW exists to make user-centered design-thinking survive AI's arrival, not to replace it with outcome-math.

### 15.2 What FLOW replaces

- **Agile sprints** → replaced by continuous ship-ability per fish-shape. No two-week rhythm forced on work that doesn't fit it.
- **PRDs** → replaced by phase-shaped briefs (Explore findings, Solidify brief, Build AC, Ship trust receipt).
- **Standups** → replaced by project-level digests via Duble Slash Cloud (V1.5+): *"Today across your team: 3 Salmons in Explore, 2 Tunas in Build, 1 Willy entering Solidify."*
- **Vague "process" in AI tools** → replaced by phase-shaped, nudging agents that know the matrix and surface missing cell-methods.
- **Figma-link + Slack-paragraph handoffs** → replaced by card + handoff briefs that survive sessions and tools.

### 15.3 What FLOW is *not*

- **Not project-management software.** FLOW runs *one project's lifecycle*; portfolio view sits above.
- **Not design-only.** Phases and handoffs apply to code, research, docs, decisions.
- **Not tool-prescriptive.** Figma, VS Code, notebook, napkin — FLOW cares about phase + fish + handoff, not filetype.
- **Not gate-keeping.** `confidence_to_advance` is advisory; reverse transitions are normal (§11). Hard stops exist only for real project risk (§12.2).
- **Not a KPI-chasing framework.** The user wins first. Metrics come *from* the user winning, not the other way around.
- **Not a guarantee of good work.** A shallow Explore from a skilled designer still beats a thorough Explore from someone who doesn't know the user. FLOW shapes the process; the human supplies the taste.

### 15.2 Lineage

FLOW stands on three legs:

- **Béla H. Bánáthy's divergence–convergence model** (systems thinking, 1960s–70s) — the "diamond shape" inside every phase.
- **UK Design Council's Double Diamond** (2004, revised 2019) — the two-diamond split between problem and solution space; the direct parent of the left-body / right-body split.
- **The Fish Model** (Tal Solomon, 2024, [talsolomonux.com/p/0d2](https://www.talsolomonux.com/p/0d2) + follow-up articles) — the species as archetypes; the familiarity × scope axes; sprint capacity per fish; PD leader per fish; curated method selection per cell; brief-not-PRD; journey meetings.

**FLOW (this spec, 2026)** is the AI-operable evolution: same lineage, newly legible to LLMs and to a multiplayer graph. Specifically, FLOW adds:

- Fish anatomy as an explicit four-phase pipeline (head → left body → right body → tail).
- Sigil as a first-class, machine-readable card field.
- `<FLOW-handoff>` as the universal, plain-text transition receipt.
- The four typed agent moves (Question / Review / Handoff / Block).
- Firm-redirect operator posture (§12).
- Trust receipts at every Ship.
- Cross-tool, cross-session capture via Duble Slash Cloud (V1+).

### 15.3 Where the agents live

The operators and experts that enact FLOW are specified in:

- **Operators** (Layer 1 — the four `//` agents): `methodology/agents/operators/` (Dora / Sol / Bran / May).
- **Experts** (Layer 2 — nine BMAD-shaped expert agents with per-agent skill specializations): `methodology/agents/experts/`.
- **System agents** (Layer 3 — nine Duble Slash Cloud workers): `methodology/system-agents/`.
- **Overview of all thirteen** (roster + lifecycle + picker): [agents-overview.md](./agents-overview.md).

*(These paths reflect the Phase 4 target layout from the 2026-04-23 rebuild. Pre-rebuild, the operators still live at `methodology/local-agents/` with old call-signs Nova / Sol / Bram / Sage.)*
