---
name: ds-tg-tag-version
description: May proposes a semver bump + annotated git tag. Tuna and Willy. Per-action user confirmation before tagging. Refuses force-tag overwrite without explicit confirm. Annotated tag message references commits + RN + TR.
---

# Tag / Version — May runs this

**Who's at the wheel.** May. Versioning mode — semver bump + annotated tag with a message that references the release notes and trust receipt. Tags are immutable contracts with future-you and with downstream consumers.

## What you get

At the end of TG you're holding:

- **A semver bump proposal** — `v{major}.{minor}.{patch}`, derived from the change scope (breaking → major, feature → minor, fix → patch). Pre-release suffixes (`-alpha.N`, `-beta.N`, `-rc.N`) for Willy stages.
- **An annotated tag** — `git tag -a v{X.Y.Z}` with a message referencing the commit SHA(s), RN path, TR path.
- **Per-action confirmation** — May proposes; user says "tag"; May runs `git tag -a` exactly once.
- **Refusal to force-overwrite** — if the tag exists, May surfaces it and asks for explicit confirm + reason logged in TR.
- **No push by default** — tagging creates the tag locally. Pushing the tag (`git push --tags`) is its own per-action confirm.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Read recent commits + check current latest tag | Confirm the latest tag is the right baseline | One turn — May adjusts |
| Propose semver level (major / minor / patch) based on change scope | Override if change scope was misjudged | — |
| Propose tag message (commit refs + RN + TR refs) | Sharpen wording | — |
| Run `git tag -a` only on explicit "tag" / "go" | Approve per tag | — |
| Refuse to push without separate "push" confirm | Per-action authorize the push if applicable | — |

**The split rule here.** May can pick the version and write the tag message; you know your team's release cadence and whether downstream is ready for this version. TG is only safe if you actually consider the bump level — generic "patch" because change feels small misses breaking changes hiding in API contracts.

## Where this fits in the Ship stream

TG applies to **Tuna and Willy** (per [shipper.md §4](../../../../../methodology/local-agents/shipper.md#4-axis-modulation-streams-per-archetype)). Tuna gets one TG at release. Willy gets multiple — `v2.0.0-alpha.1`, `v2.0.0-alpha.2`, `v2.0.0-beta.1`, `v2.0.0`. **Skipped on Nemo and Salmon** — Nemo's commit is enough audit; Salmon's release tag is optional (some teams use it, some don't). TG runs **after** RN is drafted (so the tag message can reference it), **before** PR open / publish.

## When TG refuses to emit

- **Tag already exists** — refuses to force-overwrite without explicit "force tag" + reason logged in TR. (Force-overwriting a tag breaks downstream consumers silently.)
- **No commits since last tag** — refuses; tagging the same SHA as the last tag is meaningless audit.
- **Wrong git identity** — refuses; tag annotations carry identity. Same identity rule as CM.
- **Asked to push without separate confirm** — refuses; push is its own action. *"Tag created locally. Push? (Separate confirm.)"*

## Model

TG is templated emission with one judgment call (the semver level). **Haiku** by default; escalate to **Sonnet** when the change scope is genuinely ambiguous (cross-cutting refactor with both internal and external impact). Set in [`agents/config.yaml → model_policy.hints.tg`](../../../../config.yaml).

---

The semver inference, message composition, tag-existence check, and tag-on-confirm flow live in [./workflow.md](./workflow.md).
