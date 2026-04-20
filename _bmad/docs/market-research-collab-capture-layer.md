# Market Research — Collab (AI-work capture & collaboration layer)

**Date:** 2026-04-20
**Question:** What is the defensible wedge for a tool-agnostic AI-work capture + collaboration layer, and how does it position against capture-only and collab-only players? Inputs lock the product brief and v1 scope.

---

## Executive summary

The market has split into three camps, none of which own the full surface:
1. **Capture-only** (Granola, Rewind, Mem, Recall, Glean) — own personal memory, weak on team artifact graph and tool coverage.
2. **Agent collab** (Factory, Cognition, Cursor Teams, Augment) — own a vertical (mostly code), locked to one tool/model.
3. **AI-native PM** (Linear, Height, ClickUp Brain) — own the task surface but depend on humans manually pushing AI work in.

**The gap is the layer beneath all three:** a tool-, model-, vendor-agnostic capture substrate that turns scattered AI work into a shared team graph without forcing tool migration. No one is competing here today *as a layer*; the closest analogues are Dropbox/OneDrive (sync substrate) and GitHub (push/branch substrate) — neither AI-native.

**Recommended positioning:** *"The cloud layer for your team's AI work — works under everything you already use, owned by you."* Lead with capture-layer depth + integrity narrative; tasks/process surfaces grow out of the data, not beside it.

---

## Competitive Landscape

### Cluster A — Capture / Personal Memory

| Competitor | Approach | Strengths | Weaknesses |
|---|---|---|---|
| **Granola** | Meeting-only audio notes, AI summaries | Best-in-class meeting UX; viral loop in PM/founder circles | Meetings only; no LLM-tool capture; single-player |
| **Rewind.ai** | OS-level screen + audio recording, local-first | Captures *everything*; strong privacy story | Personal; no team graph; perceived as "creepy"; battery/disk cost |
| **Mem** | AI-organized notes | Auto-linking, search | Manual capture; not LLM-tool-aware; team features thin |
| **Microsoft Recall** | OS screen capture (Windows) | Distribution via Windows | Single-player; trust crisis at launch; locked to Windows/Copilot |
| **Glean** | Enterprise search across SaaS | Strong in enterprise; connector breadth | Search-first, not capture-first; no AI-work-specific schema; expensive |
| **Raycast AI** | Launcher + AI integrations | Power-user love; fast | Personal productivity; no team artifact graph |

**Pattern:** all single-player or single-modality. None capture LLM-tool sessions across multiple apps as a first-class artifact, and none expose a team-shared push/branch surface.

### Cluster B — Agent / AI Dev Collab

| Competitor | Approach | Strengths | Weaknesses |
|---|---|---|---|
| **Factory.ai** | Autonomous coding agents w/ team workflow | Strong eng team brand; ships real PRs | Code-only; locked to their runtime |
| **Cognition / Devin** | Autonomous SWE agent | Demo lift; enterprise sales motion | Code-only; opaque; tied to their model/infra |
| **Cursor Teams** | IDE + team features | 1M+ devs; default IDE for AI coding | IDE-bound; can't capture work done outside Cursor |
| **Augment** | Context engine + agent for codebases | Enterprise context depth | Code-only; doesn't follow user across tools |
| **Sourcegraph Cody Teams** | Code intelligence + chat | Deep codebase indexing | Code-only; not AI-work-graph |
| **Cline / Continue** | OSS coding agents | OSS goodwill; extensible | Same single-tool ceiling |

**Pattern:** all coding-vertical. None see what teammates are doing in Claude Desktop, Perplexity, ChatGPT, Figma AI, etc. The "team" view stops at the IDE boundary.

### Cluster C — AI-Native PM / Task Surfaces

| Competitor | Approach | Strengths | Weaknesses |
|---|---|---|---|
| **Linear + AI** | Best-in-class task tracker w/ AI features bolted on | Beloved by dev teams; design quality | AI is sidecar; depends on humans manually filing |
| **Height** | "Autonomous project mgmt" | AI-first positioning | Still humans push work in; no capture layer |
| **ClickUp Brain** | AI on top of ClickUp | Distribution | Bloat reputation; AI feels grafted |
| **Stepsize AI** | Auto-generated dev updates | Pulls from git/Slack — closest in spirit | Reporting layer, not capture or push graph |
| **Unwrap** | AI on customer feedback | Vertical focus | Adjacent, not competitive |

