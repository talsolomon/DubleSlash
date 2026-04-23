-- =============================================================================
-- repo_commits backfill — catch up 27 commits since ab0693f (repo rename)
-- ---------------------------------------------------------------------------
-- The `repo_commits` table (rendered as the REPO ACTIVITY widget on the task
-- board) is currently seeded only by hand via migration files. The last seed
-- was in 20260421100000_repo_rename.sql and covered three commits; since then
-- ~27 more commits have landed on main without being added, so the widget
-- looks stalled at "Rename DoubleSlash to DubleSlash across the repo."
--
-- This migration backfills all of them with accurate commit timestamps
-- (seen_at) so the widget orders correctly. Where a commit clearly advances a
-- tracked task, the `feeds` column links it.
--
-- Going forward: adding commits to this table should be automated (a
-- per-push GitHub Action is the follow-up). Until that ships, any commit
-- worth surfacing in the widget needs an explicit INSERT in the next
-- migration.
--
-- Idempotent: on conflict (sha) do nothing.
-- =============================================================================

insert into public.repo_commits (sha, msg, feeds, seen_at) values
  ('a9dcc16', 'Fix GitHub links and seed recent commits after repo rename',
   null, timestamptz '2026-04-21 15:49:39+03'),

  ('7bdc8ed', 'Wire up git→DB pipeline for task board; close FISH-001 + FISH-002',
   'FISH-001,FISH-002', timestamptz '2026-04-21 16:53:23+03'),

  ('254b68e', 'Add Outreach tab + contacts CRM to task board',
   'MKT-001', timestamptz '2026-04-21 17:14:30+03'),

  ('9dcb52c', 'chore: restore talsolomon git identity for Vercel deploy auth',
   null, timestamptz '2026-04-21 18:28:46+03'),

  ('4ae7efe', 'Seed outreach leaders & studios; add drag-and-drop (#2)',
   'MKT-001', timestamptz '2026-04-21 20:31:38+03'),

  ('b84c785', 'Correct outreach employers: Waissman→Empathy, Barkan→Waze, Arbel→Monday (#3)',
   'MKT-001', timestamptz '2026-04-21 21:01:13+03'),

  ('e6b7ad5', 'Import 39 design leaders from LinkedIn connections CSV (#4)',
   'MKT-001', timestamptz '2026-04-21 21:24:28+03'),

  ('0a6caaa', 'Local-agent specs v2 — embodied playbooks for Explorer / Solidifier / Builder / Shipper',
   'FISH-002', timestamptz '2026-04-21 21:58:06+03'),

  ('6342b6e', 'System-agents v2 — pipeline illustration, call-signs, per-agent schemas, end-to-end walkthroughs',
   'FISH-002', timestamptz '2026-04-21 22:21:18+03'),

  ('0104cf6', 'Unified agents-overview doc — one map for all 13 agents',
   'FISH-002', timestamptz '2026-04-21 22:32:23+03'),

  ('363720a', 'FISH spec polish — add version field and the four-moves-at-gates taxonomy',
   'FISH-001', timestamptz '2026-04-21 23:01:46+03'),

  ('fe54e4b', 'Landing page — replace VS Code reveal with GitHub PR panel + tighten hero',
   'DES-001', timestamptz '2026-04-21 23:01:57+03'),

  ('38b95c2', 'Expert shortcuts — 136 loanable @handle specialists across 18 categories',
   'FISH-009', timestamptz '2026-04-21 23:42:26+03'),

  ('aa9e4a8', 'Planning artifacts — company values draft, problem-validation research plan, PRD-004 on task board',
   'PRD-004', timestamptz '2026-04-21 23:54:09+03'),

  ('c495c34', 'Planning artifacts reorg + live Interviews tab',
   'RES-001', timestamptz '2026-04-22 20:01:27+03'),

  ('b4aa1d4', 'Interview mode inside Tasks + template + remove My Week',
   'RES-001', timestamptz '2026-04-22 20:45:26+03'),

  ('57ba5da', 'nit: stale My Week comment in currentPersonId',
   null, timestamptz '2026-04-22 20:46:37+03'),

  ('d7b9470', 'Interview v2: leaner flow, Preview mode, live git sync',
   'RES-001', timestamptz '2026-04-22 22:06:42+03'),

  ('679eab4', 'Marketing — OSS launch plan brief + MKT-009 task, install-experience brief, task-board sync',
   'MKT-009', timestamptz '2026-04-22 22:12:54+03'),

  ('164ee1b', 'Revert the git-sync serverless function',
   null, timestamptz '2026-04-22 22:15:18+03'),

  ('963dcf8', 'Check in tooling configs, BMAD v6.3.0 framework, skills + hyperframes assets',
   null, timestamptz '2026-04-22 22:16:50+03'),

  ('70e2545', 'Add website/video/SCRIPT.md — stray hyperframes script',
   null, timestamptz '2026-04-22 22:17:08+03'),

  ('7af8703', 'Session task sweep migration — insert 9 tasks, refresh FISH-003',
   'FISH-005,FISH-006,FISH-007,FISH-008,OPS-003,OPS-004,MKT-007,MKT-008,DES-003',
   timestamptz '2026-04-22 22:30:26+03'),

  ('2ccb3d4', 'many changes',
   null, timestamptz '2026-04-22 22:37:36+03'),

  ('0af6900', 'final',
   null, timestamptz '2026-04-22 22:38:07+03'),

  ('6779897', 'Task board full sync — close 19-task gap between markdown and DB',
   'FISH-009,MKT-010,MKT-011,MKT-012,PRD-004,PRD-005,PRD-006,DES-004,DES-005,DES-006,OPS-005,OPS-006,OPS-007,OPS-008,OPS-009,RES-001,RES-002,RES-003,RES-004',
   timestamptz '2026-04-23 06:05:53+03'),

  ('2cbdc6a', 'Task board — group tabs on Board view',
   null, timestamptz '2026-04-23 06:12:13+03')

on conflict (sha) do nothing;
