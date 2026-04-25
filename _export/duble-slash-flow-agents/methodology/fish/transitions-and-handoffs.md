---
name: FISH transitions and the `<FISH-handoff>` contract
description: Phase transition gates, the universal handoff block format, reverse transitions, skip handling, and multi-card session rules. Canonical reference for all FISH agents.
type: methodology-spec
---

# Transitions & the `<FISH-handoff>` contract

Every phase change in FISH is an explicit, loggable event. This doc defines the shape of that event, the gates that qualify it, and the edge cases (reverse transitions, skips, multi-card sessions).

---

## 1. The default flow

```
Explore ──▶ Solidify ──▶ Build ──▶ Ship ──▶ Explore (next loop)
 head        left body    right body  tail
```

A Ship → Explore transition starting the next loop is the **normal steady state**, not an edge case. Tunas and Willies typically live across many loops. The "end" of a card is a product/ownership decision, not a methodology event.

---

## 2. The `<FISH-handoff>` block

Every transition emits this. It is the single mechanism by which state passes between phases, between sessions, and between collaborators (human or agent).

```
<FISH-handoff>
from: explorer
to: solidifier
card_id: onboarding-redesign-2026-04
sigil:
  size: bigger          # bigger | smaller
  certainty: unknown    # known | unknown
archetype: willie       # nemo | tuna | salmon | willie
phase_exited: explore
locked:
  - "Problem framing: users abandon at step 3 because password strength surfaces late"
  - "Out of scope for this card: SSO flows (new card queued)"
open:
  - "Which copy pattern for the strength meter — passive or instructional?"
  - "Is step 3 the right place to educate on password hygiene, or step 1?"
artifacts:
  - "notes/onboarding-interviews-2026-04-18.md"
  - "notes/competitor-scan-2026-04-19.md"
  - "decisions/in-scope-vs-out-of-scope.md"
confidence_to_advance: 0.7   # 0.0–1.0, self-reported
notes: |
  Ran Willie-intensity Explore (5 interviews + competitor scan + premortem).
  Two open items above are blocking Solidify; everything else deferred to follow-ups.
  Recommended Solidify approach: one-pager pitch + two concept validations.
</FISH-handoff>
```

### Field contract

| Field | Required | Meaning |
|---|---|---|
| `from` | yes | The exiting phase's agent name (lowercase: explorer / solidifier / builder / shipper). |
| `to` | yes | The entering phase's agent name. For a loop start, `to: explorer` is valid. |
| `card_id` | yes | Stable identifier for the unit of work. Single source of truth across sessions. |
| `sigil.size` | yes | `bigger` or `smaller`. |
| `sigil.certainty` | yes | `known` or `unknown`. |
| `archetype` | yes | `nemo` / `tuna` / `salmon` / `willie`. Derived from sigil; present explicitly so agents don't have to re-derive. |
| `phase_exited` | yes | Which phase is ending. Must match `from`. |
| `locked` | yes, can be empty | Decisions the next agent must treat as settled. One bullet per decision, imperative/declarative form. |
| `open` | yes, can be empty | Questions the next agent must resolve (or explicitly defer). |
| `artifacts` | yes, can be empty | Paths / URLs to material produced in this phase. |
| `confidence_to_advance` | yes | Float 0.0–1.0. The outgoing agent's honest read on whether this is actually done. **Not** a gate; a signal. See §3.1. |
| `notes` | yes, can be empty | Free-text. Anything the next agent needs that doesn't fit above. Sigil changes, skips, sigil-change reasons, method choices. |

### Why this shape

- `locked` + `open` together form the minimum state an incoming agent needs to pick up without re-asking.
- `sigil` + `archetype` let the next agent sanity-check that the phase transition is actually warranted *for this kind of card*.
- `confidence_to_advance` is the agent's honest read. An Explorer returning `0.3` is saying "I don't think you're done exploring yet." The human may override — FISH is not a gate-keeper, it's a coach.
- Plain text (not JSON) is deliberate: the block must round-trip through Claude Desktop, Cursor, ChatGPT Desktop, a Slack paste, a PR description, and a human skim-read.

---

## 3. Transition gates

