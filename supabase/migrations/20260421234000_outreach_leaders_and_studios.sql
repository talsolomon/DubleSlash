-- =============================================================================
-- Duble Slash — Outreach: add contact_type + seed design leaders & studios
-- Splits outreach_contacts into two kinds:
--   - 'company' : people who lead design at product companies
--   - 'studio'  : founders / leads at design studios
-- The UI renders them as two separate tables on the Outreach tab.
--
-- Fully idempotent. Safe to re-run. Where a name is unknown, the row is
-- seeded with name = 'TBD — find lead' so it acts as a worklist item.
-- =============================================================================

-- ───────────────────────────── contact_type column ───────────────────────────
alter table public.outreach_contacts
  add column if not exists contact_type text default 'company';

alter table public.outreach_contacts drop constraint if exists contact_type_check;
alter table public.outreach_contacts
  add constraint contact_type_check check (contact_type in ('company','studio'));

-- ───────────────────────────── Backfill existing 4 ───────────────────────────
update public.outreach_contacts
  set role = 'UX Leader',
      contact_type = 'company'
  where id = 'tali-lavie';

update public.outreach_contacts
  set name = 'Aviran Revach',
      role = 'VP Product Design',
      contact_type = 'company'
  where id = 'aviran-revah';

update public.outreach_contacts
  set role = 'Founder',
      contact_type = 'studio'
  where id = 'ido-zaifman';

update public.outreach_contacts
  set contact_type = 'company'
  where id = 'adi-rozen-benvenisti';

-- ───────────────────────────── Company leaders ───────────────────────────────
insert into public.outreach_contacts
  (id, contact_type, name, role, company, linkedin, stage_id, owner_id, priority_id, notes, sort_order)
values
  -- Confirmed via public sources (LinkedIn / company bios)
  ('rotem-waissman',       'company', 'Rotem Waissman',        'VP Design',                    'Monday.com',  'https://il.linkedin.com/in/rotem-waissman-28223356',     'research', 'tal', 'p0', 'Monday = bellwether for Israeli SaaS product culture. If she champions DS, downstream reach is enormous.', 50),
  ('liron-ben-ari',        'company', 'Liron Ben-Ari',         'Director of Creative Design',  'Monday.com',  'https://il.linkedin.com/in/liron-ben-ari-42674b115',     'research', 'tal', 'p1', 'Second entry point at Monday — creative/brand side.',                                                      60),
  ('hagit-kauffman',       'company', 'Hagit Kauffman',        'VP Design & Brand',            'Wix',         null,                                                     'research', 'tal', 'p0', 'Wix owns the long tail of small-business site design — huge multiplier. LinkedIn URL TBD.',                70),
  ('nadav-barkan',         'company', 'Nadav Barkan',          'VP Design',                    'Fiverr',      'https://www.linkedin.com/in/nadav-barkan-5929b85a/',     'research', 'tal', 'p0', 'Fiverr design org is sizable; VP-level is the right entry.',                                               80),
  ('amir-neiman',          'company', 'Amir Neiman',           'Head of Product Design',       'Fiverr',      'https://il.linkedin.com/in/amir-neiman-11593640',        'research', 'tal', 'p1', 'Second Fiverr entry — product side.',                                                                      90),
  ('matan-arbel',          'company', 'Matan Arbel',           'Head of DesignOps',            'Lightricks',  'https://uk.linkedin.com/in/matanarbel',                  'research', 'tal', 'p1', 'DesignOps is the *exact* persona DS serves — capture/handoff/artifact discipline is his day job.',         100),
  ('michal-kissos-hertzog','company', 'Michal Kissos Hertzog', 'Head of Innovation & Digital', 'Bank Leumi',  null,                                                     'research', 'tal', 'p1', 'Not a design title but owns digital product experience at Leumi. Regulated-org signal alongside Hapoalim.', 110),
  -- Placeholder rows — worklist of companies where the design lead is TBD
  ('tbd-melio',            'company', 'TBD — find lead',       'Head of Design',               'Melio',       null,                                                     'research', 'tal', 'p1', 'Find design lead on LinkedIn; fintech peer to Hapoalim/Leumi angle.',                                      120),
  ('tbd-lemonade',         'company', 'TBD — find lead',       'Head of Design',               'Lemonade',    null,                                                     'research', 'tal', 'p1', 'Insurance-design poster child; strong in-house brand team.',                                               130),
  ('tbd-snyk',             'company', 'TBD — find lead',       'Head of Design',               'Snyk',        null,                                                     'research', 'tal', 'p1', 'Dev-tool / security; high shareability among technical audiences.',                                        140),
  ('tbd-similarweb',       'company', 'TBD — find lead',       'Head of Design',               'Similarweb',  null,                                                     'research', 'tal', 'p2', 'Data-heavy product; good test of capture fidelity on dense dashboards.',                                   150),
  ('tbd-yotpo',            'company', 'TBD — find lead',       'Head of Design',               'Yotpo',       null,                                                     'research', 'tal', 'p2', 'eCommerce SaaS.',                                                                                            160),
  ('tbd-walkme',           'company', 'TBD — find lead',       'Head of Design',               'WalkMe',      null,                                                     'research', 'tal', 'p2', 'Enterprise onboarding; overlaps conceptually with DS''s capture story.',                                   170),
  ('tbd-riskified',        'company', 'TBD — find lead',       'Head of Design',               'Riskified',   null,                                                     'research', 'tal', 'p2', 'Fintech / fraud.',                                                                                           180),
  ('tbd-mizrahi-tefahot',  'company', 'TBD — find lead',       'Head of Digital Design',       'Mizrahi-Tefahot', null,                                                 'research', 'tal', 'p2', 'Third Israeli bank — broaden the regulated-sector cohort.',                                                190),
  ('tbd-isracard',         'company', 'TBD — find lead',       'Head of Digital Design',       'Isracard',    null,                                                     'research', 'tal', 'p2', 'Credit-card issuer fintech.',                                                                                200)
