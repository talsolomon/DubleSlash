---
name: Duble Slash — Task Board
description: Monday-style single-file task board. Groups (lists), owners, statuses, priorities, and due targets. Mirrors GitHub where applicable.
type: planning-artifact
---

# Duble Slash — Task Board

**Last updated:** 2026-04-23 · **Owner:** Tal + Shenhav · **Source of truth:** this file.
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
| MKT-001 | Build outreach list of Israeli design leaders to demo Duble Slash | Tal | 🔄 In Progress | P0 | 2026-04-28 | Seed: **Tali Lavie** (Gong), **Aviran Revah** (Atera), **Ido Zaifman** (Studio Kido). Target: 20–30 names total. Capture role, company, cluster, last touch. **Progress 2026-04-21:** 39 design leaders imported from LinkedIn CSV via Outreach tab (commit `e6b7ad5`); employer corrections landed in `b84c785`. Next: enrich with cluster + next-step per contact. |
| MKT-002 | Post in WhatsApp group of design leaders | Tal | 🟡 Blocked | P1 | TBD | **Blocked on:** website ready (DES-001) + manifesto (PRD-002). Single post; don't burn the channel. |
| MKT-003 | Post in Facebook design groups + student communities | Tal | 🟡 Blocked | P1 | TBD | **Blocked on:** DES-001 + PRD-002. Draft separate copy per audience (leaders vs. students). |
| MKT-004 | Map TLV + Herzliya startups by proximity → schedule one day per cluster | Tal | 📋 Todo | P1 | 2026-05-05 | Clusters to map: **מתחם אלון** (TLV), **Sarona** (TLV), Rothschild, Ramat HaHayal, Herzliya Pituach. Output: cluster → companies → design leads → target day. |
| MKT-005 | Book demo days per cluster (batch 4–6 meetings/day) | Tal | ❄️ Parked | P2 | after MKT-001 + MKT-004 | Parked until list + map exist. |
| MKT-006 | Outreach log template (name, co., cluster, status, last touch, next step) | Tal | 📋 Todo | P2 | 2026-05-01 | Small sheet or markdown table. Feeds M5 (lab convos) and general pipeline tracking. |
| MKT-007 | Reframe positioning to **"methodology layer for AI-assisted product work"** across website, docs, pitch deck | Tal + Shenhav | 📋 Todo | P1 | 2026-05-12 | **Added 2026-04-22** from [market-research-agent-frameworks.md](../docs/market-research-agent-frameworks.md) §9 rec 1. The "capture layer" and "collab layer" framings are increasingly claimed by competitors; "methodology layer" is the empty slot. Updates: hero copy, pitch-deck cover, brief preface, PRD header. |
| MKT-008 | Build **BMAD-vs-FISH** comparison page for OSS launch | Tal | 📋 Todo | P1 | before OSS launch | **Added 2026-04-22** from market research. BMAD is our real Category C competitor and has a 6-month head start. Three diffs to memorize: (a) designer-led not engineer-led, (b) cross-tool not IDE-locked, (c) axis modulation + archetypes + reverse-flow handoffs. Lives at `methodology/vs-bmad.md` or on the website. |
| MKT-009 | Execute OSS launch marketing plan — threads, blogs, PH, HN, LinkedIn | Tal + Shenhav | 📋 Todo | P0 | 2026-05-15 | **Added 2026-04-22 (evening)** via Mary + 4 expert lenses (`@gtm` / `@product-marketing` / `@content-marketing` / `@social`). Brief: [brief-oss-launch-marketing.md](./briefs/brief-oss-launch-marketing.md). Positioning = "the AI cloud for AI projects" · FISH as moat · 13 open agents / closed cloud · Linear-style + GitHub-style UIs give FISH a visible face. Tier-0 channels: Show HN + X thread. Tier-1: PH + LinkedIn. 7-post blog calendar (D-3 → D+30). Launch-day thread (8 tweets) + LinkedIn post + 4 drip hooks drafted. Five open questions to resolve before PM/John takes it into a PRD (see brief §10). |
| MKT-010 | Resolve the 5 open questions in `brief-oss-launch-marketing.md` §10 | Tal | 📋 Todo | P0 | 2026-04-29 | **Added 2026-04-23** (full task-board sync). Gates MKT-009 PRD + MKT-011 calendar. Five decisions: (1) exact launch day, (2) founder-led vs. brand voice, (3) private-beta list, (4) Shenhav content scope, (5) PH/HN timing. Source: [brief-oss-launch-marketing.md](./briefs/brief-oss-launch-marketing.md) §10. |
| MKT-011 | Execute 7-post blog calendar (D-3 → D+30) — flagship co-author + Shenhav design-angle | Tal + Shenhav | 📋 Todo | P0 | 2026-05-15 | **Added 2026-04-23.** Sub-scope of MKT-009 split out because it's the largest execution chunk with its own cadence. 7 posts spread D-3 through D+30 around launch day. Co-author flagship piece with Shenhav; Shenhav writes a design-angle post. Depends on MKT-010 (launch day). Source: [brief-oss-launch-marketing.md](./briefs/brief-oss-launch-marketing.md) §8. |
| MKT-012 | Anthropic pre-launch outreach — timing, channel, who DMs first | Tal | 📋 Todo | P0 | 2026-05-12 | **Added 2026-04-23.** M5 is a success metric (≥1 lab conversation opened, Anthropic priority); the *mechanics* of outreach were never ticketed. Decide: DM vs. email, warm intro vs. cold, Tal vs. Shenhav voice, pre- or post-launch, what artifact to send (pitch deck vs. methodology doc vs. GitHub link). Source: [brief-collab-capture-layer.md](./briefs/brief-collab-capture-layer.md) §Open Questions + [prd-duble-slash-oss-launch.md](./prd/prd-duble-slash-oss-launch.md) §10. |

