# UX Design — Trace OSS Launch (single-player)

**Status:** Draft v1
**Date:** 2026-04-20
**Brief:** [`brief-collab-capture-layer.md`](brief-collab-capture-layer.md)
**Tech research:** [`technical-research-trace-stack.md`](../docs/technical-research-trace-stack.md)
**Founders (both designers):** Tal + Shenhav

> **Scope:** the 6-week OSS-launch milestone only. Single-player, local-only, macOS. Multiplayer UX is a separate doc after OSS launch ships.

---

## Design Goal

Make Trace feel like **the quiet layer your team's AI work lives on** — always on, never creepy, and clearly in service of the handoff between teammates. The install-to-first-capture moment must turn skepticism into relief. Every surface must earn the right to watch AI work by visibly respecting the user and making the collaboration story legible from day one (even though full multiplayer ships in V1, not OSS launch).

**North-star feel:** *"Oh — I can see what it's doing, I'm in charge of all of it, and I can already picture my teammate picking this up."*

> **Scope reminder:** OSS launch ships single-player + local-only. The team-handoff surface (push/branch/diff, Linear-like view, GitHub-like push history, Slack/Teams/email, Windows+Linux clients, hosted backend, 15-min full-access trial) ships in V1 (~4–5 months after OSS launch). The UX here must **plant seeds** of the collaboration story — surface hints, redaction preview of "what would leave if pushed," copy that says "so your team can pick up where you left off" — without overclaiming what's actually live yet.

---

## UX Principles (non-negotiable for OSS launch)

1. **Transparent by default.** Every agent's action is visible and narratable. Never a black box.
2. **Local-first, visibly.** The UI always shows where data lives ("🟢 local only — nothing has left this device").
3. **Plain English everywhere.** No jargon, no lawyer-speak, no dark patterns.
4. **Control is one click away.** Pause capture, disable a tool, delete a session — never more than one click from the menubar.
5. **Warmth over minimalism.** Not Stripe-cold, not enterprise-dense. Human, calm, optimistic — in the Linear/Arc spirit.
6. **Designer-founder-operated.** Shenhav owns the visual system; UI patterns stay deliberate and restrained. No component sprawl.

---

## User & Context

**Primary persona:** *Senior IC on a design + dev team* who lives in 3+ AI tools daily and keeps hitting the wall where their AI session can't cross tool boundaries to a teammate. Designer using Claude Design + Figma AI, or developer using Cursor + VS Code's AI — either way, their AI work is trapped and they're pasting screenshots into Slack to bridge the gap. Technical enough to install a native macOS app, savvy enough to be suspicious of a "layer that sees everything."

**Entry point:** downloads the `.dmg` from the marketing site after seeing it on Twitter, Hacker News, a friend's recommendation, or the Trace GitHub README. Frequently arriving with a co-worker in mind — *"if this works, I want to send it to [designer/developer teammate]."*

**Intent:** *"Let me try this. If it's creepy, I'm uninstalling. If it works, I'm sending it to my teammate."*

**First-five-minute goal (OSS launch):** install → grant minimum permissions → see ONE session captured from a tool they already use → feel the relief of *"oh, this is actually not scary"* — and crucially, start imagining the V1 moment where that captured session becomes a handoff to a teammate.

**First-fifteen-minute goal (V1, not OSS launch):** every feature unlocked — push/branch/diff, Linear-like view, Slack/Teams integrations, all tool coverage — no signup wall, no feature gates. At 15 min, paid features lock behind the subscription. The trial is a **feeling**, not a timer bar: the user should feel the whole product before anything asks them for money. *Out of scope for OSS launch UX; documented here so the onboarding scaffolding in OSS launch is forward-compatible.*

---

## Information Architecture

Trace is a **menubar-primary app** with a main window for deeper exploration.

