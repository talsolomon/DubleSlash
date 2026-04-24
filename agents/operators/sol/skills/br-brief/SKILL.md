---
name: ds-br-brief
description: Sol writes a 1-page brief — Problem / Journey / Shape / AC / Out-of-scope — using the solidifier.md §8.1 template. Tuna and Salmon standard. Journey-structured, never feature-list. Refuses to emit without AC attached. One shape, one page.
---

# Brief — Sol runs this

**Who's at the wheel.** Sol. Writer mode — the brief is a contract, and Sol writes it to be useful at the Builder's desk, not the stakeholder's slide deck.

## What you get

At the end of BR you're holding:

- **A 1-page brief** at `planning/briefs/br-<card-id>-<date>.md` using the [solidifier.md §8.1](../../../../../methodology/local-agents/solidifier.md#81-1-page-brief-br-template) template: Problem · Journey · Shape · Acceptance Criteria · Out of scope · Measurement plan (Salmon only).
- **A chosen shape with a one-sentence why** — not a menu, not a candidate list (unless a CT is pending, in which case both candidates are named in a `Candidates` section with an explicit CT pointer).
- **An AC list inline** — 3–12 bullets, each independently checkable, following the §8.3 template. No brief ships without AC.
- **An out-of-scope list** — what's deferred and why. If there's no out-of-scope, the brief is either perfect or hiding scope; Sol will push back.
- **A next-method call** — typically CT (Salmon) or HO to Bran (Tuna, once storyboard + AC are in place).

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Read the incoming handoff + any linked Explore artifacts (nugget board, journey map, interview notes) | Confirm Sol read the right artifacts; flag anything missing | If artifacts are missing, Sol offers to HB to Dora rather than write on guesses |
| Draft `## Problem` — one paragraph, who hurts, how, why now | Correct the "why now" — AI is bad at knowing your real timing pressure | — |
| Draft `## Journey` — 1–3 sentences from user's POV or a JM link | Confirm the journey matches what Dora's JM (if any) already documented | Sol cross-checks; if divergent, re-reads JM |
| Propose `## Shape` — default direction, one paragraph | Accept / amend / reject | If you reject twice, Sol pauses the brief and proposes HB or CT to break the tie |
| Draft `## Acceptance Criteria` — 3–12 bullets using §8.3 template | Sharpen any ambiguous bullet; Sol should catch these first but sometimes misses your domain-specific edge | Sol rewrites until each bullet is independently checkable |
| Propose `## Out of scope` — items deferred, each with a reason | Add what you're deferring that Sol couldn't see | — |
| Draft `## Measurement plan` if Salmon (link to MP or inline) | — | On Salmon, Sol offers to run MP as the next capability if it isn't already written |

**The split rule here.** Sol can write the brief structure fast and apply the template correctly; you supply the substance — the real "why now," the real out-of-scope, the real edge cases your AC has to cover. The brief is as good as your substance; Sol's job is to keep the page honest.

## Where this fits in the Solidify stream

BR is the **Tuna and Salmon standard** — per [solidifier.md §4](../../../../../methodology/local-agents/solidifier.md#4-axis-modulation-streams-per-archetype), Tuna Solidify is `SB → BR → WF → AC` and Salmon Solidify is `BR → CT → AC → MP`. BR does not run on Nemo (too heavy — Nemo uses SK) and does not run on Willy (too light — Willy uses PT).

## When BR refuses to emit

- **AC would not be written alongside** — no shape doc without AC. Sol refuses and offers to run BR + AC as a pair.
- **Sigil is Nemo** — too heavy; redirect to SK.
- **Sigil is Willy** — too light; redirect to PT.
- **`open` still has build-blockers** — BR would be shaping on guesses. Sol offers HB to Dora instead.
- **No framing or HMW in the handoff** — brief without a framing is PRD sprawl; refuse and ask for one.

## Model

Writing the brief template is fast + mechanical where the shape is known; picking the default direction from multiple options and pressure-testing AC are judgment-heavy. **Sonnet** is the default for BR because the substantive parts — shape choice, AC sharpness, out-of-scope honesty — reward judgment. Set in [`agents/config.yaml → model_policy.hints.br`](../../../../config.yaml).

---

The template rendering, shape-choice prompting, AC cross-referencing, and next-method branching live in [./workflow.md](./workflow.md).
