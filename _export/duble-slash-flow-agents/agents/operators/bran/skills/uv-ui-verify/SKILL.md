---
name: ds-uv-ui-verify
description: Bran runs the local dev server, walks the slice's golden path + edge cases in a browser, monitors for regressions in adjacent features. Reports pass/fail before recommending next slice. Refuses if no runnable dev command — asks for it. Required for Tuna/Salmon/Willy UI work.
---

# UI Verify — Bran runs this

**Who's at the wheel.** Bran. UAT-of-one mode — run the dev server, click through, look for the obvious thing the test suite missed. Tests verify code correctness; UV verifies feature correctness. Both required.

## What you get

At the end of UV you're holding:

- **Golden-path verification** — Bran walked the user-visible capability for this slice end-to-end and confirmed it matches AC.
- **Edge-case verification** — every locked edge case poked at in the browser.
- **Regression scan** — Bran tested the adjacent features one click away (in the same screen / navigation cluster) for accidental breakage.
- **Pass/fail + screenshot evidence** — pass → continue; fail → fix in GE or HB to Sol if the spec is wrong.
- **A note on what UV could NOT verify** — if the slice depends on data states or external systems Bran couldn't simulate, those gaps are explicitly named and pushed to `open` for Ship.

## How Bran and you split the work

| Bran (AI) does | You do | We iterate together |
|---|---|---|
| Find + run the dev command (e.g., `npm run dev`, `bun dev`, `yarn start`) | Provide the command if Bran can't infer it | One turn — Bran asks once, then proceeds |
| Walk the golden path in the browser; report what was seen | Confirm the path matches your mental model | If Bran's path drifts from your intent, we re-walk |
| Walk locked edge cases | Add edge cases your domain knowledge surfaces (rare in UV — usually those go to `open`) | — |
| Test adjacent features for regression | Tell Bran which adjacent features actually matter (you know the bug-prone neighbors) | — |
| Capture screenshots if the change is visible | Confirm screenshots are useful (or skip if not) | — |
| Report pass/fail with detail | Decide next: fix in GE, HB, or graduate | — |

**The split rule here.** Bran can drive the browser and report; you know which screens have historically broken when this area changed. UV is only safe if you actually look at the screenshots — Bran will report "looks right" on a state where it doesn't.

## Where this fits in the Build stream

UV applies to **Tuna, Salmon, Willy** with UI work — and to any Nemo whose AC includes user-visible behavior. Per [builder.md §4](../../../../../methodology/local-agents/builder.md#4-axis-modulation-streams-per-archetype): UV is in default capabilities for Tuna/Salmon/Willy UI. Per session-specific guidance: *"For UI or frontend changes, start the dev server and use the feature in a browser before reporting the task as complete."* UV runs after TE, before IN (Salmon/Willy) and before HO.

## When UV refuses to emit

- **No runnable dev command** — refuses; asks the user for the command. Doesn't guess.
- **Pure backend slice with no UI surface** — UV is N/A; Bran skips and notes in `notes`.
- **User asks to skip UV "because tests passed"** — refuses. Names the rule (tests verify code correctness, not feature correctness). Offers to scope down the verification to just the golden path if time-pressured.
- **Headless-only environment with no human present to look** — Bran captures screenshots + describes what he sees; flags that human verification of the screenshots is still required before the slice graduates.

## Model

UV is observation + judgment ("does this match AC?"). The model influence is on the *report* — picking what's worth flagging, what's noise. **Sonnet** for any UI with state complexity; **Haiku** is fine for static pages or pure copy changes. Set in [`agents/config.yaml → model_policy.hints.uv`](../../../../config.yaml).

---

The dev-command discovery, golden-path walk, regression scan, and screenshot capture live in [./workflow.md](./workflow.md).
