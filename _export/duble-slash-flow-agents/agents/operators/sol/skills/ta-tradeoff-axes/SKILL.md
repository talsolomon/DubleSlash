---
name: ds-ta-tradeoff-axes
description: Sol names 2–4 tradeoff axes and marks the chosen position on each. Willy-standard — the axes frame the pitch's shape choice. Each axis is a real tension (flexibility ↔ usability, cost ↔ speed, breadth ↔ depth), not a strawman. Runs usually inside PT drafting.
---

# Tradeoff Axes — Sol runs this

**Who's at the wheel.** Sol. Framing mode — the axes are how reviewers argue with a pitch without re-opening the whole shape. Naming the tensions makes the choice legible.

## What you get

At the end of TA you're holding:

- **2–4 named axes** at `planning/shapes/ta-<card-id>-<date>.md` (or embedded in PT under `## Tradeoff axes`).
- **Each axis is a real tension** — `realtime ↔ async`, `push ↔ pull`, `library ↔ service`, `flexibility ↔ usability`, not a fake "good ↔ bad."
- **Chosen position marked on each axis** — with a one-line reason.
- **Rejected positions named** — "we're not at the extreme because {reason}."
- **A next-method call** — typically continue PT drafting with the axes embedded, or run CT if positions are genuinely uncertain.

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Propose 3–4 candidate axes from the card's domain + Explore artifacts | Reject strawman axes (any axis where one end is obviously wrong); add real ones Sol couldn't see | Sol revises — target 2–4 axes, all real |
| Propose chosen position on each axis with one-line reasoning | Mark your actual position; push back on Sol if the reasoning leans toward aesthetic preference vs. evidence | Sol rewrites reasoning to tie to evidence |
| Name what's rejected on each axis — why we aren't at the extreme | Add rejections with your context | — |

**The split rule here.** Sol can generate candidate axes that look reasonable; you know which axes are real in your product and which are academic. An axis where both ends are plausible tradeoffs is real; an axis where one end is obviously wrong is cover.

## Where this fits in the Solidify stream

TA is a **Willy move** — per [methodology/flow.md §7.2 Willy Solidify](../../../../../methodology/flow.md#72-solidify-streams) step 3, "Map tradeoffs on spectrum axes (flexibility ↔ usability, cost ↔ speed)." TA usually runs *inside* PT drafting as the second move (after problem framing, before shape), so the shape choice has a principled frame. Occasionally useful on Tuna for a particularly contested component-library decision, but that's rare.

## When TA refuses to emit

- **Sigil is not Willy (with rare Tuna exceptions)** — Sol asks why; if the answer is "we just want to see tradeoffs," Sol offers a lighter tool (e.g., DL with 2 options) rather than full TA.
- **Proposed axis has one obvious right answer** — Sol rejects the axis and asks for a real tension.
- **All axes point the same direction** — the card is either simple (use BR) or hiding the real tension; Sol pushes back.

## Model

Axis generation + position-reasoning is interpretive — naming the real tension is creative judgment. **Sonnet** is required. Haiku TA comes back with axes like "good ↔ bad" or "modern ↔ legacy," which aren't axes. Set in [`agents/config.yaml → model_policy.hints.ta`](../../../../config.yaml).

---

The axis-candidate generation, strawman filtering, position-reasoning pass, and PT-embed handoff live in [./workflow.md](./workflow.md).
