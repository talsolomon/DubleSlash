---
name: FISH × Human-AI collaboration — the moat
description: How FISH turns AI tools from eager-but-directionless assistants into phase-shaped collaborators. The specific value Duble Slash gives designers who have already started working with AI.
type: methodology-spec
---

# FISH × human-AI collaboration — *the moat*

**If you read one file in this folder, read this one.**

Duble Slash's strategic bet is that *methodology is distribution*: the reason a designer installs Duble Slash is not "it captures my sessions" — it's **"it makes the AI I already use finally work the way I was trained to work."**

This doc is the case for that bet. It names:
1. Why AI tools, used well, still fail designers.
2. What FISH specifically adds.
3. What Duble Slash specifically layers on top of FISH.
4. The design principles every FISH agent obeys to protect the human.

---

## 1. The four failure modes of AI-assisted design work

These aren't edge cases. Every designer using Claude / Cursor / ChatGPT / Figma AI has hit all four this quarter.

### 1.1 Phase drift — "the AI is always ideating"

You ask Claude *"what should I consider before designing this onboarding?"* Five prompts later you have six wireframe variants and no research plan. The AI, being helpful, jumped to Solidify (shape) and Build (sketch) without your permission, because it has no concept of *what phase it's in* and no incentive to stay in one.

**What FISH does:** the Explorer agent refuses Solidify-shaped requests. It will *name the phase the request belongs to* and offer to hand off — rather than silently drift.

### 1.2 Intensity mismatch — "the AI over-produces"

A Nemo — a one-hour tooltip copy change — becomes a six-page research doc with personas and journey maps because you asked Claude for "a full UX analysis." The AI's default is "comprehensive." A designer's default should be "appropriate to the fish."

**What FISH does:** the archetype × phase matrix tells the agent what *right-sized* looks like for this card. A Nemo's Explore is a 10-minute heuristic scan, not a thesis. The Explorer refuses to generate a thesis for a tooltip.

### 1.3 Context amnesia — "I can't pick up yesterday's work"

You explored a feature with Claude yesterday. Today you open a new chat and have to re-explain everything — the user, the constraints, the options you already ruled out. The AI's context window doesn't span sessions; your memory does, but it's lossy. So you either re-paste 40 messages of history or you start over (you usually start over).

**What FISH does:** every phase exit emits a `<FISH-handoff>` block — short, copy-pasteable, machine-readable. It captures the sigil, what's `locked`, what's `open`, which artifacts exist, and the outgoing agent's honest confidence in advancing. Paste it into tomorrow's session and the Solidifier picks up exactly where Explorer left off. No re-briefing.

### 1.4 Trust opacity — "I don't know what the AI did"

You asked Claude for "a quick polish pass on this copy." It rewrote three microcopy strings, proposed a new information architecture for the page, and added a feature flag. You caught two of those. Did you catch all three? You're not sure. You definitely can't show a teammate what the AI did in a way they could review.

**What FISH does:** the Shipper emits a **trust receipt** on every release — a short, signed summary of *what shipped, what was redacted, who approved it*. Even for solo work. Trust receipts are auditable, pasteable, and eventually signable by both the human and (in V1) a teammate.

---

## 2. What FISH adds — six concrete shifts

| Without FISH | With FISH |
|---|---|
| "The AI drifted from research into wireframes." | Explorer refuses to wireframe; offers handoff to Solidifier with a filled-in sigil. |
| "I over-produced because the AI over-produced." | Archetype tells the agent the right intensity *before* work starts. |
| "I can't resume yesterday's thread." | `<FISH-handoff>` is the thread. Paste it; resume. |
| "I don't have a shared vocabulary with the PM/engineer." | Sigil + phase + archetype become the shared language — same words, same meaning. |
| "I can't tell what the AI decided for me." | Every transition logs `locked` decisions and `open` questions. |
| "I don't know if I should trust this output." | Trust receipts make AI work reviewable. The human never loses the override. |

None of these require a new tool. They require a **method the AI can read and enforce**. FISH is that method.

---

## 3. Where Duble Slash specifically wins

FISH is an open methodology — anyone can adopt it. **Duble Slash's competitive moat** is that we make FISH operable *across tools, across sessions, and across teammates* without making you switch tools.

