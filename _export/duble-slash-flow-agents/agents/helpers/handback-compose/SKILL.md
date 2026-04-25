---
name: ds-handback-compose
description: The calling operator produces a validated reverse <FLOW-handoff> — phase rewind with a specific named gap and a preservation list. For when the current phase surfaces a real hole in the previous one. Not failure — reverse transitions are normal, narrated, and expected per flow.md §11.
---

# Handback Compose — the calling operator runs this

**Who's at the wheel.** Not a new persona. Like HO, this helper runs *through* the calling operator — Sol handing back to Dora, Bran handing back to Sol, May handing back to any upstream phase. The voice stays theirs.

## What you get

At the end of HB you're holding:

- **A validated reverse `<FLOW-handoff>` block** — typed `type: handback`, with a structured `reason`, a `specific_gap`, and a `what_to_preserve` list.
- **The block on disk** at `.flow/handoffs/<card-id>-<from>-HB-<to>-<date>.handoff.md` — same mechanism as forward handoffs, different filename convention so the audit trail stays legible.
- **A history entry** on the card — `{date} <from>↩<to> reason=<category>` — the arrow direction makes reverse transitions visible at a glance.
- **The block displayed inline** — paste into `//<previous-phase>` so the previous operator addresses the gap.
- **A preservation list explicitly attached** — what from the previous phase's output stays locked, so the previous operator doesn't redo work that was fine.

## How the calling operator and you split the work

| Operator (AI) does | You do | We iterate together |
|---|---|---|
| Compare current sigil to the last forward handoff's sigil | — | If the sigil changed, this isn't a handback — it's a sigil change. Helper refuses and routes to the sigil-change extend flow (flow.md §11.2) |
| Validate direction: `(from, to)` must be a valid reverse transition | — | Multi-phase rewinds (skipping past two phases) are flagged with `multi_phase_rewind: true` and require an explicit explanation |
| Draft the reason category: `{gap_in_shape, gap_in_framing, sigil_mismatch, scope_creep, technical_constraint_discovered, other}` plus your freeform explanation | Pick the category; write the explanation in your voice | Operator refines if the category doesn't match the explanation |
| Propose the `specific_gap` — the single, well-scoped thing the previous phase needs to revisit | Sharpen — vague gaps get the handback refused ("Solidify was wrong" is not a gap; "the AC for the payment flow missed the 3DS redirect path" is) | Operator rewrites until the gap is specific |
| Propose the `what_to_preserve` list — what from the previous phase's output is still good and shouldn't be touched | Confirm what stays locked; add things Dora/Sol/Bran/May missed | — |
| Render the block + write to disk + append history + display inline | — | — |

**The split rule here.** AI enforces that a handback is *a handback*, not a rewrite request. You supply the substance: which single gap, and what stays preserved. A handback without a preservation list is a rewrite, and rewrites should be new cards, not handbacks.

## When HB refuses to emit

- **Sigil changed** — this is a sigil change (§11.2), not a handback. Helper routes to the extend flow.
- **`specific_gap` is vague or a list** — a handback names one well-scoped thing. A list of complaints gets the handback refused with the ask: "pick the one that's blocking, handback on that, park the rest in notes or as future cards."
- **`what_to_preserve` is empty** — without preservation, this is a rewrite request. Helper refuses and asks you to either name what stays, or redirect to a new card.
- **Direction is actually forward** — routes to `ds-handoff-compose`.

Refusals are specific. The helper tells you the rule that's violated and offers the right next move — it doesn't just error out.

## Where this fits

Reverse transitions are **normal** — flow.md §11.1 names them as first-class. Builders hand back to Sol on upstream contradictions; Solidifiers hand back to Dora on framing gaps; Shippers hand back to Build on real defects. The handback is how the card stays coherent instead of silently redesigned.

HB is always the calling operator's choice — they surface the gap, you confirm or redirect, the helper emits. If the calling operator is tempted to silently patch the upstream gap in their own phase, that's a bug FLOW exists to prevent (§11.1).

## Model

Same shape as HO — schema validation, reverse-direction checks, preservation-list enforcement, YAML rendering. **Haiku** is right for all of it. Set in [`agents/config.yaml → model_policy.hints.hb`](../../../agents/config.yaml).

---

The sigil-change check, direction validation, gap-specificity enforcement, and block rendering live in [./workflow.md](./workflow.md).