---

## 🏗 Product / PRD

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| PRD-001 | Re-write PRD around **Context Cloud** framing | Tal | 📋 Todo | P1 | 2026-05-19 | **Demoted from P0 to P1 on 2026-04-21.** Unblocked 2026-04-21 (late) — FISH-001 done. Supersedes current [prd-duble-slash-oss-launch.md](./prd/prd-duble-slash-oss-launch.md)? TBD whether rewrite vs. layer — decide in Solidify. |
| PRD-002 | Write Duble Slash manifesto (Lean Startup-style) | Tal | 📋 Todo | P1 | 2026-05-05 | Pillars: test-oriented, experimental, community-connected. Gating dependency for MKT-002 + MKT-003. Save as `_bmad/planning-artifacts/company/manifesto-duble-slash.md`. |
| PRD-003 | Reconcile manifesto + new Context Cloud PRD with existing brief + pitch deck | Tal | 📋 Todo | P2 | after PRD-001 | Detect contradictions; update brief if superseded. |
| PRD-004 | Revise company values — current draft is unsatisfactory | Tal | 📋 Todo | P1 | before PRD-002 | Draft saved to [company-values.md](./company/company-values.md). Tal flagged on 2026-04-21: values sound like product lines, not beliefs. Five values currently; "creativity is the only prerequisite" slot dropped, may need replacement. Session history + rejected framings in [brainstorm-company-values.md](./brainstorms/brainstorm-company-values.md). Feeds into PRD-002 (manifesto). |
| PRD-005 | Refine "Flows, not frames" value to carry the Hebrew משע, לא מסך punch | Tal | 📋 Todo | P2 | after PRD-004 | **Added 2026-04-23.** Sub-task of PRD-004 but tracked separately — it's a copy-craft problem (rhythm, shape) not a values-selection problem. Source: [company-values.md](./company/company-values.md) revision notes. |

---

## 🛠 Dev / Security

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| SEC-001 | Recruit technical advisor for vulnerability review | Tal | 📋 Todo | P1 | 2026-05-12 | Scope: browser extension + macOS AX capture paths. Pre-OSS-launch audit = risk mitigator for M4 (zero backlash incidents). |
| SEC-002 | Define security review SOW once advisor onboarded | Shenhav + advisor | ❄️ Parked | P2 | after SEC-001 | Threat model, scope, deliverable format. |
| PRD-006 | Draft `_bmad/docs/redaction-rules.md` — regex + heuristics for PII/secret redaction | Shenhav | 📋 Todo | P1 | 2026-05-12 | **Added 2026-04-23.** Redaction categories are in the PRD; the *patterns* (regex + heuristics) need a dev-handoff doc. Covers API keys, tokens, emails, names, addresses, CC-shaped strings, per-tool carve-outs. Precedes FISH-003 capture implementation. Co-owner: Tal for policy review. Source: [stories-duble-slash-oss-launch.md](../implementation-artifacts/stories-duble-slash-oss-launch.md) Story 4.3 AC-006 + [prd-duble-slash-oss-launch.md](./prd/prd-duble-slash-oss-launch.md) §10. |

