-- =============================================================================
-- MKT-009 — OSS launch marketing plan (seed task)
-- (Originally drafted as MKT-007; renumbered to avoid collision with the
--  "Reframe positioning" task already claiming MKT-007 on the task board.)
--
-- Captures the marketing-ensemble plan produced on 2026-04-22 by the @gtm +
-- @product-marketing + @content-marketing + @social expert lenses, channeled
-- through Mary (BMAD Analyst).
--
-- Artifact: _bmad/planning-artifacts/briefs/brief-oss-launch-marketing.md
-- Idempotent: `on conflict (id) do nothing`. Safe to re-run.
-- =============================================================================

insert into public.tasks
  (id, title, group_id, owner_id, status_id, priority_id, due, notes, github, sort_order)
values
  ('MKT-009',
   'Execute OSS launch marketing plan — threads, blogs, PH, HN, LinkedIn',
   'marketing',
   'tal',
   'todo',
   'p0',
   '2026-05-15',
   'Brief: _bmad/planning-artifacts/briefs/brief-oss-launch-marketing.md. Positioning = "the AI cloud for AI projects" + FISH methodology as moat + 13 open agents / closed cloud. Tier-0 channels: Show HN + X thread. Tier-1: PH + LinkedIn. 7-post blog calendar (D-3 → D+30). Launch-day thread (8 tweets) + LinkedIn post + 4 drip hooks drafted in the brief. Co-byline Tal + Shenhav. 5 open questions (§10) to resolve before PM/John takes it into a PRD.',
   '',
   70)
on conflict (id) do nothing;
