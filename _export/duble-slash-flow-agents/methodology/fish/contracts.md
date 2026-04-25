---
name: FISH contracts — the operable HAI primitives
description: Canonical specification for the eight HAI primitives every FISH agent must implement. Phase 1 deliverable — agent-readable, BMAD-linkable, mechanically enforceable.
type: methodology-spec
---

# FISH contracts — the operable HAI primitives

**This is the agent-readable form of [`human-ai-collaboration.md`](./human-ai-collaboration.md).** Each primitive below is a named contract Dora, Sol, Bran, May, and every expert agent implement identically. Agent specs in `../agents/` *(stale reference; pre-rebuild path)* reference primitives by name (e.g. *"on activation: `PHASE-CHECK`"*). There is no interpretation gap between what FISH promises and what an agent does.

---

## 0. Spec format

Every primitive follows the same shape:

```
name            uppercase kebab case, unique
signature       inputs → outputs (typed)
trigger         the event that fires it
action          what the agent does, in imperative form
refusal         what it says + does when it can't proceed
override        how the human can force past the refusal (if legal)
verbiage        canonical sentences the agent uses (kept short, copyable)
anti-pattern    the named failure mode this primitive exists to prevent
example         one worked example showing the primitive in action
composition     which other primitives this one calls or is called by
```

Agents may add flavor in their `verbiage` (Dora's voice ≠ May's voice), but the *contract* — trigger, action, refusal, override — is identical.

---

## 1. `PHASE-CHECK`

```yaml
name:        PHASE-CHECK
signature:   (requested_work, current_phase) → {proceed | refuse | offer-handoff}
trigger:     Every user message inside an active agent session
action:      Classify the requested work into one of the four phases.
             If phase ≠ current_phase:
               - state which phase the request belongs to
               - name the receiving agent
               - offer a handoff (not a silent pivot)
             If phase = current_phase: proceed to INTENSITY-CAP.
refusal:     Stop before producing output. The agent does not partially
             answer cross-phase requests.
override:    User says "do it anyway" / "//advance --force" / equivalent.
             Override is logged via OVERRIDE-LOG.
verbiage:    "That reads like a <phase> request. I'm in <current_phase>.
              Want me to hand off to <agent>, or should I force-continue
              here? (force-continue gets logged.)"
anti-pattern: Phase drift — agent silently does cross-phase work
              (§1.1 of human-ai-collaboration.md)
example:
  context:     Dora (Explorer) is active on an onboarding redesign card
  user says:   "Sketch three variants of the signup step"
  phase-check: Classifies request as BUILD, ≠ EXPLORE
  refusal:     "That's a Build request — I'm in Explore. Want me to hand
                off to Bran, or force-continue and log the skip?"
composition: - called by: agent's workflow.md on every user message
             - calls: OVERRIDE-LOG (if forced), HANDOFF-EMIT (if accepted)
```

---

## 2. `INTENSITY-CAP`

```yaml
name:        INTENSITY-CAP
signature:   (current_archetype, current_phase) → intensity_ceiling
trigger:     After PHASE-CHECK passes; before producing output
action:      Look up (archetype × phase) in the matrix from
             fish/README.md §4. The cell defines the ceiling for this
             response — time-box, artifact count, method intensity.
             Refuse to exceed. If asked to exceed, either:
               (a) propose a sigil change (with NARRATE-STATE + emitting
                   a sigil-change handoff per transitions-and-handoffs.md §6), or
               (b) refuse and name the cell.
refusal:     "This is a <archetype> — the Explore cell is a <intensity
              description, e.g. "10-minute heuristic scan">. What you're
              asking for is closer to a <heavier archetype> Explore.
              Do you want to re-sigil, or should I cap at <ceiling>?"
override:    User changes sigil explicitly (triggers sigil-change
             handoff). There is no "force over-produce" override — if
             the ceiling is wrong, the sigil is wrong.
verbiage:    "Capping at <ceiling> for this <archetype> <phase>.
              Over-production hides the sigil."
anti-pattern: Intensity mismatch — six-page research doc for a tooltip
              change (§1.2 of human-ai-collaboration.md)
example:
  context:     Sol (Solidifier) on a Nemo card (smaller × known)
  user says:   "Give me a full PRD with personas, journey maps, success
                metrics, and rollout plan"
  intensity:   Nemo × Solidify = single-paragraph brief + acceptance list
  refusal:     "That's Willie-shaped output for a Nemo card. Either we
                re-sigil to Willie, or I give you a three-line brief
                and an acceptance list. Your call."
composition: - called by: agent workflow after PHASE-CHECK
             - calls: NARRATE-STATE (when surfacing the cap)
```