---

## 🎨 Design / Web

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| DES-001 | Build public website with hero animation | Shenhav | 🔄 In Progress | P0 | 2026-05-05 | Concept: [website-hero-concept.md](./ux/website-hero-concept.md). Latest commit: `c34c4e4` (redesigned hero: larger stage, refined menubar icon, quicklook tail). Gating dependency for MKT-002 + MKT-003. |
| DES-002 | Performance pass on hero animation (Lottie/Rive, not video; LCP on headline) | Shenhav | 📋 Todo | P1 | with DES-001 | Per concept doc line 143. |
| DES-003 | Replace website hero CTA with the one-liner install command (copy button) | Shenhav | 📋 Todo | P1 | after DES-001 | **Added 2026-04-22** per [brief-install-experience.md](./briefs/brief-install-experience.md). The install command IS the demo. Single copy button, one line: `npx @dubleslash/install`. No signup, no "learn more" — the thing they copy literally installs the product. |
| DES-004 | Hi-fi mockups: Today view · first-run step 4 · Privacy dashboard · menubar popover | Shenhav | 📋 Todo | P0 | 2026-05-05 | **Added 2026-04-23.** Four critical GTM assets — "the Privacy dashboard IS the ad." Blocks DES-006 sign-off + the hero refresh (DES-003). Deliver as Figma frames exported to `website/assets/` for reuse in the landing page and launch thread. Source: [ux-design-duble-slash-oss-launch.md](./ux/ux-design-duble-slash-oss-launch.md) §Next steps. |
| DES-005 | Resolve 8 open design decisions before code | Shenhav | 📋 Todo | P1 | 2026-05-05 | **Added 2026-04-23.** Eight decisions needed before FISH-003 implementation: session auto-titling approach, dark vs. light default, redaction preview depth, agents disclosure surface, pause-all affordance, telemetry modal-vs-inline, + 2 more. Output: one-page decision log appended to the UX doc. Source: [ux-design-duble-slash-oss-launch.md](./ux/ux-design-duble-slash-oss-launch.md) §Design questions. |
| DES-006 | Shenhav sign-off on Privacy dashboard composition before launch | Shenhav | 📋 Todo | P0 | 2026-05-12 | **Added 2026-04-23.** Gates OSS-launch (MKT-009). Depends on DES-004 (mockups first). Review covers: composition, redaction-preview UX, pause-all affordance, accessibility contrast. Source: [stories-duble-slash-oss-launch.md](../implementation-artifacts/stories-duble-slash-oss-launch.md) Story 5.4 AC-006. |

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
| FISH-009 | Wire expert-shortcuts roster (`@handle`) into each local-agent spec | Tal | 📋 Todo | P1 | 2026-05-12 | **Added 2026-04-22 (daily audit)** from [local-agents/experts.md](../../methodology/local-agents/experts.md) and [brainstorm-expert-shortcuts.md](./brainstorms/brainstorm-expert-shortcuts.md). 136 loanable specialist personas across 18 categories exist as a doc, but Nova/Sol/Bram/Sage specs don't yet reference the grammar (`//build @be-dev`), the proactive-offer rules (2–3 experts per fresh card or topic shift), the one-turn loan semantics, or the team-custom `.experts/` extension point. Edits needed in [explorer.md](../../methodology/local-agents/explorer.md), [solidifier.md](../../methodology/local-agents/solidifier.md), [builder.md](../../methodology/local-agents/builder.md), [shipper.md](../../methodology/local-agents/shipper.md). Depends on FISH-005 (keep agent-spec edits coherent). |

---

## 🔬 Problem Validation — Research

