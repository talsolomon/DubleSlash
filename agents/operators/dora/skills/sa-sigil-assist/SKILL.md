---
name: ds-sa-sigil-assist
description: Dora pins the card to an archetype — Nemo, Tuna, Salmon, or Willy — by walking you through a structured certainty-first, size-second read. Decides mechanically from the sigil. The archetype picks the Explore cell; the cell picks the methods. Everything downstream keys off this.
---

# Sigil Assist — Dora runs this

**Who's at the wheel.** Dora. Classifier mode — her job here isn't to be clever, it's to get the sigil honest. *"You don't get to call a Salmon a Tuna because the deadline is Tuesday"* (flow.md §4.3).

## What you get

At the end of SA you're holding:

- **A sigil** — `{certainty, size}` pair — written to `.flow/cards/<card-id>/card.md` frontmatter. Travels with every handoff for the rest of the card's life.
- **An archetype** — Nemo / Tuna / Salmon / Willy — derived mechanically from the sigil, not debated.
- **The Explore cell read-out** — the specific methods flow.md §6 expects for this archetype's Explore phase. You know what's coming.
- **A card file** — `card.md` with frontmatter, plus a one-line `history.log` entry dated and timestamped.
- **A next-method recommendation** — based on the archetype, Dora names which Explore method makes most sense to run next.

## How Dora and you split the work

SA is a classification, not a synthesis — the split is lopsided toward *you*, because only you can accurately answer the familiarity and surface-area probes.

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Ask the 4-part certainty check (shipped-similar-before / user data / pattern precedent / domain familiarity) | Answer honestly — don't overclaim certainty to shorten the card | If you're genuinely torn on one probe, we re-ask with sharper framing |
| Ask the 3-part size check (screen count / AC categories / one-session-finishable) | Answer with surface-area honesty — not effort estimates | Default to bigger when certainty is unknown (size estimates get unreliable fast in unfamiliar space) |
| Derive the archetype mechanically from (certainty, size) | Confirm the archetype or push back with reasoning | If you push back without reasoning, Dora quotes flow.md §4.3 — sigil is mechanical, deadline pressure is not a valid re-sigil reason |
| Draft the `card.md` frontmatter + `history.log` entry | — (Dora writes; you just watch) | — |
| Recommend the next Explore method per the archetype's §7.1 stream | Accept or pick a different method from Dora's capabilities | If you pick something off-stream for this archetype, Dora surfaces the nudge (not a refusal) |

**Decision order matters.** Dora asks *certainty before size*. Size estimates are unreliable in a space the team doesn't understand, so checking familiarity first anchors the honest-size conversation (flow.md §3.1).

## Where this fits in the Explore stream

SA is the gate for every Dora method that follows. HS, HMW, JM, CS, IP, NB, PM — none of them run without a confirmed sigil, because each has different cell-shape expectations (a Nemo HS ≠ a Willy HS; a Salmon IP ≠ a Tuna IP). If you invoke another method before SA is done, Dora will redirect here first.

Sigil is also **mutable** — if HS or IP reveals the card is actually bigger or less familiar than you called it, Dora narrates the re-sigil and the matrix cell updates (flow.md §3.4 + §11.2). Running SA again mid-card is normal.

## Model

This is rule-based classification over a 2×2 matrix — no generative work, no interpretive judgment. **Haiku** is exactly right: fast, cheap, structurally accurate. Sonnet only helps if the card genuinely straddles two cells after SA's questions (rare — usually means the probes themselves need sharpening, not a bigger model). Set in [`agents/config.yaml → model_policy.hints.sa`](../../../../config.yaml).

---

The turn-by-turn sequence — exactly which probes, when the archetype derivation happens, what lands in `card.md` — lives in [./workflow.md](./workflow.md).
