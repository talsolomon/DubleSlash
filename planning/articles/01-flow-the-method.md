---
title: FLOW — a method for working with AI that doesn't break under you
subtitle: A long blog post about why AI-assisted product work keeps dissipating, and what finally fixes it.
audience: designers, PMs, developers, and founders building product with AI in 2026
length: ~3,200 words
form: long-form blog post
status: draft
author: Tal Solomon / Duble Slash
---

# FLOW — a method for working with AI that doesn't break under you

You know the moment.

It's 4:40pm. You opened Claude around lunchtime to "just think through" the onboarding redesign. You have forty messages in the chat. You have three half-sketched flows, a couple of passable microcopy drafts, two decisions that might be decisions and might just be vibes, and a nagging awareness that you don't actually know what will survive when this session closes. You are not sure if you have been designing or improvising. You are not sure what you'll tell the team tomorrow. You are definitely not sure how to re-enter this work tomorrow — not in this tool, and definitely not in Cursor or Figma, both of which are a blank slate relative to what just happened.

You tell yourself you made progress. You also tell yourself you'll "clean it up tomorrow." You already know you won't.

This article is about why that feeling exists, why it's a **methodology problem and not a model problem**, and what I've been building — with the help of a lot of other people's work — to fix it. The short name for the fix is **FLOW**.

I'm going to walk through what FLOW is, why I think it's the missing layer for AI-assisted product work, and how it actually behaves in a day. This is a blog post, not a spec — there's a spec, and I'll link it — but I want to argue for the shape of the idea before I hand you the technical artifact.

---

## The bug is not in the model

Let's start with what isn't broken.

AI models are, in 2026, very good. Claude can sketch a reasonable wireframe from a paragraph. GPT can write acceptance criteria that pass a first read. Models can cite Nielsen's heuristics accurately, give you a JTBD frame, summarize ten pages of user interviews into a workable synthesis. If you show a senior Claude session to a designer from 2019, they will think you are witnessing a miracle.

And yet the people using these tools every day — designers, PMs, developers, founders — keep describing the *same seven frustrations*. I've been writing them down as I hear them:

1. *"I don't know where I am."*
2. *"I don't trust any of this is saved."*
3. *"The AI doesn't guide me through a process."*
4. *"It has no UX instinct — it just proposes solutions."*
5. *"When I switch from Claude to Cursor to Figma, I start over."*
6. *"I can't see the project, just the pieces."*
7. *"There's no history of who decided what."*

None of these are about model quality. They are all about something the model can't give you on its own: a **method** — a shared way of describing work, sizing it, locating yourself inside it, and handing it between phases, tools, and people.

A designer running a method in her head, with no AI, doesn't have most of these problems. She knows where she is in her process. She knows what she's about to do next. She doesn't confuse "I'm still researching" with "I'm sketching." When she finishes a phase, she writes a brief and emails it to the developer. The artifact is the handoff. The process has shape because she's holding it.

When we put an AI alongside her, we did not give the AI the method. We gave it a chat. The AI will happily respond to whatever comes next. It will sketch when asked, research when asked, summarize when asked — with no opinion about whether *this* is the right move at *this* moment in the work. In the absence of a method, "produce something" wins every time. That's the bug. It's not in the model; it's in the absent layer between you and the model.

FLOW is my attempt at that layer.

---

## What FLOW is (in one paragraph)

FLOW is a method for running one unit of work — from a messy problem to a shipped artifact — so that you, your AI, and your teammates all describe the same work the same way, at the right intensity, with clean handoffs between phases.

