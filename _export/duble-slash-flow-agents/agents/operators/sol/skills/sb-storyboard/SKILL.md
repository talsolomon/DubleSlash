---
name: ds-sb-storyboard
description: Sol produces a 4–6 panel storyboard of the user journey for this card. Tuna standard (pre-brief) and Willy (inside the pitch). Each panel has a caption; the arc ends in the locked shape's success state. Surfaces gaps that the brief or pitch has to cover.
---

# Storyboard — Sol runs this

**Who's at the wheel.** Sol. Narrative mode — the storyboard is a forcing function. Drawing the flow as panels makes the gaps visible in a way a bullet list won't.

## What you get

At the end of SB you're holding:

- **A 4–6 panel storyboard** at `planning/shapes/sb-<card-id>-<date>.md` — each panel captioned, each arrow labeled, ending in the success state the shape is trying to produce.
- **A gap list** — what Sol couldn't draw because it was undefined (authentication boundary, error state, empty state, etc.). These feed the brief or pitch directly as AC categories.
- **A journey-level decision log** — where the user's path branches, Sol names the default branch and rejects the alternatives with a one-line reason. Goes into DL on Willy.
- **A next-method call** — typically BR (Tuna) or PT (Willy, if SB runs inside pitch drafting).

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Read the incoming handoff, journey map (if present), HMW | Confirm the starting state of panel 1 matches reality (what the user is actually doing today) | If the starting state is off, the whole storyboard misaligns; we reset |
| Propose 4–6 panels with one-line captions each | Correct captions, add a panel, collapse two that are redundant | Sol redraws; we aim for 4–6, not 8–10 |
| Name branch points — where the user's path can diverge | Confirm which branches exist in reality vs. theoretical ones | Sol trims theoretical branches |
| Surface gaps — panels Sol couldn't draw because of undefined behavior | Add gaps you noticed that Sol couldn't (institutional knowledge) | Each gap becomes an AC category in the downstream brief |

**The split rule here.** Sol is good at panel structure and caption tightness; you're good at knowing which branches exist in your product and which are straw-branches. The storyboard is only honest if the branches are real.

## Where this fits in the Solidify stream

SB is a **Tuna pre-brief move** — per [solidifier.md §4](../../../../../methodology/local-agents/solidifier.md#4-axis-modulation-streams-per-archetype), Tuna Solidify is `SB → BR → WF → AC`. On Willy, SB runs **inside** the pitch (PT) rather than as a standalone artifact — the storyboard is a sub-section of the pitch doc. SB does not run on Nemo (too heavy; one sketch is enough) and rarely runs on Salmon (the concept test IS the storyboard — see CT).

## When SB refuses to emit

- **No HMW or framing** — storyboard without a destination is just panels. Refuse and ask for framing.
- **Sigil is Nemo** — wrong tool. Redirect to SK.
- **Panels expanding beyond 6** — a storyboard is 4–6 panels. If the card needs more, it's a Willy and needs PT; Sol offers to re-sigil.

## Model

Panel generation + caption writing + branch-point naming is narrative work with judgment. **Sonnet** — a Haiku storyboard comes back as screen-grabs with no narrative arc. Set in [`agents/config.yaml → model_policy.hints.sb`](../../../../config.yaml).

---

The panel structure, branch-point identification, gap surfacing, and next-method branching live in [./workflow.md](./workflow.md).
