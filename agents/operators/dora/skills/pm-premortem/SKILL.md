---
name: ds-pm-premortem
description: Dora walks you through a structured premortem — imagine the card has shipped and failed six months from now; work backward to surface specific risks across 5 categories; score probability × severity; invert to mitigations with named owners. Willy standard; optional Salmon. Produces a risk register Sol will read.
---

# Premortem — Dora runs this

**Who's at the wheel.** Dora. Adversarial mode — her job here is to *catastrophize well*. Generic failure modes ("the team fell apart") are anxiety, not insight. Specific failure modes ("the PM and designer never agreed on {{x}} and it showed at {{stage}}") are research.

## What you get

At the end of PM you're holding a Sol-facing risk register:

- **A premortem document** at `planning/scans/pm-<card-id>-<date>.md`.
- **A definition of "failure"** at the top — what metric or outcome makes us say this was a failure? For Willys, this is the measurement-plan kernel Sol will build against.
- **15–25 specific failure stories** across 5 categories: User · Technical · Business · Organizational · External. Each one sentence, past tense, specific.
- **Every failure mode scored P × S** — probability (low/med/high) × severity (low/med/high). The High × High failures are Solidify blockers; High × Med are mitigatables; everything else is logged as notes.
- **Proposed mitigations** for every material (High × High or High × Med) failure mode — specific enough that an owner can act. Each mitigation names the phase responsible (Explore extension, Solidify lock, Build instrumentation, Ship staged-rollout).
- **A reverse-read pass** — Dora re-checks: *with these mitigations applied, would each failure still happen?* Unresolved risks are flagged explicitly.
- **A Sol-facing summary** — blockers + mitigatables + mitigation owners, ready to drop into the handoff.

## How Dora and you split the work

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Read the card + sigil + prior Explore artifacts (HS, CS, JM, IP, NB) | Confirm the failure definition (for Willys, pin the failed-metric — you know what "real failure" looks like in your org) | If the card's measurement direction is vague, Dora offers two definitions and you pick |
| Generate 3–5 specific failure stories per category | Push back on generic failures ("users didn't adopt") — generic = not useful; push for the *specifically why* | Dora rewrites each generic mode into a specific one, based on your context + prior research |
| Score each P × S | Recalibrate scores — you know the team's actual skill gaps, the real competitive threats, the compliance frame that's about to change | — |
| Propose mitigations for High × High and High × Med | Name real owners; kill mitigations that aren't feasible in your org | Dora refines the mitigation until it's actionable + has a named phase owner |
| Reverse-read each mitigation against its failure mode | Confirm the mitigation would have prevented the failure | If not, Dora flags as unresolved risk and proposes a stronger mitigation or escalates the severity |
| Flag the External category honestly (competitor moves, regulation, market timing) | Push back if Dora's externals are generic; you know which regulators / competitors / macro shifts actually apply | — |

**The split rule here.** AI is fast at pattern-recognition across categories (draws from many projects' failure modes) but has no local knowledge of *why your specific team + product is likely to fail in a specific way.* Premortem is where your scar tissue is load-bearing — the failures you've personally seen beat Dora's priors every time. Don't skip the recalibration pass.

## Where this fits in the Explore stream

PM is in the **Willy cell** as standard (per flow.md §6 — contextual inquiry, JTBD, premortem, scenario planning all run together on Willys). On Salmon it's optional — useful when the research reveals contested shape directions. On Tuna it's rare but earn-its-place when the card has outsized strategic consequence.

PM often runs late in Explore — after interviews, after synthesis — because specificity improves as research accumulates. A Willy premortem with no interview evidence is itself a failure mode.

## Model

Adversarial reasoning with probability × severity scoring across 5 categories is where **Sonnet** earns its cost. Haiku premortems cluster in generic failure-language and miss the External category almost entirely (they produce in-group failures — team, product — and skip competitive / regulatory / macro failures). PM is the kind of work where model quality directly shapes whether the premortem is useful or performative. Set in [`agents/config.yaml → model_policy.hints.pm`](../../../../config.yaml).

---

The 5-category generation, P × S scoring, mitigation inversion, and reverse-read sequence are in [./workflow.md](./workflow.md).
