---
name: ds-cs-competitor-scan
description: Dora surveys 3–5 parallel interfaces (or products solving an adjacent problem), names conventions + deviations + anti-patterns, and — for Salmon/Willy — maps parallels against positioning axes. Sized to the sigil (Nemo uses 1 parallel; Willy 5–8). Not a copy exercise; a learning exercise.
---

# Competitor Scan — Dora runs this

**Who's at the wheel.** Dora. Pattern-reader mode — scan to *learn what's load-bearing*, not to copy the winners or dismiss the losers. *"They all do X"* usually means X is load-bearing for a reason.

## What you get

At the end of CS you're holding:

- **A scan document** at `planning/scans/cs-<card-id>-<date>.md` — one section per parallel, each filled on 4 dimensions (convention adopted · deviation from default · why it works · what to steal or avoid).
- **3–5 conventions named and justified** — the patterns everyone adopts. These are likely your defaults too; if not, Dora flags the tension for Sol.
- **2–3 deviations worth considering** — where a parallel did something different from the convention and it seems to work. Worth testing in Solidify.
- **Anti-patterns flagged** — things multiple parallels do badly. You don't learn these by scanning winners; you learn them by noticing what's consistently broken.
- **A positioning-axis map** (Salmon/Willy only) — 2 axes that matter for this space, each parallel placed on both, empty quadrants named as either opportunities or known non-viable.
- **A handoff-ready summary** — the conventions + deviations become `locked` entries; the empty quadrants and open questions become `open` entries for Sol.

## How Dora and you split the work

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Read the card + sigil + HS output (if run) | Name the parallels you already have in mind — domain leaders, weird outliers, internal prior art | Dora fills in additional parallels from adjacent industries or class-of-product, attributed |
| Scan each parallel on the 4 dimensions (convention / deviation / why / takeaway) | Correct Dora's inference where she's wrong — she's reading screenshots and second-hand writing, you've often used the product | Dora rewrites the entry based on your lived experience, flagging where she's reasoning vs. you're remembering |
| Extract 3–5 conventions consistent across parallels | Kill conventions that don't actually apply in our context (wrong user, wrong platform, different business model) | — |
| Extract 2–3 deviations worth testing | Flag deviations that worked in that parallel's context but won't in ours (scale, regulatory, audience) | — |
| Surface anti-patterns — things multiple parallels do badly | Add anti-patterns from your own product history that didn't show in the scan | — |
| For Salmon/Willy: draft the positioning-axis map | Pick the 2 axes that actually matter for your team's strategic choice; reject Dora's if they're generic | Dora re-places parallels on the axes you chose |

**The split rule here.** AI can enumerate parallels and extract visible patterns — but value-judgments about *"is this the right lesson to draw from X?"* are yours. Don't accept conventions just because they're consistent; interrogate why, and whether that why applies to your product.

## Where this fits in the Explore stream

CS is in the **Nemo cell** (one parallel, quick check) and the **Tuna cell** (3–5 parallels, convention inventory). For Salmon/Willy, CS deepens into the positioning-axis map — useful when the card is touching a strategic choice, optional when it's pure execution.

On a Nemo, CS often runs alongside HS — together they close Explore. On Willys, CS is one leg of the stool alongside IP, PM, and journey work.

## Model

Aggregating patterns across parallels is **Haiku** territory — mostly enumeration and compare-across. The escalation to Sonnet is the positioning-axis map on Salmon/Willy, where interpretation (*"these two parallels are on the same quadrant but succeeding for different reasons"*) matters more than enumeration. Set in [`agents/config.yaml → model_policy.hints.cs`](../../../../config.yaml).

---

The per-parallel 4-dimension scan, the conventions/deviations extraction, and the positioning-axis pass are in [./workflow.md](./workflow.md).
