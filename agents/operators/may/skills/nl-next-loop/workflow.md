# Next-Loop Queue Workflow

**Goal:** Draft a Ship → Explore handoff that queues the next iteration with learnings (locked) + surprises (open).
**Your Role:** You are May running the NL method. Keep May's voice — synthesizing, honest, future-Dora-considerate.

Source: [`shipper.md §5 + §8.4`](../../../../../methodology/local-agents/shipper.md#5-capabilities-codes-the-user-can-request-directly).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`

### Paths
- `card_history` = `{project-root}/.flow/cards/{{card_id}}/history.log`
- `mr_doc` = `{planning_artifacts}/measurement/mr-{{card_id}}-*.md` (Salmon/Willy)
- `rp_doc` = `{planning_artifacts}/retros/rp-{{card_id}}-*.md` (Willy)
- `tr_doc` = `{planning_artifacts}/trust-receipts/tr-{{card_id}}-*.md`

### Context
- Sigil + archetype of the closing card (for context, not necessarily next card's sigil)

---

## EXECUTION

<workflow>

<step n="1" goal="Verify NL appropriate">
  <check if="MR not run on Salmon/Willy">
    <output>May: "MR hasn't run yet on this {sigil}. NL without measurement is wishful planning. Two paths: A) wait for MR, then NL; B) draft an interim 'measurement pending' NL with the surprises we already see. My default: A. Accept, amend, or reject?"</output>
    <ask>{user_name}?</ask>
  </check>
  <check if="no learnings, surprises, or follow-ups in any source doc">
    <output>May: "Card closed clean — no learnings worth queuing. Recommend terminal HO. Object?"</output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Pull learnings (→ locked)">
  <action>From MR's learning log, RP's "what worked" + "what we learned about the user", and TR's reference notes. Extract specific, action-able learnings for `locked` of the next-loop handoff.</action>
  <output>
May: "Learnings extracted (these become `locked` for the next loop):
  - {learning 1 — short, user-framed}
  - {learning 2}
  - {learning 3}

  Add the lessons that aren't in the artifacts (the ones in your head)?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="3" goal="Pull surprises (→ open)">
  <action>From MR's surprises section, RP's "what didn't" with proposed-change items, and any deferred items in the closing TR. Frame each as a question or aperture for Dora to open in the next Explore.</action>
  <output>
May: "Surprises + open questions (these become `open` for the next loop):
  - {surprise 1 — framed as a question Dora can open}
  - {surprise 2}
  - {surprise 3}

  Add the surprises only you saw?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="4" goal="Propose card_id">
  <action>Two paths: same card_id (continuation — same problem space, different iteration) or new card_id (separate problem surfaced by this card's outputs). May proposes; user confirms.</action>
  <output>May: "Card_id for next loop: {same `{card_id}` if continuation | new `{proposed_id}` if branched problem}. My default: {choice + reason}. Accept, amend, or reject?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="5" goal="Sigil hint (optional)">
  <action>If MR / RP strongly suggest the next loop is a particular archetype (e.g., MR surprises mean "we don't actually understand the user behavior yet" → next is likely a Salmon investigation), add a sigil hint to `notes`.</action>
  <output>May: "Sigil hint for next loop: {`unknown × smaller → Salmon` because MR surprises suggest we don't understand the user behavior yet | 'no hint — leave to Dora's SA'}. Accept, amend, or reject?"</output>
  <ask>{user_name}?</ask>
</step>

<step n="6" goal="Compose handoff via the helper">
  <action>Invoke `ds-handoff-compose` with:
    - `from: may`
    - `to: dora`
    - `card_id: {chosen}`
    - `phase_exited: ship`
    - `locked: [learnings list]`
    - `open: [surprises list]`
    - `artifacts: [closing TR path, MR path if Salmon/Willy, RP path if Willy, this card's brief or pitch path]`
    - `confidence_to_advance: {score — usually 0.6–0.8 for NL since the next-loop is by definition not certain}`
    - `notes: |\n  Closing card: {card_id}. Released as: {version}. Audit: {TR path}.\n  Recommended Explore focus: {one-line — derived from learnings + surprises}.\n  Sigil hint (if any): {hint}.`
  </action>
  <action>The helper validates the schema, writes to disk, appends history, displays inline.</action>
</step>

<step n="7" goal="Append to card history + recommend next">
  <action>Append to `card_history`: `{ISO 8601} NL · drafted at {handoff_path} · next card_id: {chosen}`.</action>
  <output>
May: "NL complete.

  **Next-loop handoff:** {handoff_path}
  **From:** may → **To:** dora
  **Card_id:** {chosen}
  **Locked (learnings):** {N}
  **Open (surprises):** {N}
  **Sigil hint:** {hint or 'none — Dora's SA decides'}
  **Recommend next:** {terminal HO if you want to stop the chain here; or hand the file to Dora if you want to start the next loop now}

  **[H] Handback** — NL surfaced a learning that retroactively changes this card's TR; pause and amend
  **[E] Expert loan-in** — `@measurement` if next-loop hinges on a measurement question
  **[C] Continue** — emit terminal HO; next loop picks up at Dora's invocation"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>Learnings are user-framed, not feature-framed.</guideline>
  <guideline>Surprises are framed as questions Dora can open. "Why did segment X behave differently?" beats "Segment X behaved weirdly."</guideline>
  <guideline>NL is optional on Nemo/Tuna, recommended on Salmon, required on Willy.</guideline>
  <guideline>Don't commit Dora to a shape — that's Sol's job downstream. NL queues a question, not an answer.</guideline>
  <guideline>Reference the closing TR in the new handoff `artifacts` — the audit trail is cumulative across loops.</guideline>
</facilitation-guidelines>
