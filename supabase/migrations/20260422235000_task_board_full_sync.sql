-- =============================================================================
-- Task board full sync — reconcile task-board.md ↔ Supabase DB
-- ---------------------------------------------------------------------------
-- Two gaps closed in one migration (idempotent):
--
--   1. Seven tasks added to _bmad/planning-artifacts/task-board.md over the
--      last ~2 days but never inserted into the DB. Invisible in the Vercel
--      app because the app reads the DB, not the markdown.
--        FISH-009, OPS-005, OPS-006, PRD-004,
--        RES-001, RES-002, RES-003
--
--   2. Twelve additional concrete action items found during a cross-doc audit
--      (briefs, research reports, UX design doc, stories doc) that were
--      documented but never ticketed in either the markdown or the DB.
--        RES-004,
--        OPS-007, OPS-008, OPS-009,
--        MKT-010, MKT-011, MKT-012,
--        DES-004, DES-005, DES-006,
--        PRD-005, PRD-006
--
-- Also adds a new `research` group for the RES-* family (previously had no
-- home — the existing groups table only had marketing/product/security/design/
-- methodology/ops, so RES-* tasks would have failed the foreign-key check).
--
-- Safe to re-run: every insert uses `on conflict do nothing`.
-- =============================================================================

-- ──────────────────────── New group: research ────────────────────────────────
insert into public.groups (id, name, icon, sort_order) values
  ('research', 'Problem Validation — Research', '🧪', 55)
on conflict (id) do nothing;

-- ──────────────────────── Tasks ──────────────────────────────────────────────
insert into public.tasks
  (id, title, group_id, owner_id, status_id, priority_id, due, notes, github, sort_order)
