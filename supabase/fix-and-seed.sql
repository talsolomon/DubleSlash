-- =============================================================================
-- Recovery patch — run this in Supabase SQL Editor.
-- Fixes the "already member of publication" error and completes the seed.
-- Safe to re-run.
-- =============================================================================

-- ── 1. Make publication adds idempotent ─────────────────────────────────────
do $$
declare t text;
begin
  foreach t in array array['tasks','kpis','repo_commits','groups','people','statuses','priorities'] loop
    begin
      execute format('alter publication supabase_realtime add table public.%I', t);
    exception when duplicate_object then
      null; -- already in publication, skip
    end;
  end loop;
end $$;

-- ── 2. Seed (idempotent; on conflict do nothing) ────────────────────────────
insert into public.groups (id, name, icon, sort_order) values
  ('marketing',   'Marketing & Outreach', '📣', 10),
  ('product',     'Product / PRD',        '🏗', 20),
  ('security',    'Dev / Security',       '🛠', 30),
  ('design',      'Design / Web',         '🎨', 40),
  ('methodology', 'Methodology (FISH)',   '🔬', 50),
  ('ops',         'Ops / Research',       '⚙️', 60)
on conflict (id) do nothing;

insert into public.people (id, name) values
  ('tal',     'Tal'),
  ('shenhav', 'Shenhav'),
  ('claude',  'Claude'),
  ('advisor', 'Advisor (TBD)')
on conflict (id) do nothing;

insert into public.statuses (id, label, sort_order) values
  ('todo',        'Todo',        10),
  ('in_progress', 'In Progress', 20),
  ('blocked',     'Blocked',     30),
  ('review',      'Review',      40),
  ('done',        'Done',        50),
  ('parked',      'Parked',      60)
on conflict (id) do nothing;

insert into public.priorities (id, label, sort_order) values
  ('p0', 'P0', 10),
  ('p1', 'P1', 20),
  ('p2', 'P2', 30)
on conflict (id) do nothing;

insert into public.kpis (id, metric, current, target, signal, sort_order) values
  ('M1', 'GitHub stars',                              '0', '≥ 1,000',                         'GitHub API',                  10),
  ('M2', 'Opt-in install counter',                    '0', '≥ 200 (~600 actual @ 30%)',       'PostHog OSS',                 20),
  ('M3', 'Capture reliability (3 tools × 10 types)',  '—', '≥ 90%',                           'Internal test matrix',        30),
  ('M4', 'Security / privacy backlash incidents',     '0', '0',                               'Social + inbox monitoring',   40),
  ('M5', 'LLM lab partnership convos opened',         '0', '≥ 1 (Anthropic)',                 'Founder outreach log',        50),
  ('M6', 'HN / Twitter front-page moment',            '0', '≥ 1 thread, 100+ engagements',    'Social monitoring',           60),
  ('M7', 'Non-founder PRs merged to OSS repo',        '0', '≥ 10',                            'GitHub',                      70),
  ('M8', 'Crash-free session rate',                   '—', '≥ 99%',                           'Sentry OSS (opt-in subset)',  80),
  ('M9', 'Time-to-first-capture (usability, n=5)',    '—', '≤ 5 minutes',                     'Moderated usability',         90)
on conflict (id) do nothing;

