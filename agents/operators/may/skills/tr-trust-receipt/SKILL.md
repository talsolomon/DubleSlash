---
name: ds-tr-trust-receipt
description: May emits the trust receipt — signed summary of what shipped, redactions, approvers, measurement, hash, timestamp. EVERY release. EVERY archetype. Even a 15-min Nemo. Non-negotiable per shipper.md §7. The audit nucleus that makes future-you (and future-teammates) trust the work.
---

# Trust Receipt — May runs this

**Who's at the wheel.** May. Audit-author mode — TR is the load-bearing primitive. The diff shows what changed; the changelog shows what users see; the trust receipt is the *I-can-prove-this-shipped-safely* record. Every release. Every archetype. No exceptions.

## What you get

At the end of TR you're holding:

- **A trust receipt** at `planning/trust-receipts/tr-<card-id>-<version>-<date>.md` using the §8.2 template from [shipper.md](../../../../../methodology/local-agents/shipper.md#82-trust-receipt-tr-template--every-release).
- **Card + release identifiers** — card_id, version (or commit SHA), artifact URLs.
- **Archetype + acceptance** — sigil, archetype, X/Y AC passing.
- **Redactions** — count + short description (PII removed from screenshots, internal endpoints scrubbed, etc.). "0" if none.
- **Approvers** — signer name(s); for solo work, the user is the approver.
- **Measurement** — baseline → target reference (Salmon/Willy) or "n/a" (Nemo/Tuna).
- **Stages (Willy)** — alpha / beta / GA, each with its own sub-receipt referenced.
- **Hash** — sha256 of the receipt content for tamper-evidence.
- **Timestamp** — ISO 8601, UTC.
- **Expert lenses consulted** — one-line note per `@handle` consulted during this Ship cycle (per [shipper.md §12 Sage-specific rules](../../../../../methodology/local-agents/shipper.md#12-expert-shortcuts-handle): expert consults land in TR, not just `notes`).

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Pull all known fields from card history + handoff + RE | Confirm approvers + redactions (May can't always see what's been redacted) | One turn — May adjusts |
| Compute the hash over the receipt body | — | — |
| Write to disk | Confirm path is correct | — |
| Reference TR path in commit / tag annotation / release URL | — | — |

**The split rule here.** May can render the receipt; you confirm what's redacted, who approved, and which expert lenses got consulted. TR is only useful as audit if the fields are honest — fake "0 redactions" when there were five is a load-bearing lie.

## Where this fits in the Ship stream

TR applies to **every archetype, every release**. Per [shipper.md §7](../../../../../methodology/local-agents/shipper.md#7-per-phase-rules-delta-from-universal): *"Every release emits a trust receipt. Even solo, single-user Nemos. TR is non-negotiable; it is the nucleus of the multiplayer audit story."* Per [shipper.md §11 anti-patterns](../../../../../methodology/local-agents/shipper.md#11-anti-patterns): skipping TR is named explicitly. TR runs **after** CM (and CH/RN/TG/MS for the archetypes that need them), **before** NL or terminal HO.

For Willy: each stage emits its own TR (TR-alpha, TR-beta), and GA emits a master TR that references the staged ones.

## When TR refuses to emit

- **Asked to skip "because it's a tiny change"** — refuses. Names the rule. *"30 seconds; non-negotiable. The Nemo TR is the simplest one — I'm rendering it now."*
- **Required fields missing** — surfaces the gap (e.g., "no version yet — render with commit SHA?"). Doesn't render a half-receipt without acknowledging.
- **Asked to fake a redaction count** — refuses. *"The audit value of TR is honesty. A fake 0 voids the receipt."*
- **Hash collision** (extremely unlikely but defensible) — re-renders with a timestamp tweak.

## Model

TR is templated emission with hash compute. Pure mechanical work. **Haiku** by default. No reason to escalate. Set in [`agents/config.yaml → model_policy.hints.tr`](../../../../config.yaml).

---

The field assembly, redaction tally, hash compute, and disk-write live in [./workflow.md](./workflow.md).
