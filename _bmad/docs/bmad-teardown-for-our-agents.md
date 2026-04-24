---
name: BMAD teardown — lessons for our agent system
description: Top-to-bottom analysis of the BMAD planning methodology (8 personas + 28 commands) against our Nova/Sol/Bram/Sage + 9 system-agent design. What to steal, what to avoid, punch list.
date: 2026-04-22
type: internal-analysis
---

# BMAD teardown — lessons for our agent system

Source files studied:
- BMAD personas: [`~/.claude/commands/bmad-agent-*.md`](~/.claude/commands/) (8 files)
- BMAD workflow commands: 20 additional `.md` files in same directory
- BMAD config: [`_bmad/bmm/config.yaml`](./_bmad/bmm/config.yaml)
- Our agents: [`methodology/local-agents/`](./methodology/local-agents/) · [`methodology/system-agents/README.md`](./methodology/system-agents/README.md) · [`methodology/agents-overview.md`](./methodology/agents-overview.md)

---

## 1. TL;DR (5 bullets)

1. **BMAD's project-context bootstrap (`/bmad-generate-project-context`) is the single best idea in the whole system.** Every agent reads a shared `project-context.md` on startup. We have no equivalent. Our agents each cold-start every session. This is a real gap.

2. **BMAD's course-correction command (`/bmad-correct-course`) formalizes mid-sprint pivots better than we do.** The impact table (which artifact changes, which stories to swap) is a pattern we should wire into our `//ship RP` retrospective method and into Gate/Loom's V2 scope.

3. **BMAD's persona/command split is its biggest structural anti-pattern.** `/bmad-agent-pm` and `/bmad-create-prd` do almost identical things — one via persona dialogue, one direct-workflow. This dual-entry confusion is what happens when you don't have a clean phase boundary enforced by methodology. Our FLOW phase gates are what prevent this proliferation.

4. **BMAD's capability-code tables (CP, VP, EP, CE inside John; BP, MR, DR, TR, CB inside Mary) are the right shape, but the codes are shallow** — no archetype-modulation, no refusal conditions, no stop criteria. Our code tables (SA, HS, HMW, BR, AC, MP…) are more rigorous; keep that rigor.

5. **BMAD has no structured handoff mechanism.** State moves between personas by convention and shared file paths — there is no `<FLOW-handoff>` equivalent. This means every BMAD transition is a silent leap of faith. Our handoff block is a genuine moat; protect it.

---

## 2. BMAD agent roster at a glance

| Persona | Name | Key codes | What it does well | Structural weakness |
|---|---|---|---|---|
| Analyst | Mary | BP, MR, DR, TR, CB | Brainstorming facilitation is warm and well-framed (HMW, SWOT, JTBD) | Scoped too broadly — research + brief + strategy is three roles; Mary sprawls |
| PM | John | CP, VP, EP, CE, IR | PRD template is thorough; validation checklist is genuinely useful | Overlaps heavily with `/bmad-create-prd` command; reason to use the persona vs. command is unclear |
| UX Designer | Sally | UF, WF, DS, IA, CU | Full UX doc template covers edge states (empty, error, loading) well | No wireframe refusal rule — Sally will wireframe without a locked brief |
| Architect | Winston | CA, IR | ADR template is solid (context / decision / options / consequences) | ADR format not linked to upstream handoff state; decisions float free |
| Tech Writer | Paige | DP, WD, MG, VD, EC | Mermaid diagram menu (flowchart, sequence, state, ER) is practical | Not connected to any artifact pipeline — generates docs in isolation |
| Scrum Master | Bob | SP, CS, ER, CC | Sprint plan template with explicit definition-of-done is good | Stories it "prepares" can only be as good as the PRD — no upstream gate |
| Developer | Amelia | DS, CR | TDD mandate (tests first → implementation → verify) is clear and enforced | No slice plan before implementation; risks building in wrong order |
| QA | Quinn | QA, CR, DQ | Design QA report (pass / fail table with severity) is the most concrete QA output in any system | No automation harness hookup; test cases are manual specs |

---

## 3. Design patterns we should steal

### P1 — Shared project-context file, read by every agent on activation

