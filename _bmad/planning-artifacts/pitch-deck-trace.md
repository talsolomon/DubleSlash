---
marp: true
theme: default
class: invert
backgroundColor: "#0d0d0f"
color: "#e8e8ec"
style: |
  section {
    font-family: 'Inter', 'SF Pro Display', system-ui, sans-serif;
    padding: 52px 64px;
    font-size: 18px;
    line-height: 1.6;
  }
  h1 {
    font-size: 2.6rem;
    font-weight: 700;
    letter-spacing: -0.02em;
    margin-bottom: 0.3em;
    color: #f5f5f7;
  }
  h2 {
    font-size: 1.85rem;
    font-weight: 600;
    letter-spacing: -0.015em;
    color: #f5f5f7;
    border-bottom: 1px solid #2a2a30;
    padding-bottom: 0.25em;
    margin-bottom: 0.6em;
  }
  h3 {
    font-size: 1.15rem;
    font-weight: 600;
    color: #a0a0b0;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    margin-bottom: 0.4em;
  }
  p {
    color: #c8c8d4;
  }
  strong {
    color: #f5f5f7;
  }
  ul {
    color: #c8c8d4;
  }
  li {
    margin-bottom: 0.35em;
  }
  code {
    background: #1e1e28;
    color: #7dd3b0;
    border-radius: 4px;
    padding: 0 5px;
    font-size: 0.9em;
  }
  .accent {
    color: #3fb68b;
  }
  .muted {
    color: #666680;
    font-size: 0.85em;
  }
  .tag {
    display: inline-block;
    background: #1a1a24;
    border: 1px solid #2a2a38;
    border-radius: 4px;
    padding: 2px 8px;
    font-size: 0.8em;
    color: #9090a8;
    margin-right: 6px;
  }
  .columns {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 40px;
  }
  .columns-3 {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 28px;
  }
  .card {
    background: #141420;
    border: 1px solid #22222e;
    border-radius: 10px;
    padding: 24px;
  }
  .competitor-tag {
    font-size: 0.75em;
    color: #666680;
    font-style: italic;
    margin-top: 0.5em;
  }
  .green { color: #3fb68b; }
  .yellow { color: #f4c95d; }
  .red { color: #e05c5c; }
  blockquote {
    border-left: 3px solid #3fb68b;
    padding-left: 1em;
    color: #9090a8;
    font-style: italic;
    margin: 0;
  }
  table {
    font-size: 0.82em;
    width: 100%;
    border-collapse: collapse;
  }
  th {
    background: #141420;
    color: #9090a8;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 0.78em;
    letter-spacing: 0.05em;
    padding: 8px 12px;
    text-align: left;
    border-bottom: 1px solid #22222e;
  }
  td {
    padding: 7px 12px;
    border-bottom: 1px solid #1a1a24;
    color: #c8c8d4;
  }
  .disclaimer {
    font-size: 0.7em;
    color: #44444e;
    margin-top: auto;
  }
---

<!-- SLIDE 1 — TITLE -->

# Trace

### The mutual ground for your team's AI work

<br>

**Trace your team's AI work across every tool, every model, every teammate.**

<br>

**Tal + Shenhav** · April 2026

<!-- LOGO: Trace wordmark · 200x48 · swap in _bmad/assets/logos/trace-wordmark-white.svg -->

---

<!-- SLIDE 2 — THE PATTERN -->

## We've watched this pattern twice

*A shared thesis, built from living two platform shifts end to end.*

<br>

<div class="columns">

<div>

**SaaS revolution (2010–2018)**

Tools mushroomed. Every job-to-be-done got its own product. Teams ran 15 SaaS apps and nobody could see the whole picture.

**What happened:** the layer beneath them — the one that carried context *between* tools — became the most valuable real estate.

</div>

<div>

**AI revolution (2022–2026)**

The same pattern. Again. Faster.

Tools multiplied: Claude, ChatGPT, Cursor, Copilot, Perplexity, Figma AI, v0, Replit, Notion AI — and counting.

**What's coming:** the same consolidation. The layer beneath wins. Again.

</div>

</div>

<br>

> *"Let people shine wherever they already shine."* — the thesis that drives Trace.

---

<!-- SLIDE 3 — INTRODUCING TRACE -->

## Introducing Trace

*The capture layer. The team graph on top. One install.*

<br>

**One sentence:** Trace is the layer that carries your team's AI work between tools and between teammates — so a designer in Claude can push a session, a developer in VS Code can pick it up, and neither person has to leave what they love.

<br>

**The metaphor:**
A blanket that enfolds all the AI in the world into a cloud. Install one thing, sign in once, and AI sessions across every tool sync into a shared, trail-able team graph. Every tool stays. Every model stays. Every workflow stays. The work just... connects.

<br>

**What makes it possible:** a vendor-agnostic **capture layer** — tool-agnostic, model-agnostic, privacy-first — underneath a shared **team graph** with push/branch/diff semantics. GitHub mental model. Applied to AI work. Across every surface.

<br>

**North-star feel:** *"Oh — I can see what it's doing, I'm in charge of all of it, and I can already picture my teammate picking this up."*

<!-- LOGO: Trace wordmark · 160x36 · swap in _bmad/assets/logos/trace-wordmark-white.svg -->

---

<!-- SLIDE 4 — HOW IT WORKS — DIAGRAM -->

## How it works

*Three capture paths. One local store. One team graph.*

<br>

```mermaid
flowchart LR
    subgraph tools["Your AI Tools"]
        T0["🔑 API calls\n(OpenAI / Anthropic)"]
        T2["🌐 Claude.ai\nChatGPT / Perplexity\n(browser extension)"]
        T3["🖥 Claude Desktop\nCursor\n(macOS Accessibility)"]
    end

    subgraph capture["Capture Layer (on-device)"]
        CA["Capture Agent\n(tags every session)"]
        RA["Redaction Agent\n(PII / secrets before push)"]
        LS["Local SQLite\n+ age encryption\n+ Keychain key"]
    end

    subgraph team["Team Graph (V1 — hosted / self-host)"]
        TG["Team Graph\n(push / branch / diff)"]
        SA["System Agents\n(sync · handoff · context bundler)"]
    end

    subgraph views["Views on top"]
        LV["Linear-like\nTask View"]
        GV["GitHub-like\nPush / Branch View"]
    end

    T0 -->|"Tier 0 proxy"| CA
    T2 -->|"Tier 2 ext → localhost"| CA
    T3 -->|"Tier 3 AX API"| CA
    CA --> RA
    RA --> LS
    LS -->|"push (user-controlled)"| TG
    TG --> SA
    TG --> LV
    TG --> GV
```

<br>

<span class="muted">Data never leaves the device without an explicit user push. Push is always local → team graph, never local → vendor.</span>

---

<!-- SLIDE 5 — THE THREE CAPTURE TIERS -->

## The three capture tiers

*Deepening coverage. Escalating only where users opt in.*

<br>

<div class="columns-3">

<div class="card">

### Tier 0
**API-key proxy**

User provides their own OpenAI / Anthropic key. Trace runs a local proxy that forwards every call and records it.

**Coverage:** any tool that calls the OpenAI / Anthropic API — scripts, agents, custom tools.

**Risk:** zero. User owns the key. Explicitly authorized.

**Ships:** OSS launch.

</div>

<div class="card">

### Tier 2
**Browser extension**

Manifest V3 extension captures sessions on claude.ai, chatgpt.com, perplexity.ai via DOM + fetch interception.

**Coverage:** the three most-used web LLM surfaces.

**Risk:** very low. Well-precedented (same mechanism as Grammarly, ReadWise).

**Ships:** OSS launch.

</div>

<div class="card">

### Tier 3
**macOS Accessibility**

Reads Claude Desktop and Cursor's content via the macOS Accessibility API — platform-legitimate, user-granted.

**Coverage:** the two highest-value desktop AI apps.

**Risk:** low. User explicitly grants permission in System Settings.

**Ships:** OSS launch (or v0.2 if <80% at week 4).

</div>

</div>

<br>

<span class="muted">Network-layer TLS interception (advanced / power-user, opt-in only) and OS screen capture (never, or v2 at earliest) are explicitly out of scope for V1.</span>

---

<!-- SLIDE 6 — AGENTS ARE FIRST-CLASS -->

## Agents are first-class

*Trace is not a passive sync layer. It's a fabric of small, focused agents.*

<br>

<div class="columns">

<div>

### Personal agents (on-device)

Run locally on the user's machine. Data never leaves for inference.

| Agent | Job |
|---|---|
| **Capture** | Tags every session: source, model, timestamp, goal |
| **Redaction** | Detects PII + secrets before any push; diff-style preview |
| **Twin** *(v1.5+)* | Represents you on simple async questions while offline |

</div>

<div>

### System agents (team graph, V1+)

Run server-side, scoped to team policies, audit-logged.

| Agent | Job |
|---|---|
| **Sync** | Pushes local store → team graph, honors push controls |
| **Handoff** | Detects natural pauses; surfaces sessions as pickup-able |
| **Context bundler** | Assembles context packs for new joiners or handoffs |
| **Digest** *(v1.5+)* | Narrates "today at a glance" — replaces async standups |

</div>

</div>

<br>

**Design rule for every agent: transparent, narratable, overridable.**
Users see what each agent did. Can veto any action. Can disable any agent without breaking anything else. Agents are visible workers in a glass kitchen — not a black box.

---

<!-- SLIDE 7 — TWO VIEWS ON TOP -->

## Two views on top of the capture layer

*Familiar mental models. No new concepts to learn.*

<br>

<div class="columns">

<div class="card">

### Linear-like task view

AI sessions are organized into tasks, projects, and phases. The team sees what's in-flight, what's blocked, what's ready to hand off.

**What it is:** a project-management surface that auto-populates from captured AI work — not a "file tickets" workflow. The sessions themselves are the source of truth.

**Mental model:** Linear — familiar to every design + dev team in 2026.

<!-- SCREENSHOT: Linear-like task view · see ux-design doc — V1 surface, placeholder -->

</div>

<div class="card">

### GitHub-like push/branch view

Each team member's AI work is a stream of pushes. Sessions have branches. You can diff two model outputs. You can see the full history of how a decision evolved.

**What it is:** version control semantics, applied to AI work across every tool and every model.

**Mental model:** GitHub — the push/branch/PR vocabulary is already in every developer's head.

<!-- SCREENSHOT: GitHub-like push/branch view · see ux-design doc — V1 surface, placeholder -->

</div>

</div>

---

<!-- SLIDE 8 — TRUST IS THE PRODUCT -->

## Trust is the product

*The Privacy dashboard isn't a compliance page. It's the marketing.*

<br>

<div class="columns">

<div>

**What the dashboard shows:**
- Every session stored on this device — count, size, encrypted status
- What has left this device — **Nothing. Ever.** (until you push)
- Telemetry sent — only the two opt-in pings you chose
- Which agents ran — audit log, per session, per action

**Copy system (everywhere in the UI):**
- *"🟢 Capturing · 3 apps · encrypted locally · you control pushes"*
- *"Nothing has left this device."*
- *"Local only."*
- *"You're in charge of every action."*

</div>

<div>

<!-- SCREENSHOT: Privacy dashboard · see ux-design doc Flow 6 · "Stored on this device / Left this device — Nothing. Ever. / Telemetry sent / Agents that have run" -->

**Why this matters for GTM:**

Recall (Microsoft, 2024) showed the market exactly what not to do: default-on, no redaction, unencrypted. Trace is the direct response. Local-first + transparent + OSS + opt-in telemetry is not a feature list — it's the only viable entry frame for a product that watches AI work.

**Opt-in telemetry (default OFF):** install counter (+1, no content, no ID) and crash reports — that's all. Nothing else ever phones home.

</div>

</div>

---

<!-- SLIDE 9 — LICENSE: FSL-1.1-APACHE-2.0 -->

## License: FSL-1.1-Apache-2.0

*Not MIT. Not AGPL. Not proprietary. The right license for this moment.*

<br>

<div class="columns">

<div>

**What FSL-1.1-Apache-2.0 is:**

The Functional Source License (FSL), published by Sentry in 2023. Source-available. Two-year non-compete clause. Auto-converts to Apache 2.0 after two years.

**Why not MIT / Apache from day one:**
A hyperscaler could clone the capture client, run "Managed Trace" against us, and use our own substrate as a distribution lever. FSL closes that window for the critical 2 years.

**Why not AGPL:**
Enterprise legal teams increasingly refuse AGPL on principle. FSL is approved by more enterprise procurement desks than AGPL is. Sentry, Keygen, and several YC-backed OSS companies use it today.

</div>

<div>

**Why not SSPL:**
OSI rejected it. Developer communities have forked against it three times (OpenSearch, OpenTofu, Valkey). Too much baggage for a trust-first product.

**Capture protocol — Apache 2.0:**
The wire format between the extension and client lives in a separate repo, licensed Apache 2.0. Anyone can implement a capture agent for any new tool. That's what makes "vendor-agnostic" credible and makes the ecosystem grow.

**CLA + trademark + signed releases + SBOM:**
The full trust stack. Legal moat is trademark + network effect, not just the license.

</div>

</div>

---

<!-- SLIDE 10 — MARKET -->

## Market shape

*Fragmented, fast-moving, and waiting for a neutral layer.*

<br>

<div class="columns">

<div>

**Who feels this today**

Every design + dev team running 5–10 AI tools per person — and that's most teams that call themselves AI-forward in 2026. The fragmentation isn't edge-case; it's the default state of knowledge work.

**The shape of the market:**
- The AI tool category has grown faster than any software category before it
- No tool has >50% share in any role — fragmentation is structural, not transitional
- The teams who feel it hardest are 5–50 people: too big for one person to hold the context, too small for enterprise tooling to be worth it

**No single vendor consolidates this.** Anthropic can't. OpenAI can't. They're too busy competing with each other. That's why the neutral layer hasn't shipped — and why it needs to exist.

</div>

<div>

**Where we start: SMB design + dev teams**

These teams: run 5–10 AI surfaces daily, hate enterprise procurement, spread tools virally (one install → teammate install → team install), and already use the GTM playbook Trace is designed for: Linear, Figma, Notion, Slack all grew this way.

**Pricing reference:**

| Product | Price |
|---|---|
| Linear | $8–14/seat |
| Granola | $14/seat |
| Glean (enterprise) | $40+/seat |
| **Trace (target)** | **Free ≤5 seats; $12/seat/mo >5** |

OSS removes the friction of the first conversation. Trust earns the first paying team.

</div>

</div>

---

<!-- SLIDE 11 — COMPETITIVE LANDSCAPE + TALKING POINTS -->

## Competitive landscape

*Trace sits alone in the only unoccupied quadrant.*

<br>

```mermaid
quadrantChart
    title Cross-tool coverage vs. Team vs. Personal scope
    x-axis "Tool-specific" --> "Cross-tool"
    y-axis "Personal only" --> "Team"
    quadrant-1 "The gap — where Trace lives"
    quadrant-2 "Team · tool-specific (IDEs, PM tools)"
    quadrant-3 "Personal · tool-specific (capture, memory)"
    quadrant-4 "Personal · cross-tool (closest: Rewind)"

    Trace: [0.9, 0.88]
    Linear-AI: [0.35, 0.75]
    Cursor-Teams: [0.2, 0.65]
    Granola: [0.12, 0.3]
    Rewind: [0.65, 0.15]
    Microsoft-Recall: [0.55, 0.1]
    Notion-AI: [0.25, 0.55]
    Glean: [0.45, 0.72]
```

---

<!-- SLIDE 12 — COMPETITOR TALKING POINTS -->

## Competitor talking points

*Each competitor owns one slice. Nobody owns the layer beneath — that's the claim.*

<br>

| Competitor | What they own | What they don't | Our line when they come up |
|---|---|---|---|
| **Linear / ClickUp Brain** | Task surface | The AI sessions that produced the work | "Linear sees the ticket. Trace sees the 45 minutes that created it." |
| **Figma / FigJam** | Design artifacts | The Claude sessions that informed the design | "Figma owns the file. Trace owns the trail." |
| **Granola / Otter** | Meetings | The 8 hours of AI work around the meeting | "Granola doesn't leave the meeting room." |
| **Cursor / Copilot / Claude Code** | The IDE session | Every non-IDE surface (designer, PM, researcher) | "They see what developers do inside the IDE. Trace sees the rest." |
| **Notion AI / ClickUp Brain** | Their own workspace | Anything outside their platform | "Notion AI can only see what's in Notion." |
| **Rewind / Recall** | Single-player screen/audio capture | Team graph, privacy trust | "Recall showed the market what not to do. Trace is the structural opposite." |
| **Anthropic / OpenAI** | Their own model's sessions | Neutral cross-vendor visibility | "They're the silos we trail across. Making themselves portable would cost them leverage." |

<br>

<span class="muted">No single competitor can close the gap without becoming infrastructure for their own rivals — a strategic nonstarter from any existing position.</span>

---

<!-- SLIDE 13 — GO-TO-MARKET: SMB-FIRST -->

## Go-to-market: SMB-first

*Not enterprise-first. Intentionally.*

<br>

<div class="columns">

<div>

**Why SMB-first:**

Design + dev teams of 5–50 people feel the AI fragmentation hardest. They're the ones running 5–10 AI tools per person with no coordination layer. They spread tools virally — one person installs, sends to a teammate, that teammate installs, sends to another.

OSS removes the first barrier: no procurement conversation, no security review, no contract. Anyone can install, try, and become an advocate before the team budget conversation starts.

**The path:** individual installs → single team adopts → team pays at 6+ seats → another team in the org hears → expansion.

</div>

<div>

**Why not enterprise-first:**

Enterprise procurement requires SOC 2, SSO, SAML, data residency, and an 18-month sales cycle. We don't have any of those at OSS launch, and building them first would eat the entire V1 runway.

The right enterprise motion: be so useful to design + dev teams that enterprise security teams *ask us* to become enterprise-ready. That's the inbound signal we watch for. V2 is when we answer.

**The OSS-core playbook works here:**
Supabase: 100k+ GitHub stars. Cal.com: 30k+. PostHog: 22k+. Same pattern — design + dev communities, OSS as distribution, SMB conversion, enterprise as the reward not the starting point.

</div>

</div>

---

<!-- SLIDE 14 — PRICING -->

## Pricing

*Free where it matters. Paid where the value compounds.*

<br>

<div class="columns-3">

<div class="card">

### Free tier
**Hosted — up to 5 seats, forever**

Full team graph. Push/branch/diff. All views. All integrations.

Free forever. No time limit. No feature gates.

*Why 5 seats:* mirrors Notion, Linear, Cal.com. The inflection where "team" starts feeling like a real team and value compounds.

</div>

<div class="card">

### Paid tier
**$12/seat/month above 5 seats**

Includes everything in the free tier plus: team graph with unlimited history, full push history + search across teammates, system agents (handoff, context bundler, digest), hardened self-host support.

*The 15-minute full-access trial on first install unlocks every feature — no gates, no signup friction. Feel the whole product before anything asks for money.*

</div>

<div class="card">

### OSS self-host
**Always free, unlimited seats**

Docker Compose + Helm chart. Documented and supported as a first-class deployment from V1 launch. No seat limit. No expiry.

For compliance-sensitive teams who need data residency. For the OSS faithful. For enterprises who want to evaluate before the SOC 2 conversation.

</div>

</div>

<br>

<span class="muted">Personal-agent inference (Haiku 4.5, on-device) runs on the user's own Anthropic API key — BYOK. Trace doesn't pay for that inference.</span>

---

<!-- SLIDE 15 — ROADMAP: 3 MILESTONES -->

## Roadmap

*Three milestones. Each one earns the right to the next.*

<br>

<div class="columns-3">

<div class="card">

### Milestone 1
**OSS Launch**
*~Early June 2026*

macOS only. Single-player. Local-only. FSL-1.1-Apache-2.0.

Tier 0 + Tier 2 + Tier 3 (conditional). Capture agent + redaction agent. Session timeline. Privacy dashboard. Today view.

**Job:** earn trust. Seed the community. Prove the capture works. 1,000 GitHub stars.

</div>

<div class="card">

### Milestone 2
**V1 — Full product**
*~4–5 months after OSS launch*

The actual collaboration product. Multiplayer team graph, push/branch/diff, cross-platform (macOS + Windows + Linux), hosted + hardened self-host, Linear-like + GitHub-like views, Slack/Teams/email integrations, 15-min full-access trial, paid gating.

**Job:** prove the killer demo. First paying team.

</div>

<div class="card">

### Milestone 3
**V2 — Methodology + Enterprise**
*Post-V1 (timing based on V1 PMF)*

`flow.yaml` declarative methodology — opt-in, never a prerequisite. Agent-enforced process. Flow checker + process agents. SOC 2, SSO, SAML, data residency, audit exports.

**Job:** serve the enterprise teams who found us through SMB. Compound the data moat.

</div>

</div>

---

<!-- SLIDE 16 — WHAT SHIPS IN V1 -->

## What ships in V1

*~4–5 months after OSS launch. The collaboration story requires all of this.*

<br>

<div class="columns">

<div>

**Platform + infrastructure**

- macOS + Windows + Linux clients at launch — parity, not sequenced
- Hosted backend from day one
- Hardened self-host: Docker Compose + Helm chart + ops runbook
- Web app for the team view (complements native clients)

**Collaboration surface**

- Multiplayer team graph — real-time presence, shared timeline, cross-device sync
- Push / branch / diff / merge for AI sessions
- Cross-tool handoff — the killer demo (Sarah → Marcus → Sarah)

</div>

<div>

**Views**

- Linear-like task view — auto-populated from captured AI work
- GitHub-like push/branch history view

**Trial + pricing**

- 15-min full-access trial on install
- Free ≤5 seats hosted
- $12/seat/mo above 5 seats
- OSS self-host free, unlimited

</div>

</div>

---

<!-- SLIDE 17 — ARCHITECTURE OVERVIEW -->

## Architecture overview

*Small bundle. Auditable. Defensible.*

<br>

```mermaid
flowchart TD
    subgraph oss["OSS Launch — on-device"]
        TC["Tauri 2 desktop client\n(Rust core + React/TS/Tailwind/shadcn)"]
        BE["Browser extension\n(Manifest V3 + Plasmo)"]
        LS["SQLite + age encryption\n+ macOS Keychain"]
        AR["Agent runtime (in-process)\nClaude Haiku 4.5 · BYOK"]

        TC <-->|"localhost IPC"| BE
        TC --> LS
        TC --> AR
    end

    subgraph v1["V1 adds — hosted / self-host"]
        PG["Postgres team graph\n(ElectricSQL / CRDT sync)"]
        BH["Bun + Hono backend\nFly.io or Railway"]
        SA["System agent runtime\nSonnet 4.6 · prompt caching"]
        RT["Real-time presence\n(PartyKit)"]
        AU["Auth (WorkOS / Clerk)"]

        BH --> PG
        BH --> SA
        BH --> RT
        BH --> AU
    end

    LS -->|"push protocol\n(Apache 2.0)"| BH
```

<br>

<span class="muted">Tauri 2 bundle: ~10–15 MB vs. Electron's ~120 MB. Security profile: Rust core, scoped WebView permissions. macOS 13 (Ventura)+ required at OSS launch.</span>

---

<!-- SLIDE 18 — THE AGENT FABRIC -->

## The agent fabric

*Personal agents protect privacy. System agents power collaboration.*

<br>

```mermaid
flowchart LR
    subgraph personal["Personal agents — on-device, privacy-first"]
        CA["Capture agent\nSource · model · timestamp · goal"]
        RA["Redaction agent\nPII · secrets · diff preview"]
        TW["Personal twin (v1.5+)\nAsync representation"]
    end

    subgraph system["System agents — team graph, V1+"]
        SY["Sync agent\nLocal → team graph · push controls"]
        HA["Handoff agent\nDetects pauses · surfaces pickup"]
        CB["Context bundler\nAssembles context packs on demand"]
        DI["Digest agent (v1.5+)\nTeam at-a-glance · replaces standups"]
        FC["Flow checker (V2)\nVerifies card attributes per flow.yaml"]
        PR["Process agent (V2)\nEnforces phase transitions"]
    end

    CA -->|"tagged session"| RA
    RA -->|"redacted session"| SY
    SY --> HA
    SY --> CB
    SY --> DI
    CB --> FC
    FC --> PR
```

<br>

**Three rules for every agent:** (1) transparent — users see what it did in the audit log; (2) narratable — it can explain its action in plain English; (3) overridable — disable any agent without breaking the rest.

---

<!-- SLIDE 19 — WHY NOW -->

## Why now

*The window is open. It won't stay open.*

<br>

<div class="columns">

<div>

**The fragmentation peaked**

2024–2026 is the point of maximum AI tool proliferation. Every major software category has an AI-native entrant. Teams feel the fragmentation every day. The pain is acute and named — they don't need to be educated about the problem.

**Labs are competing, not cooperating**

Anthropic and OpenAI are not going to build a cross-vendor capture layer. Their incentive is to win the tool war, not to make the war navigable. The neutral position is structurally available precisely *because* the labs won't take it.

</div>

<div>

**Recall poisoned the well for the wrong approach**

Microsoft Recall's trust failure in 2024 taught the market what *not* to do: default-on, no redaction, opaque, Windows-only. That failure created a tailwind: the market now knows it wants local-first, transparent, opt-in capture — and no one has shipped it as a *team* product.

**The OSS-core GTM has proven itself again**

Supabase, PostHog, Cal.com, Linear (community), Grafana — all used OSS distribution to reach design + dev communities without enterprise sales. The playbook is proven. The audience for Trace is exactly this audience.

</div>

</div>

<br>

**The window: before a major player decides the layer is worth owning.** That moment is coming. We move now.

---

<!-- SLIDE 20 — DEFENSIBILITY -->

## Defensibility

*Each layer reinforces the next.*

<br>

```mermaid
flowchart LR
    P["Open capture\nprotocol\n(Apache 2.0)"]
    C["Contributor\ncommunity\ngrows coverage"]
    T["Trust-first\ninstall\nearns retention"]
    G["Team graph\ngrows with\nevery push"]
    S["Switching cost\n(team context\naccumulates)"]
    D["Data moat\n(cross-tool\nsession corpus)"]

    P --> C
    C --> T
    T --> G
    G --> S
    S --> D
    D -->|"makes the protocol\nmore valuable"| P
```

<br>

<div class="columns">

<div>

**Why a lab can't just copy this in 3 months:**
The value is in the graph, not the client. The graph requires multi-tool capture happening at scale across many teams. That requires the community, the trust, and the protocol — all of which compound over time and are hard to bootstrap cold.

</div>

<div>

**Why a bigger infra company can't just acquire the position:**
Neutrality is structural. A company that sells an AI tool *cannot* be the neutral ground — the conflict of interest is perceived even if their intentions are good. Trace's neutrality is defensible only while Trace is not owned by a tool vendor.

</div>

</div>

---

<!-- SLIDE 21 — RISKS AND HOW WE HANDLE THEM -->

## Risks and how we handle them

<br>

| Risk | Our response |
|---|---|
| **A major lab restricts capture from their tool** | We lead with Tier 0 (API key — explicitly authorized). We pursue vendor partnerships before launch. We maintain diverse capture paths so no single ToS change collapses coverage. We build in public, making the capture method auditable. |
| **Capture legality challenge** | One-party consent doctrine covers user-captured sessions on their own device. We lead with API key + browser extension (both well-precedented). We engage specialist product counsel before launch. We design explicit consent at every push boundary. |
| **"This is just like Recall"** | OSS client (auditable source), local-first default (nothing leaves without push), opt-in telemetry (default OFF), privacy dashboard built to be shared — this is the structural opposite of Recall. |
| **FSL misread as "not open source"** | We don't claim OSI-approved "open source." We say "source-available / fair source." We publish an FSL FAQ in the README. The capture protocol is Apache 2.0 — fully permissive, no caveats. |
| **Enterprise asks before we're ready** | We say no gracefully. Enterprise (SOC 2, SSO, SAML, residency) is V2. We document inbound enterprise interest as the V2 greenlight signal. Not chasing it — waiting for it. |
| **Engineering capacity (2-designer founding team)** | The tech research is explicit: we need an engineering co-founder, a senior contractor, or to cut Tier 3 from the OSS launch. We make that call before week 1. |

---

<!-- SLIDE 22 — WHAT WE'RE STILL FIGURING OUT -->

## What we're still figuring out

*Honest accounting. These are the live questions we're working through.*

<br>

<div class="columns">

<div>

**Engineering**

We're a product + design founding pair. The critical open question: engineering co-founder, senior contractor, or cut Tier 3 from the OSS launch to narrow scope. We make that call before week 1 — it sets the whole OSS timeline.

**Capture legality, precisely**

One-party consent covers user-captured sessions. The nuance is in the details: which tiers, which jurisdictions, which ToS clauses. We need specialist product counsel before launch, not after.

**The Anthropic conversation**

We want to have it before launch. We don't know how it lands. Best case: quiet partnership on a first-party capture path. We're not assuming that — we're designing to not need it.

</div>

<div>

**GTM channel beyond OSS**

OSS launch seeding HN + design/dev communities is clear. What converts a team from install to paid? We have a hypothesis (the killer demo, Slack notification, team graph moment) but we'll learn from the first 10 paying teams, not from planning.

**V2 timing**

Enterprise (SOC 2, SSO, SAML, data residency) is explicitly V2. We watch for inbound enterprise interest as the greenlight signal. We don't know when that arrives — it depends on V1 PMF.

**Windows + Linux parity**

V1 commits to cross-platform, but macOS is the highest-confidence build. Windows and Linux get parity at V1; Tier 3 (macOS Accessibility API) has no equivalent on those platforms yet.

</div>

</div>

---

<!-- SLIDE 23 — APPENDIX: TECHNICAL STACK -->

## Appendix — Technical stack

<br>

| Layer | Choice | Rationale |
|---|---|---|
| Desktop client | **Tauri 2** (Rust core) | ~10 MB bundle; strong security profile; native macOS API access (Accessibility, Keychain); cross-platform for V1 |
| UI | **React + TypeScript + Tailwind + shadcn/ui** | Founders are designers; same stack reused for V1 web app |
| Browser extension | **Manifest V3 + Plasmo + React/TS** | Plasmo removes 80% of MV3 boilerplate; same UI library as desktop |
| Local storage | **SQLite (Tauri SQL plugin) + `age` encryption** | Auditable, portable, single-file; `age` is modern OSS-friendly encryption |
| Key management | **macOS Keychain** (opt-in, default ON) | Passphrase → Argon2id → key; Keychain stores key |
| Personal agent runtime | **In-process, Claude Haiku 4.5, BYOK, prompt caching** | Fast, cheap, private (no content leaves device for inference) |
| V1 backend | **Bun + Hono + Postgres** on Fly.io / Railway | Minimal ops surface for a 2-founder team |
| V1 sync engine | **ElectricSQL** (CRDT fallback: Yjs) | Postgres with sync; tiny ops win |
| V1 presence | **PartyKit** | Hosted WebSocket-with-state; avoids building WS infra |
| V1 auth | **WorkOS / Clerk** | SSO/SAML ready for enterprise when V2 calls |
| System agents (V1) | **Bun service, Sonnet 4.6, prompt caching** | Higher-stakes reasoning; lives next to team graph data |
| Telemetry | **PostHog OSS self-host** (install counter) + **Sentry OSS self-host** (crash reports) | Both self-hostable; preserves integrity narrative |

---

<!-- SLIDE 24 — APPENDIX: SUCCESS METRICS -->

## Appendix — Success metrics

*OSS launch (Milestone 1) — measured 30 days post-launch.*

<br>

| # | Metric | Target | Signal source |
|---|---|---|---|
| M1 | GitHub stars | ≥ 1,000 | GitHub API |
| M2 | Opt-in install counter | ≥ 200 (≈ 600 actual at ~30% opt-in rate) | PostHog OSS |
| M3 | Capture reliability (test matrix, 3 tools × 10 session types) | ≥ 90% | Internal test sessions |
| M4 | Security / privacy backlash incidents | 0 | Social monitoring + inbox |
| M5 | LLM lab partnership conversations opened (Anthropic priority) | ≥ 1 | Founder outreach log |
| M6 | HN / Twitter front-page moment | ≥ 1 thread, 100+ engagements | Social monitoring |
| M7 | Non-founder PRs merged to OSS repo | ≥ 10 | GitHub |
| M8 | Crash-free session rate | ≥ 99% of sessions complete without crash | Sentry OSS (opt-in subset) |
| M9 | Time-to-first-capture (moderated usability, n=5) | ≤ 5 minutes | Moderated usability sessions |

<br>

*V1 targets (Milestone 2, ~4–5 months post-OSS-launch): 5k+ GitHub stars · 1k+ WAU · first paying team · killer demo recorded end-to-end and posted publicly · ≥10 documented self-host deployments.*

---

<!-- SLIDE 25 — APPENDIX: WHY FSL-1.1-APACHE-2.0 -->

## Appendix — Why FSL-1.1-Apache-2.0

<br>

<div class="columns">

<div>

**The FSL terms in plain English:**

You can read the source. You can run it. You can modify it for your own use. **You cannot run a competing commercial service using this code for 2 years from the release date.** After 2 years, the code auto-converts to Apache 2.0 — fully permissive, forever.

**Why the 2-year non-compete matters:**

The first 2 years are when a hyperscaler (AWS, Microsoft, Google) could most profitably clone the product, deploy it at scale, and starve the original maintainer of the revenue needed to keep building. FSL closes that window without permanently restricting the code.

</div>

<div>

**Why this is better for the community than AGPL or SSPL:**

AGPL is rejected categorically by many enterprise legal teams. SSPL is so broad that it's been forked against three times (OpenSearch, OpenTofu, Valkey). FSL is narrower, time-limited, and auto-permissive — it doesn't feel punitive because it isn't permanent.

**The capture protocol stays Apache 2.0:**

Anyone can implement a Trace-compatible capture agent for any new AI tool, forever, with no restrictions. That's what makes the ecosystem grow and what makes the "vendor-agnostic" claim credible.

**Precedent:** Sentry, Keygen, multiple YC OSS companies launched on FSL in 2024–2026.

</div>

</div>

---

<!-- SLIDE 26 — CLOSING -->

## Mutual ground.

<br>
<br>
<br>

> *"No single company will win — Trace is the mutual ground that makes every AI tool's work trail-able in one place."*

<br>
<br>
<br>

Stay in what you love. Push your work. Your teammate picks it up in what they love.

**That's Trace.**

<br>
<br>

<!-- LOGO: Trace wordmark · 180x44 · swap in _bmad/assets/logos/trace-wordmark-white.svg -->

<br>

<span class="muted">Trace is the provisional product name pending trademark clearance. All roadmap dates are targets, not commitments. Contact founders before circulating this deck externally.</span>
