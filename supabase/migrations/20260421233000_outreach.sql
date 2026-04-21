-- =============================================================================
-- Duble Slash — Outreach CRM
-- Adds an "Outreach" tab to the task board: a lightweight contacts table for
-- product / design leaders we want to demo Duble Slash to, plus a nullable
-- foreign key on `tasks` so any task can be associated with a specific contact.
--
-- Fully idempotent. Safe to re-run.
-- =============================================================================

-- ───────────────────────────── Stages ────────────────────────────────────────
create table if not exists public.outreach_stages (
  id         text primary key,
  label      text not null,
  sort_order int default 0
);

insert into public.outreach_stages (id, label, sort_order) values
  ('research',    'Research',     10),
  ('reached_out', 'Reached out',  20),
  ('replied',     'Replied',      30),
  ('met',         'Met',          40),
  ('demoed',      'Demoed',       50),
  ('champion',    'Champion',     60),
  ('passed',      'Passed',       70),
  ('dormant',     'Dormant',      80)
on conflict (id) do nothing;

-- ───────────────────────────── Contacts ──────────────────────────────────────
create table if not exists public.outreach_contacts (
  id             text primary key,
  name           text not null,
  role           text,
  company        text,
  location       text,
  linkedin       text,
  email          text,
  stage_id       text references public.outreach_stages(id),
  owner_id       text references public.people(id),
  priority_id    text references public.priorities(id),
  last_touch     date,
  next_step      text,
  next_step_due  date,
  notes          text,
  sort_order     int default 0,
  created_at     timestamptz default now(),
  updated_at     timestamptz default now()
);

drop trigger if exists outreach_contacts_touch on public.outreach_contacts;
create trigger outreach_contacts_touch before update on public.outreach_contacts
  for each row execute function public.touch_updated_at();

-- ───────────────────────────── Tasks ↔ Contacts ──────────────────────────────
alter table public.tasks
  add column if not exists contact_id text references public.outreach_contacts(id);

-- ───────────────────────────── RLS ───────────────────────────────────────────
alter table public.outreach_stages   enable row level security;
alter table public.outreach_contacts enable row level security;

do $$
declare t text;
begin
  foreach t in array array['outreach_stages','outreach_contacts'] loop
    execute format('drop policy if exists "allowed_all" on public.%I', t);
    execute format(
      'create policy "allowed_all" on public.%I for all using (public.is_allowed()) with check (public.is_allowed())',
      t
    );
  end loop;
end $$;

-- ───────────────────────────── Realtime ──────────────────────────────────────
do $$
declare t text;
begin
  foreach t in array array['outreach_stages','outreach_contacts'] loop
    begin
      execute format('alter publication supabase_realtime add table public.%I', t);
    exception when duplicate_object then
      null;
    end;
  end loop;
end $$;

-- ───────────────────────────── Seed contacts ─────────────────────────────────
insert into public.outreach_contacts
  (id, name, role, company, linkedin, stage_id, owner_id, priority_id, notes, sort_order)
values
  ('tali-lavie',           'Tali Lavie',           null, 'Gong',           'https://www.linkedin.com/in/talia-lavie-459981b/', 'research', 'tal', 'p0', 'Entry point for Gong product org. Strong PM community presence.',              10),
  ('aviran-revah',         'Aviran Revah',         null, 'Atera',          'https://www.linkedin.com/in/aviranrevach/',         'research', 'tal', 'p0', 'Atera = fast-moving SaaS; good test bed for individual power-user adoption.', 20),
  ('ido-zaifman',          'Ido Zaifman',          null, 'Kido',           'https://www.linkedin.com/in/ido-zaifman/',          'research', 'tal', 'p1', 'Boutique / design-forward. Likely early champion if the capture quality is there.', 30),
  ('adi-rozen-benvenisti', 'Adi Rozen Benvenisti', null, 'Bank Hapoalim',  'https://www.linkedin.com/in/adirozenbenvenisti/',   'research', 'tal', 'p1', 'Enterprise / regulated org. Good signal if we can clear their security bar.', 40)
on conflict (id) do nothing;
