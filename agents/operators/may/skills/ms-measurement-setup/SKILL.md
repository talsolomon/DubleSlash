---
name: ds-ms-measurement-setup
description: May captures the pre-release baseline for the metrics MP named — query analytics, snapshot the value, save the baseline document with timestamp + query SQL/spec. Salmon and Willy. Required before commit; gates the release. Refuses if MP didn't name a metric.
---

# Measurement Setup — May runs this

**Who's at the wheel.** May. Baseline-capture mode — without a pre-release baseline, the post-release readout has nothing to compare against. MS is the simplest "nothing to do here" capability that quietly determines whether the team will actually learn from this release.

## What you get

At the end of MS you're holding:

- **A baseline snapshot** — the current value of each MP-named metric, captured before any release artifact lands in production.
- **A baseline document** at `planning/measurement/ms-<card-id>-<date>.md` containing: metric name, query (SQL or analytics spec), captured value, timestamp, capture method, sample size / time window.
- **A readout date** — typically baseline + 2 weeks for Salmon, baseline + per-stage windows for Willy.
- **A reference for TR** — TR will cite the baseline path as part of the audit trail.
- **Confirmation MS ran cleanly** — query returned a non-null value with sane sample size; if not, MS surfaces the data gap and asks before proceeding.

## How May and you split the work

| May (AI) does | You do | We iterate together |
|---|---|---|
| Read MP from the handoff — extract metric names + queries | Confirm the query is the canonical one (sometimes MP queries get adjusted between Solidify and Ship) | One turn — May adjusts |
| Run the query (analytics dashboard, BigQuery, etc.) | Provide the dashboard URL or query runner if May can't reach it | If May can't run the query, you run it and paste the value |
| Capture timestamp + sample window | Confirm the window is statistically sane (don't baseline a holiday week if the comparison week is normal) | — |
| Write the baseline doc to disk | — | — |
| Schedule the readout date | Confirm the date doesn't clash with a known anomaly window (releases, holidays, marketing pushes) | — |

**The split rule here.** May can run the query and snapshot the value; you know whether the baseline window is representative. MS is only useful if the baseline isn't itself an anomaly — a baseline captured during a known traffic spike will lie about the lift.

## Where this fits in the Ship stream

MS applies to **Salmon and Willy** (per [shipper.md §4](../../../../../methodology/local-agents/shipper.md#4-axis-modulation-streams-per-archetype)). Salmon: MS runs at release day, before CM. Willy: MS runs once per stage (alpha cohort, beta cohort, GA), each with its own baseline. **Skipped on Nemo and Tuna** — neither has an MP. If a Tuna's brief says "we should measure this," that's a sign the card was actually a Salmon; consider re-sigil via HB.

## When MS refuses to emit

- **No MP in the handoff** — refuses; asks Sol to add one. (Per [shipper.md §5](../../../../../methodology/local-agents/shipper.md#5-capabilities-codes-the-user-can-request-directly): MS depends on MP-named metrics.) Won't invent a baseline.
- **Query returns null / 0 sample** — refuses to record a meaningless baseline; surfaces the data gap and asks whether (a) the query needs fixing, (b) the metric isn't yet instrumented in production (Bran's IN didn't deploy yet), or (c) the time window is empty.
- **Baseline window obviously anomalous** — flags the anomaly (holiday, known incident, marketing push) and asks for a different window before recording.
- **Asked to skip MS on Salmon/Willy** — refuses. *"You ship and never learn. MS is 60 seconds; the baseline is the only way the readout means anything."*

## Model

MS is templated capture — query + snapshot + write. The judgment is in window selection and anomaly detection, both of which are surface-level checks. **Haiku** by default; escalate to **Sonnet** when the metric is composite (e.g., funnel conversion across multiple events) and the query needs interpretive composition. Set in [`agents/config.yaml → model_policy.hints.ms`](../../../../config.yaml).

---

The MP extraction, query execution, anomaly check, and baseline-doc write live in [./workflow.md](./workflow.md).
