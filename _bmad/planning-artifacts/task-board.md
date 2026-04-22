---
name: Duble Slash — Task Board
description: Monday-style single-file task board. Groups (lists), owners, statuses, priorities, and due targets. Mirrors GitHub where applicable.
type: planning-artifact
---

# Duble Slash — Task Board

**Last updated:** 2026-04-22 · **Owner:** Tal + Shenhav · **Source of truth:** this file.
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

**Direction (2026-04-22):** FISH-first, Jobs-shaped install. The methodology + the agents that enact it are the critical path. FISH-003 scope now: one `npx` command → menu-bar `//` icon live in ≤20s. Four P0 blockers on FISH-003 must land first (architecture decision, tech research, Apple Developer account, install-bundle content). See [brief-install-experience.md](./briefs/brief-install-experience.md) and [brainstorm-mvp-post-reframe.md](./brainstorms/brainstorm-mvp-post-reframe.md).

| ID | Task | Group | Status | Priority | Due |
|---|---|---|---|---|---|
| OPS-003 | Apple Developer account + macOS notarization pipeline | Ops | 📋 Todo | P0 | 2026-04-29 |
| FISH-007 | Architecture decision: Claude Agent SDK + LangGraph + MCP | Methodology | 📋 Todo | P0 | 2026-04-29 |
| OPS-004 | Tech research: `AGENTS.md` merge · ChatGPT Desktop install · Windows signing | Ops | 📋 Todo | P0 | 2026-04-29 |
| FISH-008 | Write install-bundle content (`AGENTS.md` / `CLAUDE.md` / `fish.mdc`) | Methodology | 📋 Todo | P0 | 2026-05-05 |
| FISH-003 | Build the one-command install + macOS menu-bar client | Methodology | 📋 Todo | P0 | 2026-05-12 |
| MKT-001 | Draft Israeli design-leader outreach list (Tali Lavie / Aviran Revah / Ido Zaifman + 20 more) | Marketing | 📋 Todo | P0 | 2026-04-28 |

Recently closed: FISH-001 + FISH-002 (both ✅ Done 2026-04-21 late — see Methodology group below).

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
| MKT-007 | Reframe positioning to **"methodology layer for AI-assisted product work"** across website, docs, pitch deck | Tal + Shenhav | 📋 Todo | P1 | 2026-05-12 | **Added 2026-04-22** from [market-research-agent-frameworks.md](../docs/market-research-agent-frameworks.md) §9 rec 1. The "capture layer" and "collab layer" framings are increasingly claimed by competitors; "methodology layer" is the empty slot. Updates: hero copy, pitch-deck cover, brief preface, PRD header. |
| MKT-008 | Build **BMAD-vs-FISH** comparison page for OSS launch | Tal | 📋 Todo | P1 | before OSS launch | **Added 2026-04-22** from market research. BMAD is our real Category C competitor and has a 6-month head start. Three diffs to memorize: (a) designer-led not engineer-led, (b) cross-tool not IDE-locked, (c) axis modulation + archetypes + reverse-flow handoffs. Lives at `methodology/vs-bmad.md` or on the website. |
| MKT-009 | Execute OSS launch marketing plan — threads, blogs, PH, HN, LinkedIn | Tal + Shenhav | 📋 Todo | P0 | 2026-05-15 | **Added 2026-04-22 (evening)** via Mary + 4 expert lenses (`@gtm` / `@product-marketing` / `@content-marketing` / `@social`). Brief: [brief-oss-launch-marketing.md](./briefs/brief-oss-launch-marketing.md). Positioning = "the AI cloud for AI projects" · FISH as moat · 13 open agents / closed cloud · Linear-style + GitHub-style UIs give FISH a visible face. Tier-0 channels: Show HN + X thread. Tier-1: PH + LinkedIn. 7-post blog calendar (D-3 → D+30). Launch-day thread (8 tweets) + LinkedIn post + 4 drip hooks drafted. Five open questions to resolve before PM/John takes it into a PRD (see brief §10). |

---

