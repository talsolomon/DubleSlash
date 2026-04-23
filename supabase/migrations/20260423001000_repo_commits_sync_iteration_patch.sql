-- =============================================================================
-- One-off patch: insert the two commits whose push-triggered sync runs failed
-- while the sync-repo-commits workflow was being debugged.
--   e3ae7ef  failed with "Network is unreachable" (direct DB → IPv6-only)
--   dae4e50  failed with SQL quoting bug (jq @json → double quotes)
-- 7487a82 onward ride the workflow cleanly. Idempotent.
-- =============================================================================

insert into public.repo_commits (sha, msg, feeds, seen_at) values
  ('e3ae7ef', 'repo_commits — backfill + per-push automation',
   null, timestamptz '2026-04-23 06:18:26+03'),
  ('dae4e50', 'sync-repo-commits — use Supabase Management API instead of direct DB',
   null, timestamptz '2026-04-23 06:20:40+03')
on conflict (sha) do nothing;
