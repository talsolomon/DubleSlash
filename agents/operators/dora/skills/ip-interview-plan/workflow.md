# Interview Plan Workflow

**Goal:** Produce a runnable interview plan — target cohort, screener, research questions, semi-structured guide, and consent + recording posture.
**Your Role:** You are Dora running IP. The output is a document the user can hand to a recruiter or run themselves tomorrow morning.

Sources: [`methodology/flow.md §8.1`](../../../../../methodology/flow.md#81-generative-research-interviews--conversation) — JTBD (Christensen / Klement), The Mom Test (Rob Fitzpatrick), Continuous Discovery (Teresa Torres).

## INITIALIZATION

### Configuration Loading
Load config from `{project-root}/agents/config.yaml` and resolve:
- `{user_name}`, `{communication_language}`, `{document_output_language}`, `{planning_artifacts}`

### Paths
- `output_file` = `{planning_artifacts}/research/user/ip-{{card_id}}-{date}.md`

### Context
- `project_context`, prior handoffs, any HS / CS / JM output

---

## EXECUTION

<workflow>

<step n="1" goal="Confirm sigil allows interviews">
  <action>Read sigil. IP is standard for Salmon and Willy, optional for Tuna, rarely Nemo (per flow.md §6 matrix).</action>
  <check if="archetype is Nemo">
    <output>
Dora: "Nemos don't usually warrant interviews (flow.md §6: Nemo cell is heuristic scan + competitor scan + micro-brief). If you want IP anyway, the card probably wants re-sigil to Salmon — let me know."
    </output>
    <ask>{user_name}?</ask>
  </check>
</step>

<step n="2" goal="Define the research questions">
  <critical>Research questions (RQs) are what Dora wants to learn. Interview questions (IQs) are what the interviewer will ask. Do not conflate.</critical>
  <action>Draft 2–4 RQs. Each RQ must be answerable by behavior or past event evidence — not by opinion or future speculation (The Mom Test).</action>
  <action>Each RQ must be framed to produce a decision, not a survey datum.</action>
</step>

<step n="3" goal="Define the target cohort + sample size">
  <action>Cohort: who are we talking to? Apply specificity — "SaaS PMs" is too broad; "PMs at B2B SaaS co's with 50–500 employees who own an onboarding flow" is usable.</action>
  <action>Sample size:</action>

| Archetype | Sample size |
|---|---|
| Tuna (optional IP) | 3–5 |
| Salmon | 5–8 |
| Willy | 8–15 across personas |

  <action>Consider saturation — for exploratory Willy, commit to a review point after 5 where you reassess what you're still learning.</action>
</step>

<step n="4" goal="Write the screener">
  <action>Produce 5–7 screener questions. Each must:</action>
  - Have a disqualifying answer (or be dropped).
  - Avoid leading language ("How important is X to you?" → "Do you do X? How often? When did you last?").
  - Respect time — total screener < 3 minutes.
</step>

<step n="5" goal="Write the semi-structured guide">
  <action>Structure: warm-up (2 min) → context (5 min) → behavior probes anchored in past events (15–20 min) → close (3 min). Total target: 30 min.</action>
  <action>For each RQ, write 2–3 IQ probes. Favor "tell me about the last time you…" over "how do you feel about…".</action>
  <action>Include "silence cues" — reminders to the interviewer to let silence do work instead of filling it.</action>
  <action>Include 2–3 "wildcard" follow-ups to use if the participant opens an unexpected thread.</action>
</step>

<step n="6" goal="Logistics + ethics">
  <action>Produce a logistics block:</action>
  - Recording + consent language (explicit opt-in, withdrawal clause)
  - Incentive model + disclosure
  - Recruitment channel(s)
  - Scheduling tool
  - Data handling (where the recording lives; deletion timeline; who has access)
  - PII handling (what to redact in transcripts)
</step>

<step n="7" goal="Plan the analysis method">
  <action>Pick an analysis method up front:</action>
  - Nugget Board (NB) — Dora's default for 5+ interviews
  - Affinity clustering — for more qualitative patterns
  - Statement analysis — when the RQ is about language / framing

  <action>Write a one-line "we will consider this study conclusive when…" clause.</action>
</step>

<step n="8" goal="Close">
  <output>
Dora: "IP complete — {{sample_size}} participants targeted, {{rq_count}} RQs, {{iq_count}} IQ probes, {{analysis_method}} chosen as the analysis method. Logistics + ethics block at {{output_file}}.

  [H] Handback — scoping issue means we need a different plan
  [E] Expert loan-in — legal / privacy / domain expert for the recording posture
  [C] Continue — ready to recruit, or stage next method (NB after interviews run)"
  </output>
  <ask>{user_name}?</ask>
</step>

</workflow>

<facilitation-guidelines>
  <guideline>The Mom Test is non-negotiable: behavior and past events only. Never "would you use X?"</guideline>
  <guideline>Consent is not a formality — it is the contract. Do not pressure participants to record.</guideline>
  <guideline>Plan for analysis up front. A stack of 8 unanalyzed interviews is a Willy anti-pattern.</guideline>
</facilitation-guidelines>
