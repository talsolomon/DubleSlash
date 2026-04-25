---
name: ds-nl-next-loop
description: May drafts a Ship → Explore handoff that queues the next iteration. Carries the learnings (locked) and surprises (open) from MR + RP into Dora's next aperture-opening session. Optional but encouraged on every release; required when MR or RP surfaced a learning worth pursuing.
---

# Next-Loop Queue — May runs this

**Who's at the wheel.** May. Continuity mode — NL is the bridge between this card's close and the next card's open. Without NL, the lessons live in someone's head and the next iteration starts cold.

## What you get

At the end of NL you're holding:

- **A Ship → Explore `<FLOW-handoff>`** drafted via the helper, addressed `from: may, to: dora` (or `to: explorer` for legacy compatibility).
- **`locked` populated with learnings** — what we know now that we didn't before. From MR (Salmon/Willy) + RP (Willy) + the team's lived experience this card.
- **`open` populated with surprises and next-aperture questions** — what we want Dora to open the aperture on next.
- **A new card_id** (or the same card_id if the next loop is a continuation of this one) — May proposes; user confirms.
- **A sigil hint for the next card** — usually unknown until Dora's SA runs, but if MR strongly suggests "this is a Salmon" (because we learned the user behaves unexpectedly), May flags it as a starting hint.
- **The handoff written to disk** at `.flow/handoffs/{new_card_id}-may-to-dora-{date}.handoff.md`.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Pull learnings from MR + RP | Add learnings May can't see (the customer-call insight, the support-ticket pattern) | One turn per surface |
| Pull surprises from MR + RP | Confirm which surprises actually deserve next-loop attention vs noise | — |
| Propose new card_id (or same if continuation) | Confirm | — |
| Propose sigil hint if MR strongly suggests one | Override or accept | — |
| Compose the handoff via `ds-handoff-compose` helper | Confirm framing in `notes` matches your read | — |
| Write to disk | — | — |

**The split rule here.** May can pull from artifacts; you carry the lessons that aren't written down. NL is only useful if the surprises section is honest about what we actually want to investigate next — generic "iterate on this" surprises don't help Dora open the aperture.

## Where this fits in the Ship stream

NL applies to **every archetype** but is **strongly recommended** for Salmon/Willy (where MR and RP surface learnings worth pursuing). On Nemo: NL is optional — sometimes a fix is just a fix. On Tuna: optional unless the release surfaced a follow-up Tuna or Salmon worth queuing. On Salmon/Willy: required if MR named a learning or RP named a methodology gap. NL runs **after** TR (so TR is referenced as the prior-card audit) and is the **last** thing May does before the terminal `HO` or before handing the file off to Dora for the next loop.

## When NL refuses to emit

- **No learnings + no surprises + no follow-ups** — gracefully skips. *"This card closed clean — no learnings worth queuing. Recommending terminal HO; next card will start fresh."*
- **MR/RP not yet run on Salmon/Willy** — refuses; insists MR and RP run first. NL without measurement is wishful planning.
- **Asked to commit Dora to a specific shape** — refuses. *"NL queues a question for Dora to open. Committing a shape is Sol's job downstream — and only after Dora's SA + framing."*

## Model

NL is judgment-weighted assembly — picking which learnings + surprises actually matter for the next loop, framing them in a way Dora can act on. **Sonnet** default. Haiku NLs come back as a copy-paste of MR and RP; Sonnet NLs synthesize. Set in [`agents/config.yaml → model_policy.hints.nl`](../../../../config.yaml).

---

The learning + surprise extraction, card_id proposal, sigil hint, and handoff composition (via `ds-handoff-compose`) live in [./workflow.md](./workflow.md).
