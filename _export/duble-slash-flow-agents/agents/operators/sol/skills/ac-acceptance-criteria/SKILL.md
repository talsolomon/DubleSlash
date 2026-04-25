---
name: ds-ac-acceptance-criteria
description: Sol writes 3–12 acceptance criteria — each independently checkable, imperative, specific, testable. Categories adapt to archetype (Nemo 3–5; Tuna + microinteractions + empty/loading/error + telemetry; Salmon + measurement; Willy + per-stage). Rewrites ambiguous bullets — ambiguity in AC is Sol's bug, not Bran's.
---

# Acceptance Criteria — Sol runs this

**Who's at the wheel.** Sol. Contract-writer mode — AC is what Bran consumes as spec. Ambiguity here becomes rework there.

## What you get

At the end of AC you're holding:

- **An AC list** at `planning/ac/ac-<card-id>-<date>.md` (or embedded in the brief / pitch) with 3–12 bullets using the [solidifier.md §8.3](../../../../../methodology/local-agents/solidifier.md#83-acceptance-criteria-ac-template) template.
- **Each bullet independently checkable** — a Builder reads it, implements, and tests against it without asking Sol a question. No "should be fast" — instead "response ≤ 500ms p95."
- **Category coverage matched to archetype** — Nemo (3–5: functional · edge cases · done-definition). Tuna (+ microinteractions · empty/loading/error states · telemetry). Salmon (+ measurement · instrumentation hooks). Willy (+ per-stage AC per rollout stage).
- **A rewrite pass** — any bullet that was ambiguous gets rewritten, not passed through. Sol treats its own ambiguity as a bug to fix, not a gap to flag.
- **A coverage check against the sigil's cell** — if a required category is missing, Sol names it and either fills it or asks {user_name} to do so.

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Draft AC bullets in category order, starting from the archetype's required categories | Add domain-specific edge cases Sol couldn't know (regulatory, legacy-data, internal-tooling interactions) | — |
| Rewrite any ambiguous bullet — the "should be fast" → "≤ 500ms p95" transformation | Flag bullets that still feel ambiguous to you | Sol rewrites until you sign off, or defers to a specialist (e.g., `@perf` for p95 thresholds) |
| Cross-check against the archetype's required categories | Confirm we haven't missed a category | If a category is missing substance, Sol asks rather than inventing |
| For Salmon/Willy: name instrumentation hooks per AC (event name + trigger + properties) | Correct event naming against your telemetry conventions | — |
| For Willy: split AC into per-stage lists (internal / alpha / beta / GA) | Confirm per-stage thresholds match your rollout discipline | — |

**The split rule here.** Sol is fast at rewriting ambiguous AC into testable shape, and at enforcing category coverage against the cell; you know the domain-specific edge cases (regulatory, legacy, internal-tooling interactions) that are the real AC, not the generic ones. AC is only useful if it's honest about what can go wrong in your reality.

## Where this fits in the Solidify stream

AC runs on **every** card, every archetype — per [solidifier.md §5](../../../../../methodology/local-agents/solidifier.md#5-capabilities-codes-the-user-can-request-directly), AC is marked "applies to: all." On Nemo, AC is the whole second half of the phase (after SK). On Tuna, AC is embedded in BR. On Salmon, AC is embedded in BR with measurement hooks. On Willy, AC is embedded in PT with per-stage split. AC is also the #1 capability other operators expect from Sol — Bran won't Build without it.

## When AC refuses to emit

- **No shape yet** — AC is a contract against a shape. If no shape exists, Sol runs SK or BR or PT first.
- **`open` has unresolved items that affect AC** — writing AC on unresolved scope produces ambiguous AC. Sol names the unresolved items and offers HB rather than writing on guesses.
- **Missing required category for the archetype** — Sol names it and either fills it or asks you to.
- **User pushes to skip AC** — quote solidifier.md §11 anti-pattern "Accepting ambiguous AC" and refuse. The whole point of Sol is that Bran doesn't have to ask Sol a question.

## Model

AC is where **Sonnet** earns cost on the *rewrite* pass — turning "should be fast" into "≤ 500ms p95" requires domain judgment and specificity. The first-draft pass can be Haiku (template generation), but the sharpening pass should be Sonnet. Default to Sonnet to keep the rewrite loop tight; drop to Haiku only on Nemos where the AC categories are mechanical. Set in [`agents/config.yaml → model_policy.hints.ac`](../../../../config.yaml).

---

The category-coverage check, ambiguous-bullet rewrite pass, instrumentation-hook naming, and per-stage split for Willy live in [./workflow.md](./workflow.md).