on conflict (id) do nothing;

-- ───────────────────────────── Studios ───────────────────────────────────────
insert into public.outreach_contacts
  (id, contact_type, name, role, company, linkedin, stage_id, owner_id, priority_id, notes, sort_order)
values
  ('anis-kadis',           'studio', 'Anis Kadis',        'Business Designer',                   'Firma',              'https://www.linkedin.com/in/anis-kadis-07218069/',       'research', 'tal', 'p1', 'Firma. Business Design, Tel Aviv.',                                                    50),
  ('maayan-froind',        'studio', 'Maayan Froind',     'Co-founder',                          'Open',               null,                                                     'research', 'tal', 'p0', 'Open works with Series B+ SaaS — the grown-up version of your 4 seeds.',              60),
  ('yoav-gati',            'studio', 'Yoav Gati',         'Co-founder',                          'Open',               null,                                                     'research', 'tal', 'p1', 'Co-founder of Open (with Maayan Froind), both McCann Erickson alumni.',                70),
  ('eyal-talmon',          'studio', 'Eyal Talmon',       'Co-founder',                          'Muze',               'https://www.linkedin.com/in/eyal-talmon-47981b32/',      'research', 'tal', 'p0', 'Muze is cyber/B2B SaaS heavy — DS''s capture story resonates.',                        80),
  ('yonatan-cohen-muze',   'studio', 'Yonatan Cohen',     'Co-founder',                          'Muze',               null,                                                     'research', 'tal', 'p1', 'Co-founder of Muze (with Eyal Talmon).',                                               90),
  ('einat-grafov',         'studio', 'Einat Grafov',      'Co-founder & CEO',                    'Mondeo Studio',      null,                                                     'research', 'tal', 'p1', 'Startup-focused UX/UI studio.',                                                        100),
  ('yuval-leizerman',      'studio', 'Yuval Leizerman',   'Founder & Creative Director',         'Wayy',               null,                                                     'research', 'tal', 'p1', 'Tech branding; writes publicly on their blog — good community amplifier.',             110),
  ('aviram-tzur',          'studio', 'Aviram Tzur',       'Co-founder',                          'TZUR',               'https://www.linkedin.com/in/dr-aviram-tzur/',            'research', 'tal', 'p2', 'TZUR is 25+ years old, 1,400+ projects. Slower to adopt, big distribution if they do.', 120),
  ('reely-tzur',           'studio', 'Reely Tzur',        'Managing Director',                   'TZUR',               null,                                                     'research', 'tal', 'p1', 'Currently leads TZUR.',                                                                130),
  ('asaf-bar-or',          'studio', 'Asaf Bar-Or',       'Co-founder & Head of Product Design', 'Triolla',            'https://www.linkedin.com/in/asaf-bar-or-97aa6770/',      'research', 'tal', 'p1', 'Triolla = merger of Pitango UX + Triolla software. 20+ yrs in Israeli UX.',            140),
  ('yuval-bar-or',         'studio', 'Yuval Bar-Or',      'CEO',                                 'Triolla',            null,                                                     'research', 'tal', 'p2', 'Business-side entry at Triolla.',                                                      150),
  ('omer-harel-triolla',   'studio', 'Omer Harel',        'Team',                                'Triolla',            'https://www.linkedin.com/in/omerharel/',                 'research', 'tal', 'p2', 'Triolla team member, confirmed public profile.',                                       160),
  -- Placeholder rows — studios on the short list where the founder/lead needs a LinkedIn pass
  ('tbd-mint',             'studio', 'TBD — find lead',   'Founder',                             'Mint',               null,                                                     'research', 'tal', 'p1', 'User-named studio. LinkedIn pass required.',                                           170),
  ('tbd-hello-design',     'studio', 'TBD — find lead',   'Founder',                             'Hello Design',       null,                                                     'research', 'tal', 'p1', 'hellodesign.co — founded 2016, small team. Public names: Shira, Ohad (surnames TBD).',  180),
  ('tbd-forem',            'studio', 'TBD — find lead',   'Founder',                             'Forem',              null,                                                     'research', 'tal', 'p1', 'Pure Tel Aviv product design shop.',                                                   190),
  ('tbd-ramotion-tlv',     'studio', 'TBD — find lead',   'Studio lead',                         'Ramotion Tel Aviv',  null,                                                     'research', 'tal', 'p2', 'Enterprise SaaS, complex IA.',                                                         200),
  ('tbd-odeio',            'studio', 'TBD — find lead',   'Founder',                             'Odeio Studio',       null,                                                     'research', 'tal', 'p2', 'B2C mobile, behavioral design.',                                                       210),
  ('tbd-designit-tlv',     'studio', 'TBD — find lead',   'Managing Director',                   'Designit Tel Aviv',  null,                                                     'research', 'tal', 'p2', 'Wipro-owned network; high-signal reference.',                                          220),
  ('tbd-verox',            'studio', 'TBD — find lead',   'Founder',                             'Verox Studio',       null,                                                     'research', 'tal', 'p2', 'CEO Michael Simhai is LA-based — find the TLV studio lead.',                           230),
  ('tbd-rikover',          'studio', 'TBD — find lead',   'Founder',                             'Rikover & Co.',      null,                                                     'research', 'tal', 'p2', 'Interactive product design.',                                                          240),
  ('tbd-butcher',          'studio', 'TBD — find lead',   'Founder',                             'Butcher.studio',     null,                                                     'research', 'tal', 'p2', 'Branding-leaning — lighter fit, community reach only.',                                250),
  ('tbd-yaron-vardimon',   'studio', 'Yaron Vardimon',    'Founder',                             'Studio Yaron Vardimon', null,                                                  'research', 'tal', 'p2', 'Hebrew typography & bilingual systems.',                                               260),
  ('tbd-publicis-mint',    'studio', 'TBD — find lead',   'Studio lead',                         'Publicis Mint',      null,                                                     'research', 'tal', 'p2', 'Publicis-owned brand-utility studio, Tel Aviv office.',                                270),
  ('tbd-ads-studio',       'studio', 'TBD — find lead',   'Founder',                             'Ads',                null,                                                     'research', 'tal', 'p2', 'Hebrew/bilingual design.',                                                             280)
on conflict (id) do nothing;
