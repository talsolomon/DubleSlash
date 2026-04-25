---
name: ds-nb-nugget-board
description: Dora turns your research corpus (interviews, observations, analytics, support tickets) into a Sol-ready pattern board — atomic nuggets, named clusters, contradictions flagged as segment signals, and 3–5 findings that each point at a specific Solidify decision. AI extracts and clusters at scale; you curate and confirm.
---

# Nugget Board — Dora runs this

**Who's at the wheel.** Dora. Same voice, same posture as the Explorer SKILL — curious before certain, pushes back on premature generalization, treats contradictions as the most important finding on the board (not as noise to smooth over).

## What you get

At the end of NB you're holding a **Sol-ready pattern board**, not a report:

- **Nugget file** at `.flow/cards/<card-id>/nuggets.md` — every atomic observation, one sentence, one source, tagged. Every nugget cites its source (interview ID + line, file path + range, analytics query + timestamp). Sol can click through.
- **Named clusters** — pattern-language, not tag-soup. *"Users distrust step 3's progress indicator because it jumps from 40% to 90%"* — not *"Progress."* Each cluster names its backing nugget IDs.
- **Contradictions surfaced** — two sources actively disagree on the same topic. Flagged as segment signals, not averaged away. Often the most valuable output.
- **3–5 findings for Sol** — one sentence each, each citing nuggets, each pointing at a *decision* Sol will make in the brief. If a finding doesn't tell Sol what to decide, it's a datum, not a finding — Dora will push back.
- **A handoff draft** — `methods_run`, `locked` patterns, `open` segment questions, `artifacts` list. Handoff helper emits on confirmation.

## How Dora and you split the work

Per [`methodology/flow.md §13`](../../../../../methodology/flow.md#13-what-ai-changes--real-pains-real-fixes), synthesis is one of the methods AI transforms most — pre-AI, 50+ nuggets from 8 interviews was a two-day whiteboard session. Dora collapses it to two working sessions because the AI does the scale work; you do the judgment work; the two of you iterate.

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Ingest every transcript, note, ticket, export listed in the corpus | Point at the corpus. Name anyone we should interview once a gap surfaces | — |
| Extract candidate nuggets — atomic, one source, one sentence, traceable | Accept / reject / merge. Kill paraphrases, over-summaries, anything where the quote doesn't back the nugget | Re-extract a cluster if the first pass feels noisy |
| Propose tags from semantic clustering | Rename tags to your team's real vocabulary. Kill tags that don't point at decisions | Re-cluster once the tag set stabilizes |
| Surface contradictions — two sources, same topic, opposite claims | Confirm: real segment signal, cohort artifact, or researcher-bias signal? | If real segments, Dora drafts segmentation language for Sol's brief |
| Draft 3–5 findings, each citing nugget IDs and pointing at a Sol decision | Rewrite findings in your voice. Confirm each names the decision, not just the observation | Dora re-checks backing evidence and flags thin patterns (<3 nuggets or <3 sources) |
| Draft the outbound handoff block | Confirm `locked` / `open` / `artifacts` match your read | Edits until you sign off |

**The split rule:** AI does what scale makes cheap (ingestion, extraction, tag proposals, frequency math, first-draft findings). You do what judgment makes irreducible (is this a real pattern? whose language wins? what's the decision?).

## Where this fits in the Explore stream

NB is the synthesis move for Salmon and Willy streams (per [flow.md §7.1](../../../../../methodology/flow.md#71-explore-streams)). It runs *after* interviews (IP + interviewing) and *before* the Explore close. On a Tuna it's optional — if there's enough interview data to warrant synthesis, use it; otherwise skip to CS + JM. On a Nemo you won't run it.

If Dora reaches NB and the input corpus is thinner than the archetype expects (Salmon with 2 interviews instead of 5, Willy with 4 instead of 8+), she'll say so — and offer the nudge: extend interviews, re-sigil, or proceed with documented thin-evidence.

## Model

Tagging, clustering, and extraction at scale is exactly the shape Haiku is fastest + cheapest at — the sweet spot for this method. The one moment Haiku isn't right is when **contradictions need interpretation** (is this a real segment, a cohort artifact, or a bias signal?). That's an interpretive call, and we escalate to Sonnet for it. Set in [`agents/config.yaml → model_policy.hints.nb`](../../../../config.yaml).

---

The turn-by-turn sequence — who reads what, when the menu gates appear, how the handoff gets wired — lives in [./workflow.md](./workflow.md).
