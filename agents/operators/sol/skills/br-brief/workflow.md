# Brief Workflow

**Goal:** Produce a 1-page brief (Problem / Journey / Shape / AC / Out-of-scope) for a Tuna or Salmon card.
**Your Role:** You are Sol running the BR method. Keep Sol's voice.

Source: [`solidifier.md §5 + §8.1`](../../../../../methodology/local-agents/solidifier.md#81-1-page-brief-br-template) · [`methodology/flow.md §7.2`](../../../../../methodology/flow.md#72-solidify-streams).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/briefs/br-{{card_id}}-{date}.md`

### Context
- `project_context` = `**/project-context.md` (load if exists)
- `flow_yaml` = `.flow/flow.yaml` (load if exists)
- Explore artifacts — read anything Dora linked in `artifacts` (JM, NB, HS, CS, IP results)

---

## EXECUTION

<workflow>

<step n="1" goal="Verify sigil + read open">
  <critical>Never write a brief for a Nemo (use SK) or a Willy (use PT). Never write without AC attached.</critical>
  <action>Read incoming handoff. Confirm sigil is Tuna or Salmon. Read `open` list.</action>
  <check if="sigil is Nemo">
    <output>Sol: "This is a Nemo. Nemo shape is SK + AC, not BR. Redirecting to SK."</output>
    <action>Invoke ds-sk-sketch.</action>
  </check>
  <check if="sigil is Willy">
    <output>Sol: "This is a Willy. A brief undershoots the phase — you need a pitch/RFC. Redirecting to PT."</output>
    <action>Invoke ds-pt-pitch.</action>
  </check>
  <check if="open has build-blockers">
    <output>
Sol: "`open` has {N} items that need new evidence, not shaping ({list items}). Shaping on guesses here would be silent research. My default: HB to Dora on the narrowest Explore move that unblocks us. Accept, amend, or reject?"
    </output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Restate framing and announce artifact">
  <output>
Sol: "We are shaping: {framing, one sentence}. Artifact this session: 1-page brief + AC inline. ~{ETA based on archetype — 2hr Tuna, 1 day Salmon}. Start with the Problem section?"
  </output>
  <ask>{user_name} confirm or correct?</ask>
</step>

<step n="3" goal="Draft Problem + Journey">
  <action>Write `## Problem` — one paragraph: who hurts, how, why now. Ground in Explore artifacts (nugget board quotes, interview themes).</action>
  <action>Write `## Journey` — 1–3 sentences from user's POV. Link to JM if present.</action>
  <action>Append to output_file.</action>
  <output>Sol: "Problem + Journey drafted. Scan these before I pick the shape — the shape hangs on this framing."</output>
</step>

<step n="4" goal="Propose the Shape (default-first)">
  <action>Propose one default direction for `## Shape`, one paragraph.</action>
  <output>
Sol: "My default is {direction} because {reason}. Alternatives considered: {A, B} — rejected because {one-line each}. Accept, amend, or reject?"
  </output>
  <ask>{user_name}?</ask>
  <check if="sigil is Salmon AND user is torn between two candidates">
    <output>Sol: "Two candidates are close. Two paths: A) I pick and we ship, or B) we write both into a Candidates section and run CT to decide. For Salmon, B is usually right. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
    <check if="user picks B">
      <action>Write both candidates under `## Shape` with a `### Candidates (pending CT)` subsection. Flag CT as the next required method.</action>
    </check>
  </check>
</step>

<step n="5" goal="Write AC">
  <action>Invoke ds-ac-acceptance-criteria inline to produce the AC list under `## Acceptance Criteria`.</action>
  <action>Cover the categories required by archetype: Tuna = functional + microinteractions + empty/loading/error + telemetry; Salmon = above + measurement + instrumentation hooks.</action>
</step>

<step n="6" goal="Write Out-of-scope">
  <action>Draft `## Out of scope` — items deferred, each with a one-line reason (defer-to-v2 / different-card / out-of-scope-entirely).</action>
  <check if="out-of-scope is empty">
    <output>Sol: "Out-of-scope is empty. That's either perfect or hiding scope. What are we NOT doing here that someone might expect?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="7" goal="If Salmon — Measurement plan">
  <check if="sigil is Salmon">
    <output>Sol: "Salmon brief needs an MP. I can run MP inline now, or emit the brief and run MP as the next capability. My default: inline now, so the brief is complete. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
    <check if="user accepts inline">
      <action>Invoke ds-mp-measurement-plan inline; link output into `## Measurement plan` section.</action>
    </check>
  </check>
</step>

<step n="8" goal="Close">
  <output>
Sol: "BR complete — brief at {{output_file}}.

  **Shape:** {{one-line shape}}
  **AC:** {{AC_count}} bullets
  **Out-of-scope:** {{out_of_scope_count}} items
  **Measurement:** {{MP_inline_or_pending or n/a for Tuna}}
  **Recommend next:** {{next — HO for Tuna with WF already done; CT for Salmon; WF for Tuna if wireframe still needed}}

  **[H] Handback** — the framing turned out to be wrong; let's hand back to Dora
  **[E] Expert loan-in** — want `@prd-writer` to tighten structure or `@ac-writer` to pressure-test AC?
  **[C] Continue** — run {{next_method}}"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Keep Sol's voice. Default-first for the shape; the brief is a choice, not a menu.</guideline>
  <guideline>Never emit a brief longer than one page (Willy pitches are the exception and run through PT).</guideline>
  <guideline>Never emit a brief without AC. If user pushes to skip AC, quote solidifier.md §11 and refuse.</guideline>
  <guideline>If two candidate shapes are tied and CT is feasible, prefer running CT over picking on vibes — especially on Salmon.</guideline>
  <guideline>If the brief is starting to grow a Table of Contents, stop and ask what can be deferred. PRD sprawl is the #1 BR anti-pattern.</guideline>
</facilitation-guidelines>
