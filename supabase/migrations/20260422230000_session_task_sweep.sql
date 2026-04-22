-- =============================================================================
-- Session task sweep — 9 tasks surfaced during the 2026-04-22 research session
-- (BMAD teardown, agent-framework market research, install-experience brief)
-- that were added to the task-board.md but never flowed into the DB, because
-- the pipeline only syncs rows via explicit INSERTs in migration files.
--
-- Idempotent: `on conflict (id) do nothing`. Safe to re-run.
--
-- Sources:
--   _bmad/docs/bmad-teardown-for-our-agents.md
--   _bmad/docs/market-research-agent-frameworks.md
--   _bmad/planning-artifacts/briefs/brief-install-experience.md
-- =============================================================================

insert into public.tasks
  (id, title, group_id, owner_id, status_id, priority_id, due, notes, github, sort_order)
values

  -- ─── Methodology ─────────────────────────────────────────────────────────
  ('FISH-005',
   'Apply BMAD teardown punch list to local-agent specs',
   'methodology', 'tal', 'todo', 'p1', '2026-05-19',
   'From _bmad/docs/bmad-teardown-for-our-agents.md. Seven edits: (1) universal on-activation step in local-agents/README.md §2.1; (2) Typical Tuna lifecycle example in README §6; (3) add IR capability to solidifier.md §5; (4) add CC capability to solidifier.md §5; (5) add UV report template to builder.md §8; (6) make NL non-optional in shipper.md §5; (7) update Gate in system-agents/README.md to reference Sol''s IR. Depends on FISH-006 decision.',
   '',
   50),

  ('FISH-006',
   'Decide .fish/project-context.md ownership — 5th // command, system agent, or installer step?',
   'methodology', 'tal', 'todo', 'p1', '2026-04-29',
   'Highest-leverage pattern from the BMAD teardown: every agent should load a shared project-context file on activation (tech stack, design system, user personas, active PRDs). Open design question — is it (a) a new //context-init command, (b) a system-agent responsibility (Pack?), or (c) a one-time step the installer runs? Blocks FISH-005.',
   '',
   60),

  ('FISH-007',
   'Architecture decision: Claude Agent SDK (local) + LangGraph (system) + MCP transport',
   'methodology', 'tal', 'todo', 'p0', '2026-04-29',
   'From _bmad/docs/market-research-agent-frameworks.md §9 rec 4+5. Don''t invent a new orchestration primitive. Claude Agent SDK gives native sub-agents + hooks for Nova/Sol/Bram/Sage; LangGraph gives production-grade state for Gate/Loom (V2). Every 2026 framework adopted MCP — our capture layer must speak it fluently. Blocks FISH-003 engineering. Co-owner: Shenhav.',
   '',
   70),

  ('FISH-008',
   'Write the install-bundle content: AGENTS.md · CLAUDE.md · .cursor/rules/fish.mdc',
   'methodology', 'tal', 'todo', 'p0', '2026-05-05',
   'Per _bmad/planning-artifacts/briefs/brief-install-experience.md §"What the command does" step 2. The engineering (FISH-003) writes these files to the right places; this task is the actual content — the methodology payload that makes //explore / //solidify / //build / //ship work. Can progress in parallel with FISH-003 engineering.',
   '',
   80),

  -- ─── Marketing ───────────────────────────────────────────────────────────
  ('MKT-007',
   'Reframe positioning to "methodology layer for AI-assisted product work" across website, docs, pitch deck',
   'marketing', 'tal', 'todo', 'p1', '2026-05-12',
   'From _bmad/docs/market-research-agent-frameworks.md §9 rec 1. The "capture layer" and "collab layer" framings are increasingly claimed by competitors; "methodology layer" is the empty slot. Updates: hero copy, pitch-deck cover, brief preface, PRD header. Co-owner: Shenhav.',
   '',
   65),

  ('MKT-008',
   'Build BMAD-vs-FISH comparison page for OSS launch',
   'marketing', 'tal', 'todo', 'p1', null,
   'Due: before OSS launch. BMAD is our real Category C competitor and has a 6-month head start. Three diffs to memorize: (a) designer-led not engineer-led, (b) cross-tool not IDE-locked, (c) axis modulation + archetypes + reverse-flow handoffs. Lives at methodology/vs-bmad.md or on the website.',
   '',
   66),

  -- ─── Design / Web ────────────────────────────────────────────────────────
  ('DES-003',
   'Replace website hero CTA with the one-liner install command (copy button)',
   'design', 'shenhav', 'todo', 'p1', null,
   'Due: after DES-001. Per _bmad/planning-artifacts/briefs/brief-install-experience.md. The install command IS the demo. Single copy button, one line: npx @dubleslash/install. No signup, no "learn more" — the thing they copy literally installs the product.',
   '',
   30),

  -- ─── Ops / Research ──────────────────────────────────────────────────────
  ('OPS-003',
   'Apple Developer account + macOS notarization pipeline',
   'ops', 'tal', 'todo', 'p0', '2026-04-29',
   'Hard blocker on FISH-003. macOS Gatekeeper will block an unsigned desktop client. Apple Developer account ($99/yr) + certs + notarization workflow. Lead time is days, not hours — must start immediately. Also feeds potential App Store distribution later.',
   '',
   30),

  ('OPS-004',
   'Tech research: AGENTS.md merge strategy · ChatGPT Desktop install surface · Windows code signing',
   'ops', 'shenhav', 'todo', 'p0', '2026-04-29',
   'Per brief-install-experience.md open questions. Three investigations before FISH-003 engineering starts: (1) AGENTS.md merge when a repo already has one — proposed idempotent "## FISH" section with a marker; confirm. (2) ChatGPT Desktop has no official Custom Instructions install API — unofficial surface or one-line paste fallback? (3) Windows SmartScreen code-signing process + cert cost for the v1 Windows tray client. Output: short memo per topic, add to _bmad/docs/.',
   '',
   40)

on conflict (id) do nothing;

-- =============================================================================
-- Refresh FISH-003 — scope rewritten 2026-04-22 per brief-install-experience.md.
-- Old scope was "paste per-tool plumbing"; new scope is "one-command install +
-- macOS menu-bar client". Title + notes update in place; id/group/owner/status/
-- priority/sort_order unchanged.
-- =============================================================================

update public.tasks
   set title = 'Build the one-command install + macOS menu-bar client',
       notes = 'Scope rewritten 2026-04-22 per _bmad/planning-artifacts/briefs/brief-install-experience.md. North star: npx @dubleslash/install → // icon appears in menu bar in ≤20s, first //explore works on first try. Replaces per-tool paste plumbing. New deps: Apple Developer account + notarization (OPS-003), macOS desktop client scaffold, AGENTS.md merge logic (OPS-004), Tally runs inside the client from second one. Install-bundle content is FISH-008. Architecture decision is FISH-007. Depends on FISH-002, OPS-003, OPS-004, FISH-007.',
       due   = date '2026-05-12'
 where id = 'FISH-003';
