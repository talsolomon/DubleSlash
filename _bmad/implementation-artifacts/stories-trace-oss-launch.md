# Epics & Stories — Trace OSS Launch (Milestone 1)

**PRD:** [`../planning-artifacts/prd-trace-oss-launch.md`](../planning-artifacts/prd-trace-oss-launch.md) (v1.1)
**UX:** [`../planning-artifacts/ux-design-trace-oss-launch.md`](../planning-artifacts/ux-design-trace-oss-launch.md)
**Brief:** [`../planning-artifacts/brief-collab-capture-layer.md`](../planning-artifacts/brief-collab-capture-layer.md)
**Tech research:** [`../docs/technical-research-trace-stack.md`](../docs/technical-research-trace-stack.md)
**Date:** 2026-04-20
**Status:** Ready for sprint planning
**Team:** Tal + Shenhav (2-person co-founder build)
**Target ship:** 6 weeks

---

## Epic map (at a glance)

| # | Epic | Stories | Est effort | Primary week(s) |
|---|---|---|---|---|
| 1 | App Shell & Onboarding | 5 | M–L | W1, W5 |
| 2 | Capture Substrate (Tier 0 / 2 / 3) | 5 | L | W2, W3, W4 |
| 3 | Local Storage & Encryption | 3 | M | W2 |
| 4 | Agents: Capture & Redaction | 3 | M | W2, W4 |
| 5 | Session Timeline & Detail UI | 5 | M–L | W3, W4, W5 |
| 6 | Telemetry (opt-in) | 2 | S | W5 |
| 7 | OSS Launch Infrastructure | 3 | M | W1, W6 |

**Build-order dependencies:**
- Epic 1 (shell) is the floor — everything sits on it.
- Epic 3 (storage) blocks Epic 2 persistence paths and Epic 4 audit log.
- Epic 2 (capture) feeds Epic 5 (timeline) with data.
- Epic 4 (agents) runs on Epic 3, surfaces in Epic 5.
- Epics 6 (telemetry) + 7 (OSS infra) run on independent tracks.

---

## Epic 1 — App Shell & Onboarding

Ship the macOS client skeleton: signed + notarized Tauri app, menubar-primary architecture, main window shell with sidebar IA, and the 6-step first-run onboarding. This is the *foundation* on which every other epic lives. If this epic slips, every other epic slips.

### Story 1.1 — Tauri scaffold + signed & notarized build pipeline

**As a** developer on the Trace team,
**I want** a Tauri 2 project that builds a signed + notarized macOS `.dmg` on every main-branch merge,
**So that** we can dogfood the real distribution artifact from week 1 instead of a week-5 scramble.

**Acceptance Criteria:**
- [ ] AC-001: `pnpm tauri build` produces a notarized `.dmg` locally with a valid Developer ID certificate.
- [ ] AC-002: CI pipeline (GitHub Actions) produces the same `.dmg` on every push to `main`.
- [ ] AC-003: The `.dmg` installs cleanly via drag-to-Applications on fresh macOS 13, 14, and 15.
- [ ] AC-004: Launching the app on a Mac with no prior install produces no Gatekeeper warnings.
- [ ] AC-005: Build includes hardened-runtime entitlements matching the Tier 3 capture plan (Accessibility API entitlement reserved behind feature flag).

**Design reference:** n/a (infra story)
**Technical notes:** Apple Developer Program enrollment is a hard prerequisite — resolve §10 "Apple Developer account ownership" first. Fallback to Electron if week-1 capacity signals Tauri/Rust is untenable.
**Estimated effort:** L
**PRD refs:** REQ-001

---

### Story 1.2 — Menubar app with status chip + popover

**As a** Senior IC using Trace,
**I want** a persistent macOS menubar icon that shows capture state at a glance and opens a quick-info popover,
**So that** I can see Trace is working and take quick actions (pause, open) without context-switching.

**Acceptance Criteria:**
- [ ] AC-001: Menubar icon is visible whenever capture is enabled; hidden when capture is disabled.
- [ ] AC-002: Icon reflects three states via visible chip: `🟢 Capturing`, `⏸ Paused`, `⚠ Attention`.
- [ ] AC-003: Icon adapts to light and dark menubar tints.
- [ ] AC-004: Clicking the icon opens a 280pt-wide popover showing: one-line status, today's session count per tool, [Pause capture] button, [Open Trace] button.
- [ ] AC-005: Pulse animation on the chip is disabled when macOS "Reduce motion" is enabled.
- [ ] AC-006: Tooltip on the icon shows plain-text status for VoiceOver.

