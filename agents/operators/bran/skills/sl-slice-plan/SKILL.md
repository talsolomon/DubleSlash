---
name: ds-sl-slice-plan
description: Bran proposes an ordered list of vertical slices for Tuna/Salmon/Willy builds. Each slice ships one user-visible capability end-to-end and names the AC it satisfies. Refuses horizontal layer plans (model → API → UI) because they hide integration bugs until the end.
---

# Slice Plan — Bran runs this

**Who's at the wheel.** Bran. Sequencing mode — vertical slices, not horizontal layers. Each slice is the smallest user-visible capability that satisfies one or more AC.

## What you get

At the end of SL you're holding:

- **An ordered list of vertical slices** — Slice 1, Slice 2, Slice 3… each one a user-visible capability end-to-end (UI + behavior + storage if needed).
- **AC mapping per slice** — every AC bullet assigned to the slice that delivers it. No orphaned AC; no AC stretched across many slices.
- **Files-touched estimate** — for each slice, the rough file list Bran expects to edit (so the user can flag scope drift early).
- **Tests-per-slice plan** — unit / integration / e2e for each slice's golden path.
- **Instrumentation tags (Salmon/Willy)** — which MP events fire in which slice, so wiring isn't deferred to the end.
- **A starting slice** — Bran proposes Slice 1 with ETA and asks for the go.

## How Bran and you split the work

| Bran (AI) does | You do | We iterate together |
|---|---|---|
| Read AC + brief + storyboard, propose vertical slices in build order | Reorder if your domain knowledge says a different slice unblocks the others | One turn — Bran adjusts and re-proposes |
| Map every AC to a slice; flag any that don't fit | Add AC Bran missed (sometimes the brief implies AC the AC list omitted) | If a slice has no AC, that's gold-plating — kill it |
| Estimate files-touched per slice | Correct based on repo intimacy Bran can't have (refactors planned, deprecations queued) | — |
| Propose tests + instrumentation per slice | Adjust per team norms (e2e budget, analytics provider choice) | — |
| Recommend Slice 1 + ETA | Approve, defer, or pick a different starting slice | — |

**The split rule here.** Bran can read AC and propose slicing; you know what the team has bandwidth for and which slice's tail-risk is highest. SL is only useful if the order reflects real constraints — don't let Bran propose Slice 1 just because it's alphabetically first.

## Where this fits in the Build stream

SL applies to **Tuna, Salmon, and Willy** — anywhere with multiple AC. Per [builder.md §4](../../../../../methodology/local-agents/builder.md#4-axis-modulation-streams-per-archetype), Tuna defaults are CR + SL + GE + TE + UV; Salmon adds IN + UV; Willy adds PR. **Nemo skips SL** — by definition, Nemo is one slice, and the SL ceremony adds no signal. **Willy rule:** a single Willy build is almost always a sign of missing Solidify structure. Break into Tuna-sized sub-cards before SL; if you can't, SL with explicit sub-card markers.

## When SL refuses to emit

- **Nemo card** — Nemo is one slice by definition. Bran skips SL and goes straight to GE.
- **Horizontal-layer ask** — if the user says "build the API first, then the UI," Bran flags the anti-pattern: *"That hides integration bugs until the end. Vertical slices ship a thin user-visible capability end-to-end. Want me to re-slice?"* Refuses to honor a horizontal plan.
- **AC orphans** — if some AC don't map to any proposed slice, SL stops. Either the AC is gold-plating (kill it via HB to Sol), or the slice list is incomplete (Bran adds slices).
- **Willy with no sub-card breakdown** — Bran first proposes breaking the Willy into Tuna sub-cards. If the user insists on a single Willy build, SL emits with explicit "this should have been N sub-cards" warning.

## Model

SL is sequencing + judgment about what unblocks what — not template filling. **Sonnet** default for Tuna/Salmon/Willy. Haiku tends to slice along file boundaries (one slice per file) instead of along user-visible capabilities. Drop to Haiku only when the AC list is small (3–5) and obviously ordered. Set in [`agents/config.yaml → model_policy.hints.sl`](../../../../config.yaml).

---

The slice enumeration, AC-mapping, files-touched estimate, and Slice-1 proposal live in [./workflow.md](./workflow.md).
