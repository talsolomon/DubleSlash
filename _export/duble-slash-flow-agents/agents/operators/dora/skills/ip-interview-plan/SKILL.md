---
name: ds-ip-interview-plan
description: Dora produces a runnable interview plan — target cohort, research questions, screener, semi-structured guide, consent posture, analysis method. Mom Test-rigorous (behavior and past events only). Salmon/Willy standard; optional Tuna. What you can hand a recruiter or run yourself tomorrow.
---

# Interview Plan — Dora runs this

**Who's at the wheel.** Dora. Rigor mode — this is where the card's epistemics live. A plan with leading questions contaminates 5 hours of interview time downstream. Dora will push back hard on opinion-seeking or future-speculating IQs.

## What you get

At the end of IP you're holding a document a recruiter can work against tomorrow and an interviewer can read into without a second prep session:

- **A plan document** at `planning/research/user/ip-<card-id>-<date>.md`.
- **2–4 research questions (RQs)** — what Dora wants to learn — each answerable by behavior or past events (Mom Test / Fitzpatrick), each framed to produce a decision, not a datum.
- **A target cohort + sample size** specific enough to recruit against (*"PMs at B2B SaaS co's 50–500 employees who own an onboarding flow,"* not "SaaS PMs"), sized to archetype (Tuna 3–5 · Salmon 5–8 · Willy 8–15 across personas).
- **A 5–7 question screener** — each with a disqualifying answer, each behavior-anchored, total screener < 3 minutes.
- **A semi-structured guide** — warm-up (2 min) → context (5 min) → behavior probes anchored in past events (15–20 min) → close (3 min). 2–3 IQs per RQ. Silence cues included. 2–3 wildcard follow-ups for unexpected threads.
- **A logistics + ethics block** — consent language (explicit opt-in + withdrawal), recording + incentive posture, recruitment channels, scheduling, data handling, PII redaction policy, deletion timeline.
- **An analysis-method commitment** — NB (Dora's default for 5+ interviews), affinity clustering, or statement analysis — picked up front, not after the interviews pile up.
- **A "done" clause** — one-line criterion for when we'll consider the study conclusive (saturation signal, coverage of the RQs).

## How Dora and you split the work

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Read prior artifacts (card, HS, CS, JM, project_context) to surface the research gaps | Confirm the gaps are the real ones; add gaps Dora can't see (team-internal knowledge, political sensitivities, recent incidents) | — |
| Draft 2–4 RQs anchored in behavior (Mom Test-compliant) | Reject opinion-seeking RQs Dora might have slipped in; add RQs only you know are load-bearing | Dora rewrites each RQ until it's answerable by past events or observable behavior |
| Draft the screener with disqualifying questions | Tighten the cohort definition — you know whether "B2B SaaS" is too broad for your context | — |
| Draft the guide with 2–3 IQ probes per RQ + silence cues + wildcards | Rewrite probes in your team's language; kill IQs that are leading | Dora re-sequences the guide after you edit — warm-up first, behavior probes in the middle, close last |
| Draft the logistics + ethics block | Set the real-world specifics (who recruits, what's the incentive, where the recordings live, who has access) | Dora updates the document as you confirm |
| Recommend the analysis method + sample size + "done" clause | Override the sample size if you have real-world constraints; confirm the analysis method fits your team | — |

**The split rule here.** AI is good at Mom Test compliance checking (flag leading questions, future-speculation, opinion probes) and at templated structure. You're irreplaceable on cohort precision, incentive reality, and political sensitivity — *"we can't ask enterprise customers about their procurement process in this way because X."*

## Where this fits in the Explore stream

IP is in the **Salmon cell** (user interviews are standard), the **Willy cell** (interviews across personas are standard), and optionally the **Tuna cell** when a convention is disputed or a product-data question has no behavioral answer yet. Not in the Nemo cell — Nemos run on conventions + heuristic scans, not interviews.

After IP, interviews happen (outside the scope of this skill — that's human + recruiter work). The synthesis skill that follows is **NB** (Nugget Board), which takes the transcripts and turns them into the Sol-facing findings.

## Model

Templated plan generation — cohort, RQs, screener, guide, logistics — is **Haiku** territory. Where you might escalate to Sonnet is when RQs need to be derived from contested prior research (multiple theories on the table) and the Mom Test framing needs interpretive nuance to keep them behavior-anchored rather than opinion-anchored. Rare. Set in [`agents/config.yaml → model_policy.hints.ip`](../../../../config.yaml).

---

The per-section drafting sequence, Mom Test compliance checks, and logistics block are in [./workflow.md](./workflow.md).