| Duble Slash feature | What it unlocks |
|---|---|
| **`//` invocation in any AI tool** (OSS launch) | One gesture gets you into the right-phase agent without leaving Claude / Cursor / ChatGPT. No tool-switching tax. |
| **Capture agent** (OSS launch) | Every FISH session is recorded with its sigil, phase, and handoffs — so your "yesterday" is never lost, even if you closed the tab. |
| **Redaction agent** (OSS launch) | Handoffs and trust receipts strip secrets and PII before they ever leave your laptop. FISH's auditability doesn't require sacrificing privacy. |
| **Context Cloud** (V1) | Cross-session, cross-tool memory. A Solidifier in Cursor reads the Explorer's handoff from Claude yesterday. Your sigil follows you, not the tool. |
| **Handoff agent** (V1) | A teammate's Solidifier picks up *your* Explorer handoff. The Sarah→Marcus demo is literally FISH's handoff contract, multiplayer. |
| **Digest agent** (V1.5) | "Today, across the team: 3 Salmons in Explore, 2 Tunas in Build, 1 Willie entering Solidify." Replaces standups because the sigils *are* the status. |
| **Flow-checker + Process agents** (V2) | Per-team `flow.yaml` declares "our Salmons always have interview notes before Solidify." The Process agent enforces it. |

**The compounding move:** FISH alone is useful to a solo designer. FISH + Context Cloud is useful across their tools. FISH + Context Cloud + multiplayer handoff is useful to their team. FISH + all of the above + `flow.yaml` is the foundation other tools (Linear, GitHub, Figma) integrate *with*. Each layer is voluntary; each adds moat.

---

## 4. Specific value for designers who already use AI

The target user *is already good at AI*. They know how to prompt. They've built their own workflows. The pitch is not "AI for designers." The pitch is **"your AI, with a method that holds up under pressure."**

Concrete wins, organized by persona:

### Designer (IC)
- **Before:** 7 Claude chats a day, all titled "Untitled." Monday's research lost by Thursday.
- **With Duble Slash + FISH:** one card per problem, sigil stamped, four handoffs, full thread recoverable — still inside Claude. No new tool to learn, no Notion-filling ritual.

### Design lead
- **Before:** You don't know what your team is doing inside their AI tools. "How's the onboarding redesign?" → vague answers.
- **With Duble Slash + FISH:** your team's cards carry sigils and phases. The Digest agent (V1.5) shows "3 Willies in Solidify, 2 Nemos ready to Ship." You see the *shape* of the team's work without reading every chat.

### Designer ↔ developer
- **Before:** Handoff = a Figma link + Slack paragraph. The developer re-interprets intent; the designer re-explains. Intent loss is where most implementation bugs actually originate.
- **With Duble Slash + FISH:** the Solidifier's `locked` list *is* the acceptance criteria. The Builder consumes it directly. Re-interpretation shrinks to translation.

### New joiner
- **Before:** two weeks of Slack scroll + "ask the old-timer."
- **With Duble Slash + FISH:** Context Bundler (V1) hands them a pack of recent Tuna and Willie handoffs, archetype-tagged. They see the shape of the product's in-flight work, not a wall of messages.

---

## 5. Design principles every FISH agent obeys

Agents are visible workers in a glass kitchen, not black boxes. These rules are load-bearing:

1. **Transparent.** The agent's phase, sigil-read, and reasoning are visible in the chat. No hidden state.
2. **Narratable.** When the agent changes phase, it says so ("I think we've drifted into Solidify — want me to hand off?"). Silent drift is the bug.
3. **Overridable.** The human can veto any handoff, re-run the phase, skip a gate with explicit consent. The `confidence_to_advance` number in the handoff is the agent's opinion, not a command.
4. **Phase-bounded.** An agent in phase P refuses work clearly belonging to phase Q and names Q. It does not silently do Q's work dressed as P's.
5. **Intensity-matched.** Every response is sized to the card's archetype. No thesis for a Nemo, no napkin sketch for a Willie.
6. **Handoff-emitting.** Phase exits always produce `<FISH-handoff>`. No exceptions — not even for solo single-user sessions.
7. **Redaction-aware.** Any artifact or handoff that leaves the device passes through the Redaction agent first. The agent assumes nothing; it checks.
8. **Unionized.** Agents defer to each other. The Builder won't debate a Solidify decision except by *requesting a hand-back* — not by silently re-designing.

---

## 6. Before / after — one worked example

**Card:** *"Redesign onboarding for our self-serve signup."*

### Without FISH

```
Day 1 Claude chat ("Onboarding help")
  → research tangent for 20 min
  → three wireframe variants the AI invented
  → you ask for a "PRD-style spec"
  → AI writes 4 pages — 60% of which you don't need
  → chat ends unsummarized

Day 3 Claude chat ("Onboarding part 2")
  → re-paste 30 messages from day 1
  → AI forgets the options you ruled out
  → restart a variant from scratch

Day 5 Slack to developer
  → "here's the Figma, talk tomorrow"
  → developer asks 4 clarifying questions that were answered in day 1's chat
```

### With FISH (solo, OSS-launch capabilities)

