---
name: ds-hs-heuristic-scan
description: Dora does a structured 4-pass expert read on the card — conventions, risks, gaps, recommendation. Anchored in Nielsen's heuristics plus your project's own patterns. Produces a scan document Sol can anchor the brief against, and a next-method recommendation Dora will nudge toward.
---

# Heuristic Scan — Dora runs this

**Who's at the wheel.** Dora. Expert-reader mode — the way a senior designer would audit a flow in 20 minutes if dropped in cold. No punches pulled; no filler passes.

## What you get

At the end of HS you're holding:

- **A scan document** at `planning/scans/hs-<card-id>-<date>.md` with 4 labeled sections: Conventions · Risks · Gaps · Recommendation.
- **3–7 named conventions** likely to govern this card — with one-line justifications each, anchored in the project's design system, domain patterns, or platform norms (not generic Nielsen-speak).
- **3–7 scored risks** (low / med / high) across compliance, performance, adoption, social, security — each specific enough that Sol can decide how to address it.
- **3–7 framed gaps** — things we don't know yet, each rewritten as a question Sol will need to answer in the brief.
- **A next-method recommendation** — Dora tells you which Explore method (IP if user gaps dominate, CS if convention questions dominate, or HO to Sol if the scan answered enough) and why.
- **A handoff draft ready to emit** if the recommendation is HO — Dora drafts `locked` (conventions) + `open` (Sol-facing gap questions) + `artifacts`.

## How Dora and you split the work

| Dora (AI) does | You do | We iterate together |
|---|---|---|
| Read the card frontmatter + sigil + any preceding handoff | Confirm the problem framing if Dora's read differs from yours | If Dora misread, we reset before running the 4 passes — wrong problem framing poisons all 4 outputs |
| Pass 1 — propose conventions from domain patterns, design system, platform norms, project_context | Name the conventions Dora missed (your codebase, your domain knowledge) | Dora adds yours to the list with attribution |
| Pass 2 — propose risks across 5 axes, score each low/med/high | Recalibrate severity (Dora defaults toward caution) and kill any that don't apply in your reality | Dora rewrites severity justification based on your reasoning |
| Pass 3 — propose gaps as Sol-facing questions | Add gaps Dora couldn't see (institutional knowledge, recent incidents, team context) | — |
| Pass 4 — recommend next method based on the gap distribution | Accept the recommendation or pick a different one; Dora explains why her pick was what it was | If you pick against the recommendation, Dora surfaces the nudge but doesn't refuse |
| Draft the handoff block if Step 5 leads to HO | Confirm `locked` and `open` are what you'd actually want Sol to see | Edit until you sign off |

**The split rule here.** Dora is faster at first-pass enumeration (conventions, risks, gaps); you're faster at knowing *your team's reality* (what's already shipped, what broke last quarter, what your designers already ruled out). HS is only as useful as your domain-knowledge overlay — don't skip the "what Dora missed" step.

## Where this fits in the Explore stream

HS is the **Nemo and Tuna bread-and-butter** — per flow.md §6, it's in the Nemo cell (heuristic scan + competitor scan + micro-brief) and the Tuna cell (adds journey meetings, OSD, convention inventory). On Salmon or Willy, HS runs as a **warm-up before interviews** — it names the conventions + risks Dora can see from the outside, so IP can focus interview time on the user-knowledge gaps HS surfaced.

On Nemos, HS often *is* the whole Explore phase — 4 passes, one handoff to Sol, done.

## Model

4 passes of expert enumeration with severity judgment is where **Sonnet** earns its cost. Conventions and risks both need nuance — *"users trust progress indicators that appear monotonic"* is a different claim than *"users like progress indicators,"* and Haiku tends to produce the second. We use Sonnet by default for HS; drop to Haiku only on a small Nemo where the heuristic set is obvious and speed beats nuance. Set in [`agents/config.yaml → model_policy.hints.hs`](../../../../config.yaml).

---

The 4 passes, the handoff assembly, and the next-method branching logic live in [./workflow.md](./workflow.md).
