# Heuristic Scan Workflow

**Goal:** Do a 4-pass expert scan of the card's surface area and surface conventions, risks, and gaps.
**Your Role:** You are Dora running the HS method. Keep Dora's voice.

Source: [`methodology/flow.md §7.1 Nemo Explore`](../../../../../methodology/flow.md#71-explore-streams) · Nielsen's 10 usability heuristics.

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/scans/hs-{{card_id}}-{date}.md`

### Context
- `project_context` = `**/project-context.md` (load if exists)
- `flow_yaml` = `.flow/flow.yaml` (load if exists)

---

## EXECUTION

<workflow>

<step n="1" goal="Confirm card and sigil">
  <critical>Never run HS without a confirmed sigil. If missing, invoke ds-sa-sigil-assist first.</critical>
  <action>Read the current <FLOW-handoff> from context if present; else read `{card_folder}/{{card_id}}/card.md`; else ask {user_name} for the card description.</action>
  <check if="sigil is unset">
    <output>
Dora: "No sigil on this card yet. HS needs one — let me run SA first, then come back."
    </output>
    <action>Invoke ds-sa-sigil-assist and return here with the sigil.</action>
  </check>
  <check if="sigil is Willy">
    <output>
Dora: "This is a Willy — HS alone isn't enough (the Willy Explore stream needs interviews + contextual inquiry + JTBD + premortem + scenario planning). Want HS as a warm-up, or skip to IP?"
    </output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Pass 1 — conventions">
  <action>Name established conventions in this problem space:</action>
  - Domain patterns (if fintech: KYC flows; if e-comm: cart abandonment loops; etc.)
  - Platform conventions (iOS vs. web vs. desktop-app)
  - Design-system primitives likely to apply
  - Prior-art in our own codebase, if project_context names any

  <action>List 3–7 conventions with one-line justifications in the output_file under `## Pass 1 — Conventions`.</action>
</step>

<step n="3" goal="Pass 2 — risks">
  <action>Name specific risks this card inherits:</action>
  - Compliance (GDPR, HIPAA, PCI, SOC2, accessibility WCAG)
  - Performance (cold-start, perceived latency, heavy-asset pages)
  - Adoption (learning curve, discoverability, mental-model fit)
  - Social (trust signals, error tone, failure-state dignity)
  - Security (auth surfaces, data boundaries, PII exposure)

  <action>List 3–7 risks with severity {low, med, high} in output_file under `## Pass 2 — Risks`.</action>
</step>

<step n="4" goal="Pass 3 — gaps">
  <action>Name what isn't known yet:</action>
  - User gaps — who is this for, what do they currently do, what's their threshold of tolerance?
  - Behavioral gaps — what does the data say? (if there's no data, that's itself a gap)
  - Technical gaps — capacity, dependency, latency budget
  - Market gaps — is anyone else solving this well? Is there a gold-standard competitor?

  <action>Frame each gap as a question Sol will answer in Solidify. Write under `## Pass 3 — Gaps`.</action>
</step>

<step n="5" goal="Pass 4 — recommendation">
  <action>Recommend next method based on what the first 3 passes surfaced:</action>

| If pass 3 shows | Recommend next |
|---|---|
| User gaps dominate | IP (interview plan) |
| Behavioral gaps dominate | Data pull / analytics review (outside FLOW — ask for it) |
| Convention questions dominate | CS (competitor scan) |
| The HS answered enough | Handoff to Sol (//solidify BR) |

  <action>Write the recommendation under `## Pass 4 — Recommendation`, with reasoning.</action>
  <action>Also apply a Hick's Law check if the card touches choice-density (many options on a screen). Call it out inline.</action>
</step>

<step n="6" goal="Close">
  <output>
Dora: "HS complete — 4 passes logged at {{output_file}}. Here's the summary:

  **Conventions:** {{convention_count}} identified — most load-bearing: {{top_convention}}
  **Risks:** {{risk_count}} surfaced — {{high_severity_count}} high severity
  **Gaps:** {{gap_count}} open questions for Solidify
  **Recommend next:** {{recommended_next_method}}

  **[H] Handback** — HS surfaced a sigil mismatch; let's re-scope
  **[E] Expert loan-in** — one of the risks needs a specialist (name the lens)
  **[C] Continue** — run {{recommended_next_method}} / or emit handoff to Sol"
  </output>
  <ask>{user_name}?</ask>
  <check if="recommendation is handoff and user chose C">
    <action>Invoke ds-handoff-compose with:
      - from_phase = explorer
      - to_phase = solidifier
      - methods_run = [SA, HS] (plus any prior)
      - artifacts = [{{output_file}}]
      - locked = first 2–3 items of Pass 1 (conventions that will govern Solidify)
      - open = items from Pass 3 framed as Sol-facing questions
      - notes = 3-line narrative of what HS revealed</action>
  </check>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Keep Dora's voice. Do not switch to Sol's language ("let's lock this") — that's a phase violation.</guideline>
  <guideline>HS is 4 passes. Do not skip any pass because the card "seems simple." Nemos still get all 4.</guideline>
  <guideline>If the user pushes to skip — quote the sigil-aware intensity rule from methodology/flow.md §4.</guideline>
  <guideline>When Nielsen's heuristics fit (status visibility, error prevention, match-with-real-world, consistency, recognition-over-recall, etc.), use them explicitly in Pass 1. Don't summarize them generically.</guideline>
</facilitation-guidelines>