**Where in BMAD:** Every persona (John, Mary, Winston, etc.) opens with the same 4-step activation ritual: load `config.yaml`, search for `project-context.md`, load if found. [`bmad-generate-project-context.md`](~/.claude/commands/bmad-generate-project-context.md) generates and maintains it. The context includes: tech stack, design system, user personas, product principles, active PRDs.

**Gap in our system:** Our local agents (`explorer.md`, `solidifier.md`, …) do not load a shared project-context file. Every `//explore` call starts cold unless the user pastes a handoff. For a new contributor opening Cursor on day one, this is a wall.

**Apply to us:** Add an `on-activation` step to all four local-agent specs that reads a `_ds/project-context.md` (or `.flow/context.md`). Create a `//context-init` or `//install` command that generates it on first run — mirroring what `bmad-generate-project-context` does but reading FLOW sigil history, not just package.json. This file becomes what Pack (context bundler) uses as the base layer for onboarding packs. Concrete edit: [`local-agents/README.md` §2.1 prompt skeleton](../../methodology/local-agents/README.md) — add step 0 to the universal activation routine: *"Load `.flow/project-context.md` if it exists. State what you read in one sentence."*

### P2 — "Default-first" interaction pattern

**Where in BMAD:** Bob (SM) and Amelia (Dev) both surface a proposed action and wait. But the pattern is inconsistently applied — Mary and Sally ask open questions and wait for free-form response, which stalls. Amelia is the clearest: *"Read all acceptance criteria before writing any code."*

**Where we do it better:** Sol's mantra is *"Default first — accept, amend, or reject?"* applied to every capability. This is more rigorous than anything in BMAD. Reinforce it more explicitly in Bram's `on-activation` routine (currently the weakest of our four for the "offer default, wait" pattern). Concrete edit: [`local-agents/builder.md` §3 On activation](../../methodology/local-agents/builder.md) — add explicit step: *"Propose the first capability and a default approach. State: 'My default is X. Accept, amend, or reject?'"*

### P3 — Implementation readiness cross-document checklist

**Where in BMAD:** [`bmad-check-implementation-readiness.md`](~/.claude/commands/bmad-check-implementation-readiness.md) runs a structured cross-document check: does UX cover all PRD requirements? Does architecture handle all UX states (loading, error, empty)? Are there contradictions across docs? Produces a scored report (✅ Ready / ⚠️ Needs work / ❌ Missing).

**Gap in ours:** We rely on Solidifier's HO gate ("does `open` have any build-blocking items?") — which is per-handoff, not cross-artifact. The Solidifier has no visibility into whether the Builder's tools match the brief's constraints.

**Apply to us:** This pattern maps to Gate (V2) and partially to Solidifier's HO refusal. Before V2 ships, add a capability to Sol: `IR — Implementation Readiness` — a lightweight checklist run before emitting HO on Tuna/Willy cards. Check: AC written? Measurement hooks named? Constraints non-ambiguous? Under 10 items. Concrete edit: [`local-agents/solidifier.md` §5 Capabilities table](../../methodology/local-agents/solidifier.md) — add `IR` row.

### P4 — Structured course-correction document

**Where in BMAD:** [`bmad-correct-course.md`](~/.claude/commands/bmad-correct-course.md) is a mid-sprint pivot protocol: understand what changed → impact table (PRD / UX / stories / sprint / architecture each row) → three options (absorb / defer / stop-and-replan) → execute → produce a dated course-correction summary saved to `_bmad/docs/`.

**Gap in ours:** Reverse handoffs (`HB`) cover "go back one phase," but we don't have a structured "the whole card's shape changed" event. The Shipper's `RP` (retrospective) captures learnings after the fact, not mid-card.

**Apply to us:** Add `CC — Course Correction` to Solidifier (not Shipper — you correct course mid-solidify, not after ship). When Sol receives a Builder handback whose `notes` describe a fundamental shape change (not just AC ambiguity), Sol should offer CC, produce an impact table, and — if rebuilding — emit a revised HO with a decision log entry. The course-correction summary format from BMAD can be adopted directly. Concrete edit: [`local-agents/solidifier.md` §5](../../methodology/local-agents/solidifier.md) — add `CC` capability row; builder's HB template in [`fish/transitions-and-handoffs.md`](../../methodology/fish/transitions-and-handoffs.md) should explicitly mention "if this is a fundamental shape change, use CC not HO."