values

  -- ─── Methodology ─────────────────────────────────────────────────────────
  ('FISH-009',
   'Wire expert-shortcuts roster (@handle) into each local-agent spec',
   'methodology', 'tal', 'todo', 'p1', date '2026-05-12',
   'Added 2026-04-22 (daily audit) from methodology/local-agents/experts.md and brainstorm-expert-shortcuts.md. 136 loanable specialist personas across 18 categories exist as a doc, but Nova/Sol/Bram/Sage specs don''t yet reference the grammar (//build @be-dev), the proactive-offer rules (2–3 experts per fresh card or topic shift), the one-turn loan semantics, or the team-custom .experts/ extension point. Edits needed in explorer.md, solidifier.md, builder.md, shipper.md. Depends on FISH-005 (keep agent-spec edits coherent).',
   '',
   90),

  -- ─── Product / PRD ───────────────────────────────────────────────────────
  ('PRD-004',
   'Revise company values — current draft is unsatisfactory',
   'product', 'tal', 'todo', 'p1', null,
   'Due: before PRD-002. Draft saved to _bmad/planning-artifacts/company/company-values.md. Tal flagged on 2026-04-21: values sound like product lines, not beliefs. Five values currently; "creativity is the only prerequisite" slot dropped, may need replacement. Session history + rejected framings in brainstorm-company-values.md. Feeds into PRD-002 (manifesto).',
   '',
   40),

  ('PRD-005',
   'Refine "Flows, not frames" value to match the Hebrew משע, לא מסך punch',
   'product', 'tal', 'todo', 'p2', null,
   'Added 2026-04-22 from company-values.md revision notes. Tal''s Hebrew reference carries shape + punch the English draft lacks. Sub-task of PRD-004 but tracked separately because it''s a copy-craft problem, not a values-selection problem. Resolve after PRD-004 settles the slate of five.',
   '',
   50),

  ('PRD-006',
   'Draft redaction-rules.md — regex + heuristics for PII/secret redaction',
   'security', 'shenhav', 'todo', 'p1', date '2026-05-12',
   'Added 2026-04-22 from stories-duble-slash-oss-launch.md Story 4.3 AC-006 + prd-duble-slash-oss-launch.md §10. Redaction categories are in the PRD; the *patterns* (regex + heuristics) need a dev-handoff doc at _bmad/docs/redaction-rules.md. Covers: API keys, tokens, emails, names, addresses, credit-card-shaped strings, custom per-tool carve-outs. Precedes FISH-003 capture implementation. Co-owner: Tal for policy review.',
   '',
   30),

  -- ─── Design / Web ────────────────────────────────────────────────────────
  ('DES-004',
   'Hi-fi mockups: Today view · first-run step 4 · Privacy dashboard · menubar popover',
   'design', 'shenhav', 'todo', 'p0', date '2026-05-05',
   'Added 2026-04-22 from ux-design-duble-slash-oss-launch.md §Next steps. Four critical GTM assets — "the Privacy dashboard IS the ad." Blocks DES-006 sign-off and the hero refresh (DES-003). Delivery format: Figma frames exported as PNG into website/assets/ for reuse in the landing page and launch thread.',
   '',
   40),

  ('DES-005',
   'Resolve 8 open design decisions before code',
   'design', 'shenhav', 'todo', 'p1', date '2026-05-05',
   'Added 2026-04-22 from ux-design-duble-slash-oss-launch.md §Design questions. Eight decisions needed before FISH-003 implementation: (1) session auto-titling approach, (2) dark vs light default, (3) redaction preview depth, (4) agents disclosure surface, (5) pause-all affordance, (6) telemetry modal-vs-inline, (7) + (8) see doc. Output: one-page decision log appended to the UX doc.',
   '',
   50),

  ('DES-006',
   'Shenhav sign-off on Privacy dashboard composition before launch',
   'design', 'shenhav', 'todo', 'p0', date '2026-05-12',
   'Added 2026-04-22 from stories-duble-slash-oss-launch.md Story 5.4 AC-006. Gating: blocks OSS-launch (MKT-009). Depends on DES-004 (mockups landing first). Review covers: composition, redaction-preview UX, pause-all affordance, accessibility contrast.',
   '',
   60),

  -- ─── Marketing ───────────────────────────────────────────────────────────
  ('MKT-010',
   'Resolve the 5 open questions in brief-oss-launch-marketing.md §10',
   'marketing', 'tal', 'todo', 'p0', date '2026-04-29',
   'Added 2026-04-22 from brief-oss-launch-marketing.md §10. Five questions gating PM (John) taking the brief into a PRD: (1) exact launch day, (2) founder-led vs brand voice, (3) private-beta list, (4) Shenhav content scope, (5) PH/HN timing. Gates MKT-009 PRD and MKT-011 calendar.',
   '',
   70),

  ('MKT-011',
   'Execute 7-post blog calendar (D-3 → D+30) — flagship co-author + Shenhav design-angle',
   'marketing', 'tal', 'todo', 'p0', date '2026-05-15',
   'Added 2026-04-22 from brief-oss-launch-marketing.md §8. Part of MKT-009 scope but sliced out because it''s the largest execution chunk and needs its own cadence. Calendar: 7 posts spread D-3 through D+30 around launch day. Co-author flagship piece with Shenhav; Shenhav also writes a design-angle post. Depends on MKT-010 (launch day decision).',
   '',
   80),

  ('MKT-012',
   'Anthropic pre-launch outreach mechanics — timing, channel, who DMs first',
   'marketing', 'tal', 'todo', 'p0', date '2026-05-12',
   'Added 2026-04-22 from brief-collab-capture-layer.md §Open Questions + prd-duble-slash-oss-launch.md §10. M5 is a success metric (≥1 lab conversation opened, Anthropic priority); the *mechanics* of outreach were never ticketed. Decide: DM vs email, warm intro vs cold, Tal vs Shenhav voice, pre- or post-launch, what artifact to send (pitch deck vs methodology doc vs GitHub link).',
   '',
   90),

  -- ─── Ops / Research ──────────────────────────────────────────────────────
  ('OPS-005',
   'Lock OSS license & governance posture (irreversible decision)',
   'ops', 'tal', 'todo', 'p0', date '2026-05-05',
   'Added 2026-04-22 (daily audit) from domain-research-oss-license-governance.md. Pick license (Apache 2.0 vs. MPL 2.0 vs. FSL vs. AGPL) + governance model (BDFL vs. steering committee vs. foundation) *before first external commit* — relicensing post-launch requires every contributor''s sign-off and shatters trust. Must have a real OSS-licensing lawyer (Heather Meeker / Luis Villa class) review the pick. Hard gate on OSS launch (MKT-009). Co-owner: Shenhav.',
   '',
   50),

  ('OPS-006',
   'Decide capture-method legal posture (AX vs. network interception vs. browser ext vs. screen capture)',
   'ops', 'tal', 'todo', 'p0', date '2026-05-05',
   'Added 2026-04-22 (daily audit) from domain-research-capture-legality.md. Shapes FISH-003 engineering scope *and* the trust/integrity marketing pillar — if the capture channel is legally marginal, GTM collapses. Decision dimensions: one-party consent (federal + ~38 states) vs. all-party (CA/FL/IL/MA/MD/MT/NH/PA/WA); per-tool ToS review (OpenAI / Anthropic / Cursor); AX-vs-network-interception engineering tradeoff. Product-counsel review required (someone who shipped Rewind / Granola / Otter). Blocks FISH-003 final architecture. Co-owner: Shenhav.',
   '',
   60),

  ('OPS-007',
   'Trademark clearance search for "Duble Slash"',
   'ops', 'tal', 'todo', 'p0', date '2026-04-29',
   'Added 2026-04-22 from brief-install-experience.md §14 + brief-collab-capture-layer.md §10. Explicitly called out as blocking domain purchase and final naming. Scope: USPTO TESS search + common-law usage + non-US marks (at minimum EU + IL). Output: short memo under _bmad/docs/ + clear/conflict recommendation. If conflict, escalate to rename decision before OSS launch.',
   '',
   70),

  ('OPS-008',
   'Engage OSS-licensing + product counsel (Heather Meeker class)',
   'ops', 'tal', 'todo', 'p0', date '2026-05-05',
   'Added 2026-04-22 from brief-collab-capture-layer.md §Open Questions + §Constraints ("tens of thousands, non-optional"). Feeds OPS-005 (license decision) and OPS-006 (capture legal posture). Scope: one OSS-licensing specialist + one product-counsel who has shipped capture-adjacent products (Rewind / Granola / Otter). Early engagement — their advice shapes architecture, not vice versa.',
   '',
   80),

  ('OPS-009',
   'Decide landing-page hosting stack + telemetry framework',
   'ops', 'shenhav', 'todo', 'p1', date '2026-05-12',
   'Added 2026-04-22 from technical-research-duble-slash-stack.md §13 open questions. Two infra calls: (1) landing-page hosting — Vercel + Next.js assumed but not decided, alternatives: Cloudflare Pages, astro+Netlify; (2) telemetry framework for install/crash — PostHog OSS (required by KPI M2) vs. Sentry OSS (required by M8). Cost + self-host implications differ.',
   '',
   90),

  -- ─── Research (new group) ────────────────────────────────────────────────
  ('RES-001',
   'Execute problem-validation user interviews (30-person pool, ≥25 completed)',
   'research', 'tal', 'todo', 'p1', date '2026-05-20',
   'Added 2026-04-22 (daily audit) from user-research-plan.md. Plan drafted, pool confirmation pending. Every interview → notes file using §5 template. Feeds RES-003 synthesis + deck copy. Stage tracking lives in Interviews tab of the Tasks app (source of truth), not a parallel spreadsheet.',
   '',
   10),

  ('RES-002',
   'Execute industry desk research (≥10 cited sources per theme)',
   'research', 'tal', 'todo', 'p1', date '2026-05-05',
   'Added 2026-04-22 (daily audit) from industry-research-plan.md. No scheduling dependency — start immediately. Tier-1 sources + citation file tracking source → data point → theme. Corroborates interview findings with scale (esp. Theme E governance, where pool is design-heavy).',
   '',
   20),

  ('RES-003',
   'Synthesize per-theme findings — validate/modify/kill each of A–E; produce kill list',
   'research', 'tal', 'todo', 'p1', date '2026-05-27',
   'Added 2026-04-22 (daily audit) from user-research-plan.md §1 success criteria. 5 × ~1-page theme synthesis docs in _bmad/planning-artifacts/research/. Promoted one-liners feed the investor deck (MKT-009 launch narrative + pitch deck). Depends on RES-001 + RES-002.',
   '',
   30),

  ('RES-004',
   'MCP-vs-AX capture spike (week 1, 2–3 days)',
   'research', 'tal', 'todo', 'p0', date '2026-04-29',
   'Added 2026-04-22 from technical-research-duble-slash-stack.md §Tier 3 (lines 98–99). Direct quote from the research: "Critical action item: spike MCP-server-based capture in week 1 (2–3 days). If it covers Claude Desktop and Cursor cleanly, it could replace the Accessibility-API work entirely." Blocks FISH-003 architecture (FISH-007). Output: short memo + decision. Co-owner: Shenhav for the implementation eval.',
   '',
   40)

on conflict (id) do nothing;
