# Release Notes Workflow

**Goal:** Draft journey-structured release notes — title, "what you can do now", "why", "known limits", "measurement". Tuna and Willy. Drafted only.
**Your Role:** You are May running the RN method. Keep May's voice — narrative, journey-framed, honest.

Source: [`shipper.md §5 + §8.1`](../../../../../methodology/local-agents/shipper.md#5-capabilities-codes-the-user-can-request-directly).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/releases/rn-{{card_id}}-{version}.md`
- `card_history` = `{project-root}/.flow/cards/{{card_id}}/history.log`

### Context
- Brief / pitch artifact (for the *why*)
- Bran's exit handoff `notes` + `open`
- MP if Salmon/Willy (for measurement section)

---

## EXECUTION

<workflow>

<step n="1" goal="Verify RN appropriate">
  <check if="sigil is Nemo or Salmon">
    <output>May: "RN is Tuna/Willy. {Nemo: CH 1-liner is enough. | Salmon: changelog at release + learning log post-readout — RN adds nothing.} Skip RN, proceed to {next}?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Draft title">
  <action>Journey-framed, outcome verb, customer-readable. Not "v1.4.0" or "PeriodGroup release"; "Download a year of billing in one click" or "Two-step checkout."</action>
  <output>May: "RN title: '{title}'. Journey-framed? Outcome verb? Match how a customer would describe this to themselves?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="3" goal="Draft 'What you can do now'">
  <action>1–3 bullets. Each bullet: outcome verb + user surface. No component names, no file paths, no internal jargon.</action>
  <output>
May: "## What you can do now
- {bullet 1}
- {bullet 2}
- {bullet 3 — optional}

Match how customers think about this?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="4" goal="Draft 'Why we changed it'">
  <action>1–2 sentences from the brief / pitch. The user-need framing — what was painful before, what we believed.</action>
  <output>
May: "## Why we changed it
{1–2 sentences}

Captures the user pain honestly?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="5" goal="Draft 'Known limits / follow-ups'">
  <action>Walk Bran's `open` list. Customer-relevant items get surfaced; internal items don't. Honest — hidden gaps surface in support tickets.</action>
  <output>
May: "## Known limits / follow-ups
- {item} — {what it means for the customer}
- {item} — {one-line, honest}

OK? (My instinct is to surface these — hidden limits are worse than acknowledged ones.)"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="6" goal="Add Measurement section (Salmon/Willy)">
  <check if="sigil is Salmon or Willy">
    <action>Pull MP. Compose: primary metric + baseline + target + readout date.</action>
    <output>
May: "## Measurement
**Primary metric:** {metric_name}
**Baseline:** {baseline value or 'capturing pre-release'}
**Target:** {target value}
**Readout:** {date — typically release date + 2 weeks}

Sane?"
    </output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="7" goal="Add Engineering changelog reference (if separate)">
  <action>If repo has a separate engineering CHANGELOG, add a line at the bottom: "Engineering changelog: {path or link}".</action>
</step>

<step n="8" goal="Write to disk">
  <action>Compose the assembled RN. Write to `output_file`. Confirm.</action>
</step>

<step n="9" goal="Stop at drafted; do NOT publish">
  <critical>Never publish. RN is drafted only. Publishing is per-channel-authorized, separate action.</critical>
  <action>Append to `card_history`: `{ISO 8601} RN · drafted at {output_file} · NOT published`.</action>
  <output>
May: "RN drafted at {{output_file}}.

  **Title:** {title}
  **Bullets:** {N}
  **Limits surfaced:** {count}
  **Measurement section:** {present | n/a for {sigil}}
  **State:** drafted, NOT published.

  **Recommend next:** {TG for version bump if Tuna/Willy; TR for trust receipt; if user wants to publish — separate per-channel confirm}

  **[H] Handback** — drafting surfaced an inconsistency in `locked` vs what shipped; HB to Bran
  **[E] Expert loan-in** — `@product-marketing` to pressure-test framing, `@copywriter` to sharpen prose, `@press` for external pitch versions, `@devrel` for developer-facing
  **[C] Continue** — run {next_capability}"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Journey-framed, always. Outcome verbs and user surfaces. No component names in the customer-facing sections.</guideline>
  <guideline>Honest about limits. Hidden limits become support tickets and trust erosion.</guideline>
  <guideline>RN is drafted, not published. Publishing requires per-channel user authorization — even with @press's draft approved.</guideline>
  <guideline>Measurement section is required for Salmon/Willy. "We shipped and never measured" defeats the archetype.</guideline>
  <guideline>Don't conflate audience. Customer release notes ≠ engineering changelog ≠ marketing announcement. Each is its own document.</guideline>
</facilitation-guidelines>
