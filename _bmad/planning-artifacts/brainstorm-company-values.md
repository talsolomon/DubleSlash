# Brainstorm — Dubleslash Company Values

**Date:** 2026-04-21
**HMW question:** How might we express Dubleslash's values so that anyone — designer, PM, engineer, or investor — instantly understands what we believe, who we're for, and what we refuse to do?

## Starting list (user input)

1. Design is the key for great products — can't just be "replaced" by AI. We equip AI with the right skills.
2. Everyone has special skills — some love Figma, Claude, GPT, Perplexity. Don't replace where you work; give you tools to work better.
3. Teams are stronger than individuals. Cloud syncs teams so each person works with their AI, but we all work on the same projects.
4. Human-AI interaction — Agile doesn't fit the AI-era. FISH model does.
5. Journey, not a screen. Everything interactive and cascaded — how FISH thinks and acts.
6. The only talent you need to be a designer is creativity. We help with the rest.

## Tensions found

- **#1 vs #6** — "design can't be replaced" contradicts "anyone can be a designer with creativity alone." Must pick: defend craft, or democratize it? (Resolution below: craft is the moat, creativity is the entry ticket.)
- **#2 vs #3** — Same value at two scales (individual tool choice + team sync). Fold into one.
- **Missing value** — Nothing on IP / data ownership. In AI-tools market, silence reads as evasion.

## Ideas Generated

### Cluster A — Craft (merges #1 + #6)
- Design is the last craft AI shouldn't automate — and the first it should serve.
- Craft is the moat. Everything else is undifferentiated heavy lifting. ← **Selected**
- Creativity is the only prerequisite; we handle the rest.

### Cluster B — Meet you where you work (merges #2 + #3)
- Your tools are yours. Your team is ours to sync. ← **Selected**
- Tools are personal. Teams are shared. We respect both.

### Cluster C — FISH over Agile (#4)
- Agile ships code. FISH ships journeys. ← **Selected**
- Agile is the incumbent; FISH is the bet.

### Cluster D — Journeys, not screens (#5)
- A screen is not a product. A journey is. ← **Selected (lead value)**
- Static screens are a lie designers have been forced to tell.

### Cluster E — Ownership (GAP, not in user's list)
- Your designs don't train anyone's model. Ever. ← **Conditional — only if infra backs it**

## Top Ideas

| Idea | Impact | Feasibility | Notes |
|------|--------|-------------|-------|
| A screen is not a product. A journey is. | H | H | Lead with this. Figma-manifesto equivalent. |
| Craft is the moat. Creativity is the ticket. | H | H | Resolves #1/#6 contradiction. |
| Your tools are yours. Your team is ours to sync. | H | M | Merges #2/#3. Needs integrations to back it. |
| Agile ships code. FISH ships journeys. | H | H | Stakes a claim. Memorable. |
| Your designs don't train anyone's model. | H | ? | Only if infra commitment holds. |

## Recommended direction

Collapse six values into four. Lead with **"A screen is not a product. A journey is."** — it's the Figma-manifesto line already buried in the list. Pair each value with a refusal for cadence ("not a screen / not automation / not replacement / not Agile"). Decide on the ownership value (#5) before launch — adding it requires real infra commitment; leaving it out means answering the question in every investor meeting.

## Next steps

- [ ] User decides: four values or five (ownership question)
- [ ] User decides: does #6 survive as its own value, or fold into Craft?
- [ ] Lock wording, then update `website/index.html`
- [ ] Consider: `/bmad-create-product-brief` if values shift positioning materially

---

## Session outcome (2026-04-21)

Session progressed through ~4 rewrites before Tal flagged the output as unsatisfactory and parked revision for later. Current draft saved to [company-values.md](./company-values.md). Task tracked as **PRD-004** on [task-board.md](./task-board.md).

**Final draft (provisional, not locked):**

1. **Flows, not frames.** — products are paths, not snapshots.
2. **The best tools don't ask you to switch.** — meet users inside their workflow.
3. **Human-AI collaboration needs its own method.** — Agile doesn't fit; FISH does.
4. **Ownership comes from participation.** — the cake-mix principle; build *with* AI, not *by* AI.
5. **Trust is earned by showing the work.** — no black boxes, every step visible.

**Dropped:** the "creativity is the only prerequisite" value — Tal rejected every framing attempted. Open question whether it belongs at all, or is product-benefit copy misfiled as a value.

**Dropped:** the "your work stays yours / doesn't train any model" value — Tal rejected; not pursuing.

**Confirmed philosophy (keep for next revision):** cake-mix / Betty Crocker / "add your own egg" — participation creates ownership. This is the load-bearing idea behind value #4 and arguably the whole company.
