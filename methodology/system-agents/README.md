---
name: System agents — Context Cloud workers
description: The nine background workers that observe, protect, and route Duble Slash sessions. Run in the desktop client + hosted backend. Coexist with local agents; enforce the same FLOW vocabulary without user invocation.
type: agent-roster
---

# System agents — background workers in the Context Cloud

System agents are **not** the `//` agents a user invokes inside their AI tool. Those are [local agents](../local-agents/README.md). System agents are the **always-on workers** that make Duble Slash trustworthy, multiplayer-capable, and long-horizon — the parts of the product the user doesn't type into.

They share one design rule: **transparent, narratable, overridable.** Users see what each agent did (audit log), can veto any action, can disable any agent without breaking the rest. System agents are not black boxes — they are visible workers in a glass kitchen.

---

## Pipeline at a glance

```
┌── ON USER DEVICE ──────────────────────────────────────────────────┐
│                                                                     │
│   Local agents ( // )                                               │
│   Explorer · Solidifier · Builder · Shipper                         │
│        │                                                            │
│        │  emits: handoffs · artifacts · invocations · commits       │
│        ▼                                                            │
│   ┌─────────────────────────────────────────────┐                   │
│   │  Capture · Tally         (personal · OSS)   │                   │
│   │  watches tools, tags session records,       │                   │
│   │  stores locally (encrypted)                 │                   │
│   └──────────────────┬──────────────────────────┘                   │
│                      ▼                                              │
│   ┌─────────────────────────────────────────────┐                   │
│   │  Redaction · Cipher      (personal · OSS)   │                   │
│   │  gates every outbound payload with a diff   │                   │
│   │  preview; user approves, edits, or cancels  │                   │
│   └──────────────────┬──────────────────────────┘                   │
│                      ▼  (user push)                                 │
│   ┌─────────────────────────────────────────────┐                   │
│   │  Sync · Relay            (personal→system · V1) │               │
│   │  queues redacted payloads; uploads; resolves    │               │
│   │  conflicts; offline-tolerant                    │               │
│   └──────────────────┬──────────────────────────────┘               │
└──────────────────────┼──────────────────────────────────────────────┘
                       │  encrypted transport
                       ▼
┌── CONTEXT CLOUD (V1+) ─────────────────────────────────────────────┐
│                                                                     │
│   team graph · cards · handoffs · artifacts · sigils                │
│                                                                     │
│   ┌──────────────┐  ┌──────────────┐  ┌──────────────┐              │
│   │ Handoff      │  │ Context      │  │ Digest       │              │
│   │ · Beacon     │  │ Bundler·Pack │  │ · Echo       │              │
│   │ (V1)         │  │ (V1)         │  │ (V1.5+)      │              │
│   └──────────────┘  └──────────────┘  └──────────────┘              │
│                                                                     │
│   ┌──────────────┐  ┌──────────────┐                                │
│   │ Flow Checker │  │ Process      │                                │
│   │ · Gate (V2)  │  │ · Loom (V2)  │                                │
│   └──────────────┘  └──────────────┘                                │
│                                                                     │
│   every action here is observable in the glass-kitchen UI           │
└─────────────────────────────────────────────────────────────────────┘

Personal Twin · Twin (personal · V1.5+) lives on the device and learns
from the user's accumulated handoffs; answers simple async questions
in their voice when they're offline.
```

Read the pipeline top-to-bottom: local agents produce events on the user's machine → Capture records → Redaction gates outbound → Sync transports → system agents work the team graph. Every arrow is observable; every arrow is overridable.

---

## 1. Where they live

| Agent scope | Runtime |
|---|---|
| **Personal** | The Duble Slash desktop client on the user's machine. Operates on the user's data only. Privacy-first, local-by-default. |
| **System** (team-scope) | The hosted backend / Context Cloud, available starting V1. Operates on the team graph. Subject to team policies. Audit-logged. |

The same agent can start as personal-scope (OSS launch, no multiplayer) and gain a system-scope tier at V1 — e.g., Capture runs on each user's device (personal) and also feeds the Context Cloud index (system).

---

## 2. The roster

