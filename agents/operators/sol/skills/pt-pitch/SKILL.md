---
name: ds-pt-pitch
description: Sol writes a multi-section Pitch/RFC — Problem · Tradeoffs · Shape · Alternatives · AC · MP · Risks · Rollout — using the solidifier.md §8.2 template. Willy-only. Carries TA + DL + concept-test results in-doc. Longer than a brief but still journey-structured, never a PRD.
---

# Pitch / RFC — Sol runs this

**Who's at the wheel.** Sol. Author mode — the pitch is the decision document. Not a slide deck, not a PRD. A narrative that makes the shape (and the rejections) legible to reviewers.

## What you get

At the end of PT you're holding:

- **A pitch document** at `planning/pitches/pt-<card-id>-<date>.md` using the [solidifier.md §8.2](../../../../../methodology/local-agents/solidifier.md#82-pitch--rfc-pt-template-willy-only) template: Problem & context · Tradeoff axes · Shape · Alternatives considered · AC · Measurement plan · Risks & mitigations · Rollout plan · Open to feedback on.
- **Tradeoff axes (TA) embedded** — 2–4 named axes with chosen positions, Sol ran TA inline during pitch drafting.
- **A decision log (DL) embedded** — the rejected alternatives with reasoning and reversibility for each major call.
- **Evidence from concept tests (CT)** — if CT ran in parallel, the pitch cites results in Shape and Alternatives.
- **A measurement plan** — baseline, target, instrumentation; no Willy ships without one.
- **Staged rollout plan** — internal → alpha → beta → GA, with measurement per stage.
- **A next-method call** — typically HO to Bran with a note on Tuna-sized sub-card split.

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Read incoming handoff + Explore artifacts (interviews, JTBD, premortem, market scan) | Confirm Sol read everything; flag missing evidence | Missing evidence → HB to Dora, not writing on guesses |
| Draft Problem & context — who, what hurts, why now, scope boundary | Sharpen "why now" and scope boundary (AI is bad at timing and at knowing what's out of scope in your org) | — |
| Run TA inline — 2–4 tradeoff axes with positions | Re-mark the positions; reject straw-axes | Sol redraws until axes are real |
| Propose Shape — 1–3 paragraphs + optional diagram | Accept, amend, reject | On reject-twice, Sol pauses and proposes CT to break the tie |
| Draft Alternatives considered — DL-style, with reasoning and reversibility | Add alternatives Sol couldn't see (internal politics, prior attempts) | Sol adds them with attribution |
| Run AC inline — multi-category for Willy (functional · UX · perf · compliance · business · per-stage) | Add edge cases Sol missed | Sol rewrites ambiguous bullets until each is independently checkable |
| Run MP inline — baseline, target, instrumentation, stop-the-line | Correct baseline + target (AI guesses badly here) | — |
| Carry forward risks from PM if Dora ran it | Add risks from recent incidents Sol couldn't know | — |
| Propose a staged rollout — named stages, measurement per stage | Adjust stages to match your org's release cadence | — |
| Propose `Open to feedback on` — specific questions for reviewers | Add questions you know reviewers will push on | — |

**The split rule here.** Sol can assemble the pitch structure and enforce the template correctly; you supply the substance — what's really been tried, what the org won't tolerate, which tradeoff axis is the real one. The pitch is as good as your substance; Sol keeps the document honest.

## Where this fits in the Solidify stream

PT is the **Willy-only** move — per [solidifier.md §4](../../../../../methodology/local-agents/solidifier.md#4-axis-modulation-streams-per-archetype), Willy Solidify is `PT + CT × 2–3 + TA + DL + AC + MP`. On Willy, PT runs the whole show: TA and DL are embedded, CT feeds the Shape section, AC and MP are sub-sections. PT does not run on Nemo/Tuna/Salmon — those use SK or BR.

## When PT refuses to emit

- **Sigil is not Willy** — wrong tool. Redirect: Nemo → SK; Tuna/Salmon → BR.
- **AC would not be written alongside** — no shape doc without AC. Sol refuses and runs AC inline.
- **Measurement plan missing** — Willys without MP are vanity projects (solidifier.md §11). Sol refuses HO and runs MP first.
- **`open` has unresolved research** — shaping on guesses at Willy scale is catastrophic. HB to Dora.
- **Pitch growing a table of contents** — PRD sprawl. Sol pauses and asks what can be deferred.

## Model

Pitches are long-form, interpretive, and adversarial — you're arguing for a direction against real alternatives for real reviewers. **Sonnet**, always. A Haiku pitch comes back as a feature list with headers. Set in [`agents/config.yaml → model_policy.hints.pt`](../../../../config.yaml).

---

The section-by-section drafting, TA + DL + MP embedding, CT-result integration, and staged-rollout scaffolding live in [./workflow.md](./workflow.md).
