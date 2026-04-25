---
name: FISH phases and methods — deep dive
description: Per-phase goals, postures, per-archetype streams (step-by-step), applicable methods with definitions, artifacts, entry/exit criteria, anti-patterns, and a full method catalog mapped to phases × archetypes.
type: methodology-spec
---

# FISH phases & methods — the drill-down

This doc expands [`README.md`](./README.md) §5 into operational detail. For each phase you get:

- **Goal, posture, verbs** — what the phase is for.
- **Entry / exit criteria** — the gates on either side.
- **Streams** — the concrete ordered steps to run, one per archetype (Nemo / Tuna / Salmon / Willie).
- **Methods** — every technique applicable in this phase, with a one-line definition and when-to-use notes.
- **Artifacts** — what comes out.
- **Anti-patterns** — how the phase goes wrong.
- **Human-AI collaboration notes** — what the agent does vs. the human.

At the end: a [full method catalog](#method-catalog) — 50+ UX, research, and delivery methods mapped to phases and archetypes.

> **"Stream"** means the ordered step-by-step for one archetype in one phase. A Nemo Explore stream is different from a Willie Explore stream; both live in §1 below. Read just your card's stream — not all four.

---

## Phase 1 — Explore (head)

### Goal & posture

- **Goal:** open the aperture. Surface options, questions, premises, and unknowns. Refuse to commit.
- **Posture:** divergent. Breadth over depth. Three shallow threads beat one deep one at this phase.
- **Verbs:** ask, enumerate, diagram, compare, interview, map.
- **Primary risk:** silent drift into Solidify (shaping) or Build (sketching). The Explorer must refuse both.

### Entry criteria

- A problem statement (can be vague).
- A proposed sigil (size × certainty). If the user can't provide one, the Explorer helps set it in the first 5 minutes.
- Optionally, a `<FISH-handoff>` from a prior Ship → Explore loop.

### Streams — by archetype

Each stream is an ordered checklist. Run top-to-bottom. Use the methods linked — their definitions are in [§Method catalog](#method-catalog) at the bottom.

#### Nemo Explore stream (small × known)
> Budget: 10–30 minutes. Don't run a full Double Diamond on a tooltip.

1. **Name the sigil out loud.** Confirm `smaller × known → Nemo`.
2. **Heuristic scan** of the current UI — pick 2–3 Nielsen heuristics most likely to be violated.
3. **One [HMW](#hmw) reframe** — rewrite the problem as a single "how might we…" question.
4. **Skim a competitor pattern** — screenshot one parallel, note what's the same and what's different.
5. **[Hick's Law](#hicks-law) check** if the card touches choice-density.
6. **Close:** list the 1–3 concrete unknowns remaining (if any). Emit handoff to Solidifier.

#### Tuna Explore stream (big × known)
> Budget: half a day to a full day. You already know the conventions; you're mapping where they apply.

1. **Confirm sigil** (`bigger × known → Tuna`).
2. **Convention inventory** — list the design-system components, patterns, and prior art this card will inherit.
3. **[Journey map](#journey-mapping)** the current flow at mid-fidelity. One swim-lane per persona touching the flow.
4. **[OSD](#osd)** (operational sequence diagram) if the flow crosses systems or roles.
5. **Competitor scan** — 3–5 parallels. Note deviations that matter.
6. **Shortlist 2–3 structural directions** for Solidify to choose among.
7. **Close:** handoff with `locked` = problem framing + applicable patterns; `open` = which of the 2–3 directions to converge on.

#### Salmon Explore stream (small × unknown)
> Budget: multi-day. Most of the card's effort lives here. Don't shortcut.

1. **Confirm sigil** (`smaller × unknown → Salmon`).
2. **[User interviews](#user-interviews)** — 5–8 sessions, semi-structured, recorded if consent.
3. Apply **[TZUMI](#tzumi)** (צומ"י): Go-Learn (exploratory) → One-User (validate one insight with one user) → Hand-in-Hand (shadow or pair with a user).
4. **[Nugget board](#nugget-board)** — capture findings as atomic, tagged nuggets rather than long reports.
5. **[Task analysis](#task-analysis)** on the specific flow the card will change.
6. **[Journey mapping](#journey-mapping)** — now anchored in real interviews.
7. **Synthesize** 3–5 framings. Pick the 1 with the most interview support for the Solidifier.
8. **Close:** handoff with `locked` = the chosen framing + the evidence for it; `open` = unresolved interview tensions worth flagging to Solidify.

#### Willie Explore stream (big × unknown)
> Budget: two+ weeks. This is the "strategic" bucket. Invest.

1. **Confirm sigil** (`bigger × unknown → Willie`). Prepare to re-confirm mid-phase — Willies often split.
2. **Market / competitive scan** — deeper than Tuna; map positioning axes.
3. **[User interviews](#user-interviews)** — 8–15 sessions, across personas.
4. Apply **[TZUMI](#tzumi)** across multiple cohorts.
5. **[Contextual inquiry](#contextual-inquiry)** if the work is a developer/operator tool or the user's environment matters.
6. **[Goal-Directed Design](#goal-directed-design)** — surface End, Experience, and Life goals per persona.
7. **[JTBD](#jtbd)** pass — functional, emotional, social jobs.
8. **[OSD](#osd)** across the whole end-to-end flow.
9. **[Premortem](#premortem)** — imagine this ships and fails; what went wrong? Invert to find risks.
10. **[Scenario planning](#scenario-planning)** — happy path + two alternative branches + a worst-case.
11. **Draft a [pitch / RFC](#rfc-pitch)** outline (not the full pitch — that's Solidify's job).
12. **Close:** handoff with `locked` = the problem framing + the non-negotiables; `open` = the 3–5 concept directions the Solidifier will test.

### Artifacts

- `notes/` or `explore/` scratch directory — raw interview transcripts, journey maps, competitor screenshots, HMW reframes, nuggets.
- One-paragraph framing summary.
- `<FISH-handoff>` to Solidifier.

### Exit criteria

- Problem framing stable enough that the next natural question is *"what shape?"* not *"what are we solving?"*.
- Sigil confirmed (may have changed since entry — that's fine; narrate the change in `notes`).
- At least one unknown from entry resolved or explicitly deferred.

### Anti-patterns

- **"Exploring" that produces wireframes.** Sketches belong to Solidify. If the Explorer is producing UI, handoff early.
- **Interviewing to confirm, not to discover.** Ask open questions. If your prompts lead, you're in Solidify.
- **Nemo-sized Explore for a Salmon card.** Felt productive, missed the actual user.
- **Willie-sized Explore for a Nemo card.** Month-long research project for a tooltip.
- **Silent sigil change.** Sigil changes are announced, not smuggled.

### Human-AI collaboration notes

- **AI is strong at:** summarizing interview transcripts, generating HMW reframes, pattern-scanning competitors, drafting journey-map templates, suggesting premortems and alternative scenarios.
- **AI is weak at:** the actual interview. The Explorer agent does not fabricate user quotes. If no real interviews exist yet, the agent names this as the biggest `open` and recommends running them.
- **Human stays in charge of:** sigil confirmation, framing choice, interview participant selection, quote authenticity.

---

## Phase 2 — Solidify (left body)

### Goal & posture

- **Goal:** reduce unknowns to one shape. Lock decisions that unblock build.
- **Posture:** convergent. Decisions over discussion. Offer defaults and ask the human to accept / amend / reject, rather than asking open "what do you think?" questions.
- **Verbs:** decide, shape, sketch, spec, agree.
- **Primary risk:** five half-shapes instead of one lock. Solidify produces **one** thing.

### Entry criteria

- `<FISH-handoff>` from Explorer with a framing, unknowns list, and artifacts (or — for Nemo / Tuna — a quick one-sentence brief if entering Solidify directly).
- Confirmed sigil + archetype.

### Streams — by archetype

#### Nemo Solidify stream (small × known)
> Budget: 30 min – 2 hours.

1. **Pick one [HMW](#hmw)** — the framing the Explorer surfaced.
2. **One sketch** — napkin-level is fine. Solves exactly the HMW, nothing more.
3. **Write 3–5 bullet [acceptance criteria](#acceptance-criteria)** — each independently checkable.
4. **Check against [Hick's Law](#hicks-law) / [Recognition over Recall](#recognition-over-recall)** — does the shape add cognitive load?
5. **Reuse from [design system](#design-system-extension).** No bespoke components for a Nemo.
6. **Close:** handoff with `locked` = the sketch + acceptance criteria; `open` = empty (Nemo Solidify should empty the list).

#### Tuna Solidify stream (big × known)
> Budget: 1–3 days.

1. **[Storyboard](#storyboarding)** the end-to-end flow — 6–10 frames.
2. **[Journey map](#journey-mapping)** with the storyboard overlaid. Confirm gaps.
3. **Extend the [design system](#design-system-extension)** where needed. Justify any new component.
4. **Draft the [brief](#brief-not-prd)** (journey-structured, not feature-list).
5. **[Microinteraction](#microinteractions) specs** for anything novel — Triggers, Rules, Feedback, Loops/Modes.
6. **Acceptance criteria** — multi-category (functional, UX, accessibility, perf).
7. **Review meeting** — a [journey meeting](#journey-meetings), not a feature meeting.
8. **Close:** handoff. `locked` = brief + AC + component list. `open` = non-blocking (perf thresholds, nice-to-haves).

#### Salmon Solidify stream (small × unknown)
> Budget: 2–5 days.

1. **Pick one framing** from Explore's shortlist — the one with strongest interview support.
2. **Write a one-page [brief](#brief-not-prd)** — problem, journey, shape, acceptance criteria, deferred scope.
3. **[Concept test](#concept-testing)** — 3–5 users, low-fidelity. Validate the shape *before* Build.
4. **Iterate once** based on concept-test feedback.
5. **Write [acceptance criteria](#acceptance-criteria)**, now evidence-informed.
6. **Plan the measurement** — what behavioral signal will tell us this worked in Ship?
7. **Close:** handoff. `locked` = brief + validated shape + AC + measurement plan. `open` = any unresolved minor tensions.

#### Willie Solidify stream (big × unknown)
> Budget: 1–3 weeks.

1. **Write a [pitch / RFC](#rfc-pitch)** — the full shape. This replaces the brief for Willies.
2. **Run 2–3 [concept tests](#concept-testing)** across concept directions from Explore.
3. **Map tradeoffs on [spectrum axes](#spectrum-mapping)** (e.g., flexibility ↔ usability).
4. **Define personas** using [Goal-Directed Design](#goal-directed-design) if not already done in Explore.
5. **Multi-level acceptance criteria** — functional, UX, performance, compliance, business.
6. **Stakeholder alignment** — [journey meeting](#journey-meetings) format, not slide-deck review.
7. **Decision log** — every major Solidify decision, with reasoning and alternatives.
8. **Measurement plan** — baseline, target, instrumentation. Willies without a measurement plan are vanity projects.
9. **Close:** handoff. `locked` = pitch + AC + decision log + measurement plan. `open` = explicit Build-phase latitude (where the Builder has discretion).

### Artifacts

- **The brief** (Nemo, Tuna, Salmon) — one page.
- **The pitch / RFC** (Willie) — longer, but journey-structured not feature-listed.
- **Acceptance criteria** — bulleted, checkable.
- **Decision log** (Willie).
- **Measurement plan** (Salmon, Willie).
- **Deferred scope list** — explicit "not in this card, here's why."

### Exit criteria

- One shape doc exists (not five half-shapes).
- Acceptance criteria written, each independently checkable.
- `open` list contains no build-blocking items. Non-blocking `open` is fine (defer-to-v2, nice-to-have).
- For Salmon and Willie: validation evidence from at least one concept test.

### Anti-patterns

- **PRD sprawl.** If the brief has a table of contents, you're hiding deferred scope.
- **Open-ended "what do you think?"** to the user. Solidify offers defaults; user accepts / amends / rejects.
- **Skipping concept test on a Salmon.** The whole reason Salmon got a heavy Explore was to validate shape before Build. Don't skip the test.
- **Willie without a measurement plan.** You'll ship, be unable to tell if it worked, and debate for months.

### Human-AI collaboration notes

- **AI is strong at:** drafting briefs from handoffs, generating acceptance-criteria candidates, proposing tradeoff axes, extracting decision-log entries from conversation, writing pitch/RFC skeletons.
- **AI is weak at:** deciding which framing is right. The Solidifier agent will surface the choice to the human, not make it.
- **Human stays in charge of:** all locked decisions; the shape choice; which criteria matter; stakeholder conversations.

---

## Phase 3 — Build (right body)

### Goal & posture

- **Goal:** execute against the locked shape. No re-opening settled questions.
- **Posture:** executional. Smallest change that satisfies the contract. Diverge only where the brief left explicit latitude.
- **Verbs:** implement, prototype, test, integrate.
- **Primary risk:** scope creep + silent re-design. The Builder surfaces disagreement *once* then either proceeds under the contract or hands back.

### Entry criteria

- `<FISH-handoff>` from Solidifier with shape locked, acceptance criteria written, `open` empty of blockers.
- For any Willie / Salmon: a measurement plan.

### Streams — by archetype

#### Nemo Build stream (small × known)
> Budget: one session (15 min – 4 hours).

1. **Re-read `locked`** — treat as contract.
2. **Make the smallest change** that satisfies the AC. No refactoring neighbors.
3. **Golden-path test** — does the happy flow work?
4. **Edge cases from `locked`** — the ones Solidify named. Nothing more.
5. **Close:** handoff to Shipper. `locked` = what was built; `open` = defer-to-v2 items surfaced during build (if any).

#### Tuna Build stream (big × known)
> Budget: multi-sprint.

1. **[Component library](#component-library-strategy) first** — which library's primitives are we composing with? (Material, Radix, MUI, Ant.)
2. **[Iterative prototyping](#iterative-prototyping)** — designer + developer in shared tool (Figma / Storybook / Zeplin).
3. **Build in thin vertical slices** — one user-visible capability per slice, not horizontal layers.
4. **[Microinteractions](#microinteractions)** per Saffer — Triggers / Rules / Feedback / Loops-Modes.
5. **Apply [motion principles](#motion-principles)** for animation — 100–500ms, easing, restraint.
6. **Run the acceptance criteria as test cases.**
7. **Joint review** — designer + dev + PM review the built artifact against the brief.
8. **Close:** handoff. `locked` = built artifact + test status. `open` = follow-ups, known limitations.

#### Salmon Build stream (small × unknown)
> Budget: 1–3 days; small but instrumented.

1. **Build the validated shape** — Solidify already validated, just implement.
2. **Instrument for the measurement plan** — add the analytics/events the plan requires.
3. **[Usability test](#usability-testing)** the built artifact with 3–5 users (same or different from Solidify's concept-test cohort).
4. **Iterate once more** if usability reveals friction. (Salmon often iterates in Build because it's small enough to afford it.)
5. **Close:** handoff. `locked` = built + instrumented artifact. `open` = any test-observed friction deferred to next loop.

#### Willie Build stream (big × unknown)
> Budget: month+, staged.

1. **Break into Tuna-sized sub-cards** — each its own sigil, each its own mini-lifecycle. The parent Willie tracks progress across sub-cards.
2. **Start with a thin vertical slice** — the smallest demo-able path through the full system.
3. **[Integrated requirements](#integrated-requirements)** — devs involved from spec, not thrown over the wall.
4. **[Joint product reviews](#joint-product-reviews)** — designer + dev + PM co-review at each slice.
5. **Roll out staged** — internal → alpha cohort → beta → general. Each stage emits its own `<FISH-handoff>` (intra-Build).
6. **Measure per slice** — the measurement plan from Solidify applies per slice, not just at the end.
7. **Close:** handoff. `locked` = staged artifact + measurement baseline. `open` = per-slice follow-ups, next-loop scope.

### Artifacts

- Built code / designs / docs — the actual deliverable.
- Test output (unit, integration, usability as applicable).
- Run instructions (how a teammate reproduces the build).
- Instrumentation changes (Salmon, Willie).
- Staged rollout plan (Willie).

### Exit criteria

- Artifact is runnable (for code) or reviewable (for design).
- Golden path verified.
- `locked` edge cases covered.
- Measurement hooks exist where the plan required them.

### Anti-patterns

- **Re-designing in Build.** If you disagree with a `locked` decision, hand back to Solidify. Don't silently change it.
- **Horizontal layer builds** instead of vertical slices. Takes longer to see value, hides integration bugs.
- **"Tests after."** Salmons especially break if usability-test is deferred past Build close.
- **Gold-plating a Nemo.** A 15-minute change should not grow into a refactor.
- **Willies built as one giant lump.** Break into sub-cards or you'll stall.

### Human-AI collaboration notes

- **AI is strong at:** implementation (code), prototyping (Figma-level structure), test generation, scaffolding instrumentation, enumerating edge cases from AC.
- **AI is weak at:** production-deployment judgment, real-user usability tests, cross-team coordination.
- **Human stays in charge of:** merge/release decisions, anything touching production data, final UX judgment on "does it actually feel right."

---

## Phase 4 — Ship (tail)

### Goal & posture

- **Goal:** narrate, release, and make the work legible to future-you. Close the loop.
- **Posture:** curatorial. Write the short "what changed and why" that the team, the user, and the next Explore cycle will read.
- **Verbs:** release, document, measure, hand off.
- **Primary risk:** a release without a narrative. A commit with no "why" is technical debt.

### Entry criteria

- `<FISH-handoff>` from Builder with runnable / reviewable artifact.
- Any measurement plan from Solidify is implemented in Build.

### Streams — by archetype

#### Nemo Ship stream (small × known)
> Budget: 15–30 min.

1. **One-line changelog entry.**
2. **Commit message** — what + why (the "why" is one sentence).
3. **Release** — merge, push, publish.
4. **[Trust receipt](#trust-receipt)** — even for a solo Nemo. Auto-generated; takes 30 seconds.
5. **Close:** terminal or Ship → Explore handoff if a next loop is queued.

#### Tuna Ship stream (big × known)
> Budget: half a day.

1. **Changelog entry** — journey-structured, not feature-listed.
2. **Update doc pages** the change affects.
3. **Release notes** — short, audience-appropriate (users, not engineers).
4. **Commit / PR** with full context and the brief linked.
5. **Announce** where appropriate (changelog feed, release Slack channel, email).
6. **[Trust receipt](#trust-receipt).**
7. **Close:** handoff to next Explore if applicable; otherwise terminal.

#### Salmon Ship stream (small × unknown)
> Budget: 1–2 days, partly spread over a measurement window.

1. **Release with instrumentation confirmed live.**
2. **Baseline measurement** — capture the metric values before traffic.
3. **[Effectiveness / Efficiency / Satisfaction](#effectiveness-efficiency-satisfaction)** (Saffer's ISO 9241 triad) check after 1–2 weeks.
4. **Write the learning log** — what did the measurement reveal? What surprised us?
5. **[Trust receipt](#trust-receipt).**
6. **Iteration loop decision** — do we queue a next loop, or is this closed? Most Salmons queue one.
7. **Close:** handoff (most commonly back to Explore).

#### Willie Ship stream (big × unknown)
> Budget: multi-week; partial at each staged rollout.

1. **Staged rollout** — internal → alpha → beta → GA. Each stage has its own mini-Ship.
2. **Per-stage measurement** — compare against the plan from Solidify.
3. **Narrate per stage** — short release note per stage, not just at GA.
4. **[Retrospective](#retrospective)** after GA — what happened? What do we run differently next Willie?
5. **[Trust receipt](#trust-receipt)** per stage; master trust receipt at GA.
6. **Hand to next-loop Explore** — Willies almost always loop. Capture the next-loop questions while fresh.
7. **Close:** handoff to Explore.

### Artifacts

- Release notes / changelog / commit.
- Trust receipt.
- Learning log (Salmon, Willie).
- Measurement readouts (Salmon, Willie).
- Retrospective (Willie).

### Exit criteria

- Work is available to its audience.
- Trust receipt emitted.
- At least one learning captured for the next loop.

### Anti-patterns

- **Release with no narrative.** Commit messages that say "fixes" or "update."
- **Skipping the trust receipt.** Even solo. It's 30 seconds; it becomes gold in V1 multiplayer.
- **No measurement on a Salmon or Willie.** You'll never learn; you'll argue.
- **Paper-over the Builder's bugs.** If the Builder's output has a bug, hand back to Builder. Don't fix it in the release.

### Human-AI collaboration notes

- **AI is strong at:** release-note drafting, commit-message generation, changelog summarization, trust-receipt assembly, surfacing measurement deltas.
- **AI is weak at:** deciding the release cadence, deciding which audiences to announce to, judging whether a Willie has truly "shipped" vs. needs another stage.
- **Human stays in charge of:** the merge / push / publish moment; the "is this really ready?" call.

---

## Method catalog

Every method the FISH agents may reference. Grouped by purpose, tagged with applicable phase(s). Anchors match §Streams above.

### Research methods

<a id="user-interviews"></a>**User interviews** — 1:1 semi-structured conversations with target users. Phase: **Explore**.
*When to use:* Salmon, Willie. Optional but light on Tuna; skip on Nemo.

<a id="tzumi"></a>**TZUMI (צומ"י)** — Tal's three-phase research cadence: *Go-Learn* (exploratory interviews) → *One-User* (validate one insight with one user) → *Hand-in-Hand* (shadow or pair with a user in their actual workflow). Phase: **Explore**, sometimes **Solidify**.
*When to use:* Salmon (standard), Willie (multi-cohort). Skip on Nemo.

<a id="contextual-inquiry"></a>**Contextual inquiry** — joint designer + developer observation of users in their real work environment. Phase: **Explore**.
*When to use:* Willie; tools where the user's environment matters (dev tools, operator UIs).

<a id="nugget-board"></a>**Nugget board** (Tomer Sharon) — capturing research findings as atomic, context-tagged "nuggets" rather than long reports. Phase: **Explore**, carries into **Solidify**.
*When to use:* Salmon, Willie. Turns interview tape into something the team can actually query later.

<a id="qualitative-research"></a>**Qualitative research** — depth-interview / observation / diary methods that surface motivations, thoughts, feelings. Phase: **Explore**.

<a id="quantitative-research"></a>**Quantitative research** — counts, durations, error rates, funnel conversion. Phase: **Explore** (baseline), **Ship** (outcome).
*When to use:* Salmon (measurement), Willie (both explore + outcome).

<a id="heuristic-evaluation"></a>**Heuristic evaluation** (Nielsen) — expert audit of a UI against usability heuristics; a lightweight substitute for live user research. Phase: **Explore**, **Ship** (validation).
*When to use:* Nemo's entire Explore; Tuna's Explore as a convention check.

<a id="competitor-scan"></a>**Competitor / pattern scan** — survey of parallel interfaces to find threads into the solution. Phase: **Explore**.
*When to use:* every archetype; depth varies from 2 min (Nemo) to a week (Willie).

<a id="premortem"></a>**Premortem** — imagine the project shipped and failed; ask the team what went wrong. Invert to surface risks. Phase: **Explore**.
*When to use:* Willie (standard); Tuna (optional, when the convention has non-obvious risks).

### Framing & modeling

<a id="personas"></a>**Personas** (Alan Cooper) — archetypal users built from research to anchor empathetic decisions. Phase: **Solidify** (mostly), created in **Explore**.

<a id="goal-directed-design"></a>**Goal-Directed Design** (Cooper) — organizes personas and design around *End*, *Experience*, and *Life* goals. Phase: **Explore**, **Solidify**.
*When to use:* Willie; Salmon if the work touches long-term user outcomes.

<a id="jtbd"></a>**Jobs To Be Done** (Christensen) — frame product around the functional / emotional / social job a user hires it for. Phase: **Explore**, **Solidify**.

<a id="osd"></a>**OSD — Operational Sequence Diagram** — swim-lane map of a user journey across stakeholders and time. Phase: **Explore**, **Solidify**.
*When to use:* Tuna (standard), Willie (standard), Salmon (when the flow crosses systems).

<a id="journey-mapping"></a>**Journey mapping** — visualize a persona's end-to-end path across touchpoints. Phase: **Explore**, **Solidify**.
*When to use:* every archetype except Nemo; depth scales with archetype.

<a id="scenario-planning"></a>**Scenario planning** — map "what if" branches off the happy path. Phase: **Explore**, **Solidify**.

<a id="problem-decomposition"></a>**Problem simplification / decomposition** — reduce a multi-dimensional problem to a smaller solvable version. Phase: **Explore**, **Solidify**.

<a id="spectrum-mapping"></a>**Axes / spectrum mapping** — place candidate solutions on tradeoff axes (flexibility ↔ usability, cost ↔ speed). Phase: **Solidify**.

### Ideation

<a id="hmw"></a>**How Might We (HMW)** — reframe a problem as an open "how might we…" prompt to unlock solutioning. Phase: **Explore** (framing), **Solidify** (entering).
*When to use:* every archetype. Nemos use it as their *whole* framing.

<a id="design-sprint"></a>**Design Sprint** (GV) — time-boxed 5-day cycle: understand → sketch → decide → prototype → test. Phase: spans **Explore → Solidify → Build**.
*When to use:* Nemo (collapsed to ½ day) or Tuna (standard).

<a id="crazy-8s"></a>**Crazy 8s / sketching rounds** — timed 8-sketches-in-8-minutes ideation. Phase: **Solidify**.
*When to use:* Tuna, Salmon when divergence on shape is needed.

<a id="whiteboard-session"></a>**Whiteboard session** — collaborative live exploration of a UX challenge. Phase: **Explore**, **Solidify**.

<a id="symmetry-pattern"></a>**Symmetry / pattern recognition** — use parallel interfaces already in the world as ideation seeds. Phase: **Solidify**.

### Prototyping & interaction

<a id="iterative-prototyping"></a>**Iterative prototyping** (Cooper) — progressive prototype refinement as backbone of design-dev collaboration. Phase: **Solidify**, **Build**.

<a id="microinteractions"></a>**Microinteractions** (Saffer) — four-part structure: *Triggers → Rules → Feedback → Loops/Modes*. Phase: **Solidify**, **Build**.
*When to use:* every archetype where the card touches a discrete interaction; scales in depth.

<a id="htd"></a>**Hierarchical Task Analysis (HTA)** — decompose tasks into sub-goals. Phase: **Solidify**, **Build**.
*When to use:* Tuna, Salmon, Willie.

<a id="mental-model-gap"></a>**Mental vs. conceptual model gap** — design to close the delta between user expectation and system behavior. Phase: **Solidify**, **Build**.

<a id="motion-principles"></a>**Motion principles** — 100–500ms, easing curves, restraint. Phase: **Build**.

<a id="component-library-strategy"></a>**Component library strategy** — joint designer+dev selection of a library (Material, MUI, Radix, Ant) as shared substrate. Phase: **Solidify**, **Build**.

<a id="shared-tool-workflow"></a>**Shared-tool workflow (Figma / Storybook / Zeplin)** — equal-access tooling for design and dev. Phase: **Solidify**, **Build**.

<a id="joint-product-reviews"></a>**Joint product reviews** — designer + dev + PM co-review competitors and in-progress work. Phase: **Solidify**, **Build**.

<a id="integrated-requirements"></a>**Integrated requirements process** — devs involved from spec through conceptual model, not post-design. Phase: **Solidify**, **Build**.

### Validation & evaluation

<a id="concept-testing"></a>**Concept testing** — test a low-fidelity concept with users before committing to build. Phase: **Solidify**.
*When to use:* Salmon (standard), Willie (standard, multiple concepts).

<a id="usability-testing"></a>**Usability testing** — observe users completing tasks on the built or near-built artifact. Phase: **Build**, **Ship**.

<a id="acceptance-criteria"></a>**Acceptance criteria** — bulleted, independently checkable list describing when the card is "done". Phase: **Solidify**.
*When to use:* every archetype; scope varies.

<a id="effectiveness-efficiency-satisfaction"></a>**Effectiveness / Efficiency / Satisfaction (ISO 9241)** — Saffer's rubric for shipped microinteractions. Phase: **Ship**.
*When to use:* Salmon (standard), Willie (standard).

<a id="hicks-law"></a>**Hick's Law** — more on-screen options → longer response time. Phase: **Solidify**, **Build**, **Ship** (as an evaluation heuristic).

<a id="recognition-over-recall"></a>**Recognition over recall** — users identify familiar cues faster than they retrieve from memory. Phase: **Solidify**, **Build**.

### Release & narrative

<a id="brief-not-prd"></a>**Brief (not PRD)** — short, journey-structured document replacing the long PRD. Sections: Problem / Journey / Shape / Acceptance criteria / Deferred. Phase: **Solidify**.

<a id="rfc-pitch"></a>**Pitch / RFC** — longer shape doc for Willies; journey-structured, with tradeoffs, alternatives, and decision log. Phase: **Solidify**.

<a id="journey-meetings"></a>**Journey meetings** — decision forums organized around a user journey, not a feature list. Phase: **Solidify**, **Ship**.

<a id="design-system-extension"></a>**Design-system extension** — add or extend components in the shared design system; justify any new primitive. Phase: **Solidify**, **Build**.

<a id="storyboarding"></a>**Storyboarding** — sequential frames of the user's experience; bridge between journey map and UI. Phase: **Solidify**.

<a id="trust-receipt"></a>**Trust receipt** — signed summary of what shipped, what was redacted, who approved it. Phase: **Ship**. Emitted by Duble Slash's Shipper agent.

<a id="retrospective"></a>**Retrospective** — post-ship review: what happened, what to run differently next time. Phase: **Ship**.
*When to use:* Willie (standard); Salmon (when a loop closes); skip Nemo unless a pattern is emerging.

---

## Cross-references

- Main spec → [`README.md`](./README.md)
- Transitions & handoff contract → [`transitions-and-handoffs.md`](./transitions-and-handoffs.md)
- Why this matters for AI-assisted work → [`human-ai-collaboration.md`](./human-ai-collaboration.md)
- Worked examples per archetype → [`use-cases.md`](./use-cases.md)
- Agent specs that operationalize these streams → [`../local-agents/`](../local-agents/)
