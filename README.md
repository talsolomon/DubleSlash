# Duble Slash

Logo: **Duble//Slash**, or **//**.

Working directory: `~/Documents/dubleslash`. Prior working names: Collab → Trace → Duble Slash.

## Project layout

| Folder        | What it is                                | Vercel project        | Production URL                              |
|---------------|-------------------------------------------|-----------------------|---------------------------------------------|
| [methodology/](methodology/) | **The moat** — FLOW method + the local-agent + system-agent specs that enact it | — | — |
| [agents/](agents/) | Operator-layer agents (Dora · Sol · Bran · May) + helpers (handoff / handback compose) + manifests + config — the runtime that enacts FLOW | — | — |
| [planning/](planning/) | Briefs, PRDs, UX, pitch decks, research, stories, articles, brainstorms, **task-board.md** (source of truth) | — | — |
| [website/](website/) | Public marketing site (the Hero stage) | `dubleslash-website` *(rename pending)* | https://website-rouge-three-68.vercel.app |
| [tasks/](tasks/) | Internal task-board viewer for Tal + Shenhav (reads from Supabase; source of truth lives in `planning/task-board.md`) | `dubleslash-tasks` *(rename pending)* | https://tasks-seven-zeta.vercel.app |
| [supabase/](supabase/) | DB schema + seed for the task board | — | — |
| [skills/](skills/) | Symlinks to HyperFrames skills (rendering pipeline) — not part of the FLOW agent system | — | — |
| [_bmad/](_bmad/) | BMAD framework scaffolding + teardown notes used during the rebuild study | — | — |

The two Vercel projects currently live under the generic names `website` and `tasks`. Rename them in the [Vercel dashboard](https://vercel.com/talsolomon21-gmailcoms-projects) → Settings → General. See [`tasks/README.md`](tasks/README.md) for the full task-board setup, including how to give Shenhav access.

## The FLOW agent system

Four operators, one per phase of the FLOW lifecycle:

| Operator | Phase | Anatomy | Sub-skills |
|---|---|---|---|
| **Dora** 🔭 (Explorer) | Explore | head | SA · HS · HMW · JM · CS · IP · NB · PM · SR |
| **Sol** 🧊 (Solidifier) | Solidify | left body | SK · BR · SB · PT · CT · AC · MP · DL · TA · WF · AD |
| **Bran** 🔨 (Builder) | Build | right body | CR · SL · GE · TE · UV · IN · PR |
| **May** 🚢 (Shipper) | Ship | tail | RE · CM · CH · RN · TG · MS · MR · RP · TR · NL |

Plus shared helpers **HO** (handoff) and **HB** (handback). Expert-layer agents (DesignOps · TechPM · Architect · QA · Analyst · AssetCreator) are in progress — see FISH-013 in [`planning/task-board.md`](planning/task-board.md).

The full methodology is in [`methodology/flow.md`](methodology/flow.md). The two-layer agent system overview is in [`methodology/agents-overview.md`](methodology/agents-overview.md).

## Naming history

- **FISH → FLOW** (2026-04-24): the methodology was renamed to better match the company value "flows, not frames". Older docs and historical log entries retain `FISH-*` ticket IDs and references; the canonical spec is now [`methodology/flow.md`](methodology/flow.md).
- **Operator names** (2026-04-23 rebuild): Nova → Dora, Bram → Bran, Sage → May. Sol unchanged.
- **Context Cloud → Duble Slash Cloud** (rename sweep pending in FISH-014).
