# Stream Recap Workflow

**Goal:** Produce a short (≤ 150 words) narrative of what happened in this card's Explore phase. Readable in 30 seconds by a teammate picking up cold.
**Your Role:** You are Dora running SR. This recap ships in the `notes` field of the outbound `<FLOW-handoff>` block.

Source: [`methodology/flow.md §8.12`](../../../../../methodology/flow.md#812-handoff--process) — Stream Recap entry · [`§9`](../../../../../methodology/flow.md#9-the-flow-handoff-block) — the `notes` field.

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{card_folder}`

### Inputs
- `card_id` — the active card
- `methods_run` — ordered list of Explore methods run for this card
- Prior outputs for each method (HS output, HMW output, JM output, etc.)

---

## EXECUTION

<workflow>

<step n="1" goal="Gather the trail">
  <action>Read `{card_folder}/{{card_id}}/history.log` to list every method run and its order.</action>
  <action>For each method, read the one-line takeaway from its output file's front section.</action>
</step>

<step n="2" goal="Draft the recap — 4 sentences max">
  <action>Follow this template:</action>

```
Ran {{method_count}} method(s) at {{archetype}}-intensity: {{method_list_with_abbreviations}}.
{{key_finding_1_one_sentence}}
{{key_finding_2_one_sentence_optional}}
{{deferred_or_open_item_one_sentence}}
Confidence to advance to Solidify: {{confidence_0_to_1}}.
```

  <action>Strict word budget: ≤ 150 words total. If the recap runs over, something is too detailed for SR (push it into a method's own output, not the recap).</action>
</step>

<step n="3" goal="Check for phase-violation smells">
  <critical>SR is a summary of Explore. It must not contain Solidify language (AC, brief, ADR, decision log).</critical>
  <action>Re-read the recap. If it reads like a brief, rewrite. Dora narrates findings, not shapes.</action>
</step>

<step n="4" goal="Offer where to attach the recap">
  <output>
Dora: "Stream recap ({{word_count}} words):

  ---
  {{recap_text}}
  ---

  [H] Handback — the recap reveals a gap I want to close before handoff
  [E] Expert loan-in — a finding in the recap needs domain voice
  [C] Continue — attach to the outbound <FLOW-handoff> notes field and emit via HO"
  </output>
  <ask>{user_name}?</ask>
  <check if="C">
    <action>Pass the recap text to ds-handoff-compose as the `notes` input.</action>
  </check>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Short is a feature. A 400-word recap isn't a recap; it's a report. If it's long, it's the wrong artifact.</guideline>
  <guideline>Name the method codes by abbreviation (HS, HMW, IP, PM) — that's what the handoff reader will recognize.</guideline>
  <guideline>Include the confidence score. Unconfident handoffs are legitimate; pretending confidence is not.</guideline>
</facilitation-guidelines>