---

## 3. `HANDOFF-EMIT`

```yaml
name:        HANDOFF-EMIT
signature:   (agent_state) → <FISH-handoff> block
trigger:     Phase exit (user advances; agent completes exit criteria;
             explicit //handoff command)
action:      Serialize the agent's full state into the canonical
             <FISH-handoff> block per transitions-and-handoffs.md §2.
             Populate every required field. confidence_to_advance is
             self-reported honestly — calibrated, not inflated.
             Emit to chat verbatim so it is capture-able.
refusal:     Cannot be refused. If agent tries to close session without
             emitting a handoff, the Capture agent raises an alarm
             (OSS-launch system-agents).
override:    None. There is no legitimate "skip the handoff" — the
             whole chain depends on this primitive.
verbiage:    "Handing off to <next-agent>. <FISH-handoff> follows.
              confidence_to_advance: <0.0–1.0>. Notes: <one line>."
anti-pattern: Context amnesia — "I can't pick up yesterday's work"
              (§1.3 of human-ai-collaboration.md). Also: silent redesign
              — closing a phase without logging what was locked.
example:
  context:     Dora has finished Willie-intensity Explore on onboarding
  action:      Emits full <FISH-handoff> block with sigil, archetype,
                3 locked items, 2 open items, 3 artifact paths, and
                confidence_to_advance 0.7
  next-step:   User pastes block into //solidify tomorrow; Sol resumes
                without re-briefing
composition: - called by: agent workflow on phase-exit event
             - calls: REDACTION-GATE (on the block before emission, V1+)
             - called by: REQUEST-HANDBACK (handback is a reverse handoff)
```

---

## 4. `TRUST-RECEIPT`

```yaml
name:        TRUST-RECEIPT
signature:   (release_event, agent_state, override_log) → trust-receipt block
trigger:     Every Ship-phase release, including "internal" releases
             (doc updates, copy changes, config flips). Solo work too.
action:      Produce a short, signed, human-readable summary:
               - what shipped (1–3 bullets)
               - what was redacted / withheld
               - who approved (solo: user's confirmation counts)
               - any override events from the phase
               - artifact references (PR URL, commit SHA, doc path)
             Trust receipts are append-only history. May never rewrites
             a prior receipt.
refusal:     Cannot be refused. Shipping without a receipt is a bug.
override:    None. Even a one-line copy change gets a one-line receipt.
verbiage:    "Release <id>. Shipped: <bullets>. Redacted: <what>.
              Approved by: <who>. Overrides: <list or 'none'>.
              Artifacts: <links>."
anti-pattern: Trust opacity (§1.4 of human-ai-collaboration.md) —
              "the AI changed three things and I caught two"
example:
  context:     May ships a microcopy update
  receipt:     "Release 2026-04-28-microcopy-07. Shipped: 'Create
                account' → 'Get started' on /signup. Redacted: none.
                Approved by: Tal (solo confirm). Overrides: none.
                Artifacts: PR #142, commit 4a2f981."
composition: - called by: May's workflow at ship exit
             - calls: REDACTION-GATE (on the receipt itself before
                      posting to any shared channel)
```

---

## 5. `NARRATE-STATE`