A transition is valid when both (a) the outgoing phase's exit criterion is met and (b) the archetype's intensity bar from the matrix in [`README.md` §4](./README.md#4-the-archetype--phase-matrix) has been cleared.

| Transition | Gate |
|---|---|
| Explore → Solidify | Problem framing stable; sigil confirmed; ≥1 unknown from entry resolved or explicitly deferred in `notes`. |
| Solidify → Build | One shape doc exists (brief / pitch / ADR); acceptance criteria written; `open` contains no build-blocking items. |
| Build → Ship | Artifact runnable / reviewable; golden path verified; edge cases named in `locked` are covered. |
| Ship → Explore (next loop) | Release evidence exists (URL / tag / receipt); ≥1 learning captured in `notes`. |
| Any → Any (skip) | Permitted, but the **receiving** agent must (1) flag the skip to the user, (2) ask whether to proceed or retreat one phase, and (3) record the skip in the handoff `notes`. See §4. |

### 3.1 `confidence_to_advance` is advisory, not a gate

The outgoing agent reports an honest number. The human reads it.

- **0.8 – 1.0** — clear green; the next agent proceeds without caveat.
- **0.5 – 0.8** — proceed but mark the handoff as *low-confidence advance*. The next agent should re-verify at least one `locked` item.
- **Below 0.5** — the outgoing agent is asking for more phase time. The next agent asks the human: *proceed anyway, loop back one phase, or stay here for another pass?*

**The human always has the override.** `//advance --force` (or the equivalent conversational move) proceeds despite low confidence. The override is logged in `notes`.

### 3.2 Four agent moves at gates

Phase transitions aren't the only moments an agent needs to signal upward. Entry-condition failures, scope changes, and mid-phase concerns all require a move. FISH uses four typed moves — the same vocabulary across all four agents — so the human reading chat can tell at a glance whether work can proceed:

| Move | What it means | Blocks work? | Example |
|---|---|---|---|
| **Question** | Ask the human; keep working while you wait. | No | Explorer: *"Should I include admin users in this research, or scope to end-users only?"* |
| **Review** | Hand to the human for explicit approval before continuing. | Soft — work pauses. | Solidifier: *"Brief is drafted — need sign-off before I hand to the Builder."* |
| **Handoff** | Emit `<FISH-handoff>` to the next-phase agent. | No — this is the normal transition. | Builder → Shipper at Build exit. |
| **Block** | Halt. Cannot proceed without the human resolving this. | Yes — hard stop. | Explorer: *"Scope changed from Salmon to Willie mid-phase. Blocking until you confirm the new sigil."* |

Rules:
- A move is **always narrated in chat** — never silent. ("Blocking: …" / "Question: …" / emitting `<FISH-handoff>`.)
- **Block** is reserved for cases where continuing would cause irreversible consequences (scope change, sigil mismatch, missing required input). Overuse trains humans to ignore it.
- **Review** is the right move at phase exits where `confidence_to_advance < 0.5` — the human green-lights rather than the agent auto-advancing.
- **Question** is the default mid-phase move. Use it freely; it's cheap.
- **Handoff** is the *only* move that changes phase. Everything else stays in the current phase.

---

## 4. Reverse transitions

Reverse motion is **legitimate and expected** — especially for Salmons and Willies.

A Builder who discovers the shape is wrong hands back to Solidify. A Solidifier who discovers the problem is wrong hands back to Explore. Reverse transitions use the same `<FISH-handoff>` format:

```
<FISH-handoff>
from: builder
to: solidifier
phase_exited: build              # the phase we're leaving
...
notes: |
  Reverse transition. Discovered during implementation that the locked
  decision "password strength meter lives at step 3" conflicts with the
  research finding from Explore that users abandon at step 3 for
  unrelated reasons. Re-opening the step-placement question.
</FISH-handoff>
```

Rules:
- The `from` phase is always the one you're leaving, even when going backward.
- The `notes` field must state **why** we are reversing (one sentence). Reverse without reason = silent redesign = bug.
- The receiving agent (e.g. Solidifier when Builder hands back) confirms with the human before re-opening. The human can say "no, hold the decision and unblock Build differently."

Reverse is not failure. **Silently redesigning without reversing** is failure.

---

## 5. Skip handling

"Any → Any" is allowed but noisy. Common valid skips:

- **Explore → Build** — user has an extremely clear Nemo and a validated shape from elsewhere. The Builder should still ask: "Confirming we're skipping Solidify — is the `locked` list already correct?"
- **Solidify → Ship** — documentation-only change or a pure copy fix. The Shipper should still ask: "Confirming there's no Build step — we're releasing the spec change directly?"

Skips are **never** the agent's decision alone. The receiving agent must:

1. **Flag the skip** in chat ("You're skipping Build — is that intentional?").
2. **Ask whether to proceed or retreat** one phase.
3. **Record the skip** in the handoff `notes` (e.g., `notes: | Skipped Solidify per user; Nemo with pre-validated shape.`).

Repeated skips of the same phase across cards = signal that your team's default archetype is shifting. The Flow-checker agent (V2) will surface this pattern; for now, a human sees it in retrospectives.

---

## 6. Sigil changes mid-card

Legitimate, and Explore is the most common place they happen. The rule:

- **Sigil change is announced explicitly** — current agent emits a partial handoff (or a fresh `<FISH-handoff>` with the new sigil and `phase_exited: same-phase-sigil-change`) before continuing.
- **Current phase re-evaluates** against the new archetype's cell in the matrix. A card that was Nemo but is now Salmon needs heavier Explore — the agent extends Explore rather than advancing.
- **`handoff_log`** on the card preserves the old sigil for audit.

Example: starting as Nemo (small × known), Explore interviews reveal the team has no idea how users actually reach step 3. Sigil becomes Salmon (small × unknown). Explore continues, now with interview-driven intensity.

---

## 7. Multi-card sessions (solo)

If a user is working on two cards in the same Claude / Cursor / ChatGPT session:

- **One agent active per card.** The `//` invocation names the card implicitly (most recent) or explicitly (`//solidify card:onboarding-redesign`).
- **Handoffs are per card, never batched across cards.** A handoff for card A is a separate block from a handoff for card B.
- **Cross-card context is legal** ("remember the framing we used on card A? apply it here") but it's recorded in `notes`, not blurred into `locked`/`open`.

---

## 8. Multi-person sessions (V1 multiplayer)

In V1, `<FISH-handoff>` is the **primary mechanism** for cross-teammate pickup:

- Sarah's Solidifier emits a handoff.
- Marcus's Builder reads it in his tool (Duble Slash sync'd it there via the Handoff agent).
- Marcus's Builder confirms sigil, reviews `locked`, and proceeds — or hands back to Sarah's Solidifier with a `to: solidifier` reverse transition.

