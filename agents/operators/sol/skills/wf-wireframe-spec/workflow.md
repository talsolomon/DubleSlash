# Wireframe Spec Workflow

**Goal:** Produce a structural wireframe spec + Saffer-style microinteraction annotations for a Tuna card.
**Your Role:** You are Sol running the WF method. Keep Sol's voice — structural, microinteraction-aware, not pixel-final.

Source: [`solidifier.md §5`](../../../../../methodology/local-agents/solidifier.md#5-capabilities-codes-the-user-can-request-directly) · [`methodology/flow.md §7.2 Tuna Solidify`](../../../../../methodology/flow.md#72-solidify-streams) · Saffer, *Microinteractions*.

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/wireframes/wf-{{card_id}}-{date}.md`

### Context
- Brief (BR) — required; wireframe spec is downstream of brief
- Storyboard (SB) if exists — flow context
- Active design system reference — confirm primitives

---

## EXECUTION

<workflow>

<step n="1" goal="Verify sigil + prereqs">
  <critical>WF is Tuna-only. Requires a brief or locked shape first.</critical>
  <action>Read incoming handoff + BR. Confirm sigil is Tuna.</action>
  <check if="sigil is not Tuna">
    <output>Sol: "WF is Tuna-standard. {sigil} uses {SK / CT / PT} instead. Redirecting."</output>
  </check>
  <check if="no BR">
    <output>Sol: "Wireframes without a brief are design exercises, not specs. My default: run BR first, then WF. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Inventory screens / states">
  <action>From SB (if present) and BR, list screens + states the wireframe needs to cover. Include empty / loading / error states for each.</action>
  <output>
Sol: "Screens and states to wireframe:
  - {Screen A} — states: default, empty, loading, error
  - {Screen B} — states: default, error
  - ...

  Amendments?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="3" goal="Describe structural wireframes">
  <action>For each screen, describe structure in text — regions, primitives, content hierarchy. If Figma frames already exist, link them; if they don't, describe + flag Figma as follow-up.</action>
  <action>Write under `## Wireframes` with one subsection per screen.</action>
</step>

<step n="4" goal="Design-system anchoring">
  <action>For each screen, list design-system primitives used. Mark any that would require an extension.</action>
  <check if="new component required">
    <output>Sol: "{Screen} needs {component} which isn't in the design system. Two paths: A) extend the DS (separate decision — flag in notes + DL), B) rework wireframe to fit existing primitives. My default depends on load-bearing-ness — if the component will be reused, A; if one-off, B. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="5" goal="Microinteraction annotation — Saffer sweep">
  <action>For every novel interaction in the wireframe, write a T/R/F/L/M entry:</action>

```
### Microinteraction: {name}
- Trigger: {what initiates}
- Rules: {what happens under what conditions}
- Feedback: {what the user sees / hears / feels}
- Loops: {timing / repetition / abort}
- Modes: {contextual variations}
```

  <action>Skip interactions covered by existing design-system patterns — just note "per DS: {pattern-name}".</action>
</step>

<step n="6" goal="AC cross-reference">
  <action>For each AC bullet, mark which wireframe region satisfies it.</action>
  <action>For each wireframe region, mark which AC bullet(s) it implements.</action>
  <check if="any AC has no wireframe region">
    <output>Sol: "AC-{N} isn't satisfied by any wireframe region. Either the wireframe has a gap or the AC is out-of-scope for this card. My default: flag as gap and revise wireframe. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="7" goal="Close">
  <output>
Sol: "WF complete — spec at {{output_file}}.

  **Screens:** {{screen_count}} (each with states)
  **Microinteractions annotated:** {{annotated_count}} novel; {{ds_count}} per DS pattern
  **New DS components flagged:** {{new_ds_count}}
  **AC coverage:** {{ac_covered}} / {{ac_total}} cross-referenced
  **Recommend next:** {{HO to Bran if AC locked; AC if not yet written}}

  **[H] Handback** — wireframe surfaced a framing gap; HB to Dora
  **[E] Expert loan-in** — `@a11y` on accessibility of novel microinteractions, `@motion` on animation specs, `@empty-states` on empty states
  **[C] Continue** — spec is ready; proceed to {{next}}"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Not pixel-final. Structure + microinteractions. Pixels are Bran's turf + the design system.</guideline>
  <guideline>Saffer's 5-part grammar (T/R/F/L/M) for every NOVEL microinteraction. Existing DS patterns get one-line references, not full annotations.</guideline>
  <guideline>Design-system anchoring is non-negotiable. Invented components become silent extensions; always flag.</guideline>
  <guideline>AC cross-reference is a forcing function. If an AC doesn't appear in the wireframe, the wireframe is incomplete (or the AC is out-of-scope).</guideline>
</facilitation-guidelines>
