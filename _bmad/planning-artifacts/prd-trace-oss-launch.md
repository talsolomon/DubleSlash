# PRD — Trace OSS Launch (Milestone 1)

**Status:** Draft v1.1
**Version:** 1.1
**Date:** 2026-04-20
**Project:** Trace
**Target ship:** 6 weeks from kickoff (~early June 2026)
**Authors:** Tal + Shenhav (co-founders)

**Changelog:**
- **v1.1 (2026-04-20):** Reframed as team-collab substrate (not personal AI brain). V1 scope expanded to include Windows/Linux clients, Slack/Teams/email integrations, Linear-like + GitHub-like views, and 15-min full-access trial — collapses old V1 + V1.5 into one V1 milestone. Non-goals restructured into "ships in V1" vs. "V2/never." Added US-11/US-12 for team-evaluation framing. Tightened REQ-022/050/094. Added §6.13 error/degraded states. Fixed M9 metric.

**Upstream docs:**
- Brief: [`brief-collab-capture-layer.md`](brief-collab-capture-layer.md)
- UX: [`ux-design-trace-oss-launch.md`](ux-design-trace-oss-launch.md)
- Tech research: [`../docs/technical-research-trace-stack.md`](../docs/technical-research-trace-stack.md)
- Market research: [`../docs/market-research-collab-capture-layer.md`](../docs/market-research-collab-capture-layer.md)
- Legal / license: [`../docs/domain-research-oss-license-governance.md`](../docs/domain-research-oss-license-governance.md) · [`../docs/domain-research-capture-legality.md`](../docs/domain-research-capture-legality.md)

---

## 1. Overview

Trace OSS Launch ships a **macOS-only, single-player, local-first desktop client** plus a **browser extension** that captures the user's AI work across Claude, Cursor, ChatGPT, Perplexity, and any OpenAI/Anthropic-API-compatible tool. All captured data stays on the user's device, encrypted with a key under the user's control. The product is released under **FSL-1.1-Apache-2.0**, with a public GitHub repo, a CLA-backed contribution flow, and a marketing site that leads with the integrity narrative.

This milestone is **not** the V1 collaboration product. V1 (Milestone 2, ~4–5 months later) is the full surface: multiplayer team graph, push/branch/diff across tools, cross-platform native clients (macOS + Windows + Linux), Slack/Teams/email integrations, Linear-like task view + GitHub-like push-history UI, hosted backend + hardened self-host, and 15-min full-access trial. This milestone's job is narrower and earlier: (a) ship the capture substrate V1 depends on, (b) earn trust in public, (c) build a contributor community, (d) collect the first 1,000 GitHub stars.

## 2. Problem Statement

Design + dev teams in 2026 use 5–10 AI tools per person across roles — a designer lives in Claude Design, Figma AI, and ChatGPT; a developer lives in Cursor, VS Code with Copilot/Claude, and Perplexity. Linear and ClickUp organize the tasks, but each teammate's AI sessions are private and trapped in their chosen tool. There is no way for a designer to push a Claude Design session and have a developer pick it up in VS Code — or for a developer's pushed work to come back to a designer for review. Existing solutions each own one slice (Granola for meetings, Cursor for IDE, Linear+AI for tasks); no one owns the **layer beneath** that carries work across tools and teammates. Before we can ship the full collaboration product (V1: multiplayer, push/branch/diff, cross-platform, integrations, both views), we need a capture substrate that is trustworthy enough for people to install and complete enough to demonstrate real value single-player on day one.

## 3. Goals

### Primary goals (measured 30 days post-launch)
- **G1 — Traction:** 1,000+ GitHub stars.
- **G2 — Installs:** 200+ verified self-installs (via opt-in install counter at ~30% opt-in rate ≈ 600+ actual installs).
- **G3 — Capture reliability:** >90% of test sessions across Claude Desktop + Cursor + ChatGPT-web captured successfully without user intervention.
- **G4 — Trust:** zero public security / privacy backlash incidents.
- **G5 — Relationship:** 1+ private conversation opened with a major LLM lab (Anthropic preferred) before or within 30 days of launch.

### Secondary goals
- **G6 — Dev-community signal:** at least one unsolicited Hacker News or Twitter thread with 100+ upvotes / engagements.
- **G7 — Contributor interest:** 10+ non-founder PRs (of any size) merged to the OSS repo.
- **G8 — Foundation for multiplayer:** data model, capture protocol, and agent scaffolding are shaped so v1 multiplayer is an additive build, not a rewrite.

