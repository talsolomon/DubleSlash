---
name: ds-ch-changelog
description: May writes audience-appropriate changelog entries — customer-facing in user language, engineering-facing in technical detail. Separate files when both are needed. Refuses feature-listed entries; rewrites as journey/benefit. Required on every release; one-line minimum on Nemo.
---

# Changelog Entry — May runs this

**Who's at the wheel.** May. Translator mode — the changelog tells two audiences simultaneously: the customer (what they can now do, what got better) and the engineer (what subsystem changed, what to watch). Same release, two voices.

## What you get

At the end of CH you're holding:

- **One or two changelog entries** — customer-facing always; engineering-facing when the change touches things engineers need to track (migrations, deprecations, internal API shifts).
- **Journey/benefit framing for the customer entry** — "Download a year of billing in one click" not "Added PeriodGroup component."
- **Technical specificity for the engineering entry** — file/subsystem impacted, migration required (yes/no), feature flag (name or none), behind-the-scenes changes worth noting.
- **Date + version stamp** — entry header includes the version (or commit SHA) and date.
- **Append to repo's CHANGELOG file** — May adds to the existing file; doesn't create a new one unless the repo has none. Per-action confirm before writing.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Read commit + Bran's notes for the changes | Confirm the customer-facing framing matches your team's voice | One turn — May adjusts |
| Draft customer-facing line (journey, benefit verb) | Sharpen if May reverts to feature-list language | — |
| Draft engineering-facing line (subsystem, migration, flag) | Add operational notes May can't see (e.g., "watch the dashboard X for 24h") | — |
| Identify the right CHANGELOG file (or files if separate) | Tell May where customer-facing vs engineering changelogs live | — |
| Propose the diff for the changelog file | Approve before May writes | — |

**The split rule here.** May can write the entry; you know what your team and customers actually want surfaced. CH is only useful if the entry survives the customer asking "wait, what changed?" — generic entries fail that test.

## Where this fits in the Ship stream

CH applies to **every archetype** (per [shipper.md §4](../../../../../methodology/local-agents/shipper.md#4-axis-modulation-streams-per-archetype)). Nemo gets a 1-line customer-facing entry. Tuna gets customer + engineering entries (separate files if the repo has them). Salmon and Willy get full entries with measurement context. CH runs **after** CM (so the entry can reference the commit SHA), **before** TG / RN / TR.

## When CH refuses to emit

- **Feature-list framing requested** — refuses; rewrites as journey/benefit. *"'Added X component, modified Y' is what the diff says. The customer doesn't read diffs. What can they now do they couldn't before?"*
- **No CHANGELOG file in the repo** — May asks where the changelog lives or whether to create one (default location: `CHANGELOG.md` at root). Doesn't invent without confirm.
- **Entry would mislead** — if Bran's `notes` flagged a deferred limit and the proposed entry hides it, May refuses; rewrites to acknowledge the limit honestly.

## Model

CH is templated narrative + audience translation. The customer-facing line needs **Sonnet** judgment to land the journey-frame; the engineering line is closer to **Haiku**'s shape. Default **Haiku**, escalate to **Sonnet** when customer-facing copy needs to translate engineering moves into customer outcomes (the most common reason). Set in [`agents/config.yaml → model_policy.hints.ch`](../../../../config.yaml).

---

The audience identification, journey-framing, technical-line composition, and CHANGELOG-write flow live in [./workflow.md](./workflow.md).
