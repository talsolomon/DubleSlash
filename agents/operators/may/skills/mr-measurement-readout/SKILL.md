---
name: ds-mr-measurement-readout
description: May runs the post-release measurement readout — re-query each MP metric, compute delta from baseline, compare to target, write a learning log. Salmon and Willy. Required to close the loop. Refuses wishful interpretation; calls a miss a miss.
---

# Measurement Readout — May runs this

**Who's at the wheel.** May. Honest-reader mode — MR's job is to read the post-release numbers and write what the data says, not what the team hoped. A miss called a miss is the foundation of the next loop's Explore. A miss spun as a hit kills the methodology.

## What you get

At the end of MR you're holding:

- **A readout document** at `planning/measurement/mr-<card-id>-<date>.md` containing: per-metric delta, hit/miss vs target, statistical sanity, learning log.
- **A delta per metric** — `baseline → post-release`, with the absolute and percentage change.
- **A hit/miss verdict** — for each metric: hit (target met or exceeded), miss (target missed), inconclusive (sample too small or window contaminated).
- **A learning log** — 1–3 sentences on what we learned about *the user*, not just about the feature. ("Meter placement matters more than wording" beats "the feature drove a 5% lift.")
- **Inputs to NL** — the learnings + the surprises feed the Ship → Explore handoff that queues the next iteration.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Re-run the MS-saved queries against the post-release window | Provide dashboard access if May can't run the query | If May can't run, you run + paste; same as MS |
| Compute delta + percentage + direction | Confirm the direction matches what MP said (some metrics are "decrease is good") | One turn — May adjusts framing |
| Apply hit/miss/inconclusive verdict against target | Sanity-check sample size + statistical significance if rigor matters | Loan in `@statistician` for rigor calls |
| Draft the learning log — what we learned about the *user* | Sharpen if May's language drifts toward "the feature performed well" instead of user insight | — |
| Flag surprises May noticed but doesn't have context for | Add operational context (incident during the window, marketing push, etc.) | — |

**The split rule here.** May can read the numbers and compute deltas; you know what the numbers actually mean for your customer. MR is only honest if the verdict resists wishful interpretation — "trended in the right direction" without hitting target is a miss with a softer label, not a hit.

## Where this fits in the Ship stream

MR applies to **Salmon and Willy** (per [shipper.md §4](../../../../../methodology/local-agents/shipper.md#4-axis-modulation-streams-per-archetype)). Salmon: MR runs at the readout date set in MS (typically baseline + 2 weeks). Willy: MR runs per stage (alpha MR before promoting to beta; beta MR before GA; GA MR for the master TR + retro). MR runs **after** the release window has elapsed, **before** NL — the learnings inform the next-loop framing.

## When MR refuses to emit

- **No baseline (MS didn't run)** — refuses. *"No baseline; nothing to compare. The most honest readout is 'we shipped without measurement; flagging the gap for the next loop.'"*
- **Window not yet elapsed** — refuses; surfaces the schedule and asks whether to shift the readout date or wait.
- **Wishful interpretation requested** — *"Frame this as a win"* — refuses. Names the rule (anti-pattern from [shipper.md §11](../../../../../methodology/local-agents/shipper.md#11-anti-patterns): no measurement = you ship and never learn; spinning a miss = same outcome). Offers honest alternatives: "The miss + the surprise is the actual story; that's what feeds NL."
- **Sample too small for rigor** — flags inconclusive; refuses to call hit/miss until sample window is adequate (or user explicitly downgrades to "directional only").

## Model

MR is honest reading + interpretive judgment — picking which surprise matters, naming the user-insight (not the feature performance), resisting wishful framing. **Sonnet** default. Haiku MRs come back as feature-performance summaries; Sonnet MRs name what we learned about the user. Set in [`agents/config.yaml → model_policy.hints.mr`](../../../../config.yaml).

---

The query re-run, delta computation, hit/miss verdict, learning-log composition, and NL-input prep live in [./workflow.md](./workflow.md).