## 4. Non-Goals

**Out of scope for this 6-week milestone — shipping any of these early is failure.** Most of these ARE V1 scope (next milestone) — "not yet" is the rule, not "never."

**Ships in V1 (next milestone, not this one):**
- Multiplayer team graph, push, branch, diff, cross-device sync
- Hosted backend (user accounts, server-side data, auth)
- Windows and Linux clients (V1 ships cross-platform parity)
- Slack / Teams / email integrations
- Linear-like task view + GitHub-like push/branch history UI
- Web app for the team view
- 15-min full-access trial + paid-tier gating
- Hardened self-host packaging (Docker Compose, Helm chart)

**Deferred past V1 (V2 or never):**
- Figma AI, v0, Replit Agent, Notion AI, or any non-Tier-0/2/3 capture target (coverage expansion comes after V1 ships)
- Network-layer TLS interception (advanced opt-in, post-V1)
- OS-level screen capture (never, or v2+ at earliest)
- Keystroke capture (never)
- The `flow.yaml` methodology — agents at this stage are capture + redaction only (V2)
- Mobile clients
- Enterprise features (SSO, SAML, SOC 2, data residency, audit exports) — V2

**Intentionally out of this milestone because the 6-week OSS launch is about trust and substrate, not product surface.** The collaboration vision — Sarah (Claude Design) pushes, Marcus (VS Code) picks up, pushes back — is what V1 proves. OSS launch's only job is: ship the capture layer that makes V1 possible, earn trust, seed the community.

## 5. User Stories

**Persona: *Senior IC* using 3+ AI tools daily**

- **US-01** As a Senior IC, I want to install Trace by dragging a `.dmg` to Applications, so that I can try it without committing to an account or cloud signup.
- **US-02** As a Senior IC, I want Trace to show me exactly what it's capturing in real-time, so that I can trust it's not doing anything I didn't agree to.
- **US-03** As a Senior IC, I want to see all my AI sessions from today across every tool in one timeline, so that I can retrace my thinking without opening 5 apps.
- **US-04** As a Senior IC, I want to delete any captured session permanently with one click, so that I stay in control of what exists on my disk.
- **US-05** As a Senior IC, I want to pause all capture instantly from the menubar, so that I can handle sensitive work without re-configuring anything.
- **US-06** As a Senior IC, I want to see that "nothing has left this device" in plain language, so that I can show a security-conscious colleague and recommend Trace to them.

**Persona: *Privacy-skeptical dev* evaluating Trace**

- **US-07** As a privacy-skeptical dev, I want to read the source code on GitHub before installing, so that I can audit what the capture agents actually do.
- **US-08** As a privacy-skeptical dev, I want telemetry to be opt-in with plain-English copy, so that I don't have to hunt for a setting to disable it.
- **US-09** As a privacy-skeptical dev, I want local storage to be encrypted with a key derivable from my own passphrase, so that a stolen disk doesn't leak my AI sessions.

**Persona: *Team lead* (future — but primes v1 multiplayer)**

- **US-10** As a Team Lead, I want the redaction preview to show me what *would* leave my device if pushed, so that when v1 multiplayer ships I already trust the redaction model.

**Persona: *Senior IC evaluating Trace for their design + dev team***