```
Day 1  //explore onboarding redesign — self-serve signup
  → Explorer reads sigil suggestions, confirms with you:
    bigger × unknown → Willie. Okay.
  → Runs the Willie-intensity Explore: user-interview plan,
    competitor scan, premortem. Produces notes/ and a list of 8
    unknowns. Refuses to wireframe.
  → Emits <FISH-handoff from: explorer to: solidifier>.
  → You save the handoff block. (Capture agent also saved it.)

Day 3  //solidify <paste handoff>
  → Solidifier picks up with full sigil + locked framing + open list.
  → Runs the Willie-intensity Solidify: one pitch doc, two concept
    validations, acceptance criteria. Reduces open list from 8 to 2.
  → Emits <FISH-handoff from: solidifier to: builder>.

Day 5  //build <paste handoff>
  → Builder has the spec, the criteria, and the sigil. No re-debate.
  → Produces the component + tests + run instructions.
  → Hands to Shipper.

Day 6  //ship <paste handoff>
  → Shipper drafts release notes, changelog, trust receipt.
  → You paste the trust receipt into Slack for review.
  → Developer reads the `locked` list and has zero clarifying
    questions. (The clarifications are the acceptance criteria.)
```

Same designer, same AI tools, same problem. The difference is *six text blocks and a refusal posture*. That's the moat.

---

## 7. What FISH is *not* doing for you

To be honest about the boundary:

- **FISH doesn't replace design skill.** A bad Solidify brief from a skilled designer is still better than a well-formatted Solidify brief from someone who doesn't know the user.
- **FISH doesn't guarantee a good outcome.** It guarantees a *legible process*. Some cards ship bad things cleanly.
- **FISH doesn't work if you skip the handoff.** The whole chain depends on it. An undocumented phase transition is a hole in the method.
- **FISH alone is not the moat.** FISH + `//` + Context Cloud + multiplayer handoff is the moat. A designer can get most of FISH's value from a well-written CLAUDE.md; we just make the rest effortless.

Being clear about this is part of the integrity GTM pillar. We're not selling miracles; we're selling a method the AI can finally follow.

---

## 8. Agent state model — what every FISH agent tracks

Sections 1–7 made the case. Sections 8–10 make the case **operable**: if FISH is a contract the AI can finally read, this is where the contract gets signed.

Every FISH agent — local or system, operator (Dora/Sol/Bran/May) or expert (Design/PM/Dev/…) — maintains the same minimum state. Interoperability depends on this: Sol can pick up what Dora wrote because they speak the same state; a teammate's agent tomorrow can pick up yours because the state is in the handoff, not in the agent's head.

| State | Type | Updated when | Consumed by |
|---|---|---|---|
| `current_phase` | `explore` \| `solidify` \| `build` \| `ship` | On activation; on handoff | `PHASE-CHECK`, `HANDOFF-EMIT` |
| `current_sigil` | `{size, certainty}` | On activation; on sigil change | `INTENSITY-CAP`, `NARRATE-STATE` |
| `current_archetype` | `nemo` \| `tuna` \| `salmon` \| `willie` | Derived from sigil | `INTENSITY-CAP` |
| `locked_decisions` | list\<string\> | Per phase, append-only | `HANDOFF-EMIT` |
| `open_questions` | list\<string\> | Per phase; can be resolved | `HANDOFF-EMIT` |
| `artifacts_produced` | list\<path \| url\> | When artifact created | `HANDOFF-EMIT` |
| `confidence_to_advance` | float 0.0–1.0 | Self-reported at exit | `HANDOFF-EMIT`, `OVERRIDE-LOG` |
| `capability_loadout` | list\<capability-code\> | On activation (from spec) | all primitives |
| `loaned_experts` | list\<@handle\> | When expert borrowed / returned | `NARRATE-STATE` |
| `override_log` | list\<override-event\> | When human forces a gate | `TRUST-RECEIPT` |

**Invariant:** *no hidden state.* Everything above is either in the active `<FISH-handoff>` block, the session capture, or the agent's chat narration. If an agent knows something the human can't see, it's a bug.

---

## 9. HAI primitives — the operable contracts

A **primitive** is a named contract every agent implements identically. Primitives are *what agents do* — not style, not taste, not judgement. The point of naming them:

1. Agent specs say *"on activation, run `PHASE-CHECK`"* and that is a complete instruction.
2. When a user says *"Dora refused to wireframe"*, the exact primitive is `PHASE-CHECK` — debuggable, logged, overridable.
3. The BMAD-shaped skills (Phase 3 of the Duble Slash rebuild) implement these primitives literally in their `steps/` files; there is no interpretation gap between methodology and agent.