insert into public.tasks (id, title, group_id, owner_id, status_id, priority_id, due, notes, github, sort_order) values
  ('MKT-001', 'Build outreach list of Israeli design leaders',                        'marketing',   'tal',     'todo',        'p0', '2026-04-28', 'Seed: Tali Lavie (Gong), Aviran Revah (Atera), Ido Zaifman (Studio Kido). Target 20–30 names.', '',         10),
  ('MKT-002', 'Post in WhatsApp group of design leaders',                              'marketing',   'tal',     'blocked',     'p1', null,         'Blocked on DES-001 (website) + PRD-002 (manifesto). Single post; don''t burn the channel.',     '',         20),
  ('MKT-003', 'Post in Facebook design groups + student communities',                  'marketing',   'tal',     'blocked',     'p1', null,         'Blocked on DES-001 + PRD-002. Separate copy per audience (leaders vs. students).',              '',         30),
  ('MKT-004', 'Map TLV + Herzliya startups by proximity; one day per cluster',         'marketing',   'tal',     'todo',        'p1', '2026-05-05', 'Clusters: מתחם אלון (TLV), Sarona (TLV), Rothschild, Ramat HaHayal, Herzliya Pituach.',         '',         40),
  ('MKT-005', 'Book demo days per cluster (4–6 meetings/day)',                         'marketing',   'tal',     'parked',      'p2', null,         'Unblocks after MKT-001 + MKT-004 complete.',                                                    '',         50),
  ('MKT-006', 'Create outreach log (name, co., cluster, last touch, next step)',       'marketing',   'tal',     'todo',        'p2', '2026-05-01', 'Feeds M5 (lab convos) + general pipeline tracking.',                                            '',         60),
  ('PRD-001', 'Re-write PRD around Context Cloud framing',                              'product',     'tal',     'todo',        'p1', '2026-05-19', 'Demoted P0→P1 on 2026-04-21. Blocked-adjacent on FISH-001 — can''t rewrite PRD around Context Cloud until FISH is specified. May supersede existing OSS-launch PRD.', '',         10),
  ('PRD-002', 'Write Duble Slash manifesto (Lean Startup-style)',                      'product',     'tal',     'todo',        'p1', '2026-05-05', 'Pillars: test-oriented, experimental, community-connected. Gates MKT-002 + MKT-003.',           '',         20),
  ('PRD-003', 'Reconcile manifesto + new PRD with brief + deck',                        'product',     'tal',     'parked',      'p2', null,         'Detect contradictions; update brief where superseded.',                                         '',         30),
  ('SEC-001', 'Recruit technical advisor for vulnerability review',                    'security',    'tal',     'todo',        'p1', '2026-05-12', 'Scope: browser extension + macOS AX capture paths. Risk mitigator for M4.',                     '',         10),
  ('SEC-002', 'Define security review SOW with advisor',                               'security',    'shenhav', 'parked',      'p2', null,         'After SEC-001. Threat model, scope, deliverable format.',                                       '',         20),
  ('DES-001', 'Build public website with hero animation',                              'design',      'shenhav', 'in_progress', 'p0', '2026-05-05', 'Latest: c34c4e4 (larger stage, refined menubar icon, quicklook tail). Gates MKT-002/003.',      'c34c4e4',  10),
  ('DES-002', 'Performance pass on hero animation (Lottie/Rive, not video)',           'design',      'shenhav', 'todo',        'p1', '2026-05-05', 'LCP must fire on the headline in resting state, not on animation completion.',                 '',         20),
  ('FISH-001','Write FISH methodology v2 spec',                                         'methodology', 'tal',     'todo',        'p0', '2026-04-28', 'Output: methodology-fish-v2.md. Phases, axes (bigger↔smaller × known↔unknown), transitions, per-phase demands. Source: https://www.talsolomonux.com/p/0d2. Bottleneck — PRD rewrite, agent spec, capture design all depend on this.', '',         10),
  ('FISH-002','Define FISH agent roster — phase → agent mapping + handoff contract',    'methodology', 'tal',     'todo',        'p0', '2026-05-05', 'One agent per FISH phase; each agent''s prompt, tools, handoff I/O. This IS the OSS drop. Depends on FISH-001. Output: fish-agent-roster.md.', '',         20),
  ('FISH-003','Spec the // install bundle for Claude Desktop / Cursor / ChatGPT Desktop','methodology', 'tal',     'todo',        'p0', '2026-05-12', 'Per-tool install plumbing — Claude (CLAUDE.md), Cursor (.cursorrules), ChatGPT (Custom Instructions). See technical-research-duble-slash-stack.md. Depends on FISH-002.', '',         30),
  ('FISH-004','Map FISH stages → flow.yaml spec (v2 milestone)',                        'methodology', 'tal',     'parked',      'p2', null,         'Required attributes per card; phase transitions. Formerly FISH-002 — renumbered 2026-04-21.', '',         40),
  ('OPS-001', 'Keep task board synced with GitHub + weekly status',                    'ops',         'claude',  'in_progress', 'p1', null,         'Recurring. Ask John to refresh.',                                                               '',         10),
  ('OPS-002', 'Weekly KPI snapshot vs. M1–M9 (post-launch)',                           'ops',         'tal',     'parked',      'p2', null,         'Measurement starts day of OSS launch.',                                                         '',         20)
on conflict (id) do nothing;

insert into public.repo_commits (sha, msg, feeds) values
  ('ab0693f', 'Rename DoubleSlash to DubleSlash across the repo',                           null),
  ('5447b8a', 'Add FISH methodology, Supabase task board, finish Double Slash rename',      'FISH-001'),
  ('c34c4e4', 'Redesign website hero: larger stage, refined menubar icon, quicklook tail',  'DES-001'),
  ('f3c9448', 'Merge #1 from import/collab-workspace',                                      null),
  ('2a6cda7', 'Add Trace planning artifacts, BMAD docs, and website',                       null),
  ('bb9b228', 'Initial commit',                                                             null)
on conflict (sha) do nothing;

-- ── 3. Add Shenhav to the allowlist ─────────────────────────────────────────
insert into public.allowed_emails (email, name) values
  ('Slev92@gmail.com', 'Shenhav')
on conflict (email) do nothing;

-- ── 4. Sanity check ─────────────────────────────────────────────────────────
select
  (select count(*) from public.allowed_emails) as allowed_emails,
  (select count(*) from public.groups)         as groups,
  (select count(*) from public.people)         as people,
  (select count(*) from public.tasks)          as tasks,
  (select count(*) from public.kpis)           as kpis,
  (select count(*) from public.repo_commits)   as commits;
