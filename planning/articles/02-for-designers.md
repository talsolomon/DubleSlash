---
title: The AI didn't know where you were. FLOW does.
subtitle: How design-thinking survives the AI era — for designers who feel like they've stopped designing and started improvising.
audience: designers, design leads, UX researchers, design-led PMs
length: ~2,200 words
status: draft
author: Duble Slash
---

# The AI didn't know where you were. FLOW does.

There is a specific before-and-after in a designer's day that nobody is quite talking about.

**Before AI:** you opened Figma, picked up a card, pulled out your sketchbook, talked to two users, ran a competitor scan, drafted a brief, handed it to a developer. Your process had shape. You knew which phase of which diamond you were in. The tools made you slow; the process made you sure.

**After AI:** you open Claude. You type *"help me design an onboarding flow."* Forty messages later you have some ideas, some component sketches, a half-written brief, and a feeling that you're not actually designing anymore. You're improvising. The AI keeps producing. The session ends. Tomorrow you open it again and explain everything from scratch.

You have not lost your taste. You have lost your **orientation**.

This is the problem FLOW was built to solve, and this article is about why it matters specifically for designers.

---

## Seven pains, one root cause

When we interviewed designers using AI daily in 2025, the same seven complaints kept showing up:

1. *"I don't know where I am."*
2. *"I don't trust any of this is saved."*
3. *"The AI doesn't guide me through a process."*
4. *"It has no UX instinct — it just proposes solutions."*
5. *"When I switch from Claude to Cursor to Figma, I start over."*
6. *"I can't see the project, just the pieces."*
7. *"There's no history of who decided what."*

None of these are model-quality complaints. GPT and Claude can sketch brilliantly. They can write AC. They can cite Nielsen's heuristics accurately. What they cannot do, on their own, is **run a method.** They do not know that it is the wrong time to sketch. They do not know that "interview five users" is in the Salmon Explore cell and not in the Nemo one. They do not know what phase you are in, because nobody told them phases exist.

The root cause is a missing shared vocabulary between the designer and the AI.

FLOW is that vocabulary.

---

## What the method gives you back

FLOW runs one card — one unit of work — through four phases, named after fish anatomy:

- **Explore** (head) — open the aperture. Surface options, users, premises.
- **Solidify** (left body) — reduce unknowns to one shape. Lock the decisions that unblock Build.
- **Build** (right body) — execute against the locked shape. No re-opening settled questions.
- **Ship** (tail) — narrate the release, capture the learning, queue the next loop.

Every card also carries a **sigil** — `(certainty, size)` — that picks one of four archetypes. You decide certainty first (familiarity check, five minutes), then size:

| If the card is… | The archetype is… | And the Explore looks like… |
|---|---|---|
| known × smaller | **Nemo** | 10 minutes: competitor scan, heuristic check, one HMW |
| known × bigger | **Tuna** | a day: journey map, OSD, convention inventory, 3–5 parallels |
| unknown × smaller | **Salmon** | a week: 5–8 interviews, TZUMI, nugget board, task analysis |
| unknown × bigger | **Willy** | 2+ weeks: interviews, contextual inquiry, JTBD, GDD, premortem, scenario planning |

The point is not that there are four buckets. The point is that **the AI can finally size the work with you**, instead of defaulting to "let's start sketching" on every card.

When you type `//explore onboarding-redesign`, the Explorer agent — we call her Dora — does something no chat has done for you before. She asks *what fish is this?* and she doesn't let the card leave Explore without a sigil. If you say *"smaller, known,"* she runs the Nemo Explore. If you say *"bigger, unknown,"* she tells you you are looking at two weeks of Willy-intensity research before a sketch is appropriate, and she offers to start.

That is the first thing FLOW gives you back: **you know where you are.**

---

## The AI's UX instinct, installed

Designers have a specific complaint about AI that isn't about sketching quality. It is this: *"It jumps to 'here's a solution' before asking about users."*

That is not a model problem. That is a posture problem. The AI is trying to help, and "produce something" reads as helpful. In the absence of a method, "produce something immediately" wins every time.

FLOW gives the AI the posture a good design mentor would have. The Explorer's job is to *open the aperture*, not close it. When you ask Dora for a wireframe in the middle of Explore, she doesn't sketch. She says something like:

> *"Before we sketch — we haven't talked to anyone yet on this flow, and the matrix for a Salmon says we need at least five interviews. Want to do a quick 3-interview guide now, or would you rather re-sigil this to a Nemo if you're confident the pattern is known?"*

That is the nudge. **Not refuse. Nudge.** You can say *"skip it, I'm going."* You will skip it *knowing what you're skipping*, which is the entire point. What you will not do is drift out of Explore because the AI was too polite to tell you that you were drifting.

A great mentor never says "I refuse." A great mentor says *"before we do that, five minutes on this — then we sketch with a much better foundation."*

---

## Matching intensity to the work

Every designer has had the experience of doing two weeks of research on a tooltip fix, or shipping a platform redesign on two days of interviews. Intensity mismatch is where good designers burn out and good products get shallow.

FLOW's matrix exists to prevent that mismatch mechanically. The Nemo Explore is ten minutes — literally. The Willy Explore is two weeks — explicitly. The methods in each cell are named, not adjectival, so "do a heavy Explore" stops meaning whatever you felt like that day.

Here is what that looks like in practice. Both are real cards.

### Nemo — a tooltip copy fix

Support flagged that two tickets this week asked whether "Export as CSV" exports the current view or all data. The sigil is obvious: known × smaller → Nemo. Budget: under two hours.