**Pattern:** task surface assumes work is filed *to* it. None ingest the upstream AI-tool sessions that produced the work.

### Cluster D — Mental-model analogues (not competitors, frame the pitch)

| Analogue | Why it matters |
|---|---|
| **Dropbox / OneDrive / iCloud Drive** | The "cloud icon" UX — invisible sync, trust through transparency. This is the install metaphor. |
| **GitHub** | Push/branch/PR mental model for code → port to AI work. |
| **Figma** | Made multiplayer the default for a single-player tool category. Teams view + presence story. |
| **PostHog / Supabase / Cal.com** | OSS-core + paid playbook reference; community-led GTM. |

---

## Market Signals

- **AI tooling fragmentation is accelerating, not consolidating.** A typical eng/design team in 2026 touches 5–10 AI surfaces per person (Claude, ChatGPT, Cursor, Copilot, Perplexity, Figma AI, v0, Replit Agent, Notion AI, Linear AI). No single vendor will win all of it; the layer-above bet gets stronger every quarter.
- **"Where did that come from?" is the new compliance question.** Enterprises are starting to require provenance trails for AI-generated work (EU AI Act enforcement ramped 2025–2026; SOC 2 auditors now ask). Capture layer = compliance substrate, not just productivity.
- **Privacy backlash from Recall** taught the market what *not* to do. Local-first, transparent, user-controlled is now the only viable framing for an "always on" capture product. This is a tailwind for an OSS, integrity-first entrant.
- **OSS-core is the proven distribution path** for dev/design infra in this era (Supabase 100k+ stars, Cal.com 30k+, PostHog 22k+). Closed-source capture layers will lose the trust war.
- **GitHub-style mental models keep winning** in adjacent spaces (Linear, Vercel, Railway). The push/branch/PR metaphor is well-understood; transferring it to AI work is a low-cognitive-load pitch.
- **Counter-signal:** enterprises are also consolidating to fewer AI vendors (Microsoft, Google, Anthropic, OpenAI). A layer-on-top story has to survive the "why don't I just use Copilot for everything" objection — answer is teams that use multiple models will always exist, and they're the early adopters.

---

## Customer Needs (Jobs to Be Done)

| Job | Current solution | Pain points |
|---|---|---|
| "Show me what my teammate did in Claude/Cursor yesterday" | Slack screenshots, Loom, ad-hoc | No source of truth; high friction; lossy |
| "Find that prompt I used last month that worked" | Scroll Claude/ChatGPT history per tool | Siloed per tool; no search across; no team share |
| "Onboard a new hire to in-flight AI work" | Notion docs written after the fact | Stale day one; doesn't capture *how* work was done |
| "Prove to compliance where this output came from" | Manual audit trail, screenshots | Painful; doesn't scale; gaps |
| "Know which model/prompt produced the best result" | Memory + spreadsheets | No diff; no shared library |
| "See what the team is working on right now" | Standups, Slack status | Async/lossy; doesn't reflect AI-tool reality |
| "Stay in my favorite tool but collaborate with teammates on different tools" | None | Tool wars; lock-in pressure |

**Table-stakes** (must-haves, not differentiators): cross-tool capture, search, redaction, local-first storage, low overhead.
**Differentiators**: team artifact graph with push/branch semantics; integrity-first install; OSS client; tool/model agnosticism.

---

## TAM / Sizing

Rough top-down sizing — pressure-test before relying on these.

