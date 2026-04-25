---
name: ds-in-instrumentation
description: Bran wires the events Sol named in the Measurement Plan — analytics, logs, metrics — and runs a smoke test that each event fires. Required for Salmon and Willy. Refuses if MP didn't name events. Refuses to invent events not in MP.
---

# Instrumentation — Bran runs this

**Who's at the wheel.** Bran. Wiring mode — the MP from Solidify is a contract that names events. IN's job is to make those events fire from the right spots in the new code, then prove it with a smoke test. No new events; no missing events.

## What you get

At the end of IN you're holding:

- **Wired events** — every event Sol named in the MP fires from the correct trigger point in the slice's code.
- **Smoke-test evidence** — Bran manually triggered each event in dev and confirmed the analytics pipeline received it (or, if pipeline access isn't available, the local debug log shows it).
- **Property-set verification** — every named property on the event is populated with the right shape (string vs int vs object), and required properties are non-null.
- **A note on what was NOT instrumented** — if MP named events Bran couldn't wire (e.g., events that depend on a downstream system not yet built), those gaps are explicitly named and pushed to `open` for Ship.

## How Bran and you split the work

| Bran (AI) does | You do | We iterate together |
|---|---|---|
| Read MP from the handoff — extract named events + properties + triggers | Confirm any event meaning that's ambiguous (some MP events are "fired on success" without naming success) | One turn — clarify, then proceed |
| Identify the analytics SDK / logging library the repo uses | Point to the right wrapper if multiple exist | — |
| Wire events at the right trigger points (diff-first, like GE) | Catch any event Bran wired in the wrong spot (after vs before guard, on retry vs on first attempt) | We adjust before applying |
| Run smoke test: trigger each event in dev, verify it lands | Provide the dev analytics dashboard URL or log location if not obvious | — |
| Report which events landed, which didn't, why | Decide for non-landing events: fix in IN, HB to Sol, or push to `open` | — |

**The split rule here.** Bran can wire and trigger; you know the analytics pipeline's quirks (sample rates, dev-vs-prod routing, the property the dashboard secretly requires). IN is only safe if you actually checked the dashboard (not just Bran's "smoke test fired locally").

## Where this fits in the Build stream

IN applies to **Salmon and Willy** (per [builder.md §4](../../../../../methodology/local-agents/builder.md#4-axis-modulation-streams-per-archetype)). On Salmon: IN runs after UV, before HO. On Willy: IN runs per slice — events for each slice get wired in that slice's IN step, not deferred to a "wire it all up" final pass. **Nemo and Tuna skip IN** — neither has an MP. If a Tuna's brief named instrumentation, that's a sign the card is actually a Salmon; consider re-sigil via HB.

## When IN refuses to emit

- **No MP in the handoff** — Bran asks Sol to add one. Refuses to invent events. (Per [builder.md §5 refusals](../../../../../methodology/local-agents/builder.md#5-capabilities-codes-the-user-can-request-directly): "IN refuses if Solidify's MP named events aren't specified.")
- **MP names an event Bran can't wire** (e.g., depends on a system that doesn't exist yet) — Bran wires what he can, names the gap, pushes the gap to `open` for Ship.
- **User asks to add an event MP didn't name** — refuses. If the event matters, that's an MP gap; HB to Sol to extend the MP. Don't ship instrumentation Sol didn't sign off on.
- **Smoke test fails (event not landing)** — Bran does NOT report the slice as instrumented. Either fixes the wiring or HBs.

## Model

Instrumentation wiring is judgment + correctness — picking the right trigger point, getting properties right, structuring the smoke test honestly. **Sonnet** default. Drop to **Haiku** for purely additive cases where the analytics SDK has one obvious entry point and MP names exact properties. Set in [`agents/config.yaml → model_policy.hints.in`](../../../../config.yaml).

---

The MP-event extraction, trigger-point selection, smoke-test sequence, and gap-reporting live in [./workflow.md](./workflow.md).
