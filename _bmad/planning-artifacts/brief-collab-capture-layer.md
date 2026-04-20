# Product Brief — Trace (working title)

**Date:** 2026-04-20 (Q&A pass: same day)
**Project:** Trace
**Founders:** Tal + Shenhav (co-founders)
**Status:** Draft v2 — five open questions resolved

> "Trace" is the working name (provisional). Confirm before trademark filings. Original working title: Collab. Files in `~/Documents/collab` and `_bmad/` keep the legacy folder name for now to avoid path churn.

---

## Problem

Knowledge workers in 2026 use 5–10 AI tools per person — Claude, Cursor, ChatGPT, Perplexity, Copilot, Figma AI, v0, Notion AI. Every session lives in its own silo. Teammates can't see each other's AI work, can't pick it up where it was left, can't trace where an output came from. Today there is no way to answer *"what did Alice do in Claude this morning, and where can I take it next?"* without screenshots and Slack pasting.

Existing players each own one slice — Granola/Rewind (capture), Cursor Teams (one IDE), Linear+AI (tasks). Nobody owns the **layer beneath** all of them. That layer is the gap.

## Idea

**Trace is a collaboration tool for design + dev teams who currently work in silos across AI tools.** Linear and ClickUp organize tasks, but each teammate runs their own private AI sessions — there's no way to hand work between a designer in Claude Design and a developer in VS Code. Trace is the layer that carries AI work *between* people and *between* tools. Stay in whatever tool you love; push your session; a teammate picks it up in their tool; they push it back. Think GitHub-for-AI-sessions, spread across every AI surface.

Metaphor: *"a blanket that enfolds all the AI work in the world into a cloud."* User installs one thing, signs in once, and AI sessions across every tool sync into a shared, trail-able team graph. **15 minutes of full access on first install — every feature, no gates — then paid features lock behind the subscription.** Hosted: **free up to 5 seats forever, $12/seat/mo above 5.** Open-source self-host always free, unlimited seats.

**Killer demo (V1):** Sarah (designer) opens Claude Design, runs a session iterating a UI component, ends with a result. She pushes. Marcus (developer, different continent) opens VS Code, sees Sarah's session in Trace, picks it up, implements the component in his IDE's AI assistant, pushes back. Sarah opens her Linear-like team view in Trace the next morning and sees Marcus's branch ready for review. Neither left their preferred tool.

## Agents — the moving parts of the layer

Trace is not a passive sync layer — it's a fabric of small, focused **agents** that abide by the Trace `flow` methodology. Agents are what make the layer feel alive instead of inert.

**Two scopes:**
- **Personal agents** — run on the user's device, scoped to that user's data. Privacy-first, local-by-default.
- **System agents** — run in the team graph (when multiplayer ships), scoped to a team's shared surface. Subject to team policies, audit-logged.

**Agent rollout by milestone:**

| Milestone | Agent | Scope | Job |
|---|---|---|---|
| OSS Launch | **Capture agent** | Personal | Watches each tool, tags every session with source, model, timestamp, and (when available) a goal pulled from context. |
| OSS Launch | **Redaction agent** | Personal | Auto-detects PII, secrets, client identifiers; renders a diff-style preview before any data leaves the device. |
| v1 Multiplayer | **Sync agent** | Personal → System | Handles push from local store to team graph; honors per-session push controls. |
| v1 Multiplayer | **Handoff agent** | System | Detects when a session reaches a natural pause and surfaces it as pickup-able to teammates ("Alice paused on this; want it?"). The killer demo is this agent in action. |
| v1 Multiplayer | **Context bundler** | System | Assembles a context pack on demand for any teammate — powers live handoff today, new-joiner onboarding later. |
| v1.5+ | **Digest agent** | System | Narrates "today at a glance" for the team; replaces async standups. |
| v1.5+ | **Personal twin** | Personal | Represents the user on simple async questions when they're offline. |
| v2 / `flow.yaml` | **Flow checker** | System | Verifies each card carries its required attributes (brief, source, context, goal, repository) per the team's `flow.yaml` spec. |
| v2 / `flow.yaml` | **Process agent** | System | Enforces phase transitions per `flow.yaml` (e.g., no card moves to "build" without an approved brief). |

