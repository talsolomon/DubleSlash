# Brainstorm — Collab (the AI-work capture & collaboration layer)

**Date:** 2026-04-20
**Facilitator persona:** VC founder, AI-domain focus
**HMW question:** *How might we turn every individual's fragmented AI work — scattered across Claude, Cursor, Perplexity, VS Code — into a shared, living project surface where teams of humans and agents move work forward through one coherent process, without forcing anyone off their tool of choice?*

**Confirmed framing constraints (from user, 2026-04-20):**
- Capture layer is the **wedge and moat**.
- Tool-, model-, and vendor-agnostic.
- Open-source core + paid features (Supabase / Cal.com / PostHog playbook).
- It is **a layer, not a new tool** — explicitly NOT Linear, NOT ClickUp, NOT an IDE.
- Two views on top: Linear-like (tasks/projects) and GitHub-like (pushes/branches).
- **Integrity/trust marketing is a first-class GTM pillar** — users will be scared of a layer that sees all their AI work.
- GTM: free distribution to design and dev communities via a "super happy" site.

---

## Ideas Generated

### Capture infra (the moat)
- Network-layer LLM-call interception — tool-agnostic from day 1, every current and future tool works automatically ← **Selected**
- Per-app adapters for the top 10 tools (Claude Desktop, Cursor, VS Code/Copilot, Perplexity, ChatGPT, Gemini, Windsurf, Zed, Raycast AI, Warp)
- Browser extension for web-based LLMs
- OS-level Recall-style screen capture as a fallback for tools with no API surface

### Trust surface (the GTM unlock)
- Always-visible capture indicator: "🟢 Capturing · 3 apps · encrypted locally · you control pushes." ← **Selected**
- One-click redact — auto-detect PII/secrets/client names before push
- Local-first encryption; key never leaves the device unless user opts in
- Public audit log of what left the device and when
- Open-source the capture client so anyone can inspect it

### Team artifact graph (the product people pay for)
- Push model with prompt-PRs and branching — git mental model for AI work ← **Selected**
- Threadable, diffable prompts across models ("which model won?")
- Universal search across every teammate's AI work
- Retroactive context bundle auto-assembled for new joiners
- Live presence — who's working on what project right now, across tools

### Process layer (the v2 / community play)
- `flow.yaml` — declarative, forkable methodology spec enforced by system agents ← **Selected**
- Post-Agile framework inspired by Double Diamond + Fish methodology
- Every card carries brief, source, context, goal, repository
- Agent-narrated morning standup digest
- Personal AI twin that stands in for you on simple async questions

### Presence / feed (retention)
- "Today at a glance" teammate activity feed (GitHub-contrib-graph style for AI work)
- Figma-style live cursors across tools
- Agent-narrated 90-second team digest

---

## Top Ideas

| Idea | Impact | Feasibility | Notes |
|---|---|---|---|
| Network-layer LLM-call interception (tool-agnostic capture) | H | M | The moat. Hard engineering but only has to be solved once. |
| Always-visible capture indicator + one-click redact + local-first | H | H | Trust is the GTM blocker; fix it upfront, not later. |
| Git-style push model with prompt-PRs and branching | H | M | The product people pay for. Differentiates from Rewind/Mem/Granola. |
| Zero-config install ("drag the .dmg, sign in once") | H | H | The Dropbox-icon moment. First impression = retention. |
| Retroactive context bundle for new joiners | H | M | Killer demo; turns captured data into obvious value. |
| `flow.yaml` declarative methodology enforced by agents | H | L | Huge if it lands — but ships v2, not v1. Needs real session data first. |
| "Today at a glance" activity feed | M | H | Cheap retention hook; builds on captured data. |
| Personal AI twin for async questions | M | L | Cool demo; low near-term ROI. |

---

## Recommended direction

**Bet on the capture layer + push model as the wedge.** Ship "the cloud icon for AI work" — tool-agnostic capture, local-first, git-style push to a team artifact graph — and let the Linear-view + methodology grow *out of* the data, not beside it. OSS the capture client and protocol; monetize the team graph, search, and agent orchestration on top. The new methodology ships as `flow.yaml` in v2, once real captured sessions prove what a post-Agile flow should look like.

**Why this wins:** every competitor owns one slice — Granola/Rewind (capture), Cursor Teams/Factory (collab), Linear/Shape Up (process). Nobody owns all three via a transparent, vendor-agnostic layer. The capture layer is the only one of the three with a compounding data moat, and the trust-first install experience is the only realistic way to get it adopted.

---

## Competitive landscape (reference)

- **Capture / personal memory:** Granola, Rewind.ai, Mem, Microsoft Recall, Raycast AI, Glean
- **Agent collaboration:** Factory.ai, Cognition/Devin, Sourcegraph Cody Teams, Augment, Multi, Cline
- **AI-native PM:** Linear + AI, Height, Stepsize AI, Unwrap, ClickUp Brain
- **Methodology:** Shape Up (Basecamp), BMAD, Impact-driven delivery
- **IDE/team collab:** Cursor Teams, Zed, Windsurf, GitHub Copilot Workspace
- **Design collab (mental model reference):** Figma, Miro, FigJam

---

## Open risks to pressure-test next

1. **Legal/ToS of capturing from closed tools** (Claude Desktop, Cursor, ChatGPT). Network interception may violate ToS of some providers — need legal read.
2. **Enterprise procurement will require SOC 2 / data residency** on day one, not year two. Trust marketing only works if the substrate is actually defensible.
3. **"Open-source + we own the credit"** needs a clear governance model (BSL? Apache + trademark? Fair-source?). Pick before community launch.
4. **The new methodology is the biggest adoption risk.** Shape Up worked because Basecamp dogfooded it for a decade first. Collab doesn't have that runway — needs a sharper story for why teams would abandon Agile.

---

## Next steps

- [ ] **Market research** → `/bmad-market-research` — deep dive on Granola, Rewind, Cursor Teams, Factory, Glean as direct/adjacent competitors; size the "AI-native teams" TAM.
- [ ] **Product brief** → `/bmad-create-product-brief` — lock the wedge (capture + push), define v1 scope, articulate the trust/integrity narrative.
- [ ] **Domain research** → `/bmad-domain-research` — legal/ToS analysis of capture methods across top 10 LLM tools; OSS license + governance recommendation.
- [ ] **Brainstorm round 2** (optional) — dedicated session on the `flow.yaml` methodology once v1 wedge is locked.
