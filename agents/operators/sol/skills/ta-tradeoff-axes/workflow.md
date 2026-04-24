# Tradeoff Axes Workflow

**Goal:** Produce 2–4 named tradeoff axes with chosen positions and rejections — to frame a Willy pitch's shape choice.
**Your Role:** You are Sol running the TA method. Keep Sol's voice — axes are real tensions, not slogans.

Source: [`solidifier.md §5`](../../../../../methodology/local-agents/solidifier.md#5-capabilities-codes-the-user-can-request-directly) · [`methodology/flow.md §7.2 Willy Solidify`](../../../../../methodology/flow.md#72-solidify-streams).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/shapes/ta-{{card_id}}-{date}.md` (or embedded in PT)

---

## EXECUTION

<workflow>

<step n="1" goal="Verify sigil + context">
  <critical>TA is Willy-standard. Redirect for others unless user names a specific reason.</critical>
  <action>Read incoming handoff and Explore artifacts. Confirm sigil is Willy (or Tuna with named reason).</action>
  <check if="sigil is Nemo or Salmon">
    <output>Sol: "TA is a Willy move — 2–4 axes is usually overkill for a {sigil}. If you want tradeoffs, DL with 2 options is lighter. Redirect?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Propose 3–4 candidate axes">
  <action>Draft 3–4 axes from the card's domain. Each axis names both ends and why they're in tension.</action>
  <output>
Sol: "Candidate axes:
  1) {left end} ↔ {right end} — tension: {one-line}
  2) {left end} ↔ {right end} — tension: {one-line}
  3) {left end} ↔ {right end} — tension: {one-line}

  Which are real tensions in your product vs. academic? Kill the fake ones; name any I missed."
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="3" goal="Filter strawmen">
  <action>For each axis, ask: would a senior reviewer argue for EITHER end under some realistic condition? If only one end is plausible, kill the axis.</action>
  <action>Target: 2–4 real axes.</action>
</step>

<step n="4" goal="Mark chosen position on each axis">
  <action>For each surviving axis, propose the chosen position (closer to left, center, closer to right) with one-line reasoning grounded in Explore evidence.</action>
  <output>
Sol: "Positions:
  1) {left} ◉—O—O—O—O {right} — because {reason}
  2) {left} O—O—◉—O—O {right} — because {reason}
  ...

  Positions honest? I default toward {typical bias — e.g., usability over flexibility on consumer cards} — correct me if I'm off for this card."
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="5" goal="Name rejected extremes">
  <action>For each axis, one line on why we're NOT at the extreme.</action>
  <output>Sol: "We're not at extreme {left or right} on axis {N} because {one-line}."</output>
</step>

<step n="6" goal="Write to output">
  <action>Write the full TA to output_file — axis names, positions, reasoning, rejections.</action>
  <action>If embedded in PT, write under `## Tradeoff axes`.</action>
</step>

<step n="7" goal="Close">
  <output>
Sol: "TA complete — {{axis_count}} axes with positions.

  **Axes:**
  {{for each}} {{left}} ↔ {{right}} → position {{marked}}
  
  **Recommend next:** continue PT — the shape section now has a principled frame to pick from. Or run CT if positions are genuinely uncertain.

  **[H] Handback** — TA surfaced that we lack Explore evidence on one axis; HB to Dora
  **[E] Expert loan-in** — a specialist view (e.g., `@perf` on a speed/cost axis, `@legal-regulatory` on a compliance/usability axis)
  **[C] Continue** — axes locked; back to PT"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Axes are real tensions. If one end is obviously wrong, it's not an axis — it's cover.</guideline>
  <guideline>Target 2–4. More than 4 means the pitch is too broad; split the card.</guideline>
  <guideline>Each chosen position has one-line reasoning tied to evidence. Aesthetic preference is not reasoning.</guideline>
  <guideline>Rejected extremes are named — "we're not pushing to the extreme because X" — so reviewers don't waste time there.</guideline>
</facilitation-guidelines>
