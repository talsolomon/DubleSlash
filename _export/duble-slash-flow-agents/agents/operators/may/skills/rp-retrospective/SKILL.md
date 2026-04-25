---
name: ds-rp-retrospective
description: May runs a post-GA retrospective for a Willy — what worked, what didn't, what to change next loop. Structured (process / shape / methods / collaboration). Outputs a retro doc that feeds NL. Willy-only; refused on smaller archetypes.
---

# Retrospective — May runs this

**Who's at the wheel.** May. Reflective mode — RP is the post-GA pause that converts a Willy's full arc (Explore → Solidify → Build → Ship across staged rollouts) into reusable lessons. Without RP, a Willy ships and the team carries the lessons in their heads — until they leave.

## What you get

At the end of RP you're holding:

- **A retrospective document** at `planning/retros/rp-<card-id>-<date>.md` structured around four lenses: Process, Shape, Methods, Collaboration.
- **What worked** — concrete moves the team should repeat.
- **What didn't** — concrete moves to change next time, with the proposed change.
- **Methodology feedback** — anywhere FLOW (the methodology) bent or broke under this Willy's load. Feeds back into [`methodology/flow.md`](../../../../../methodology/flow.md) revisions.
- **Action items** — 3–7 specific, owned, dated changes for the next loop.
- **A reference for the master TR** — the GA trust receipt cites the retro path.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Read the card history (CR, SL, GE, TE, UV, IN, RE, CM, CH, RN, TG, MS, MR per stage) | Add what May can't see — the Slack thread, the customer call, the late-night decision | One turn at a time per lens |
| Propose worked / didn't items per lens | Sharpen — May leans toward generic; you have specifics | — |
| Draft methodology-feedback notes (if any) | Confirm whether each note is a real methodology gap or a one-off | — |
| Propose action items with proposed owner + due date | Adjust ownership + dates to match team capacity | — |
| Write the retro doc | — | — |

**The split rule here.** May can run the structure and pull from card history; you carry the lessons that didn't make it into the artifacts. RP is only useful if the lessons are specific — a generic "communication could be better" retro fails the next-loop test.

## Where this fits in the Ship stream

RP applies to **Willy only** (per [shipper.md §4](../../../../../methodology/local-agents/shipper.md#4-axis-modulation-streams-per-archetype)). RP runs at GA, after the master TR is drafted but before NL — the retro learnings inform the Ship → Explore handoff. **Skipped on Nemo, Tuna, Salmon** — the smaller archetypes don't have enough surface to justify a retro; their lessons fit in the trust receipt's `notes`.

## When RP refuses to emit

- **Card not Willy** — refuses; redirects to TR notes for smaller archetypes. *"Retro for a Tuna is overhead. Lessons fit in the TR `notes` field."*
- **Card history empty** — refuses; without the trail of CR/SL/GE/TE/etc, RP has nothing to reflect on. Asks user to walk the timeline verbally if memory is the only source.
- **Asked to skip "what didn't work"** — refuses. *"A retro that only lists wins is celebration, not retrospective."*

## Model

RP is interpretive synthesis across a long timeline — adversarial reading of what the team did, willingness to name generative friction, judgment about what's reusable vs one-off. **Sonnet** default. Haiku retros come back as bulleted celebration; Sonnet retros surface the friction worth changing. Set in [`agents/config.yaml → model_policy.hints.rp`](../../../../config.yaml).

---

The four-lens structure, history-walk, action-item proposal, and methodology-feedback capture live in [./workflow.md](./workflow.md).