- **Knowledge workers using ≥2 AI tools weekly (2026):** ~150M globally (extrapolating from OpenAI ChatGPT 600M MAU, Anthropic ~100M, Cursor 1M+ paid devs, GitHub Copilot 4M+ paid).
- **Serviceable segment (teams of 5+ heavy AI users):** ~15–25M seats (eng + design + PM + research at AI-forward orgs).
- **Initial beachhead (design + AI-forward dev teams, the GTM target):** ~1–2M seats.
- **Pricing reference:** Linear $8–14/seat, Granola $14, Glean $40+/seat enterprise. Likely landing zone: free OSS tier + $10–20/seat team tier + enterprise (SOC 2, SSO, residency) at $30–50/seat.
- **Implied 5-yr ARR ceiling at 5% beachhead penetration, $15 ACV:** ~$90M ARR. Same math at SAM penetration: $1B+. Plausible but requires the OSS engine to actually drive viral install, not just ship a download page.

---

## Gaps & Opportunities

1. **No tool-agnostic capture substrate exists.** Every player picks a tool (Cursor, Granola), a modality (screen, audio), or a layer (search, tasks). The "underneath all of it" position is open.
2. **No team artifact graph for AI work.** GitHub for code, Figma for design — nothing for prompts/sessions/outputs across models. Push/branch/PR semantics are a green field.
3. **Trust-first install is unowned.** Recall poisoned the well; nobody has shipped the "always-visible capture indicator + one-click redact + OSS client" combo as the *primary* pitch.
4. **Compliance/provenance angle is under-marketed.** Enterprises are starting to need this; current capture players sell productivity, not audit trail. Big enterprise wedge if framed right.
5. **Methodology layer is wide open** — but premature. Shape Up, BMAD, Agile all assume humans+text. Nothing assumes humans+agents+sessions as the unit of work. Real opportunity, but only after capture data exists to ground it. Confirms `flow.yaml` belongs in v2.

---

## Implications for Collab

- **Lock the wedge as "capture layer + push graph."** Resist the gravity to ship a Linear-clone or IDE; the moat is *underneath* those.
- **OSS the capture client and the wire protocol.** Closed-source loses the trust war. Paid lives in the team graph, search, agent orchestration, and enterprise (SOC 2, SSO, residency). Pick license deliberately (Apache + trademark vs. BSL) before community launch — flagged in brainstorm risks.
- **Make the install moment the marketing.** Dropbox-icon analogue: drag .dmg, sign in once, watch the "🟢 Capturing · 3 apps · encrypted locally" indicator light up. This screenshot is the entire homepage.
- **Sequence v1 around the killer demo:** retroactive context bundle for new joiners. Turns invisible captured data into instant tangible value, and is impossible without the capture layer.
- **Position against, not into, the three clusters.** Don't try to be a better Granola/Cursor/Linear — be the *substrate* they all sit on. Every comparison page should reframe to "X is a tool, Collab is the layer."
- **Ship trust as a product surface, not a footer link.** Capture indicator, redact preview, audit log, OSS client repo prominent in nav. Integrity is the GTM, not a compliance checkbox.
- **Build the enterprise compliance story early.** Provenance / audit trail is becoming a procurement requirement; pre-bake SOC 2 roadmap, data residency story, and "captured by Collab" provenance metadata into v1 schema even if features ship later.

---

## Recommended positioning

**"The cloud layer for your team's AI work — works under everything you already use, owned by you."**

Differentiate on three axes simultaneously, none of which any single competitor combines:
1. **Tool/model/vendor agnostic** (vs. Cursor/Factory/Granola lock-in)
2. **Team artifact graph with git-style push** (vs. single-player Rewind/Mem/Recall)
3. **OSS + integrity-first install** (vs. closed-source capture players who already lost the trust war)

---

## Open questions to resolve before product brief

- License + governance model (Apache+TM vs. BSL vs. Fair-source) — affects everything downstream; resolve in `/bmad-domain-research`.
- ToS/legal posture for network-layer interception of closed tools (Claude Desktop, Cursor, ChatGPT) — same domain-research pass.
- v1 tool coverage: ship with N=3 deep integrations or N=10 shallow? Recommend N=3 (Claude Desktop, Cursor, ChatGPT web via extension) + network-layer fallback for everything else.
- Pricing experiment: free-forever solo tier vs. time-limited team trial — affects viral coefficient.
