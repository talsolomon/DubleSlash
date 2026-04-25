---
name: ds-pr-pr-draft
description: Bran drafts a PR body — summary, contract reference, test plan, screenshots, AC checklist, rollout notes. Drafted only — never opened. Opening is May's call (and the user's per-action confirm). Required for Tuna and Willy; optional for Salmon; skipped on Nemo.
---

# PR Draft — Bran runs this

**Who's at the wheel.** Bran. Narrator-of-the-build mode — the PR body tells the reviewer (and future-you) what changed, why, and how it was verified. The diff already shows what; the PR body adds why + how-tested + what's-still-open.

## What you get

At the end of PR you're holding:

- **A PR title** — imperative, scoped, under 70 chars.
- **A summary** — 1–3 bullets, journey-framed, not file-listed.
- **A contract reference** — link or path to the brief / pitch, AC count + status (e.g., 14/14 passing).
- **A test plan** — bulleted markdown checklist the reviewer can walk before approving.
- **Screenshots** — before/after for any UI work, captured during UV.
- **A rollout note** — flag name (or "none"), staged or all-at-once, any pre-deploy steps.
- **Known follow-ups** — what's deliberately deferred to `open` for Ship or next-loop.
- **A drafted-not-opened state** — the body sits ready to paste into the PR UI when May (or the user) opens the PR. Bran does not open it.

## How Bran and you split the work

| Bran (AI) does | You do | We iterate together |
|---|---|---|
| Draft the title (imperative, <70 chars) | Sharpen if Bran's verb is generic ("update" → "rename") | One turn — Bran adjusts |
| Draft the summary (journey-framed, 1–3 bullets) | Catch any feature-listed bullets and re-frame as user outcomes | — |
| List AC + status from CR + TE + UV runs | Add AC Bran misformatted | — |
| Draft test plan | Add test steps Bran can't infer (e.g., team-specific QA dance) | — |
| Attach screenshots from UV | Confirm the screenshots show the right state | — |
| Note follow-ups (what's pushed to `open`) | Add follow-ups Bran missed | — |

**The split rule here.** Bran can draft the body; you know the team's PR conventions (where the QA section goes, which channels need a heads-up). PR is only useful if the test plan is actually walkable — checklists that exist for show waste a reviewer's time.

## Where this fits in the Build stream

PR applies to **Tuna and Willy** (per [builder.md §4](../../../../../methodology/local-agents/builder.md#4-axis-modulation-streams-per-archetype)). Optional for Salmon — the team may want a PR for visibility even on a small unknown. **Skipped on Nemo** — direct commit by May; PR ceremony adds no signal for a 15-minute change. PR runs **after** the last slice's UV (and IN if Salmon/Willy), **before** HO. The drafted body is in the exit handoff `artifacts`.

## When PR refuses to emit

- **Tests failing** — refuses. Hand back to fix, then re-PR. (PR body claiming "X/Y AC passing" while X<Y is a lie to the reviewer.)
- **UV not run on UI work** — refuses. PR claims feature works; UV is the proof.
- **Asked to open the PR (not just draft)** — refuses. Opening is May's call (and the user's per-action confirm). Bran drafts; May opens.
- **Asked to push the branch** — refuses. Push is May's territory; Bran's branch may be local until then.

## Model

PR body composition is templated narrative — bullet structure, AC table, test-plan checklist. **Haiku** by default. Escalate to **Sonnet** when the change is cross-cutting or the summary has to translate engineering moves into customer-facing journey terms (Bran's reflex is feature-list; Sonnet pulls it toward outcome). Set in [`agents/config.yaml → model_policy.hints.pr`](../../../../config.yaml).

---

The title drafting, summary composition, test-plan assembly, screenshot attachment, and rollout-note structure live in [./workflow.md](./workflow.md).
