---
name: ds-mp-measurement-plan
description: Sol writes a measurement plan — one primary metric, one guardrail, baseline, target, instrumentation hooks, readout cadence, stop-the-line threshold. Salmon and Willy required; refused on Nemo (gold-plating). Makes Ship's measurement the thing this card is accountable to, not vibes.
---

# Measurement Plan — Sol runs this

**Who's at the wheel.** Sol. Accountability mode — the MP is the card's receipt. Ship runs against this plan, not against "it feels better."

## What you get

At the end of MP you're holding:

- **A measurement plan** at `planning/mp/mp-<card-id>-<date>.md` (or embedded in BR / PT) using the [solidifier.md §8.4](../../../../../methodology/local-agents/solidifier.md#84-measurement-plan-mp-template--salmon--willy) template.
- **A primary metric** — one, not five. The thing this card is trying to change.
- **A guardrail metric** — one thing that must *not* regress while the primary moves.
- **A baseline** — current value, or "unknown; measure pre-release" if we don't have it yet.
- **A target** — specific number + timeframe, e.g., "+15pp activation in 2 weeks."
- **Instrumentation hooks** — event names, triggers, properties — named so Bran can implement them.
- **Readout cadence** — who reads, when, where (dashboard / Slack / weekly review).
- **A stop-the-line threshold** — guardrail value that triggers a rollback.

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Propose primary metric based on Explore evidence + shape | Correct the metric — AI defaults to generic proxies (conversion, engagement) when you have better in-house signals | — |
| Propose a guardrail — what must not regress | Add guardrails Sol couldn't know (team-specific SLAs, compliance, per-segment impact) | — |
| Propose baseline + target based on current data (if known) or "measure pre-release" | Override with the real baseline you have access to | Sol updates |
| Name instrumentation hooks — event names, triggers, properties — aligned to your conventions | Correct naming to your telemetry conventions | Sol renames until it matches |
| Propose readout cadence + owner | Assign the real owner (you, a specific teammate) | — |
| Propose stop-the-line threshold for the guardrail | Adjust the threshold to your real tolerance (if 1% regression is actually catastrophic, 5% is wrong) | — |

**The split rule here.** Sol can enforce the shape of the MP and propose reasonable starting points; you supply the real baselines, the real owners, the real stop-the-line thresholds. MP without real numbers is theater.

## Where this fits in the Solidify stream

MP is **required on Salmon and Willy** — per [methodology/flow.md §5](../../../../../methodology/flow.md#phase-2--solidify-left-body--מסגור), Willys without measurement plans are vanity projects, and Salmon Solidify exit requires validation + measurement plan. MP runs embedded in BR (Salmon) or PT (Willy), or as a standalone artifact linked from those docs.

## When MP refuses to emit

- **Sigil is Nemo** — gold-plating. Nemo's measurement is "does it work? did I break anything?" — a checklist, not an MP. Sol refuses and names the §11 anti-pattern.
- **Sigil is Tuna without clear measurement mandate** — Sol asks why; if the answer is "we always MP," fine, but flag that Tuna MP usually rolls into release notes and heatmaps, not a full MP doc.
- **No shape yet** — MP measures a shape. Run SK / BR / PT first.
- **Primary metric is a proxy for "we shipped"** — Sol pushes back. "Launch" is not a metric. "Activation rate in first 7 days" is.

## Model

MP drafting is templated — metric / baseline / target / instrumentation / readout / stop-the-line. **Haiku** is the right default; the judgment step (is this the right primary metric?) is yours. Escalate to Sonnet when the card requires inventing a composite metric or reasoning about experimental design. Set in [`agents/config.yaml → model_policy.hints.mp`](../../../../config.yaml).

---

The metric selection, baseline lookup (if data-source named), instrumentation-hook naming, and stop-the-line threshold reasoning live in [./workflow.md](./workflow.md).
