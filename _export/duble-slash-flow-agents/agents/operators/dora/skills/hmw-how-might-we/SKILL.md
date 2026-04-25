---
name: ds-hmw-how-might-we
description: Dora reframes the card's problem as 3–5 generative "How might we…" questions across 5 lenses — goal, obstacle, assumption, analogy, inversion. Picks the 1–2 you'll hand to Sol as the target framing, scored against the sigil so Solidify gets a right-sized question to shape against.
---

# How-Might-We — Dora runs this

**Who's at the wheel.** Dora. Divergent mode — her job here is to *widen* the solution space before Sol narrows it. No solutions, no shapes, no shortcuts.

## What you get

At the end of HMW you're holding:

- **3–5 HMW questions**, each across a different lens (goal / obstacle / assumption / analogy / inversion) so the solution space is genuinely broad, not five variations of one direction.
- **A scored read of each HMW** — aperture (wide / medium / narrow), archetype fit, scope check (does this belong in this card or a sibling card?).
- **1–2 chosen HMWs** earmarked as the target framing for Sol's brief — these are what Solidify will shape against.
- **A scan document** at `planning/scans/hmw-<card-id>-<date>.md` with the full list, scoring, your selections, and the ones deferred.
- **A handoff update** — the chosen HMWs become the `locked` target framing in the outbound handoff to Sol.

## How Dora and you split the work

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Read the card + sigil + any HS / CS / IP / NB output | Confirm the problem statement if Dora's inferred one is off | If Dora detects a solution-shaped input ("add a tooltip"), she flips it to the underlying problem before generating HMWs |
| Generate 3–5 HMWs across the 5 lenses — never clustering all 5 in the goal lens | Read all 5; kill the ones that feel forced; keep the ones that open real exploration | Re-generate if a lens produced something stale — *"generate another obstacle HMW that doesn't use 'friction' or 'seamless'"* is a fair instruction |
| Score each HMW (aperture, sigil fit, scope) | Push back on scoring if Dora's read is off | — |
| Flag narrow HMWs on Willy/Salmon (aperture too tight) and wide HMWs on Nemos (scope inflation) | Use the flags as the nudge they are — decide to re-generate or accept the size mismatch | — |
| Surface the 1–2 strongest HMWs for Sol | Pick the ones you actually want Sol to shape against | If you pick an HMW Dora flagged as narrow/wide, she surfaces the nudge one more time — then accepts your call and logs it |

**The split rule here.** AI can generate across lenses fast — but only you know which reframing will *actually move your team to a different place*. Ten good HMWs nobody on your team finds resonant are worth less than 2 HMWs that change how the designer + PM talk about the card. Pick for resonance, not for completeness.

## Where this fits in the Explore stream

HMW runs after framing is stable — usually after HS (Nemo/Tuna), after IP + NB (Salmon/Willy), or after CS when competitor patterns have surfaced a reframe. It's the **last Explore move before the handoff** for most cards: HMW's chosen questions become Sol's target framing in the brief.

On Nemos, HMW is often optional — a Nemo Solidify picks "one HMW" per flow.md §7.2, and sometimes HS's reframing is enough. Dora will tell you.

## Model

Generative reframing across 5 lenses is exactly where **Sonnet** earns its cost. Haiku HMWs come back shallow and repetitive — they cluster in the goal lens, use fluent but empty phrasing, and miss the inversion/analogy lenses entirely. HMW is the kind of work where model quality directly shapes output quality. Set in [`agents/config.yaml → model_policy.hints.hmw`](../../../../config.yaml).

---

The generation across lenses, the scoring, and the chosen-HMW handoff pass are in [./workflow.md](./workflow.md).
