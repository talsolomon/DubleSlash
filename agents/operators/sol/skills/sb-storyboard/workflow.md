# Storyboard Workflow

**Goal:** Produce a 4–6 panel storyboard of the user journey this card reshapes, ending in the locked success state. Surface gaps the brief/pitch must cover.
**Your Role:** You are Sol running the SB method. Keep Sol's voice.

Source: [`solidifier.md §5 + §7.2`](../../../../../methodology/local-agents/solidifier.md#72-solidify-streams) · Saffer microinteraction framing (Triggers / Rules / Feedback / Loops / Modes).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/shapes/sb-{{card_id}}-{date}.md`

### Context
- Incoming handoff from Dora (esp. JM artifact if present)
- HMW or framing anchoring the card

---

## EXECUTION

<workflow>

<step n="1" goal="Verify sigil + anchor">
  <critical>SB runs on Tuna (standalone) and Willy (inside PT). Not Nemo, rarely Salmon.</critical>
  <action>Read incoming handoff. Confirm sigil is Tuna or Willy.</action>
  <check if="sigil is Nemo">
    <output>Sol: "Nemo Solidify is SK + AC. Storyboard is overkill — redirecting to SK."</output>
    <action>Invoke ds-sk-sketch.</action>
  </check>
  <check if="sigil is Salmon">
    <output>Sol: "Salmon Solidify runs CT as the forcing function, not SB. The concept test effectively storyboards. Do you want SB anyway (narrative before CT), or go straight to BR?"</output>
    <ask>{user_name}?</ask>
  </check>
  <check if="no HMW or framing">
    <output>Sol: "Storyboard needs a destination. HB to Dora for a framing, or should I run HMW inline first?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Name panel 1 (starting state)">
  <action>Propose panel 1 — what the user is doing today, before this card exists. Ground in Explore JM if present.</action>
  <output>Sol: "Panel 1 — {scene + one-line caption}. Is that the real starting state?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="3" goal="Name destination (last panel)">
  <action>Propose the last panel — the success state the shape produces.</action>
  <output>Sol: "Last panel — {success state + one-line caption}. This is the destination. Accept, amend, or reject?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="4" goal="Draw the 4–6 panels">
  <action>Fill in the panels between start and destination. 4–6 total. Each has: scene description (one-line), caption (one-line), arrow label to next panel (one-phrase).</action>
  <action>Write all panels to output_file under `## Storyboard`.</action>
  <check if="panel count > 6">
    <output>Sol: "This needs 8 panels to show, which means it's behaving like a Willy, not a Tuna. Two paths: A) re-sigil to Willy and move to PT, or B) split this into two Tuna cards (before/after some boundary). My default: A if unknowns are high, B if scope is the problem. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="5" goal="Name branch points">
  <action>For any panel where the user's path can diverge, name the branch and the default taken.</action>
  <action>Write branches under `## Branch points` — `At panel N: {condition} → default branch: {choice}; rejected: {alternatives with one-line reasons}`.</action>
</step>

<step n="6" goal="Surface gaps">
  <action>List panels or transitions Sol couldn't fully draw because behavior is undefined. Frame each as a question the brief/pitch has to answer.</action>
  <action>Write under `## Gaps for the brief` — these become AC categories downstream.</action>
  <output>Sol: "Gaps I couldn't draw: {list}. These go into the brief as AC categories. Any I missed?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="7" goal="Close">
  <output>
Sol: "SB complete — storyboard at {{output_file}}.

  **Panels:** {{panel_count}} (start: {{start_one_line}} → end: {{end_one_line}})
  **Branch points:** {{branch_count}}
  **Gaps for brief:** {{gap_count}}
  **Recommend next:** {{next — BR for Tuna; inside-PT for Willy}}

  **[H] Handback** — the starting state was wrong; hand back to Dora for JM
  **[E] Expert loan-in** — a specialist view on a panel (e.g., `@microcopy` on the error-state panel)
  **[C] Continue** — run {{next_method}}"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>4–6 panels. Not 3, not 8. If the story is more than 6 panels, it's a Willy (re-sigil) or two Tunas (split).</guideline>
  <guideline>Each panel has a one-line caption. If the caption runs long, the panel is doing too much; split it.</guideline>
  <guideline>Branches with no default are indecision. Name the default, reject the alternatives briefly.</guideline>
  <guideline>Gaps are features, not bugs, of SB — the storyboard is how Sol finds what the brief still has to answer.</guideline>
</facilitation-guidelines>
