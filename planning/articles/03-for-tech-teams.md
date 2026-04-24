---
title: The handoff your designer sent is finally readable
subtitle: How FLOW changes the spec-to-code boundary — for engineers, tech leads, and developer-PMs.
audience: developers, tech leads, staff engineers, engineering managers, developer-PMs
length: ~2,300 words
status: draft
author: Duble Slash
---

# The handoff your designer sent is finally readable

Every developer who has shipped with a design partner has received this message:

> *"Hey! Here's the Figma link [link]. Let me know if you have questions. The AC is in the ticket."*

You click the link. You see a screen. You see three screens. You see some annotations. You scroll down. You look for "States." You find "Hover / Active / Disabled" but not "Empty / Loading / Error." You open the ticket. The AC has three bullets, two of which are UX descriptions, not testable conditions. Somewhere in the thread a product manager has written *"should we also include the case where the user has no history?"* and nobody has answered.

You start coding anyway.

Three days later you have questions. You type them into Slack. You get answers asynchronously. Half are in the Figma comments. A quarter are in DMs. The rest never get written down. You ship. Two weeks later, a customer hits the empty state. You did not build the empty state. The empty state was never in the spec. The empty state was also never *not* in the spec.

This is the bug FLOW's handoff block exists to fix.

---

## Where the spec-to-code boundary breaks

There are a few specific failure modes in the classic design-to-engineering handoff, and they are all caused by the same thing: **the spec is not a contract, it is an impression**.

- The Figma file has visual detail but no decision log.
- The ticket has AC but no "why."
- The Slack thread has context but no canonical version.
- The PRD has scope but no priorities.
- Nobody can answer *"is this locked, or is this still up for discussion?"*

When a human designer and a human developer sit in the same room, most of this is patched over by conversation. You point at a screen. They say "oh that's just placeholder." Somebody writes "TODO" in the Figma frame. The tacit knowledge lives in the shared air of the room.

When the designer is running on Claude in one tab, the developer is running on Cursor in another, and neither agent has any idea the other one exists — the tacit knowledge evaporates. The handoff has to be **written**, or it effectively didn't happen.

FLOW's `<FLOW-handoff>` block is the written contract.

---

## The handoff block, concretely

At the boundary between phases, the exiting agent emits a block that looks like this:

```
<FLOW-handoff>
from: solidifier
to: builder
card_id: billing-history-redesign-2026-04
sigil:
  certainty: known
  size: bigger
archetype: tuna
phase_exited: solidify
locked:
  - "Hybrid list-plus-drawer pattern. Not a full-page redesign."
  - "Group invoices by billing period, newest first."
  - "Download per period (not per invoice) is in scope."
  - "Per-invoice download is deferred to v2."
  - "New component: <PeriodGroup>. Extends design system."
open:
  - "Empty state copy — product to decide between two drafts in notes."
artifacts:
  - "briefs/billing-history-brief.md"
  - "figma/billing-history-v3"
  - "specs/PeriodGroup-microinteractions.md"
  - "ac/billing-history-ac.md"
confidence_to_advance: 0.9
notes: |
  Storyboard in brief is source of truth for flow.
  Microinteraction spec covers group expand/collapse
  per Saffer's Triggers/Rules/Feedback/Loops model.
  AC includes functional, UX, a11y, and perf criteria.
  Empty state copy drafts A and B in brief appendix —
  PM to pick by Wednesday; not Build-blocking.
</FLOW-handoff>
```

You read this in thirty seconds. Now you know:

- **What's locked.** You do not re-open these. The drawer pattern is settled. Period-grouping is settled. Per-invoice download is explicitly out of scope. If your implementation needs to deviate from any of these, that is a **reverse transition** — you emit your own handoff back to the Solidifier with one sentence explaining why.
- **What's open.** The empty-state copy is the only thing still being decided. You also know it's not blocking your build — you can stub it, keep going, and swap when PM picks.
- **What your inputs are.** Four artifacts, all linked. Brief, Figma file, microinteraction spec, AC file.
- **How confident the designer is.** 0.9 is a clean green; they are not hedging.
- **Why Saffer.** Because microinteractions have canonical primitives and the designer used them. You know exactly what the expand/collapse spec covers without reading it.

