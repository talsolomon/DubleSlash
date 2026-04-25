# Duble Slash — FLOW agents bundle

A self-contained snapshot of the **FLOW methodology** + the **operator-layer agents** (Dora · Sol · Bran · May) and their skills. Drop this folder into a fresh git repo and everything inside still resolves.

---

## What's inside

```
duble-slash-flow-agents/
├── README.md                          ← you are here
├── .gitignore
├── agents/                            ← the agent system
│   ├── manifest.yaml                    top-level: which modules exist + how config layers
│   ├── config.yaml                      project-wide config + model_policy.hints per capability
│   ├── agent-manifest.csv               4 operators (Dora, Sol, Bran, May)
│   ├── skill-manifest.csv               43 skills (4 operators + 37 sub-skills + 2 helpers)
│   ├── operators/
│   │   ├── dora/                          Explorer (head, phase 1) — 9 sub-skills
│   │   ├── sol/                           Solidifier (left body, phase 2) — 11 sub-skills
│   │   ├── bran/                          Builder (right body, phase 3) — 7 sub-skills
│   │   └── may/                           Shipper (tail, phase 4) — 10 sub-skills
│   └── helpers/
│       ├── handoff-compose/               <FLOW-handoff> emit (forward transition)
│       └── handback-compose/              reverse <FLOW-handoff> (rewind a phase)
└── methodology/
    ├── README.md                        navigation + status of each subfolder
    ├── flow.md                          the canonical methodology spec (~1,100 lines, 15 sections)
    ├── agents-overview.md               two-layer agent system explainer
    ├── local-agents/                    OSS local-agent specs (the 4 operator personas + experts roster)
    ├── system-agents/                   platform / system-agent README (cloud roster, V1 multiplayer story)
    └── fish/                            ⚠️ SUPERSEDED by flow.md — kept as lineage docs (referenced from older specs)
```

## Operator + sub-skill registry

| Operator | Phase | Anatomy | Sigil-default codes | Total sub-skills |
|---|---|---|---|---|
| **Dora** 🔭 (Explorer) | Explore | head | SA · HS · HMW · JM · CS · IP · NB · PM · SR | 9 |
| **Sol** 🧊 (Solidifier) | Solidify | left body | SK · BR · SB · PT · CT · AC · MP · DL · TA · WF · AD | 11 |
| **Bran** 🔨 (Builder) | Build | right body | CR · SL · GE · TE · UV · IN · PR | 7 |
| **May** 🚢 (Shipper) | Ship | tail | RE · CM · CH · RN · TG · MS · MR · RP · TR · NL | 10 |

Plus helpers **HO** (handoff) and **HB** (handback) shared across all four operators.

Each sub-skill folder follows the same shape:
```
{code}-{slug}/
├── SKILL.md          ← persona-faithful description (what / when / refusals / model rationale)
└── workflow.md       ← inline-XML steps with HALT gates, [H][E][C] menu, facilitation guidelines
```

## Layout invariants (don't break these on copy)

The agent files use relative paths like `../../../methodology/flow.md` and `../../../../config.yaml`. The bundle preserves the exact tree depth that those paths assume:

- `agents/` and `methodology/` must be **siblings** at the bundle root.
- Operator skill folders must remain at depth `agents/operators/{op}/skills/{code}-{slug}/`.
- Helpers must remain at `agents/helpers/{name}/`.

If you move things around, run a quick cross-ref check (see *Verifying* below).

## Verifying after copy

The bundle ships clean: 342 markdown cross-refs all resolve. To re-verify after moving:

```bash
python3 -c "
import os, re, glob
broken=[]
for fp in glob.glob('**/*.md', recursive=True):
    d = os.path.dirname(fp)
    txt = open(fp, errors='ignore').read()
    for m in re.finditer(r'\]\(([^)]+)\)', txt):
        t = m.group(1)
        if t.startswith(('http','mailto:','#')): continue
        p = t.split('#')[0]
        if p and not os.path.exists(os.path.normpath(os.path.join(d, p))):
            broken.append((fp, t))
print(len(broken), 'broken')
for x in broken: print(' ', x)
"
```

## What was excluded from this bundle

Project-internal artifacts that don't belong in a methodology-only export:

- **`planning/`** — task board, briefs, brainstorms, research, articles, pitch decks. Project state, not methodology.
- **`_bmad/`** — BMAD teardown notes + shape-adoption study. Internal R&D for the rebuild.
- **`website/`** — landing-page code.
- **`supabase/`** — DB migrations for the project's own task-board sync.

Six "see also" links from `methodology/local-agents/*.md` and `methodology/system-agents/README.md` previously pointed into `planning/`. These were rewritten to plain text in the bundle copy with the marker `*(project-internal reference; not bundled)*` so the bundle stays link-clean.

Three older references in the superseded `methodology/fish/` folder pointed to a never-existed pre-rebuild path (`../agents/`); these were similarly delinked with the marker `*(stale reference; pre-rebuild path)*`.

The source repo retains all original links; the rewrites only exist in this bundle.

## What you'll want to add when this becomes its own repo

- Your own `LICENSE` (the source repo is OSS-track but no license file shipped yet).
- A real top-level `CLAUDE.md` if you want repo-specific Claude Code guidance.
- A `package.json` / installer if you want to expose the agents via `npx` or as a Claude Code skill bundle.
- The 6 expert agents (DesignOps, TechPM, Architect, QA, Analyst, AssetCreator) — open work in the source repo's FISH-013 ticket; not yet built.

## Provenance

Snapshot from `talsolomon/DubleSlash@main`, commit `ee05772` (the commit that landed Bran + May).

Generated 2026-04-25.