V1 adds three optional handoff fields:

| Field | Purpose |
|---|---|
| `requester` | Who is asking for the next phase (the teammate pushing the handoff). |
| `reviewer` | Optional — who should review the receiving agent's output before the next handoff. |
| `sla` | Optional — by when. Soft signal for the team's async rhythm, not an enforced deadline. |

These are designed so a solo OSS-launch handoff is forward-compatible — the V1 block is a superset, not a new format.

---

## 9. Common handoff bugs and how to avoid them

| Bug | Symptom | Fix |
|---|---|---|
| Empty `open` but obvious unknowns | Next agent immediately asks you the question | Always list at least non-blocking opens; the Shipper deferrable list is also legitimate `open`. |
| `locked` contains questions | Next agent treats questions as settled | `locked` is imperative/declarative only. Questions belong in `open`. |
| `confidence_to_advance: 1.0` every time | Becomes signal-less | Calibrate. If you're genuinely uncertain, report 0.6–0.7. Over-confident handoffs are the subtle bug that hides phase-drift. |
| No `notes` on sigil change or reverse | Next agent can't tell why | Always narrate sigil changes and reverse transitions in `notes`. One sentence suffices. |
| Handoff emitted but not saved | Session closes; next day the handoff is gone | The Capture agent (OSS launch) saves handoffs automatically. For tool configurations without Capture, paste the block into your notes manually. |

---

## 10. Cross-references

- Main FISH spec → [`README.md`](./README.md)
- Phase-level entry/exit criteria and methods → [`phases-and-methods.md`](./phases-and-methods.md)
- How local agents produce and consume handoffs → [`../local-agents/README.md`](../local-agents/README.md)
- How the Context Cloud stores and routes handoffs (V1) → [`../system-agents/README.md`](../system-agents/README.md)
