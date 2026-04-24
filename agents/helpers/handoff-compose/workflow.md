# Handoff Compose Workflow

**Goal:** Produce a validated `<FLOW-handoff>` block for a forward phase transition.
**Your Role:** Stay in the calling operator's persona (Dora, Sol, Bran, or May). This helper runs *through* them, not as its own voice.

The canonical schema is in [`methodology/flow.md §9`](../../../methodology/flow.md#9-the-flow-handoff-block). This helper is its executable implementation.

## INITIALIZATION

### Configuration Loading

Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`
- `{handoff_folder}` (default `.flow/handoffs`)
- `{card_folder}` (default `.flow/cards`)

### Inputs (passed by caller)

- `from_phase` — explorer | solidifier | builder | shipper
- `to_phase` — explorer | solidifier | builder | shipper (reverse is the handback helper, not this one)
- `card_id` — stable card identifier
- `sigil` — `{certainty, size}` pair (certainty listed first — see flow.md §3.1)
- `archetype` — nemo | tuna | salmon | willy
- `methods_run` — list of method codes executed in this phase
- `artifacts` — list of file paths (relative to repo root)
- `decisions` — list of strings; each is a decision made and its reasoning
- `locked` — list of strings the next phase must treat as non-negotiable
- `open` — list of strings the next phase must resolve
- `confidence_to_advance` — float in [0.0, 1.0]
- `notes` — freeform multi-line narrative

### Context

- `project_context` = `**/project-context.md` (load if exists, for tone cues)
- `flow_yaml` = `.flow/flow.yaml` (load if exists, for team overrides)

---

## EXECUTION

<workflow>

<step n="1" goal="Validate the forward direction">
  <critical>This helper only emits FORWARD handoffs. Reverse transitions (HB) call ds-handback-compose instead.</critical>
  <action>Check that (from_phase, to_phase) is one of: (explorer, solidifier), (solidifier, builder), (builder, shipper), (shipper, explorer — next loop only).</action>
  <check if="direction is not forward">
    <action>HALT — instruct caller to invoke ds-handback-compose or ds-sigil-change-compose.</action>
  </check>
  <check if="to_phase == explorer and from_phase != shipper">
    <action>HALT — reaching Explore from any phase other than Ship is a handback, not a handoff.</action>
  </check>
</step>

<step n="2" goal="Check sigil-method coverage">
  <critical>A handoff is refused if the phase's methods for this archetype haven't been run or explicitly deferred.</critical>
  <action>Load the phase/archetype cell from `methodology/flow.md §6` (the archetype × phase matrix).</action>
  <action>For each method listed in the cell, confirm it appears in `methods_run` OR is listed in `notes` with an explicit deferral reason.</action>
  <check if="any required method is neither run nor deferred">
    <output>
{calling_persona}: "Before I can emit the handoff, I need to cover: {{missing_methods}}. Want to run them now, or defer each with a reason in the notes?"
    </output>
    <ask>{user_name}, run or defer?</ask>
  </check>
</step>

<step n="3" goal="Validate the required fields">
  <action>Confirm every required field is present and non-empty: from_phase, to_phase, card_id, sigil, archetype, phase_exited, locked (≥1 item), artifacts (≥1 path).</action>
  <action>`open` may be empty ONLY for Nemo Solidify → Build (Nemo Solidify empties the list, per flow.md §7.2).</action>
  <action>`confidence_to_advance` must be in [0.0, 1.0].</action>
  <check if="any required field is missing or invalid">
    <output>
{calling_persona}: "The handoff isn't quite ready — I'm missing {{missing_fields}}. Let me fix this and try again."
    </output>
    <action>HALT and return control to the calling workflow.</action>
  </check>
</step>

<step n="4" goal="Verify artifact files exist">
  <action>For each path in `artifacts`, check the file exists on disk (relative to project-root).</action>
  <check if="any artifact path is missing">
    <output>
{calling_persona}: "One of the artifacts I listed isn't actually on disk: {{missing_paths}}. Either create the file or remove it from the list."
    </output>
    <action>HALT and return control.</action>
  </check>
</step>

<step n="5" goal="Compose the block">
  <action>Render the block in the canonical format from flow.md §9:</action>

```
<FLOW-handoff>
from: {{from_phase}}
to: {{to_phase}}
card_id: {{card_id}}
sigil:
  certainty: {{sigil.certainty}}
  size: {{sigil.size}}
archetype: {{archetype}}
phase_exited: {{from_phase}}
methods_run: {{methods_run}}
locked:
{{locked_list_yaml}}
open:
{{open_list_yaml}}
artifacts:
{{artifacts_list_yaml}}
decisions:
{{decisions_list_yaml}}
confidence_to_advance: {{confidence_to_advance}}
notes: |
  {{notes}}
</FLOW-handoff>
```

  <action>Strings containing quotes or colons MUST be wrapped in double quotes per YAML rules.</action>
</step>

<step n="6" goal="Persist + display">
  <action>Write the block to `{handoff_folder}/{{card_id}}-{{from_phase}}-to-{{to_phase}}-{date}.handoff.md` (create folder if absent).</action>
  <action>Append a one-line entry to `{card_folder}/{{card_id}}/history.log`: `{date} {{from_phase}}→{{to_phase}} confidence={{confidence_to_advance}}`.</action>
  <action>Display the full block to {user_name} inline, followed by three short lines:</action>

```
{calling_persona}: "Handoff emitted. {{from_phase}} → {{to_phase}}.
  - Saved: {{handoff_path}}
  - Next: paste the block into //{{to_phase}} when you're ready.
  - Want me to run //{{to_phase}} now, or hand back to you?"
```

  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Stay in the calling operator's voice. This helper is not a separate persona — it is Dora/Sol/Bran/May running the HO method.</guideline>
  <guideline>Refuse to emit on missing required methods. Quoting the §6 cell is not pedantic — it is the whole point of the matrix being prescriptive.</guideline>
  <guideline>Confidence ratings below 0.5 are legitimate. They signal to the next operator that the handoff is tentative. Do not inflate.</guideline>
  <guideline>If `methods_run` is empty, something is wrong — the calling workflow is handing off before doing any work. Refuse and return control.</guideline>
</facilitation-guidelines>
