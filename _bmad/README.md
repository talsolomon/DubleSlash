# BMAD Method — Collab

This is the BMAD (AI-driven agile development) workspace for the Collab project.
All BMAD files live in `_bmad/` and `.claude/commands/bmad-*` — completely separate from the platform code in `src/`.

---

## How to start — every designer does this once per branch

**Step 1:** Pull the `Designers` branch and create your own branch:
```
git checkout Designers
git pull
git checkout -b your-name-or-feature
```

**Step 2:** Run `/bmad-generate-project-context` — this is your starting point. It will:
- Ask your name (sets you up so all agents know who you are)
- Ask what you're working on (free-form — describe the project or feature)
- Read the codebase and generate the shared context file all agents use

That's it. After that, use whatever BMAD commands suit your work.

---

## What to use for what

| I want to... | Use this command |
|---|---|
| Brainstorm an idea or explore a problem | `/bmad-agent-analyst` → BP |
| Write a quick brief for an early idea | `/bmad-create-product-brief` |
| Create a full PRD | `/bmad-create-prd` |
| Work through UX flows and design specs | `/bmad-agent-ux-designer` |
| Map user flows, wireframe in words | `/bmad-agent-ux-designer` → UF or WF |
| Do structured product work (PRD + stories) | `/bmad-agent-pm` |
| Break a PRD into dev tasks | `/bmad-create-epics-and-stories` |

---

## Typical workflow for a new feature

```
1. FIRST TIME SETUP
   └── /bmad-generate-project-context  ← always start here

2. Brainstorm / explore
   └── /bmad-agent-analyst  (Mary)

3. Capture the idea
   └── /bmad-create-product-brief

4. Full requirements
   └── /bmad-create-prd  or  /bmad-agent-pm (John)

5. UX design doc
   └── /bmad-agent-ux-designer  (Sally)

6. Handoff to devs (optional)
   └── /bmad-agent-pm → CE (Epics & Stories)
```

---

## Where artifacts are saved

| What | Where |
|---|---|
| Briefs, PRDs, UX docs, brainstorms | `_bmad/planning-artifacts/` |
| Epics & stories for dev handoff | `_bmad/implementation-artifacts/` |
| Research, project knowledge | `_bmad/docs/` |

All artifacts stay in `_bmad/` — never in `src/`.

---

## Project config

Edit [`_bmad/bmm/config.yaml`](bmm/config.yaml) to change:
- Project name
- Output paths
- Communication language
- Experience level (beginner / intermediate / expert) — affects how agents explain things

---

## Customizing the agents

Each BMAD command is a plain markdown file in `.claude/commands/`:

**Agents (persistent personas):**

| Command | Agent | Use for |
|---|---|---|
| `/bmad-agent-analyst` | Mary | Brainstorming, market/domain research, product briefs |
| `/bmad-agent-pm` | John | PRD creation, validation, epics & stories |
| `/bmad-agent-ux-designer` | Sally | UX flows, wireframes, design specs |
| `/bmad-agent-architect` | Winston | Architecture decisions, implementation readiness |
| `/bmad-agent-tech-writer` | Paige | Documentation, Mermaid diagrams, concept explanations |
| `/bmad-agent-sm` | Bob | Sprint planning, story prep, agile ceremonies |
| `/bmad-agent-dev` | Amelia | Story implementation, code review, TDD |
| `/bmad-agent-qa` | Quinn | Test generation, design QA |

**Workflow commands (direct, no persona):**

| Command | Use for |
|---|---|
| `/bmad-create-product-brief` | Quick brief for an early idea |
| `/bmad-create-prd` | Full PRD creation workflow |
| `/bmad-edit-prd` | Edit an existing PRD |
| `/bmad-validate-prd` | Check a PRD is developer-ready |
| `/bmad-create-epics-and-stories` | Break a PRD into epics & stories |
| `/bmad-sprint-planning` | Sequence stories into a sprint plan |
| `/bmad-generate-project-context` | Create/update the shared AI context file |
| `/bmad-document-project` | Document an existing feature or codebase |

Edit them freely. The method is a starting point — customise as the team learns what works.

---

## Delivering code to engineers

BMAD helps you plan and spec. The actual deliverable is code in `src/` — components, pages, whatever you built. That part merges normally into any branch.

The BMAD files (`_bmad/`, `.claude/commands/bmad-*.md`) are excluded from engineer merges automatically via `.gitattributes`. Engineers get your `src/` changes, nothing else.

---

## For engineers merging from Designers

BMAD files are excluded automatically via `.gitattributes` using the `ours` merge strategy.
**One-time setup per machine (run once, then forget):**
```sh
git config --global merge.ours.driver true
```
After that, `git merge Designers` (or from any Designers-derived branch) will pull in all `src/` changes and silently ignore `_bmad/` and BMAD commands.
