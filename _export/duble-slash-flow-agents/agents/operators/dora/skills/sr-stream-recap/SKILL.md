---
name: ds-sr-stream-recap
description: Dora produces a ≤150-word narrative recap of what just ran in this card's Explore phase — methods, top findings, the one deferred thing, confidence to advance. Reads in 30 seconds. Lands in the outbound <FLOW-handoff>'s notes field. A teammate picking up cold can orient without reading every method output.
---

# Stream Recap — Dora runs this

**Who's at the wheel.** Dora. Economy mode — her job here is compression, not summary. The word budget is the point: if SR runs over 150 words, something is leaking from method outputs into the recap, and that's the wrong place for detail.

## What you get

At the end of SR you're holding:

- **A ≤150-word narrative** written in Dora's voice, structured in 4 sentences: (1) methods run at archetype-intensity + the list, (2) one key finding, (3) optional second key finding, (4) deferred or open item, (5) confidence to advance.
- **A Sol-readable summary** — enough to tell Sol what happened without requiring her to read the full method outputs first.
- **The `notes` field content for the outbound handoff** — SR is the default source for the `notes` field in `ds-handoff-compose`.
- **An attachment decision** — attach to the current HO draft (the default), or keep standalone if you're running SR mid-phase rather than at exit.

## How Dora and you split the work

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Read `{card_folder}/<card-id>/history.log` to list every method run and its order | Confirm if a method was technically run but is unsuitable for the recap | Dora trims if you flag |
| Read each method's output file; extract the one-line takeaway | Correct takeaways Dora summarized wrong | Dora rewrites the takeaway based on your reading |
| Draft the recap in Dora's voice, in ≤150 words | Tighten to your team's language; kill fluent-sounding phrases that don't point at something | Dora re-drafts with your edits baked in |
| Self-check for phase-violation smells (Solidify language leaking in: "locked," "AC," "brief") | Flag any Solidify-language you see; Dora rewrites | — |
| Propose a confidence score for the outbound handoff based on method coverage | Override the score if Dora is over- or under-confident | — |
| Offer to attach to the HO draft (default) or return standalone | Decide where it goes | — |

**The split rule here.** AI is good at compression under a word budget; you're good at knowing which finding *your team* will care about. Dora's first draft is a starting point — your one-sentence rewrite of the key finding is almost always better than Dora's.

## Where this fits in the Explore stream

SR runs **at phase exit, just before HO** — it's the narrative companion to the `<FLOW-handoff>` block. The block carries the structured state (sigil, artifacts, decisions, open items); SR carries the human-readable read-in for the next operator or teammate.

SR can also run **mid-phase** as a checkpoint — useful on Willies where you've run 5 methods over a week and want to see the trail compressed before deciding whether to run another method or close the phase. Standalone SRs are logged but don't emit a handoff.

## Model

Summarization under a tight word budget is **Haiku** territory — it's the core shape of the work. The only escalation to Sonnet is when the trail spans 5+ methods with contradictory findings that need interpretive compression to fit under 150 words coherently. Rare. Set in [`agents/config.yaml → model_policy.hints.sr`](../../../../config.yaml).

---

The trail gather, compression pass, phase-violation check, and attachment flow are in [./workflow.md](./workflow.md).