```
╭─────────────────────────────────────────╮
│  macOS menubar                          │
│  …  🟢 Trace  [14 sessions today]       │  ← always-visible
╰─────────────────────────────────────────╯
       │ click
       ▼
╭─────────────────────────────────────────╮
│  Menubar popover (280pt wide)           │
│  ─────────────────────────────────────  │
│  🟢 Capturing · 3 apps · local only     │
│                                         │
│  Today: 14 sessions                     │
│  • Claude Desktop  · 5                  │
│  • Cursor         · 6                   │
│  • ChatGPT web    · 3                   │
│                                         │
│  [⏸  Pause capture]  [Open Trace →]    │
╰─────────────────────────────────────────╯
       │ "Open Trace"
       ▼
╭─────────────────────────────────────────╮
│  Main window (960×680)                  │
│  Sidebar: Today | This week | All time  │
│          Tools & Sources                │
│          Settings                       │
│  Main: session timeline / detail        │
╰─────────────────────────────────────────╯
```

**Why menubar-primary:** Trace is a background tool, not a destination. The main window is for when you *want* to look. The menubar is the always-on "yes, it's working, here's what it's doing."

**Dock icon:** YES, keep it. A hidden menubar app feels sneakier than one with a visible dock presence — runs counter to the transparency principle. The dock icon is part of the trust signal.

---

## User Flows

### Flow 1 — First-run onboarding (install → first capture)

**Target: under 5 minutes, with zero surprises.**

| # | Screen | User sees | User does | System does |
|---|---|---|---|---|
| 1 | Welcome | "Welcome to Trace. Trace carries your AI work between tools — and, when your team is on it, between teammates. Today we're in OSS launch: single-player, local-only. Multiplayer handoff ships in V1." + tagline + one-sentence privacy promise + [Get started] | Clicks Get started | — |
| 2 | How it works | 3 dot-points with illustrations: (1) Trace watches the AI tools *you choose* (Claude Desktop, Cursor, ChatGPT, Perplexity, your API key), (2) Everything stays on your Mac until you push it — and in OSS launch there's nothing to push to yet, (3) When V1 ships, pushing a session hands it to a teammate in their preferred tool — designer's Claude Design session picked up by a developer in VS Code, and back. | Clicks Continue | — |
| 3 | Telemetry consent | Two plain-English toggles, both OFF by default: "Help us count installs? (+1 only, no content)" and "Send crash reports if Trace breaks?" + [Continue] | Decides each | Persists consent |
| 4 | Connect your tools | Checklist of capture paths — each shows current status: ① API keys (empty → [Add key]) ② Browser extension (not installed → [Install from Chrome Web Store]) ③ Claude Desktop (no permission → [Grant access]) ④ Cursor (no permission → [Grant access]) | Connects at least one | Validates each |
| 5 | Accessibility permission (if user chose Claude Desktop or Cursor) | Plain-English explainer panel FIRST, then macOS system dialog. Panel text: "macOS will ask if Trace can read content from Claude Desktop. This is how Trace captures sessions. We only read what's on screen in the apps you selected. Nothing else." + [Open System Settings] | Clicks, grants permission | Deep links to System Settings |
| 6 | First-run celebration | "You're set. Trace is now watching {N} tools. Go work in {Claude/Cursor/ChatGPT} for a minute, then come back." + [Done] | Closes window | Menubar indicator goes green |
| 7 | (User goes and uses Claude) | — | Runs a session in Claude Desktop | Captures it |
| 8 | Return — Today view | First session appears in timeline: "Claude Desktop · 2 min ago · [session title auto-generated]" | Clicks it | Opens session detail |

**Edge cases:**

| Situation | Behavior |
|---|---|
| User skips tool connection | Continue is enabled but labeled "I'll connect tools later" — never forced. |
| User denies Accessibility permission | Clear message: "No problem. Claude Desktop and Cursor won't be captured, but your API keys and browser extension still work." Offer to revisit in Settings. |
| Accessibility permission granted but app not running | Session capture starts as soon as the target app launches. Menubar indicator updates. |
| No sessions captured after 10 minutes | Soft nudge in menubar popover: "Nothing captured yet. Try Claude, Cursor, or ChatGPT in your browser. If you think something's wrong, [check Tools & Sources]." |

