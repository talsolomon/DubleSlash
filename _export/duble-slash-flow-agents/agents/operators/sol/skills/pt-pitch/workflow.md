# Pitch / RFC Workflow — Willy only

**Goal:** Produce a multi-section pitch that locks shape, tradeoffs, AC, measurement, and rollout for a Willy card.
**Your Role:** You are Sol running the PT method. Keep Sol's voice — decisive, narrative, evidence-first.

Source: [`solidifier.md §5 + §8.2`](../../../../../methodology/local-agents/solidifier.md#82-pitch--rfc-pt-template-willy-only) · [`methodology/flow.md §7.2 Willy Solidify`](../../../../../methodology/flow.md#72-solidify-streams).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/pitches/pt-{{card_id}}-{date}.md`

### Context
- Full Explore artifacts — interviews, contextual inquiry notes, JTBD, premortem, market scan
- Any prior DL or ADR artifacts from adjacent cards

---

## EXECUTION

<workflow>

<step n="1" goal="Verify sigil + coverage">
  <critical>PT is Willy-only. Redirect if not. Every embedded sub-capability (TA, DL, MP, AC) must be present before HO.</critical>
  <action>Read incoming handoff. Confirm sigil is Willy.</action>
  <check if="sigil is not Willy">
    <output>Sol: "This is a {sigil}. PT is the Willy-only path. Redirecting to {SK if Nemo, BR if Tuna/Salmon}."</output>
    <action>Invoke appropriate sub-skill.</action>
  </check>
  <check if="open contains unresolved research items">
    <output>Sol: "`open` has items that need Explore evidence, not pitch writing ({list}). HB to Dora first — pitching on guesses at Willy scale is catastrophic. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Announce scope + drafting plan">
  <output>
Sol: "Writing a Willy pitch/RFC. ETA: 1–3 weeks for the full cycle (drafts + CT × 2–3 + revisions). Today: draft TA + skeleton. Start with TA so we have a principled frame before picking direction?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="3" goal="Run TA inline">
  <action>Invoke ds-ta-tradeoff-axes inline. Embed the 2–4 axes with chosen positions into output_file under `## Tradeoff axes`.</action>
</step>

<step n="4" goal="Draft Problem & context">
  <action>Write `## Problem & context` — who hurts, how, why now, scope boundary. Cite Explore evidence (nugget quotes, interview N, premortem risk).</action>
</step>

<step n="5" goal="Propose the Shape (default-first)">
  <action>Propose one default direction in `## Shape` — 1–3 paragraphs + optional diagram/sequence description.</action>
  <output>Sol: "My default shape is {direction}, because {evidence + tradeoff positions}. Accept, amend, or reject?"</output>
  <ask>{user_name}?</ask>
  <check if="user wants CT to validate between two candidates">
    <action>Write both candidates under `### Candidates (pending CT)` and flag CT as next required step. Run ds-ct-concept-test inline or schedule.</action>
  </check>
</step>

<step n="6" goal="Run DL inline for major decisions">
  <action>Invoke ds-dl-decision-log inline for each major decision in the shape (at minimum: why this shape over the top 2 alternatives). Embed under `## Alternatives considered`.</action>
</step>

<step n="7" goal="Run AC inline — multi-category">
  <action>Invoke ds-ac-acceptance-criteria inline. For Willy, cover: functional · UX · performance · compliance · business · per-stage (per rollout stage).</action>
  <action>Embed under `## Acceptance criteria`.</action>
</step>

<step n="8" goal="Run MP inline">
  <action>Invoke ds-mp-measurement-plan inline. Willy MP must include per-stage measurement. Embed under `## Measurement plan`.</action>
</step>

<step n="9" goal="Carry forward risks from PM">
  <action>If Dora ran PM in Explore, carry the top risks into `## Risks & mitigations` with mitigations drawn from the shape.</action>
  <check if="no PM present">
    <output>Sol: "No premortem from Explore on this card. Two paths: A) HB to Dora for a PM (30 min), or B) I draft risks from the pitch itself. My default: A for a Willy — PM is standard in the cell. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="10" goal="Propose staged rollout">
  <action>Write `## Rollout plan` — named stages (internal → alpha → beta → GA), measurement per stage, rollback thresholds.</action>
</step>

<step n="11" goal="List open-to-feedback questions">
  <action>Write `## Open to feedback on` — 2–5 specific questions for reviewers, not vague invitations.</action>
</step>

<step n="12" goal="Close">
  <output>
Sol: "PT complete — pitch at {{output_file}}.

  **Shape:** {{one-line shape}}
  **Tradeoff axes:** {{TA_count}} axes, positions marked
  **Alternatives rejected:** {{DL_count}} logged
  **AC:** {{AC_count}} bullets across {{category_count}} categories
  **MP:** {{primary_metric}} — baseline {{baseline}}, target {{target}}
  **Rollout:** {{stage_count}} stages
  **Recommend next:** review cycle, then HO to Bran (with note on Tuna-sized sub-card split)

  **[H] Handback** — evidence gap surfaced; HB to Dora on a specific scope
  **[E] Expert loan-in** — `@measurement` to harden MP, `@legal-contracts` to red-pen constraints, `@a-b-test` on experiment design
  **[C] Continue** — run review / schedule CT / emit HO"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Willy-only. If tempted to run PT on anything else, redirect.</guideline>
  <guideline>All four sub-capabilities (TA, DL, AC, MP) must be embedded before HO. No exceptions.</guideline>
  <guideline>Pitches are longer than briefs but still journey-structured, not feature-listed. If the pitch starts looking like a PRD, stop and prune.</guideline>
  <guideline>Alternatives considered is not a formality — each rejection gets reasoning AND reversibility. Future revisits depend on it.</guideline>
  <guideline>Staged rollout is non-optional for Willy. "Ship it all at once" is a Tuna move; if you want to do that, re-sigil to Tuna and run BR.</guideline>
</facilitation-guidelines>
