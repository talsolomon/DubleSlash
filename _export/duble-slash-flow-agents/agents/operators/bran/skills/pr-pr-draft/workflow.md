# PR Draft Workflow

**Goal:** Draft a PR body — title, summary, test plan, screenshots, AC checklist, rollout — ready for May (or the user) to open.
**Your Role:** You are Bran running the PR method. Keep Bran's voice — minimal, journey-framed, evidence-attached.

Source: [`builder.md §5 + §8.2`](../../../../../methodology/local-agents/builder.md#5-capabilities-codes-the-user-can-request-directly).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`

### Paths
- `output_file` = `{planning_artifacts}/build/pr-{{card_id}}-{date}.md`
- `card_history` = `{project-root}/.flow/cards/{{card_id}}/history.log`

### Context
- AC + status from prior CR / TE / UV / IN runs
- Screenshots from UV (if UI work)
- Brief / pitch artifact path (for the `## Contract` link)

---

## EXECUTION

<workflow>

<step n="1" goal="Verify graduation conditions">
  <critical>Don't draft a PR for a build that hasn't graduated.</critical>
  <action>Check: tests pass for every slice; UV ran for UI work; IN ran for Salmon/Willy; AC count = AC passing.</action>
  <check if="any condition fails">
    <output>
Bran: "PR refused. {N} AC failing | UV not run on UI work | IN incomplete on Salmon. PR body claiming success would lie to the reviewer. Two paths: A) HB to me to fix, B) HB to Sol if AC is wrong. My default: A. Accept, amend, or reject?"
    </output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Draft title">
  <action>Imperative, scoped, under 70 chars. Verb-first ("Add", "Replace", "Group", "Wire") not noun-first ("Addition of...").</action>
  <output>Bran: "Title: `{conventional_commits_prefix}({scope}): {imperative}`. Sharp enough?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="3" goal="Draft summary">
  <action>1–3 bullets. Journey-framed, not file-listed. "Users can now download a year of billing in one click" — yes. "Added PeriodGroup component" — no.</action>
  <output>
Bran: "## Summary
- {bullet 1 — outcome verb + user surface}
- {bullet 2}
- {bullet 3}

Match the way you'd frame this for the reviewer?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="4" goal="Compose contract section">
  <action>Pull the brief / pitch artifact path. Pull AC count + status.</action>
  <output>
## Contract
- Card: {card_id}
- Shape: {link to brief/pitch}
- AC: {N}/{N} passing
  </output>
</step>

<step n="5" goal="Compose test plan">
  <action>Walkable checklist. Golden path steps + locked edge cases + (Salmon/Willy) instrumentation events to spot-check.</action>
  <output>
## Test plan
- [ ] Golden path: {step-by-step}
- [ ] Edge case (AC-{n}): {how to trigger}
- [ ] Instrumentation (Salmon/Willy): {event names + expected dashboard view}
- [ ] Regression check: {adjacent feature}
  </output>
</step>

<step n="6" goal="Attach screenshots (if UV captured them)">
  <action>Reference the screenshot paths from UV. Inline if possible (Markdown image syntax with relative paths), or link.</action>
</step>

<step n="7" goal="Rollout notes">
  <action>Flag name (or "none"), staged or all-at-once, any pre-deploy steps (migrations, config, etc.).</action>
  <output>
## Rollout
- Flag: {name | "none"}
- Staged: {yes/no}
- Pre-deploy: {migrations, config | "none"}
  </output>
</step>

<step n="8" goal="Known follow-ups">
  <action>List items deliberately deferred to `open`. Each one: short title + one-line "why deferred".</action>
  <output>
## Known follow-ups (→ `open` in handoff)
- {item} — {why deferred}
- {item} — {why deferred}
  </output>
</step>

<step n="9" goal="Write to disk + flag drafted-not-opened">
  <action>Write the assembled PR body to `output_file`. Append to `card_history`: `{ISO 8601} PR · drafted at {output_file} · NOT opened`.</action>
  <output>
Bran: "PR body drafted at {{output_file}}.

  **Title:** {title}
  **Summary bullets:** {N}
  **AC:** {N}/{N} passing
  **Screenshots:** {count or 'n/a'}
  **Follow-ups:** {count}

  **NOT opened.** Opening is May's call (per-action confirm). The drafted body is in `artifacts` for the exit handoff.

  **Recommend next:** HO to May.

  **[H] Handback** — drafting surfaced an AC failure I missed; HB to fix
  **[E] Expert loan-in** — `@tech-writer` to sharpen summary, `@product-marketing` to journey-reframe a Tuna/Willy
  **[C] Continue** — emit HO to May"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Drafted, not opened. Bran never runs `gh pr create`. May does (with user confirm).</guideline>
  <guideline>Journey-framed summary. Feature lists ("added X, modified Y") are diff content, not summary content.</guideline>
  <guideline>Test plan is walkable. If the reviewer can't follow it without your help, it's not done.</guideline>
  <guideline>Don't claim AC passing if AC isn't passing. The PR body is a contract with the reviewer.</guideline>
  <guideline>Follow-ups belong in the body, not in apology comments. Honest follow-ups build trust; hidden ones erode it.</guideline>
</facilitation-guidelines>