### P5 — Design QA as a first-class named step

**Where in BMAD:** Quinn's `DQ` (Design QA) produces a pass/fail report with a per-issue table (issue / spec says / actual / severity). This is a concrete, repeatable QA artifact. The Scrum Master's story-preparation (CS) also checks that UX states are covered before dev picks up a story.

**Gap in ours:** UV (UI Verify) in the Builder is the closest equivalent, but it's described lightly. The Shipper's trust receipt covers release integrity, not design fidelity.

**Apply to us:** Expand Builder's `UV` into the structured report format from BMAD's DQ — at minimum: spec vs. actual table for each state covered (default / hover / focus / disabled / error / empty / loading). This output should be referenced in the Shipper's trust receipt. Concrete edit: [`local-agents/builder.md` §8 Output templates](../../methodology/local-agents/builder.md) — add a `UV report` template matching BMAD Quinn's DQ format.

### P6 — Onboarding flow that names the typical feature lifecycle

**Where in BMAD:** [`bmad-help.md`](~/.claude/commands/bmad-help.md) shows a numbered typical feature flow (1. generate context → 2. brainstorm → 3. create brief → 4. create PRD → 5. validate → 6. UX design → 7. epics → 8. sprint). Simple, scannable, actionable.

**Apply to us:** Our `local-agents/README.md` covers the install grammar well but doesn't show the typical card lifecycle end-to-end for a first-time reader. Add a §7 — "Typical card lifecycle" — showing the `//explore → //solidify → //build → //ship → //explore` loop with the normal method codes for a Tuna card as a worked example. Concrete edit: [`local-agents/README.md`](../../methodology/local-agents/README.md) after §6, before cross-references.

---

## 4. Anti-patterns we should avoid

### A1 — Persona/command split without a principled distinction

BMAD has `/bmad-agent-pm` (John) and `/bmad-create-prd`, `/bmad-edit-prd`, `/bmad-validate-prd` as separate commands doing nearly identical work. John's CP capability runs nearly the same steps as `/bmad-create-prd`. This forces users to learn two entry points for the same work. The split is never explained in any file. Our FLOW `//` prefix is the only entry point; method codes are the resolution mechanism. Never add a parallel `//create-brief` shortcut alongside `//solidify BR` — they'd rot independently.

### A2 — Persona sprawl across 8 roles with no shared vocabulary

BMAD's 8 personas have no common handoff contract, no sigil, no archetype. When Winston (Architect) finishes an ADR, there is no formal mechanism to get it to Amelia (Dev). The convention is "save to `_bmad/docs/` and Amelia will find it." This is how state gets lost. Our 4 local agents communicate via a strict `<FLOW-handoff>` block with a schema. That shared vocabulary is load-bearing — don't dilute it by adding a fifth local agent that doesn't emit the block.

### A3 — No refusal conditions on capability codes

BMAD persona capability tables list codes and descriptions but include no refusal logic. Mary (Analyst) will run market research on a tooltip (a Nemo-scale problem). Sally (UX Designer) will wireframe before a brief is locked. BMAD relies on user judgment to stop this. Our refusal rules — NB refuses if no interviews exist; PM refuses on Nemos; HO refuses if `open` has build-blockers — are genuinely better. Don't weaken them under pressure to ship faster.

### A4 — Config-as-state (config.yaml carries project name but no FLOW state)

BMAD's `config.yaml` stores `project_name`, artifact paths, and user role. Every agent reads it on startup. But it contains no living state — no current sigil, no active card, no open handoffs. We don't have a `config.yaml` equivalent at all, which is a gap (see P1). But when we add one, resist the BMAD pattern of making it a config-only file. Our version should also index the last handoff block per card, so agents can resume without copy-paste. This is what Tally (Capture) will do at V1; at OSS launch, the config file should at minimum point at the `notes/` directory.

