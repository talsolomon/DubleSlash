---
name: ds-cr-contract-readout
description: Bran restates the locked shape, AC count, and named constraints in 1–2 sentences before any code is written. Flags ambiguous AC by name. Non-negotiable on every Build entry — even Nemo. Catches misalignment cheaper than a re-implementation.
---

# Contract Readout — Bran runs this

**Who's at the wheel.** Bran. Listener mode — the entire point of CR is to prove Bran read what Sol wrote, before he edits a single file. A 30-second restatement catches misalignment that would otherwise cost a re-implementation.

## What you get

At the end of CR you're holding:

- **A 1–2 sentence restatement** of `locked` from the incoming `<FLOW-handoff>`, in Bran's voice — *"Building: {one-sentence shape} against AC-1…AC-{N}. Constraints: {list of named non-negotiables}."*
- **An AC count** confirming N matches the handoff.
- **A flagged-ambiguity list** — any AC bullet that would force Bran to guess a threshold, definition, or behavior. Each flagged item gets a one-line "what's missing."
- **A go/no-go signal** — clean CR → continue to SL or GE. Ambiguous CR → emit HB to Sol with the specific bullets called out. Don't pick a number; that's silent re-design.
- **A quick repo-conventions note** — Bran names which `CLAUDE.md` / style file / existing primitive he's planning to mirror, so the user can correct course before any edit.

## How Bran and you split the work

| Bran (AI) does | You do | We iterate together |
|---|---|---|
| Read the incoming `<FLOW-handoff>` end-to-end | Confirm the handoff is the latest one — don't build against a stale version | If multiple handoffs exist for this card, we pick the canonical one before reading |
| Restate the shape + AC + constraints in one block | Catch any restatement that drifted from your intent | If the restatement is wrong, that's a cheap-to-fix turn — don't let Bran proceed on a wrong read |
| Flag ambiguous AC bullets by number with "what's missing" | Confirm the flag is real (sometimes context outside the handoff makes it concrete) | If you can fill the gap inline, we annotate the AC and proceed; if not, HB to Sol |
| Name the repo conventions Bran plans to follow | Correct any wrong assumption (deprecated primitive, team rule Bran can't see) | One turn — Bran adjusts and proceeds |

**The split rule here.** Bran can read the handoff and restate it; you know whether the restatement matches what Sol meant. CR is only useful if you actually read it back — skimming Bran's restatement and saying "yes" defeats the gate.

## Where this fits in the Build stream

CR is **the first move on every Build entry, every archetype**. There is no archetype where CR is skipped — even a 15-minute Nemo gets a one-line CR. From [builder.md §5](../../../../../methodology/local-agents/builder.md#5-capabilities-codes-the-user-can-request-directly): "User confirms or amends" is the stop condition. From [builder.md §3](../../../../../methodology/local-agents/builder.md#3-on-activation): CR runs before SL and before any GE.

## When CR refuses to emit

- **No incoming `<FLOW-handoff>`** — CR has nothing to restate. Bran asks for the handoff, or for the user to paste the locked shape + AC inline. Doesn't make one up.
- **`locked` is empty** — that's not a buildable contract. Bran emits HB to Sol with the gap named.
- **AC missing entirely** — Bran refuses to proceed. AC is the contract; no AC means no contract.

## Model

CR is restatement + ambiguity flagging — judgment exists ("is this AC actually concrete?") but the surface is structured. **Haiku** by default; escalate to **Sonnet** when the contract is dense or the AC has subtle ambiguity that needs interpretive read. Set in [`agents/config.yaml → model_policy.hints.cr`](../../../../config.yaml).

---

The restatement, ambiguity check, and go/no-go branching live in [./workflow.md](./workflow.md).