### Flow 2 — Seeing today's captured work (Today view)

The moment of product truth. Must feel like "a clean, human log of my AI day."

**Layout:**
- **Sidebar (220pt):** sections → Today / This week / All time / Tools & Sources / Settings / Privacy dashboard
- **Main area:** reverse-chronological session cards grouped by hour, with "now" at the top

**Session card (preview state, collapsed):**
```
╭─────────────────────────────────────────────────────────╮
│  2:47 PM · Claude Desktop · claude-opus-4-7             │
│                                                         │
│  "Refactor the onboarding flow into steps"              │  ← auto-title from first prompt
│                                                         │
│  3 turns · 4 min · 🟢 local only                        │
│                                                         │
│  [Open] [Delete] [•••]                                  │
╰─────────────────────────────────────────────────────────╯
```

**Grouping rules:**
- Within an hour: individual cards
- Across days: day headers ("Monday, April 20")
- Same-tool back-to-back sessions within 60s: collapse into one "conversation" (user can expand)

**Empty states:**

| State | Copy + pattern |
|---|---|
| No sessions ever | Big calm illustration. "Trace is watching {N} tools. Start a session in {Claude/Cursor/ChatGPT} and it'll show up here — ready to hand off to a teammate when V1 ships." Footer: "Nothing has left this device." |
| No sessions today (but history exists) | "Nothing yet today. [See yesterday →]" |
| Tool disconnected | Inline card: "Claude Desktop stopped reporting. [Check Tools & Sources]" |

### Flow 3 — Session detail view

Open a captured session; see what Trace recorded.

**Layout:**
- **Header:** tool icon, model, timestamp, turn count, source indicator ("🟢 stored locally — never transmitted")
- **Body:** the session as a threaded conversation, each turn showing prompt / response exactly as captured
- **Right rail (collapsible):** metadata — source app, model, tokens, goal (if Trace inferred one), agents involved (capture agent, redaction agent), agent activity log

**Agent activity log (right rail):**
```
Agents
───────────────
🟢 Capture agent
   Captured 3 turns · 2:47–2:51 PM

🟡 Redaction agent
   Detected 1 potential secret (API key)
   → You haven't pushed this anywhere.
   [Preview redaction]
```

**Actions (footer):**
- [Copy markdown] — export session as markdown
- [Delete] — permanently delete from local store (with confirm dialog)
- [Preview redaction] — opens the redaction preview overlay

**Redaction preview overlay:**
Side-by-side diff: "As captured" vs. "What would leave your device if pushed." Redacted items highlighted yellow with the category ("API key," "email address," "client name"). Toggle per item to accept/reject the redaction suggestion. **In OSS launch there's no push target yet — this view's role is to build trust and muscle memory before v1 multiplayer ships.**

### Flow 4 — Tools & Sources

Dashboard of every capture path Trace is using. Per-tool: live status, last capture, [Pause] button, [Disconnect].

```
Tools & Sources
═══════════════

● Claude Desktop                 Last: 2 min ago · Live
  via macOS Accessibility        [Pause] [•••]

● Cursor                         Last: 12 min ago · Live
  via macOS Accessibility        [Pause] [•••]

● ChatGPT web                    Last: 1 h ago · Live
  via browser extension          [Pause] [•••]

● OpenAI API (personal key)      Last: 3 h ago · Live
  via local proxy                [Pause] [•••]

○ Perplexity web                 Not connected
  via browser extension          [Install extension]

○ Claude.ai web                  Not connected
  via browser extension          [Install extension]
```

**Why a dedicated screen:** part of the integrity GTM. Every installer should be able to see, at a glance, "here's exactly what's being captured and nothing else."

### Flow 5 — Settings