Hypothesis set locked in [problem-hypotheses-and-themes.md](./research/problem-hypotheses-and-themes.md) (5 themes A–E, 12 hypotheses H1–H12). Interview pool lives in the Tasks app **Interviews tab** (DB-backed). Desk research has no scheduling dependency — runs in parallel.

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| RES-001 | Execute problem-validation user interviews (30-person pool, ≥25 completed) | Tal | 📋 Todo | P1 | 2026-05-20 | **Added 2026-04-22 (daily audit)** from [user-research-plan.md](./research/user-research-plan.md). Plan drafted, pool confirmation pending. Every interview → notes file using §5 template. Feeds RES-003 synthesis + deck copy. Stage tracking lives in Interviews tab of the Tasks app (source of truth), not a parallel spreadsheet. |
| RES-002 | Execute industry desk research (≥10 cited sources per theme) | Tal | 📋 Todo | P1 | 2026-05-05 | **Added 2026-04-22 (daily audit)** from [industry-research-plan.md](./research/industry-research-plan.md). **No scheduling dependency — start immediately.** Tier-1 sources + citation file tracking source → data point → theme. Corroborates interview findings with scale (esp. Theme E governance, where pool is design-heavy). |
| RES-003 | Synthesize per-theme findings — validate / modify / kill each of A–E; produce kill list | Tal | 📋 Todo | P1 | 2026-05-27 | **Added 2026-04-22 (daily audit)** from [user-research-plan.md](./research/user-research-plan.md) §1 success criteria. 5 × ~1-page theme synthesis docs in `_bmad/planning-artifacts/research/`. Promoted one-liners feed the investor deck (MKT-009 launch narrative + pitch deck). Depends on RES-001 + RES-002. |
| RES-004 | MCP-vs-AX capture spike (week 1, 2–3 days) | Tal + Shenhav | 📋 Todo | P0 | 2026-04-29 | **Added 2026-04-23.** Direct quote from the tech research: *"Critical action item: spike MCP-server-based capture in week 1 (2–3 days). If it covers Claude Desktop and Cursor cleanly, it could replace the Accessibility-API work entirely."* Blocks FISH-003 architecture (FISH-007). Output: short memo + decision. Source: [technical-research-duble-slash-stack.md](../docs/technical-research-duble-slash-stack.md) §Tier 3. |

---

## ⚙️ Ops / Research

