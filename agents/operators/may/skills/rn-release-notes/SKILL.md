---
name: ds-rn-release-notes
description: May writes journey-structured release notes — "what you can do now", "why we changed it", "known limits", "measurement (Salmon/Willy)". Tuna and Willy. Refuses feature-listed notes; rewrites as user outcomes. Drafted only — publishing requires per-channel user authorization.
---

# Release Notes — May runs this

**Who's at the wheel.** May. Writer mode — release notes are the customer-facing narrative of the release. Journey-framed, honest about limits, measurement-aware. The diff and CHANGELOG carry the technical story; release notes carry the *what's-this-mean-for-me* story.

## What you get

At the end of RN you're holding:

- **A release notes document** at `planning/releases/rn-<card-id>-<version>.md` using the §8.1 template from [shipper.md](../../../../../methodology/local-agents/shipper.md#81-release-notes-rn-template--tuna--willy).
- **A journey-framed title** — outcome verb, not feature name.
- **"What you can do now"** — 1–3 bullets, user outcome + verb.
- **"Why we changed it"** — 1–2 sentences on the problem this solved.
- **"Known limits / follow-ups"** — honest about deferred items.
- **"Measurement"** (Salmon/Willy) — baseline + target + readout date.
- **A drafted-not-published state** — May does not post to the blog, the docs site, the customer email, or any external channel. Publishing requires per-channel user authorization.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Read commit + brief / pitch + Bran's notes for the *why* | Sharpen the title and benefit verbs | One turn — May adjusts |
| Draft "what you can do now" bullets (journey-framed) | Catch any feature-list smell | — |
| Draft "why" — 1–2 sentences | Add the user-need framing May can't infer (sometimes the brief understates it) | — |
| Note limits + follow-ups from Bran's `open` | Confirm which limits actually need to surface to customers (some are internal-only) | — |
| Add measurement context for Salmon/Willy | Provide the baseline + target if MS hasn't run yet | — |
| Stop at the drafted state — never publish | Per-channel authorization for any external publish (blog, email, docs site) | Each channel = its own confirm |

**The split rule here.** May can write the notes; you know which customers care about which features and which limits will land badly. RN is only useful if the journey-framing actually matches how customers think about the product — generic "we improved X" copy fails that test.

## Where this fits in the Ship stream

RN applies to **Tuna and Willy** (per [shipper.md §4](../../../../../methodology/local-agents/shipper.md#4-axis-modulation-streams-per-archetype)). On Tuna: RN runs after CH, before TG. On Willy: RN runs at GA (not at alpha or beta — those get TR-stage and an internal note). **Skipped on Nemo and Salmon** — Nemo's CH 1-liner is enough; Salmon notes go in the customer changelog at release day, with the post-readout learning log added 2 weeks later.

## When RN refuses to emit

- **Feature-list framing requested** — refuses; rewrites as journey/benefit. Same anti-pattern as CH.
- **No source material** (no brief, no pitch, no Bran notes) — refuses; asks for the source artifact. Won't invent.
- **Asked to publish** — refuses. RN drafts; publishing is a separate, per-channel-authorized action.
- **Honesty gap** — if Bran flagged a limit Sol acknowledged in `open` but the proposed RN hides it, May rewrites.

## Model

RN is narrative writing for a public audience — judgment-heavy, voice-sensitive, audience-aware. **Sonnet** default, every time. Haiku release notes come back as feature lists with section headers. Set in [`agents/config.yaml → model_policy.hints.rn`](../../../../config.yaml).

---

The title drafting, journey-framed bullet composition, why-section assembly, limit honesty, and measurement framing live in [./workflow.md](./workflow.md).
