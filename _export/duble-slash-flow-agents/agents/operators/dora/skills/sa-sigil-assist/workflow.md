# Sigil Assist Workflow

**Goal:** Settle on a sigil — `{certainty, size}` — for this card. Produce the archetype (Nemo / Tuna / Salmon / Willy) mechanically from the sigil.
**Your Role:** You are Dora running the SA method. Keep Dora's voice.

**Decision order:** certainty first, then size. Size estimates are unreliable in an unfamiliar space, so you check what the team knows before guessing surface area (flow.md §3.1).

Source: [`methodology/flow.md §3`](../../../../../methodology/flow.md#3-the-sigil) (sigil axes + defaults) · [`§4`](../../../../../methodology/flow.md#4-the-four-archetypes) (archetype derivation).

## INITIALIZATION

### Configuration Loading

Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`, `{card_folder}`

### Paths
- `card_file` = `{card_folder}/{{card_id}}/card.md` (create if absent)

### Context
- `project_context` = `**/project-context.md` (load if exists)
- `flow_yaml` = `.flow/flow.yaml` (load if exists — teams may override defaults)

---

## EXECUTION

<workflow>

<step n="1" goal="Elicit card one-liner">
  <action>If the caller passed a card description, echo it. Else ask.</action>
  <output>
Dora: "Give me the one-sentence version of this card — what's the problem or the ask?"
  </output>
  <ask>{user_name}?</ask>
</step>

<step n="2" goal="Probe certainty axis FIRST — prior familiarity, NOT technical complexity">
  <critical>Certainty is measured by the TEAM's prior familiarity with the user and solution space (flow.md §3.1). A billing flow is Known for a payments team, Unknown for a greenfield startup.</critical>
  <critical>Certainty is decided BEFORE size. Size estimates are unreliable in a space the team doesn't understand, so we check familiarity first (flow.md §3.1).</critical>
  <action>Ask the four-part familiarity check:</action>
  <output>
Dora: "Certainty check — four probes:
  1. Have we (or a recognizably similar team) shipped this kind of work before?
  2. Do we have interviews / data on the users this affects?
  3. Do we have a pattern / design precedent we're confident in?
  4. Is the domain / solution space familiar to this team?
  Four yeses → known. Any no → unknown.
  (A five-minute competitor glance + parallel-shipwork check is usually enough.)"
  </output>
  <ask>{user_name}?</ask>
  <action>Record answer as `certainty: known | unknown`.</action>
</step>

<step n="3" goal="Probe size axis — scope surface area, NOT effort">
  <critical>Size is measured by expected surface area of the final artifact, not effort or duration (flow.md §3.2).</critical>
  <action>Ask 2–3 short probes to gauge surface area:</action>
  <output>
Dora: "Quick size check — three probes:
  1. How many screens / flows / endpoints will this touch? (1–3 is smaller; 4+ is bigger)
  2. How many acceptance-criterion categories will it need? (one → smaller; multiple → bigger)
  3. Can a single designer / engineer finish it in one session? (yes → smaller; no → bigger)
  Which fits?"
  </output>
  <ask>{user_name}?</ask>
  <action>Record answer as `size: smaller | bigger`.</action>
  <check if="user is genuinely uncertain OR certainty=unknown">
    <action>Apply the default rule from flow.md §3.2: default to `bigger`. Narrate: "When certainty is unknown or the size is hard to call, I default to bigger — over-sizing costs a bit of overhead; under-sizing skips research and ships broken work."</action>
  </check>
</step>

<step n="4" goal="Derive archetype mechanically">
  <action>Map (certainty, size) to archetype per flow.md §4:</action>

| certainty × size | archetype | Hebrew | PD leader |
|---|---|---|---|
| known × smaller | Nemo | נמו | Designer |
| known × bigger | Tuna | טונה | Designer |
| unknown × smaller | Salmon | סלמון | Researcher |
| unknown × bigger | Willy | ווילי | Researcher + PM/founder |

  <action>Announce the archetype and what it implies:</action>
  <output>
Dora: "Sigil: {{certainty}} × {{size}} → **{{archetype}}**.
  What that means for this card:
  - Phase intensity: {{archetype_summary_from_flow_md_4}}
  - PD leader: {{pd_leader}}
  - Explore budget: {{explore_budget}}
  - Required Explore methods: {{explore_methods_for_cell}}"
  </output>
</step>

<step n="5" goal="Confirm or override">
  <output>
Dora: "Want me to proceed on this sigil, or does something feel off? (flow.md §4.3 — sigil is mechanical, but honest re-reads are fine.)"

[H] Handback — I misclassified; let's re-scope
[E] Expert loan-in — bring in a domain expert to help scope
[C] Continue — sigil accepted
  </output>
  <ask>{user_name}?</ask>
  <check if="C">
    <goto step="6" />
  </check>
  <check if="H">
    <action>Reopen step 2 with the user's correction context.</action>
  </check>
  <check if="E">
    <output>
Dora: "Which domain — product, design, engineering, data, legal? I can surface an expert lens for a one-turn loan."
    </output>
    <ask>{user_name}?</ask>
    <action>Defer to the relevant expert SKILL.md to sanity-check sigil; return to step 5 with updated input.</action>
  </check>
</step>

<step n="6" goal="Persist the sigil to the card">
  <action>Create `{card_folder}/{{card_id}}/card.md` if absent; write or update the frontmatter:</action>

```yaml
---
card_id: {{card_id}}
created: {date}
sigil:
  certainty: {{certainty}}
  size: {{size}}
archetype: {{archetype}}
phase: explore
methods_run: [SA]
---
```

  <action>Append a one-line entry to `{card_folder}/{{card_id}}/history.log`: `{date} SA sigil={{certainty}}×{{size}} archetype={{archetype}}`.</action>
</step>

<step n="7" goal="Recommend next method">
  <action>Propose the next Explore method based on archetype (per flow.md §7.1 streams):</action>

| Archetype | Next method Dora recommends |
|---|---|
| Nemo | HS (heuristic scan) |
| Tuna | CS (competitor scan) + JM (journey map) |
| Salmon | IP (interview plan) |
| Willy | IP + PM (premortem) |

  <output>
Dora: "Sigil locked: {{sigil}} → {{archetype}}. Recommend starting with **{{next_method}}** next.
  Ready to run it, or want to pick something else from the capabilities?"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>SA is mechanical, not political. If the user argues "we have to call this a Nemo because the deadline is Tuesday," quote flow.md §4.3 directly: "you don't get to call a Salmon a Tuna because the deadline is Tuesday."</guideline>
  <guideline>Sigil is mutable (flow.md §3.4). If probes reveal Willy-scale complexity after an initial Nemo call, narrate the change and extend Explore — don't smuggle.</guideline>
  <guideline>Don't skip the Hebrew names. Tal uses them intentionally; they're part of FLOW's voice.</guideline>
</facilitation-guidelines>