**Design rule for every agent:** **transparent, narratable, overridable.** Users see what each agent did (audit log), can veto any action, can disable any agent without breaking the rest. Agents are not a black box — they are visible workers in a glass kitchen. This is part of the integrity GTM pillar, not separate from it.

## Target Users

- **Beachhead:** SMB design + dev teams (5–50 people) who already use 3+ AI tools and feel the fragmentation pain daily. AI-forward, OSS-friendly, allergic to enterprise sales motions.
- **Validated GTM:** SMB-first, **not** enterprise-first. Free OSS removes procurement friction. Enterprise (SOC 2, SSO, residency) is a Phase-2 tier.
- **Personas to design for in v1:** the *Senior IC* who lives in 4+ AI tools daily, the *Team Lead* who needs visibility without playing detective, the *New Joiner* who needs to absorb in-flight context fast.

## Why Now

- **AI tool fragmentation is accelerating, not consolidating** — and won't reverse. The layer-above bet gets stronger every quarter.
- **Microsoft Recall taught the market the wrong way** to do ambient capture. Trust + OSS + integrity-first is now the only viable entry framing — a tailwind for an OSS-first entrant.
- **OSS-core + paid is a proven playbook** in this exact decade (Supabase, Cal.com, PostHog).
- **EU AI Act provenance requirements** make the captured-AI-work substrate a future compliance asset.
- **The founders' thesis** (see `user_founder_story.md`): two platform shifts ago (SaaS) and one shift ago (AI), value flowed to whoever consolidated fragmentation without forcing migration. Trace is that play for the AI era. Tal lived both shifts; the pattern recognition is the credibility hook.

## Pricing & Hosting (locked)

- **15-minute full-access trial on first install.** Every feature unlocked — multiplayer, push/branch, integrations, all tool coverage — no gates, no signup friction. After 15 min, paid features lock behind the subscription. Principle: let people *feel* the product before anything asks them for money.
- **Free up to 5 seats, forever** on the hosted multiplayer (after the trial, free tier continues with 5 seats).
- **$12/seat/month above 5 seats.** Includes team graph, push history, search across teammates, agent fabric for system agents, Linear-like view, GitHub-like push/branch UI, Slack/Teams/email integrations.
- **Open-source self-host: always free, unlimited seats.** Documented and supported as a first-class deployment from launch (compliance-sensitive teams + OSS faithful).
- **Hosted multiplayer launches with V1, not OSS launch.** OSS launch (6 weeks) is single-player + local-only — establishes the capture substrate and trust before the multiplayer surface ships.
- **5-seat threshold mirrors Notion / Cal.com / Linear free tiers** — the natural inflection where a "team" starts feeling like a real team and value compounds.

## Telemetry & Privacy Posture (locked)

- **Opt-in install counter:** first-run dialog asks plainly. Default OFF. No content, no IDs, just a +1.
- **Opt-in crash reporting:** separate first-run toggle. Default OFF. Plain-English copy.
- **No other phoning home, ever.** No usage analytics, no behavioral telemetry, no captured-content telemetry.
- **PostHog / Cal.com playbook:** measure success without poisoning the integrity narrative.

## Scope Sketch

### Milestone 1 — OSS Public Launch (target: 6 weeks from kickoff, ~early June 2026)