**Design reference:** [UX doc — IA diagram + menubar popover](../planning-artifacts/ux-design-trace-oss-launch.md#information-architecture)
**Technical notes:** Use `tauri-plugin-positioner` for popover anchoring. Keep popover logic stateless — pulls from the main-process capture-state store.
**Estimated effort:** M
**PRD refs:** REQ-060, REQ-061, REQ-062, REQ-063

---

### Story 1.3 — Main window shell with sidebar IA + light/dark mode

**As a** user opening Trace,
**I want** a main window with a left sidebar (Today / This week / All time / Tools & Sources / Settings / Privacy dashboard) and a main content area,
**So that** I can navigate to each surface of the app with no guessing.

**Acceptance Criteria:**
- [ ] AC-001: Main window opens at 960×680 with standard macOS traffic-light controls.
- [ ] AC-002: Sidebar renders all six sections; active section is visibly highlighted.
- [ ] AC-003: Routing/state is wired so each section loads its empty placeholder (real content comes in Epic 5).
- [ ] AC-004: Light and dark modes match system preference by default; Settings → General exposes manual override.
- [ ] AC-005: Palette matches visual direction: neutral off-white / soft dark, accent `#3FB68B`, redaction yellow `#F4C95D`.
- [ ] AC-006: Keyboard tab order matches visual order; VoiceOver announces sidebar as a list.

**Design reference:** [UX doc — IA diagram](../planning-artifacts/ux-design-trace-oss-launch.md#information-architecture), [Visual direction](../planning-artifacts/ux-design-trace-oss-launch.md#visual-direction-for-shenhav)
**Technical notes:** Use shadcn/ui `ScrollArea` for the main content area. Sidebar is a plain list, not a collapsible tree.
**Estimated effort:** M
**PRD refs:** REQ-070

---

### Story 1.4 — 6-step first-run onboarding

**As a** user installing Trace for the first time,
**I want** a guided, under-5-minute onboarding that gets me from install to first capture,
**So that** I feel in control of what Trace does, and I end up with at least one captured session.

**Acceptance Criteria:**
- [ ] AC-001: On first launch, the client presents 6 screens in order: Welcome → How it works → Telemetry consent → Connect tools → Accessibility permission (if needed) → Celebration.
- [ ] AC-002: Every step has a [Back] button (except Welcome) and a [Continue] or equivalent; no step is dead-end.
- [ ] AC-003: Telemetry consent screen shows two plain-English toggles, both defaulting OFF, matching the exact copy in the UX doc.
- [ ] AC-004: "Connect tools" screen shows all four capture paths (API keys, browser extension, Claude Desktop, Cursor) with current status; user can connect zero, one, or all.
- [ ] AC-005: User can click "I'll connect tools later" and proceed — never forced to connect anything.
- [ ] AC-006: Celebration screen correctly reflects the number of tools connected and gives a next-action prompt.
- [ ] AC-007: First-run state is persisted so the flow doesn't repeat on next launch. User can re-open via a "Show tour" action in Settings.

**Design reference:** [UX doc — Flow 1](../planning-artifacts/ux-design-trace-oss-launch.md#flow-1--first-run-onboarding-install--first-capture)
**Technical notes:** Welcome copy per v1.1 reframe: *"Welcome to Trace. Trace carries your AI work between tools — and, when your team is on it, between teammates. Today we're in OSS launch: single-player, local-only. Multiplayer handoff ships in V1."* Don't overclaim V1 features as live.
**Estimated effort:** L
**PRD refs:** REQ-002, REQ-003, REQ-004

---

### Story 1.5 — Accessibility permission flow + keyboard shortcuts + WCAG AA pass

**As a** user granting Trace Accessibility permission (and as any user navigating the app),
**I want** a plain-English explainer before the scary macOS system dialog, full keyboard access, and a screen-reader-clean experience,
**So that** I understand what I'm granting, and I can use Trace without a mouse if I need to.

**Acceptance Criteria:**
- [ ] AC-001: Before the macOS Accessibility dialog opens, Trace shows a panel explaining exactly what will be read and why, with a single [Open System Settings] action.
- [ ] AC-002: Clicking [Open System Settings] deep-links to the correct pane in System Settings → Privacy & Security → Accessibility.
- [ ] AC-003: If the user denies or dismisses the dialog, Trace gracefully disables Tier 3 and surfaces a non-blocking message per REQ-005.
- [ ] AC-004: Keyboard shortcuts registered and working: `⌘,` Settings, `⌘K` Today view, `⌘\\` pause/resume capture, `⌘⇧D` Privacy dashboard.
- [ ] AC-005: Every interactive element is keyboard-reachable; tab order follows visual order.
- [ ] AC-006: Every icon-only button has an `aria-label`; no color-only status indicators.
- [ ] AC-007: Color contrast meets WCAG AA in both light and dark modes (automated check via `axe-core` or equivalent).
- [ ] AC-008: Settings tabs are a proper ARIA tablist.

**Design reference:** [UX doc — Accessibility](../planning-artifacts/ux-design-trace-oss-launch.md#accessibility), [Flow 1 step 5](../planning-artifacts/ux-design-trace-oss-launch.md#flow-1--first-run-onboarding-install--first-capture)
**Technical notes:** Accessibility pass is typically a week-5 activity, but AC-005/006/007 should be in every story's definition-of-done from day 1. This story is the "audit + fix + ship" consolidation.
**Estimated effort:** M
**PRD refs:** REQ-005

---

## Epic 2 — Capture Substrate (Tier 0 / 2 / 3)

The core reason Trace exists. Ship three independent capture paths that together cover every AI tool the beachhead persona uses daily. Each tier is independent — any one failing must not break the others.

### Story 2.1 — Tier 0 local proxy (OpenAI + Anthropic, SSE streaming, error passthrough)

**As a** developer who uses OpenAI or Anthropic APIs directly via my own key,
**I want** a local proxy I point my apps at, that records every call without changing the response,
**So that** I can see all my API-driven AI work alongside my chat-based AI work.

**Acceptance Criteria:**
- [ ] AC-001: Proxy listens on `localhost:<chosen-port>` (port chosen at install time, persisted).
- [ ] AC-002: Proxy accepts both OpenAI-compatible (`/v1/chat/completions`, `/v1/responses`) and Anthropic-compatible (`/v1/messages`) routes.
- [ ] AC-003: Each call is recorded to local encrypted storage with request, response, model, timestamp.
- [ ] AC-004: Streaming (SSE) responses are passed through token-by-token — no buffering of the full response before the caller sees any tokens.
- [ ] AC-005: Provider errors (4xx/5xx/timeout/network unreachable) are returned unchanged to the caller; the attempt is logged to the agent audit log (metadata only, no body); no partial session is persisted.
- [ ] AC-006: Proxy never forwards captured content to any destination other than the provider it's forwarding to.
- [ ] AC-007: 10-session integration test matrix passes (streaming + non-streaming, short + long, tools-use + plain, errors).

**Design reference:** n/a (headless)
**Technical notes:** Implement as a Tauri sidecar or in-process async task. Use `reqwest` with SSE support. Record in a background task so proxy latency is <5ms overhead vs. direct provider call. Depends on Epic 3 for storage.
**Estimated effort:** L
**PRD refs:** REQ-010, REQ-011, REQ-013, REQ-014, REQ-123

---

### Story 2.2 — API key management (Keychain-backed)

**As a** user with OpenAI and/or Anthropic API keys,
**I want** to paste my keys into Settings and have Trace store them securely,
**So that** I don't worry about keys showing up in app files or logs.

**Acceptance Criteria:**
- [ ] AC-001: Settings → API keys screen has fields for OpenAI + Anthropic keys and a [Test] button per field.
- [ ] AC-002: Keys are written to macOS Keychain only; never to app storage, config files, or logs.
- [ ] AC-003: [Test] button calls the provider's cheapest valid endpoint and shows a clear success/failure result inline.
- [ ] AC-004: Screen shows persistent reassurance copy: *"Trace never sees these keys leave this device."*
- [ ] AC-005: Keys can be updated or deleted; deletion removes from Keychain immediately.
- [ ] AC-006: If Keychain is locked when the proxy tries to use a key, the proxy fails gracefully per REQ-121.

**Design reference:** [UX doc — Flow 5 Settings](../planning-artifacts/ux-design-trace-oss-launch.md#flow-5--settings)
**Technical notes:** `security-framework` crate for Keychain access. Treat API key value as never-logged data in the codebase (Rust `zeroize` or equivalent).
**Estimated effort:** S
**PRD refs:** REQ-012

---

### Story 2.3 — Browser extension (Chrome + Firefox + Safari): DOM + fetch capture

**As a** user working in Claude.ai, ChatGPT-web, or Perplexity in my browser,
**I want** an extension that captures my sessions and sends them to the Trace desktop client,
**So that** my browser-based AI work shows up in the same timeline as my API and native-app work.

**Acceptance Criteria:**
- [ ] AC-001: Extension builds as a Manifest V3 artifact for Chrome, Firefox, and Safari (Edge uses Chrome build).
- [ ] AC-002: Extension captures sessions on `chatgpt.com`, `chat.openai.com`, `claude.ai`, and `perplexity.ai` via `MutationObserver` (DOM) + `fetch` interception.
- [ ] AC-003: Extension icon shows a "Trace is capturing" badge when active on a supported site.
- [ ] AC-004: Extension never transmits captured content to any endpoint other than the local Trace desktop client.
- [ ] AC-005: Per-site capture respects the pause state set in the desktop client's Tools & Sources view.
- [ ] AC-006: Extension is published to Chrome Web Store, Firefox Add-ons, and Safari Extensions Gallery with signed builds.

**Design reference:** [UX doc — Flow 4 Tools & Sources](../planning-artifacts/ux-design-trace-oss-launch.md#flow-4--tools--sources)
**Technical notes:** Use Plasmo framework. Each site gets its own content-script DOM selector module — isolate failures. Capture shape conforms to the Apache-2.0 capture-protocol repo (REQ-101).
**Estimated effort:** L
**PRD refs:** REQ-020, REQ-021, REQ-023, REQ-024, REQ-025

---

### Story 2.4 — Extension ↔ client IPC with buffer, auth, and reconnect

**As a** browser extension user,
**I want** captured sessions to reach the desktop client reliably, even if the client is briefly unavailable,
**So that** I don't lose sessions to transient disconnects.

**Acceptance Criteria:**
- [ ] AC-001: Extension POSTs captured sessions to `localhost:<port>` authenticated with a per-install shared secret generated at client first-run.
- [ ] AC-002: Client rejects POSTs with a missing or invalid secret.
- [ ] AC-003: When client is unreachable, extension buffers up to 10 sessions in `chrome.storage.local`.
- [ ] AC-004: Extension icon badge indicates disconnected state (color + `aria-label`).
- [ ] AC-005: On reconnect, extension flushes the buffer automatically in FIFO order.
- [ ] AC-006: If the buffer fills (>10 sessions pending), the extension notifies the user in the extension popup with an actionable message ("Trace desktop client unreachable — open it to catch up").

**Design reference:** n/a (technical wiring)
**Technical notes:** Shared secret is written to Keychain on macOS and synced to the extension via an install-time one-time handshake page served by the desktop client at `localhost:<port>/pair`. Rotate the secret on client uninstall/reinstall.
**Estimated effort:** M
**PRD refs:** REQ-022, REQ-122

---

### Story 2.5 — Tier 3 native capture (Claude Desktop + Cursor) — path decided by week-1 spike

**As a** user of Claude Desktop or Cursor,
**I want** Trace to capture my sessions from those native apps,
**So that** my heaviest AI tools aren't the invisible gap in my timeline.

**Acceptance Criteria:**
- [ ] AC-001: A 2-day MCP-server vs. macOS Accessibility API spike is completed by end of week 1 and the chosen path is documented.
- [ ] AC-002: For the chosen path, Claude Desktop session capture is implemented and covers: user turn text, assistant turn text, model name, timestamp, turn count.
- [ ] AC-003: Same for Cursor.
- [ ] AC-004: The two per-app modules are independent: a failure in Claude Desktop capture does not break Cursor capture and vice versa.
- [ ] AC-005: End-to-end test: starting a fresh session in Claude Desktop or Cursor produces a session in Trace's Today view within 5 seconds of session end.
- [ ] AC-006: **Week-4 GO/NO-GO gate:** If capture reliability is <80% on the test matrix at end of week 4, this story drops from OSS launch and ships as v0.2 within 2–3 weeks after.

**Design reference:** [UX doc — Flow 4 Tools & Sources](../planning-artifacts/ux-design-trace-oss-launch.md#flow-4--tools--sources)
**Technical notes:** MCP path: ship a Trace MCP server the user registers with each target app. AX path: read the target app's Accessibility tree via macOS Accessibility API (needs explicit permission per Story 1.5). Either path requires the Apple Developer entitlement set up in Story 1.1.
**Estimated effort:** L
**PRD refs:** REQ-030, REQ-031, REQ-032, REQ-033

---

## Epic 3 — Local Storage & Encryption

Captured data lives on-device, encrypted with a key the user controls. This epic is the substrate for Epic 2 (writes) and Epic 4 (reads). Fast-path on every capture, so performance here directly affects every other surface.

### Story 3.1 — SQLite schema + migrations + write-fail queue

**As a** capture pipeline,
**I want** a durable SQLite store with a clear schema, forward-compatible migrations, and a crash-resistant write path,
**So that** no captured session is ever silently dropped.

**Acceptance Criteria:**
- [ ] AC-001: SQLite database is created in the app's local data dir at first launch with a versioned schema.
- [ ] AC-002: Schema separates `sessions` (content — encrypted) from `session_meta` (tool, model, timestamp, turn count — plaintext for fast queries).
- [ ] AC-003: Migration framework supports forward-compatible schema changes across app versions.
- [ ] AC-004: On SQLite write failure (disk full, permissions, corruption), the captured session is retained in an in-memory queue for ≥60 seconds with one retry every 5s.
- [ ] AC-005: During retry, menubar shows `⚠ Attention` with reason.
- [ ] AC-006: If retries exhaust, user is offered the option to export the pending session as markdown before it's discarded.
- [ ] AC-007: Disk-full state is handled gracefully — no crash, clear user message.

**Design reference:** [UX doc — error message pattern](../planning-artifacts/ux-design-trace-oss-launch.md#copy-system)
**Technical notes:** Use `rusqlite` or `sqlx`. Run migrations inside a transaction. Don't fsync on every write — use WAL mode and checkpoint periodically.
**Estimated effort:** M
**PRD refs:** REQ-040, REQ-042, REQ-120

---

### Story 3.2 — Age encryption + Argon2id key derivation + Keychain integration

**As a** privacy-skeptical user,
**I want** session content encrypted at rest with a key I control (or one held in macOS Keychain with my opt-in),
**So that** a stolen disk can't leak my AI sessions.

**Acceptance Criteria:**
- [ ] AC-001: Session **content** (prompt + response text) is encrypted with `age` before writing to SQLite.
- [ ] AC-002: Encryption key is derived from a user passphrase via Argon2id with parameters meeting current OWASP guidance.
- [ ] AC-003: On first-run, user is offered (not forced) to store the derived key in macOS Keychain — default is opt-in; opt-out available.
- [ ] AC-004: With Keychain opt-in, subsequent launches decrypt transparently.
- [ ] AC-005: Without Keychain opt-in, user is prompted for passphrase on each launch.
- [ ] AC-006: If Keychain is locked/unavailable at launch (REQ-121), capture does NOT start; client shows unlock prompt; no unencrypted session is ever written.
- [ ] AC-007: Decryption failure (corrupt data or wrong key) surfaces a clear error without crashing.

**Design reference:** [UX doc — Flow 1 step 5, Flow 5 Settings Data & privacy](../planning-artifacts/ux-design-trace-oss-launch.md)
**Technical notes:** `age` Rust crate. Argon2id parameters: m=64MB, t=3, p=4 (tune on a low-end Mac). Key material zeroed from memory after use.
**Estimated effort:** M
**PRD refs:** REQ-041, REQ-043, REQ-121

---

### Story 3.3 — Data retention, export, delete-all

**As a** user in control of my data,
**I want** to set retention, export everything, and nuke everything from Settings,
**So that** I never feel like Trace has my data hostage.

**Acceptance Criteria:**
- [ ] AC-001: Settings → Capture exposes retention options: 7 days, 30 days, 90 days, forever. Default is 30 days.
- [ ] AC-002: Settings → Data & privacy exposes [Export all data] producing a `.zip` with JSON metadata + per-session markdown files.
- [ ] AC-003: Settings → Data & privacy exposes [Delete all data] with a confirmation dialog; clicking confirm wipes SQLite, encryption keys in Keychain (with consent), and buffered sessions.
- [ ] AC-004: Retention expiry runs on next app launch (not a background daemon): sessions older than the cutoff are deleted, and the deletion is recorded to the agent audit log with session ID, retention setting in effect, and timestamp.
- [ ] AC-005: User is NOT prompted before retention-based deletion (set-and-forget policy).
- [ ] AC-006: Privacy dashboard's "Stored on this device" count updates immediately after export/delete operations.
- [ ] AC-007: Export does not include encryption keys or the passphrase.

**Design reference:** [UX doc — Flow 5 Data & privacy, Flow 6 Privacy dashboard](../planning-artifacts/ux-design-trace-oss-launch.md)
**Technical notes:** Upcoming-expiry notices are explicitly V1, not OSS launch. Export format conforms to the capture-protocol repo's schema (REQ-101) so migrations across app versions remain frictionless.
**Estimated effort:** M
**PRD refs:** REQ-044, REQ-045, REQ-124

---

## Epic 4 — Agents: Capture & Redaction

Two in-process agents do the work that makes Trace feel alive: tag every session with useful metadata, and flag anything sensitive before it could ever be pushed. Every agent action is logged and narratable.

### Story 4.1 — Agent runtime + audit log

**As a** user of Trace,
**I want** a per-agent audit log of everything any agent did,
**So that** I can see who's working in my glass kitchen and disable any agent that makes me uncomfortable.

**Acceptance Criteria:**
- [ ] AC-001: A lightweight in-process agent runtime supports registering multiple named agents (capture, redaction) that subscribe to capture events.
- [ ] AC-002: Every agent action is written to a local `agent_audit` table with: agent name, action type, session ID (if relevant), timestamp, outcome, brief human-readable summary.
- [ ] AC-003: Agent audit log is surfaced in (a) the per-session right rail (see Epic 5) and (b) the Privacy dashboard totals.
- [ ] AC-004: Each agent can be individually disabled in Settings → Capture. Disabling one agent does not break the others or capture itself.
- [ ] AC-005: Runtime enforces a per-agent timeout; a stuck agent does not block the capture pipeline.

**Design reference:** [UX doc — Flow 3 session detail right rail](../planning-artifacts/ux-design-trace-oss-launch.md#flow-3--session-detail-view), [Flow 6 Privacy dashboard](../planning-artifacts/ux-design-trace-oss-launch.md#flow-6--privacy-dashboard)
**Technical notes:** In-process only for OSS launch (Anthropic SDK calls from V1 agents are BYOK and out of scope here). Audit log is append-only, written in the same transaction as the session insert where possible.
**Estimated effort:** M
**PRD refs:** REQ-050, REQ-054, REQ-055

---

### Story 4.2 — Capture agent: rule-based auto-titling

**As a** user scanning my Today view,
**I want** each session to have a short, descriptive title,
**So that** I can scan 20 sessions in 5 seconds and find the one I want.

**Acceptance Criteria:**
- [ ] AC-001: Every captured session gets a title derived from the first user prompt, truncated to ~60 chars, with trailing ellipsis if truncated.
- [ ] AC-002: Leading/trailing whitespace and code-fence markers are stripped before truncation.
- [ ] AC-003: Sessions with no clear user prompt (e.g., system-only interactions) fall back to a title template like `{tool} session · {time}`.
- [ ] AC-004: Capture agent tags every session with source tool, model, timestamp, turn count, and the auto-title.
- [ ] AC-005: Agent-generated titles via Haiku are explicitly NOT in scope (V1 feature).

**Design reference:** [UX doc — session card](../planning-artifacts/ux-design-trace-oss-launch.md#flow-2--seeing-todays-captured-work-today-view)
**Technical notes:** Pure function, unit-testable with a fixture table of prompts → titles. Don't LLM this.
**Estimated effort:** S
**PRD refs:** REQ-050, REQ-051

---

### Story 4.3 — Redaction agent + inline + preview surfaces

**As a** Team Lead (priming V1 trust),
**I want** Trace to detect sensitive content in every session and show me what *would* be redacted if pushed,
**So that** I trust the redaction model before V1 multiplayer lets me push anything.

**Acceptance Criteria:**
- [ ] AC-001: For every captured session, the redaction agent scans for: email addresses, phone numbers (E.164-ish), credit card numbers (Luhn-validated), API keys (provider-prefix patterns), OAuth tokens, SSNs, obvious client/company names (configurable wordlist).
- [ ] AC-002: Flagged items are stored in a `redaction_flags` table linked to the session — the captured session itself is NEVER auto-modified.
- [ ] AC-003: Session detail right rail shows flagged-item counts by category.
- [ ] AC-004: Redaction preview overlay (see Story 5.5) shows a side-by-side "as captured" vs. "what would be redacted if pushed" diff.
- [ ] AC-005: 30-session synthetic test matrix passes — each category detected in every test session that contains it (no false negatives on the matrix).
- [ ] AC-006: Detection rules live in `_bmad/docs/redaction-rules.md` (new file) so future contributors can propose patterns via PR.
- [ ] AC-007: Agent action is recorded to the audit log with counts-by-category (not the detected values themselves).

**Design reference:** [UX doc — Flow 3 redaction preview](../planning-artifacts/ux-design-trace-oss-launch.md#flow-3--session-detail-view)
**Technical notes:** Regex + heuristics; no LLM call required for OSS launch. Client/company name detection is the fuzziest category — start with a small wordlist and explicit document of known limitations.
**Estimated effort:** L
**PRD refs:** REQ-052, REQ-053, REQ-054

---

## Epic 5 — Session Timeline & Detail UI

The surfaces users actually look at. These views turn the capture substrate into a product. The Privacy dashboard in particular is the GTM asset — built to be screenshotted.

### Story 5.1 — Today view (timeline, cards, grouping, empty states)

**As a** Senior IC opening Trace after a morning of AI work,
**I want** to see a clean, human log of every AI session I ran today, grouped by hour,
**So that** I can retrace my thinking without opening 5 different apps.

**Acceptance Criteria:**
- [ ] AC-001: Today view lists sessions in reverse chronological order, grouped by hour.
- [ ] AC-002: Each session card shows: timestamp, tool, model, auto-title, turn count, duration, `🟢 local only` badge, [Open] [Delete] [•••] actions.
- [ ] AC-003: Same-tool back-to-back sessions within 60s are collapsed into a single "conversation" card that expands on click.
- [ ] AC-004: "This week" and "All time" views use day-header grouping.
- [ ] AC-005: Empty state (no sessions ever) shows the v1.1 reframe copy: *"Trace is watching {N} tools. Start a session in {Claude/Cursor/ChatGPT} and it'll show up here — ready to hand off to a teammate when V1 ships."* Footer: *"Nothing has left this device."*
- [ ] AC-006: Empty state (nothing today but history exists) shows *"Nothing yet today. [See yesterday →]"*.
- [ ] AC-007: Disconnected-tool inline card: *"Claude Desktop stopped reporting. [Check Tools & Sources]"* appears when a configured tool has not reported for >10 min.

**Design reference:** [UX doc — Flow 2](../planning-artifacts/ux-design-trace-oss-launch.md#flow-2--seeing-todays-captured-work-today-view)
**Technical notes:** Virtualize the list (`@tanstack/react-virtual`) for "All time" view. Keep metadata query cheap — content stays encrypted and is lazy-decrypted on open.
**Estimated effort:** L
**PRD refs:** REQ-071

---

### Story 5.2 — Session detail (threaded view, right rail, footer actions)

**As a** user clicking a session card,
**I want** to see the full session with every turn, metadata, and what agents did to it,
**So that** I can understand, copy, or delete it.

**Acceptance Criteria:**
- [ ] AC-001: Session detail shows a threaded view of turns (prompt / response) exactly as captured.
- [ ] AC-002: Header shows tool icon, model, timestamp, turn count, `🟢 stored locally — never transmitted` indicator.
- [ ] AC-003: Collapsible right rail shows metadata (source app, model, tokens) + agents section (capture + redaction activity with per-agent sub-sections).
- [ ] AC-004: Footer actions work: [Copy markdown] copies the full session as markdown to clipboard; [Delete] opens a confirm dialog and then permanently deletes from local store; [Preview redaction] opens the overlay from Story 5.5.
- [ ] AC-005: Decryption happens on-demand when the detail opens, not at list-render time.
- [ ] AC-006: Large sessions (>100 turns) render without UI stall; use progressive rendering or virtualization.

**Design reference:** [UX doc — Flow 3](../planning-artifacts/ux-design-trace-oss-launch.md#flow-3--session-detail-view)
**Technical notes:** Markdown export uses a stable, documented template — conforms to the capture-protocol repo's export schema.
**Estimated effort:** L
**PRD refs:** REQ-072

---

### Story 5.3 — Tools & Sources dashboard

**As a** user wanting to see (and control) every capture path,
**I want** a single dashboard showing each tool's live status with pause/disconnect per tool,
**So that** I can show a skeptical teammate "here's exactly what's being captured, and nothing else."

**Acceptance Criteria:**
- [ ] AC-001: Tools & Sources page lists every configured capture path: Claude Desktop, Cursor, ChatGPT web, Claude.ai web, Perplexity web, OpenAI API, Anthropic API.
- [ ] AC-002: Each row shows: live status (Live / Paused / Not connected), last-capture timestamp, capture method (e.g., "via macOS Accessibility", "via browser extension", "via local proxy"), [Pause] [•••] actions.
- [ ] AC-003: [Pause] toggles capture for that tool without affecting others.
- [ ] AC-004: [•••] menu includes [Disconnect] which removes the tool from the configured list and revokes any associated auth (e.g., per-site extension permission).
- [ ] AC-005: Not-connected rows show a [Install extension] or [Grant access] action appropriate to the tool.
- [ ] AC-006: Live status updates in real-time when a tool connects/disconnects (no refresh required).

**Design reference:** [UX doc — Flow 4](../planning-artifacts/ux-design-trace-oss-launch.md#flow-4--tools--sources)
**Technical notes:** Source of truth is the capture-state store in the main process; view subscribes.
**Estimated effort:** M
**PRD refs:** REQ-073

---

### Story 5.4 — Privacy dashboard (the GTM asset)

**As a** user or a security-conscious observer,
**I want** a single page that answers "what does Trace know and what has left this device?",
**So that** I can screenshot it and recommend Trace to my team without equivocation.

**Acceptance Criteria:**
- [ ] AC-001: Privacy dashboard shows four sections: Stored on this device / Left this device / Telemetry sent / Agents that have run.
- [ ] AC-002: "Stored on this device" shows session count, total size, encryption status, and actions [Open storage folder] [Export] [Delete all].
- [ ] AC-003: "Left this device" shows `✓ Nothing. Ever.` for OSS launch, with annotation *"(Push is a V1 feature; not available yet.)"*.
- [ ] AC-004: "Telemetry sent" shows install-counter and crash-report counts with exact send timestamps + [Change preferences] link.
- [ ] AC-005: "Agents that have run" shows per-agent totals (sessions watched, sensitive items flagged) + [View agent audit log] link.
- [ ] AC-006: Page is visually polished enough to screenshot and share on social — Shenhav signs off on composition before launch.
- [ ] AC-007: Every number on the page reflects real, current app state — no placeholders.

**Design reference:** [UX doc — Flow 6](../planning-artifacts/ux-design-trace-oss-launch.md#flow-6--privacy-dashboard)
**Technical notes:** This page IS the ad. Treat polish here as a marketing deliverable, not a dev chore. Export the page as a standalone marketing screenshot for the site.
**Estimated effort:** M
**PRD refs:** REQ-074

---

### Story 5.5 — Settings + Redaction preview overlay

**As a** user adjusting app behavior (and inspecting what would be redacted),
**I want** a Settings window with tabs (General / Capture / Telemetry / API keys / Data & privacy / About) and a redaction preview overlay from session detail,
**So that** I can configure Trace and trust the redaction model.

**Acceptance Criteria:**
- [ ] AC-001: Settings window opens via `⌘,` and from the sidebar; exposes six tabs matching the UX doc.
- [ ] AC-002: Each tab's controls match the UX doc: General (launch + menubar display), Capture (agents, redaction rules pointer, retention), Telemetry (re-exposed opt-in toggles), API keys (per Story 2.2), Data & privacy (per Story 3.3), About (version, license, source link, build hash).
- [ ] AC-003: Redaction preview overlay opens from session detail's [Preview redaction] footer action.
- [ ] AC-004: Overlay shows side-by-side "As captured" vs. "What would leave your device if pushed."
- [ ] AC-005: Each flagged item is highlighted yellow with its detection category (API key / email / client name / etc.) and a per-item accept/reject toggle.
- [ ] AC-006: Overlay clearly communicates: "This is informational. There is no push target in OSS launch — this view exists to build trust before V1 ships."
- [ ] AC-007: Toggling accept/reject persists the decision per-session for when V1 push lands (forward-compat).

**Design reference:** [UX doc — Flow 5 Settings](../planning-artifacts/ux-design-trace-oss-launch.md#flow-5--settings), [Flow 3 redaction preview](../planning-artifacts/ux-design-trace-oss-launch.md#flow-3--session-detail-view)
**Technical notes:** Settings is a shadcn Tabs component inside the main window. Redaction overlay is a Dialog with the custom `RedactionDiffView` component.
**Estimated effort:** L
**PRD refs:** REQ-075, REQ-080, REQ-081, REQ-082

---

## Epic 6 — Telemetry (opt-in)

Tiny epic, big integrity stakes. Two opt-in pings, both default OFF, nothing else ever phones home. If this epic leaks, the whole launch narrative is compromised.

### Story 6.1 — Opt-in install counter (PostHog OSS self-host)

**As a** Trace team member measuring adoption,
**I want** a one-time install-counter ping from users who opt in,
**So that** we have an honest install number without betraying the integrity narrative.

**Acceptance Criteria:**
- [ ] AC-001: Install counter ping is sent exactly once per install, only if user toggled ON the install-counter consent (default OFF).
- [ ] AC-002: Ping payload contains an anonymous install UUID and nothing else — no OS version, no session data, no IP (server-side stripping if needed).
- [ ] AC-003: Destination is a self-hosted PostHog OSS instance under the Trace team's control.
- [ ] AC-004: If the ping fails (network error, destination unreachable), it is NOT retried — one-shot.
- [ ] AC-005: Preferences re-exposed in Settings → Telemetry with identical plain-English copy from first-run.
- [ ] AC-006: No captured content, no usage analytics, no behavioral events are collected by PostHog beyond the install event itself.

**Design reference:** [UX doc — Flow 1 step 3, Flow 5 Telemetry](../planning-artifacts/ux-design-trace-oss-launch.md)
**Technical notes:** Set up the PostHog OSS instance as part of Epic 7. Rails here: `posthog-js` with strict event allowlist — reject all non-install events at compile time.
**Estimated effort:** S
**PRD refs:** REQ-090, REQ-091, REQ-092, REQ-093, REQ-094

---

### Story 6.2 — Opt-in crash reporting (Sentry OSS self-host)

**As a** Trace team member fixing crashes,
**I want** crash reports from users who opt in, without any session content,
**So that** we can actually reach the 99% crash-free target without reading anyone's prompts.

**Acceptance Criteria:**
- [ ] AC-001: Crash reports are sent only when the crash-report consent is toggled ON (default OFF).
- [ ] AC-002: Reports contain stack traces, app version, OS version, and anonymous install UUID only — no captured content, no session IDs, no user-identifiable data.
- [ ] AC-003: Destination is a self-hosted Sentry OSS instance under the Trace team's control.
- [ ] AC-004: `beforeSend` hook scrubs any accidental PII (file paths containing home dir, etc.) before transmission.
- [ ] AC-005: Preferences re-exposed in Settings → Telemetry.
- [ ] AC-006: Opt-in subset of crashes is the signal source for success metric M8 (crash-free rate ≥ 99%).

**Design reference:** [UX doc — Flow 1 step 3](../planning-artifacts/ux-design-trace-oss-launch.md)
**Technical notes:** `@sentry/tauri` or rolling our own thin reporter. Verify `beforeSend` scrubbing with a test matrix of synthetic stack traces containing fake PII.
**Estimated effort:** S
**PRD refs:** REQ-090, REQ-091, REQ-092, REQ-093, REQ-094

---

## Epic 7 — OSS Launch Infrastructure

The non-code work that makes Trace a credible OSS launch. If this epic slips, the code could ship but the *launch* can't.

### Story 7.1 — Public GitHub repo + FSL-1.1-Apache-2.0 license + CLA

**As a** prospective contributor,
**I want** to land on the Trace repo and immediately understand the license, contribution path, and governance,
**So that** I don't waste my time or fear being sued.

**Acceptance Criteria:**
- [ ] AC-001: Two public repos exist in the Trace GitHub org: one for the client+extension (FSL-1.1-Apache-2.0), one for the capture protocol (Apache 2.0).
- [ ] AC-002: Each repo has `README.md`, `LICENSE`, `GOVERNANCE.md`, `SECURITY.md` (with a linked `security.txt`), `CONTRIBUTING.md`.
- [ ] AC-003: cla-assistant.io is wired up; every PR requires CLA sign-off before merge.
- [ ] AC-004: Branch protection on `main`: required reviews (≥1), required CI checks (tests + license scan + signed-build smoke), no force-push.
- [ ] AC-005: First commit is made only after OSS-licensing counsel sign-off.
- [ ] AC-006: README hero states the product identity + the team-collab framing + license + install link, above the fold.

**Design reference:** n/a (docs + repo)
**Technical notes:** License is irreversible after first external commit. Do NOT open the repo to outside contributions until counsel has reviewed.
**Estimated effort:** M
**PRD refs:** REQ-100, REQ-101, REQ-102

---

### Story 7.2 — Release signing + SBOM + dependency license audit

**As a** security-conscious user auditing Trace's supply chain,
**I want** every release to be signed and accompanied by an SBOM with no license landmines,
**So that** I can verify provenance and recommend Trace to my team with confidence.

**Acceptance Criteria:**
- [ ] AC-001: Every tagged release on GitHub includes a signed `.dmg`, signed browser-extension packages, an SBOM (SPDX or CycloneDX), and SHA256 checksums.
- [ ] AC-002: `cargo audit` + npm audit + license-scanning tool (ScanCode or FOSSA) runs on every PR; a license finding outside an approved allowlist blocks merge.
- [ ] AC-003: First public commit happens only after a clean dependency license audit — no GPL transitive leaking into the FSL distribution.
- [ ] AC-004: Release process is documented in `RELEASING.md` in the repo.
- [ ] AC-005: Signing keys are stored in GitHub Actions encrypted secrets with clear rotation documentation.

**Design reference:** n/a (infra + process)
**Technical notes:** SBOM generation via `syft` or equivalent. Allowlist: Apache-2.0, MIT, BSD-2/3, ISC, MPL-2.0 (file-level). Reject GPL, AGPL, LGPL in any form for the FSL-distributed binary.
**Estimated effort:** M
**PRD refs:** REQ-103, REQ-104

---

### Story 7.3 — Marketing site at `trace.<domain>`

**As a** visitor arriving from Hacker News or Twitter,
**I want** a fast, honest landing page that explains what Trace does and lets me install it in under a minute,
**So that** my first impression is calm confidence, not marketing noise.

**Acceptance Criteria:**
- [ ] AC-001: Site at `trace.<domain>` (domain TBD pending name lock) ships with: hero + tagline + 20s demo loop (menubar + Today view), Privacy-dashboard screenshot as the centerpiece, "how it works" tier diagram, founder story (Tal + Shenhav), install + GitHub + license links.
- [ ] AC-002: Site does NOT include testimonials, enterprise logos, or customer quotes.
- [ ] AC-003: Site hero states the team-collab framing from v1.1: Trace is a collaboration tool for design+dev teams, not a personal AI brain.
- [ ] AC-004: Site is built on Next.js + Vercel and open-sourced in the Trace GitHub org under the same FSL license.
- [ ] AC-005: Site hits Lighthouse 95+ for Performance, Accessibility, Best Practices, SEO on mobile and desktop.
- [ ] AC-006: Install CTA resolves to the signed `.dmg` via a stable, versioned URL.

**Design reference:** [UX doc — Marketing site section](../planning-artifacts/ux-design-trace-oss-launch.md#marketing-site-v0--not-part-of-the-app-but-gated-together-at-launch)
**Technical notes:** Demo loop is a looping MP4/WebM, not a JS animation — keeps the page cheap and offline-screenshot-friendly.
**Estimated effort:** M
**PRD refs:** REQ-110, REQ-111, REQ-112

---

## Story → PRD requirement coverage

Every REQ from the PRD maps to at least one story.

| REQ range | Epic(s) | Notes |
|---|---|---|
| REQ-001–005 | Epic 1 | Install + first-run + permission denial path |
| REQ-010–014 | Epic 2 (2.1, 2.2) | Tier 0 proxy + keys |
| REQ-020–025 | Epic 2 (2.3, 2.4) | Tier 2 extension |
| REQ-030–033 | Epic 2 (2.5) | Tier 3 native, conditional |
| REQ-040–045 | Epic 3 | Storage + retention |
| REQ-050–055 | Epic 4 | Agents |
| REQ-060–063 | Epic 1 (1.2) | Menubar |
| REQ-070–075 | Epic 1 (1.3) + Epic 5 (5.1–5.5) | Main window + views |
| REQ-080–082 | Epic 5 (5.5) | Redaction preview |
| REQ-090–094 | Epic 6 | Telemetry |
| REQ-100–104 | Epic 7 (7.1, 7.2) | OSS repo + license + signing |
| REQ-110–112 | Epic 7 (7.3) | Marketing site |
| REQ-120–124 | Epics 2, 3, 5 | Error states distributed across owning surfaces |

---

## Week-by-week rollup (maps to PRD §11)

| Week | In flight | Done by EOW |
|---|---|---|
| W1 | 1.1 Tauri scaffold · 7.1 repo+license · 2.5 Tier 3 spike · 1.2 menubar shell | MCP spike result locked, signed `.dmg` pipeline green, repo public (internal only, pre-external-commits) |
| W2 | 3.1 SQLite · 3.2 encryption · 2.1 Tier 0 proxy · 2.2 API keys · 4.1 agent runtime · 4.2 auto-titling | BYOK captures one session end-to-end |
| W3 | 2.3 browser extension · 2.4 extension IPC · 1.3 main window shell · 5.1 Today view | ChatGPT/Claude.ai/Perplexity → Today view end-to-end |
| W4 | 2.5 Tier 3 capture · 4.3 redaction · 5.3 Tools & Sources · 5.4 Privacy dashboard · 3.3 retention/export | **Tier 3 GO/NO-GO call.** Claude Desktop + Cursor in Today view; Privacy dashboard screenshot-ready |
| W5 | 5.2 session detail · 5.5 Settings + redaction overlay · 1.4 onboarding · 1.5 a11y pass · 6.1 install counter · 6.2 crash reporting | Dogfood build; founders daily-drive it |
| W6 | 7.2 signing+SBOM+audit · 7.3 marketing site · bug fixes from dogfooding | **Public release + launch post** |

---

## Recommended next steps

1. **Resolve §10 open questions before kickoff** — especially engineering capacity (blocks Tauri vs. Electron) and Apple Developer account ownership (blocks Story 1.1).
2. **Share this doc with Shenhav** — confirm the scope split feels right to a co-founder actually building it, not just the doc author.
3. Run `/bmad-agent-sm` → **SP (sprint planning)** to slot these stories into the 6-week plan with day-level estimates.
4. Run `/bmad-agent-architect` → **IR (implementation readiness)** to check for hidden technical risks per story before W1 starts.
5. Draft `_bmad/docs/redaction-rules.md` as called out in Story 4.3 AC-006.
