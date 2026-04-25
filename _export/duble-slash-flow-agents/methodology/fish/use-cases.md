---
name: FISH use cases — worked examples
description: Four end-to-end scenarios — one per archetype — showing how FISH runs a card from Explore to Ship. Includes sigil selection, method choice per phase, handoff content, and human-AI collaboration notes.
type: methodology-spec
---

# FISH use cases — worked examples

Four scenarios, one per archetype. Each runs a real-feeling card from sigil to trust receipt. Use these to calibrate what FISH *looks like* in practice before applying it to your own work.

The scenarios:

1. **[Nemo](#nemo--tooltip-copy-fix)** — tooltip copy fix (smaller × known)
2. **[Tuna](#tuna--billing-history-redesign)** — billing history redesign (bigger × known)
3. **[Salmon](#salmon--onboarding-step-3-abandonment)** — onboarding step-3 abandonment (smaller × unknown)
4. **[Willie](#willie--multiplayer-handoff-v1)** — multiplayer handoff (bigger × unknown)

Each scenario follows the same template:

- **Context** — what triggered the card.
- **Sigil + archetype** — why this archetype was chosen.
- **Per phase:** stream followed, method choices, key moves, handoff.
- **Trust receipt** — what shipped.
- **What FISH did for the human.**

---

## Nemo — tooltip copy fix

### Context

Support has flagged that users misinterpret the tooltip on the "Export as CSV" button. Two support tickets this week asked "does this export *current view* or *all data*?"

### Sigil + archetype

- `size: smaller` — one UI element, one string.
- `certainty: known` — we understand the user, the button, and the data model.
- **Archetype: Nemo.** Total budget target: under 2 hours.

### Phase 1 — Explore (head): 10 minutes

**Stream followed:** Nemo Explore (see [phases-and-methods.md §Nemo Explore stream](./phases-and-methods.md#nemo-explore-stream-small--known)).

**Moves:**
1. Confirmed sigil out loud in the Explorer chat.
2. Heuristic scan: tooltip violates *"Match between system and the real world"* — the copy uses internal terminology ("view scope").
3. One HMW: *"How might we make the export-scope choice obvious before the user clicks?"*
4. Skim-checked three competitor exports (Linear, Notion, Airtable) — two use a dropdown, one uses a confirmation modal.
5. No Hick's Law concern.

**Handoff emitted:**
```
<FISH-handoff>
from: explorer → to: solidifier
card_id: tooltip-csv-export-2026-04-21
sigil: { size: smaller, certainty: known } · archetype: nemo
locked:
  - "Problem: tooltip copy misleads on scope (current view vs all data)"
  - "HMW: make export scope obvious before click"
open:
  - "Tooltip rewrite vs. dropdown pattern — which fits our conventions?"
artifacts: [ notes/tooltip-heuristic-scan.md ]
confidence_to_advance: 0.9
</FISH-handoff>
```

### Phase 2 — Solidify (left body): 20 minutes

**Stream:** Nemo Solidify.

**Moves:**
1. Picked tooltip-rewrite over dropdown (Solidifier surfaced both; user accepted tooltip for minimal surface change).
2. Draft sketch: tooltip now reads *"Exports the rows currently visible. Change filters first to export more."*
3. Acceptance criteria:
   - Tooltip text matches the above string.
   - Tooltip shows on hover within 200ms.
   - Screen-reader announces full string.
4. Reuses existing tooltip component — no design-system extension.

**Handoff emitted:**
```
<FISH-handoff>
from: solidifier → to: builder
locked:
  - "New tooltip string: 'Exports the rows currently visible...'"
  - "Use existing Tooltip primitive"
  - "AC: 3 criteria (string, timing, a11y)"
open: []
confidence_to_advance: 1.0
</FISH-handoff>
```

### Phase 3 — Build (right body): 30 minutes

**Stream:** Nemo Build.

**Moves:** replaced the string in `components/ExportButton.tsx`. Screen-reader test passed. No refactor.

### Phase 4 — Ship (tail): 10 minutes

**Stream:** Nemo Ship.

**Moves:**
- Commit: `fix(export): clarify CSV export scope in tooltip copy`
- Changelog: *"Clearer copy on the CSV export tooltip."*
- Trust receipt: 1 line changed, 0 redactions. Auto-approved.

### Trust receipt

```
Released: tooltip-csv-export-2026-04-21
Artifact: components/ExportButton.tsx (1 line)
Redactions: none
Approver: tal@dubleslash.sh (solo)
Hash: sha256:…
```

### What FISH did for the human

- **2 hours total**, no scope creep. The Explorer refused to wireframe a new dropdown; the Solidifier refused to build a dropdown-rewrite card inside this one.
- A Nemo with **four handoffs** is still fast — each took 30 seconds to emit. The handoffs make the card resumable if interrupted.
- Zero PRD. Zero journey meeting. One problem, one shape, one release.

---

## Tuna — billing history redesign

### Context

Customers have asked for a better billing history view. Current view shows invoices as a flat list; customers want to see charges grouped by period and downloadable.

### Sigil + archetype

- `size: bigger` — 4 screens (list, detail, download modal, empty state).
- `certainty: known` — billing flows are well-trodden at this team; we have prior billing work.
- **Archetype: Tuna.** Budget target: 2-week sprint.

### Phase 1 — Explore: 1 day

**Stream:** Tuna Explore.

**Moves:**
1. Convention inventory: we have an invoice detail component, a date-range picker, a download button primitive.
2. Journey map — existing flow in five swim-lanes (user, auth, billing API, PDF service, email).
3. OSD for the download flow (user → API → PDF service → email).
4. Competitor scan: Stripe, Linear, Notion billing pages. Noted Stripe's "grouped by period" pattern.
5. Shortlisted 3 structural directions: period-grouped list / detail-drawer-per-invoice / hybrid.

**Handoff:** `confidence 0.8`; open = "which of 3 directions."

### Phase 2 — Solidify: 2 days

**Stream:** Tuna Solidify.

**Moves:**
1. Storyboard: 8 frames — arrive → filter by period → expand period → view detail → download PDF → success → error → empty.
2. Journey meeting with engineering. Went with **hybrid** (period-grouped list + detail drawer).
3. Design-system extension: added a `<PeriodGroup>` component; documented.
4. Brief written — 1 page, journey-structured.
5. Acceptance criteria: 14 bullets across functional, UX, a11y, perf.
6. Microinteraction specs for group expand/collapse (Triggers / Rules / Feedback / Loops).

**Handoff:** `locked` = brief + AC + new component; `open` = non-blocking (analytics event names to finalize during build).

### Phase 3 — Build: 1.5 weeks

**Stream:** Tuna Build.

**Moves:**
1. Component library first: composed with existing primitives + the new `<PeriodGroup>`.
2. Iterative prototyping in Storybook; designer + dev paired on the expand animation.
3. Built in vertical slices: list → detail drawer → download → empty state.
4. Acceptance criteria run as test cases; all 14 pass.
5. Joint review: designer, PM, backend engineer. One friction flagged on download timing — added a loading state mid-Build.

### Phase 4 — Ship: half a day

**Stream:** Tuna Ship.

**Moves:**
- Changelog: "Billing history redesigned. Invoices now group by period; one-click download per period."
- Docs updated on `/docs/billing`.
- Release note announced in product changelog and email to paying customers.
- Trust receipt emitted.

### Trust receipt

```
Released: billing-history-redesign-2026-04
Artifacts: 17 files changed, 1 new component (<PeriodGroup>)
Acceptance: 14/14 criteria passing
Redactions: 2 (one customer name in screenshot, one internal endpoint)
Approvers: tal, shenhav
Hash: sha256:…
```

### What FISH did for the human

- **Brief replaced PRD.** The 1-page brief + 14 AC bullets held the whole design ↔ engineering contract. No 30-page PRD.
- **Shared language across design + engineering.** The storyboard was the meeting material; the AC was the spec; the trust receipt was the QA artifact. No translation layer.
- **Reusable journey map** — filed as a journey-mapping artifact, usable for the next billing Tuna.

---

## Salmon — onboarding step-3 abandonment

### Context

Analytics flagged that 40% of new signups drop at step 3. We don't know why. The team hasn't deeply interviewed users since the flow was built 18 months ago.

### Sigil + archetype

- `size: smaller` — one flow step, ~2 screens.
- `certainty: unknown` — we have analytics but no qualitative evidence. User motivations are opaque.
- **Archetype: Salmon.** Budget: 1.5 weeks (heavy Explore, small Build).

### Phase 1 — Explore: 5 days

**Stream:** Salmon Explore.

**Moves:**
1. Sigil confirmed; warned it might flip to Willie if step 3 turns out to need a full rethink.
2. 7 user interviews, semi-structured, recorded with consent.
3. TZUMI: ran Go-Learn (exploratory) → One-User (validated the top finding with one more user) → Hand-in-Hand (shadowed two users on signup).
4. Nugget board populated with 28 atomic findings, tagged by theme.
5. Task analysis of step 3 — decomposed into 5 sub-tasks.
6. Journey map anchored in the real interview quotes.
7. Synthesized 3 candidate framings. Winner: *"Users abandon step 3 because the password-strength meter surfaces after typing, making them feel retroactively judged."*

**Handoff:** `confidence 0.8`; `locked` = the framing; `open` = "instructional vs. passive copy pattern for the meter; step-3 placement vs step-1 education."

### Phase 2 — Solidify: 3 days

**Stream:** Salmon Solidify.

**Moves:**
1. Picked instructional copy pattern (strongest interview support).
2. 1-page brief — journey-structured.
3. Concept test with 5 users on a low-fi prototype. 4/5 completed without friction; 1/5 surfaced a minor copy ambiguity.
4. Iterated copy once.
5. AC written, evidence-informed: 6 bullets.
6. Measurement plan: track step-3 completion rate; target +20 percentage points within 30 days.

**Handoff:** `locked` = brief + validated shape + AC + measurement plan; `open` = empty of blockers.

### Phase 3 — Build: 2 days

**Stream:** Salmon Build.

**Moves:**
1. Built the copy change + meter-surfacing logic.
2. Instrumented: added `signup_step3_completed` event.
3. Usability-tested with 4 users. 4/4 completed without friction.
4. No further iteration needed.

### Phase 4 — Ship: spread over 2 weeks

**Stream:** Salmon Ship.

**Moves:**
- Released with instrumentation live.
- Baseline measurement captured pre-release.
- Measured 2 weeks post-release: step-3 completion rose from 60% → 78% (+18 pp, just under target).
- Effectiveness / Efficiency / Satisfaction review: all three improved.
- Learning log: *"Password strength meter placement matters more than wording. Instructional copy helped but most of the lift came from surfacing the meter earlier."*
- Queued next loop: card to explore step-3 education vs. step-1 education (new Explore).

### Trust receipt

```
Released: onboarding-step3-password-meter-2026-04
Artifacts: copy change + meter placement + 1 analytics event
Measurement: step3_completed 60% → 78% at 14-day mark
Redactions: 3 (user names in interview nuggets, 1 feature flag)
Approvers: tal, design-lead
Hash: sha256:…
```

### What FISH did for the human

- **Kept Explore heavy where it belonged.** The Explorer refused to sketch until interviews were in. Without that discipline, the team would have shipped a cosmetic copy fix and missed the actual cause (meter placement).
- **Measurement plan in Solidify, not in Ship.** Building the instrumentation into Build meant Ship could actually measure; no retrofitted analytics.
- **Next-loop handoff** — the card's final handoff went back to Explore with a fresh sigil, not to /dev/null. The Willie-adjacent follow-up (step-1 education) is now queued, not forgotten.

---

## Willie — multiplayer handoff (V1)

### Context

Duble Slash's own V1 roadmap. The killer demo is Sarah (designer, Claude) handing off to Marcus (developer, VS Code) via the Context Cloud. Nothing like this exists in our product yet. We need to build the full cross-tool handoff surface.

### Sigil + archetype

- `size: bigger` — hosted backend, sync engine, two desktop clients, web team view.
- `certainty: unknown` — no one has built this exact cross-AI-tool handoff before; user behavior with it is unknown.
- **Archetype: Willie.** Budget: 4 months (spans the V1 milestone).

### Phase 1 — Explore: 3 weeks

**Stream:** Willie Explore.

**Moves:**
1. Confirmed sigil. Warned likely sub-splits during Solidify.
2. Market scan: Granola, Rewind, Linear+AI, Cursor Teams — mapped each on capture ↔ coordination ↔ methodology axes.
3. 12 user interviews across the three V1 personas (Senior IC, Team Lead, New Joiner).
4. TZUMI across two cohorts: design-heavy teams + dev-heavy teams.
5. Contextual inquiry with two teams (4 hours each, pair with Shenhav).
6. Goal-Directed Design personas drafted — End / Experience / Life goals per persona.
7. JTBD pass: "when [context], I want to [job] so I can [outcome]."
8. OSD for Sarah → Marcus flow across 5 tool boundaries.
9. Premortem — surfaced 3 failure modes (trust leak on handoff, presence notification fatigue, no canonical card id).
10. Scenario planning: happy path + "Marcus offline," "Sarah's handoff has a secret," "three teammates on same card."
11. Drafted pitch outline.

**Handoff:** `confidence 0.75`; `open` = "which of 3 concept directions: push-button handoff / ambient presence / explicit invite."

### Phase 2 — Solidify: 2 weeks

**Stream:** Willie Solidify.

**Moves:**
1. Pitch (RFC) written — 5 pages, journey-structured.
2. 3 concept tests across the 3 directions. Push-button won.
3. Tradeoff axes mapped: privacy ↔ speed; explicitness ↔ ambient.
4. Personas finalized.
5. Multi-level AC: functional (handoff delivered, card updated), UX (teammate sees it within 5s), perf (sub-500ms round-trip under 100-card load), compliance (EU data residency).
6. Journey meetings — 3 sessions, design + eng + GTM.
7. Decision log: 14 major decisions, each with alternatives and reasoning.
8. Measurement plan: time-to-pickup, handoff acceptance rate, post-handoff satisfaction (1–5 after 30 days).

**Handoff:** `locked` = pitch + AC + decision log + measurement plan; `open` = explicit Build latitude (backend storage choice, specific protocol for cross-tool sync).

### Phase 3 — Build: 10 weeks, staged

**Stream:** Willie Build.

**Moves:**
1. Broke into 6 Tuna-sized sub-cards: (a) hosted backend + auth, (b) Capture-to-Cloud push, (c) Handoff routing, (d) Desktop client pickup UI, (e) Team view, (f) integrations (Slack).
2. Thin vertical slice first: Sarah's Claude session → handoff → Marcus's VS Code pickup. End-to-end in 3 weeks.
3. Integrated requirements: Shenhav on the backend in the Solidify room from the start.
4. Joint product reviews weekly.
5. Staged rollout plan drafted in Build (ready for Ship): internal dogfood → 5-team alpha → beta cohort → GA.
6. Measurement hooks live per sub-card.

### Phase 4 — Ship: spread over 4 weeks, staged

**Stream:** Willie Ship.

**Moves:**
- **Internal dogfood** (week 1): used ourselves; 3 bugs found, all fixed. Trust receipt emitted.
- **Alpha** (weeks 2–3): 5 teams onboarded. Time-to-pickup measured at ~12s (target was <60s). Acceptance rate 72%. Trust receipt per team.
- **Beta** (weeks 3–4): 30 teams. Handoff satisfaction 4.2/5. Two Salmons spawned to fix presence notification fatigue.
- **GA**: full release, announcement post.
- **Retrospective:** surfaced that Willies with >3 sub-cards should add a sub-card health meter — logged for next Willie.
- **Master trust receipt** — summarizes the whole V1 handoff feature with all child sigils, measurements, and approvers.
- **Queued 3 next-loop Explores**: presence fatigue, cross-team handoff (the next Willie), and mobile pickup.

### Trust receipt (summary, master)

```
Released: multiplayer-handoff-v1-ga-2026-10
Artifacts: 6 sub-cards shipped; 1 hosted backend; 2 desktop clients; 1 web team view
Acceptance: all criteria met; time-to-pickup 12s (target <60s)
Measurement window: 4 weeks; handoff satisfaction 4.2/5 across 30 beta teams
Redactions: 214 across the Build window (secrets, customer IDs, interview PII)
Approvers: tal, shenhav, design-lead, security-advisor
Sub-receipts: 6 linked below
Hash: sha256:…
```

### What FISH did for the human

- **Willie-sized Explore protected against the "Sarah → Marcus seems simple" trap.** Without the 3-week Explore, the premortem's 3 failure modes would have surfaced as launch bugs instead of design inputs.
- **Break-into-Tunas kept the Willie build-able.** Six sub-cards, each its own sigil-archetype-phase lifecycle, tracked by the parent.
- **Staged Ship** meant measurement didn't have to wait for GA. Beta measurements fed back into late-stage tweaks without re-opening Solidify.
- **Decision log** became the onboarding doc for the next Willie. Institutional memory, not archaeology.

---

## Cross-references

- Main FISH spec → [`README.md`](./README.md)
- Phase-by-phase streams and method catalog → [`phases-and-methods.md`](./phases-and-methods.md)
- Why this matters for AI-assisted work → [`human-ai-collaboration.md`](./human-ai-collaboration.md)
- Handoff block shape → [`transitions-and-handoffs.md`](./transitions-and-handoffs.md)