**In scope:**
- macOS desktop capture client, FSL-1.1-Apache-2.0 licensed
- **Tier 0 capture:** API-key bring-your-own (OpenAI, Anthropic) — always-safe baseline
- **Tier 2 capture:** browser extension for ChatGPT-web, Claude.ai, Perplexity
- **Tier 3 capture (in scope):** macOS Accessibility integration for **Claude Desktop** and **Cursor** — covers Claude-via-VSCode use case via the same path. **Hard rule:** if at week 4 Tier 3 is <80% working, drop it from launch and ship as v0.2 release 2–3 weeks after.
- Local-first encrypted storage; data never leaves device by default
- Always-visible capture indicator: *"🟢 Capturing · 3 apps · encrypted locally · you control pushes"*
- Pre-push redaction (PII, secrets) with diff-style preview
- Single-player session timeline view ("see all my AI work from today across tools")
- First-run telemetry consent dialogs (install counter + crash reports, both default OFF)
- Public GitHub repo: README, `GOVERNANCE.md`, CLA via cla-assistant.io, signed releases, SBOM, `security.txt`
- Marketing landing page leading with the "mutual ground" positioning + integrity narrative
- Trademark filings initiated for "Trace" in US + EU + UK (after name confirmation)

**Out of the 6-week OSS launch (ships in V1 — see Milestone 2 below):**
- Multiplayer team graph, push/branch/diff, cross-device sync
- Linear-like task view, GitHub-like push/branch history UI
- Slack / Teams / email integrations
- Windows / Linux clients
- Hosted backend
- 15-min full-access trial + paywall

**Deferred past V1 (V2 or never):**
- Figma AI capture, v0, Replit Agent, Notion AI capture targets (coverage expansion post-V1)
- Network-layer TLS interception (advanced opt-in, ships post-V1)
- OS-level screen capture (never, or v2+ at earliest)
- Keystroke capture (never)
- `flow.yaml` methodology enforcement (V2)
- Enterprise-grade (SOC 2, SSO, SAML, data residency, audit exports) — V2

### Milestone 2 — V1 (full collaboration product) — target: ~4–5 months after OSS launch

V1 is the **actual product**: the moment a design + dev team can replace the Linear/ClickUp + 6-AI-tools silo with a unified surface. OSS launch is the substrate; V1 is the surface. Collapses the previous "v1 multiplayer" + "v1.5 surfaces" milestones into one bigger release because the collaboration story isn't truthful without all the pieces.

**In scope for V1:**
- **Multiplayer team graph** — real-time presence, shared timeline, cross-device sync
- **Hosted backend from day 1** — hosted and self-host ship together; self-host stays first-class for compliance + OSS faithful
- **Push / branch / diff / merge** for AI sessions — GitHub-style push semantics, applied to AI work across tools
- **Cross-tool handoff** (the killer demo) — a session started in Claude Design picked up in VS Code, implemented by Cursor's agent, pushed back for design review
- **Cross-platform native clients: macOS + Windows + Linux** at V1 launch (not sequenced)
- **Two views on top:** Linear-like task view + GitHub-like push/branch history view
- **Slack + Teams + email integrations** — notifications, inline previews, "pick this up in Trace" actions
- **Web app for the team view** (complements native clients)
- **15-min full-access trial** on install, 5-seat hosted free tier, $12/seat/mo above 5 seats
- **Hardened self-host packaging** — Docker Compose, k8s Helm chart, ops runbook

**Out of scope for V1 (stays for later):**
- `flow.yaml` methodology enforcement
- Mobile clients
- Enterprise-grade (SOC 2, SSO, SAML, data residency, audit exports)
- Figma AI, v0, Replit Agent, Notion AI capture targets (coverage expansion post-V1)

### Milestone 3 — V2 / Methodology

- `flow.yaml` declarative methodology, agent-enforced. **Opt-in, never a prerequisite.** Ships only after real captured sessions exist to ground the design.
- Enterprise-grade package: SOC 2, SSO, SAML, data residency controls, audit exports.

## Success Looks Like

