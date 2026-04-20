# Domain Research — Legal & ToS Posture for AI-Work Capture

**Date:** 2026-04-20
**Purpose:** Decide which capture methods Collab can ship at v1 without creating existential legal exposure, and how to frame the ones that live in the grey zone. This shapes the engineering scope (network interception vs. per-app adapters vs. OS screen capture) and the trust/integrity marketing pillar — if the capture method is legally marginal, the whole GTM collapses.

> **Not legal advice.** This is a design-level synthesis of public doctrine and precedent. Get a real product-counsel review (someone who's shipped ambient-capture products — Rewind's, Granola's, or Otter's outside counsel) before launch.

---

## Key Concepts

| Term | Definition | Why it matters |
|---|---|---|
| **Network-layer interception** | Capture via local TLS proxy / system-level traffic hook on the user's own machine | Most powerful technique; tool-agnostic; highest legal/ToS complexity |
| **Per-app adapter** | Integration via official API, plugin SDK, or documented extension point | Lowest risk; limited coverage (only tools that expose SDKs) |
| **Browser extension / MV3** | Capture via injected content script on web-based LLMs (ChatGPT, Claude.ai, Perplexity) | Covered by each tool's ToS; Chrome Web Store review adds a gate |
| **Accessibility / UI automation** | Read visible content via macOS Accessibility / Windows UIAutomation APIs | Platform-legitimate channel; slower; user must grant permission |
| **OS screen capture** | Continuous screen recording (Rewind, Recall) | Broadest but triggers maximum privacy concern; Recall was the cautionary tale |
| **One-party consent** | Legal doctrine: recording is lawful if at least one party to the communication consents (that party being the user themselves) | The load-bearing doctrine for almost every ambient-capture product in the US |
| **Two-party / all-party consent** | Stricter rule in ~12 US states (CA, FL, IL, MA, MD, MT, NH, PA, WA, and some others); all participants must consent | Matters for meeting capture (Granola), less for solo AI-tool capture |
| **CFAA** | Computer Fraud and Abuse Act — prohibits access "without authorization" to computers | Post-*Van Buren* (2021) and *hiQ v. LinkedIn* (2022): scraping public data with valid credentials is generally not a CFAA violation. Intercepting your own traffic on your own machine is clearly fine. |
| **DMCA §1201** | Anti-circumvention — illegal to bypass "technical protection measures" on copyrighted works | Potentially in play if capture requires bypassing client-side DRM/obfuscation. Most LLM clients don't have TPMs in the §1201 sense. |
| **ECPA / Wiretap Act** | Federal prohibition on intercepting electronic communications | One-party-consent exception covers the user intercepting their own traffic. Does **not** cover intercepting a teammate's traffic remotely. |
| **GDPR lawful basis** | EU — any processing of personal data needs a lawful basis (consent, contract, legitimate interest, etc.) | Capturing a user's own AI sessions = consent / contract basis. Capturing teammates' sessions into a shared graph = separate lawful basis analysis for each subject. |
| **EU AI Act (in force 2024–2026)** | Requires provenance/transparency for AI-generated content in several categories | Collab's capture schema is a natural provenance substrate — compliance tailwind, not blocker. |
| **ToS automation / anti-circumvention clauses** | Contract terms in vendor ToS that prohibit reverse-engineering, automated access, or bypassing rate limits | The actual hard constraint for most capture methods. Violating ToS is typically a contract issue, not a criminal one — but contract breach can still support civil action and account termination. |

---

## How it works (current state, 2026)

**The doctrine that makes ambient capture viable at all: one-party consent + intercepting your own traffic.**

When a user installs Collab on their machine and Collab records what passes through the user's own network stack to/from Claude, ChatGPT, etc., the user is a party to the communication and is consenting to the recording. This is the same legal footing as:

- Granola recording your own meetings (with a notice to other attendees in two-party-consent states)
- Otter.ai transcribing your calls
- Charles Proxy / mitmproxy / Little Snitch inspecting your own traffic
- Browser DevTools logging your own network activity
- Rewind recording your own screen