Sections (left-side sub-nav):
1. **General** — app launch, menubar display options
2. **Capture** — capture agent settings, default redaction rules, data retention (default 30 days, configurable)
3. **Telemetry** — re-expose the two opt-in toggles with same plain-English copy
4. **API keys** — BYOK entry + test button + "Trace never sees these keys leave this device"
5. **Data & privacy** — [Export all data] [Delete all data] [Open the storage folder]
6. **About** — version, license (FSL-1.1-Apache-2.0), [View source on GitHub], build hash

### Flow 6 — Privacy dashboard

A single page, accessible from sidebar + from the first-run welcome. Answers: *"What does Trace know, and what has ever left this device?"*

```
Privacy dashboard
═════════════════

Stored on this device
  · 127 sessions
  · 48 MB · encrypted with your key
  · [Open storage folder] [Export] [Delete all]

Left this device
  ✓ Nothing. Ever.
  (Push is a v1 feature; not available yet.)

Telemetry sent
  · Install counter: 1 ping on {date}
  · Crash reports: 0
  [Change preferences]

Agents that have run
  · Capture agent — 127 sessions watched
  · Redaction agent — 14 potential sensitive items flagged
  [View agent audit log]
```

**This page exists to be screenshotted and shared on Twitter.** It IS the trust GTM.

---

## Component inventory (shadcn/ui + custom)

| Component | Source | Purpose |
|---|---|---|
| Button | shadcn | primary/secondary actions |
| Dialog | shadcn | permission explainers, delete confirm |
| Tabs | shadcn | Settings sub-nav |
| Switch | shadcn | Telemetry + per-tool pause |
| Alert | shadcn | Tool disconnected, errors |
| Card | shadcn | Session cards, Tool rows |
| Separator | shadcn | section breaks |
| ScrollArea | shadcn | Timeline list |
| Badge | shadcn | "Live", "Paused", "Local only" |
| **CaptureIndicator** (custom) | — | Menubar status chip with pulse animation |
| **AgentLogEntry** (custom) | — | One line in an agent audit log |
| **RedactionDiffView** (custom) | — | Side-by-side captured vs. redacted |
| **EmptyStateIllustration** (custom) | — | Warm, hand-drawn feel; Shenhav's zone |

---

## Copy system

**Voice:** confident, calm, warm. Human-written, not marketing-drafted. Short sentences.

**Key phrases (reuse everywhere):**
- "Nothing has left this device."
- "Local only."
- "You're in charge of every action."
- "Trace your team's AI work." (tagline)
- "Pick up where your teammate left off." (V1 positioning — safe to foreshadow in OSS launch copy)
- "🟢 Capturing · {N} apps · encrypted locally"

**Never use:**
- "AI-powered" (vague, feels 2023)
- "Revolutionary" (marketing tell)
- "We value your privacy" (boilerplate)
- "Enterprise-grade" (wrong audience)
- Passive voice in error messages ("an error occurred" → "Trace couldn't reach Claude Desktop.")

**Error-message pattern:**
`[What happened]. [What Trace is doing about it]. [What the user can do].`
Example: *"Claude Desktop stopped reporting. Trace is retrying every 30s. You can force a refresh in Tools & Sources."*

---

## Accessibility

- [ ] Every interactive element keyboard-reachable; tab order follows visual order
- [ ] Every icon-only button has an `aria-label`
- [ ] Color is never the only status indicator (pair 🟢 with text "Capturing")
- [ ] System-preference for "reduce motion" disables the menubar pulse animation
- [ ] Respect macOS VoiceOver — session timeline is a structured list, not a div soup
- [ ] Settings tabs are a proper ARIA tablist
- [ ] Redaction diff view announces changes to screen readers
- [ ] Color contrast meets WCAG AA on both light and dark mode

---

## Platform notes (macOS-specific)

