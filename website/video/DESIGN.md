# DESIGN.md — Duble Slash Hero Video

**Project:** Duble Slash — hero video for the OSS launch landing page
**Format:** 1920×1080 landscape (primary) + 1080×1920 portrait cut (social)
**Runtime:** 30s
**Register:** Dark, editorial, cinematic. Premium brand film, not product explainer.

---

## Style Prompt

A near-black cinematic opening where two luminous slashes awaken like a beacon — one flaring to brand green, the other brightening to warm white — over deep matte void. The camera dives into a dark-themed Claude desktop where a designer types `//` and the FISH palette blooms. Agent chips whisper the next move in quiet monospace. The beacon ticks. A montage flashes `//` firing across every AI tool. The user clicks the beacon and a three-panel FISH/Linear/GitHub-style reveal unfolds. Ends on the logomark and an editorial two-line close: *Keep doing what you do best. We'll consolidate the rest.* Think Linear launch film × Apple keynote × a very good editorial magazine cover.

## Colors

| Role | Hex | Use |
|---|---|---|
| **Void** | `#07080B` | Primary background. Near-black but warm — never `#000`. |
| **Ink** | `#12141A` | Layered panels, the dark Claude window, subtle surface differentiation. |
| **Hair** | `#1E2028` | 1px divider lines on dark surfaces. |
| **Off-white** | `#F2EFE8` | Primary type color. Warm, editorial — never clinical `#fff`. |
| **Bright white** | `#FFFBF0` | The *activated* right slash. Only appears from Beat 2 onward. |
| **Brand green** | `#3dd9b6` | The *activated* left slash. Beacon live-state. Used sparingly — green is scarcity. |
| **Brand dark** | `#0e3a35` | Shadow tones, slash fill at rest (Beat 1 only). |
| **Amber pulse** | `#d98a2b` | Reserved for one gesture: badge tick when capture lands (Beat 4). |
| **Muted** | `#6B6E76` | Secondary type, timestamps in agent chips. |

**Hard rule:** No full-screen linear gradients on dark backgrounds (H.264 banding). Use radial bloom or solid void + localized glow.

## Typography

- **Display — Fraunces** (Google Fonts, variable)
  Hero tagline, beat titles, the closing two-line stack. Use `opsz` axis aggressively — 160pt for display, 28pt for captions.
  Weights: 500 (body), 700 (display), 900 (climactic moments only).

- **Accent — Instrument Serif Italic** (Google Fonts)
  Word-flashes only: TRUST · SMART · INNOVATIVE · EVERYWHERE · DESIGNER-FRIENDLY.
  Always italic. Always isolated — never mixed with Fraunces on the same line.

- **System — JetBrains Mono** (Google Fonts)
  Agent chips, FISH palette labels, `//` renderings, anything that represents *the system speaking*. Weight 500. Mono is the system voice; the human/editorial voice is Fraunces.

**Hard rule:** No Inter. No generic sans-serif. Zero `Roboto` or `Arial` fallbacks — if a font fails to load, the composition fails, not silently degrades.

**Size floors (for rendered video readability):** Display ≥ 120px. Body text ≥ 28px. Mono chips ≥ 22px. Number labels use `font-variant-numeric: tabular-nums`.

## Motion Rules

- **Entrances:** Everything fades in from low opacity + subtle scale (0.96 → 1.0) or `y: 20 → 0`. No spin-ins, no letter-by-letter typewriter.
- **Exits:** Scene-to-scene transitions handle all exits (crossfade, iris-through-beacon, blur-pull). Elements do NOT self-dismiss before a scene transition.
- **Pacing:** Slow breath for Beats 1–2 (establish the beacon). Kick up the velocity in Beat 3 (the `//` moment earns the energy). Sustain through Beat 4. Decelerate sharply into Beat 6.
- **Easing:** Three easings max per scene. Defaults: `power3.out` for arrivals, `expo.out` for punch, `power2.in` for fade-to-black moments. No `elastic`, no `bounce` — this is editorial, not playful.
- **Breathing:** The slashes at rest have a 2.4s equalizer-style micro-pulse. Never still. Beacon is alive.

## Visual Treatments

- **Slashes as equalizers:** Each slash is composed of 5 vertical bars that rise/fall to simulate audio-reactive motion. At rest, bars breathe at ~20% amplitude. At activation (Beat 2), they flare to 100%. During `//` firing (Beat 3), they pulse in sync with each agent chip.
- **Bloom:** Activated slashes carry a 60px radial bloom behind them. `filter: blur(40px)` + `opacity: 0.4` on a duplicated slash layer.
- **Grain:** Subtle SVG noise overlay at 3% opacity on the void — kills H.264 banding, adds cinematic tooth.
- **Sync lines:** When capture flows from a tool to the beacon, a 1px `#3dd9b6` line traces the path with a gradient head (bright green → transparent tail). Duration: 0.4s per line.
- **Panels:** The three-panel reveal in Beat 5 uses `backdrop-filter: blur(20px)` + `background: rgba(18, 20, 26, 0.82)` for a subtle depth-of-field effect over the void.

## Asset Inventory

| Asset | Source | Status |
|---|---|---|
| Duble//Slash logomark (SVG) | Inline in `website/index.html`, extract | **Need** |
| Dark-theme Claude window chrome (stylized) | Build from scratch — dark ink panel + avatar + input field | **Need** |
| Cursor app chrome (stylized) | Build from scratch — keep signature dark-blue accent | **Need** |
| ChatGPT app chrome (stylized) | Build from scratch — keep `#10a37f` accent only for logo dot | **Need** |
| Terminal window chrome | Build from scratch — monospace green-on-black classic | **Need** |
| Perplexity app chrome (stylized) | Build from scratch — teal accent | **Need** |
| FISH/Double-Diamond ribbon (SVG) | Build custom — 4 nodes, connective curves | **Need** |
| Linear-style task view (micro) | Build from scratch — 3 FISH-phase columns, 2 cards each | **Need** |
| GitHub-style push history (micro) | Build from scratch — 3 recent pulls with branch badges | **Need** |
| Cursor pointer (stylized) | Inline SVG, warm off-white fill | **Need** |
| Voiceover narration | TTS (Step 5) | **Pending** |

## What NOT to Do

1. **No warm cream `#f6f5f1` backgrounds.** This is the old site palette — the video is its own world.
2. **No Inter typography.** Zero tolerance. The video is serif editorial.
3. **No bright full-screen flashes.** The void stays dark. Illumination is always localized (bloom, sync lines, single-slash color changes).
4. **No multiple green elements on screen at once.** Green = scarcity = the beacon is live. If two things are green, the beacon loses its meaning.
5. **No product screenshots or pixel-perfect UI.** All tool chromes are stylized — we own the silhouette, not the pixels. Brief explicitly calls this out (see `website-hero-concept.md` §Named AI tools).
6. **No "world's first" or category-claim copy.** Killed by Tal on 2026-04-22. Positioning lives in the manifesto close ("Keep doing what you do best"), not in tech-claim language.
7. **No "nothing leaves your machine" / "every AI session captured" / "productivity tool" / "second brain" framing.** All three killed by the marketing brief. Messages must come from the brief's three leads:
   - "Keep doing what you do best, where you do it best."
   - "One streamlined process based on the double diamond."
   - "The AI cloud for AI projects."
8. **No exit animations before scene transitions.** Transitions own the exits.
9. **No elastic/bounce easings.** Editorial, not cartoon.
10. **No music track by default.** Silent first draft. Music is a post-render addition, not a scaffold-time decision.
