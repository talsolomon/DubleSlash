# Handback Compose Workflow

**Goal:** Produce a validated reverse `<FLOW-handoff>` block when the current phase surfaces a gap in the previous phase.
**Your Role:** Stay in the calling operator's persona. A handback is a reverse transition, which per [`methodology/flow.md §11`](../../../methodology/flow.md#11-reverse-transitions-sigil-changes-skips) is **normal, narrated, and expected** — not a failure.

## INITIALIZATION

### Configuration Loading

Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`
- `{handoff_folder}` (default `.flow/handoffs`)
- `{card_folder}` (default `.flow/cards`)

### Inputs (passed by caller)

- `from_phase` — the phase currently running (the one sending work BACK)
- `to_phase` — the phase receiving the handback (must be the immediate predecessor, or an earlier phase with a sigil change — see step 2)
- `card_id`, `sigil`, `archetype` — as in the forward helper
- `reason` — structured: one of `{gap_in_shape, gap_in_framing, sigil_mismatch, scope_creep, technical_constraint_discovered, other}` + a freeform explanation
- `specific_gap` — what exactly the previous phase needs to revisit (the smallest well-scoped thing, not a rewrite request)
- `what_to_preserve` — list of strings from the previous phase's output that SHOULD NOT be touched
- `notes` — freeform narrative

### Context

- `project_context` = `**/project-context.md` (load if exists)
- The most recent forward handoff for this card — load from `{handoff_folder}` to understand what's being rewound.

---

## EXECUTION

<workflow>

<step n="1" goal="Validate this is actually a handback, not a sigil change">
  <critical>If the sigil has changed, this is a sigil-change event, not a handback. Different flow.</critical>
  <action>Compare current sigil to the sigil in the last forward handoff for this card.</action>
  <check if="sigil changed">
    <output>
{calling_persona}: "This looks like a sigil change ({{old_sigil}} → {{new_sigil}}), not a handback. The rule per flow.md §3.4 is: sigil change is announced, the current agent extends rather than reversing."
    </output>
    <action>HALT — caller should not use HB for sigil changes; extend the current phase instead.</action>
  </check>
</step>

<step n="2" goal="Validate direction">
  <action>Confirm (from_phase, to_phase) is a valid reverse: (solidifier, explorer), (builder, solidifier), (builder, explorer — only with explanation), (shipper, builder), (shipper, solidifier — rare), (shipper, explorer — next-loop is a forward handoff, not a handback).</action>
  <check if="to_phase skips a phase">
    <output>
{calling_persona}: "Reversing past two phases is unusual. Per flow.md §11, this needs an explicit explanation in the notes. I'll add a flag."
    </output>
    <action>Set `multi_phase_rewind: true` in the block.</action>
  </check>
</step>

<step n="3" goal="Scope the gap">
  <critical>A handback names the smallest well-scoped gap. It is NOT a "redo the whole phase" request.</critical>
  <action>Confirm `specific_gap` is a single identifiable thing, not a list of complaints.</action>
  <action>Confirm `what_to_preserve` is non-empty. The previous phase's output is mostly good; name what's kept.</action>
  <check if="specific_gap is vague or what_to_preserve is empty">
    <output>
{calling_persona}: "Let's sharpen the handback before I emit it. What specifically should {{to_phase}} revisit? And what from their output stays locked?"
    </output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="4" goal="Compose the block">
  <action>Render the block:</action>

```
<FLOW-handoff>
type: handback
from: {{from_phase}}
to: {{to_phase}}
card_id: {{card_id}}
sigil:
  certainty: {{sigil.certainty}}
  size: {{sigil.size}}
archetype: {{archetype}}
phase_exited: {{from_phase}}
reason:
  category: {{reason.category}}
  explanation: {{reason.explanation}}
specific_gap: {{specific_gap}}
what_to_preserve:
{{what_to_preserve_yaml}}
multi_phase_rewind: {{multi_phase_rewind | default false}}
notes: |
  {{notes}}
</FLOW-handoff>
```
</step>

<step n="5" goal="Persist + display">
  <action>Write the block to `{handoff_folder}/{{card_id}}-{{from_phase}}-HB-{{to_phase}}-{date}.handoff.md`.</action>
  <action>Append to `{card_folder}/{{card_id}}/history.log`: `{date} {{from_phase}}↩{{to_phase}} reason={{reason.category}}`.</action>
  <action>Display the block to {user_name}, then:</action>

```
{calling_persona}: "Handback emitted. {{from_phase}} → {{to_phase}}.
  Reason: {{reason.category}}.
  Preserved: {{what_to_preserve_count}} items from the previous phase.
  Next: paste the block into //{{to_phase}} so the previous operator can address the gap."
```
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Handbacks are normal. Do not apologize or frame as failure. Quote flow.md §11 if the user seems embarrassed.</guideline>
  <guideline>The "preserve" list matters as much as the "gap" list. A handback without preservation is a rewrite, and rewrites should be explicit new cards, not handbacks.</guideline>
  <guideline>Keep the gap specific. "Solidify was wrong" is not a gap; "the AC for the payment flow missed the 3DS redirect path" is a gap.</guideline>
</facilitation-guidelines>
