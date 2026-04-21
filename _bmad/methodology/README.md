---
name: Duble Slash Methodology — folder index
description: Top-level index for the FISH methodology, local agents (run inside the user's AI tool), and system agents (run in Context Cloud). This is the moat.
type: methodology-index
---

# Duble Slash Methodology

> **This folder is the moat.** Everything else in Duble Slash — the capture layer, the Context Cloud, the cross-tool handoff, the pricing model — serves a single purpose: *giving humans who work with AI a method that doesn't break under them*. The method is FISH. The agents in this folder are what enact it.

---

## What lives here

```
_bmad/methodology/
├── agents-overview.md              ← START HERE · all 13 agents in one map
├── fish/                           ← the methodology itself
│   ├── README.md                   overview, axes, archetypes, phases
│   ├── phases-and-methods.md       deep dive on the four phases + method catalog
│   ├── human-ai-collaboration.md   the moat — how FISH makes AI usable for designers
│   ├── use-cases.md                four worked scenarios (one per archetype)
│   └── transitions-and-handoffs.md gates, `<FISH-handoff>`, reverse flow
├── local-agents/                   ← 4 personas the user invokes via `//`
│   ├── README.md                   roster + universal contract + capability codes
│   ├── explorer.md                 phase 1 · head · Nova
│   ├── solidifier.md               phase 2 · left body · Sol
│   ├── builder.md                  phase 3 · right body · Bram
│   └── shipper.md                  phase 4 · tail · Sage
└── system-agents/                  ← 9 background workers in Context Cloud
    └── README.md                   Tally · Cipher · Relay · Beacon · Pack ·
                                     Echo · Twin · Gate · Loom
```

---

## Three layers, one methodology

| Layer | What it is | Where it runs | Who invokes it | Ships in |
|---|---|---|---|---|
| **Methodology** (`fish/`) | The spec — phases, archetypes, steps, methods, contracts. | Documents. Everyone reads it. | n/a | Day 1 |
| **Local agents** (`local-agents/`) | Four phase-shaped personas the user's AI tool adopts when they type `//`. | Inside Claude Desktop / Cursor / ChatGPT Desktop (as memory/instructions). | User, via `//{phase}` | OSS launch |
| **System agents** (`system-agents/`) | Background workers in the Context Cloud that observe, protect, and route between tools and teammates. | Duble Slash desktop client + hosted backend. | Continuously; no user invocation. | Capture + Redaction → OSS launch; rest → V1 |

**Local and system agents are complementary, not redundant.** While the user talks to the Explorer inside Claude, the Capture agent is recording the session, the Redaction agent is gating any push, and the Sync agent (V1) is syndicating the result to teammates. FISH is the shared vocabulary that lets all of them cooperate without stepping on each other.

---

## How to read this folder

- **Which agent do I reach for / who are all these agents?** → [`agents-overview.md`](./agents-overview.md). The single-file roster + hierarchy + task-lookup.
- **New to Duble Slash / FISH:** start at [`fish/README.md`](./fish/README.md).
- **"Why should I care as a designer using AI?":** [`fish/human-ai-collaboration.md`](./fish/human-ai-collaboration.md). This is the 5-minute pitch.
- **"What do I actually *do* in each phase?":** [`fish/phases-and-methods.md`](./fish/phases-and-methods.md).
- **"Show me a real example":** [`fish/use-cases.md`](./fish/use-cases.md).
- **Installing the `//` agents:** [`local-agents/README.md`](./local-agents/README.md).
- **Building / reviewing Duble Slash's background workers:** [`system-agents/README.md`](./system-agents/README.md).

---

## Core principle (from the article, restated)

> *"Communication is the key to success."*
> — The Fish Model, 2024

FISH is a communication contract, dressed as a methodology. The phases, archetypes, and handoffs exist so that **designer ↔ developer ↔ PM ↔ AI ↔ future-you** all describe the same work the same way. Everything in this folder is downstream of that principle.

---

## Status & ownership

- **Owner:** Tal
- **Last full revision:** 2026-04-21
- **Source lineage:** <https://www.talsolomonux.com/p/0d2> (the 2024 article introducing the Fish Model) + subsequent blog posts cataloging the method set (see `fish/phases-and-methods.md` §Method catalog).
- **Change protocol:** edits to `fish/README.md` must be reflected in `local-agents/*` and `system-agents/*` within the same change if they alter phase names, axis semantics, or handoff shape. There is one source of truth per concept; files cross-reference rather than duplicate.
