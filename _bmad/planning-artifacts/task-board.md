---
name: Duble Slash — Task Board
description: Monday-style single-file task board. Groups (lists), owners, statuses, priorities, and due targets. Mirrors GitHub where applicable.
type: planning-artifact
---

# Duble Slash — Task Board

**Last updated:** 2026-04-21 · **Owner:** Tal + Shenhav · **Source of truth:** this file.
Mirrors [GitHub repo](https://github.com/talsolomon/DubleSlash) issues/commits where applicable.

**Legend** — Status: 📋 Todo · 🔄 In Progress · 🟡 Blocked · 🔍 Review · ✅ Done · ❄️ Parked
**Priority:** P0 (this week) · P1 (this sprint) · P2 (backlog)

---

## 🎯 Objectives & KPIs

**North star (Milestone 1 — OSS Launch, measured 30 days post-launch):**

| # | Metric | Target | Signal |
|---|---|---|---|
| M1 | GitHub stars | ≥ 1,000 | GitHub API |
| M2 | Opt-in install counter | ≥ 200 (~600 actual @ 30% opt-in) | PostHog OSS |
| M3 | Capture reliability (3 tools × 10 session types) | ≥ 90% | Internal test matrix |
| M4 | Security / privacy backlash incidents | 0 | Social + inbox monitoring |
| M5 | LLM lab partnership convos opened (Anthropic priority) | ≥ 1 | Founder outreach log |
| M6 | HN / Twitter front-page moment | ≥ 1 thread, 100+ engagements | Social monitoring |
| M7 | Non-founder PRs merged to OSS repo | ≥ 10 | GitHub |
| M8 | Crash-free session rate | ≥ 99% | Sentry OSS (opt-in subset) |
| M9 | Time-to-first-capture (moderated usability, n=5) | ≤ 5 minutes | Moderated usability |

**V1 targets (Milestone 2, ~4–5 months post-OSS-launch):** 5k+ GitHub stars · 1k+ WAU · first paying team · end-to-end killer demo recorded + posted · ≥10 documented self-host deployments.

---

## 🔥 Tal — This Week (focus strip)

Cross-group focus view. Filter: Owner = Tal AND (Priority = P0 OR Status = 🔄).

**Direction (2026-04-21):** FISH-first. The methodology + the agents that enact it are the critical path — capture, redaction, platform, and marketing all derive from them. PRD rewrite demoted to P1 (depends on FISH-001). See [brainstorm-mvp-post-reframe.md](./brainstorm-mvp-post-reframe.md) for the reframe context.

| ID | Task | Group | Status | Priority | Due |
|---|---|---|---|---|---|
| FISH-001 | Write FISH methodology spec + restructure into `_bmad/methodology/` | Methodology | 🔍 Review | P0 | 2026-04-28 |
| FISH-002 | Define FISH agent roster (phase → agent + handoff contract) | Methodology | 🔍 Review | P0 | 2026-05-05 |
| FISH-003 | Spec the `//` install bundle | Methodology | 📋 Todo | P0 | 2026-05-12 |
| MKT-001 | Draft Israeli design-leader outreach list (Tali Lavie / Aviran Revah / Ido Zaifman + 20 more) | Marketing | 📋 Todo | P0 | 2026-04-28 |

---

## 📣 Marketing & Outreach

Outbound to design leaders, communities, and events. Gated items marked.

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| MKT-001 | Build outreach list of Israeli design leaders to demo Duble Slash | Tal | 📋 Todo | P0 | 2026-04-28 | Seed: **Tali Lavie** (Gong), **Aviran Revah** (Atera), **Ido Zaifman** (Studio Kido). Target: 20–30 names total. Capture role, company, cluster, last touch. |
| MKT-002 | Post in WhatsApp group of design leaders | Tal | 🟡 Blocked | P1 | TBD | **Blocked on:** website ready (DES-001) + manifesto (PRD-002). Single post; don't burn the channel. |
| MKT-003 | Post in Facebook design groups + student communities | Tal | 🟡 Blocked | P1 | TBD | **Blocked on:** DES-001 + PRD-002. Draft separate copy per audience (leaders vs. students). |
| MKT-004 | Map TLV + Herzliya startups by proximity → schedule one day per cluster | Tal | 📋 Todo | P1 | 2026-05-05 | Clusters to map: **מתחם אלון** (TLV), **Sarona** (TLV), Rothschild, Ramat HaHayal, Herzliya Pituach. Output: cluster → companies → design leads → target day. |
| MKT-005 | Book demo days per cluster (batch 4–6 meetings/day) | Tal | ❄️ Parked | P2 | after MKT-001 + MKT-004 | Parked until list + map exist. |
| MKT-006 | Outreach log template (name, co., cluster, status, last touch, next step) | Tal | 📋 Todo | P2 | 2026-05-01 | Small sheet or markdown table. Feeds M5 (lab convos) and general pipeline tracking. |

---

## 🏗 Product / PRD

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| PRD-001 | Re-write PRD around **Context Cloud** framing | Tal | 📋 Todo | P1 | 2026-05-19 | **Demoted from P0 to P1 on 2026-04-21.** Blocked-adjacent on FISH-001 — can't rewrite the PRD around Context Cloud until FISH is specified, because FISH is what the Context Cloud organizes. Supersedes current [prd-duble-slash-oss-launch.md](./prd-duble-slash-oss-launch.md)? TBD whether rewrite vs. layer. |
| PRD-002 | Write Duble Slash manifesto (Lean Startup-style) | Tal | 📋 Todo | P1 | 2026-05-05 | Pillars: test-oriented, experimental, community-connected. Gating dependency for MKT-002 + MKT-003. Save as `_bmad/planning-artifacts/manifesto-duble-slash.md`. |
| PRD-003 | Reconcile manifesto + new Context Cloud PRD with existing brief + pitch deck | Tal | 📋 Todo | P2 | after PRD-001 | Detect contradictions; update brief if superseded. |

---

## 🛠 Dev / Security

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| SEC-001 | Recruit technical advisor for vulnerability review | Tal | 📋 Todo | P1 | 2026-05-12 | Scope: browser extension + macOS AX capture paths. Pre-OSS-launch audit = risk mitigator for M4 (zero backlash incidents). |
| SEC-002 | Define security review SOW once advisor onboarded | Shenhav + advisor | ❄️ Parked | P2 | after SEC-001 | Threat model, scope, deliverable format. |

---

## 🎨 Design / Web

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| DES-001 | Build public website with hero animation | Shenhav | 🔄 In Progress | P0 | 2026-05-05 | Concept: [website-hero-concept.md](./website-hero-concept.md). Latest commit: `c34c4e4` (redesigned hero: larger stage, refined menubar icon, quicklook tail). Gating dependency for MKT-002 + MKT-003. |
| DES-002 | Performance pass on hero animation (Lottie/Rive, not video; LCP on headline) | Shenhav | 📋 Todo | P1 | with DES-001 | Per concept doc line 143. |

---

## 🔬 Methodology (FISH) — critical path

Per the 2026-04-21 reframe, FISH is the product's soul and the OSS drop. This group is now P0-heavy and sequenced: methodology → agents → install bundle.

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| FISH-001 | Write FISH methodology spec + restructure into `_bmad/methodology/` | Tal | 🔍 Review | P0 | 2026-04-28 | **Full restructure landed 2026-04-21.** New folder: [`_bmad/methodology/`](../methodology/) with three streams — [`fish/`](../methodology/fish/) (spec), [`local-agents/`](../methodology/local-agents/) (`//` personas for the OSS drop), [`system-agents/`](../methodology/system-agents/) (Context Cloud workers). FISH spec now covers: phases as fish anatomy (head / left body / right body / tail), axes, archetypes (Nemo/Tuna/Salmon/Willie), archetype × phase matrix, per-archetype streams with step-by-step method choices, 50+ method catalog sourced from talsolomonux.com, worked use-cases per archetype, `<FISH-handoff>` contract, and a dedicated doc on human-AI collaboration (the moat). Supersedes the deleted `methodology-fish-v2.md`. Source: https://www.talsolomonux.com/p/0d2. |
| FISH-002 | Define FISH agent roster — phase → agent mapping + handoff contract | Tal | 🔍 Review | P0 | 2026-05-05 | **Landed with FISH-001 restructure 2026-04-21.** Local-agent roster: [`local-agents/`](../methodology/local-agents/) — one README (universal contract) + four per-agent specs ([`explorer.md`](../methodology/local-agents/explorer.md), [`solidifier.md`](../methodology/local-agents/solidifier.md), [`builder.md`](../methodology/local-agents/builder.md), [`shipper.md`](../methodology/local-agents/shipper.md)). System-agent roster (9 platform agents from the brief): [`system-agents/README.md`](../methodology/system-agents/README.md). Supersedes the deleted `fish-agent-roster.md`. This IS the OSS drop — the thing users install. |
| FISH-003 | Spec the `//` install bundle for Claude Desktop / Cursor / ChatGPT Desktop | Tal | 📋 Todo | P0 | 2026-05-12 | Per-tool install plumbing — Claude (`CLAUDE.md`), Cursor (`.cursorrules`), ChatGPT Desktop (Custom Instructions). See [tech-research: capture invocation](../docs/technical-research-duble-slash-stack.md). Depends on FISH-002. |
| FISH-004 | Map FISH stages → `flow.yaml` spec (v2 milestone) | Tal | ❄️ Parked | P2 | post FISH-001 | Required attributes per card; phase transitions. Formerly FISH-002 — renumbered 2026-04-21. |

---

## ⚙️ Ops / Research

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| OPS-001 | Keep this board synced with GitHub activity + weekly status | Claude (John) | 🔄 In Progress | P1 | recurring | Update on request or at sprint checkpoints. See "GitHub Sync" below. |
| OPS-002 | Weekly KPI snapshot vs. M1–M9 (once OSS launches) | Tal | ❄️ Parked | P2 | post-launch | Measurement starts day of OSS launch. |

---

## 🔗 GitHub Sync

**Repo:** [talsolomon/DubleSlash](https://github.com/talsolomon/DubleSlash) · **Issues open:** 0 · **Branch:** main

**Recent commits (context for this board):**
- `ab0693f` — Rename DoubleSlash to DubleSlash across the repo
- `5447b8a` — Add FISH methodology, Supabase task board, finish Double Slash rename
- `c34c4e4` — Redesign website hero: larger stage, refined menubar icon, quicklook tail *(feeds DES-001)*
- `f3c9448` — Merge #1 from import/collab-workspace
- `2a6cda7` — Add Trace planning artifacts, BMAD docs, and website
- `bb9b228` — Initial commit

**Sync protocol:**
- When a task gets a GitHub issue, add `gh#<N>` to the Notes column.
- When a commit moves a task forward, add commit SHA + one-line summary to Notes.
- When status changes, update both the group table and (if relevant) the "Tal — This Week" strip.
- Ask Claude to refresh via: *"John, refresh the task board against recent commits/issues."*

---

## 📝 Update log

- **2026-04-21** — Board created. Captured 8 initial tasks from Tal's brief. KPIs pulled verbatim from pitch-deck appendix (M1–M9 + V1 targets). Gating deps identified: MKT-002/003 blocked on DES-001 + PRD-002.
- **2026-04-21 (later)** — **FISH-first reprioritization.** Tal reframed the MVP: OSS = FISH agents (free, drop-into-any-AI-tool); Platform = hosted memory layer. FISH is now the product's soul and the critical path. Changes: FISH-001 promoted P1→P0 (retitled, due moved up to 2026-04-28). FISH-002 (agent roster) and FISH-003 (install bundle) added as P0. Old FISH-002 (flow.yaml) renumbered FISH-004, stays parked. PRD-001 demoted P0→P1 (blocked-adjacent on FISH-001). Focus strip rewritten. Context: [brainstorm-mvp-post-reframe.md](./brainstorm-mvp-post-reframe.md).
- **2026-04-21 (evening)** — **FISH-002 v0 draft landed ahead of FISH-001.** [fish-agent-roster.md](./fish-agent-roster.md) spikes four phase agents (Explorer/Solidifier/Builder/Shipper), a universal `<FISH-handoff>` block, axis-modulation rules, and install-bundle mechanics for Claude Desktop / Cursor / ChatGPT Desktop. Flagged as provisional — phase names, axis semantics, and transition gates lock after FISH-001. Status FISH-002: 📋 → 🔄.
- **2026-04-21 (night)** — **FISH-001 v2.0 draft landed.** [methodology-fish-v2.md](./methodology-fish-v2.md) locks the spec: four phases as fish anatomy (Explore / Solidify / Build / Ship), four archetypes from the v1 article (Nemo / Tuna / Salmon / Willie) derived mechanically from the sigil, an archetype × phase intensity matrix, transition gates with entry/exit artifacts, and minimum artifact set (card, brief-not-PRD, trust receipt, handoff). Reconciles v1 (species as project types) with the agent-roster spike (anatomy as lifecycle). Roster doc (FISH-002) updated to defer to v2 on all locked semantics. Status FISH-001: 📋 → 🔍 Review (awaiting Tal sign-off, then close). Unblocks FISH-003 and PRD-001.
- **2026-04-21 (late night)** — **Methodology restructured into `_bmad/methodology/`.** Tal's feedback: drill deeper (moat), split into streams, fix anatomy (head / left body / right body / tail — not upper/lower), state concrete steps per archetype stream, and add an explicit human-AI collaboration doc. New structure: [`_bmad/methodology/`](../methodology/) holding three subfolders — [`fish/`](../methodology/fish/) (5 docs: spec, phases+methods, human-AI moat, use-cases, transitions+handoffs), [`local-agents/`](../methodology/local-agents/) (README + 4 agent specs — the OSS drop), [`system-agents/`](../methodology/system-agents/) (README covering all 9 platform agents from the brief). 54 methods catalogued from the talsolomonux.com blog. Old single-file drafts (`methodology-fish-v2.md`, `fish-agent-roster.md`) deleted per "don't keep old versions." Both FISH-001 and FISH-002 stay in 🔍 Review until Tal signs off on the deeper pass. **Note:** Supabase SQL files (`supabase/*.sql`) retain the old filenames as historical patch data; the markdown task-board is the current source of truth.