Every primitive has a full spec in [`contracts.md`](./contracts.md) with: signature, trigger, action, refusal, override, verbiage, anti-pattern, worked example.

### The eight primitives (at a glance)

| # | Primitive | What it enforces | Fixes |
|---|---|---|---|
| 1 | `PHASE-CHECK` | Agent refuses out-of-phase requests; offers handoff | §1.1 Phase drift |
| 2 | `INTENSITY-CAP` | Output sized to archetype × phase cell from the matrix | §1.2 Intensity mismatch |
| 3 | `HANDOFF-EMIT` | Phase exits always produce `<FISH-handoff>`; never silent | §1.3 Context amnesia |
| 4 | `TRUST-RECEIPT` | Shipper emits a signed release summary every time | §1.4 Trust opacity |
| 5 | `NARRATE-STATE` | Agent publishes phase, sigil-read, reasoning visibly in chat | §1.4 Trust opacity |
| 6 | `REQUEST-HANDBACK` | Downstream agent reverses explicitly with reason — never silently redesigns | [Transitions §4](./transitions-and-handoffs.md#4-reverse-transitions) |
| 7 | `OVERRIDE-LOG` | Human override of `confidence_to_advance` recorded in `notes` | Trust audit |
| 8 | `REDACTION-GATE` | Any artifact leaving the device passes through the Redaction agent first | Leak prevention |

### The standard request pipeline

Every user message inside an active agent session flows through the same pipeline. This is the same for Dora, Sol, Bran, May, and every expert agent — what differs is only what work they produce inside step 4.

```
user message
  1. NARRATE-STATE      ← agent echoes current phase + sigil before work
  2. PHASE-CHECK        ← does this request belong in current_phase?
        └─ no  → refuse + offer handoff  (pipeline stops)
  3. INTENSITY-CAP      ← size the response to archetype × phase cell
  4. PRODUCE OUTPUT     ← the agent's actual work (the only variable step)
  5. UPDATE STATE       ← append locked / open / artifacts
  6. if phase exit      → HANDOFF-EMIT  → next agent begins at step 1
  7. if release         → REDACTION-GATE → TRUST-RECEIPT
```

`REQUEST-HANDBACK` and `OVERRIDE-LOG` are out-of-band: they can fire at any step when the agent detects an upstream mistake (handback) or the human overrides a refusal (override log).

### Why primitives, not "rules" or "behaviors"

A *rule* can be interpreted. A *primitive* can be called. When we write `//build` and Bran activates, Bran's `workflow.md` literally invokes `PHASE-CHECK`, `INTENSITY-CAP`, `HANDOFF-EMIT` as named operations backed by [`contracts.md`](./contracts.md). The agent persona is *composed of primitive calls plus one produce-output step*. That is the moat in mechanical form.

---

## 10. Failure mode × primitive matrix

Every failure mode in §1 now has at least one primitive that mechanically prevents it. The matrix below is the traceability check: if a failure mode appears without a named primitive, we name a new primitive — we do not issue an ad-hoc rule.

| Failure mode | Primitives | How the combination prevents it |
|---|---|---|
| §1.1 Phase drift | `PHASE-CHECK` + `NARRATE-STATE` | Check catches the cross-phase request; narrate surfaces the catch ("I'm in Explore; that's a Solidify request — hand off?") |
| §1.2 Intensity mismatch | `INTENSITY-CAP` | Archetype × phase cell bounds effort. A Nemo Explore cannot produce a Willie-sized thesis. |
| §1.3 Context amnesia | `HANDOFF-EMIT` | Every phase exit writes the resume block; no session ever ends without one. |
| §1.4 Trust opacity | `TRUST-RECEIPT` + `NARRATE-STATE` + `REDACTION-GATE` | Receipt at ship, narration during work, redaction at every outbound boundary. The human can always audit. |
| Silent redesign (Transitions §4) | `REQUEST-HANDBACK` | Reverse transitions are typed moves, not quiet edits. |
| Unlogged human overrides | `OVERRIDE-LOG` | `confidence_to_advance` overrides go to handoff `notes` with timestamp and reason. |

**Rule:** adding a new primitive is cheap. Relaxing one is expensive. When in doubt, add a primitive rather than weakening an existing one.

---

## 11. Cross-references

- Main FISH spec → [`README.md`](./README.md)
- Phase-level steps & methods → [`phases-and-methods.md`](./phases-and-methods.md)
- Handoff contract → [`transitions-and-handoffs.md`](./transitions-and-handoffs.md)
- **Primitive specs (full)** → [`contracts.md`](./contracts.md)
- Worked use cases → [`use-cases.md`](./use-cases.md)
- The local agents that enforce all of the above → `../agents/` *(stale reference; pre-rebuild path)*
