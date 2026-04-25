---
name: FISH Methodology — overview
description: The canonical FISH spec. Defines axes, archetypes (Nemo/Tuna/Salmon/Willie), phases (head/left body/right body/tail), and the archetype × phase intensity matrix. Binding reference for all Duble Slash agents.
type: methodology-spec
---

# FISH — the method

**Owner:** Tal · **Version:** 1.0.0 · **Last revised:** 2026-04-21 · **Source lineage:** <https://www.talsolomonux.com/p/0d2>

FISH is a way of running one unit of design/product/engineering work so that:

1. Everyone involved — human or AI — **shares the same vocabulary** for what phase the work is in and how big/unknown it is.
2. The **intensity of ritual** (research, shaping, validation, release) **matches the work** instead of applying a uniform process to everything.
3. **Handoffs are explicit**: every transition emits a small, machine-readable receipt so the next collaborator — a teammate, an agent, or you-tomorrow — can pick up cold.

FISH replaces "everything is a two-week sprint of unknown shape" with: *decide what kind of fish you're catching, then run the lifecycle at the intensity that fish demands.*

---

## 1. Two axes → four archetypes

Every unit of work — a **card** — sits on a 2×2:

```
                           KNOWN
                             ▲
                             │
                Tuna         │         Nemo
          (big × known)      │    (small × known)
                             │
  ───── BIGGER ──────────────┼───────────────── SMALLER ──▶  scope
                             │
               Willie        │        Salmon
          (big × unknown)    │   (small × unknown)
                             │
                             ▼
                         UNKNOWN
                      (familiarity)
```

### Scope — *bigger ↔ smaller*

Measured by **expected surface area of the final artifact**, not effort.
- **Smaller** — fits in one session; ≤ 1–3 screens; one acceptance-criterion category.
- **Bigger** — multi-session; multi-screen or system-level; multiple criteria categories.

When uncertain, **default to bigger**. Over-sizing is cheap; under-sizing causes skipped research.

### Familiarity — *known ↔ unknown*

Measured by **the team's prior familiarity with the user and the solution space**, not the technical complexity.
- **Known** — we have shipped similar work; conventions, users, and patterns exist.
- **Unknown** — at least one of {user, problem, domain, solution space} is new to this team.

Familiarity is *per team*. A billing flow is Known for a payments team, Unknown for a greenfield startup.

### The sigil

The pair `(size, certainty)` is the card's **sigil**. Every card carries one. It drives (a) the archetype and (b) how each phase agent modulates its behavior.

```
sigil:
  size: bigger | smaller
  certainty: known | unknown
```

A sigil can change mid-lifecycle — that's a legitimate Explore outcome ("this is bigger than we thought"). When it changes, the current phase re-evaluates against the new cell before continuing.

---

## 2. The four archetypes