## 🏗 Product / PRD

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| PRD-001 | Re-write PRD around **Context Cloud** framing | Tal | 📋 Todo | P1 | 2026-05-19 | **Demoted from P0 to P1 on 2026-04-21.** Unblocked 2026-04-21 (late) — FISH-001 done. Supersedes current [prd-duble-slash-oss-launch.md](./prd/prd-duble-slash-oss-launch.md)? TBD whether rewrite vs. layer — decide in Solidify. |
| PRD-002 | Write Duble Slash manifesto (Lean Startup-style) | Tal | 📋 Todo | P1 | 2026-05-05 | Pillars: test-oriented, experimental, community-connected. Gating dependency for MKT-002 + MKT-003. Save as `_bmad/planning-artifacts/company/manifesto-duble-slash.md`. |
| PRD-003 | Reconcile manifesto + new Context Cloud PRD with existing brief + pitch deck | Tal | 📋 Todo | P2 | after PRD-001 | Detect contradictions; update brief if superseded. |
| PRD-004 | Revise company values — current draft is unsatisfactory | Tal | 📋 Todo | P1 | before PRD-002 | Draft saved to [company-values.md](./company/company-values.md). Tal flagged on 2026-04-21: values sound like product lines, not beliefs. Five values currently; "creativity is the only prerequisite" slot dropped, may need replacement. Session history + rejected framings in [brainstorm-company-values.md](./brainstorms/brainstorm-company-values.md). Feeds into PRD-002 (manifesto). |

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
| DES-001 | Build public website with hero animation | Shenhav | 🔄 In Progress | P0 | 2026-05-05 | Concept: [website-hero-concept.md](./ux/website-hero-concept.md). Latest commit: `c34c4e4` (redesigned hero: larger stage, refined menubar icon, quicklook tail). Gating dependency for MKT-002 + MKT-003. |
| DES-002 | Performance pass on hero animation (Lottie/Rive, not video; LCP on headline) | Shenhav | 📋 Todo | P1 | with DES-001 | Per concept doc line 143. |
| DES-003 | Replace website hero CTA with the one-liner install command (copy button) | Shenhav | 📋 Todo | P1 | after DES-001 | **Added 2026-04-22** per [brief-install-experience.md](./briefs/brief-install-experience.md). The install command IS the demo. Single copy button, one line: `npx @dubleslash/install`. No signup, no "learn more" — the thing they copy literally installs the product. |

---

## 🔬 Methodology (FISH) — critical path

