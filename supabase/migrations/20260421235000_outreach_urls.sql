-- =============================================================================
-- Duble Slash — Outreach: company/studio URLs + backfill LinkedIn URLs
-- Adds outreach_contacts.company_url (the org's own website, not LinkedIn).
-- Fills in LinkedIn URLs and company URLs verified via public sources.
-- Also corrects Michal Kissos Hertzog: currently CEO of Poalim Hi-Tech
-- (Bank Hapoalim), not Bank Leumi.
--
-- Fully idempotent.
-- =============================================================================

-- ───────────────────────────── company_url column ───────────────────────────
alter table public.outreach_contacts
  add column if not exists company_url text;

-- ───────────────────────────── LinkedIn backfill (verified) ──────────────────
update public.outreach_contacts set linkedin = 'https://www.linkedin.com/in/hagit-kauffman-4402526'        where id = 'hagit-kauffman';
update public.outreach_contacts set linkedin = 'https://www.linkedin.com/in/einat-grafov-a2577360/'        where id = 'einat-grafov';
update public.outreach_contacts set linkedin = 'https://www.linkedin.com/in/yuval-leizerman/'              where id = 'yuval-leizerman';
update public.outreach_contacts set linkedin = 'https://www.linkedin.com/in/reely-tzur-60a6519/'           where id = 'reely-tzur';
update public.outreach_contacts set linkedin = 'https://www.linkedin.com/in/maayanfroind/'                 where id = 'maayan-froind';

-- Michal Kissos Hertzog moved: now CEO at Poalim Hi-Tech (Bank Hapoalim's
-- tech arm). Re-homing the row, keeping the stable id.
update public.outreach_contacts
  set linkedin = 'https://il.linkedin.com/in/michal-kissos-hertzog-136352a',
      company  = 'Bank Hapoalim',
      role     = 'CEO, Poalim Hi-Tech',
      notes    = 'Ex-Bank Leumi Head of Innovation & Digital. Now leads Poalim Hi-Tech — same regulated-sector angle, different bank.'
  where id = 'michal-kissos-hertzog';

-- Note: Maayan Froind co-founded Open but her current LinkedIn role is at
-- "Awesome — a Deloitte studio". Leaving her row on Open (the outreach
-- target) but recording the drift in notes.
update public.outreach_contacts
  set notes = 'Co-founded Open in 2011. LinkedIn currently lists her at Awesome (a Deloitte studio) — treat as a warm intro path into Open rather than current lead.'
  where id = 'maayan-froind';

-- ───────────────────────────── Company URLs ─────────────────────────────────
update public.outreach_contacts set company_url = 'https://www.gong.io'          where company = 'Gong';
update public.outreach_contacts set company_url = 'https://www.atera.com'         where company = 'Atera';
update public.outreach_contacts set company_url = 'https://www.bankhapoalim.co.il' where company = 'Bank Hapoalim';
update public.outreach_contacts set company_url = 'https://monday.com'            where company = 'Monday.com';
update public.outreach_contacts set company_url = 'https://www.wix.com'           where company = 'Wix';
update public.outreach_contacts set company_url = 'https://www.fiverr.com'        where company = 'Fiverr';
update public.outreach_contacts set company_url = 'https://www.lightricks.com'    where company = 'Lightricks';
update public.outreach_contacts set company_url = 'https://www.leumi.co.il'       where company = 'Bank Leumi';
update public.outreach_contacts set company_url = 'https://meliopayments.com'     where company = 'Melio';
update public.outreach_contacts set company_url = 'https://www.lemonade.com'      where company = 'Lemonade';
update public.outreach_contacts set company_url = 'https://snyk.io'               where company = 'Snyk';
update public.outreach_contacts set company_url = 'https://www.similarweb.com'    where company = 'Similarweb';
update public.outreach_contacts set company_url = 'https://www.yotpo.com'         where company = 'Yotpo';
update public.outreach_contacts set company_url = 'https://www.walkme.com'        where company = 'WalkMe';
update public.outreach_contacts set company_url = 'https://www.riskified.com'     where company = 'Riskified';
update public.outreach_contacts set company_url = 'https://www.mizrahi-tefahot.co.il' where company = 'Mizrahi-Tefahot';
update public.outreach_contacts set company_url = 'https://www.isracard.co.il'    where company = 'Isracard';

-- ───────────────────────────── Studio URLs ──────────────────────────────────
update public.outreach_contacts set company_url = 'https://www.open.co.il'                     where company = 'Open';
update public.outreach_contacts set company_url = 'https://muzedesign.com'                      where company = 'Muze';
update public.outreach_contacts set company_url = 'https://www.mondeostudio.com'                where company = 'Mondeo Studio';
update public.outreach_contacts set company_url = 'https://www.wayy.studio'                     where company = 'Wayy';
update public.outreach_contacts set company_url = 'https://www.tzur.com'                        where company = 'TZUR';
update public.outreach_contacts set company_url = 'https://triolla.io'                          where company = 'Triolla';
update public.outreach_contacts set company_url = 'https://www.hellodesign.co'                  where company = 'Hello Design';
update public.outreach_contacts set company_url = 'https://www.designit.com/studios/tel-aviv'   where company = 'Designit Tel Aviv';
update public.outreach_contacts set company_url = 'https://www.veroxstudio.com'                 where company = 'Verox Studio';
update public.outreach_contacts set company_url = 'https://butcher.studio'                      where company = 'Butcher.studio';
update public.outreach_contacts set company_url = 'https://www.ramotion.com'                    where company = 'Ramotion Tel Aviv';
