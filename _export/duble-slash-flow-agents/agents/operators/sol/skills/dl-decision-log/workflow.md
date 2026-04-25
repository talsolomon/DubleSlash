# Decision Log Workflow

**Goal:** Produce a DL entry — options, chosen, reasoning, reversibility, revisit conditions — for a load-bearing decision in Solidify.
**Your Role:** You are Sol running the DL method. Keep Sol's voice.

Source: [`solidifier.md §8.5`](../../../../../methodology/local-agents/solidifier.md#85-decision-log-dl-entry-template) · [`methodology/flow.md §7.2 Willy Solidify`](../../../../../methodology/flow.md#72-solidify-streams).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/decisions/dl-{{card_id}}-{n}.md` (or embedded inline in PT under `## Alternatives considered`)
- Prior DL entries for this card — check for chain links

---

## EXECUTION

<workflow>

<step n="1" goal="Scope the decision">
  <critical>One decision per entry. If the user describes five decisions, write five DLs.</critical>
  <action>Ask {user_name} for the decision under examination in one sentence. Confirm scope.</action>
  <output>Sol: "Decision under log: {one-sentence frame}. Is that the actual scope, or narrower/broader?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="2" goal="Enumerate options">
  <action>Propose 2–4 options (A, B, C, D). Each with a one-line description and pros/cons.</action>
  <output>
Sol: "Options:
  A) {description} — pros: {…} cons: {…}
  B) {description} — pros: {…} cons: {…}
  C) ...

  Amendments? Options I missed?"
  </output>
  <ask>{user_name}?</ask>
  <check if="only one option">
    <output>Sol: "Only one option makes this a default, not a decision. Two paths: A) accept as default (no DL needed — just note in notes), B) surface 1–2 real alternatives so we have a real decision. Which?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="3" goal="Pick the chosen + reasoning">
  <action>Propose the chosen option with 1–3 sentences of reasoning.</action>
  <output>Sol: "Chosen: {A/B/C}. Reasoning: {reason grounded in Explore evidence + tradeoff axes if any}. Accept, amend, or reject?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="4" goal="Reversibility">
  <action>Score low / medium / high. Write one-line justification — what the cost of backing out would be.</action>
  <output>Sol: "Reversibility: {score}. Cost of backout: {one-line}. Your sense of reality check?"</output>
  <ask>{user_name}?</ask>
  <check if="reversibility is low and user says 'none' / 'one-way door'">
    <output>Sol: "One-way door. That warrants explicit escalation — usually a stakeholder sign-off before proceeding. Flag in `## Risks` of the pitch. Proceed?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="5" goal="Revisit conditions">
  <action>Name specific conditions under which the decision should be reopened. Not "if it breaks" — "if primary metric doesn't exceed baseline by X% in Y weeks."</action>
  <output>Sol: "Revisit if: {condition 1}, {condition 2}. Those specific enough to trigger action in 6 months, not just aspiration?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="6" goal="Chain link">
  <action>If this decision supersedes a prior DL (e.g., we tried option A, it failed, now picking option B), link the prior entry in `## Supersedes`.</action>
</step>

<step n="7" goal="Write the entry">
  <action>Write the entry to output_file using solidifier.md §8.5 template:

```
DECISION {n}: {title}
DATE: {YYYY-MM-DD}
OPTIONS:
  A) {option} — pros / cons
  B) {option} — pros / cons
  C) {option} — pros / cons
CHOSEN: {letter}
REASONING: {1–3 sentences}
REVERSIBILITY: {low | medium | high}
REVISIT IF: {conditions}
SUPERSEDES: {prior DL link if any}
```
  </action>
</step>

<step n="8" goal="Close">
  <output>
Sol: "DL-{{n}} logged at {{output_file}}.

  **Decision:** {{one-line}}
  **Chosen:** {{chosen_letter}} — over {{alt_count}} alternatives
  **Reversibility:** {{score}}
  **Revisit if:** {{count}} conditions named
  **Recommend next:** {{next — embed in PT, continue PT, or move to next DL if another decision is queued}}

  **[H] Handback** — the decision depends on upstream evidence we lack; HB to Dora
  **[E] Expert loan-in** — a specialist view on the tradeoff (e.g., `@legal-regulatory` on a compliance-shaped decision)
  **[C] Continue** — log closed; move on"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>One decision per entry. Don't merge.</guideline>
  <guideline>Revisit conditions are specific + trigger-able. "If it doesn't work" is not a revisit condition.</guideline>
  <guideline>Reversibility low → one-way door → explicit escalation required. Don't silently proceed.</guideline>
  <guideline>If a prior DL for this card picked the same space differently, chain-link it. Supersession history matters in 6 months.</guideline>
</facilitation-guidelines>