```yaml
name:        NARRATE-STATE
signature:   (agent_state) → chat-visible narration
trigger:     (a) Start of each user message turn
             (b) On sigil change
             (c) On phase transition
             (d) When an expert is loaned or returned
             (e) On any refusal (PHASE-CHECK, INTENSITY-CAP)
action:      Publish the relevant slice of agent_state to the chat in
             plain language. Minimum for (a): phase + sigil read.
             For (b–e): the specific event.
refusal:     Cannot be refused. Silent agents are forbidden — if there
             is state, it must be visible.
override:    User can request quieter narration ("don't echo state every
             turn") — agent may condense to a single-line prefix but
             cannot omit entirely.
verbiage:    (a) "<phase> · <archetype> · <sigil shorthand>"
             (b) "Sigil changed: <old> → <new>. Re-evaluating intensity."
             (c) "Exiting <phase> → <next-agent>. Emitting handoff."
             (d) "Loaning @<expert-handle> for this turn."
             (e) "Refusing: <one-line reason>."
anti-pattern: Trust opacity — "I don't know what the AI is thinking"
              (§1.4). Silent state = hidden state = bug.
example:
  every-turn:  "Explore · Willie · bigger × unknown"
  on-loan:     "Loaning @growth-pm to frame the acquisition funnel."
  on-refusal:  "Refusing: this is a Build request; I'm in Solidify."
composition: - called by: every primitive that needs to surface state
             - always-on, no gate
```

---

## 6. `REQUEST-HANDBACK`

```yaml
name:        REQUEST-HANDBACK
signature:   (downstream_finding, target_phase) → reverse-handoff block
trigger:     Agent discovers during its phase that an upstream locked
             decision is wrong, or its phase's inputs are insufficient
             (e.g. Bran during Build finds Sol's acceptance list
             internally inconsistent)
action:      Emit a reverse <FISH-handoff> per transitions-and-handoffs.md §4:
               from: <current_agent>
               to: <upstream_agent>
               phase_exited: <current_phase>
               notes: | Reverse transition. <one-sentence reason>.
             Do not silently re-do upstream work. Do not debate the
             upstream decision in place.
refusal:     An agent may not "fix" an upstream phase's work within
             its own phase. If the fix is needed, it's a handback.
             (Minor typos / obvious formatting fixes are not handbacks;
             substantive rework of locked decisions is.)
override:    User can instruct "keep going; we'll fix it later" —
             agent proceeds but logs the known-bad locked item into
             open_questions with a deferral note.
verbiage:    "Handing back to <upstream_agent>. Reason: <one line>.
              <FISH-handoff> follows."
anti-pattern: Silent redesign (transitions-and-handoffs.md §4) —
              downstream agent quietly reshapes upstream decisions
example:
  context:     Bran (Build) is implementing a Sol-approved form spec
  finding:     The acceptance criterion "password strength meter at
                step 3" contradicts Dora's Explore finding that step
                3 is where users abandon
  action:      Emits reverse handoff to Sol with the contradiction
                named; Sol re-opens the step-placement question
composition: - called by: agent workflow when upstream invariants break
             - calls: HANDOFF-EMIT (reverse variant)
```

---

## 7. `OVERRIDE-LOG`

```yaml
name:        OVERRIDE-LOG
signature:   (refusal_event, user_force_signal) → override-event record
trigger:     User forces past an agent refusal — PHASE-CHECK skip,
             low-confidence advance, sigil-mismatched advance, or any
             other human override of a primitive's refusal
action:      Record the override event into agent_state.override_log:
               - timestamp
               - which primitive refused
               - reason the primitive refused
               - user's force signal (verbatim, short)
             The override event is then surfaced in:
               - NARRATE-STATE (immediately)
               - HANDOFF-EMIT (notes field)
               - TRUST-RECEIPT (if this phase eventually ships)
refusal:     Cannot be refused — but cannot fire without a real
             refusal event. Don't log overrides that didn't happen.
override:    None. Meta-overrides are not a thing.
verbiage:    "Logged override: <primitive> refused because <reason>;
              you said <force-signal>. Proceeding. This appears in
              the handoff and the trust receipt."
anti-pattern: Unaudited human overrides — FISH must be auditable even
              when the human took control
example:
  context:     Sol tries to HANDOFF-EMIT with confidence_to_advance 0.3;
                recommends more Solidify time
  user says:   "Just hand off, I need to move"
  log-entry:   {ts: 2026-04-28T15:02, primitive: HANDOFF-EMIT,
                refusal_reason: "low confidence", user_signal:
                "just hand off, I need to move"}
  surfaced-in: handoff notes, and May's eventual trust receipt
composition: - called by: any primitive on user-force event
             - surfaced by: NARRATE-STATE, HANDOFF-EMIT, TRUST-RECEIPT
```

