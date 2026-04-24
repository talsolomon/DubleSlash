# Measurement Plan Workflow

**Goal:** Produce a measurement plan with one primary metric, one guardrail, baseline, target, instrumentation, readout, and stop-the-line threshold.
**Your Role:** You are Sol running the MP method. Keep Sol's voice — metric-specific, numeric, no vibes.

Source: [`solidifier.md §8.4`](../../../../../methodology/local-agents/solidifier.md#84-measurement-plan-mp-template--salmon--willy) · [`methodology/flow.md §5 phase exits`](../../../../../methodology/flow.md).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/mp/mp-{{card_id}}-{date}.md` (or embedded inline in BR / PT)

---

## EXECUTION

<workflow>

<step n="1" goal="Verify sigil + shape">
  <critical>MP refused on Nemo. MP required on Salmon + Willy. No MP without a shape to measure.</critical>
  <action>Read incoming handoff / BR / PT. Confirm sigil is Salmon or Willy.</action>
  <check if="sigil is Nemo">
    <output>Sol: "Nemo doesn't warrant an MP — gold-plating. Nemo's measurement is 'does it work? did I break anything?' — a checklist, not an MP. Refusing MP."</output>
    <action>End.</action>
  </check>
  <check if="no shape">
    <output>Sol: "MP measures a shape. No shape yet. My default: run {BR for Salmon, PT for Willy} first. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Propose primary metric">
  <action>Propose one primary metric grounded in Explore evidence (what Dora's interviews / JM / HS surfaced about the user's intended outcome).</action>
  <output>
Sol: "Primary metric: {metric_name}, because {one-sentence why}. Alternatives considered: {A, B} — rejected because {one-line each}. Accept, amend, or reject?"
  </output>
  <ask>{user_name}?</ask>
  <check if="proposed metric is a proxy for 'we shipped'">
    <action>Push back explicitly — "launch rate" isn't a metric.</action>
  </check>
</step>

<step n="3" goal="Propose guardrail metric">
  <action>Propose one metric that must NOT regress while the primary moves (e.g., error rate, latency, per-segment engagement).</action>
  <output>Sol: "Guardrail: {metric_name}. Amendment?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="4" goal="Baseline">
  <action>If data source is known, state the baseline value + timeframe. Otherwise "unknown — measure pre-release" and name the pre-release measurement move.</action>
  <output>Sol: "Baseline: {value or 'unknown — pre-release measurement needed'}. Source: {data source}. Accept?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="5" goal="Target">
  <action>Propose a specific number + timeframe. "Directionally up" is not a target.</action>
  <output>Sol: "Target: {primary} → {value} in {timeframe}. Accept, amend, or reject?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="6" goal="Instrumentation">
  <action>Name events, triggers, properties. Align to your telemetry conventions.</action>
  <output>
```
event: {name}
fires on: {trigger}
properties: {fields}
```
  </output>
  <action>Write under `## Instrumentation`. One entry per event required by the AC.</action>
</step>

<step n="7" goal="Readout">
  <action>Name who reads the measurement, when, where. Don't leave it ambient.</action>
  <output>Sol: "Readout: {owner} reads {cadence} at {venue/dashboard}. Confirm?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="8" goal="Stop-the-line">
  <action>Propose a guardrail threshold that triggers rollback or a halt decision.</action>
  <output>
Sol: "Stop-the-line: if {guardrail} drops below {value} for {duration}, we {rollback / pause staged rollout / convene decision}. Threshold honest against your tolerance?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="9" goal="Willy — per-stage overlay">
  <check if="sigil is Willy">
    <action>Split the MP by rollout stage. Each stage has its own target threshold that gates advancement.</action>
    <action>Write `### Per-stage targets`:
      - Internal: {threshold}
      - Alpha: {threshold}
      - Beta: {threshold}
      - GA: {threshold}
    </action>
  </check>
</step>

<step n="10" goal="Close">
  <output>
Sol: "MP complete — plan at {{output_file}}.

  **Primary:** {{primary_metric}} — target {{target}}
  **Guardrail:** {{guardrail}} — stop-the-line {{stop_threshold}}
  **Baseline:** {{baseline or pre-release-measured}}
  **Instrumentation:** {{hook_count}} events named
  **Readout:** {{owner}}, {{cadence}}, {{venue}}
  **Recommend next:** {{AC if not yet written; HO if all shape/AC/MP complete}}

  **[H] Handback** — baseline requires data we don't have; HB to Dora for a data pull
  **[E] Expert loan-in** — `@measurement` to pressure-test metric choice, `@a-b-test` if this should be an experiment instead of a rollout
  **[C] Continue** — MP is tight; proceed to {{next_method}}"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>One primary. Not five. If tempted to pick five, you have five cards, not one.</guideline>
  <guideline>Targets are numeric + timeframed. "Directionally up" is vibes, not a target.</guideline>
  <guideline>Stop-the-line is non-optional on Salmon/Willy. A plan with no stop condition ships unaccountable.</guideline>
  <guideline>If the baseline is unknown, the "measure pre-release" step is the baseline; name it as a required pre-release action.</guideline>
  <guideline>Nemo MP is refused. Don't capitulate.</guideline>
</facilitation-guidelines>
