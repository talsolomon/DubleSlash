---
name: ds-ct-concept-test
description: Sol plans a 3–5 user concept test to validate the shape BEFORE Build. Salmon standard; Willy does 2–3 parallel CTs across concept directions. Output is a runnable plan — who, what prototype, what we learn, pass/fail criteria, instrumentation — not a result.
---

# Concept Test — Sol runs this

**Who's at the wheel.** Sol. Test-design mode — the CT is a plan, not an execution. Sol writes it so someone (you, a researcher, the team) can recruit tomorrow and run it in the archetype's time box.

## What you get

At the end of CT you're holding:

- **A concept test plan** at `planning/tests/ct-<card-id>-<date>.md` — Target cohort · Recruitment spec · Prototype artifact (fidelity + what to build) · Research questions · Tasks / prompts · Pass/fail criteria · Timeline · Instrumentation.
- **Explicit pass/fail thresholds** — not "see if it works" but "≥ 4 of 5 complete the primary task without help" or similar. Salmon-specific thresholds are evidence-based where possible.
- **A prototype spec** — what fidelity (paper / clickable Figma / live prototype), what states need to be built, what can be faked.
- **A timeline fit to the archetype** — 2 days for a Salmon CT; up to 1 week for a Willy CT × 2–3.
- **A handback hook** — if the CT would itself require research the team can't do in-budget, Sol flags it and offers to narrow scope.
- **A next-step call** — schedule the CT, then return with results; results feed BR (Salmon) or PT (Willy).

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Draft target cohort — who we need for this test (N, role, prior experience) | Correct cohort — AI doesn't know your actual userbase segments | — |
| Draft recruitment spec — screener questions, incentives, time ask | Adjust incentives to your org's rates and policy | — |
| Propose prototype fidelity + build list — what must be built, what can be faked | Push back on fidelity if "clickable Figma" is actually impossible in the time box | Sol rescopes to paper / Wizard-of-Oz as needed |
| Draft 3–5 research questions — the things this CT will answer | Add RQs Sol missed (e.g., compliance-sensitive flows) | — |
| Draft the task prompts the user will receive | Rewrite prompts that leak the answer | Sol revises until prompts are behaviorally neutral |
| Propose pass/fail criteria with thresholds | Adjust thresholds to your product's baseline (a 4-of-5 completion is meaningful only if baseline is lower) | — |
| Propose timeline and next-step gates | Confirm the team can recruit + run in that window | If not, Sol offers to narrow scope (fewer users, thinner prototype) |

**The split rule here.** Sol can write the plan template and propose a reasonable prototype spec; you know your recruitment reality (who you can actually get in front of), your baselines (what "good" looks like here), and your org's tolerance for prototype effort. CT is as good as the realism of the plan — don't let Sol scope a test you can't actually run.

## Where this fits in the Solidify stream

CT is the **Salmon forcing function** — per [solidifier.md §4](../../../../../methodology/local-agents/solidifier.md#4-axis-modulation-streams-per-archetype), Salmon Solidify is `BR → CT → AC → MP` and the CT is the step that turns "two candidate shapes" into "one evidence-informed shape." On Willy, CT runs in **parallel, 2–3 concepts**, feeding the pitch's Shape section. CT rarely runs on Tuna (overkill — the brief is the convergence) and never on Nemo (overkill — the sketch is the convergence).

## When CT refuses to emit

- **Team can't recruit in the archetype's time box** — Sol flags it and offers to narrow scope (e.g., 3 users instead of 5, internal users instead of external) rather than emit a plan that won't run.
- **Sigil is Nemo** — overkill. Redirect to SK.
- **Sigil is Tuna** — usually overkill. Sol asks why; if the answer is "we're uncertain about the convention," Sol offers to run CS or HS as the lighter move.
- **No shape to test** — CT validates a shape. If there's no shape yet, Sol runs SK or BR first.

## Model

Test-plan generation is templated + structured — cohort / prototype / RQs / tasks / pass-fail. **Haiku** is the right default; the judgment step (do these thresholds mean anything for your product?) is yours, not the model's. Escalate to Sonnet when the prototype spec requires inventing (e.g., a Wizard-of-Oz for a conversational interface where the tasks need narrative design). Set in [`agents/config.yaml → model_policy.hints.ct`](../../../../config.yaml).

---

The cohort specification, prototype fidelity decision, RQ-to-task mapping, and pass/fail threshold drafting live in [./workflow.md](./workflow.md).