All of these products have shipped for years without Wiretap Act liability. The legal substrate is settled for **solo capture of one's own traffic**.

**Where it gets interesting:** Collab's value is a *team* product. The moment a captured session flows into a shared team graph, three new questions appear:

1. Does the *teammate* whose session was captured consent to the team-graph push?
2. Does the *third party* in the captured content (e.g., a client's name in the prompt) have rights?
3. Does the *vendor* (OpenAI, Anthropic, Cursor) permit redistribution of captured traffic from their services?

These are the real questions. They are answerable; they're not blockers. But the product has to be designed around them.

**ToS reality across the top targets (public ToS as of knowledge cutoff; verify before launch):**

| Target tool | Relevant ToS clause (paraphrased) | Risk level for network-layer capture by the user |
|---|---|---|
| **ChatGPT (web / desktop)** | "Not reverse engineer, decompile... not use automated means to access" | Low-medium. Capturing your own outgoing prompts and rendered responses = closer to browser DevTools than "automated access." API is explicitly allowed under API ToS. |
| **Claude.ai / Claude Desktop** | Similar anti-automation and reverse-engineering clauses | Low-medium. Anthropic has been the friendliest major lab to transparency tooling; their ToS focuses on abuse/safety, not interception. |
| **Cursor** | Standard SaaS ToS; built on top of LLM providers | Low. The user is the licensed seat; capturing their own IDE traffic is analogous to shell history. |
| **GitHub Copilot** | Ties to GitHub ToS + Copilot-specific terms; data-use provisions | Medium. Microsoft ToS tend to be explicit about no-automation; worth close read. |
| **Perplexity** | Standard web ToS | Low. Browser-extension capture is essentially the same as Pocket / ReadWise. |
| **Figma AI / v0 / Replit Agent / Notion AI** | Standard SaaS ToS | Low. Embedded AI features; captured as part of user's own web traffic. |
| **Microsoft Recall / built-in Windows Copilot** | Microsoft-owned; OS-level | N/A — they're the OS, don't compete at this layer directly. |

**Pattern:** vendors prohibit *automated mass access* (scraping their service) and *reverse-engineering their clients*. Capturing the user's own session transcripts — what the user already sees on screen — is not really the target of those clauses. But it's adjacent enough that a vendor could choose to enforce if motivated. The risk is not "legal liability"; it's "a major vendor publicly revokes your capture method," which would be a GTM disaster more than a legal one.

**Recall as the cautionary tale.** Microsoft Recall's 2024 launch failure was instructive:
- No explicit opt-in (default-on by deployment)
- No redaction for passwords/secrets/private content
- Captured everything on screen including other users' content
- Unencrypted storage (initial launch)

The legal fallout was limited because Microsoft owns the OS and users "agreed" via Windows ToS — but the *product* failure forced Microsoft to delay, add opt-in, add encryption, add exclusion lists. The lesson: **legal permissibility is necessary but not sufficient. Perceived invasiveness is the real blocker.** Collab's integrity-first GTM is the direct response to Recall's misread.

---

## Expert knowledge (non-obvious things)

- **The user-is-the-licensee defense is strong but not infinite.** Every ToS is between the vendor and the individual user. When Collab captures Alice's ChatGPT session *on Alice's machine* under *Alice's login*, Alice is the one (potentially) breaching her ToS with OpenAI — not Collab. This is the same logic ad-blockers and Rewind rely on. Collab's exposure is secondary (contributory).
- **But contributory liability is real.** Tools that primarily exist to facilitate users breaching ToS can attract direct claims from vendors. The safest posture: Collab captures the user's own traffic using general-purpose techniques; the user chooses what to capture and where to push it. Frame Collab as *infrastructure*, not a *ChatGPT-bypass tool*.
- **Network-layer TLS interception on the user's own machine is well-precedented.** Charles Proxy, mitmproxy, Proxyman, Little Snitch, Wireshark, and enterprise DLP tools all do this legally. The technique is lawful; the question is *whether the captured content can be redistributed*.
- **Do not install a root CA without explicit, informed user consent.** TLS interception on modern macOS / Windows typically requires installing a local root certificate in the user's trust store. Any product that does this silently or misleadingly is an instant scandal (Superfish, Komodia, etc.). If you need TLS interception, make it a *visible* opt-in with a clear explainer; better yet, use per-app adapters or platform logging hooks where possible and reserve root-CA installation for advanced users.
- **API capture is always safe.** When a user authenticates Collab against OpenAI's API / Anthropic's API with their own API key, capture is explicitly authorized under the API ToS. The boring path — "paste your API key" — covers a huge fraction of the use case with zero legal exposure.
- **Browser-extension capture is a Chrome Web Store question, not a ToS question.** Manifest V3 extensions that read page content are routine (ad-blockers, Grammarly, LastPass, Notion Web Clipper). The real gate is Chrome Web Store review, which scrutinizes data-collection disclosures. Publish a clear data-handling doc before submission.
- **macOS Accessibility API is the polite path for desktop capture.** macOS's Accessibility API exposes UI content to apps the user explicitly grants access to (with a visible System Settings toggle). Slower and lossier than network interception, but platform-legitimate and immune to vendor ToS pushback. Granola uses this pattern. Consider this for desktop LLM clients before reaching for TLS interception.
- **Windows UIAutomation is the equivalent.** Same posture, same trade-offs. Linux has no unified equivalent; you'd fall back to Wayland/AT-SPI hacks or network interception.
- **Two-party consent mainly bites for meetings, not solo AI-tool use.** When Alice is the only human in her Claude session, there's no "other party" to consent besides Anthropic as a service. Two-party laws target intercepting conversations between humans. Keep this in mind when Collab expands to Granola-style meeting capture — *then* it matters.
- **The "captured content belongs to the user" argument is strong.** Courts have consistently held that text entered by a user and responses rendered to them are theirs to retain. Vendors don't own your prompt history any more than Google owns your search history.
- **GDPR is a schema question, not a capture question.** If Collab stores personally-identifying content (names, emails, client identifiers) from captured sessions, that's processing personal data. Standard response: (a) local-first storage by default, (b) redaction tooling before push, (c) DPA for any cloud-hosted tier, (d) data-residency options for EU customers. Not novel; well-trodden path.
- **EU AI Act is a tailwind.** Articles around provenance and transparency for AI-generated content push enterprises toward needing exactly the kind of audit trail Collab produces. Position capture as a compliance substrate, not just productivity — this opens enterprise budget that productivity tools can't reach.
- **"Legitimate interest" is a fragile GDPR basis.** Don't rely on it for team-graph push of a teammate's captured sessions; get explicit consent at team-install time. Record that consent in a way you can show a regulator.
- **The Rewind / Granola / Otter track record is the clearest precedent.** Three public companies shipping ambient capture, no meaningful legal fallout after years in-market. Follow their consent + redaction playbook and you inherit their defensibility.
- **Enterprise procurement will ask about provider-side enforcement, not US law.** The question "will OpenAI / Anthropic sue us for using Collab on their services?" is more important to a CISO than any wiretap analysis. Having direct vendor-relations conversations (or better: partnership agreements) with the top 3 LLM vendors before big enterprise deals is a real moat.

---

## Constraints & edge cases

- **Teammate consent is load-bearing.** A captured session flowing into a team graph is a new disclosure to the *teammates who will read it*. Design for:
  - Explicit opt-in at install ("by installing Collab, you consent to your captured sessions being visible to members of <team>")
  - Per-session push control (the user chooses what leaves the local store)
  - Clear boundary: solo capture is always local; team-graph push is a deliberate, visible action
- **Third-party content in captured sessions.** If Alice pastes a client's PII into a Claude prompt, Collab captures it, and it syncs to the team graph, Alice's company may be processing that client's data without a lawful basis. Mitigations:
  - Auto-redaction of obvious PII before push (emails, phone numbers, credit cards, SSNs)
  - Configurable redaction rules for industry-specific identifiers (patient IDs, client names)
  - Pre-push preview showing what will leave the device
  - Audit log of what was redacted (without the content)
- **Children's data / GDPR Article 8.** If Collab is ever deployed in contexts involving minors (edtech, family accounts), the lawful-basis bar rises materially. Probably out of scope for v1 but document as a policy decision.
- **Export control.** Capturing cryptographic outputs, weapons-related content, or sanctioned-region traffic could theoretically trigger US EAR obligations at enterprise scale. Low probability for v1; flag for enterprise SKU.
- **DMCA §1201 edge case.** If capturing from a specific tool requires bypassing a technical protection measure (obfuscated JS, encrypted local storage), the capture method itself could trigger anti-circumvention. Most LLM clients don't have §1201-qualifying TPMs — but audit before shipping a capture method that requires circumvention of intentional protections.
- **Vendor terms can change unilaterally.** An LLM vendor could amend its ToS tomorrow to explicitly prohibit tools like Collab. Mitigations:
  - Prefer per-app adapters where the vendor has a documented extension mechanism (API, SDK, MCP server)
  - Maintain diverse capture paths so the loss of one doesn't collapse coverage
  - Build direct vendor relationships early — an MCP-partner conversation with Anthropic, an extension-store partnership with Cursor, etc.
- **Open-sourcing the capture client is a legal asset.** Public, auditable source code reduces the "what does it actually do" attack surface that vendors could use to argue bad faith. Paired with the OSS license analysis (`domain-research-oss-license-governance.md`), this is a coherent posture.
- **Do not capture keystrokes.** Crosses into keylogger territory, which has independent criminal exposure (Computer Fraud provisions in many states). Capture at the application/protocol level, not the input level.
- **Do not capture passwords / secrets / 2FA.** Redact at the capture layer, not the push layer. If it's ever stored locally, even encrypted, it's discoverable.
- **Enterprise self-host changes the analysis.** When a customer runs the entire stack on their own infrastructure, Collab-the-company's exposure collapses — the customer is the controller, the processor is their own server. Offer self-host as a first-class deployment for compliance-heavy customers.

---

## Implications for Collab design

- **Capture-method tiering at v1 (recommended ordering):**
  1. **API key (tier 0 — always-safe):** user provides OpenAI / Anthropic / etc. API keys; capture happens at the API call site. Zero ToS exposure, explicit authorization. Covers a large slice of power-user workflows. Ship first.
  2. **Per-app adapters / official extension points (tier 1):** MCP servers where available, documented SDK integrations, official extension APIs. Zero ToS exposure because the vendor exposed the surface. Ship in parallel with tier 0.
  3. **Browser extension (tier 2):** for web LLMs (ChatGPT web, Claude.ai, Perplexity). Well-precedented. Ship at or shortly after launch. Invest in clear Chrome Web Store / Firefox AMO disclosures.
  4. **Accessibility / UIAutomation (tier 3):** for desktop LLM clients (Claude Desktop, ChatGPT desktop, Cursor). Platform-legitimate, user-granted. Ship mid-2026.
  5. **Network-layer TLS interception (tier 4 — power-user / fallback):** optional, explicit, opt-in, with a prominent "you are installing a local root CA" dialog. Ship as "advanced mode" — not the default path. Use only when tiers 1–3 can't cover a critical tool.
- **Do not default to OS-level screen capture.** Recall demonstrated that this breaks trust before trust is earned. If screen capture ships at all, it's a v2 feature, deeply opt-in, scoped to specific windows, with a dramatic always-visible indicator.
- **Design the trust surface as a product, not a compliance disclosure.**
  - Always-visible capture indicator showing *which tools* are being captured and *how*
  - Pre-push redaction preview with diff-style highlights of what will be redacted
  - Local-only-by-default mode; team push is a deliberate user action
  - Public audit log: what left the device, when, to where
  - Published privacy policy + DPA written in plain English, not lawyer-speak
- **Team-install consent flow.** Every teammate's first-run experience must present explicit, specific consent for:
  - Local capture (what gets captured)
  - Team-graph push (who sees it)
  - Cloud hosting (if applicable — where data lives)
  Record consent with timestamp + version; design the system so a future regulator can be shown exactly what each user agreed to.
- **Self-host as a first-class tier.** Enterprise customers with compliance constraints need to run the whole stack themselves. This is also a strong answer to the vendor-ToS question: self-hosted Collab is the customer's own internal tool.
- **Proactively build vendor relationships.** Anthropic (MCP partner), OpenAI (Assistants / enterprise partnership), Microsoft (Copilot ecosystem), Cursor (extension partner). A publicly acknowledged partnership with even one major lab is a massive trust accelerator. Pursue in parallel with v1 build.
- **Publish a "how we capture" page with full technical detail.** What's intercepted, how, where it's stored, who sees it. This is marketing, not compliance. The audience is skeptical engineers and security-minded PMs.
- **Retain specialist product counsel before launch.** Someone who has shipped an ambient-capture product before and knows the actual enforcement patterns. Budget for this — it's tens of thousands of dollars, not hundreds.
- **Ship a responsible-disclosure / security-bug bounty program from day one.** A capture layer will get security researchers poking at it. Inviting them is cheaper than fighting them.

---

## Risk summary for the product brief

| Capture method | Legal risk | ToS risk | Trust risk | Ship in v1? |
|---|---|---|---|---|
| API-key capture | Very low | None | Low (explicit) | **Yes — default** |
| Per-app adapter / MCP | Very low | None | Low | **Yes — where available** |
| Browser extension | Low | Low | Low–medium | **Yes** |
| Accessibility / UIAutomation | Low | Low | Medium (permission prompt) | **Yes — phased** |
| Network-layer TLS interception | Low–medium | Medium | High | **Opt-in / advanced only** |
| OS screen capture | Low | Low | Very high | **No — v2 at earliest** |
| Keystroke capture | High | Medium | Catastrophic | **Never** |

---

## Decision checklist (for product brief)

- [ ] Capture-method scope for v1: tiers 0–3, tier 4 as advanced opt-in
- [ ] No OS screen capture at launch; revisit post-PMF
- [ ] Teammate consent flow designed before any team-graph push ships
- [ ] Auto-redaction (PII, secrets) before any push leaves the device
- [ ] Public "how we capture" page drafted
- [ ] Self-host deployment as first-class enterprise tier
- [ ] Specialist product counsel engaged before first public capture ships
- [ ] Vendor-partnership outreach started (Anthropic, OpenAI, Cursor, Microsoft)
- [ ] Responsible-disclosure / bounty program ready for launch

---

## Sources & references

- *Van Buren v. United States*, 593 U.S. ___ (2021) — narrowed CFAA "exceeds authorized access"
- *hiQ Labs v. LinkedIn*, 31 F.4th 1180 (9th Cir. 2022) — scraping public data with authorization
- Electronic Communications Privacy Act (ECPA) / Wiretap Act — one-party-consent doctrine
- California Penal Code § 632 — two-party-consent state example
- GDPR Articles 6, 7, 13, 30 — lawful basis, consent, transparency, processing records
- EU AI Act (Regulation 2024/1689) — provenance and transparency provisions
- OpenAI Terms of Use + Usage Policies (verify current text pre-launch)
- Anthropic Acceptable Use Policy (verify current text pre-launch)
- Chrome Web Store Developer Program Policies — extension data handling
- Microsoft Recall launch retrospectives (2024) — failure-mode reference
- Granola, Otter.ai, Rewind public privacy / DPA documents — industry posture reference
- Superfish / Komodia / Lenovo root-CA incidents (2015) — what not to do with TLS interception

*All citations are references, not advice. Verify current state before acting on any of them.*