Per the 2026-04-21 reframe, FISH is the product's soul and the OSS drop. This group is now P0-heavy and sequenced: methodology → agents → install bundle.

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| FISH-001 | Write FISH methodology spec + restructure into `methodology/` | Tal | ✅ Done | P0 | 2026-04-28 | **Closed 2026-04-21 (late).** Delivered as multi-file spec under [`methodology/fish/`](../../methodology/fish/) (README, phases-and-methods, transitions-and-handoffs, human-ai-collaboration, use-cases). Covers phases as fish anatomy (head / left / right / tail), axes (size × certainty), archetypes (Nemo/Tuna/Salmon/Willie), archetype × phase matrix, per-archetype streams, 50+ method catalog, `<FISH-handoff>` contract. Exceeds spec with worked use-cases + the human-AI collaboration doc (the moat). Source: https://www.talsolomonux.com/p/0d2. Unblocks FISH-003 + PRD-001. |
| FISH-002 | Define FISH agent roster — phase → agent mapping + handoff contract | Tal | ✅ Done | P0 | 2026-05-05 | **Closed 2026-04-21 (late).** Local-agent roster at [`local-agents/`](../../methodology/local-agents/) — README (universal contract) + [`explorer.md`](../../methodology/local-agents/explorer.md), [`solidifier.md`](../../methodology/local-agents/solidifier.md), [`builder.md`](../../methodology/local-agents/builder.md), [`shipper.md`](../../methodology/local-agents/shipper.md). Each agent: posture, per-phase rules, axis modulation, tools allowed/forbidden, inputs/outputs, anti-patterns, example moves. Bonus: [`system-agents/README.md`](../../methodology/system-agents/README.md) specs 9 Context Cloud workers. **This is the OSS drop.** FISH-003 now unblocked. |
| FISH-003 | Build the one-command install + macOS menu-bar client | Tal | 📋 Todo | P0 | 2026-05-12 | **Scope rewritten 2026-04-22** per [brief-install-experience.md](./briefs/brief-install-experience.md). North star: `npx @dubleslash/install` → `//` icon appears in menu bar in ≤20s, first `//explore` works on first try. Replaces per-tool paste plumbing. New deps: Apple Developer account + notarization, macOS desktop client scaffold, `AGENTS.md` merge logic, Tally runs inside the client from second one. See also [tech-research: capture invocation](../docs/technical-research-duble-slash-stack.md). Depends on FISH-002. |
| FISH-004 | Map FISH stages → `flow.yaml` spec (v2 milestone) | Tal | ❄️ Parked | P2 | post FISH-001 | Required attributes per card; phase transitions. Formerly FISH-002 — renumbered 2026-04-21. |
| FISH-005 | Apply BMAD teardown punch list to local-agent specs | Tal | 📋 Todo | P1 | 2026-05-19 | **Added 2026-04-22** from [bmad-teardown-for-our-agents.md](../docs/bmad-teardown-for-our-agents.md). Seven concrete edits: (1) universal on-activation step in [local-agents/README.md §2.1](../../methodology/local-agents/README.md); (2) Typical Tuna lifecycle worked example in README §6; (3) add `IR` capability to [solidifier.md §5](../../methodology/local-agents/solidifier.md); (4) add `CC` capability to solidifier.md §5; (5) add `UV report` template to [builder.md §8](../../methodology/local-agents/builder.md); (6) make `NL` non-optional in [shipper.md §5](../../methodology/local-agents/shipper.md); (7) update Gate in [system-agents/README.md](../../methodology/system-agents/README.md) to reference Sol's `IR`. Depends on FISH-006 decision. |
| FISH-006 | Decide `.fish/project-context.md` ownership — 5th `//` command, system agent, or installer step? | Tal | 📋 Todo | P1 | 2026-04-29 | **Added 2026-04-22.** Highest-leverage pattern from the BMAD teardown: every agent should load a shared project-context file on activation (tech stack, design system, user personas, active PRDs). Open design question — is it (a) a new `//context-init` command, (b) a system-agent responsibility (Pack?), or (c) a one-time step the installer runs? Blocks FISH-005. |
| FISH-007 | Architecture decision: Claude Agent SDK (local) + LangGraph (system) + MCP transport | Tal + Shenhav | 📋 Todo | P0 | 2026-04-29 | **Added 2026-04-22** from [market-research-agent-frameworks.md](../docs/market-research-agent-frameworks.md) §9 rec 4+5. Don't invent a new orchestration primitive. Claude Agent SDK gives native sub-agents + hooks for Nova/Sol/Bram/Sage; LangGraph gives production-grade state for Gate/Loom (V2). Every 2026 framework adopted MCP — our capture layer must speak it fluently. Blocks FISH-003 engineering. |
| FISH-008 | Write the install-bundle content: `AGENTS.md` · `CLAUDE.md` · `.cursor/rules/fish.mdc` | Tal | 📋 Todo | P0 | 2026-05-05 | **Added 2026-04-22** per [brief-install-experience.md](./briefs/brief-install-experience.md) §"What the command does" step 2. The engineering (FISH-003) writes these files to the right places; this task is the actual content — the methodology payload that makes `//explore` / `//solidify` / `//build` / `//ship` work. Can progress in parallel with FISH-003 engineering. |

---