- **Dark mode + light mode** both ship at launch. Match system preference by default; manual override in Settings → General.
- **Menubar icon** adapts to menubar tint (Mac menubar can be light or dark).
- **Window controls:** standard macOS traffic-light position; no custom chrome.
- **Keyboard shortcuts:**
  - `⌘,` — open Settings
  - `⌘K` — open Today view from anywhere
  - `⌘\\` — pause/resume capture (toggle)
  - `⌘⇧D` — open Privacy dashboard
- **Menubar app installs via standard .dmg drag-to-Applications.** No installer wizard.

---

## Visual direction (for Shenhav)

- **Mood board vibe:** Linear's calm + Arc's warmth + Things 3's craft. Avoid Figma-loudness, avoid enterprise-greyness.
- **Palette:** neutral off-white / soft dark. Accent color carries the status pulse (suggest: a calm green — not Slack's, more like `#3FB68B`). Redaction yellow: `#F4C95D`. Danger red: used only for destructive actions.
- **Typography:** system font for UI chrome (SF Pro on macOS); Inter or similar for content. Comfortable line-height; generous vertical rhythm.
- **Iconography:** prefer Lucide or a custom set. Never emoji in chrome except the 🟢 status chip (deliberate — it reads as system-level, not decorative).
- **Illustration:** light, hand-drawn empty-states; human, not corporate. This is Shenhav's zone.
- **Motion:** subtle. Pulse on the menubar status is the only ambient animation. Transitions <150ms. Never bounce.

---

## Marketing site (v0 — not part of the app, but gated-together at launch)

Separate doc would go deeper, but for context:
- Hero: the tagline + a 20-second looping video of the menubar indicator + the Today view.
- Second scroll: the Privacy dashboard screenshot. That IS the ad.
- Third scroll: "how it works" — the tier diagram.
- Fourth scroll: founder story (Tal + Shenhav, short).
- Fifth scroll: license + GitHub link + install.
- No testimonials at launch. No enterprise logos. Cut that whole genre.

---

## Open design questions

- [ ] **Session auto-titling approach.** Rule-based (first prompt, truncated) vs. small agent call (a Haiku call summarizes the session into ~8 words). Second option is nicer but costs inference. Proposal: rule-based in OSS launch, Haiku-summarized titles in v1.
- [ ] **Dark mode vs. light mode default.** Dev/design audience mostly dark-moders — follow system pref either way, but the marketing hero screenshot has to pick one. Suggestion: dark, because that's where Linear/Arc/Things-3 brand energy lives.
- [ ] **Redaction preview depth at OSS launch.** Ship it now (builds muscle + trust before v1 push) or defer to v1 when there's actual push? Recommend: ship the UI in a view-only "what would be redacted" mode now.
- [ ] **Agents disclosure — how much?** Full audit log visible per session? Or a Privacy-dashboard-level summary only? Recommend: both. Per-session right rail shows which agents touched it; Privacy dashboard shows totals.
- [ ] **"Pause all" affordance.** One giant pause button in the menubar, or per-tool pause only? Recommend both — big [Pause all] button in the menubar popover, per-tool in Tools & Sources.
- [ ] **Telemetry modal vs. inline toggles on first-run step 3.** Inline toggles (current proposal) vs. a dedicated modal with more context. Toggles are less friction; modal is more explicit. Test both with Shenhav.

---

## Next steps

- [ ] Shenhav: sketch hi-fi mockups for (a) Today view, (b) first-run step 4 (connect tools), (c) Privacy dashboard, (d) menubar popover. These are the screenshots the GTM will hinge on.
- [ ] Validate against the tech-research constraints ([`technical-research-trace-stack.md`](../docs/technical-research-trace-stack.md)) — some UX choices assume the Accessibility API; verify feasibility survives the MCP-server spike in week 1.
- [ ] Run `/bmad-create-prd` — OSS-launch PRD grounded in this UX and the tech research.
- [ ] Run `/bmad-validate-prd` after PRD is drafted.
- [ ] Break into stories via `/bmad-create-epics-and-stories` once PRD is locked.