| # | Agent · call-sign | Scope | Milestone | One-line job |
|---|---|---|---|---|
| 1 | **Capture** · *Tally* | Personal | OSS launch | Watch each tool; tag every session with source, model, timestamp, and goal. |
| 2 | **Redaction** · *Cipher* | Personal | OSS launch | Auto-detect PII, secrets, client identifiers. Diff-style preview before anything leaves the device. |
| 3 | **Sync** · *Relay* | Personal → System | V1 | Handle push from local store to team graph; honor per-session push controls. |
| 4 | **Handoff** · *Beacon* | System | V1 | Detect when a session hits a natural pause; surface it as pickup-able ("Alice paused on this — want it?"). Powers the Sarah→Marcus demo. |
| 5 | **Context Bundler** · *Pack* | System | V1 | Assemble a context pack on demand for any teammate — powers live handoff + new-joiner onboarding. |
| 6 | **Digest** · *Echo* | System | V1.5+ | Narrate "today at a glance" for the team. Replaces async standups. |
| 7 | **Personal Twin** · *Twin* | Personal | V1.5+ | Represent the user on simple async questions while they're offline. |
| 8 | **Flow Checker** · *Gate* | System | V2 / `flow.yaml` | Verify each card carries its required attributes (brief, source, context, goal, repository) per the team's `flow.yaml`. |
| 9 | **Process** · *Loom* | System | V2 / `flow.yaml` | Enforce phase transitions per `flow.yaml` (e.g., "no card moves to Build without an approved brief"). |

Call-signs humanize each agent in the UI, logs, and support conversations; the full name is the canonical reference. Each agent gets a full section below.

---

## 3. Per-agent specs

### 3.1 Capture agent

**Snapshot:** *Tally* · trigger: tool session opens · output: tagged session record (encrypted, local) · scope: Personal · ships: OSS launch · disable impact: lose session index; `//` agents still work.

**Scope:** Personal. **Ships:** OSS launch.

**Job:** Passively observe every AI tool the user works in, tag the resulting session with provenance metadata, and file it into the local session store.

**What it captures (OSS launch baseline):**
- Tool (Claude Desktop, Cursor, ChatGPT Desktop, Claude.ai, ChatGPT web, Perplexity, Claude via VS Code).
- Timestamp, session boundaries.
- Model (when available).
- Prompt + response content (always encrypted locally).
- Inferred goal (extracted from opening prompt).
- **FLOW sigil + phase + agent** — extracted from `//` invocations and `<FLOW-handoff>` blocks.

**Design rules:**
- **Local-first encrypted storage.** Data never leaves device by default. OSS-launch capture is entirely local.
- **Always-visible capture indicator** ("🟢 Capturing · 3 apps · encrypted locally · you control pushes") — the user can see what's being captured at all times.
- **Opt-in per-tool.** User can disable capture for any tool individually.
- **Transparent tagging.** When a `<FLOW-handoff>` is detected, Capture indexes it as a first-class event in the card's timeline, not as raw text.

**Interaction with local agents:**
- Every `<FLOW-handoff>` the local agents emit is saved by Capture. The user doesn't have to copy-paste handoffs between sessions — Capture stores them; the next session retrieves.
- Capture makes FLOW cards **resumable across tool restarts**. The handoff contract + Capture together = "pick up from yesterday."

**Failure modes to design against:**
- False negatives (missed sessions) — high cost, breaks the "yesterday" promise.
- Silent captures the user didn't expect — integrity-GTM-risk. Indicator must be truthful.

**Session record schema:**

```
session_id:    uuid
tool:          claude-desktop | cursor | chatgpt-desktop | claude-web | ...
model:         {provider}/{model_id} · null if unknown
started_at:    ISO 8601
ended_at:      ISO 8601 · null while active
goal:          string · extracted from opening prompt
card_id:       string · null if no FLOW card in play
sigil:         {certainty, size} · null if none
phase:         explore | solidify | build | ship · null if none
agent:         explorer | solidifier | builder | shipper · null if none
handoffs:      [ { ts, from, to, card_id, hash } ]   # indexed separately
content_ref:   pointer to encrypted blob on device (never plaintext in index)
```

### 3.2 Redaction agent

**Snapshot:** *Cipher* · trigger: any outbound payload (push, PR draft, trust receipt, announcement) · output: diff preview + signed redaction summary · scope: Personal · ships: OSS launch · disable impact: every push requires full manual review.

**Scope:** Personal. **Ships:** OSS launch.

**Job:** Gate any captured content before it leaves the device. Auto-detect PII, secrets, client identifiers; render a diff-style preview the user approves or edits.