## ⚙️ Ops / Research

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| OPS-001 | Keep this board synced with GitHub activity + weekly status | Claude (John) | 🔄 In Progress | P1 | recurring | Update on request or at sprint checkpoints. See "GitHub Sync" below. |
| OPS-002 | Weekly KPI snapshot vs. M1–M9 (once OSS launches) | Tal | ❄️ Parked | P2 | post-launch | Measurement starts day of OSS launch. |
| OPS-003 | Apple Developer account + macOS notarization pipeline | Tal | 📋 Todo | P0 | 2026-04-29 | **Added 2026-04-22.** Hard blocker on FISH-003. macOS Gatekeeper will block an unsigned desktop client. Apple Developer account ($99/yr) + certs + notarization workflow. Lead time is days, not hours — must start immediately. Also feeds potential App Store distribution later. |
| OPS-004 | Tech research: `AGENTS.md` merge strategy · ChatGPT Desktop install surface · Windows code signing | Shenhav | 📋 Todo | P0 | 2026-04-29 | **Added 2026-04-22** per [brief-install-experience.md](./briefs/brief-install-experience.md) open questions. Three investigations before FISH-003 engineering starts: (1) **AGENTS.md merge** when a repo already has one — proposed idempotent `## FISH` section with a marker; confirm; (2) **ChatGPT Desktop** has no official Custom Instructions install API — unofficial surface or one-line paste fallback?; (3) **Windows SmartScreen** code-signing process + cert cost for the v1 Windows tray client. Output: short memo per topic, add to `_bmad/docs/`. |

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
- **2026-04-21 (later)** — **FISH-first reprioritization.** Tal reframed the MVP: OSS = FISH agents (free, drop-into-any-AI-tool); Platform = hosted memory layer. FISH is now the product's soul and the critical path. Changes: FISH-001 promoted P1→P0 (retitled, due moved up to 2026-04-28). FISH-002 (agent roster) and FISH-003 (install bundle) added as P0. Old FISH-002 (flow.yaml) renumbered FISH-004, stays parked. PRD-001 demoted P0→P1 (blocked-adjacent on FISH-001). Focus strip rewritten. Context: [brainstorm-mvp-post-reframe.md](./brainstorms/brainstorm-mvp-post-reframe.md).
- **2026-04-21 (evening)** — **FISH-002 v0 draft landed ahead of FISH-001.** [fish-agent-roster.md](./fish-agent-roster.md) spikes four phase agents (Explorer/Solidifier/Builder/Shipper), a universal `<FISH-handoff>` block, axis-modulation rules, and install-bundle mechanics for Claude Desktop / Cursor / ChatGPT Desktop. Flagged as provisional — phase names, axis semantics, and transition gates lock after FISH-001. Status FISH-002: 📋 → 🔄.
- **2026-04-21 (night)** — **FISH-001 v2.0 draft landed.** [methodology-fish-v2.md](./methodology-fish-v2.md) locks the spec: four phases as fish anatomy (Explore / Solidify / Build / Ship), four archetypes from the v1 article (Nemo / Tuna / Salmon / Willie) derived mechanically from the sigil, an archetype × phase intensity matrix, transition gates with entry/exit artifacts, and minimum artifact set (card, brief-not-PRD, trust receipt, handoff). Reconciles v1 (species as project types) with the agent-roster spike (anatomy as lifecycle). Roster doc (FISH-002) updated to defer to v2 on all locked semantics. Status FISH-001: 📋 → 🔍 Review (awaiting Tal sign-off, then close). Unblocks FISH-003 and PRD-001.
- **2026-04-21 (late night)** — **Methodology restructured.** Tal's feedback: drill deeper (moat), split into streams, fix anatomy (head / left body / right body / tail — not upper/lower), state concrete steps per archetype stream, and add an explicit human-AI collaboration doc. New structure: [`methodology/`](../../methodology/) holding three subfolders — [`fish/`](../../methodology/fish/) (5 docs: spec, phases+methods, human-AI moat, use-cases, transitions+handoffs), [`local-agents/`](../../methodology/local-agents/) (README + 4 agent specs — the OSS drop), [`system-agents/`](../../methodology/system-agents/) (README covering all 9 platform agents from the brief). 54 methods catalogued from the talsolomonux.com blog. Old single-file drafts (`methodology-fish-v2.md`, `fish-agent-roster.md`) deleted per "don't keep old versions." Both FISH-001 and FISH-002 stay in 🔍 Review until Tal signs off on the deeper pass. **Note:** Supabase SQL files (`supabase/*.sql`) retain the old filenames as historical patch data; the markdown task-board is the current source of truth.
- **2026-04-22** — **Methodology + agents rehomed to repo root.** Moved [`methodology/`](../../methodology/) out of `_bmad/` to make it clear the methodology and its agents are the product itself — not a planning artifact. Updated all cross-references; supabase migrations retain historical paths as patch data.
- **2026-04-22 (afternoon)** — **Agent landscape research + BMAD teardown landed.** Two new docs in `_bmad/docs/`: [bmad-teardown-for-our-agents.md](../docs/bmad-teardown-for-our-agents.md) (7-item punch list to make Nova/Sol/Bram/Sage sharper — biggest gap is a universal project-context bootstrap), and [market-research-agent-frameworks.md](../docs/market-research-agent-frameworks.md) (Category A/B/C landscape: BMAD is our real competitor in C; `AGENTS.md`/`CLAUDE.md` are the 2026 install surface; Copilot Workspaces already ships phase-shaped agents — persona-per-phase is no longer our unique claim; moat is methodology + cross-tool capture). Direct implications: FISH-003 scope rewritten (see next entry).
- **2026-04-22 (afternoon)** — **FISH-003 scope rewritten per Jobs-shaped install direction.** Brief landed at [brief-install-experience.md](./briefs/brief-install-experience.md). Old scope (paste-per-tool) replaced by: one `npx` command → macOS menu-bar `//` icon live within 20 seconds → first `//explore` works first try. Menu-bar icon is the "it's alive" moment. Capture (Tally) rides the install — no second step. Reversible uninstall is a contract, not a nice-to-have. Rewrites the website hero CTA (the install command IS the demo).
- **2026-04-22 (evening)** — **Task sweep: 9 new tasks surfaced from this session's research + brief landed on the board.** Standing rule from Tal: document tasks the moment they emerge, don't wait to be asked. New tasks: **FISH-005** (apply BMAD punch list — 7 concrete edits to agent specs), **FISH-006** (decide `.fish/project-context.md` ownership — blocks FISH-005), **FISH-007** (architecture decision: Claude Agent SDK + LangGraph + MCP — blocks FISH-003 engineering), **FISH-008** (write install-bundle content — parallelizable with FISH-003), **OPS-003** (Apple Developer account + notarization — hard blocker on FISH-003, ~day lead time), **OPS-004** (tech research: AGENTS.md merge + ChatGPT Desktop install + Windows signing), **MKT-007** (reframe positioning to "methodology layer for AI-assisted product work"), **MKT-008** (BMAD-vs-FISH comparison page for OSS launch), **DES-003** (replace website hero CTA with one-liner install command). Focus strip rewritten — four new P0s now gate FISH-003. Dependencies explicit: FISH-006 → FISH-005; FISH-007 + OPS-003 + OPS-004 → FISH-003; FISH-008 parallel to FISH-003; DES-003 depends on DES-001 finishing first.
- **2026-04-21 (reconciled)** — **FISH-001 + FISH-002 → ✅ Done.** Audit against each task's acceptance criteria: FISH-001 demands (phases, axes, transitions, per-phase demands) all met and exceeded (use-cases + human-AI moat doc are bonuses). FISH-002 demands (phase→agent mapping, each agent's prompt/tools/handoff I/O) all met and exceeded (system-agents/README.md is a bonus). Supabase row status updated via [`supabase/2026-04-21-fish-reconciliation.sql`](../../supabase/2026-04-21-fish-reconciliation.sql). `PRD-001` note updated to reflect the unblock. **Next P0 for Tal: FISH-003** (`//` install bundle for Claude Desktop / Cursor / ChatGPT Desktop — the thing that turns the methodology + agents into something a user can actually install in 30 seconds).
- **2026-04-21 (values pass)** — **PRD-004 added.** Brainstorming session on company values produced a five-value draft saved to [company-values.md](./company/company-values.md) — Tal flagged the wording as unsatisfactory ("they sound like a product, not values") and parked revision for later. Full session history + rejected framings preserved in [brainstorm-company-values.md](./brainstorms/brainstorm-company-values.md). Gates PRD-002 (manifesto) since values should set the tone manifesto builds on.
