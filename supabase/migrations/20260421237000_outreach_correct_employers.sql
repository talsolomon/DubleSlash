-- =============================================================================
-- Duble Slash — Outreach: correct employers flagged by user review.
--   - Rotem Waissman is at Empathy (not Monday — that's her founding role).
--   - Nadav Barkan is at Waze (not Fiverr — recent move).
--   - Matan Arbel is at Monday (not Lightricks — recent move).
-- Fully idempotent.
-- =============================================================================

-- Rotem Waissman: Monday.com (founding designer) → VP Design @ Empathy.
update public.outreach_contacts
  set company     = 'Empathy',
      role        = 'VP Design',
      company_url = 'https://www.empathy.com',
      notes       = 'Previously founding designer at Monday.com — helped scale its UX through IPO. Now VP Design at Empathy (bereavement-tech).'
  where id = 'rotem-waissman';

-- Nadav Barkan: Fiverr → Waze (recent move per his LinkedIn "new chapter, new ride!" post).
update public.outreach_contacts
  set company     = 'Waze',
      role        = 'Design leadership',
      company_url = 'https://www.waze.com',
      notes       = 'Recently moved from VP Design @ Fiverr to Waze. Senior Shenkar lecturer.'
  where id = 'nadav-barkan';

-- Matan Arbel: Lightricks → Monday.com.
update public.outreach_contacts
  set company     = 'Monday.com',
      role        = 'Design',
      company_url = 'https://monday.com',
      notes       = 'Moved from Head of DesignOps @ Lightricks to Monday.com. Public LinkedIn title may still reference Lightricks.'
  where id = 'matan-arbel';