- **US-11** As a Senior IC evaluating Trace to recommend to my team, I want the welcome copy, empty state, and redaction-preview view to make the V1 cross-tool handoff story legible (without overclaiming what's live), so that I can show a teammate and have them understand where this is going before V1 ships.
- **US-12** As a designer on a mixed design+dev team, I want Trace to capture my Claude Design / Figma AI / ChatGPT sessions today on a single timeline, so that when V1 ships my developer teammate can pick them up in VS Code without either of us changing our workflow to get there.

## 6. Functional Requirements

### 6.1 Install & first-run

- **REQ-001** The macOS client SHALL ship as a signed, notarized `.dmg` that installs via drag-to-Applications. No installer wizard.
- **REQ-002** On first launch, the client SHALL present a 6-step onboarding (Welcome → How it works → Telemetry consent → Connect tools → Accessibility permission [if needed] → Celebration), matching [`ux-design-trace-oss-launch.md`](ux-design-trace-oss-launch.md) Flow 1.
- **REQ-003** Telemetry consent dialogs SHALL default OFF for both "install counter" and "crash reports," with plain-English copy matching the UX doc.
- **REQ-004** The user SHALL be able to skip any tool connection step without being blocked from continuing.
- **REQ-005** If the user denies the macOS Accessibility permission prompt, the client SHALL gracefully disable Tier 3 capture and surface a message explaining what is still captured (Tier 0 + Tier 2).

### 6.2 Capture — Tier 0 (API-key proxy)

- **REQ-010** The client SHALL run a local HTTP proxy on `localhost:<chosen-port>` that accepts OpenAI-compatible and Anthropic-compatible API calls.
- **REQ-011** For each proxied call, the client SHALL record request + response + model + timestamp to local encrypted storage, and return the provider's response unchanged to the caller.
- **REQ-012** The user SHALL be able to paste an OpenAI API key and/or Anthropic API key into Settings → API keys. Keys SHALL be stored in macOS Keychain, not in app storage.
- **REQ-013** The proxy SHALL support streaming responses (SSE) without buffering the whole response.
- **REQ-014** The proxy SHALL never transmit captured content anywhere other than the provider it's forwarding to and local disk.

### 6.3 Capture — Tier 2 (browser extension)

- **REQ-020** The extension SHALL ship as a Manifest V3 extension for Chrome + Firefox + Safari (Edge piggybacks on Chrome).
- **REQ-021** The extension SHALL capture sessions on `chatgpt.com`, `chat.openai.com`, `claude.ai`, and `perplexity.ai` via a combination of `MutationObserver` (DOM) and `fetch` interception.
- **REQ-022** The extension SHALL forward captured sessions to the desktop client via localhost HTTP POST authenticated with a per-install shared secret generated at client first-run.
- **REQ-023** The extension SHALL NEVER transmit captured content to any remote endpoint.
- **REQ-024** The extension SHALL respect per-site pause controls set in the desktop client's Tools & Sources.
- **REQ-025** The extension SHALL ship with a visible "Trace is capturing" badge on the extension icon when active.

### 6.4 Capture — Tier 3 (native desktop apps)

> **⚠ Conditional scope.** A 2-day MCP-server spike in week 1 will decide whether Tier 3 uses **(A) MCP-server-based capture** or **(B) macOS Accessibility API**. A/B picks are noted per-requirement; the one that survives the spike becomes canonical.

- **REQ-030** The client SHALL capture sessions from Claude Desktop.
  - **(A) MCP path:** the client SHALL ship a Trace MCP server that the user registers with Claude Desktop; captures flow through the MCP integration.
  - **(B) AX path:** the client SHALL read Claude Desktop's Accessibility tree via the macOS Accessibility API.
- **REQ-031** The client SHALL capture sessions from Cursor (same A/B structure as REQ-030).
- **REQ-032** If Tier 3 is not at 80% working by end of week 4, it SHALL be dropped from the OSS launch and shipped as v0.2 within 2–3 weeks after.
- **REQ-033** Per-app capture modules SHALL be independent: Claude Desktop failing SHALL NOT break Cursor capture.

### 6.5 Local encrypted storage

- **REQ-040** Captured sessions SHALL be stored in a local SQLite database.
- **REQ-041** Session **content** (prompt text, response text) SHALL be encrypted at rest using `age` encryption with a key derived from a user passphrase via Argon2id.
- **REQ-042** Session **metadata** (tool name, model, timestamp, turn count) MAY be stored in plaintext to enable fast queries.
- **REQ-043** The encryption key SHALL be stored in macOS Keychain when the user opts in to Keychain integration (default: opt-in during first-run).
- **REQ-044** Data retention default SHALL be 30 days, user-configurable in Settings → Capture (options: 7 days, 30 days, 90 days, forever).
- **REQ-045** The user SHALL be able to export all data as JSON/markdown and delete all data with one click in Settings → Data & privacy.

### 6.6 Agents — capture & redaction

- **REQ-050** A **capture agent** SHALL run in-process in the desktop client. It SHALL tag every captured session with source tool, model, timestamp, turn count, and a rule-based auto-generated title per REQ-051.
- **REQ-051** Auto-title generation SHALL be rule-based for OSS launch (first prompt, truncated to ~60 chars). Agent-generated titles are v1.
- **REQ-052** A **redaction agent** SHALL run locally. For every captured session, it SHALL detect common sensitive patterns (email addresses, phone numbers, credit card numbers, API keys, OAuth tokens, SSNs, obvious client/company names) via regex + heuristics.
- **REQ-053** The redaction agent SHALL NOT auto-modify the captured session. It SHALL surface flagged items in the session detail's right rail and in the redaction preview view.
- **REQ-054** Every agent action SHALL be logged to a local agent audit log, visible in the Privacy dashboard and the per-session right rail.
- **REQ-055** The user SHALL be able to disable any agent in Settings → Capture. Disabling an agent SHALL NOT break other agents or capture.

### 6.7 UI — menubar

- **REQ-060** The client SHALL show a persistent menubar icon whenever capture is enabled.
- **REQ-061** The menubar icon SHALL indicate capture state via a visible status chip: `🟢 Capturing`, `⏸ Paused`, `⚠ Attention`.
- **REQ-062** Clicking the menubar icon SHALL open a 280pt-wide popover matching [`ux-design-trace-oss-launch.md`](ux-design-trace-oss-launch.md) IA diagram.
- **REQ-063** The popover SHALL expose: one-line status, today's session count per tool, [Pause capture] button, [Open Trace] button.

### 6.8 UI — main window

- **REQ-070** The main window SHALL ship with a left sidebar (Today / This week / All time / Tools & Sources / Settings / Privacy dashboard) and a main content area per the UX doc.
- **REQ-071** The **Today view** SHALL list captured sessions in reverse chronological order, grouped by hour, with session cards per the UX doc spec.
- **REQ-072** Clicking a session card SHALL open **session detail** with a threaded view of turns, a collapsible right rail (metadata + agent activity), and footer actions [Copy markdown] [Delete] [Preview redaction].
- **REQ-073** The **Tools & Sources** page SHALL show every capture path with live status, last-capture timestamp, and [Pause] / [Disconnect] controls per tool.
- **REQ-074** The **Privacy dashboard** SHALL show (a) what's stored on device (count, size, encrypted status), (b) what has left this device (always "Nothing" in OSS launch), (c) telemetry sent, (d) agent activity totals — matching UX doc Flow 6.
- **REQ-075** The **Settings** window SHALL expose sections: General / Capture / Telemetry / API keys / Data & privacy / About — matching UX doc Flow 5.

### 6.9 UI — redaction preview

- **REQ-080** From the session detail, the user SHALL be able to open a redaction preview showing a side-by-side diff of "as captured" vs. "what would be redacted if pushed."
- **REQ-081** Each flagged item SHALL show its detection category (e.g., "API key," "email address") and a per-item toggle to accept/reject the redaction suggestion.
- **REQ-082** At OSS launch the preview is **informational only** — there is no push target. The view exists to build trust and muscle memory before v1 multiplayer ships.

### 6.10 Telemetry

- **REQ-090** The client SHALL support exactly two opt-in telemetry mechanisms: an install counter (one-time +1 ping) and crash reporting.
- **REQ-091** Both mechanisms SHALL default OFF.
- **REQ-092** Neither mechanism SHALL transmit any captured content, any session data, any identifiers beyond an anonymous install UUID, or any usage analytics.
- **REQ-093** Preferences SHALL be re-exposed in Settings → Telemetry with identical plain-English copy.
- **REQ-094** Telemetry implementation SHALL use PostHog OSS self-host for the install counter and Sentry OSS self-host for crash reports. Rationale: both are open-source and self-hostable, preserving the integrity narrative; both have commercial fallbacks available if self-host ops become a burden post-launch.

### 6.11 OSS repo & license

- **REQ-100** The client and browser extension SHALL be licensed under **FSL-1.1-Apache-2.0** (Sentry's Functional Source License; 2-year non-compete; auto-converts to Apache 2.0).
- **REQ-101** The capture protocol (the wire format between extension and client, and any future network protocol) SHALL live in a separate repo licensed under Apache 2.0, so anyone can implement a capture agent for a new tool.
- **REQ-102** The repos SHALL include `README.md`, `LICENSE`, `GOVERNANCE.md`, `SECURITY.md` (with a `security.txt`), `CONTRIBUTING.md`, and a CLA managed via cla-assistant.io.
- **REQ-103** Every release SHALL be signed and SHALL publish an SBOM.
- **REQ-104** Dependency licenses SHALL be audited (ScanCode or FOSSA) before the first public commit; no GPL transitives shall leak into the FSL distribution.

### 6.12 Marketing site

- **REQ-110** A marketing site SHALL ship at `trace.<domain>` (domain TBD pending name confirmation + trademark clearance) with: hero + tagline + 20s demo loop, Privacy dashboard screenshot, "how it works" tier diagram, founder story, install + GitHub links.
- **REQ-111** The site SHALL NOT include testimonials, enterprise logos, or customer quotes at launch.
- **REQ-112** The site SHALL be built on Next.js + Vercel (boring, fast) and open-sourced in the same GitHub organization.

### 6.13 Error & degraded states

Every error surface MUST follow the UX doc's error-message pattern: *"[What happened]. [What Trace is doing about it]. [What the user can do]."*

- **REQ-120** If a SQLite write fails (disk full, permissions, corruption), the client SHALL (a) retain the captured session in an in-memory queue for at least 60 seconds while retrying once every 5 seconds, (b) surface a `⚠ Attention` menubar chip with reason, (c) never silently drop a session. If retries exhaust, the client SHALL offer the user the option to export the pending session as markdown before discarding.
- **REQ-121** If the macOS Keychain is locked or unavailable at client launch, the client SHALL NOT start capture. It SHALL display an unlock prompt on the main window and in the menubar popover, and capture SHALL resume automatically once Keychain becomes available. No session SHALL be written to local storage in unencrypted form during this state.
- **REQ-122** If the browser extension cannot reach the desktop client on `localhost:<chosen-port>` (client not running, port conflict, auth mismatch), the extension SHALL (a) buffer up to 10 captured sessions in `chrome.storage.local`, (b) indicate the disconnected state via the extension icon badge, (c) flush the buffer to the client automatically on reconnect, (d) notify the user if buffer is full.
- **REQ-123** If the Tier 0 proxy receives a provider error (4xx/5xx, timeout, network unreachable) from OpenAI or Anthropic, the proxy SHALL return the provider's error unchanged to the caller, log the attempt (not the body) to the local agent audit log, and NOT retain a partial session.
- **REQ-124** When a session reaches the data-retention cutoff configured in REQ-044, the client SHALL delete the session on next app launch (not in a background daemon) and record the deletion in the agent audit log with session ID, retention setting in effect, and timestamp. The user SHALL NOT be prompted — retention is a set-and-forget policy. Upcoming-expiry notices are a V1 feature, not an OSS-launch one.

## 7. UX / Design Considerations

All UX for this milestone is specified in detail in [`ux-design-trace-oss-launch.md`](ux-design-trace-oss-launch.md). Notes specific to this PRD:

- **North-star feel:** *"Oh — I can see what it's doing, and I'm in charge of all of it."*
- **Menubar-primary architecture.** Main window is the destination; menubar is the always-on trust signal.
- **Privacy dashboard IS the ad.** Built to be screenshotted.
- **Voice + copy system** is defined in the UX doc. Reuse everywhere.
- **Shenhav owns the visual system.** Visual direction is in the UX doc; hi-fi mockups are a deliverable before week 3.
- **Accessibility** is a hard requirement, not a stretch: WCAG AA, VoiceOver-clean, keyboard-full.

## 8. Technical Constraints

Stack and architecture are specified in [`technical-research-trace-stack.md`](../docs/technical-research-trace-stack.md). PRD-level constraints:

- **Desktop client:** Tauri 2 (Rust core + React/TS/Tailwind + shadcn/ui).
  - *Fallback:* Electron if the MCP-server spike and engineering-capacity conversation reveal the team can't credibly handle Rust in the 6-week window.
- **Browser extension:** Manifest V3 + Plasmo framework.
- **Local storage:** SQLite + `age` content encryption + Keychain for the key.
- **Agent runtime:** in-process in the desktop client, Anthropic SDK with Claude Haiku 4.5, BYOK — the user's own API key pays for personal-agent inference.
- **macOS version support:** macOS 13 (Ventura) and later.
- **Apple Developer Program + signing + notarization** set up week 1. Not a week-5 scramble.
- **Code style & tooling:** standard TypeScript + Rust toolchains; PR checks include tests, `cargo audit`, license scan, and a "does it build signed & notarized" step before merge to main.
- **Tier 3 path (MCP vs. AX):** to be decided by end of week 1 via a 2-day spike. Either outcome must fit in the remaining 5 weeks.

## 9. Success Metrics

All measured 30 days post-launch unless noted.

| # | Metric | Target | Signal source |
|---|---|---|---|
| M1 | GitHub stars | ≥ 1,000 | GitHub API |
| M2 | Opt-in install counter | ≥ 200 (≈ 600 actual at 30% opt-in) | PostHog OSS |
| M3 | Capture reliability (test matrix) | ≥ 90% | Internal test sessions across 3 tools × 10 session types |
| M4 | Security/privacy backlash incidents | 0 | Social monitoring + inbox |
| M5 | LLM lab partnership conversations | ≥ 1 opened (Anthropic priority) | Founder outreach log |
| M6 | HN / Twitter front-page moment | ≥ 1 thread, 100+ engagements | Social monitoring |
| M7 | Non-founder PRs merged | ≥ 10 | GitHub |
| M8 | Crash-free session rate | ≥ 99% of sessions complete capture without crash | Sentry OSS (opt-in subset) |
| M9 | Time-to-first-capture | ≤ 5 min in every moderated usability session (n=5) | Moderated usability tests, timed |

## 10. Open Questions

- [ ] **Engineering capacity for the 6-week window.** The single most important unresolved input — see technical research. Resolve before kickoff.
- [ ] **Tier 3 path (MCP vs. Accessibility API).** Resolved by week-1 spike. PRD currently specifies both conditionally; one gets deleted after spike.
- [ ] **Tauri vs. Electron.** Hinges on engineering capacity. Tauri recommended; Electron is the safer fallback if Rust experience is zero.
- [ ] **Name lock.** "Trace" is provisional; trademark clearance search needed before filings and before `trace.<domain>` purchase.
- [ ] **Auto-title approach for sessions.** Rule-based (OSS launch) confirmed; revisit for v1.
- [ ] **Redaction ruleset.** PRD specifies the categories (email, phone, keys, tokens, SSN, client names); the exact patterns are a dev-handoff detail. Draft a `redaction-rules.md` in `_bmad/docs/` during implementation.
- [ ] **Apple Developer account ownership.** Organizational ($99/yr) vs. individual — small legal decision with consequences for brand presentation.
- [ ] **Anthropic outreach timing.** PRD notes as a success metric; operationally, who sends the first DM and when. Before launch is preferred.
- [ ] **Launch vehicle.** Is the launch post on HN, a Twitter thread, a Show HN, a Product Hunt, or all of the above? Affects when/how assets drop.

## 11. Milestone structure (6-week sprint plan — strawman)

| Week | Focus | Demo at end of week |
|---|---|---|
| 1 | Kickoff, repo creation, license + CLA, MCP-server spike, Tauri scaffolding, first-run shell | MCP spike result + app launches with empty UI |
| 2 | Tier 0 proxy + local storage + Keychain integration + capture agent | BYOK captures one session end-to-end |
| 3 | Browser extension (Tier 2) + IPC with client + ChatGPT/Claude.ai/Perplexity coverage | Browser capture end-to-end, session appears in Today view |
| 4 | Tier 3 (path chosen in week 1) + redaction agent + Privacy dashboard + Tools & Sources | Claude Desktop + Cursor sessions appear in Today view · **Tier 3 GO/NO-GO call at end of week 4** |
| 5 | Polish: settings, telemetry consent UX, keyboard shortcuts, accessibility pass, dark mode · macOS signing + notarization pipeline | TestFlight-equivalent dogfooding build; founder daily-drives it |
| 6 | Marketing site, README, launch rehearsal, CLA bot, contributor onboarding, bug fixes from dogfooding | **Public release + launch post** |

Break into stories via `/bmad-create-epics-and-stories` after PRD validation.

## 12. Explicit exit criteria (how we know we can ship)

- [ ] All REQ-001 through REQ-124 pass acceptance tests (Tier 3 conditionally per week-4 call)
- [ ] No P0 or P1 open bugs
- [ ] All flagged redaction categories detected in a 30-session synthetic test matrix
- [ ] Signed + notarized `.dmg` produces a cleanly-launching app on a fresh macOS 13 + 14 + 15 install
- [ ] Fresh-install first-run takes < 5 min end-to-end (internal time trial; n=5 people)
- [ ] OSS-licensing counsel + product counsel reviews complete
- [ ] Dependency license audit clean
- [ ] "Capturing … local only … you control pushes" indicator present on every screen
- [ ] Privacy dashboard page matches the UX doc spec 1:1
- [ ] Launch post drafted + reviewed + scheduled

## 13. Next steps

- [ ] Run **`/bmad-validate-prd`** against this PRD.
- [ ] Resolve open questions in §10 (especially engineering capacity + Tier 3 path).
- [ ] Shenhav: hi-fi mockups per UX doc Next Steps.
- [ ] Run **`/bmad-create-epics-and-stories`** to break this into dev-ready stories once validated.
- [ ] Trademark clearance search for "Trace" in parallel.
- [ ] Engage specialist OSS-licensing + product counsel.