Named directly from the [2024 article](https://www.talsolomonux.com/p/0d2). Each archetype is a **recipe for lifecycle intensity** — how much time and ritual each phase gets. It is not a separate workflow.

| Archetype | Sigil | One line | Typical duration |
|---|---|---|---|
| **Nemo** | smaller × known | Quick, conventional, heuristic-driven. | One session → one short sprint |
| **Tuna** | bigger × known | Bigger scope, established patterns. | Multi-sprint, single team |
| **Salmon** | smaller × unknown | Few screens, unfamiliar user/domain. | Explore-heavy; small build |
| **Willie** | bigger × unknown | Strategic, foundational, long-running. | Month+; full team |

Selection is mechanical from the sigil — no debate. If the card owner can't pick a sigil, the Explorer agent assists in the first 5 minutes of Explore; the card always leaves Explore with one.

For detailed archetype definitions (methods, duration bands, failure modes, concrete examples) see [`use-cases.md`](./use-cases.md).

---

## 3. The four phases (fish anatomy)

Every card — regardless of archetype — passes through four phases named after fish anatomy. Archetype determines **intensity per phase**; it does not let phases be skipped.

```
                    ┌────────────────── left body ──┬── right body ───────────────┐
                    │                               │                             │
                  ╭─┴─╮ ╭──────────── ◇ ────────────┴─── ◇ ────────────╮   ╭──────╮
      head  ───▶  │ 1 │ │        Solidify (2)              Build (3)   │   │  4   │  ──▶ tail
                  ╰─┬─╯ ╰─────────── shape ───────────── execute ──────╯   ╰──┬───╯
                    │                                                          │
                 Explore                                                     Ship
```

| # | Anatomy | Phase | Goal |
|---|---|---|---|
| 1 | Head | **Explore** | Open the aperture. Surface options, questions, and premises. Refuse to commit. |
| 2 | Left body | **Solidify** | Reduce unknowns to one shape. Lock decisions that unblock build. |
| 3 | Right body | **Build** | Execute against the locked shape. Don't re-open settled questions. |
| 4 | Tail | **Ship** | Narrate, release, measure. Make past-work legible to future-you. |

### Why left body / right body?

The two body halves are literally the **two diamonds** of the Double Diamond:
- **Left body = problem-space diamond** → Solidify (diverge on framings, converge on *one* brief).
- **Right body = solution-space diamond** → Build (diverge on solutions, converge on *the* implementation).

The head is the pre-diamond divergence that makes the first diamond possible (pure research, no framing yet). The tail is the post-diamond release + learning loop.

### Why four, not two (classical Double Diamond)

Classical Double Diamond says *problem space* and *solution space*. FISH splits each into its own phase with **its own agent, artifact, and handoff contract** so that:

- Humans and AI agents can locate themselves in the lifecycle without jargon.
- Transitions are explicit events, not blurred regions.
- Each phase has a single shaped deliverable (options list, brief, built artifact, trust receipt) rather than "something somewhere in this diamond."

Detailed phase definitions — goal, posture, steps, methods, entry/exit criteria, artifacts, anti-patterns — live in [`phases-and-methods.md`](./phases-and-methods.md).

---

## 4. The archetype × phase matrix

This is the operational core. Given a card's archetype, each phase agent knows what "good" looks like:

| Phase | **Nemo** (small × known) | **Tuna** (big × known) | **Salmon** (small × unknown) | **Willie** (big × unknown) |
|---|---|---|---|---|
| Explore (head) | 10-min heuristic scan | Convention + journey scan | **Heavy** — interviews, task analysis, synthesis | **Heaviest** — interviews, market scan, premortem, RFC prep |
| Solidify (left body) | One sketch + HMW | Journey map + storyboard + DS extension | One validated concept, iterated from Explore | Pitch/RFC, multiple concept validations, decision log |
| Build (right body) | One session | Multi-sprint, single team | Small + crisp, instrumented | Month+, full team, staged |
| Ship (tail) | Quick release + 1-line note | Standard release + changelog + doc | Measured release + iteration loop | Staged rollout + measurement plan |

**Reading rules:**
1. An agent in phase P facing archetype A runs cell (P, A). Lighter = skimping; heavier = gold-plating.
2. Phases are never skipped. A Nemo's "10-min heuristic scan" *is* Explore — not "skip Explore."
3. If the sigil changes mid-card, re-evaluate the current phase against the new cell.

For the full method catalog mapped into this matrix, see [`phases-and-methods.md`](./phases-and-methods.md).

---

## 5. Handoffs, transitions, and gates

Every phase transition emits a `<FISH-handoff>` block — a small, tool-agnostic text receipt that the next agent (or the user tomorrow, or a teammate in V1) reads to pick up cold. Gate conditions, reverse transitions, skip handling, and the full handoff shape live in [`transitions-and-handoffs.md`](./transitions-and-handoffs.md).

The headline gates:

| Transition | Gate |
|---|---|
| Explore → Solidify | Problem framing stable; sigil confirmed; ≥1 unknown resolved or explicitly deferred |
| Solidify → Build | One shape doc exists; acceptance criteria written; no build-blocking opens |
| Build → Ship | Artifact runnable/reviewable; golden path verified; `locked` edge cases covered |
| Ship → Explore (next loop) | Release evidence (URL/tag/receipt); ≥1 learning captured |

---

## 6. Core principle — communication is the method

From the 2024 article: *"Communication is the key to success."* FISH operationalizes this as three rules every phase obeys:

1. **Brief, not PRD.** Artifacts are short, problem-focused. A Solidify artifact that needs a table of contents is a bad Solidify artifact.
2. **Shared language over role handoffs.** Designers, PMs, engineers, and agents all describe work with the same sigil + phase + archetype vocabulary. No translator role, no PRD-translator PM.
3. **Journey meetings over feature meetings.** Decisions happen around a user journey or a single problem, not a deliverable list.

These are methodology rules, not personality traits. Agents enforce them by refusing to emit over-long artifacts and flagging when conversation drifts from "problem/journey" to "feature list."

---

## 7. What FISH does for humans working with AI

Short answer: **FISH is the coach that keeps AI-assisted work from turning into vibes.** AI tools eagerly help; they rarely ask what phase you're in. FISH gives you — and the AI — a way to name the phase, stay in it, and hand off cleanly.

The long answer is in [`human-ai-collaboration.md`](./human-ai-collaboration.md). If you read only one file in this folder, read that one.

---

## 8. Lineage (what we built on)

FISH stands on three legs:

- **Béla H. Bánáthy's divergence–convergence** model (systems thinking; 1960s–70s) — the "diamond shape" inside every phase.
- **UK Design Council's Double Diamond** (2004, revised 2019) — the two-diamond split between problem and solution space; the direct parent of the left-body/right-body split.
- **The Fish Model** (Tal, 2024; Redis era) — the species as archetypes; the scope × familiarity axes; "brief not PRD"; journey meetings.

FISH (this spec) is the **agent-operable** evolution: same lineage, newly legible to LLMs and to a multiplayer graph. Specifically, FISH adds:

- Fish anatomy as an explicit pipeline (head → left → right → tail).
- Sigil as a first-class, machine-readable card field.
- Archetype × phase intensity matrix (fills the implicit-practice gap in v1).
- `<FISH-handoff>` as the universal transition receipt.
- Agent-readable prompt contracts (see [`../local-agents/`](../local-agents/)).

---

## 9. What FISH is *not*

- **Not a project-management tool.** It runs a *unit* of work; the portfolio view sits above.
- **Not design-only.** Phases and handoffs apply to code, docs, research, decisions.
- **Not opinionated about team structure.** Solo, pair, squad — all compatible.
- **Not tool-prescriptive.** Figma, VS Code, a notebook, a napkin — FISH cares about phase, sigil, and handoff, not filetype.
- **Not a replacement for Agile sprints or Shape Up cycles.** It describes one card's lifecycle; you can run many cards in parallel on whatever cadence you like.

---

## 10. Cross-references

- Deep dive on phases, methods, and the full method catalog → [`phases-and-methods.md`](./phases-and-methods.md)
- The moat (value for AI-using designers) → [`human-ai-collaboration.md`](./human-ai-collaboration.md)
- **HAI primitives — agent-operable contracts** → [`contracts.md`](./contracts.md)
- Four worked scenarios → [`use-cases.md`](./use-cases.md)
- Handoff contract + transition gates → [`transitions-and-handoffs.md`](./transitions-and-handoffs.md)
- Agents that enact FISH inside the user's AI tool → [`../local-agents/`](../local-agents/)
- Background workers that make FISH reliable across sessions and teams → [`../system-agents/`](../system-agents/)
- Task tracking → `planning/task-board.md` *(project-internal reference; not bundled)*