This is what a handoff looks like when the method wrote it for you.

---

## The Build stream is a checklist, not a vibe

FLOW does not say *"go build the thing."* For each fish archetype, the Build phase has a named, ordered stream of steps. Here is the Tuna Build stream, verbatim:

1. Component library first — which library's primitives (Material, Radix, MUI, Ant) are we composing with?
2. Iterative prototyping — designer plus developer in a shared tool (Figma, Storybook, Zeplin).
3. Build in thin vertical slices — one user-visible capability per slice, not horizontal layers.
4. Microinteractions per Saffer — Triggers, Rules, Feedback, Loops/Modes.
5. Apply motion principles — 100–500ms, easing, restraint.
6. Run AC as test cases.
7. Joint review — designer plus dev plus PM review against the brief.
8. Close — emit handoff. `locked` is the built artifact and test status; `open` is follow-ups and known limitations.

None of this is radical. Most good engineering teams do this already. What FLOW adds is that the stream is **the same stream** across every Tuna. Your teammate's card, your card, the card next month — same steps. You can swap in and out. The onboarding cost drops to zero.

For a Willy — a big, unknown project — the Build stream changes:

1. Break into Tuna-sized sub-cards. Each gets its own sigil and mini-lifecycle.
2. Start with a thin vertical slice — the smallest demo-able path through the full system.
3. Integrated requirements — developers involved from spec, not thrown over the wall.
4. Joint product reviews at each slice.
5. Staged rollout: internal → alpha → beta → general. Each stage emits its own handoff.
6. Measure per slice.

This is how a four-month platform project actually gets built without the "big bang release that nobody trusts" anti-pattern. Thin vertical slice first. Then the next one. Measurement hooks live per slice. You never ship the whole thing at once; you ship progressively, and each stage produces its own trust receipt.

---

## Acceptance criteria arrive with measurement plans

Here is a change that specifically favors engineering teams, and that most organizations struggle to enforce without a methodology.

**For Salmon and Willy fish — research-led work — Solidify writes a measurement plan. In Solidify, not in Ship.**

That means when the handoff hits your queue, the AC file already includes:

