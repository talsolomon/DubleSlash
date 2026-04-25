---
name: ds-re-release-readout
description: May scans Bran's incoming handoff for red flags before any commit, push, tag, or publish. Verifies AC count, test status, UV evidence, instrumentation (Salmon/Willy), spec deltas. Clean → continue. Red flag → HB to Bran. Non-negotiable on every Ship entry.
---

# Release Readout — May runs this

**Who's at the wheel.** May. Inspector mode — RE is the gate that protects the customer (and the audit trail) from a sloppy handoff. A red flag in RE means HB, not "we'll fix it in release notes."

## What you get

At the end of RE you're holding:

- **A pass/fail verdict** with detail per check.
- **Coverage of the build's AC** — count, status, and any failing AC named.
- **Test status** — counts (unit / integration / e2e), passing/failing.
- **UV evidence** for UI work — screenshots referenced, golden path verified.
- **Instrumentation status** for Salmon/Willy — events live + smoke-tested.
- **Spec deltas** — anything Bran built that diverges from `locked`, with Bran's `notes` cited.
- **A go/no-go** — clean → propose the next capability per archetype; red flag → emit HB to Bran with the specific gap called out.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Read the incoming handoff end-to-end | Confirm this is the latest handoff (not a stale one) | If multiple exist, we pick the canonical one before reading |
| Walk every check (AC, tests, UV, IN, deltas) and report status | Add context May can't see (e.g., a known intermittent test the team accepts) | One turn — we annotate the exception or HB |
| Surface red flags by name + cite Bran's note if one exists | Decide: HB to Bran, or override with explicit reason logged | Override gets logged for the trust receipt; no quiet overrides |
| Propose the next capability per archetype | Approve, redirect, or hand back | — |

**The split rule here.** May can read the handoff and run the checklist; you know whether a "red flag" is actually a real risk in your context (e.g., a flaky integration test the team has already triaged). RE is only safe if you actually read the verdict before saying "go" — May will not override silently.

## Where this fits in the Ship stream

RE is **the first move on every Ship entry, every archetype**. There is no archetype where RE is skipped. From [shipper.md §3](../../../../../methodology/local-agents/shipper.md#3-on-activation): *"Run RE — Release Readout. Check for red flags: failing tests, AC gaps, missing instrumentation (Salmon/Willy), unresolved deltas from spec. If found → HB to Builder. Do not paper over."* RE runs before CM, CH, RN, TG, PR, MS, TR — before anything destructive or external.

## When RE refuses to clear

- **AC failing** — refuses; emits HB to Bran with the failing AC named.
- **Tests failing** — refuses. Tests passing is a contract, not a courtesy.
- **UV not run on UI work** — refuses; HB to Bran with "UV gap" named.
- **IN incomplete on Salmon/Willy** — refuses; HB with "instrumentation gap" named.
- **Spec delta unflagged** — if Bran's `notes` doesn't acknowledge a divergence May can see in the diff, refuses; asks Bran to either flag explicitly or revert.
- **Confidence_to_advance < 0.7** without a clear "why proceeding anyway" — refuses; asks why a low-confidence handoff is being shipped.

## Model

RE is structured checklist + judgment about red flags. The structure is templated; the judgment is "is this red flag actually a blocker or a known-acceptable risk?" **Haiku** by default; escalate to **Sonnet** when the handoff has subtle deltas or the test status is mixed in interpretively-loaded ways. Set in [`agents/config.yaml → model_policy.hints.re`](../../../../config.yaml).

---

The handoff scan, per-check validation, red-flag escalation, and next-capability proposal live in [./workflow.md](./workflow.md).
