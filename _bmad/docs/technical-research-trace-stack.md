# Technical Research — Trace Stack & Feasibility

**Date:** 2026-04-20
**Question:** What's the realistic technology stack for Trace's OSS launch (6 weeks) and v1 multiplayer (3 months later) given a two-designer founding team and the integrity-first product profile? Where are the swing risks?

> **Stack note:** BMAD's default assumption was a React+Vite web app. Trace is a **desktop capture client + browser extension + (later) hosted backend + agent fabric** — fundamentally different. This report establishes the real stack from scratch.

---

## TL;DR — recommended stack

| Layer | Pick | Why |
|---|---|---|
| **Desktop client (macOS)** | **Tauri 2** (Rust core + React/TS/Tailwind UI) | Small bundle (~10 MB vs. Electron's ~120 MB), better security profile (integrity GTM), real native macOS API access (Accessibility, Keychain), well-documented for LLM-assisted coding by 2026. |
| **UI inside the client** | React + TypeScript + Tailwind + shadcn/ui | Founders are designers; UI work is where their leverage is highest. Reused later for the v1 web app. Matches BMAD config defaults. |
| **Browser extension** | Manifest V3 + Plasmo + React/TS | Plasmo removes 80% of MV3 boilerplate. Same UI library as desktop. |
| **Local encrypted storage** | SQLite (Tauri SQL plugin) + `age` for content encryption | Boring, auditable, single-file portable. `age` is the modern OSS-friendly encryption choice. |
| **Capture — Tier 0 (API key)** | Local proxy / pass-through SDK wrappers | User points their app at `http://localhost:port`; Trace forwards to OpenAI/Anthropic and records. Zero ToS risk. |
| **Capture — Tier 2 (browser)** | MV3 content scripts on chatgpt.com, claude.ai, perplexity.ai | DOM-scraped + `fetch` interception. Routine pattern (Grammarly, ReadWise). |
| **Capture — Tier 3 (native macOS)** | macOS Accessibility API via Tauri Rust core | Highest-risk swing item. See Risks section. |
| **Agent runtime (v1 OSS — personal agents)** | In-process in the desktop client; Anthropic SDK with Claude Haiku 4.5 (cheap, fast) and prompt caching | Personal agents = capture, redaction. Run locally, no server roundtrip. Privacy story stays clean. |
| **Backend (v1 multiplayer, post-OSS launch)** | **Bun + Hono + Postgres** on Fly.io or Railway | Boring, fast, cheap to operate, small ops surface for a 2-person team. |
| **Sync engine (v1 multiplayer)** | **ElectricSQL** (Postgres + local replicas) OR custom CRDT with Yjs | ElectricSQL gives you "Postgres with sync" out of the box — huge ops win for 2 founders. Yjs is the proven CRDT alternative if ElectricSQL doesn't fit the team-graph data model. |
| **Real-time presence (v1)** | PartyKit or Liveblocks | Hosted WebSockets-with-state. Skip the "build our own WebSocket infra" rabbit hole. |
| **Auth (v1)** | WorkOS or Clerk | Don't roll your own; SSO/SAML for free when enterprise comes calling. |
| **Agent runtime (v1 system agents)** | Bun service alongside the backend; Anthropic SDK with Sonnet 4.6 + prompt caching | System agents need the team graph; live next to the data. |
| **Trademark + naming infra** | n/a — domain question | Resolved in `domain-research-oss-license-governance.md`. |

---

## Reality check before any architecture decision

**Both founders are designers.** Tal: *"I'm zero in technology."* Shenhav: design studio founder. Neither is described as a deep engineer.

**This changes everything about stack picking.** A 2-person engineering team with 6 weeks to ship a macOS desktop app + browser extension + Accessibility integration + landing page is already aggressive. **A 2-designer team without an engineer co-founder will not ship that in 6 weeks** without one of:

1. **Bringing in an engineering co-founder or first hire** before kickoff. Highest-leverage move; a senior generalist who's shipped Tauri or Electron desktop apps could compress the timeline 3–5×.
2. **Heavy reliance on LLM-assisted coding** (Cursor, Claude Code, Codeium). Plausible at 2026 quality levels — Claude Sonnet 4.6 / Opus 4.7 can scaffold a Tauri app and most of an MV3 extension competently. But edge cases (codesigning, notarization, native API quirks) still require a human who knows what they're looking at.
3. **Engineering contractor** for the macOS Accessibility integration specifically (the riskiest piece) plus any signed-distribution work.
4. **Cutting Tier 3 from the OSS launch** entirely and shipping Tier 0+2 only — much more realistic for a 2-designer team in 6 weeks. Trade the launch story for the timeline.

**This is the most important finding in the report. Stack picks below assume one of (1)–(3); without that, recommend (4).**

---

## Capture — three tiers, three different stacks

### Tier 0 — API-key bring-your-own (always-safe)

**How it works:** User installs Trace, enters their OpenAI / Anthropic / etc. API key. Trace runs a local HTTP proxy on `localhost:<port>`. User configures their tools to point at the local proxy (or installs a Trace-aware SDK wrapper). Trace forwards every call to the real provider, records the request + response, returns to the caller.

**Stack:** Tauri Rust core hosts the proxy (using `axum` or `hyper`). Or: ship a tiny standalone proxy daemon that runs alongside the Tauri client.

**Complexity:** Low. ~2–3 days for a proficient engineer. Mostly: spin up an HTTP server, forward requests, persist session metadata to SQLite.

**Risk:** Almost none. User has explicit authorization (own API key). No ToS exposure.

**Pros:** Universal; works for *any* tool that uses OpenAI/Anthropic-compatible APIs (which is most agent frameworks, custom scripts, etc.). Strong "power user" hook.
**Cons:** Doesn't capture sessions in apps that won't let you reconfigure their endpoint (Claude Desktop won't, ChatGPT-web won't). So tier 0 alone is incomplete.

### Tier 2 — Browser extension (Manifest V3)

**How it works:** Content scripts injected on `chatgpt.com`, `claude.ai`, `perplexity.ai`, `chat.openai.com`. Two capture mechanisms in parallel:
1. **DOM observation:** `MutationObserver` on the message container — captures the rendered prompt and response as the user sees them.
2. **`fetch` interception:** patch `window.fetch` to log calls to `/api/conversation` (ChatGPT) and `/api/append_message` (Claude.ai). More structured than DOM.

**Stack:** **Plasmo** framework on top of MV3. Plasmo handles the build pipeline, hot-reload, content/background script split, and message passing — removes ~80% of the MV3 ceremony.

**Complexity:** Medium. ~1.5–2 weeks for a proficient engineer to ship robust capture for the three target sites. Most of that time is dealing with each site's quirks, not the framework.

**Risk:** Low legal (browser extension is well-precedented). Medium operational: each target site can change its DOM/API anytime, breaking capture. Need a quick-turnaround update channel.

**Pros:** Covers ChatGPT-web + Claude.ai + Perplexity, which is a huge slice of "what people actually use."
**Cons:** Each new target requires a per-site capture module. Doesn't help with desktop apps.

### Tier 3 — macOS Accessibility (the swing item)

**How it works:** macOS exposes window content to apps the user grants Accessibility permission to (System Settings → Privacy → Accessibility). Trace queries the AX tree of Claude Desktop, Cursor, etc. and reads the rendered conversation as it changes.

**Stack:** Tauri Rust core + the `accessibility-rs` or `objc2` crates to call the macOS Accessibility C API. Not React-side — has to be in the Rust core.

**Complexity:** **High.** This is the swing scope item. Reasons:
- Apple's Accessibility API is documented but quirky; behavior varies between apps.
- Each target app (Claude Desktop, Cursor) presents its UI differently in the AX tree; per-app heuristics needed.
- Permission UX is delicate: macOS pops a system dialog the first time, and if denied, re-prompting requires a System Settings deep link.
- Latency / CPU: polling the AX tree continuously is expensive; need event-driven observers (`AXObserverAddNotification`) which are less stable.
- Apple has been progressively tightening AX in macOS releases; future macOS versions could break this entirely (low but non-zero probability).

**Effort estimate:** 3–4 weeks for a *first* working version covering Claude Desktop + Cursor for a senior macOS-savvy engineer. Plausibly 6+ weeks for a generalist learning the API.

**Risk:** High on timeline, medium on durability. **This is why the brief has the "drop at week 4 if <80% working" hard rule** — it's the right call.

**Pros (if it works):** Native capture for the two highest-value desktop apps. Strong launch story. No ToS risk (you're using a platform-legitimate API the user explicitly granted).
**Cons:** High effort, fragile, macOS-only (Windows UIAutomation is a separate later effort).

**Alternative if Tier 3 falls behind schedule:** Use Anthropic's **MCP (Model Context Protocol) server** approach for Claude Desktop. Claude Desktop natively supports MCP servers — Trace ships an MCP server, the user adds it to their Claude config, and capture flows through the MCP integration. **Lower-risk path; recommend exploring as Tier 3-alt before committing 4 weeks to AX work.** Same idea works for Cursor's MCP support (recently added). May replace the Accessibility-API path entirely.

> **Critical action item:** spike MCP-server-based capture in week 1 (2–3 days). If it covers Claude Desktop and Cursor cleanly, it could replace the Accessibility-API work entirely and pull weeks out of the timeline.

---

## Desktop client framework — Tauri vs. Electron vs. native Swift

| | Tauri 2 | Electron | Native Swift |
|---|---|---|---|
| Bundle size | ~5–15 MB | ~120–200 MB | ~5–15 MB |
| Memory at idle | ~50–80 MB | ~150–250 MB | ~30–50 MB |
| UI tech | Web (any framework) | Web (any framework) | SwiftUI / AppKit |
| Native API access | Excellent via Rust | OK via Node bindings | Native |
| Security profile | Strong (Rust core, scoped permissions) | Acceptable (Chromium attack surface) | Strong (Apple sandbox) |
| Cross-platform later | Yes (Windows, Linux) | Yes | No (rebuild needed) |
| Hiring pool | Smaller (Rust + JS) | Largest (JS) | Mac-only devs |
| LLM coding support (2026) | Good | Excellent | Good for SwiftUI, weaker for AppKit |
| Codesigning / notarization | Documented | Documented | Apple-blessed |

**Recommendation: Tauri 2.** The bundle-size and security advantages are not a vanity win — they directly support the integrity GTM pillar ("we're a small auditable native binary, not a 200 MB Chromium").

**Honest counterpoint: pick Electron if you're going to lean heavily on LLM-assisted coding and want the maximum amount of training data behind your stack.** Electron has a decade of Stack Overflow + GitHub corpus; Tauri has less. For 2 designers without an engineer co-founder, this argument is real.

**Native Swift is rejected** for v1 because (a) cross-platform later means a rewrite, and (b) the team's UI sweet spot is React/Tailwind, not SwiftUI.

---

## Sync engine for v1 multiplayer (3 months out)

The Alice→Bob killer demo requires real-time-ish sync between client devices and a hosted backend. Three viable architectures:

### Option A — ElectricSQL ("Postgres with sync")
- You write Postgres SQL on the server; ElectricSQL replicates relevant rows to clients with conflict resolution.
- Local writes are immediate; sync happens transparently.
- **Pros:** Smallest mental model. Schema is just Postgres. Tiny ops surface for 2 founders. Strong fit for the "team graph as queryable data" model.
- **Cons:** Newer (2024 production-ready); fewer ops references than legacy CRDT setups. Some constraints on schema patterns.
- **Verdict: lead recommendation** for v1 unless the team-graph data model fights it.

### Option B — Yjs (CRDT) + custom WebSocket relay
- The proven CRDT. Used by Linear, Liveblocks, Tldraw, many others.
- You design custom data structures using Yjs primitives (Y.Map, Y.Array, Y.Doc).
- **Pros:** Battle-tested. Excellent offline support. Lots of training data for LLM coding.
- **Cons:** You build more glue (auth, persistence to Postgres, sync layer). More moving parts to operate.
- **Verdict: solid backup** if ElectricSQL doesn't fit.

### Option C — Replicache / Rocicorp Zero
- "Sync engine" with optimistic mutations. Replicache is mature; Zero is the newer reactive successor.
- **Pros:** Excellent UX (optimistic + reactive). Strong for chat/collab patterns.
- **Cons:** Commercial license for production; smaller community than the others.
- **Verdict: skip for OSS-first product.** Licensing collides with the integrity/OSS narrative.

**Recommendation:** **ElectricSQL** for v1; fallback to **Yjs** if a 1-week spike reveals data-model friction.

---

## Real-time presence (v1 multiplayer)

**Recommendation: PartyKit.**

- Hosted WebSocket-with-state ("Cloudflare Durable Objects but easy"). Build presence (who's looking at what session right now), live cursors, ephemeral notifications.
- Tiny code surface; perfect for a 2-founder team that doesn't want to operate WebSocket infra.
- Alternative: **Liveblocks** — more polished SDK, more expensive, faster path for "Figma-like multiplayer" UX.
- Reject: building your own WS server. Two designers + WebSocket ops at scale = recipe for outages.

---

## Agent runtime — where do agents live?

**Personal agents (capture, redaction):** in-process in the desktop client.
- Use Anthropic SDK with **Claude Haiku 4.5** for fast/cheap inference.
- Run on the user's own API key (BYOK) so the user pays inference and Trace doesn't carry the cost.
- Aggressive prompt caching — most personal-agent prompts are stable scaffolds with small per-session variation; cache the scaffold. (See `claude-api` skill.)
- For redaction specifically: prefer fast regex + structured pattern detection (PII, secrets) as the first pass, then a small Claude call only for ambiguous cases. Saves cost + latency + works offline.

**System agents (sync, handoff, context bundler — v1):** in a Bun service alongside the backend.
- Use **Sonnet 4.6** for higher-stakes reasoning (handoff detection, context bundling).
- Aggressive prompt caching across users (cache the system prompt + tool definitions; vary only the team-context payload).
- Streaming responses for any agent that surfaces UI.

**Why split personal/system this way:**
- Personal agents on-device = privacy story stays clean (no content leaves device for personal-agent inference).
- System agents on the server = they need the shared team graph anyway, no point round-tripping.
- BYOK on personal agents = Trace doesn't pay for inference at the seat where 90% of inference happens.

**Reject local-LLM-only agent runtime (Ollama, llama.cpp).** Local model quality in 2026 is good but not at Sonnet/Haiku level for the agent tasks Trace needs (structured tool use, redaction precision). Ship hosted-LLM with BYOK; revisit local models in v2.

---

## Local encrypted storage

**Recommendation: SQLite (via Tauri SQL plugin) + `age` for content encryption.**

- SQLite: industry-standard, single-file, easy to backup, queryable.
- `age`: modern, OSS, simple key model. Used by tons of trust-conscious tools. Beats GPG on UX, beats rolling-your-own crypto on every dimension.
- Key management: derived from a passphrase (Argon2id) on first run; stored in macOS Keychain when user opts in to keychain integration.
- Encrypt **content** at rest, leave **metadata** (timestamps, source tool, model name) in plaintext SQLite — enables fast queries without decrypting every row.

**Reject:** custom encryption schemes, IndexedDB (irrelevant — desktop app), full-disk encryption only (insufficient — relies on OS).

---

## Backend stack (v1 multiplayer)

**Recommendation: Bun + Hono + Postgres (managed) + Fly.io or Railway.**

- Bun: fast, batteries-included JS/TS runtime; smaller ops surface than Node.
- Hono: minimal web framework; tiny mental model.
- Postgres: managed via Supabase, Neon, or Crunchy Data — pick whichever is cheapest at small scale.
- Fly.io or Railway: cheap, simple deploys; both fine for 2 founders.

**Reject:** Kubernetes (overkill), AWS Lambda + DynamoDB (steep mental model for two designers), serverless-everything (cold-start UX is bad for a real-time product).

---

## Auth

**Recommendation: WorkOS** for v1 multiplayer.

- Email + Google + GitHub OAuth out of the box.
- SSO/SAML when enterprise comes calling later — already wired.
- Generous free tier.
- **Alternative: Clerk** if WorkOS' DX feels heavier than needed; Clerk is simpler for SMB-first.

**Reject:** rolling your own auth, Auth0 (expensive at scale), Firebase Auth (Google lock-in collides with OSS narrative).

---

## Critical risk register for the OSS launch

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Tier 3 (Accessibility) takes >4 weeks | High | High | Hard-rule drop at week 4. Spike MCP alternative in week 1. |
| MV3 capture breaks when ChatGPT/Claude.ai change DOM | Medium | Medium | Both DOM + fetch-intercept paths; quick-update extension channel. |
| macOS codesigning + notarization eats a week | High | Medium | Allocate week 5 for it explicitly; Apple Developer account ready week 1. |
| 2 designers can't ship Rust code | High | Critical | **Bring in engineering help before kickoff.** This is the report's single most important call-out. |
| Trademark for "Trace" not clearable | Medium | Medium (delays public launch) | Start clearance search this week. |
| Anthropic / OpenAI ToS enforcement on capture | Low | High | Lead with Tier 0 (API key, explicitly authorized); Tier 2 follows precedent (browser extensions are routine). Engage product counsel pre-launch. |

---

## Cost envelope (rough, monthly, at 200 self-installs)

| Line item | Cost/mo |
|---|---|
| Hosting (Fly.io / Railway) for v1 backend (post OSS launch) | $20–50 |
| Postgres (managed) | $20–50 |
| WorkOS (free tier) | $0 |
| PartyKit | ~$20 |
| Anthropic API for system agents (assume light v1 usage) | $50–200 |
| Domain, SSL, GitHub Pro | $30 |
| Apple Developer Program | $99/year amortized = $8.25/mo |
| **Total at OSS launch (no backend)** | **~$40–80/mo** |
| **Total at v1 multiplayer** | **~$150–400/mo** |

Personal-agent inference is BYOK so doesn't hit Trace's bill.

---

## Recommendation summary

1. **Acknowledge the engineering reality before stack picks.** Two designers cannot ship this in 6 weeks alone. Hire / bring in an engineering co-founder, contract a senior generalist, or formally cut scope to Tier 0+2 only.
2. **Stack: Tauri 2 + React/TS/Tailwind + SQLite/age + Plasmo for the extension.** Boring, defensible, integrity-aligned.
3. **Capture tiers in OSS launch:** Tier 0 + Tier 2 are confident shipping in 6 weeks. **Tier 3 should spike MCP-server approach in week 1 before committing to Accessibility-API work.**
4. **Defer all v1 multiplayer architecture decisions** to a separate research pass after OSS launch ships. ElectricSQL + Bun + PartyKit + WorkOS is the strawman to start from.
5. **Personal agents on-device with BYOK; system agents server-side with prompt caching.** Privacy + cost story both work.

---

## Open questions for the next round

- [ ] **Engineering capacity.** What's the plan for engineering bandwidth in the 6-week window? Co-founder, contractor, or LLM-assisted-coding only? This is the single biggest unresolved input.
- [ ] **MCP capture spike result.** Schedule a 2–3 day spike in week 1: can MCP-server-based capture cover Claude Desktop and Cursor? If yes, Tier 3 risk collapses.
- [ ] **Tauri vs. Electron final call.** Hinges on engineering capacity. If Rust experience is zero on the team, Electron is the safer pick.
- [ ] **Sync engine (v1).** ElectricSQL vs. Yjs decision deferred to a 1-week spike during the OSS-launch build; document outcome before v1 PRD.
- [ ] **Where does the OSS-launch landing page live?** Vercel + Next.js is the boring choice. Confirm before week 1.
- [ ] **Telemetry implementation.** PostHog OSS for the install counter? Sentry OSS for crash reports? Both have OSS self-host stories that align with the integrity narrative.