### A5 — Retrospective disconnected from the forward loop

BMAD's `/bmad-retrospective` generates a document and then says *"want to update project-context? run `/bmad-generate-project-context`."* It is the right instinct but a passive suggestion — it does not enforce the learning loop. Our Shipper's `RP` (Retrospective) and `NL` (Next-Loop Queue) are stronger because they explicitly emit a next-loop handoff. Make sure `NL` is always offered at the end of `RP` — not optional, not a footnote.

---

## 5. Structural improvements to our agents — punch list

| # | File | Change | Priority |
|---|---|---|---|
| 1 | [`local-agents/README.md` §2.1](../../methodology/local-agents/README.md) | Add universal step 0 to activation routine: load `.flow/project-context.md` if present, state what you read. | High |
| 2 | [`local-agents/README.md` §6 (new section)](../../methodology/local-agents/README.md) | Add "Typical Tuna lifecycle" example: `//explore HS → //explore HMW → HO → //solidify BR → //solidify AC → HO → //build CR → //build GE → HO → //ship TR → NL`. | Medium |
| 3 | [`local-agents/solidifier.md` §5](../../methodology/local-agents/solidifier.md) | Add `IR` capability row: lightweight implementation-readiness cross-check before HO on Tuna/Willy. | High |
| 4 | [`local-agents/solidifier.md` §5](../../methodology/local-agents/solidifier.md) | Add `CC` capability row: structured course-correction when a Builder HB signals fundamental shape change (not just AC ambiguity). Produce an impact table + revised HO with a DL entry. | Medium |
| 5 | [`local-agents/builder.md` §8](../../methodology/local-agents/builder.md) | Add `UV report` template: spec-vs-actual table for each UI state. This output becomes an artifact reference in Shipper's trust receipt. | Medium |
| 6 | [`local-agents/shipper.md` §5 (NL)](../../methodology/local-agents/shipper.md) | Make `NL` (Next-Loop Queue) non-optional when `RP` (Retrospective) completes. If user skips, log *"next-loop queue not emitted"* in handoff `notes`. | Low |
| 7 | [`system-agents/README.md` §3.8 Gate](../../methodology/system-agents/README.md) | When Gate checks flow.yaml rules, the check output should include a pointer to the `IR` Sol capability as the human-facing resolution path for missing-artifact failures. | Low (V2) |
| 8 | New file: `.flow/project-context.md` template | Create a template (not the file itself) that mirrors BMAD's project-context format but includes FLOW-specific fields: default archetype for common card types, team's `flow.yaml` path, last handoff per active card. | High |

---

## 6. Open questions for Tal

1. **Do we want a `//context-init` command that generates `.flow/project-context.md`?** BMAD's generate-project-context is the strongest onboarding step in the system — it reads the codebase (package.json, tailwind.config, components) and produces a shared reference. We could do the same, reading our tech stack + existing handoffs + `methodology/` docs. But this needs a decision: is it a fifth local agent command, a system agent responsibility (Pack?), or a one-time install script?

2. **Should the `//` commands also have stateless direct-workflow alternatives (like BMAD's `/bmad-create-prd`)?** The argument for: lower barrier for a user who just wants a brief and doesn't care about FLOW. The argument against: it fragments the onboarding story and creates two maintenance targets. BMAD's experience suggests the latter wins. My read: don't do it. Confirm.

3. **Bob (SM) and Quinn (QA) in BMAD map roughly to Gate + Loom in our system.** The question is whether any of their specific output templates (sprint plan, DQ report) should be absorbed into our Builder's `UV` template or into Gate's check output — before V2 ships. Bob's story-preparation (CS) is a manual gate check; Gate automates it. Are we confident Gate's V2 design is sufficient, or do we want a manual-mode `//build IR` as a stopgap?

4. **BMAD's personas all ground themselves in `ActionAI Platform` (the platform they were built for).** Our agents currently have no equivalent domain grounding beyond `methodology/` cross-references. When the four local-agent specs move out of `_bmad/`, will there be a new canonical home for team-specific grounding (design system, component library, stack specifics)? This is the `.flow/project-context.md` question — but it also has install-mechanics implications.
