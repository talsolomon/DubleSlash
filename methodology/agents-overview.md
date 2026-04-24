---
name: Agents — the full roster
description: Single-file orientation for all thirteen Duble Slash agents. Differentiates local (foreground, //-invoked) from system (background, event-triggered). Explains layers, ownership, lifecycle, and "which agent do I reach for?" Canonical entry point for designers, PMs, and engineers picking up FLOW.
type: agent-overview
---

# Agents — the full roster

Duble Slash ships **thirteen agents** that cooperate through one shared vocabulary (FLOW). This doc is the one-stop map: the four agents you *invoke* and the nine that run *around* you — what they do, who owns each, when each fires, and which one to reach for when you want to get something done.

> If you have read only one other agent file, make it [`fish/human-ai-collaboration.md`](./fish/human-ai-collaboration.md). It explains *why* any of this exists. This doc explains *which parts* exist and how they fit together.

---

## 1. Map at a glance

```
┌── LAYER 1 · LOCAL AGENTS · foreground · //-invoked · one per user ─────────┐
│                                                                             │
│    Explorer · Nova        Solidifier · Sol        Builder · Bram            │
│    (head)                 (left body)             (right body)              │
│                                                                             │
│                               Shipper · Sage                                │
│                               (tail)                                        │
│                                                                             │
│    Each is a SPECIALIST PERSONA with a deep method catalog.                 │
│    Nova — the researcher. ~25 discovery methods (SA, PM, HMW, JM, CS, IP,   │
│       NB, HS, SR + JTBD, contextual inquiry, design sprint, scenario plan…) │
│    Sol — the shaper. BR, AC, MP, DL, TA, WF, AD, SK, SB, PT, CT…            │
│    Bram — the builder. CR, SL, GE, TE, UV, IN, PR…                          │
│    Sage — the shipper. CM, CH, RN, TG, MS, MR, RP, TR, NL…                  │
│    You type // → tool adopts ONE persona; explicit <FLOW-handoff> between.  │
└────────────────────────────────────┬────────────────────────────────────────┘
                                     │ emits: handoffs · artifacts · invocations · commits
                                     ▼
┌── LAYER 2 · PERSONAL BACKGROUND · on your device · event-triggered ────────┐
│                                                                             │
│    Capture · Tally         Redaction · Cipher         Personal Twin · Twin  │
│    tags every tool         gates every outbound       answers async         │
│    session (encrypted,     with a diff preview        in your voice when    │
│    local by default)       for user approval          you're offline        │
│                                                                             │
│    All three run on YOUR machine. Zero network traffic unless YOU push.     │
└────────────────────────────────────┬────────────────────────────────────────┘
                                     │ approved pushes only (never auto)
                                     ▼
┌── LAYER 3 · SYSTEM BACKGROUND · team graph · Context Cloud (V1+) ──────────┐
│                                                                             │
│    Sync · Relay            Handoff · Beacon           Context Bundler·Pack  │
│    queues + uploads        routes pickups to the      assembles on-demand   │
│    redacted payloads       next phase's owner         context packs         │
│                                                                             │
│    Digest · Echo           Flow Checker · Gate        Process · Loom        │
│    daily delta narrative   flow.yaml attribute        flow.yaml transition  │
│    (replaces standups)     checks (advisory+enforce)  enforcement           │
│                                                                             │
│    Team-scope. Not just plumbing — METHODOLOGY ORCHESTRATORS: they apply   │
│    FLOW at project scale, classify each card's archetype (Nemo / Tuna /    │
│    Salmon / Willy), set which local agent LEADS the card, and enforce the │
│    team's flow.yaml. Every action visible in the glass-kitchen audit UI.    │
└─────────────────────────────────────────────────────────────────────────────┘

  Ship order:  Tally + Cipher            → OSS launch
               Relay + Beacon + Pack     → V1 multiplayer
               Echo + Twin               → V1.5+
               Gate + Loom               → V2 (flow.yaml)
```

The map reads top-down: **you** drive a local agent inside an AI tool; each local-agent output becomes an event the personal-background agents process; approved pushes cross into the team graph where the system-background agents work. Nothing moves without transparency and user consent.

---

## 2. Two kinds of agents

| | **Local agents** (`local-agents/`) | **System agents** (`system-agents/`) |
|---|---|---|
| **What they ARE** | **Specialist personas, each with a deep method catalog.** Nova is *the researcher* — 25+ discovery methods. Sol is *the shaper* — briefs, AC, measurement, ADRs, tradeoff axes. Bram is *the builder*. Sage is *the shipper*. The persona is how you *address* the specialist ("bring in Nova to run a Premortem"); the method catalog is what she *offers* once you do. Neither half works without the other — a toolbox without a voice is a command menu; a voice without methods is a chatbot. | **Methodology orchestrators.** They apply FLOW at *project scope* — classify each card's archetype (Nemo / Tuna / Salmon / Willy), decide which local agent *leads* that card, and enforce the team's `flow.yaml`. Not plumbing. Not just sync. They are what makes FLOW a methodology instead of four prompts. |
| **Where they live** | Inside the user's AI tool (Claude Desktop, Cursor, ChatGPT Desktop) as memory/instructions | Duble Slash desktop client + Context Cloud backend |
| **How they activate** | User types `//explore`, `//solidify`, `//build`, `//ship` (+ optional method code — e.g. `//explore PM` runs Premortem) | Triggered by events: tool session opens, push requested, handoff lands, cron fires, transition attempted |
| **Conversational?** | Yes — persona-embodied, dialogic | No — observe, process, emit records; surface UI when they need your attention |
| **Who owns each run** | The user (one persona at a time) | The runtime; configured per user or per team |
| **Scope** | Per-user, per-session | Personal (on device) or System (team graph) |
| **Artifacts** | Method outputs: briefs, AC, measurement plans, interview plans, premortems, journey maps, tradeoff axes, code, release notes, trust receipts | Session records, diff previews, sync events, pickup notifications, context packs, digests, twin responses, **archetype classifications, lead-agent assignments, flow-check results, transition decisions** |
| **Disable impact** | Switching persona = switching method toolbox; disabling one means you do that phase's methods by hand | Each can be disabled individually; disabling the *orchestration* layer (Gate + Loom) drops the project back to per-card self-direction |
| **Ships** | All four at OSS launch | Staged: Tally+Cipher OSS → Relay+Beacon+Pack V1 → Echo+Twin V1.5 → Gate+Loom V2 |

**Load-bearing distinction:** local agents talk *to* you and run *methods with* you; system agents work *around* you and run *methodology on* you. Every local-agent action creates events that some system agent may process. The local-agent pipeline keeps working even if every system agent is disabled — you just lose multiplayer continuity, audit, and project-level FLOW orchestration.

---

## 3. The thirteen agents — quick reference

| # | Agent · call-sign | Kind | Scope | Ships | One-line job |
|---|---|---|---|---|---|
| L1 | **Explorer** · *Nova* | Local · head | Per-user | OSS | Open the aperture with a research / discovery method. Surface options, questions, premises. Refuse to commit. |
| L2 | **Solidifier** · *Sol* | Local · left body | Per-user | OSS | Reduce unknowns via shaping methods (brief, AC, MP, ADR, tradeoff axes). Lock decisions that unblock Build. |
| L3 | **Builder** · *Bram* | Local · right body | Per-user | OSS | Execute against the locked shape via build methods (contract readout, slice plan, tests, UI verify, instrumentation). |
| L4 | **Shipper** · *Sage* | Local · tail | Per-user | OSS | Release + narrate via ship methods (trust receipt, measurement readout, retrospective, changelog, next-loop queue). |
| S1 | **Capture** · *Tally* | System · personal | On device | OSS | Watch each tool; tag every session with source, model, timestamp, goal. |
| S2 | **Redaction** · *Cipher* | System · personal | On device | OSS | Auto-detect PII / secrets. Diff preview before anything leaves the device. |
| S3 | **Sync** · *Relay* | System · personal→team | Hybrid | V1 | Queue + upload approved payloads. Honor push controls. Resolve conflicts. |
| S4 | **Handoff** · *Beacon* | System · team | Context Cloud | V1 | Route `<FLOW-handoff>` pickups to the next phase's owner. Powers Sarah→Marcus. |
| S5 | **Context Bundler** · *Pack* | System · team | Context Cloud | V1 | Assemble on-demand context packs (pickup, onboarding, catch-up). |
| S6 | **Digest** · *Echo* | System · team | Context Cloud | V1.5+ | Delta-based team narrative ("today at a glance"). Replaces standups. |
| S7 | **Personal Twin** · *Twin* | System · personal | On device | V1.5+ | Answer simple async questions in the user's voice while they're offline. |
| S8 | **Flow Checker** · *Gate* | System · team | Context Cloud | V2 | Apply the team's `flow.yaml` to each card: verify archetype-required attributes, flag mismatches, gate transitions. |
| S9 | **Process** · *Loom* | System · team | Context Cloud | V2 | Orchestrate FLOW across the project: classify archetype, set which local agent leads each card, enforce transitions. |

Legend: **L** = local (you invoke), **S** = system (event-triggered). Call-signs are the humanized handle used in UI / logs / support; the full name is canonical.

### 3.1 Method catalogs — what each persona specializes in

Personas are who you talk to; **methods are what they're specialized in offering**. You reach for Nova because she's *the researcher* — and she proactively offers the research methods that fit your card. Invoked as `//<phase> <code>` (e.g. `//explore PM` runs Premortem). Full specs in each agent file.

- **Explorer · Nova** — the research/discovery toolbox.
  `SA` Sigil Assist · `HS` Heuristic Scan · `HMW` How-Might-We · `JM` Journey Map · `CS` Competitor/Pattern Scan · `IP` Interview Plan · `NB` Nugget Board · `PM` Premortem · `SR` Stream Recap · `HO` Handoff
  *Plus the classics Nova draws from when the card asks for them:* JTBD interviews, contextual inquiry, task analysis, Goal-Directed Design, Operational Sequence Diagram, scenario planning, Design Sprint, heuristic evaluation, TZUMI recaps.
- **Solidifier · Sol** — the shaping toolbox.
  `SK` Sketch · `SB` Storyboard · `BR` Brief · `PT` Pitch/RFC · `CT` Concept Test · `AC` Acceptance Criteria · `MP` Measurement Plan · `DL` Decision Log · `TA` Tradeoff Axes · `WF` Wireframe Spec · `AD` ADR · `HB` Handback · `HO` Handoff
- **Builder · Bram** — the build toolbox.
  `CR` Contract Readout · `SL` Slice Plan · `GE` Generate Code · `TE` Tests · `UV` UI Verify · `IN` Instrumentation · `PR` PR Draft · `HB` Handback · `HO` Handoff
- **Shipper · Sage** — the release toolbox.
  `RE` Release Readout · `CM` Commit Message · `CH` Changelog · `RN` Release Notes · `TG` Tag/Version · `PR` Open PR · `MS` Measurement Setup · `MR` Measurement Readout · `RP` Retrospective · `TR` Trust Receipt · `NL` Next-Loop Queue · `HB` Handback · `HO` Handoff

The method code is the load-bearing part of an invocation. `//explore` alone is fine; `//explore PM` is *precise* — it tells Nova which method to run and which artifact shape to emit.

---

## 4. Hierarchy & ownership

Who can *do* what, who can *stop* it, and what it leaves behind.

| Agent | Who invokes | Who can veto / override | Fires when | Disable impact |
|---|---|---|---|---|
| Explorer · Nova | User (`//explore …`) | User (any response, any time) | User types `//explore` or receives a `to: explorer` handoff | You do Explore manually; no handoffs to Solidifier |
| Solidifier · Sol | User (`//solidify …`) | User | `//solidify` or `to: solidifier` handoff | You shape manually; Builder has no contract to consume |
| Builder · Bram | User (`//build …`) | User | `//build` or `to: builder` handoff | Code work is unscoped; higher drift risk |
| Shipper · Sage | User (`//ship …`) | User per-action (commit, push, tag, publish) | `//ship` or `to: shipper` handoff | No narrated releases; trust receipts must be hand-authored |
| Capture · Tally | Automatic (per user's opt-in list) | User disables per-tool | A tool in the watched list opens or emits events | Lose session index; all `//` agents still run |
| Redaction · Cipher | Automatic (any outbound payload) | User (approve / edit / cancel every diff) | Anything queued for outbound: push, PR draft, trust receipt, announcement | Every push requires full manual review |
| Sync · Relay | User approves push (OSS default) or opt-in auto-sync | User per-push; user per-conflict resolution | Redacted payload ready + user push OR timer (if opted in) | Single-player mode; local state intact |
| Handoff · Beacon | Automatic when `<FLOW-handoff>` lands in team graph | User mutes; team re-routes | Handoff lands OR user closes tool with in-progress card | Pickups sit in the graph but nobody gets notified |
| Context Bundler · Pack | Explicit request (user, teammate, or agent) | User on own cards; team policy across cards | Button press / command / agent request | No curated packs; pickers read the raw card |
| Digest · Echo | Scheduled (team-configurable) + on-demand | Team admin (schedule, channels) | Cron tick or on-demand request | Team falls back to whatever standup ritual it had |
| Personal Twin · Twin | Async question addressed to the offline user | User (correct or retract any Twin answer) | Async question arrives while user offline + question is within Twin's trained mandate | Questions wait for the user; no in-voice answers |
| Flow Checker · Gate | Automatic on card state changes | User per-override; team enables advisory vs enforcing | Phase-transition attempt, artifact add, sigil change | No automated attribute checks; humans self-enforce |
| Process · Loom | Automatic on card creation + transition attempts | User per-override (reason logged); team sets `flow.yaml` | Card opened, sigil assigned, or `<FLOW-handoff>` requests a phase transition | Transitions always allowed; archetype/lead are set ad-hoc per card; methodology becomes advisory |

**Authority lines** (what can hurt vs. what can only advise):

- **Only two agents write code:** Builder (product code) and Shipper (release plumbing only — version bumps, changelog, tag messages, commit text). Everyone else produces documents, diffs, or decisions.
- **Only Shipper commits, tags, or publishes** — and only with per-action user confirmation.
- **Only Loom (V2) can block a transition** — and only when the team has opted into enforcing mode.
- **Only the system-agent layer applies FLOW at project scope.** Gate + Loom (reading the team's `flow.yaml`) classify each card's archetype (Nemo / Tuna / Salmon / Willy) and assign the *lead local agent* accordingly — Nemo leans on Bram, Tuna on Sol, Salmon and Willy on Nova. Local agents run methods; system agents decide which methods a given card requires and who should run them. Users can override any assignment (reason logged). Until V2 ships, this role is held locally by Explorer's **SA** (Sigil Assist) and team convention; V2 formalizes it.
- **Only you can push data off the device** — Cipher *gates* but does not initiate; Relay *queues* but does not auto-upload without your approval (OSS default).

---

## 5. Lifecycle — a card from birth to next loop

One card's end-to-end journey. **System agents frame the card; local agents run the methods inside it.** The right column shows what the system-agent layer is doing at each step — not just recording, but orchestrating.

```
      ┌─ USER · "the export tooltip is confusing users"
      ▼
  ┌──────────────────────┐                                   Loom reads the card + team
  │ FLOW-TYPE CLASSIFY   │── sigil = Salmon ─────────┐       flow.yaml. Classifies the
  │ (system · Loom/Gate) │── lead  = Nova (Explorer) │       archetype (small + uncertain
  │ or Nova's SA today   │── required: MP before TR ─┤       → Salmon), assigns the lead
  └──────────────────────┘                           │       local agent, and tags the
      │                                              │       methods required for this
      │  //explore (invoked by user or auto-routed)  │       archetype. Pre-V2 this role
      ▼                                              │       is held by Nova's SA method.
  ┌──────────┐                                       │
  │ Explorer │── runs: IP, NB, PM ──────────────────┤       Tally records the session.
  │  · Nova  │   (methods Loom flagged for Salmon)   │       Cipher watches for anything
  └──────────┘                                       │       sensitive pasted in chat.
      │                                              │
      │  <FLOW-handoff> (to: solidifier)             │
      ▼                                              │       Handoff stored locally;
  ┌────────────┐                                     │       if user pushes to team,
  │ Solidifier │── runs: BR, AC, MP, DL ────────────┤       Cipher gates the push and
  │   · Sol    │                                     │       Relay queues it. Beacon
  └────────────┘                                     │       routes pickup notifications.
      │                                              │       Gate verifies AC + MP exist
      │  <FLOW-handoff> (to: builder)                │       (Salmon requires both).
      ▼                                              │
  ┌──────────┐                                       │       Tally captures the Build
  │ Builder  │── runs: CR, SL, TE, UV, IN ──────────┤       session in whichever tool
  │  · Bram  │                                       │       you're coding in. Gate
  └──────────┘                                       │       checks flow.yaml.
      │                                              │
      │  <FLOW-handoff> (to: shipper)                │
      ▼                                              │
  ┌──────────┐                                       │       Cipher co-signs the trust
  │ Shipper  │── runs: CM, CH, RN, TG, MR, RP, TR ──┘       receipt. Relay syndicates
  │  · Sage  │                                              the release to the team
  └──────────┘                                              graph. Echo includes it
      │                                                     in tomorrow's Digest.
      │  <FLOW-handoff> (to: explorer, next loop)
      ▼
   next card or next loop on this card — Pack assembles a context pack
   for whoever picks it up, whether that's you tomorrow or a teammate.
```

**Two tracks, not one.** The left column is the *methods track* — Nova, Sol, Bram, Sage each running the specific method codes (IP, AC, MP, CR, TR…) that the card requires. The right column is the *methodology track* — Loom classifies and assigns, Gate verifies, Beacon routes, Cipher/Relay/Tally/Echo handle capture, privacy, sync, and narration. Remove the methodology track and you still have four competent method toolboxes; remove the methods track and you have a flow.yaml with nothing running inside it.

What stays constant across the whole lifecycle:
- **Sigil** (certainty × size — certainty decided first, see flow.md §3.1) is set up front — by Loom reading `flow.yaml` (V2) or by Nova's `SA` method (today) — and travels with every handoff.
- **Lead agent** is assigned with the sigil and travels with the card. Nemo-leads-Bram, Tuna-leads-Sol, Salmon/Willy-lead-Nova is the default; teams override in `flow.yaml`.
- **Card ID** is stable across sessions, tools, and teammates.
- **Trust receipt** exists for every Ship, even solo — it's what makes audit possible later.
- **Every transition is a `<FLOW-handoff>` block** — the universal mechanism for picking up cold.

---

## 6. Which agent do I reach for?

Task-first lookup. If you're trying to do X, start with Y.

### 6.1 The four local agents

| I want to… | Reach for | How |
|---|---|---|
| Open a new problem I haven't worked on | **Explorer · Nova** | `//explore <problem>` |
| Turn research / options into one shaped brief + AC | **Solidifier · Sol** | `//solidify <paste handoff>` or `//solidify BR` |
| Implement the brief I just locked | **Builder · Bram** | `//build <paste handoff>` or `//build CR` |
| Release + narrate + generate a trust receipt | **Shipper · Sage** | `//ship <paste handoff>` or `//ship TR` |
| Figure out whether this work is Nemo / Tuna / Salmon / Willy | **Explorer · Nova** | `//explore SA` (Sigil Assist) |
| Premortem a risky Willy before committing | **Explorer · Nova** | `//explore PM` |
| Write a measurement plan for a Salmon | **Solidifier · Sol** | `//solidify MP` |
| Pick up where I (or a teammate) left off | Whoever the last handoff's `to:` names | Paste the `<FLOW-handoff>` into `//<phase>` |
| Reverse a phase because the prior shape was wrong | Current agent's **HB** capability | `//handback` |

### 6.2 Expert shortcuts — when the card crosses domains

The four locals each carry a **136-expert roster** they can loan in for one turn without switching persona. You rarely need to memorize handles — each agent **proactively offers 2–3** based on the card's sigil and topic. Full roster + grammar: [`local-agents/experts.md`](./local-agents/experts.md).

| I want expertise in… | Handles to reach for | Where they shine |
|---|---|---|
| Backend / API / DB / distributed / perf | `@be-dev` · `@api-designer` · `@db-schema` · `@distributed` · `@perf-eng` | Build (via Bram) |
| Frontend / React / CSS / a11y / perf-web | `@fe-dev` · `@react-pro` · `@a11y` · `@perf-web` | Build (via Bram) |
| AI / ML / LLM / agents / RAG | `@ai-ml` · `@llm-pro` · `@rag` · `@agent-arch` · `@prompt-eng` | Solidify + Build |
| Security / authn / authz / privacy / compliance | `@sec-eng` · `@authn` · `@authz` · `@privacy` · `@security-compliance` · `@incident-response` | Any phase |
| Data analysis / BI / rigor | `@data-analyst` · `@bi-dev` · `@statistician` · `@sql-wizard` | Explore + Solidify + Ship |
| Product management / strategy / pricing | `@pm` · `@strategy` · `@pricing` · `@b2b-product` · `@b2c-product` · `@plg` | Explore + Solidify |
| Marketing (product, brand, content, field) | `@product-marketing` · `@brand-marketing` · `@content-marketing` · `@growth` · `@gtm` | Ship (via Sage) |
| Legal (contracts, IP, regulatory, compliance, international) | `@legal` · `@legal-contracts` · `@legal-ip` · `@legal-regulatory` · `@legal-compliance` · `@legal-international` | Any phase |
| Finance & accounting | `@finance` · `@fp-a` · `@accounting` · `@treasury` | Explore + Ship |
| Project / program mgmt | `@pm-delivery` · `@program-mgr` · `@scrum-master` | Solidify + Build |
| Industry verticals (banking, fintech, health, retail, govtech, etc.) | `@banking` · `@fintech` · `@payments` · `@healthcare` · `@medtech-fda` · `@retail-ecomm` · `@edtech` · `@govtech` · `@insurance` · `@media-pub` · `@regulated-fin` | Explore + Solidify |
| My team's in-house knowledge (billing system, legacy service, internal policy) | Team-custom `.experts/@your-handle.md` — drop it in the repo | Any phase |

**How invocation works:** `//build @be-dev` runs Builder with the backend-dev lens for that turn. `@legal-ip` inline loans in the lens mid-session. `//experts` browses the roster; `//explore ??` asks the current agent for recommendations. One-turn loan — experts advise, they don't commit or gate.

**Missing an expert?** Open a GitHub issue tagged `expert-roster`, or drop a `.experts/@handle.md` file in your repo today ([`local-agents/experts.md` §4](./local-agents/experts.md#4-team-custom-experts--experts-overlays)).

### 6.3 System agents — the background rails

| I want to… | Reach for | How |
|---|---|---|
| Redact something before it leaves my machine | **Redaction · Cipher** | Automatic on any outbound; edit the diff preview |
| See which of my sessions today touched which cards | **Capture · Tally** | Capture indicator / session timeline in desktop client |
| Push my work to teammates (V1) | **Sync · Relay** | Hit "push" → Cipher gates → Relay uploads |
| Get notified when a teammate leaves me a handoff (V1) | **Handoff · Beacon** | Runs automatically; notifications in desktop client |
| Catch up on a card I've never seen (V1) | **Context Bundler · Pack** | Click "get context pack" on the card |
| Read a delta-based status for the team (V1.5+) | **Digest · Echo** | Scheduled to Slack / email / in-app |
| Have my voice answer an async question while I'm offline (V1.5+) | **Personal Twin · Twin** | Automatic, if opted in and within trained mandate |
| Enforce "no Salmon ships without a measurement plan" (V2) | **Flow Checker · Gate** + **Process · Loom** | Encode in team `flow.yaml` |

### 6.4 Heuristics for confused moments

- *"I'm not sure what phase I'm in"* → ask whichever `//` persona is active; they'll name the phase and offer the right handoff.
- *"I'm not sure which phase to start from"* → `//explore`. Start divergent. Explorer will either keep you there or hand you off.
- *"I'm blocked — I can't tell if this needs more research or more shaping"* → `//handback` from whoever you're currently talking to. Reverse transitions are first-class, not a failure state.
- *"I need domain expertise I don't have"* → let the current local agent offer experts (turn 1 + topic shift), or type `//explore ??` / `//solidify ??` / `//build ??` / `//ship ??` to ask for recommendations. Don't leave the tool.

---

## 7. Design principles shared across all thirteen

Six rules that bind every agent on the roster. These are methodology rules, not implementation notes.

1. **Transparent, narratable, overridable.** Every agent explains what it did in plain English when asked. Every user-visible action can be vetoed. No silent data movement, no silent decisions.
2. **One shared vocabulary.** All thirteen agents read and emit `sigil`, `archetype`, `phase`, and `<FLOW-handoff>`. No agent invents its own terminology.
3. **Per-action confirmation for destructive or external work.** Commits, tags, pushes, announcements, branch deletions — every one requires explicit user confirmation, per action. Shipper authority does not override this.
4. **Sigil-aware intensity.** Each agent modulates its depth by archetype (Nemo → concise; Willy → thorough). Agents flag mismatches ("you asked for a full PRD on a Nemo") rather than silently gold-plating or under-investing.
5. **Handoff, never smuggle.** Phase exits always emit a `<FLOW-handoff>`. Reverse transitions (handback) are normal, not exceptional. Smuggling work across phase boundaries without a handoff is a bug.
6. **Local works without system; system never works without local.** The local-agent pipeline runs standalone (OSS drop). The system pipeline is built on top of local-agent events and cannot function without them.

---

## 8. Reading order for each kind of reader

- **Designer / PM / engineer picking up FLOW for the first time:**
  1. This file (§§1–3 are enough to orient)
  2. [`fish/human-ai-collaboration.md`](./fish/human-ai-collaboration.md) — why this exists
  3. [`fish/README.md`](./fish/README.md) — axes, archetypes, phases
  4. The one local-agent spec you'll use first — e.g., [`local-agents/explorer.md`](./local-agents/explorer.md)
- **Someone installing the `//` bundle** into Claude / Cursor / ChatGPT Desktop:
  1. [`local-agents/README.md`](./local-agents/README.md) — roster + invocation grammar
  2. Each of the four agent spec files (read the Illustration, Persona, On-activation, Capabilities sections)
- **Someone building or reviewing Duble Slash's background workers:**
  1. This file (§§4–5 for ownership + lifecycle)
  2. [`system-agents/README.md`](./system-agents/README.md) — pipeline, schemas, walkthroughs
- **Team lead writing a `flow.yaml`:**
  1. This file §6 (to see what the agents will enforce)
  2. `system-agents/README.md` §3.8 (Flow Checker) and §3.9 (Process)
  3. FLOW transitions + gates: [`fish/transitions-and-handoffs.md`](./fish/transitions-and-handoffs.md)

---

## 9. Cross-references

- **FLOW methodology spec** → [`fish/README.md`](./fish/README.md)
- **Phases & methods (the method catalog)** → [`fish/phases-and-methods.md`](./fish/phases-and-methods.md)
- **Transitions & the `<FLOW-handoff>` contract** → [`fish/transitions-and-handoffs.md`](./fish/transitions-and-handoffs.md)
- **Worked use cases (one per archetype)** → [`fish/use-cases.md`](./fish/use-cases.md)
- **Local-agent roster + install mechanics** → [`local-agents/README.md`](./local-agents/README.md)
- **Per-agent local specs** → [`local-agents/explorer.md`](./local-agents/explorer.md) · [`solidifier.md`](./local-agents/solidifier.md) · [`builder.md`](./local-agents/builder.md) · [`shipper.md`](./local-agents/shipper.md)
- **System-agent pipeline + schemas + walkthroughs** → [`system-agents/README.md`](./system-agents/README.md)
- **Why this all exists (the moat)** → [`fish/human-ai-collaboration.md`](./fish/human-ai-collaboration.md)