- **Explore (10 min).** Heuristic scan found the "match between system and real world" violation. One HMW: *"How might we make the export-scope choice obvious before the user clicks?"* Quick scan of three competitor tools. No Hick's Law concern.
- **Solidify (20 min).** Chose copy rewrite over dropdown — minimal surface change. One napkin-level sketch. Three AC bullets. Uses existing Tooltip primitive; no new component.
- **Build (30 min).** Replaced the string in `ExportButton.tsx`. Screen-reader test passes.
- **Ship (10 min).** One-line changelog. Commit with "why" in the message. Trust receipt.

Two hours total. Zero PRD. Zero journey meeting. Dora refused to wireframe a dropdown. Sol refused to scope-creep. The method protected the right-sized work.

### Salmon — onboarding step-3 abandonment

Analytics flagged a 40% drop at step 3. Flow was built 18 months ago. No recent interviews. Sigil: unknown × smaller → Salmon. Budget: about 1.5 weeks.

- **Explore (5 days).** Seven user interviews. TZUMI: Go-Learn, One-User, Hand-in-Hand. Nugget board with 28 findings. Three candidate framings; winner: *"Users abandon step 3 because the password-strength meter surfaces after typing, making them feel retroactively judged."*
- **Solidify (3 days).** Instructional copy pattern won. Low-fi concept test with 5 users. Iterated once. Measurement plan: target +20 points on step-3 completion.
- **Build (2 days).** Copy change plus meter-surfacing logic. Instrumented the signup event. Usability test with 4 users — 4/4 completed.
- **Ship (spread over 2 weeks).** Baseline captured. Measured post-release: step-3 rose from 60% to 78%. ISO 9241 triad all improved. Learning log: *"Meter placement matters more than wording."* Queued the next loop.

Without Salmon-intensity Explore, the team would have shipped a cosmetic copy fix and missed the real cause. The method protected the investigation.

Two cards, two sigils, two intensities. Same method. That is the design-thinking version of "match the intensity to the work" — made operable.

---

## Your research survives the project

Here is a quieter win that designers feel immediately.

In the old model, your research notes — interview transcripts, journey maps, nugget boards, competitor scans — lived in a folder somewhere. Three months later, nobody on the team could find them. Three years later, they were gone. The next designer rebuilding the same flow started from zero.

In FLOW, every phase emits a handoff block with its **artifacts** listed. The card file accumulates: the Explore handoff lists the interview notes; Solidify lists the brief; Build lists the acceptance criteria; Ship lists the trust receipt. The card *is* the history.

When someone picks up a related card six months later, they open the folder and find:

- Every decision that was locked, with reasoning.
- Every question that was open and how it was resolved.
- Every artifact that was produced, indexed.
- The trust receipts listing what shipped and who approved.

This is not a documentation burden. It is a byproduct of how FLOW runs. You did not write a second artifact; you wrote the handoff, which is the artifact. The documentation is the work.

---

## Handback is not a failure

One more design-thinking rule FLOW formalizes: **reverse transitions are legitimate.**

Say you're halfway through Build on a Salmon, and you discover that the locked decision from Solidify conflicts with a research finding from Explore that everyone forgot about. Old model: you argue in Slack, you eat the conflict silently, or you rebuild. New model: the Builder emits a reverse handoff to Solidify with one sentence explaining why — and Solidify opens just that question, with the history intact.

Reverse is narrated, normal, expected. Silently redesigning without reversing — that is failure. FLOW's job is to make loops legible, not to prevent them.

You already do this in your head. FLOW makes it legible in the tool.

---

## What this changes in your daily flow

The subtle shift is this. You stop treating AI sessions as places where work happens and start treating them as **instruments the method is running through**. The card outlives the session. The handoff outlives the tool. The method outlives the vendor.

Concretely, a designer's day in FLOW looks like:

- You open your AI tool of choice.
- You pick up a card. The handoff from the last phase is loaded automatically; you do not re-brief.
- The operator agent for the current phase is active — Dora, Sol, Bran, or May.
- The agent runs the matrix cell for your card's sigil. You know what's coming.
- When you need a specialist — a PM lens, an architect lens, a researcher lens — you loan one in. Phase doesn't change.
- At phase exit, a handoff is written. You can close the tool. Tomorrow you open Cursor or ChatGPT, type `//solidify <card-id>`, and you pick up where you left off.
- When you ship, a trust receipt is emitted. It lives on disk. It's signed.

No new tool to learn — the method runs inside whatever you're already using. What changes is that the AI finally has the vocabulary to work with you, not just respond to you.

---

## Why this is specifically for you

Most methodology conversations in the AI era are aimed at engineers. FLOW starts from the designer's point of view on purpose, because design-thinking is the thing most at risk of being hollowed out by AI. It is easy to produce sketches. It is easy to produce copy. It is easy to produce flows. What is hard is the discipline to not produce — to sit in Explore, to run the interviews, to refuse to sketch until the framing is stable.

Designers have that discipline. AI does not — yet. FLOW is how you give it to them.

The 2024 Fish Model said intensity should match the work. FLOW says: the AI can help you enforce that, if you give it the vocabulary. Four phases. Four archetypes. One handoff format. A matrix that names methods instead of vibing them.

You get your orientation back. You get your research trail back. You get your discipline back. And the AI finally stops improvising.

That is the pitch. Open a card. Give it a sigil. See what your Explorer says.

---

*Next in the series: how FLOW changes the handoff between design and engineering — and why the Slack-paragraph plus Figma-link era is finally ending.*
