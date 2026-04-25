---
name: ds-dl-decision-log
description: Sol logs each major Solidify decision — options considered, chosen, reasoning, reversibility, revisit conditions. Willy standard (required per §7.2); optional on Tuna/Salmon for load-bearing choices. The log is the memory that keeps future-you honest about why the rejected paths were rejected.
---

# Decision Log — Sol runs this

**Who's at the wheel.** Sol. Historian mode — the DL is how a Willy stays coherent across weeks. Every rejected option gets a reason and a reversibility score, so revisits are principled, not wrong-way rebuilds.

## What you get

At the end of DL you're holding:

- **A decision log entry** at `planning/decisions/dl-<card-id>-<n>.md` (or embedded in PT) using the [solidifier.md §8.5](../../../../../methodology/local-agents/solidifier.md#85-decision-log-dl-entry-template) template.
- **A decision title** — short, unique, dated.
- **Options considered (2–4)** — A/B/C with pros and cons each.
- **Chosen option + reasoning** — 1–3 sentences on why this beats the alternatives.
- **Reversibility score** — low / medium / high. Load-bearing — Willy tradeoffs depend on it.
- **Revisit conditions** — named conditions under which this decision should be reopened (new evidence, regression, stakeholder shift, compliance change).
- **A chain link** — if this DL entry supersedes a prior one, it references the superseded entry.

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Propose the decision title + one-line frame | Correct if the decision is actually narrower or broader than Sol captured | — |
| List 2–4 options considered with one-line pros/cons each | Add options Sol couldn't see (internal politics, prior attempts, vendor constraints) | Sol adds them with attribution |
| Propose the chosen option with reasoning | Accept / amend; if amended, Sol rewrites reasoning to match | — |
| Propose reversibility score | Override — you know the real cost of reversal in your system | — |
| Propose revisit conditions | Add conditions Sol couldn't know (regulatory, team-specific) | — |
| If this supersedes a prior DL, link it | — | — |

**The split rule here.** Sol can enumerate options and propose a reasoning structure; you supply the reversibility reality (how expensive is backing this out?) and the revisit triggers. DL's value is forward in time — whoever revisits this in 6 months reads your revisit condition and the reversibility score, not Sol's.

## Where this fits in the Solidify stream

DL is the **Willy standard** — per [methodology/flow.md §7.2 Willy Solidify](../../../../../methodology/flow.md#72-solidify-streams) step 7, "Decision log — every major Solidify decision with reasoning and alternatives." DL entries are embedded in PT or written standalone and linked. On Tuna, DL is optional but valuable for load-bearing choices (e.g., picking a component library extension). On Salmon, optional — usually the CT results replace DL for the main shape decision. On Nemo, DL is gold-plating; skip.

## When DL refuses to emit

- **Only one option** — that's not a decision, it's a default. DL refuses and asks for 2+ options or accepts the default as-is in the brief/pitch.
- **Reversibility is "none"** — Sol flags it. A one-way door needs explicit escalation before logging.
- **Revisit conditions are "never"** — that's also a one-way door; Sol flags it for stakeholder awareness.

## Model

DL is structured + reasoning-weighted — options enumeration is Haiku-shaped, but the reasoning + reversibility + revisit sections reward judgment. **Sonnet** by default — Haiku tends to write generic revisit conditions ("if it doesn't work") instead of specific ones ("if new-user activation doesn't exceed baseline by week 6"). Set in [`agents/config.yaml → model_policy.hints.dl`](../../../../config.yaml).

---

The option enumeration, reasoning draft, reversibility scoring, and chain-linking to prior DLs live in [./workflow.md](./workflow.md).
