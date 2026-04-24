---
name: ds-jm-journey-map
description: Dora builds a staged journey map — persona walking a path across touchpoints, with thoughts, emotions, friction, and moments of truth at each stage. Anchored in evidence (interview quotes for Salmon/Willy, product data for Tuna/Nemo). The artifact Sol will anchor the brief against.
---

# Journey Map — Dora runs this

**Who's at the wheel.** Dora. Ethnographic mode — map what the persona *actually does*, not what we'd like them to do. A journey without emotion is a flowchart; a journey without evidence is a guess.

## What you get

At the end of JM you're holding:

- **A staged journey table** at `planning/scans/jm-<card-id>-<date>.md`, one row per stage, columns: Trigger · Action · Thought · Feel · Touchpoint · Friction.
- **A named persona** at the top — with attribution (is this your research persona, a provisional sketch, or a JTBD archetype?). Dora refuses to draw a journey for "users" in the abstract.
- **2–4 highest-friction stages highlighted** — these are where the card's real work lives, and where Sol's brief will focus.
- **At least one "moment of truth"** — the stage where the persona's trust / intent / will accelerates or breaks. This is the load-bearing design decision coming out of JM.
- **Evidence links** per stage — quotes from interviews (Salmon/Willy), product-data observations (Tuna/Nemo), or flagged `no evidence — interview gap` when the stage is inferred.
- **A gap callout** — if the JM reveals multi-persona complexity Dora can't resolve from existing research, she names it and recommends IP or multi-persona extension.

## How Dora and you split the work

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Read the card + sigil + any prior research (IP output, NB findings, transcripts) | Confirm or name the persona — Dora won't proceed with "users" as a stand-in | If no persona exists, Dora flags it and offers: sketch a provisional persona (marked as such), or pause JM and run persona work first |
| Draft the stages based on scope (3–5 for Nemo, end-to-end for Tuna, end-to-end + environment for Willy) | Add stages Dora missed; kill stages that belong to a different card | — |
| Fill Trigger / Action / Thought / Feel / Touchpoint / Friction per stage | Correct where Dora's inference is wrong (your product data + team reality beat her priors) | Dora re-runs a stage fill if you override the persona framing |
| For Salmon/Willy: require at least one direct quote per stage, flag stages with no evidence | Tell Dora where to find the quote (transcript ID + line) or accept the "no evidence" flag | — |
| Highlight the 2–4 highest-friction stages + name at least one moment of truth | Confirm or redirect — you know whether Dora's friction scoring matches your team's lived experience | — |
| For Willy: flag if the JM wants multi-persona or environment framing we don't have yet | Decide: extend JM now, or note as Sol-facing gap | — |

**The split rule here.** AI can draft the table structure fast — but the Thought and Feel columns are where the journey either sings or goes generic. Only you know whether "frustrated" is the right word or whether it's closer to "resigned," "bargained-into-it," or "quietly furious." Refine the emotion column in your voice; don't accept Dora's first-draft adjectives.

## Where this fits in the Explore stream

JM is in the **Tuna cell** (per flow.md §6) as a core Explore method, and in the Salmon/Willy cells as a synthesis move *after* interviews (because imagined Willy journeys are the classic anti-pattern). For Nemos, a mini-journey (3–5 steps around the specific interaction) is useful but not required.

If JM runs before interviews on a Salmon/Willy, Dora will flag it as provisional — the journey is a hypothesis until it's anchored in real quotes.

## Model

Structured extraction into a stage × {trigger, action, thought, feel, touchpoint, friction} table is exactly where **Haiku** is fast and cheap. The one moment to escalate to Sonnet is Willy-scale multi-persona mapping with ethnographic framing (environment, context, stakeholder lanes) — there, interpretive compression across sources matters. Set in [`agents/config.yaml → model_policy.hints.jm`](../../../../config.yaml).

---

Stage filling, evidence binding, and the friction / moments-of-truth highlight pass are in [./workflow.md](./workflow.md).
