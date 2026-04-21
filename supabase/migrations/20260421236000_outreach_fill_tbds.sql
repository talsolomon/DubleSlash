-- =============================================================================
-- Duble Slash — Outreach: fill in TBD rows with verified names/LinkedIns.
-- Also enrich Adi Rozen Benvenisti's row with her actual title.
-- Fully idempotent.
-- =============================================================================

-- ───────────────────────────── Adi Rozen Benvenisti (Bank Hapoalim) ─────────
-- Confirmed: Director of Product Design / Head of User Experience.
update public.outreach_contacts
  set role = 'Director of Product Design',
      notes = 'Head of UX for the Design & Innovation division. Bank Hapoalim CEO''s Excellence Award winner. Prev Director UX at Ness Interactive.'
  where id = 'adi-rozen-benvenisti';

-- ───────────────────────────── Hello Design — Shira Porat (CEO) ─────────────
-- Repurpose the placeholder row; LinkedIn URL for Shira wasn't
-- publicly listed in search results, leaving null for user to add.
update public.outreach_contacts
  set name  = 'Shira Porat',
      role  = 'Co-founder & CEO',
      notes = 'CEO of hello. (hellodesign.co). Partner to Ohad Shalev.'
  where id = 'tbd-hello-design';

-- Add Ohad Shalev as a separate row (Co-founder & Head of Design, Forbes 30 Under 30).
insert into public.outreach_contacts
  (id, contact_type, name, role, company, linkedin, company_url, stage_id, owner_id, priority_id, notes, sort_order)
values
  ('ohad-shalev', 'studio', 'Ohad Shalev', 'Co-founder & Head of Design', 'Hello Design',
   'https://www.linkedin.com/in/ohad-shalev-advisor/', 'https://www.hellodesign.co',
   'research', 'tal', 'p1', 'Forbes 30 Under 30. Co-founded hello. with Shira Porat. Strong background in branding + product + film.', 185)
on conflict (id) do nothing;

-- ───────────────────────────── Forem — Hilla Barel ──────────────────────────
update public.outreach_contacts
  set name  = 'Hilla Barel',
      role  = 'Founder',
      notes = 'Founded Forem in 2004 — one of the longer-running pure product design shops in Tel Aviv. LinkedIn URL needs manual search.'
  where id = 'tbd-forem';

-- ───────────────────────────── Rikover & Co — Nadav Rikover ────────────────
update public.outreach_contacts
  set name     = 'Nadav Rikover',
      role     = 'Owner & Director of UX / Product Design',
      linkedin = 'https://www.linkedin.com/in/nadavrikover/',
      company_url = 'https://rikover.com',
      notes    = 'Google UX expert, Google Launchpad TLV mentor, Certified Design Sprint Master, Shenkar lecturer. Studio est. 2011.'
  where id = 'tbd-rikover';

-- ───────────────────────────── Butcher.studio — Margarita Golubeva ─────────
update public.outreach_contacts
  set name     = 'Margarita Golubeva',
      role     = 'Co-founder & Brand Director',
      linkedin = 'https://www.linkedin.com/in/margarita-golubeva/',
      notes    = 'Branding-leaning studio; 25 awards since 2021. Lighter fit than pure product shops but active in community.'
  where id = 'tbd-butcher';

-- ───────────────────────────── Yarom (not Yaron) Vardimon ───────────────────
-- Correct the spelling + role. Yarom Vardimon is Israeli Prize laureate,
-- former Shenkar dean and Bezalel graphic design head — elderly (b. 1941),
-- likely not a practical outreach target but keep for community completeness.
update public.outreach_contacts
  set name     = 'Yarom Vardimon',
      role     = 'Elder statesman / Israeli Prize laureate',
      priority_id = 'p2',
      notes    = 'Legendary Israeli graphic designer, Bezalel + Shenkar dean. Israel Prize in Design. Keep on list for community completeness; not expected as a DS adopter.'
  where id = 'tbd-yaron-vardimon';

-- ───────────────────────────── Nadav Meidan (Melio) ─────────────────────────
-- Identified publicly as the Product Designer at Melio writing about AI +
-- product design. Use as the entry point even though he's not VP.
update public.outreach_contacts
  set name  = 'Nadav Meidan',
      role  = 'Product Designer',
      notes = 'Publicly active design voice at Melio (writes about AI + product design). Promote / replace once Head of Design surfaces.'
  where id = 'tbd-melio';

-- ───────────────────────────── Liza Ritsner (Riskified) ─────────────────────
update public.outreach_contacts
  set name  = 'Liza Ritsner',
      role  = 'Senior Product Designer',
      linkedin = 'https://www.linkedin.com/in/liza-ritsner-b9042380/',
      notes = 'Senior designer at Riskified — Tel Aviv. Replace with design lead once identified.'
  where id = 'tbd-riskified';

-- ───────────────────────────── Chen Hadad (Isracard) ────────────────────────
update public.outreach_contacts
  set name  = 'Chen Hadad',
      role  = 'Product Designer',
      linkedin = 'https://www.linkedin.com/in/chen-hadad-069146196/',
      notes = 'Named product designer at Isracard. Replace with design lead once identified.'
  where id = 'tbd-isracard';
