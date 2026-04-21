-- =============================================================================
-- Duble Slash — Repo rename + recent-commits catch-up
-- Date: 2026-04-21
-- Context: GitHub repo renamed from talsolomon/collab → talsolomon/DubleSlash.
-- The Repo Activity widget reads public.repo_commits; seed stopped at f3c9448.
-- This adds the two missing commits so the widget reflects the current state.
-- Run this in the Supabase SQL editor. Safe to re-run (on conflict do nothing).
-- =============================================================================

begin;

insert into public.repo_commits (sha, msg, feeds) values
  ('ab0693f', 'Rename DoubleSlash to DubleSlash across the repo',                      null),
  ('5447b8a', 'Add FISH methodology, Supabase task board, finish Double Slash rename', 'FISH-001')
on conflict (sha) do nothing;

-- Sanity check — should list all commits, newest seen_at first.
-- The two new rows (ab0693f, 5447b8a) should appear at the top.
select sha, msg, feeds, seen_at
from public.repo_commits
order by seen_at desc;

commit;
