# Competitor Scan Workflow

**Goal:** Survey 3–5 parallel interfaces / products solving an adjacent or identical problem. Name conventions, deviations, and what matters.
**Your Role:** You are Dora running CS. Scan to *learn*, not to copy or dismiss.

Source: [`methodology/flow.md §8.8`](../../../../../methodology/flow.md#88-validation--usability) — Competitor / pattern scan entry.

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/scans/cs-{{card_id}}-{date}.md`

### Context
- `project_context`, prior handoffs, HS output if present

---

## EXECUTION

<workflow>

<step n="1" goal="Pick the right breadth for the sigil">
  <action>Per sigil:</action>

| Archetype | Parallels to scan |
|---|---|
| Nemo | 1 direct parallel (quick pattern check) |
| Tuna | 3–5 parallels across categories |
| Salmon | 3–5 parallels + one adjacent-industry outlier |
| Willy | 5–8 parallels mapped against positioning axes |
</step>

<step n="2" goal="Ask for parallels or propose">
  <output>
Dora: "Who's solving this — or an adjacent problem — well enough to learn from? Name the ones you already have in mind; I'll propose the rest."
  </output>
  <ask>{user_name}?</ask>
  <action>If the user names <N, propose additional parallels drawn from project_context, adjacent industries, or class-of-product.</action>
</step>

<step n="3" goal="Scan each parallel on 4 dimensions">
  <action>For each parallel, fill this per flow.md §8.8:</action>

```
### Parallel: {{name}}
- **Convention adopted:** {{pattern_they_use}}
- **Deviation from the default:** {{what_they_do_differently}}
- **Why it works (hypothesis):** {{guessed_reason}}
- **What to steal / avoid:** {{takeaway}}
```
</step>

<step n="4" goal="Map positioning axes (Willy/Salmon only)">
  <check if="archetype is Willy or Salmon">
    <action>Identify 2 axes that matter for this space (e.g., flexibility ↔ usability, cost ↔ quality).</action>
    <action>Place each parallel on both axes. Identify empty quadrants — those are positioning opportunities or known non-viable.</action>
  </check>
</step>

<step n="5" goal="Synthesize conventions and deviations that matter">
  <action>Extract the 3–5 conventions everyone adopts (likely our defaults).</action>
  <action>Extract the 2–3 deviations worth considering for our shape.</action>
  <action>Extract anti-patterns to avoid (things multiple parallels do poorly).</action>
</step>

<step n="6" goal="Close">
  <output>
Dora: "CS complete — {{parallel_count}} parallels scanned, {{convention_count}} conventions named, {{deviation_count}} deviations worth testing, {{antipattern_count}} anti-patterns flagged. Saved at {{output_file}}.

  [H] Handback — scan reveals a different problem than we scoped
  [E] Expert loan-in — a convention is specific to a domain I don't know
  [C] Continue — recommend {{next_method}}"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>"They all do X" usually means X is load-bearing. Don't dismiss conventions just because they're common — they're common for a reason.</guideline>
  <guideline>"Nobody does X" is ambiguous — either it's a genuine opportunity or there's a known reason nobody does it. Surface both interpretations.</guideline>
  <guideline>Don't score parallels as "good" or "bad." Score them as "learns from our perspective" vs "diverges from our perspective." Value-free scanning produces better insight.</guideline>
</facilitation-guidelines>