**OSS Launch (6 weeks):**
- 1k+ GitHub stars in first 30 days
- 200+ self-installs (via opt-in install counter — assume ~30% opt-in rate, so true number ~600)
- Capture works reliably for Claude (incl. via VS Code) + Cursor + ChatGPT-web for >90% of test sessions
- Zero security / privacy backlash incidents
- 1+ public partnership conversation opened with a major LLM lab (Anthropic preferred)

**V1 (4–5 months post-OSS-launch):**
- 5k+ GitHub stars
- 1k+ WAU across teams (hosted + self-host combined)
- First paying team (any team that crosses the 5-seat threshold)
- One credible "look at this" moment posted publicly — the Sarah→Marcus cross-tool handoff demo, recorded end-to-end
- Cross-platform parity at launch: macOS + Windows + Linux clients ship together
- Slack or Teams integration adopted by >30% of paying teams within 30 days of V1 launch
- Self-host adoption tracked as first-class signal (≥10 documented self-host deployments in 30 days)

**Post-V1 (6–9 months):**
- 25–50 paying teams
- First inbound enterprise interest (do not chase; document as Phase-2 signal)
- First V2 `flow.yaml` pilot team

## Constraints & Reality Check

- **6 weeks is aggressive.** Two-person team. Tier 3 macOS Accessibility is the swing scope item. Hard rule baked into the milestone: if Tier 3 isn't 80%+ working by week 4, drop it from launch and ship Tier 0+2 only — Cursor and Claude Desktop arrive in v0.2 two to three weeks later. Story still holds; better to ship cleanly than miss the date.
- **No multiplayer in OSS launch.** The team graph requires a hosted backend, sync engine, presence, auth — not a 6-week build on top of capture. Accept this; the OSS launch's job is to seed the substrate and prove the capture works. The multiplayer demo is the v1 lift.
- **License is irreversible after first external commit.** Lock FSL-1.1-Apache-2.0 (or Apache 2.0 + trademark fallback) and CLA setup *before* opening the repo for contributions.
- **Specialist OSS-licensing counsel + product counsel before launch.** Both. Budget tens of thousands. Non-optional given the capture-layer trust profile.
- **Hosted backend in 3 months requires architectural decisions now.** The OSS-launch capture client and the v1 hosted backend share data formats, auth model, and protocol. Architecture work for v1 starts during OSS-launch build, not after.

## Open Questions (remaining after Q&A pass)

- [ ] **Trademark search & filings for "Trace."** "Trace" is a common English word — full USPTO + EUIPO clearance search needed before filing. Pair with a distinctive logo + tagline ("Trace your team's AI work") to strengthen distinctiveness. Budget $5–10k for filings + clearance.
- [ ] **Vendor outreach.** When and how to start the Anthropic conversation. Ideal: a quiet partnership conversation *before* OSS launch so they hear about Trace from us, not Twitter.
- [ ] **Cofounder responsibility split (informal, not titles).** Who owns the macOS client build vs. browser extension vs. agent runtime vs. landing page vs. legal/license setup? Worth a one-hour split-of-work conversation before kickoff. Output is a shared doc, not a hierarchy.

## Next Steps

- [x] Five gating questions resolved (name, pricing, hosting, Tier 3, telemetry).
- [ ] Run **`/bmad-technical-research`** — capture stack + sync engine + agent runtime feasibility for 6 weeks / 2 people. *(Up next.)*
- [ ] Run **`/bmad-create-ux-design`** with Sally — OSS-launch single-player UX (capture indicator, session timeline, redaction preview, first-run consent dialogs).
- [ ] Run **`/bmad-create-prd`** for the OSS-launch milestone — grounded in tech-research + UX, not vibes.
- [ ] Lock the license (FSL-1.1-Apache-2.0 recommended) + CLA setup before any external commits.
- [ ] Engage OSS-licensing counsel + product counsel for capture-method review.
- [ ] Trademark clearance search for "Trace" → file in US + EU + UK.
- [ ] Spin up `brief-multiplayer-handoff.md` for the v1 killer-demo brief once OSS launch ships.
