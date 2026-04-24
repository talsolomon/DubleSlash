---
name: ds-ad-adr
description: Sol writes an Architecture Decision Record — Context · Decision · Consequences. Applies to any archetype when a load-bearing technical contract is decided in Solidify (API shape, data model, framework choice, vendor lock). Runs alongside (not instead of) DL for Willy, or standalone for Tuna/Salmon tech decisions.
---

# ADR — Sol runs this

**Who's at the wheel.** Sol. Technical-writer mode — the ADR is the memory that keeps Build honest about the contract it inherited. Six months from now, whoever opens this repo reads the ADR to learn why the code looks the way it does.

## What you get

At the end of AD you're holding:

- **An ADR** at `planning/adrs/ad-<card-id>-<n>.md` using standard ADR structure: Status · Context · Decision · Consequences · Alternatives · Related ADRs.
- **A status line** — Proposed / Accepted / Superseded by {ID}.
- **Context** — what problem, what constraints (perf, compliance, team-skill, cost), what forces at play.
- **Decision** — what we decided, in imperative voice ("We will use X to do Y").
- **Consequences** — what becomes easier, what becomes harder, what we've committed to maintaining.
- **Alternatives considered** — brief, with reasoning for rejection.
- **Related ADRs** — chain-link to supersedes / is-superseded-by / related ADRs.

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Draft Context from the card and any technical investigation upstream | Add constraints Sol couldn't see (team-skill, vendor contracts, compliance, on-call burden) | — |
| Propose Decision in imperative voice | Correct wording; Sol's phrasing often leans too cautious | — |
| Propose Consequences — both harder and easier | Add consequences from domain experience (e.g., this decision will surface in on-call rotations in 6 months) | — |
| Draft Alternatives with one-line reasons for rejection | Add alternatives Sol couldn't see, especially ones already ruled out in your org | — |
| Chain-link related ADRs | Confirm the links; Sol's scan of prior ADRs may miss ones in adjacent repos | — |

**The split rule here.** Sol can write the ADR structure and render the template correctly; you know the real constraints (team, vendor, compliance, on-call). ADR is only as good as the constraint honesty — a generic ADR is useless six months out.

## Where this fits in the Solidify stream

AD applies to **any archetype** when a load-bearing technical contract is locked in Solidify — an API shape the Builder will implement against, a data model that affects multiple cards, a framework or vendor choice. On Willy, AD usually runs alongside DL (DL for the decision + reasoning; AD for the technical consequence). On Tuna/Salmon, AD runs when a technical contract is embedded in the brief (e.g., "use {framework} for state management here"). On Nemo, AD is usually overkill; skip unless the card is specifically about an architectural choice.

## When AD refuses to emit

- **No load-bearing technical contract** — an ADR for a one-line component choice is noise. Sol asks what's load-bearing; if nothing, AD is skipped.
- **Decision not made yet** — an ADR in "Proposed" status is fine, but a truly open decision is a DL candidate first. Sol offers to run DL.
- **Multiple decisions bundled** — one ADR per decision. Sol refuses bundling and offers to split.

## Model

ADR is structured narrative with technical judgment — consequences especially need judgment ("what becomes harder?"). **Sonnet** default. Haiku ADRs come back with generic consequences ("increases complexity") instead of specific ones ("requires on-call rotation to learn {tool}'s alerting semantics"). Drop to Haiku for straightforward ADRs where the template fills mechanically. Set in [`agents/config.yaml → model_policy.hints.ad`](../../../../config.yaml).

---

The context-drafting, decision phrasing, consequence enumeration, alternatives-rejection, and chain-linking live in [./workflow.md](./workflow.md).
