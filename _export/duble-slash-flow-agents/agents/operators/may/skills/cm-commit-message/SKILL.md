---
name: ds-cm-commit-message
description: May proposes a commit message — why-first, then what; Conventional Commits prefix; ≤72-char subject; AC reference + co-author trailer. Per-action user confirmation before committing. Refuses to skip hooks, refuses to commit without confirm.
---

# Commit Message — May runs this

**Who's at the wheel.** May. Author mode — the commit subject lives forever in `git log`. The body explains the *why* the diff can't show. Generic verbs ("update", "fix") are bugs.

## What you get

At the end of CM you're holding:

- **A proposed commit message** in Conventional Commits format: `{type}({scope}): {imperative subject}`.
- **A subject line ≤72 characters** — imperative voice ("replace tooltip with inline options"), verb-first.
- **A body that states the *why*** — 1–3 sentences. Not what (the diff shows what); why (the user need or constraint that forced it).
- **An AC reference + card_id reference** — `AC: X/Y passing · refs #card_id`.
- **A co-author trailer** — using the project's git identity (per saved memory: `Tal Solomon <talsolomon21@gmail.com>` for this project; never `talaction`).
- **A staged-files preview** — May lists what's about to be committed before asking for "go".
- **No commit until confirmed.** May proposes; user says "commit"; May runs `git commit` exactly once.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Read git diff + Bran's exit notes for the *why* | Sharpen the why if May's draft is generic | One turn — May adjusts |
| Propose `{type}({scope}): {subject}` | Correct type or scope if wrong (you know team conventions May can't see) | — |
| List files about to be committed | Catch any sensitive file that snuck in (`.env`, credentials, large binaries) | If sensitive files are present, May refuses to add them; user explicitly stages |
| Confirm the git identity matches expected | Tell May to abort if identity is wrong | Identity gets fixed before commit |
| Run `git commit` only after explicit "commit" / "go" | Approve per commit | — |

**The split rule here.** May can compose the message; you know whether the *why* matches what your team actually values knowing six months from now. CM is only useful if the *why* is honest — "fix bug" is not a why; "users were confused by tooltip discoverability; inline matches the Button primitive's affordance" is.

## Where this fits in the Ship stream

CM applies to **every archetype**. Per [shipper.md §6](../../../../../methodology/local-agents/shipper.md#6-walkthroughs): Nemo runs CM once; Tuna can squash or run one CM per slice; Salmon runs CM at release day; Willy runs CM per stage (alpha tag commit, beta tag commit, GA commit). CM runs **after** RE clears and **before** PR open / TG / publish.

## When CM refuses to emit

- **RE not run** — refuses; runs RE first.
- **Sensitive files staged** — refuses to commit `.env`, credential files, large binaries without explicit user override per file.
- **Wrong git identity** — refuses to commit if `git config user.email` doesn't match the project's expected identity. Asks user to fix.
- **Hooks skipped** — refuses `--no-verify`, `--no-gpg-sign`. If a hook fails, surface the failure and propose a fix.
- **No user "go"** — refuses to commit without per-action confirmation. Even if the user said "go ahead and commit everything" five minutes ago, this commit needs its own go.

## Model

CM is templated narrative — the subject, body, trailer all follow a known shape. The judgment is in the *why* — picking the sentence that captures motivation without re-explaining the diff. **Haiku** by default; **Sonnet** when the why involves audience translation (customer-facing release behind the commit, regulatory framing, etc.). Set in [`agents/config.yaml → model_policy.hints.cm`](../../../../config.yaml).

---

The diff scan, why-extraction, message composition, sensitive-file guard, and commit-on-confirm flow live in [./workflow.md](./workflow.md).
