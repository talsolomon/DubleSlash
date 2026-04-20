# Domain Research — OSS License & Governance for Collab

**Date:** 2026-04-20
**Purpose:** Lock the license + governance posture for the Collab capture client and protocol before community launch. This decision is irreversible in practice (relicensing post-launch requires every contributor's sign-off and shatters trust), so it has to be made deliberately, once, before first external commit.

> **Not legal advice.** This report is a design-level synthesis of public precedents. Get a real OSS-licensing lawyer (Heather Meeker, Luis Villa, or equivalent) to review the final pick before launch.

---

## Key Concepts

| Term | Definition | Why it matters |
|---|---|---|
| **OSI-approved license** | License certified by the Open Source Initiative as meeting the Open Source Definition | "OSS" as a marketing claim legally means this. BSL/SSPL/FSL are **not** OSI-approved — calling them "open source" is increasingly pushed back on (see Sentry's "fair source" reframing). |
| **Permissive license** | Apache 2.0, MIT, BSD. Allows closed-source redistribution and commercial use with minimal obligation. | Lowest adoption friction; no reciprocity moat. |
| **Copyleft / weak copyleft** | GPL / LGPL / MPL. Downstream modifications must be released under the same license. | Creates a reciprocity pull — forks must upstream. LGPL/MPL are the practical choices (GPL scares enterprise legal). |
| **Network copyleft** | AGPL. Running modified code as a network service triggers source-disclosure. | Closes the "SaaS loophole." Google bans AGPL internally — that's the point; it *discourages* hyperscaler repackaging. |
| **Source-available / BSL** | Business Source License (HashiCorp, CockroachDB, Sentry pre-FSL). Source is public, commercial-competitive use restricted, auto-converts to permissive after N years (typically 4). | Protects against hyperscaler cloning while keeping source readable. Cannot be called "open source." |
| **SSPL** | Server Side Public License (MongoDB, Elastic, Redis). Stronger AGPL — requires open-sourcing the *entire service stack* around it. | OSI rejected it; enterprise legal teams increasingly refuse it. Blunt and controversial. |
| **Fair Source / FSL** | Functional Source License (Sentry, 2023). Non-compete for 2 years, auto-converts to Apache 2.0. | The cleanest BSL-successor; actively gaining adoption. |
| **Trademark policy** | Legal control over the *name* and *logo*, separate from the code license. | The real moat for most modern OSS companies — anyone can fork the code, nobody can call their fork "Collab." Cal.com / GitLab / Grafana all run this play. |
| **CLA** | Contributor License Agreement — contributors grant the company rights to relicense. | Controversial but enables future relicensing. DCO (Developer Certificate of Origin) is the lighter-weight alternative. |
| **Open-core** | OSS core, closed-source paid features. | Dominant model for infra OSS (GitLab, Grafana, Mattermost). Line between "core" and "premium" is the product question. |
| **OSS + SaaS** | OSS is fully featured; company sells managed hosting. | Supabase, Cal.com, PostHog. Requires a *good enough self-host story that nobody feels cheated*, while most users pick the hosted option for convenience. |

---

## How it works (current state, 2026)

**The hyperscaler cloning problem shaped the modern landscape.**

From 2018–2023, every successful infra OSS project got cloned by AWS or a cloud provider: Elasticsearch → AWS OpenSearch, MongoDB → DocumentDB, Redis → ElastiCache. The original authors captured neither the revenue nor the community credit. The response wave:

- **2018** — MongoDB launches SSPL. OSI rejects it.
- **2021** — Elastic moves to SSPL + Elastic License v2. AWS forks as OpenSearch.
- **2023** — HashiCorp moves Terraform from MPL 2.0 to BSL. OpenTofu forks immediately.
- **2023** — Sentry publishes FSL ("Fair Source"), establishing a cleaner template.
- **2024** — Redis moves to SSPL + RSALv2. Valkey forks under the Linux Foundation.
- **2024–2025** — the "fair source" framing gains traction as a third path between OSS and proprietary.

**Lesson:** if your product is infra that a hyperscaler can repackage as a managed service, pure permissive is a commercial death trap. If it's **not** that (client-side apps, dev tools with identity/network-effect moats), permissive works fine.

**The governance lattice:**

| Model | Example | Trade-off |
|---|---|---|
| Company-led, CLA-required | Most YC-backed OSS (Cal.com, PostHog, Supabase) | Fast decisions, relicensing optionality — but community sometimes calls it "open-washing" |
| Company-led, DCO only | Linux kernel, many older projects | No relicensing optionality; community-trust win; slower pivots |
| Foundation-owned | Kubernetes (CNCF), Node (OpenJS) | Credibility with enterprise; slower; requires scale to justify |
| BDFL / maintainer | Python (historically), Linux | Doesn't apply to company-backed projects |

---

## Expert knowledge (non-obvious things)

- **Trademark is the real moat, not the license.** Cal.com, Grafana, GitLab — all permissively licensed, all dominant. Fork the code and you still can't call your product by the name people search for. Register the trademark in US + EU + UK early. Budget ~$3–10k.
- **License choice is effectively irreversible.** Once external contributors have committed code, you cannot relicense without every contributor's consent (or a CLA that grants you that right upfront). Get the CLA/DCO question settled *before the first external PR*.
- **"Source-available" is becoming more accepted** in 2026 than it was in 2021. The ideological war has cooled; enterprise legal teams now routinely approve BSL/FSL after internal review. But *you still cannot call it "open source"* without inviting pushback from OSI purists and developer-Twitter.
- **AGPL is surprisingly viable for client-side apps.** The "SaaS loophole" is only a problem if competitors can run your code *as a service*. A desktop capture client running on the user's machine doesn't really have that attack surface — AGPL buys you reciprocity without annoying anyone. Grafana used AGPL successfully for years.
- **Fair Source (FSL) is the 2026 default for new commercial OSS.** It solves the hyperscaler problem cleanly (2-year non-compete, then Apache) without the SSPL baggage. Sentry, Keygen, several newer YC cos use it. Likely the safest "source-available" choice.
- **Dual-license is painful in practice.** Maintaining "AGPL for community, commercial for enterprise" requires either (a) CLA so you own all copyright, or (b) separate commercial-only features. Most teams that try dual-license abandon it within 2 years.
- **Don't conflate "open-core" with "feature-gated."** Open-core means the *core engine* is OSS and *plugins/modules* are proprietary (GitLab's approach). Feature-gating a single codebase via env vars is different and tends to anger the community ("why is SSO proprietary?").
- **Governance documents matter less than people think.** Nobody reads `GOVERNANCE.md`. What matters: a visible, responsive maintainer team; transparent roadmap; public issue triage; a Discord/Slack where decisions are debated in the open.
- **CLA vs. DCO is a tradeoff you should make explicitly.** CLAs give you relicensing optionality (insurance against a future HashiCorp-style pivot) at the cost of a signup-friction speedbump. DCOs are frictionless but foreclose relicensing. For a company-backed OSS project in 2026, a CLA is the conservative choice; Apache Foundation's CCLA is a well-worn template.
- **Hostile-fork risk is a real planning input.** If a big vendor (or even a disgruntled ex-employee) forks your project, can you survive? Trademark + network effects + the hosted product are usually the answer. BSL/FSL make hostile forks commercially non-viable during the non-compete window.

---

## Constraints & edge cases

- **"Open-source" as a marketing term is legally touchy.** OSI holds a (weak but real) trademark on "Open Source." If you use BSL/FSL, say "source-available" or "fair source." Calling BSL "open source" draws public correction and costs credibility.
- **Enterprise procurement checklists.** Some Fortune 500 legal teams still auto-reject anything not on an internal allow-list (usually Apache, MIT, BSD, LGPL, MPL). AGPL and SSPL get rejected categorically by many. BSL/FSL are a coin flip — improving fast but check target customers. For Collab's GTM (design + dev communities first, enterprise later) this is a Phase-2 concern, not a launch blocker.
- **GPL/AGPL contamination rules.** Shipping a binary that links GPL code into a proprietary blob violates the license. Keep GPL-licensed dependencies *out* of your distribution if your license is permissive, and *in* if you want reciprocity. Audit with ScanCode / FOSSA before launch.
- **Rights of captured third parties.** If the capture client captures *someone else's* AI session (a teammate's, a client's), the OSS license of the client doesn't dispose of the privacy/consent question. That is a separate domain (see `domain-research-capture-legality.md`) but it lands in the same codebase.
- **Dependency licenses propagate.** If you include a GPL'd library, your combined work may inherit GPL obligations regardless of your declared license. Vet every dep before first public commit.
- **Contributor copyright in the EU.** Some EU jurisdictions make copyright assignment via CLA harder than US (moral rights cannot be waived in France/Germany). Use a license-grant CLA rather than an assignment CLA.
- **Acquihire / acquisition implications.** A future acquirer will scrutinize license choice. AGPL and SSPL reduce acquisition multiples because acquirers can't easily proprietize the code. BSL/FSL are friendlier to M&A. Permissive + trademark is the most acquisition-friendly.

---

## Implications for Collab design

- **Recommended license pick: FSL-1.1-Apache-2.0 (Functional Source License, 2-year non-compete, auto-converts to Apache 2.0) for the capture client and wire protocol.**
  - Why: solves the hyperscaler clone risk cleanly (nobody can run "Managed Collab" against you for 2 years), auto-permissive tail calms community fears, 2026 precedent is strong (Sentry, Keygen, several YC OSS cos), enterprise legal teams increasingly approving.
  - Alternative if FSL feels too new: **Apache 2.0 + aggressive trademark policy** (Cal.com playbook). Works because Collab's moat is network-effect (team graph) + brand, not the capture client binary — cloning the client doesn't let anyone run the team graph without rebuilding the hosted side.
  - **Reject SSPL** — developer-trust damage outweighs the protection.
  - **Reject pure AGPL for the whole project** — makes enterprise adoption slower than it needs to be. Could use AGPL for specific server components if defense against hyperscaler repackaging of the team-graph backend becomes a priority.

- **Governance: company-led, CLA-required, public roadmap.** Match the Supabase/Cal.com/PostHog playbook.
  - Use Apache Foundation's CCLA as a starting template.
  - Publish a `GOVERNANCE.md` anyway — nobody reads it, but its absence gets called out.
  - Public roadmap on GitHub Projects, visible maintainer response times, Discord with a `#governance` channel where tough decisions get debated in the open.

- **Register trademarks early.** "Collab" + logo in US, EU, UK before public launch. This is the actual moat. Note: "Collab" as a standalone word mark will face USPTO descriptiveness pushback — pair with a distinctive logo and/or a modifier ("Collab Cloud"?) to strengthen the filing. Budget $5–10k for filings.

- **Separate repos: capture client (FSL) + protocol spec (Apache 2.0 or CC-BY).**
  - The *protocol* should be as permissive as possible so anyone can implement a capture agent for a new tool. That's what makes "tool-agnostic" credible.
  - The *client* can be FSL because it's the primary implementation you'll monetize hosting/team features around.

- **Ship the trust artifacts visibly.** Public build reproducibility, signed releases, published SBOM, public security.txt. Users who install "a layer that sees all their AI work" will audit the repo — make that easy and the OSS choice earns its keep.

- **CLA friction mitigation.** Use an automated CLA bot (cla-assistant.io) so first-time contributors sign once and never think about it again. Publish the CLA text in the repo, not behind a signup wall.

- **Pre-launch license audit.** Run FOSSA or ScanCode on the whole capture-client dependency tree before first public push. One GPL transitive dep can force a relicense.

- **Do this once, right.** The cost of picking wrong is a future painful migration (HashiCorp, Redis, Elastic all learned this). The cost of deliberating for 2 more weeks now is zero.

---

## Decision checklist (for product brief)

- [ ] License pick: FSL-1.1-Apache-2.0 (recommended) vs. Apache 2.0 + trademark (fallback)
- [ ] CLA vs. DCO: CLA recommended, via cla-assistant.io
- [ ] Trademark filings initiated (US + EU + UK) — confirm distinctiveness of "Collab" word mark
- [ ] Governance doc drafted (one page; actual governance lives in day-to-day operations)
- [ ] Capture protocol repo licensed separately (Apache 2.0)
- [ ] Dependency license audit clean (ScanCode / FOSSA)
- [ ] Legal review with an OSS-specialist attorney before first public commit

---

## Sources & references

- Sentry Fair Source License (FSL-1.1) — fsl.software
- OSI Open Source Definition — opensource.org/osd
- Heather Meeker, *Open (Source) for Business* — definitive practitioner text on OSS licensing
- HashiCorp BSL transition announcement (2023) and OpenTofu fork response
- Elastic → SSPL (2021) and AWS OpenSearch fork
- Redis → SSPL + RSALv2 (2024) and Valkey fork
- Cal.com / Supabase / PostHog public license and governance docs — direct playbook references
- Apache Foundation Individual CLA (ICLA) and Corporate CLA (CCLA) templates
- OSI position statements on SSPL, BSL, FSL

*Verify each precedent's current state before relying on it — licensing posture has shifted fast 2023–2026.*