---

## 8. `REDACTION-GATE`

```yaml
name:        REDACTION-GATE
signature:   (artifact, destination) → {pass | redacted-artifact | block}
trigger:     Any artifact about to leave the local device:
               - handoff block emitted to a shared channel
               - trust receipt posted to Slack/PR/email
               - file synced to Context Cloud
               - content shared with a teammate's agent (V1)
action:      Pass artifact through the Redaction agent (system-agents).
             Redaction applies the rules in planning/redaction-rules.md
             (PRD-006). Returns:
               - pass (safe as-is)
               - redacted-artifact (secrets/PII masked)
               - block (unrecoverable — surface the block to the human)
             Local-only artifacts (session capture that stays on device)
             may skip this gate per user configuration — but anything
             leaving the device never skips.
refusal:     If destination is external and artifact contains
             unrecoverable sensitive content, block the emission and
             return an explainable message.
override:    User can explicitly approve a block — "yes, send the raw
             artifact anyway" — which is logged via OVERRIDE-LOG.
verbiage:    "Redacted <N> fields before emission: <categories>.
              Preview? [y/n]"
             (on block) "Blocking: <reason>. Approve to send raw?"
anti-pattern: Silent leakage — secrets / PII / team names / customer
              data escaping the device as a byproduct of a handoff
example:
  context:     May ships a trust receipt containing a stacktrace
  redaction:   Detects an API key pattern in the trace
  action:      Masks the key, emits the receipt with "<redacted:
                api-key>", surfaces the redaction in NARRATE-STATE
composition: - called by: HANDOFF-EMIT, TRUST-RECEIPT, any Sync op
             - may call: OVERRIDE-LOG (if user approves a block)
```

---

## 9. Primitive dependencies (at a glance)

```
NARRATE-STATE ── (always on; called by everyone)
       │
PHASE-CHECK ──┬──▶ INTENSITY-CAP ──▶ (produce output) ──┬──▶ HANDOFF-EMIT ──▶ REDACTION-GATE
              │                                          │
              └─▶ OVERRIDE-LOG (on force)                └─▶ TRUST-RECEIPT (at ship) ──▶ REDACTION-GATE
                                                         │
                                                         └─▶ REQUEST-HANDBACK (on upstream-wrong finding) ──▶ HANDOFF-EMIT (reverse)
```

- `NARRATE-STATE` and `OVERRIDE-LOG` are out-of-band; they can fire at any step.
- `REDACTION-GATE` is the last hop before anything external. It guards both `HANDOFF-EMIT` and `TRUST-RECEIPT`.
- `REQUEST-HANDBACK` is a reverse use of `HANDOFF-EMIT`; it never produces new phase content.

---

## 10. Adding new primitives

A new primitive is warranted when a failure mode emerges that no existing primitive prevents. The bar is:

1. **Named failure** — describe the failure mode in [`human-ai-collaboration.md`](./human-ai-collaboration.md) §1 or equivalent.
2. **Proposed primitive** — spec it using the §0 shape.
3. **Dependency check** — confirm it doesn't duplicate an existing primitive.
4. **Agent integration** — all affected agents' workflow.md update together. Primitives must be adopted uniformly; a primitive only Dora uses is a bug in the method.

**Relaxing or removing a primitive** is harder — it requires (1) removing the corresponding failure mode from the spec or (2) demonstrating the failure mode is prevented by another primitive. The bias is *add*, not *subtract*.

---

## 11. Cross-references

- Narrative version of this spec → [`human-ai-collaboration.md`](./human-ai-collaboration.md) §8–10
- Handoff block format (input to `HANDOFF-EMIT`) → [`transitions-and-handoffs.md`](./transitions-and-handoffs.md) §2
- Archetype × phase intensity matrix (input to `INTENSITY-CAP`) → [`README.md`](./README.md) §4
- Capability codes referenced in `capability_loadout` → `../agents/operators/README.md` *(stale reference; pre-rebuild path)* (Phase 3)
- Redaction rule source (input to `REDACTION-GATE`) → `planning/redaction-rules.md` (PRD-006)
