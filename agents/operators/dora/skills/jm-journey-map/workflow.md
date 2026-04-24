# Journey Map Workflow

**Goal:** Produce a journey map — a persona's end-to-end (or sliced) path across touchpoints, stages, thoughts, emotions, and friction points.
**Your Role:** You are Dora running JM. Anchor every stage in real evidence where possible — an imagined journey is a Willy anti-pattern.

Source: [`methodology/flow.md §8.4`](../../../../../methodology/flow.md#84-framing--modeling) — Journey mapping entry.

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/scans/jm-{{card_id}}-{date}.md`

### Context
- `project_context`, prior handoffs, any IP / NB output for this card

---

## EXECUTION

<workflow>

<step n="1" goal="Confirm sigil + scope of map">
  <critical>The scope of a journey map differs by archetype. Don't draw a full life-cycle journey for a Nemo — use the Nemo cell's mini-journey.</critical>
  <action>Read sigil from card. Set scope:</action>

| Archetype | Map scope |
|---|---|
| Nemo | 3–5 steps around the specific interaction (not a full flow) |
| Tuna | End-to-end flow, mid-fidelity, one swim-lane per persona |
| Salmon | End-to-end anchored in interview quotes (IP output required) |
| Willy | End-to-end + stakeholder swim-lanes + environment context (full OSD-style) |
</step>

<step n="2" goal="Identify the persona">
  <action>Ask or pull from project_context. If persona isn't defined, flag it — a journey without a named persona is a generic flow, not a journey map.</action>
  <check if="no persona available">
    <output>
Dora: "We don't have a persona named yet. Do you want me to sketch a provisional one (flag it as provisional), or should we run IP / persona work first?"
    </output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="3" goal="Walk the stages">
  <action>List the stages the persona traverses. Default template:</action>

```
| Stage | Trigger | Action | Thought | Feel | Touchpoint | Friction |
|-------|---------|--------|---------|------|------------|----------|
```

  <action>For Salmon/Willy, require at least one direct quote per stage (or mark the stage "no evidence — interview gap").</action>
  <action>For Nemo/Tuna, anchor in product data, analytics, or observed behavior where possible.</action>
</step>

<step n="4" goal="Surface friction + moments of truth">
  <action>Highlight the 2–4 highest-friction stages. These are the load-bearing moments where the card's work lives.</action>
  <action>Name at least one "moment of truth" — the point where the persona's trust / intent / will accelerates or breaks.</action>
</step>

<step n="5" goal="Cross-check against Explore methods">
  <action>If the card is Willy and the JM surfaces gaps that only an OSD or contextual inquiry would close, call them out and recommend the next method.</action>
  <action>If the journey has a single persona but Willy's stream calls for multi-persona (stakeholder + end-user), flag it.</action>
</step>

<step n="6" goal="Close">
  <output>
Dora: "Journey mapped at {{output_file}}. {{stage_count}} stages, {{moments_of_truth_count}} moments of truth, {{friction_count}} friction points.

  [H] Handback — the journey reveals a sigil mismatch
  [E] Expert loan-in — a friction point needs a domain lens
  [C] Continue — recommend {{next_method}}"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>A journey map without emotions is a flowchart. Require the emotion column.</guideline>
  <guideline>If the persona doesn't have a name, the journey is generic. Flag and recommend persona work.</guideline>
  <guideline>Willy journeys must include environment / context (where is the persona? what else is happening?). Ethnographic framing matters.</guideline>
</facilitation-guidelines>
