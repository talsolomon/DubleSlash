---
name: ds-handoff-compose
description: The calling operator (Dora / Sol / Bran / May) produces a validated <FLOW-handoff> block for a forward phase transition. Schema-validated against flow.md §9. Refuses to emit if the archetype's required methods aren't run or explicitly deferred. Writes to disk, appends to card history, displays inline. The universal state-passing mechanism between phases.
---

# Handoff Compose — the calling operator runs this

**Who's at the wheel.** Not a new persona. This helper runs *through* whichever operator is calling it — Dora for Explore exits, Sol for Solidify exits, Bran for Build exits, May for Ship exits. The voice stays the calling operator's; the schema is universal.

## What you get

At the end of HO you're holding:

- **A validated `<FLOW-handoff>` block** — rendered to the canonical schema from [`methodology/flow.md §9`](../../../methodology/flow.md#9-the-flow-handoff-block). Certainty-first sigil, archetype, phase_exited, methods_run, locked, open, artifacts, decisions, confidence_to_advance, notes.
- **The block on disk** at `.flow/handoffs/<card-id>-<from>-to-<to>-<date>.handoff.md` — file-based, not chat-ephemeral, resumable from any tool.
- **A one-line history entry** appended to `.flow/cards/<card-id>/history.log` — dated, timestamped, with the confidence score. This is the audit trail.
- **The block displayed inline** — so you can copy it into `//<next-phase>` in another tool or session. The handoff is the pickup mechanism across tools, sessions, and teammates.
- **A next-step prompt** — the calling operator offers to run the next phase inline, hand back control, or leave the handoff parked on disk for later pickup.

## How the calling operator and you split the work

| Operator (AI) does | You do | We iterate together |
|---|---|---|
| Validate direction: `(from, to)` must be a valid forward transition | — | If it's a reverse direction, the helper refuses and routes to `ds-handback-compose` |
| Check sigil-method coverage against the phase × archetype cell from flow.md §6 | Decide: run the missing methods, or defer each with an explicit reason in `notes` | If you defer, the reason lands in notes so the next operator can see what was skipped and why |
| Validate the required fields are present and non-empty | Add anything the operator drafted too thin (a `locked` with only one vague entry, an `artifacts` with only a stale path) | Operator re-drafts until the validation passes |
| Verify each `artifacts` path exists on disk | Create the missing file, or drop it from the list | — |
| Render the block in canonical schema (certainty, size) order | Read the rendered block; catch anything that doesn't match your intent | Operator edits until you sign off |
| Write the file, append the history log, display inline | — | — |

**The split rule here.** AI is good at schema validation, coverage checks, and YAML rendering. You're irreplaceable on the substance — is this `locked` list really what the next phase should treat as non-negotiable? Is the confidence score honest? The helper enforces shape; you enforce substance.

## When HO refuses to emit

- **Missing required methods** for the archetype × phase cell — without a deferral reason in `notes`. This is the flow.md §6 matrix being prescriptive; HO is where it gets enforced.
- **Empty `methods_run`** — handing off without running any methods is a bug in the calling workflow, not a handoff.
- **`locked` is empty** — a handoff with nothing locked is not a handoff.
- **`artifacts` points at files that don't exist** — the handoff is a pickup mechanism; a broken pointer breaks the pickup.
- **Reverse direction** — routes to `ds-handback-compose`.

Refusals are explicit and name the specific gap — not cryptic validation errors.

## Where this fits

HO is the **exit gate for every forward phase transition** — Explore → Solidify, Solidify → Build, Build → Ship, Ship → Explore (next loop). Most operator workflows end with an HO call. If you're writing an operator workflow that doesn't end with HO somewhere, it's probably mid-phase and should end with a Question, Review, or Block instead (flow.md §10 — the four agent moves).

## Model

Schema-validated block emission is exactly the shape **Haiku** is fast, cheap, and deterministic at. There's no interpretive step here — validation + rendering + disk writes are mechanical. Set in [`agents/config.yaml → model_policy.hints.ho`](../../../agents/config.yaml).

---

The validation sequence, coverage check, and block rendering live in [./workflow.md](./workflow.md).