| ID | Task | Owner | Status | Priority | Due | Notes / Links |
|---|---|---|---|---|---|---|
| OPS-001 | Keep this board synced with GitHub activity + weekly status | Claude (John) | 🔄 In Progress | P1 | recurring | Update on request or at sprint checkpoints. See "GitHub Sync" below. |
| OPS-002 | Weekly KPI snapshot vs. M1–M9 (once OSS launches) | Tal | ❄️ Parked | P2 | post-launch | Measurement starts day of OSS launch. |
| OPS-003 | Apple Developer account + macOS notarization pipeline | Tal | 📋 Todo | P0 | 2026-04-29 | **Added 2026-04-22.** Hard blocker on FISH-003. macOS Gatekeeper will block an unsigned desktop client. Apple Developer account ($99/yr) + certs + notarization workflow. Lead time is days, not hours — must start immediately. Also feeds potential App Store distribution later. |
| OPS-004 | Tech research: `AGENTS.md` merge strategy · ChatGPT Desktop install surface · Windows code signing | Shenhav | 📋 Todo | P0 | 2026-04-29 | **Added 2026-04-22** per [brief-install-experience.md](./briefs/brief-install-experience.md) open questions. Three investigations before FISH-003 engineering starts: (1) **AGENTS.md merge** when a repo already has one — proposed idempotent `## FISH` section with a marker; confirm; (2) **ChatGPT Desktop** has no official Custom Instructions install API — unofficial surface or one-line paste fallback?; (3) **Windows SmartScreen** code-signing process + cert cost for the v1 Windows tray client. Output: short memo per topic, add to `_bmad/docs/`. |
| OPS-005 | Lock OSS license & governance posture (irreversible decision) | Tal + Shenhav | 📋 Todo | P0 | 2026-05-05 | **Added 2026-04-22 (daily audit)** from [domain-research-oss-license-governance.md](../docs/domain-research-oss-license-governance.md). Pick license (Apache 2.0 vs. MPL 2.0 vs. FSL vs. AGPL) + governance model (BDFL vs. steering committee vs. foundation) **before first external commit** — relicensing post-launch requires every contributor's sign-off and shatters trust. Must have a real OSS-licensing lawyer (Heather Meeker / Luis Villa class) review the pick. Hard gate on OSS launch (MKT-009). |
| OPS-006 | Decide capture-method legal posture (AX vs. network interception vs. browser ext vs. screen capture) | Tal + Shenhav | 📋 Todo | P0 | 2026-05-05 | **Added 2026-04-22 (daily audit)** from [domain-research-capture-legality.md](../docs/domain-research-capture-legality.md). Shapes FISH-003 engineering scope *and* the trust/integrity marketing pillar — if the capture channel is legally marginal, GTM collapses. Decision dimensions: one-party consent (federal + ~38 states) vs. all-party (CA/FL/IL/MA/MD/MT/NH/PA/WA); per-tool ToS review (OpenAI / Anthropic / Cursor); AX-vs-network-interception engineering tradeoff. Product-counsel review required (someone who shipped Rewind / Granola / Otter). Blocks FISH-003 final architecture. |
| OPS-007 | Trademark clearance search for "Duble Slash" | Tal | 📋 Todo | P0 | 2026-04-29 | **Added 2026-04-23.** Blocks domain purchase + final naming. Scope: USPTO TESS search + common-law usage + non-US marks (at minimum EU + IL). Output: short memo under `_bmad/docs/` + clear/conflict recommendation. If conflict, escalate to rename decision before OSS launch. Source: [brief-install-experience.md](./briefs/brief-install-experience.md) §14 + [brief-collab-capture-layer.md](./briefs/brief-collab-capture-layer.md) §10. |
| OPS-008 | Engage OSS-licensing + product counsel (Heather Meeker class) | Tal | 📋 Todo | P0 | 2026-05-05 | **Added 2026-04-23.** Feeds OPS-005 (license) + OPS-006 (capture legal posture). Explicitly called out as "tens of thousands, non-optional" in the OSS-launch brief. Scope: one OSS-licensing specialist + one product-counsel who has shipped capture-adjacent products (Rewind / Granola / Otter). Early engagement — their advice shapes architecture, not vice versa. Source: [brief-collab-capture-layer.md](./briefs/brief-collab-capture-layer.md) §Open Questions + §Constraints. |
| OPS-009 | Decide landing-page hosting stack + telemetry framework | Shenhav | 📋 Todo | P1 | 2026-05-12 | **Added 2026-04-23.** Two infra calls: (1) landing-page hosting — Vercel + Next.js assumed but not decided (alternatives: Cloudflare Pages, Astro+Netlify); (2) telemetry framework for install/crash — PostHog OSS (feeds KPI M2) vs. Sentry OSS (feeds M8). Cost + self-host implications differ. Source: [technical-research-duble-slash-stack.md](../docs/technical-research-duble-slash-stack.md) §13 open questions. |

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
- **2026-04-22 (late evening — daily audit)** — **6 new tasks added + MKT-001 updated.** Tal asked for a daily comparison between what we're working on and what's tracked. Gaps vs. last 2–3 days of commits/artifacts: (1) **RES-001** execute user interviews, (2) **RES-002** execute industry desk research, (3) **RES-003** synthesize themes A–E → validate/modify/kill — all from [problem-hypotheses-and-themes.md](./research/problem-hypotheses-and-themes.md) + companion plans (all drafted 2026-04-21, never ticketed); (4) **FISH-009** wire the 136-expert `@handle` roster into each local-agent spec — [experts.md](../../methodology/local-agents/experts.md) exists but Nova/Sol/Bram/Sage specs don't reference the grammar or proactive-offer rules yet; (5) **OPS-005** lock OSS license & governance (irreversible — hard gate on MKT-009 launch); (6) **OPS-006** decide capture-method legal posture (shapes FISH-003 engineering + trust pillar). Also updated **MKT-001** → 🔄 In Progress with a note on the 39-leader LinkedIn CSV import (commit `e6b7ad5`). New group added: **🔬 Problem Validation — Research**. Daily audit is now a standing practice.
- **2026-04-22 (evening)** — **Task sweep: 9 new tasks surfaced from this session's research + brief landed on the board.** Standing rule from Tal: document tasks the moment they emerge, don't wait to be asked. New tasks: **FISH-005** (apply BMAD punch list — 7 concrete edits to agent specs), **FISH-006** (decide `.fish/project-context.md` ownership — blocks FISH-005), **FISH-007** (architecture decision: Claude Agent SDK + LangGraph + MCP — blocks FISH-003 engineering), **FISH-008** (write install-bundle content — parallelizable with FISH-003), **OPS-003** (Apple Developer account + notarization — hard blocker on FISH-003, ~day lead time), **OPS-004** (tech research: AGENTS.md merge + ChatGPT Desktop install + Windows signing), **MKT-007** (reframe positioning to "methodology layer for AI-assisted product work"), **MKT-008** (BMAD-vs-FISH comparison page for OSS launch), **DES-003** (replace website hero CTA with one-liner install command). Focus strip rewritten — four new P0s now gate FISH-003. Dependencies explicit: FISH-006 → FISH-005; FISH-007 + OPS-003 + OPS-004 → FISH-003; FISH-008 parallel to FISH-003; DES-003 depends on DES-001 finishing first.
- **2026-04-21 (reconciled)** — **FISH-001 + FISH-002 → ✅ Done.** Audit against each task's acceptance criteria: FISH-001 demands (phases, axes, transitions, per-phase demands) all met and exceeded (use-cases + human-AI moat doc are bonuses). FISH-002 demands (phase→agent mapping, each agent's prompt/tools/handoff I/O) all met and exceeded (system-agents/README.md is a bonus). Supabase row status updated via [`supabase/2026-04-21-fish-reconciliation.sql`](../../supabase/2026-04-21-fish-reconciliation.sql). `PRD-001` note updated to reflect the unblock. **Next P0 for Tal: FISH-003** (`//` install bundle for Claude Desktop / Cursor / ChatGPT Desktop — the thing that turns the methodology + agents into something a user can actually install in 30 seconds).
- **2026-04-21 (values pass)** — **PRD-004 added.** Brainstorming session on company values produced a five-value draft saved to [company-values.md](./company/company-values.md) — Tal flagged the wording as unsatisfactory ("they sound like a product, not values") and parked revision for later. Full session history + rejected framings preserved in [brainstorm-company-values.md](./brainstorms/brainstorm-company-values.md). Gates PRD-002 (manifesto) since values should set the tone manifesto builds on.
- **2026-04-23 — Full task-board ↔ DB sync + doc audit.** Tal surfaced that improvements weren't visible in the deployed Vercel app. Two root causes: (a) seven tasks had been added to the markdown board over the last two days but never flowed into the DB (the app reads DB state, not markdown) — **FISH-009, OPS-005, OPS-006, PRD-004, RES-001, RES-002, RES-003**; (b) twelve further concrete action items were documented in briefs/research docs but never ticketed in either place. New tickets: **MKT-010** (resolve 5 open questions in OSS launch brief §10), **MKT-011** (execute 7-post blog calendar), **MKT-012** (Anthropic pre-launch outreach mechanics); **PRD-005** (refine "Flows, not frames" to Hebrew parity), **PRD-006** (draft `redaction-rules.md` dev-handoff); **DES-004** (hi-fi mockups: Today / first-run step 4 / Privacy dashboard / menubar popover), **DES-005** (resolve 8 open design decisions), **DES-006** (sign-off on Privacy dashboard before launch); **OPS-007** (trademark clearance), **OPS-008** (engage OSS-licensing + product counsel), **OPS-009** (landing-page stack + telemetry framework); **RES-004** (MCP-vs-AX capture spike — week 1). Also added a new DB group `research` (🧪) as a home for RES-*; the existing `ops` group kept its own research items (legal/licensing/capture-legality). Migration: [`20260422235000_task_board_full_sync.sql`](../../supabase/migrations/20260422235000_task_board_full_sync.sql) — idempotent, inserts 19 tasks + the new group. Standing rule reaffirmed: tasks on the markdown board must land in the DB in the same session; a task that's only in markdown is not visible to Shenhav or the live board.