- The baseline metric (what we're measuring now).
- The target (what success looks like).
- The instrumentation the build needs to add.
- The window over which the measurement will run.

This is the difference between shipping a feature and shipping a *testable hypothesis*. Every research-led project in FLOW becomes falsifiable by design. Your Build work includes adding the analytics events the plan requires. Your Ship work includes capturing the baseline before traffic hits the new code and the post-release readouts after.

The real win is for your team's technical credibility. When the feature ships and the metric moves, you have a number. When it doesn't move, you have a number. You do not have a Slack thread where three people disagree about whether it worked.

The method bakes this in. You do not have to convince PM to add instrumentation to the ticket — the Solidify stream requires it before Build can start.

---

## The reverse transition is a first-class move

Engineers know this scenario: you are mid-Build. You hit a boundary case that contradicts the locked decision. Maybe the designer specified that a confirmation modal appears, but the API you are building against returns before the modal could be shown. Maybe the data model makes the specified grouping impossible. Maybe the motion spec is 200ms but the animation library you are forced to use has a 500ms floor.

Old model: you argue in Slack, you eat the contradiction silently, or you rebuild.

FLOW model: you emit a **reverse handoff** back to the Solidifier.

```
<FLOW-handoff>
from: builder
to: solidifier
phase_exited: build
notes: |
  Reverse transition. Discovered during implementation
  that the locked decision "password strength meter
  lives at step 3" conflicts with Explore's finding
  that users abandon at step 3. Re-opening the
  step-placement question before continuing Build.
</FLOW-handoff>
```

The rules are tight:

- The `notes` field states **why** in one sentence. Reverse without reason is silent redesign, which is a bug.
- The receiving agent confirms with the human before re-opening. The human can say *"no, hold the decision and unblock Build differently."*
- The reverse is logged. Every card's history answers: was this decision ever re-opened, and why?

Reverse is not failure. **Silently redesigning without reversing is failure.** FLOW makes the motion legible instead of burying it.

Engineers get specific value from this. You are no longer the bottleneck who has to socialize a specification conflict over three days of DMs. You emit a block, the method routes it, the relevant agent picks it up, the conversation happens in one place with one canonical resolution.

---

## Integrated requirements — the "no handoff wall" rule

FLOW has a specific rule for Willys: **integrated requirements.** Developers are involved from Solidify, not thrown the spec at Build exit.

In practice this means:

- For Willys, Build's stream starts with "devs involved from spec, not thrown over the wall."
- Joint product reviews happen at each vertical slice, not after the whole thing ships.
- The architect-lens expert agent (loaned in from the Layer-2 expert roster) participates in pitch drafting, not just review.

This is the rule most engineering teams already wish they had. The method encodes it, so the question *"should we involve engineering earlier?"* is no longer a negotiation on each project. On a Willy, engineering is in Solidify. Period.

For Tunas and Salmons, the rule is lighter — typically one joint review at brief signoff — but the principle holds: if the fish is big or unknown, engineering reads the brief before it locks, not after.

---

## A worked example — Tuna billing history

Sigil: known × bigger → **Tuna**. Two-week sprint.

- **Explore (1 day).** Designer runs the Tuna Explore stream: convention inventory, journey map in 5 swim-lanes, OSD for the download path, competitor scan of Stripe, Linear, Notion. Shortlisted three directions: period-grouped list / detail-drawer / hybrid. Handoff with `confidence_to_advance: 0.8`.
- **Solidify (2 days).** Storyboard in 8 frames. Journey meeting with engineering. Went hybrid. New `<PeriodGroup>` component extends the design system with justification. One-page brief, journey-structured. Fourteen AC bullets. Microinteraction specs for group expand/collapse. Handoff with `locked = brief + AC + components`.
- **Build (1.5 weeks).** Component library first (the team standardized on Radix). Iterative prototyping in Storybook. Vertical slices: list → drawer → download → empty. AC run as tests — 14/14 pass. Joint review with designer, PM, backend engineer. One friction on download timing surfaced mid-Build; resolved by adding a loading state.
- **Ship (half day).** Changelog: *"Billing history redesigned. Invoices now group by period; one-click download per period."* Docs updated. Release note. Trust receipt: 17 files changed, 1 new component, 2 redactions (customer name in screenshot, internal endpoint).

What you do not see in that summary: zero "Slack paragraph + Figma link" moments. Zero misaligned AC. Zero scope arguments. The brief replaced the PRD. The storyboard was the meeting material. The AC was the spec. The trust receipt was the QA artifact.

The reusable journey map is now the foundation for the next billing Tuna. Institutional memory as a byproduct of shipping.

---

## What FLOW gives an engineering team

The concrete things that change in your week:

- **Specs arrive as contracts**, with a `locked` list you can treat as settled.
- **Measurement plans arrive with specs** on research-led work, so you know what to instrument up front.
- **Reverse transitions are a legitimate move**, so contradictions do not turn into silent rebuilds.
- **The Build stream is a checklist**, so "what do I do on a Tuna" has a canonical answer.
- **Vertical slices are the default** on Willys, so you do not build four months of invisible work before your first review.
- **Trust receipts** mean every release has a signed summary of what changed, who approved, and what was redacted.

And the more subtle thing: when the method runs alongside your AI tool, the AI finally has the vocabulary to help you enforce these rules. Your Cursor session knows what a Tuna Build looks like. Your Claude session knows what the handoff format is. The specs roundtrip.

The end of the Slack-paragraph-plus-Figma-link era is not a tooling change. It is a vocabulary change. FLOW is the vocabulary.

---

*Next in the series: what FLOW replaces at the organizational level — sprints, PRDs, standups, and the vibe that currently counts as AI-assisted process.*
