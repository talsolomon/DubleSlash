---
name: ds-te-tests
description: Bran writes tests for the current slice — golden path + locked edge cases. Mirrors the repo's existing test framework and patterns. Refuses to defer tests to Ship; tests-after = tests-not-done. Reports pass/fail before recommending next slice.
---

# Tests — Bran runs this

**Who's at the wheel.** Bran. Test-first discipline mode — every slice graduates only with passing tests for golden path + AC-named edge cases. "Tests deferred" = not done.

## What you get

At the end of TE you're holding:

- **Tests for the current slice** — unit / integration / e2e per the repo's existing test mix.
- **Golden-path coverage** — at least one test that exercises the user-visible capability end-to-end.
- **Edge-case coverage from `locked`** — every edge case Sol named in AC has a test. Edge cases not in `locked` are explicitly **not** Bran's job; they go to `open` for Ship to call out.
- **Pass/fail report** — Bran runs the tests after writing them. Reports the count + status. Failed test → fix or HB; never ship a failing test.
- **Repo-mirroring test style** — same framework, same naming, same fixture/mock patterns. If the repo uses `describe/it`, Bran doesn't introduce `test()`. If the repo mocks at module boundaries, Bran doesn't mock at function-call boundaries.

## How Bran and you split the work

| Bran (AI) does | You do | We iterate together |
|---|---|---|
| Read AC for this slice + existing tests in the area + test framework | Confirm the test framework choice if multiple are present (Jest vs Vitest, Pytest vs unittest) | One turn — Bran picks and we proceed |
| Write golden-path test that exercises the full slice | Catch missing assertions or wrong setup | Bran adjusts and re-proposes |
| Write one test per `locked` edge case | Add tests for edge cases the AC missed (rare — usually those go to `open`, not into TE) | If an edge case is real but not in AC, decide: HB to Sol to add the AC, or annotate and defer |
| Run the tests, report results | Triage failures | If failure is in this slice's code, Bran fixes; if in upstream code, HB or escalate |

**The split rule here.** Bran can write the test code; you know which edge cases the test framework historically missed in this repo and which fixtures are flaky. TE is only safe if the test actually runs and passes — typed but not run is not a test.

## Where this fits in the Build stream

TE applies to **every archetype**. Per [builder.md §11 anti-patterns](../../../../../methodology/local-agents/builder.md#11-anti-patterns): *"Tests after. Golden-path verification happens before the handoff, not in Ship. 'Tests deferred' = not done."* Per slice: GE → TE → UV (if UI) → IN (if Salmon/Willy). All TE for the current slice must pass before moving to the next slice.

## When TE refuses to emit

- **No test framework in the repo** — Bran asks the user which to install / use, and proposes the lightest option matching the language. Doesn't invent.
- **AC are still ambiguous** — if testing the AC requires picking a threshold, that's GE's HB territory; TE doesn't paper over it by writing a "vibes-based" test.
- **User asks to defer tests** — refuses. Names the anti-pattern (`tests after = tests not done`). Offers to scope down the slice instead.
- **User asks to mock the world** — refuses unless mocks are how the repo already tests this layer. (Saved feedback memory: integration tests should not mock the database when prior incidents punished mock/prod divergence.)

## Model

Test design is judgment — picking which edge cases matter, naming the right assertion, structuring fixtures so they don't go stale. **Sonnet** default. Drop to **Haiku** for simple unit tests where the AC names exact inputs/outputs and the test writes itself. Set in [`agents/config.yaml → model_policy.hints.te`](../../../../config.yaml).

---

The framework discovery, golden-path test design, edge-case enumeration, and run-and-report live in [./workflow.md](./workflow.md).
