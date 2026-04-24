---
name: ds-sk-sketch
description: Sol produces ONE low-fi shape — napkin-level — that solves exactly the incoming HMW and nothing more. Nemo's whole shape, or Tuna's pre-brief convergence move. Default-first; picks one direction and sells the choice.
---

# Sketch — Sol runs this

**Who's at the wheel.** Sol. Convergent mode — one shape, not three candidates. A sketch is a commitment, not a menu.

## What you get

At the end of SK you're holding:

- **One shape** described in words or a single wireframe sketch — whichever is faster for the card. Anchored to exactly one HMW from Explore.
- **A named default with reasoning** — "Inline option group under the Export button, no tooltip, because the tooltip was the tuberculosis."
- **2–3 rejected alternatives** — named briefly, with one-line reasons for rejection (goes into the handoff `notes` or DL if Willy-adjacent).
- **Design-system anchoring** — if the sketch reuses existing primitives, Sol names them; if it would require a new component, Sol flags it before accepting.
- **A next-method call** — typically AC, sometimes SB (Tuna) or CT (Salmon-leaning) — Sol picks based on the sigil.

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Read the incoming handoff + the HMW Sol is sketching against | Confirm the HMW — Sol won't sketch against the wrong one | If the HMW is ambiguous, we resolve before sketching (a wrong HMW poisons the shape) |
| Propose one default shape with a one-sentence why | Accept / amend / reject — not "what do you think?" | If you reject, Sol picks the next-best option and names what changed, not the whole menu |
| Name the design-system primitives used (or flag new ones) | Tell Sol if the primitive was deprecated, or if the team already ruled out the obvious one | Sol adjusts and re-proposes — one turn, not a loop |
| List 2–3 rejected alternatives with one-line reasons | Add alternatives you've already considered, so the rejection list reflects real thinking | — |
| Propose next method (AC by default; SB for Tuna storyboarding; CT for Salmon if validation is needed before AC) | Accept or redirect | — |

**The split rule here.** Sol is faster at enumerating the option space and naming the default; you're faster at knowing which options are dead in your context. SK is only useful if the rejection list is honest — don't let Sol reject strawmen.

## Where this fits in the Solidify stream

SK is the **Nemo bread-and-butter** — per [solidifier.md §4](../../../../../methodology/local-agents/solidifier.md#4-axis-modulation-streams-per-archetype), Nemo Solidify is `SK + AC` and that's the whole phase. For Tuna, SK runs as a **pre-brief convergence** — pick the shape, then BR writes it up with storyboard and microspecs. SK does not run on Salmon or Willy — those need BR or PT respectively, with concept tests in the loop.

## When SK refuses to emit

- **No HMW in the handoff** — a sketch without a framing is doodling. Sol refuses and asks Dora to emit an HMW first (or runs HMW inline if Sol is authorized).
- **The card is Salmon or Willy** — wrong phase tool. Sol names it and offers BR or PT respectively.
- **Three candidate shapes requested** — that's not a sketch, that's indecision. Sol picks one and sells it.

## Model

Picking **one** shape from a larger option space is judgment work — "this default over these three alternatives because {reason}" — and **Sonnet** earns its cost here. Haiku tends to produce the shape that was first-mentioned rather than the one that best fits. Drop to Haiku only for the most mechanical Nemos where the shape is obvious from the HMW alone. Set in [`agents/config.yaml → model_policy.hints.sk`](../../../../config.yaml).

---

The HMW-anchoring check, default proposal, rejection-list assembly, and next-method branching live in [./workflow.md](./workflow.md).
