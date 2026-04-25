---
name: Duble Slash Methodology — folder index
description: Top-level index for the FLOW methodology (the AI-era evolution of the 2024 Fish Model), local agents (run inside the user's AI tool), and system agents (run in Duble Slash Cloud). This is the moat.
type: methodology-index
---

# Duble Slash Methodology

> **This folder is the moat.** Everything else in Duble Slash — the capture layer, the Duble Slash Cloud, the cross-tool handoff, the pricing model — serves a single purpose: *giving humans who work with AI a method that doesn't break under them*. The method is **FLOW** — the AI-era evolution of the 2024 Fish Model. The agents in this folder are what enact it.

---

## What lives here

```
methodology/
├── flow.md                         ← THE spec · one doc · read this first
├── agents-overview.md              ← all 13 agents in one map
├── fish/                           ← SUPERSEDED by flow.md — pending deletion in Phase 4
│   ├── README.md                   (merged into flow.md §§1–5)
│   ├── phases-and-methods.md       (merged into flow.md §§5–8)
│   ├── human-ai-collaboration.md   (merged into flow.md §13; my §8–10 primitives retired)
│   ├── contracts.md                (retired — primitives deferred per Tal 2026-04-23)
│   ├── transitions-and-handoffs.md (merged into flow.md §§9–11)
│   └── use-cases.md                (merged into flow.md §14)
├── local-agents/                   ← 4 personas the user invokes via `//` (pre-rebuild)
│   ├── README.md                   roster + universal contract + capability codes
│   ├── explorer.md                 phase 1 · head · Dora   (renamed from Nova, Phase 3+4)
│   ├── solidifier.md               phase 2 · left body · Sol
│   ├── builder.md                  phase 3 · right body · Bran (renamed from Bram, Phase 3+4)
│   └── shipper.md                  phase 4 · tail · May    (renamed from Sage, Phase 3+4)
└── system-agents/                  ← 9 background workers in Duble Slash Cloud
    └── README.md                   Tally · Cipher · Relay · Beacon · Pack ·
                                     Echo · Twin · Gate · Loom
```

> **Note (2026-04-23 rebuild — Phase 1 revision):**
> Phase 1 deliverable is **`flow.md`** — one authoritative doc that supersedes every file
> in `fish/`. Primitives (`contracts.md`) deferred until the methodology is solid and an
> agent rebuild is underway. The `fish/` folder is kept in place to preserve references
> until the Phase 4 directory reorganization retires it atomically.

---

## Three layers, one methodology

| Layer | What it is | Where it runs | Who invokes it | Ships in |
|---|---|---|---|---|
| **Methodology** (`flow.md`) | The spec — phases, fish types, steps, methods, handoffs, agent posture. | One document. Everyone reads it. | n/a | Day 1 |
| **Local agents** (`local-agents/` → `agents/operators/`) | Four phase-shaped personas the user's AI tool adopts when they type `//`. | Inside Claude Desktop / Cursor / ChatGPT Desktop (as memory/instructions). | User, via `//{phase}` | OSS launch |
| **System agents** (`system-agents/`) | Background workers in Duble Slash Cloud that observe, protect, and route between tools and teammates. | Duble Slash desktop client + hosted backend. | Continuously; no user invocation. | Capture + Redaction → OSS launch; rest → V1 |

**Local and system agents are complementary, not redundant.** While the user talks to the Explorer inside Claude, the Capture agent is recording the session, the Redaction agent is gating any push, and the Sync agent (V1) is syndicating the result to teammates. FLOW is the shared vocabulary that lets all of them cooperate without stepping on each other.

---

## How to read this folder

- **Which agent do I reach for / who are all these agents?** → [`agents-overview.md`](./agents-overview.md). The single-file roster + hierarchy + task-lookup.
- **New to Duble Slash / FLOW:** start at [`flow.md`](./flow.md). One doc, every concept.
- **"Why should I care as a designer using AI?":** [`flow.md` §13](./flow.md#13-what-ai-changes--real-pains-real-fixes). The 5-minute pitch.
- **"What do I actually *do* in each phase?":** [`flow.md` §5–7](./flow.md#5-the-four-phases-fish-anatomy).
- **"Show me a real example":** [`flow.md` §14](./flow.md#14-worked-examples--one-per-archetype).
- **Installing the `//` agents:** [`local-agents/README.md`](./local-agents/README.md).
- **Building / reviewing Duble Slash's background workers:** [`system-agents/README.md`](./system-agents/README.md).

---

## Core principle (from the article, restated)

> *"Communication is the key to success."*
> — The Fish Model, 2024

FLOW is a communication contract, dressed as a methodology. The phases, fish types, and handoffs exist so that **designer ↔ developer ↔ PM ↔ AI ↔ future-you** all describe the same work the same way. Everything in this folder is downstream of that principle.

---

## Status & ownership

- **Owner:** Tal
- **Last full revision:** 2026-04-24 (renamed FISH → FLOW; methodology consolidated into single `flow.md`)
- **Source lineage:** <https://www.talsolomonux.com/p/0d2> (the 2024 article introducing the Fish Model) + subsequent blog posts cataloging the method set (see [`flow.md` §8](./flow.md#8-method-catalog)).
- **Change protocol:** edits to `flow.md` must be reflected in `local-agents/*` and `system-agents/*` within the same change if they alter phase names, axis semantics, or handoff shape. There is one source of truth per concept; files cross-reference rather than duplicate.
