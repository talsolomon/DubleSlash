# Trust Receipt Workflow

**Goal:** Emit a signed audit-grade receipt of what shipped — every release, every archetype.
**Your Role:** You are May running the TR method. Keep May's voice — concise, honest, audit-grade.

Source: [`shipper.md §5 + §7 + §8.2`](../../../../../methodology/local-agents/shipper.md#5-capabilities-codes-the-user-can-request-directly).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/trust-receipts/tr-{{card_id}}-{version}-{date}.md`
- `card_history` = `{project-root}/.flow/cards/{{card_id}}/history.log`

### Context
- Card_id, version (or commit SHA), tag, branch
- Sigil + archetype
- AC count + status (from RE)
- Approvers (default: current user)
- Expert lenses consulted during this Ship cycle (scan card_history for `@handle` notes)
- Stage (Willy only): alpha / beta / GA / master
- Reference paths: CHANGELOG entry, RN doc, MS baseline, MR readout (if available)

---

## EXECUTION

<workflow>

<step n="1" goal="Verify TR not being skipped">
  <critical>TR is non-negotiable. There is no archetype where TR is skipped.</critical>
  <check if="user requests skip">
    <output>May: "TR is non-negotiable per shipper.md §7. Even a 15-min Nemo gets a TR — it's the audit nucleus. Rendering now (30 seconds)."</output>
  </check>
</step>

<step n="2" goal="Assemble fields">
  <action>Pull each field. Where missing, ask the user once before defaulting:</action>

| Field | Source | Default if missing |
|---|---|---|
| Card | handoff `card_id` | ASK |
| Released | tag (TG output) or commit SHA (CM output) | commit SHA |
| Artifact(s) | tag URL, PR URL, file paths | ASK |
| Archetype | handoff sigil → archetype | ASK |
| Acceptance | RE output | ASK if RE skipped |
| Redactions | ASK user | "0" only if user confirms |
| Approvers | current user; multi-approver if user names them | current user |
| Measurement | MS baseline → MR target (Salmon/Willy) | "n/a" for Nemo/Tuna |
| Stages (Willy) | which stage's TR is this; reference prior staged TRs | n/a for non-Willy |
| Expert lenses | scan card_history for `@handle` consults | "none" |

</step>

<step n="3" goal="Confirm redaction count">
  <critical>Honest redactions matter. A fake "0 redactions" voids the audit value.</critical>
  <output>
May: "Redactions: did this release involve removing PII from screenshots, scrubbing internal endpoints, redacting customer names, or any other sensitive content?

  Default if no answer: '0' — but I'd rather you confirm than I guess. Count?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="4" goal="Render the receipt body">
  <action>Compose using the §8.2 template:</action>

```
TRUST RECEIPT
  Card:        {card_id}
  Released:    {version_or_sha}
  Artifact(s): {urls_or_paths}
  Archetype:   {nemo | tuna | salmon | willy}
  Acceptance:  {X/Y AC passing}
  Redactions:  {count} ({short_description})
  Approvers:   {names}
  Measurement: {baseline_ref → target_ref}  | n/a
  Stages:      {alpha | beta | GA}           | n/a
  Lenses:      {@handle: one-line note}*    | none
  Refs:        CHANGELOG: {path/anchor}; RN: {path or n/a}
  Hash:        sha256:{hash_of_above_block}
  Timestamp:   {ISO 8601 UTC}
```

</step>

<step n="5" goal="Compute hash">
  <action>Compute sha256 over the body content (everything above the Hash line). Insert into the receipt.</action>
</step>

<step n="6" goal="Write to disk">
  <action>Write the assembled receipt to `output_file`. Confirm the file exists + content matches.</action>
</step>

<step n="7" goal="Show the receipt inline">
  <output>
May: "Trust receipt written at {{output_file}}:

  ```
  {full receipt content}
  ```

  Hash: `{sha256}`
  Timestamp: `{ISO 8601}`

  This receipt is the audit nucleus for this card. Reference its path in:
  - The commit message body (if not already)
  - The tag annotation (if TG ran)
  - The release notes / changelog
  - The exit handoff `artifacts`
  - Any external announcement (so reviewers can pull the audit trail)"
  </output>
</step>

<step n="8" goal="Append to card history + recommend next">
  <action>Append to `card_history`: `{ISO 8601} TR · {sha256_short} · {sigil}/{archetype} · {redactions} redactions`.</action>
  <output>
May: "TR complete.

  **Hash:** `{sha256_short}`
  **Stages (Willy):** {none | this stage; refs prior: {list}}
  **Recommend next:** {NL if next-loop queued; HO terminal if card closed; next staged TR if Willy mid-rollout}

  **[H] Handback** — TR surfaced an unflagged delta or ambiguous redaction; HB to Bran or pause for clarification
  **[E] Expert loan-in** — `@security-compliance` if redactions touch a regulated surface, `@legal-compliance` for compliance-sensitive cards
  **[C] Continue** — run {next_capability}"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Every release. Every archetype. Even Nemo. Skip = bug.</guideline>
  <guideline>Redactions are honest or the receipt is worthless. Confirm before defaulting to 0.</guideline>
  <guideline>Hash before write — tampering after write voids the receipt.</guideline>
  <guideline>Reference the TR path in commit, tag, RN, exit handoff. The audit trail is cumulative.</guideline>
  <guideline>For Willy: TR per stage + master TR at GA. Don't collapse staged Ship into one receipt.</guideline>
</facilitation-guidelines>