**What it detects (baseline):**
- API keys, OAuth tokens, PEM blocks, credentials in config files.
- Email addresses, phone numbers, SSNs, credit-card-shaped strings.
- Internal URLs, internal hostnames, internal code names.
- User-taught identifiers (see "Teach once" below).

**Design rules:**
- **Pre-push preview.** Any push (to V1 Context Cloud or any external service) shows a diff-style preview: original vs. redacted. User approves, edits, or cancels.
- **Teach once** (from [brainstorm item H](../../planning/brainstorms/brainstorm-mvp-post-reframe.md#thread-4--redaction-trust)). First time the user flags a new pattern ("also redact our internal project codename"), Redaction learns it for future sessions.
- **Never silent.** No autonomous data movement. Every redact-and-send is an explicit action.
- **Co-signs trust receipts** (with the Shipper local agent). When the Shipper emits a trust receipt, Redaction appends a signed count of what was stripped.

**Interaction with local agents:**
- Handoffs and trust receipts emitted by local agents pass through Redaction before the Context Cloud (V1) picks them up.
- Redaction can flag the Explorer / Solidifier during Build when the user is about to emit an artifact containing likely-sensitive content.

**OSS-launch footprint:**
- Runs entirely on-device.
- Diff preview is the UX; no Duble Slash backend involved.

**Redaction preview + receipt schema:**

```
redaction_preview:
  payload_id:   uuid
  original:     <content, local only — never logged>
  redacted:     <content with matches replaced>
  matches:
    - pattern:   builtin:pii.email | builtin:secret.api-key | taught:{label}
      location:  {line, col, span}
      severity:  block | warn | info
  user_action:  approve | edit | cancel
  ts:           ISO 8601

redaction_receipt (co-signed onto Shipper's trust receipt):
  card_id:      string
  redactions:   { count, by_pattern: {pattern: n} }
  signer:       cipher
  hash:         sha256:...
  ts:           ISO 8601
```

### 3.3 Sync agent

**Snapshot:** *Relay* · trigger: user-approved push OR opt-in auto-sync · output: sync event (queued → uploaded → ack'd) + conflict dialogs · scope: Personal → System · ships: V1 · disable impact: single-player mode; local work continues.

**Scope:** Personal → System. **Ships:** V1.

**Job:** Handle push from local store to the team graph in the Context Cloud. Honor per-session push controls. Resolve conflicts when two teammates touch the same card.

**What it does:**
- Uploads user-approved sessions (after Redaction) to the Context Cloud.
- Routes updates: local capture → redacted preview → user approval → sync → team graph.
- Detects and surfaces conflicts ("Alice edited the brief while you were writing — merge, override, or defer?").

**Design rules:**
- **User approval per push** (OSS default) or **auto-sync** (opt-in, per-card).
- **Sync is observable.** Pending pushes, sync failures, conflicts — all visible in the desktop client.
- **Offline-tolerant.** Pushes queue; sync resumes on reconnect.

**Interaction with FLOW:**
- Sync is the mechanism by which a Solidifier's handoff in Claude Desktop reaches Marcus's Cursor.
- Card IDs are stable across tools because Sync maintains the canonical card state in the Context Cloud.

**Sync event schema:**

```
sync_event:
  event_id:       uuid
  card_id:        string
  payload_type:   handoff | artifact | trust-receipt | capture
  payload_ref:    {local path or blob hash}
  redacted_by:    cipher · hash:...
  state:          queued | uploading | acked | failed | conflict
  attempt:        n
  conflict:       null | { remote_hash, local_hash, resolution: merge|override|defer }
  ts:             ISO 8601
```

### 3.4 Handoff agent

**Snapshot:** *Beacon* · trigger: `<FLOW-handoff>` lands in team graph OR user closes a tool mid-card · output: pickup-able notification routed to the next phase's owner · scope: System · ships: V1 · disable impact: handoffs still stored in team graph but nobody gets notified.

**Scope:** System (team graph). **Ships:** V1.

**Job:** Detect when a session hits a natural pause and surface it as pickup-able to teammates. *"Alice paused on this card at phase X — want it?"*

**What it detects:**
- User emits a `<FLOW-handoff>` with `to: <other phase>` → notify the next agent's "owner" on the team if one is assigned.
- User closes a tool with a card in mid-Explore and no handoff emitted → prompt the user: *"Emit a handoff for pickup, or keep private?"*

**Design rules:**
- **Routing honors FLOW phase ownership.** If Sarah is the team's usual Explorer and Marcus the usual Builder, handoffs route accordingly — but any teammate can pick up any handoff.
- **Quiet by default.** Handoff agent doesn't spam. One notification per handoff per relevant teammate.
- **V1 handoff fields.** `requester`, `reviewer`, `sla` fields (see [transitions-and-handoffs.md §8](../fish/transitions-and-handoffs.md#8-multi-person-sessions-v1-multiplayer)) are populated automatically where possible.

**This is the Sarah→Marcus demo.** The Handoff agent is the glue; Sync is the transport.

**Pickup notification schema:**

```
pickup_notification:
  handoff_id:    uuid
  card_id:       string
  card_title:    string
  sigil:         {certainty, size}
  archetype:     nemo | tuna | salmon | willy
  from_agent:    explorer | solidifier | builder | shipper
  to_agent:      same set (next phase)
  from_user:     {id, display}
  to_users:      [{id, display, role}]    # candidates, not assignees
  confidence:    0.0–1.0                   # from the handoff
  urgency:       low | normal | high
  link:          deep-link into the card in the desktop client
  ts:            ISO 8601
```

### 3.5 Context Bundler agent

**Snapshot:** *Pack* · trigger: explicit request (button, command, agent-to-agent) · output: ephemeral context pack (passes team Redaction policy) · scope: System · ships: V1 · disable impact: teammates pick up via the raw card view with no curated pack.

**Scope:** System. **Ships:** V1.

**Job:** Assemble a context pack on demand for any teammate. Powers:
- Live handoff pickup (Marcus opens the card; Context Bundler gives him everything he needs).
- New-joiner onboarding (a new hire gets a pack of recent Tuna + Willy handoffs, archetype-tagged).
- "Catch me up" for anyone returning from leave.

**What's in a pack:**
- The card's full handoff log (every phase transition, chronological).
- All artifacts referenced in handoffs (briefs, sketches, interview nuggets).
- The card's Capture history (with the user's sensitive content redacted per the team's policy).
- The card's sigil history (sigil changes over the card's life).

**Design rules:**
- **Redaction-first.** Packs pass through team-level Redaction policy before delivery.
- **Explicit request.** Packs are requested (button press, command, agent-to-agent request), never pushed.
- **Expiring by default.** Packs are ephemeral — downloadable for a short window. Long-term access reads the live card.

**Context pack schema:**

```
context_pack:
  pack_id:        uuid
  card_id:        string
  requested_by:   user_id
  expires_at:     ISO 8601 · default: +24h
  redacted_by:    cipher · hash:... · team_policy_version
  contents:
    handoff_log:   [ <FLOW-handoff> blocks, chronological ]
    artifacts:     [ { path, type, bytes, summary } ]
    capture_log:   [ { session_id, tool, goal, ts } ]  # metadata, not content
    sigil_history: [ { sigil, phase, ts, changed_by } ]
  total_bytes:   n
  ts:            ISO 8601
```

### 3.6 Digest agent

**Snapshot:** *Echo* · trigger: cron (daily by default, team-configurable) OR on-demand · output: delta narrative (what changed since last digest, blockers first) · scope: System · ships: V1.5+ · disable impact: team loses the async-standup replacement; dashboards still work.

**Scope:** System. **Ships:** V1.5+.

**Job:** Narrate "today at a glance" for the team. Replaces async standups.

**What it produces:**
> *"This morning across your team: 3 Salmons in Explore (led by Sarah), 2 Tunas in Build (with Marcus), 1 Willy entering Solidify (Tal is owning the pitch). Blockers: one reverse-handoff on the billing Tuna — Builder wants Solidify to clarify AC #7."*

**Design rules:**
- **Sigil-aware.** Uses FLOW vocabulary; teammates read phase + archetype, not "sprint 3 item."
- **Delta-based.** What changed since the last digest, not a full status dump.
- **Blocker-first.** Reverse handoffs and stalled cards surface prominently.
- **Optional channels.** Slack, email, in-app; team picks.

**Why FLOW makes this possible:** because every card carries `sigil + phase + handoffs`, the Digest agent can write status from structured data instead of guessing from chat scroll.

**Digest schema:**

```
digest:
  digest_id:     uuid
  team_id:       string
  window:        { from: ISO, to: ISO }    # typically 24h
  sigil_counts:  { nemo: n, tuna: n, salmon: n, willy: n }
  phase_counts:  { explore: n, solidify: n, build: n, ship: n }
  deltas:
    advanced:    [ { card_id, from_phase, to_phase, by_user } ]
    reversed:    [ { card_id, from_phase, to_phase, by_user, reason } ]
    stalled:     [ { card_id, phase, days_since_update } ]
  blockers:      [ { card_id, kind, note } ]     # reverse handoffs, conflicts
  narrative:     string                          # the prose paragraph
  channels:      [ slack | email | in-app ]
  ts:            ISO 8601
```

### 3.7 Personal Twin agent

**Snapshot:** *Twin* · trigger: async question addressed to the offline user · output: short in-voice response (logged in user's activity) OR explicit defer · scope: Personal · ships: V1.5+ · disable impact: async questions wait for the user to return.

**Scope:** Personal. **Ships:** V1.5+.

**Job:** Represent the user on simple async questions while they're offline.

**Examples:**
- *"Does this match your team's convention?"* — Twin answers from the user's prior handoffs and decisions.
- *"Can I pick up your in-progress card?"* — Twin answers based on the user's stated policy.
- *"Is this redaction rule right?"* — Twin answers from the user's prior Redaction approvals.

**Design rules:**
- **Never speaks outside its mandate.** If the question is outside the user's prior patterns, Twin defers to the human.
- **Always narratable.** Every Twin response is logged in the user's activity so they see what was answered in their name.
- **Overridable.** The user can correct any Twin response; the correction updates the Twin's model.

**FLOW tie-in:** Twins learn from the user's accumulated handoff log. A designer's Twin knows how they Solidify; a developer's Twin knows how they Build.

**Twin response schema:**

```
twin_response:
  response_id:    uuid
  asked_by:       user_id
  on_behalf_of:   user_id (the offline user)
  question:       string
  answer:         string | null    # null when Twin defers
  confidence:     0.0–1.0
  grounded_in:    [ handoff_id | decision_id | redaction_rule_id ]  # sources
  defer_reason:   string | null    # populated when answer is null
  ts:             ISO 8601
  user_review:    pending | acknowledged | corrected
  correction:     string | null    # if user_review = corrected
```

### 3.8 Flow Checker agent

**Snapshot:** *Gate* · trigger: card state changes (phase transition attempted, artifact added, sigil changed) · output: advisory warning OR hard block (if team opted in to enforcing mode) · scope: System · ships: V2 (`flow.yaml`) · disable impact: no automated attribute checks; relies on human discipline.

**Scope:** System. **Ships:** V2 (`flow.yaml` milestone).

**Job:** Verify each card carries the required attributes per the team's `flow.yaml` spec.

**`flow.yaml` is a declarative methodology file** — a team-level config that says *"for Salmons and Willys, every card must have an interview-notes artifact before Solidify; for Tunas, a design-system-extension decision must be logged."*

**What Flow Checker does:**
- Reads `flow.yaml` at card entry.
- Checks each card's state against the spec.
- Surfaces missing attributes before transition: *"This Salmon is moving to Solidify without interview notes. Your `flow.yaml` requires them. Override, or add?"*

**Design rules:**
- **Advisory by default** (per brief: "opt-in, never a prerequisite").
- **Enforcing mode** — teams can opt into hard-gating. Then Flow Checker blocks non-compliant transitions.
- **Auditable.** Every check is logged.

**Check result schema:**

```
flow_check:
  check_id:      uuid
  card_id:       string
  flow_yaml:     path + version-hash
  rule:          id from flow.yaml
  status:        pass | warn | fail
  expected:      string   # what the rule required
  observed:      string   # what the card has
  severity:      advisory | enforcing
  outcome:       allowed | blocked | overridden
  override_by:   user_id | null
  override_reason: string | null
  ts:            ISO 8601
```

### 3.9 Process agent

**Snapshot:** *Loom* · trigger: `<FLOW-handoff>` attempts a phase transition · output: transition decision (allow | block | request-review) with logged reason · scope: System · ships: V2 (`flow.yaml`) · disable impact: all transitions allowed; the methodology becomes advisory rather than enforced.

**Scope:** System. **Ships:** V2 (`flow.yaml` milestone).

**Job:** Enforce phase transitions per `flow.yaml`.

**Examples of per-team rules a Process agent enforces:**
- *"No card moves to Build without an approved brief."*
- *"Willys require two reviewers on the Solidify handoff."*
- *"Salmons require a measurement plan before Build."*

**Design rules:**
- **Rules are declarative.** `flow.yaml` is the source; Process agent interprets.
- **Overridable with reason.** Enforcement can be overridden by explicit user action; the override + reason is logged.
- **Team-specific.** Every team can have its own `flow.yaml`; Process agent honors the active team's rules.

**Distinction from Flow Checker:** Flow Checker verifies attributes are present; Process agent enforces the transition graph. They work together.

**Transition decision schema:**

```
transition_decision:
  decision_id:   uuid
  card_id:       string
  from_phase:    explore | solidify | build | ship
  to_phase:      same set
  rule:          id from flow.yaml
  decision:      allow | block | request-review
  required_reviewers: [ user_id ]   # populated when decision = request-review
  override_by:   user_id | null
  override_reason: string | null
  ts:            ISO 8601
```

---

## 4. Cross-agent design rules

Rules that bind all nine agents:

### 4.1 Transparent, narratable, overridable

From the product brief:
- **Transparent.** Users see what each agent did (audit log).
- **Narratable.** Agents explain their actions in plain English when asked.
- **Overridable.** Users can veto any action; they can disable any agent without breaking the rest.

This is load-bearing. It is part of the integrity GTM pillar, not separate from it.

### 4.2 Same FLOW vocabulary as local agents

All system agents read:
- `sigil` (certainty × size — certainty decided first, see flow.md §3.1)
- `archetype` (Nemo / Tuna / Salmon / Willy)
- `phase` (Explore / Solidify / Build / Ship)
- `<FLOW-handoff>` blocks

System agents do not invent new vocabulary. They operate on the same cards the local agents produce.

### 4.3 Observable in the glass kitchen

Every system-agent action is visible somewhere in the Duble Slash UI:
- Capture → capture indicator + session timeline.
- Redaction → pre-push preview.
- Sync → sync queue + conflict dialog.
- Handoff → "new handoff" notification.
- Context Bundler → pack-generation log.
- Digest → the digest itself.
- Personal Twin → the Twin activity log.
- Flow Checker / Process → gate warnings inline at the transition.

No action is invisible. An agent that acts without a visible trace is a bug.

### 4.4 Disable-able individually

Any system agent can be disabled without breaking the rest. Concretely:
- Disable Capture → the rest of the system keeps working; `//` local agents keep operating; you just lose the session index.
- Disable Redaction → pushes require full manual review (not recommended but possible).
- Disable Sync → you become single-player; local agents still work; the Context Cloud doesn't receive your cards.
- Disable Digest / Twin / Flow Checker / Process → entirely optional features, off by default for some teams.

---

## 5. Relationship to local agents

| Local agent (foreground) | System agent (background) that supports it |
|---|---|
| Explorer | Capture (records session) + Redaction (stages if pushed) + Context Bundler (for entering Explore with prior-loop context) |
| Solidifier | Capture + Sync (V1 — cross-tool continuity) + Flow Checker (V2 — checks required artifacts) |
| Builder | Capture + Sync + Flow Checker + Process (V2 — gate against moving to Ship without criteria) |
| Shipper | Redaction (co-signs trust receipt) + Sync (publishes to team graph) + Handoff (routes to teammates) + Digest (surfaces in tomorrow's team digest) |

Every local-agent action is eventually visible to the team through a system-agent pipeline.

---

## 6. Shipping order & dependencies

```
OSS Launch
├── Capture (personal)
└── Redaction (personal)
        │
        ▼
      V1
├── Sync (personal → system)
├── Handoff (system)
└── Context Bundler (system)
        │
        ▼
    V1.5+
├── Digest (system)
└── Personal Twin (personal)
        │
        ▼
   V2 / flow.yaml
├── Flow Checker (system)
└── Process (system)
```

OSS launch ships with **just Capture + Redaction** because those are the integrity substrate — you can't have multiplayer handoffs without first demonstrating that capture and redaction work. V1 adds the multiplayer surface. V2 adds declarative methodology enforcement.

---

## 7. End-to-end walkthroughs

How system agents interact in real scenarios. These are the default paths; every step is observable and overridable.

### 7.1 OSS launch — solo user, single device (Tally + Cipher only)

```
1. User opens Claude Desktop, types //explore …
   → Explorer (local) starts a session.
   → Tally sees the session, tags it: tool=claude-desktop, phase=explore.

2. Explorer emits a <FLOW-handoff> to Solidifier.
   → Tally indexes the handoff as a first-class event on the card.

3. User closes the laptop. Next morning, opens Cursor and types //solidify.
   → Tally's index shows a handoff is waiting. Solidifier (local) picks
     up cold using the handoff. No copy-paste.

4. Solidifier writes solidify/brief.md. Builder ships the feature.
   Shipper asks to emit a trust receipt.
   → Cipher gates the receipt — redacts the two email addresses found
     in the brief. Shows diff preview.
   → User approves. Receipt is hashed, timestamped, stored locally.

   No network traffic. No team graph. OSS launch doesn't need one.
```

### 7.2 V1 multiplayer — the Sarah→Marcus demo (adds Relay, Beacon, Pack)

```
1. Sarah (designer, Claude Desktop) finishes a Solidify session.
   Solidifier emits a <FLOW-handoff> to Builder with card_id=billing-2026-05.

2. Sarah hits "push to team".
   → Cipher re-scans the handoff + referenced artifacts. Diff preview.
     Sarah edits two sensitive strings; approves.
   → Relay queues the redacted payload.
   → Relay uploads. team graph acks.

3. Beacon sees the ack. Reads to:=builder, archetype=tuna.
   → Routes pickup notification to Marcus (team's usual Tuna Builder).
   → Marcus gets a single, quiet ping: "Sarah paused a Tuna on
     billing-2026-05 — want it?"

4. Marcus opens the card in Duble Slash. Clicks "get pack".
   → Pack assembles: handoff log, Sarah's brief + AC, the Explore
     interview nuggets Sarah referenced, the sigil history.
   → Pack passes team Redaction policy. Expires in 24h.

5. Marcus opens Cursor, types //build <paste pack summary>.
   → Builder (local) reads the contract. Runs CR. Builds.
   → Tally records Marcus's session on his device.
   → When Marcus emits HO to Shipper, the cycle repeats through Cipher +
     Relay + Beacon for whoever Ships.

No "copy the handoff into Slack" step. No "does anyone know where the brief is?"
The handoff is the mechanism; system agents are the transport and routing.
```

### 7.3 V2 enforcement — a team that opted into flow.yaml (adds Gate + Loom)

```
flow.yaml (team-level):
  archetypes:
    salmon:
      solidify_requires:
        - interview_notes: artifact
        - measurement_plan: artifact
      build_requires:
        - concept_test_result: artifact
    willy:
      solidify_requires:
        - pitch: artifact
        - decision_log: artifact
      transitions:
        solidify_to_build:
          reviewers: 2

1. Designer emits HO from Solidifier → Builder on a Salmon card.
2. Loom intercepts the transition attempt.
   → Reads flow.yaml. Salmon build requires a concept_test_result artifact.
   → Card doesn't have one. Decision: block.
   → UI inline warning: "Your team's flow.yaml requires a concept test
     result before Build. Override (requires reason) or run a test?"
3. Designer overrides with reason: "hotfix cohort, test scheduled in 3 days".
   → Loom logs the override + reason + timestamp + user.
   → Transition proceeds. Gate also logs that the artifact was missing.
4. On the next daily digest, Echo surfaces the override:
   "1 Salmon moved to Build without a concept test (overridden by Sarah —
   reason: hotfix cohort, test scheduled)."

Enforcement stays advisory-with-teeth: the team's rules are honored, but
the human keeps the last word, and every override is visible.
```

---

## 8. Cross-references

- Local agents (`//` personas) → [`../local-agents/README.md`](../local-agents/README.md)
- FLOW spec → [`../fish/README.md`](../fish/README.md)
- Transitions + handoff contract → [`../fish/transitions-and-handoffs.md`](../fish/transitions-and-handoffs.md)
- Product brief (source of agent list + milestones) → [`planning/briefs/brief-collab-capture-layer.md`](../../planning/briefs/brief-collab-capture-layer.md)
- Technical stack → [`planning/research/technical/technical-research-duble-slash-stack.md`](../../planning/research/technical/technical-research-duble-slash-stack.md)