It has four phases every piece of work passes through. It has four archetypes that decide how intense each phase is. It has a plain-text handoff block that carries state between phases, sessions, tools, and people. It has a short posture rule for how AI agents should behave inside it (spoiler: nudge, don't refuse). And it has a matrix — the operational core — that tells you exactly which named methods to run in each combination of archetype and phase.

That's the whole thing, and the rest of this post is what it actually feels like to use.

---

## Place the work before you produce it

The first move in FLOW happens before you open the chat: you decide what kind of work you're about to do. Not what it's *about* — what *shape* it has.

There are two questions, and **the order matters**.

**First: do we know this space?** Glance at a couple of competitors. Think about parallels your team has shipped. Check whether the users, the problem, the domain, and the solution space are all territory you've walked before. If all four are familiar, you're in *known* space. If any one of them is new, you're in *unknown* space. *Known* and *unknown* are per-team, not absolute — a billing interaction is known for a payments team and unknown for a greenfield startup. This is a five-minute assessment, not a research project. It produces a first read on **certainty**.

**Then: how big is this, really?** A tooltip copy fix is not the same animal as a platform redesign. The first fits in one session; the second doesn't fit in one quarter. You size by the expected surface area of the final artifact — how many screens, how many acceptance-criteria categories, how many decisions — not by estimated hours. This is **size**.

Certainty comes first because **size estimates are unreliable in a space you don't understand**. If you try to size before you know the territory, you will confidently underestimate every card that turns out to be in unfamiliar space. A "small copy fix" in an unknown user flow regularly reveals itself — three days in — to be a redesign. The honest move is to check what you know first, and only then guess at surface area. When certainty is low, the default size is *bigger*, on the assumption that what looks small is probably concealing unknowns.

The two together give the archetype:

|  | Known | Unknown |
|---|---|---|
| **Smaller** | **Nemo** — one session to same-day | **Salmon** — few days to a couple weeks, research-heavy |
| **Bigger** | **Tuna** — few days to a couple weeks | **Willy** — weeks to months, staged |

(The names come from [Tal Solomon's 2024 Fish Model](https://www.talsolomonux.com/p/0d2), the direct ancestor of this work. FLOW preserves the vocabulary because the vocabulary is good — a Nemo is a Nemo whether you're in a Notion doc or a Claude session.)

Your first read isn't final. Explore itself often revises the archetype — you start what you thought was a Nemo, interview two users, realize nobody on the team actually understands the flow, and the card becomes a Salmon. That's legitimate. The shift gets narrated in the handoff, not smuggled.

The single most common mistake in AI-assisted work is an **intensity mismatch**: people do two weeks of research on a Nemo (the tooltip never ships) or run a Willy on two days of interviews (the platform launches broken). Placing the work honestly at the start prevents both. It takes five or ten minutes. It's the difference between a work session that accumulates and one that dissipates.

---

## Four phases, never skipped

Regardless of archetype, every piece of work passes through four phases:

- **Explore** — open the aperture. Surface options, users, premises. Refuse to commit.
- **Solidify** — reduce unknowns to one shape. Lock decisions that unblock Build.
- **Build** — execute against the locked shape. Don't re-open settled questions.
- **Ship** — release, narrate, measure. Make the work legible to future-you.

Phases are **never skipped**. What changes by archetype is how intense each phase runs.

A Nemo's Explore is ten minutes: a competitor glance, one "how might we," a heuristic check. A Willy's Explore is two weeks or more: ten or more interviews, contextual inquiry, goal-directed design, a premortem, scenario planning, an outline for the shape doc. Both are Explore. The phase is the same; the ritual is different.

I'll admit the four-phase thing takes a minute to get used to if you're coming from the UK Design Council's Double Diamond. Double Diamond has two diamonds: problem space, solution space. FLOW splits each diamond into its own named phase (Explore + Solidify for the first; Build + Ship for the second) because **two diamonds turned out not to be enough vocabulary for an AI to work with.** When you tell an AI "we're in problem space," it can't tell whether you're asking for more research (Explore) or asking it to write the brief (Solidify). Those are genuinely different moves. The four-phase split gives you a word for each.

This matters because a word is a shared place to stand. "You're asking me for Solidify work while we're still in Explore — want a five-minute Explore close first?" is a sentence an AI can say now. That sentence, with that precision, is the thing you've been missing.

---

## The matrix: methods, not vibes

Most methodologies tell you to "do a heavy Explore for a big, unknown project." That's a vibe. It is an instruction without an instruction. *Heavy* means anything from three interviews to thirty depending on who's reading it.

FLOW replaces the vibe with a matrix. For every combination of archetype and phase — sixteen cells total — the method names which specific techniques you run. Not adjectives. Named, sourced, defined techniques.

A **Nemo Explore** is exactly: competitor scan, micro-brief, heuristic evaluation.

A **Salmon Explore** is exactly: five to eight user interviews, the TZUMI protocol (Go-Learn → One-User → Hand-in-Hand), a nugget board, task analysis, journey mapping anchored in interview quotes.

A **Willy Build** is exactly: break into Tuna-sized sub-cards, start with a thin vertical slice, integrate requirements (no "throw it over the wall"), joint product reviews per slice, staged rollout (internal → alpha → beta → general), measurement per slice.

The catalog of named techniques comes from design-thinking's public-domain lineage — a century of craft, openly published, traceable. Every cell borrows from someone. The partial list:

**For Explore** — Jakob Nielsen's heuristics, Clayton Christensen's Jobs-to-be-Done, Rob Fitzpatrick's *The Mom Test*, Teresa Torres's continuous discovery and opportunity solution tree, Karen Holtzblatt and Hugh Beyer's contextual inquiry, Alan Cooper's personas and Goal-Directed Design, Tomer Sharon's nugget board, S.I. Hayakawa's abstraction laddering, the premortem technique, Toyota's Five Whys, Michael Porter's Five Forces, and the whole tradition of affinity clustering descending from the KJ method.

**For Solidify** — the brief-not-PRD school running through Basecamp's Shape Up pitch (Ryan Singer), Ash Maurya's Lean Canvas, Alexander Osterwalder's Business Model Canvas and Value Proposition Canvas, Noriaki Kano's delight-threshold model, Edward de Bono's Six Thinking Hats, Jake Knapp's Design Sprint (at GV), SAFe's WSJF, and the Architecture Decision Record tradition from software engineering.

**For Build** — Dan Saffer's microinteractions (Triggers → Rules → Feedback → Loops / Modes), Cooper's iterative prototyping, the Wizard-of-Oz and paper-prototyping traditions from human-computer-interaction research, component-library-first discipline from the design-systems community, and thin-vertical-slice from continuous-deployment practice.

**For Ship** — Anders Ericsson and Herbert Simon's think-aloud protocol, the ISO 9241 effectiveness / efficiency / satisfaction triad, Hick's Law and Fitts's Law from interaction design, feature flags, canary releases, smoke tests, and A/B testing as the web-engineering world inherited them, plus the whole family of retrospective formats the agile community settled on — 4Ls, Sailboat, Rose / Thorn / Bud (AirBnB), Start / Stop / Continue, Mad / Sad / Glad.

Playbooks FLOW borrowed from without trying to replace: LUMA Institute, IDEO, Frog, *Continuous Discovery Habits* (Torres), *Shape Up* (Basecamp), *Measure What Matters* (Doerr), *The Mom Test* (Fitzpatrick). Nothing proprietary to FLOW. Nothing new under the sun.

What's new is that the matrix **makes skipping legible**. When you ask the AI to start sketching on a Salmon — a card that needs user interviews the team hasn't done yet — the AI can name the gap specifically. Not "let's think about users first" (the vague version you already ignore) but "the Salmon Explore cell calls for five to eight interviews before we pick a shape; we haven't done any yet. Want to draft the interview guide now, or re-size this to a Nemo if you're confident the pattern is known?"

This is what "the AI guiding me through a process" would actually sound like, if anyone built the layer. The matrix is that layer, made explicit.

---

## Handoffs in plain text

The second thing FLOW does — and this one is load-bearing for everything else — is make state portable.

Every phase exit emits a plain-text block called a `<FLOW-handoff>`. It looks like this:

```
<FLOW-handoff>
from: solidifier
to: builder
card_id: billing-history-redesign-2026-04
certainty: known
size: bigger
archetype: tuna
locked:
  - "Hybrid list-plus-drawer pattern, not a full-page redesign"
  - "Group invoices by billing period, newest first"
  - "Per-invoice download deferred to v2"
  - "New component: <PeriodGroup>, extends design system"
open:
  - "Empty state copy: product to pick between two drafts by Wednesday"
artifacts:
  - "briefs/billing-history-brief.md"
  - "figma/billing-history-v3"
  - "specs/period-group-microinteractions.md"
  - "ac/billing-history-ac.md"
confidence_to_advance: 0.9
notes: |
  Storyboard in the brief is the source of truth for flow.
  Empty state not blocking Build — stub and swap.
</FLOW-handoff>
```

You read this in thirty seconds and you know everything you need to pick up the work. What's locked (do not re-open). What's open (one thing, and it's not blocking). Where the artifacts are. How confident the person handing off actually is.

This is a boring artifact. It is also the single most useful piece of FLOW to most teams. Three things drop out of having it:

**Sessions stop being the unit of work.** When you close Claude, the handoff lands on disk. When you open Cursor tomorrow, the Builder agent there reads it and picks up where Solidifier left off. You do not re-brief yourself. You do not re-brief your tool.

**Teammates become readable.** When Sarah hands her Solidify work to Marcus, he doesn't need a Slack paragraph. He reads the block. `locked` is the contract. `open` is the one decision still outstanding. `artifacts` is the evidence.

**The project has a memory.** Three months later, when somebody asks *"why did we pick the drawer pattern?"*, the answer is in the handoff's `notes`, with the alternatives the Solidifier considered. You no longer rebuild history from `git blame`.

The format is plain text on purpose. It needs to round-trip through Claude, Cursor, ChatGPT, a Slack paste, a PR description, and a skim-read by a human who has not seen this card before. JSON collapses under that journey. Prose drifts. The block sits in the middle: structured enough to be machine-readable, human enough to survive a copy-paste.

---

## The one behavioral rule that makes this different

Here is the part where most AI-process stories go wrong, and where I want to plant a flag.

Almost every "put process into your AI" tool I've seen uses a **refusal model**. The AI is given rules; when the user violates the rules, the AI refuses. *"I can't sketch yet — we haven't finished Explore."* The user rolls their eyes, opens a new chat, and bypasses the method. The tool has made itself a security guard. Security guards lose.

FLOW uses a different posture. It's the single most important behavioral rule in the whole method:

**The agent nudges. It does not refuse.**

A great design-thinking mentor does not say *"I refuse to sketch yet."* A great mentor says something like *"Sure — before we do, can I show you what three competitors just did, and ask you two things about users? Five minutes, then we sketch with a much better foundation."*

That is the posture of every FLOW agent. When you ask for Build work on a card still in Explore, the agent surfaces the gap, offers the right-sized version of the missing work, and lets you decide. You can skip it. You'll skip it *knowing what you're skipping*, which is the entire point. What you will not do is drift out of Explore because the AI was too helpful to tell you that you were drifting.

And when the nudge isn't what you want, there are two clean escape hatches:

1. **Re-size the work.** Maybe the card's real scope or familiarity is different than you thought. Change the archetype. The matrix cell changes. The nudged methods adapt to the real shape of the work.
2. **Switch agent.** Hand to the phase that owns what you're actually asking for. The skip is logged in the notes.

Both are overt. Both leave a trace. What's off the table is *"nudged, and ignored without trace"* — the silent drift that ate your team's afternoon.

The nudge is firm because the method is real, not because the agent has authority. That's the difference between design-thinking posture and process-enforcement posture. It's a small sentence. It took me six months of iteration to get right.

---

## A day in the method

Here's what this actually feels like, told through one real piece of work.

Analytics flagged a 40% drop at step 3 of signup. The onboarding flow was built eighteen months ago. No recent interviews. The designer opens Claude.

**Size the work.** Smaller (one step, not a full flow) × unknown (nobody has talked to users about this in ages) → Salmon. Budget: about a week and a half.

**Explore, five days.** Seven user interviews over three days, recorded with consent. TZUMI: Go-Learn for breadth, One-User to pressure-test the emerging insight, Hand-in-Hand to shadow someone going through it. The designer keeps a nugget board — atomic findings, each tagged — rather than a long report. After three days, three candidate framings fall out of the data. One has interview support the other two don't: *"Users abandon step 3 because the password-strength meter surfaces after they type, making them feel retroactively judged."* Handoff emitted with `confidence_to_advance: 0.8`.

**Solidify, three days.** The designer picks the instructional-copy pattern (strongest interview support). One-page brief, journey-structured. A five-user concept test on a low-fi prototype: four of five completed, one surfaced a minor copy ambiguity. Iterated the copy once. **The measurement plan is written here, not at Ship** — step-3 completion rate, target +20 points in 30 days. Acceptance criteria, six bullets, each independently checkable.

**Build, two days.** The developer reads the handoff. The copy change is small; the meter-surfacing logic is moderate. The `signup_step3_completed` event is added because the Solidify measurement plan required it. Four usability tests with real users — four out of four complete without friction.

**Ship, over two weeks.** Release with instrumentation live. Baseline captured pre-release. Two weeks after traffic: step-3 completion moved from 60% to 78%. Plus eighteen points, just under the +20 target but decisively positive. The designer writes one sentence into the learning log: *"Meter placement mattered more than wording."* A follow-up question — step-3 education versus step-1 education — gets queued as the next Explore.

Total time, about two weeks. Total research volume, seven interviews and one concept test. Total PRD pages, zero. Total Slack threads trying to figure out what was decided, zero. The feature shipped with a falsifiable hypothesis and a post-ship readout that actually moved.

Now consider the counter-case: the same card, same team, no method. Somebody on the team sees the 40% drop, jumps to Claude, and spends a long session brainstorming copy variants. The best-feeling variant ships in three days. It moves the number by four points, or three, or nothing. Nobody's sure, because nobody wrote the measurement plan, and the instrumentation for step-3 completion isn't clean. The team moves on. Eighteen months from now, a new designer opens the flow and wonders why step 3 abandons.

The difference between those two outcomes isn't talent. The designer in both scenarios is the same person. The difference is **method**.

---

## What changes Monday morning

If you decided to use FLOW tomorrow, here's what would be different:

- **Before you open your AI tool**, you'd name the work: certainty first (what do we know?), then size (how big is it?) → Nemo, Tuna, Salmon, or Willy. Five minutes. You'd write it into a card somewhere — a Notion doc, a markdown file, a ticket, whatever.
- **Your AI session would know what phase you're in.** Either because you installed one of the phase-shaped agents (`//explore`, `//solidify`, `//build`, `//ship`), or just because you told it — the vocabulary itself is most of the lift.
- **You'd get nudged when you drift.** Ask to sketch before Explore has closed, and the response wouldn't be a wireframe — it'd be a one-line "before we sketch, the cell says we need [X]; take five minutes or re-size to Nemo?"
- **Every phase exit would produce a handoff block.** Plain text. Gets saved next to the work. Next tool reads it cold.
- **Research-led work would include a measurement plan before Build.** Not after. Specs arrive testable.
- **Every release would end with a trust receipt** — one short signed summary of what shipped, what was redacted, who approved.

No new tool. No vendor. No migration. A vocabulary your AI can speak and a handoff format your team can read.

That's what "Agile for the AI era" looks like if you take the AI part seriously and the methodology part seriously at the same time.

---

## The lineage I'm standing on

I want to be honest about what's original here and what isn't.

Nothing about divergence and convergence is new — Béla H. Bánáthy was writing about this in the 1960s. Nothing about splitting problem space from solution space is new — the UK Design Council's Double Diamond is from 2004. Nothing about sizing design work to its shape is new — that was my own Fish Model piece from 2024, which is the direct predecessor of this one. Nothing about the catalog of research techniques is new — it's a century of craft, openly published.

What's new in FLOW is **making all of that operable by an AI and portable between tools**. Four phases instead of two diamonds, because LLMs need more vocabulary than "problem space." A first-class handoff block, because state has to survive sessions. The nudge posture, because refusing doesn't work. A matrix that names methods per cell, because "heavy Explore" is a vibe and "five-to-eight semi-structured interviews plus TZUMI plus nugget board" is an instruction.

It is not a reinvention. It's the lineage made legible to the AI sitting at your right hand.

---

## Where to go from here

I have a canonical spec. It's at [`methodology/flow.md`](../../methodology/flow.md) in the Duble Slash repo. It's fifteen sections, about a hundred pages if you print it, and it's where the matrix, the streams, the catalog, and the handoff contract live in their full form. If you want the details, read it.

If you want the designer's angle on why this matters specifically for the people who feel the seven pains hardest, [the next post in this series](02-for-designers.md) is for you.

If you work on the engineering side and you want to know how the handoff behaves at the spec-to-code boundary, [the one after](03-for-tech-teams.md) goes there.

And if you run a team and you want the strategic read — what FLOW replaces in your process, and what that costs you to adopt — [the last one](04-what-flow-replaces.md) is that.

Four posts. One method. The pitch is small: give the AI a shared vocabulary with you, and stop losing your afternoons. That's it.

See you in the handoff block.
