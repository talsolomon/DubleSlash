# STORYBOARD.md — Duble Slash Hero Video

**Locked.** 6 beats · 30.0s · 1920×1080 · Void `#07080B` base · Fraunces + Instrument Italic + JetBrains Mono

> This is the creative north-star. The engineer (Step 6) follows this document beat by beat. Any deviation = open a change-note back to Tal before building.

---

## Beat 1 — The Void · 0.0s → 3.0s (3.0s)

**Intent:** Create anticipation from nothing. The emptiness is the hook.

**Screen:**
- Full void `#07080B`. Subtle SVG grain overlay @ 3% opacity.
- Two slashes at stage center, composed of 5 vertical bars each (equalizer form). At rest, bars sit at ~15% amplitude, filled in brand-dark `#0e3a35` — ghost-visible, not declarative.

**Motion:**
- 0.0–0.6s: absolute stillness. Silence behind the narration opener.
- 0.6–3.0s: equalizer bars breathe — random amplitudes between 12–22%, 0.4s per cycle, staggered across bars.
- Slashes as a whole: very faint opacity ramp `0 → 0.35`.

**Narration:**
- 0:00.5 — "You use Claude for research."
- 0:02.0 — "Cursor for code."

**Word-flashes:** *(none — silence holds the frame)*

**Transitions:** None — continuous into Beat 2.

---

## Beat 2 — Ignition · 3.0s → 6.5s (3.5s)

**Intent:** The beacon awakens. Both slashes transform in one frame — the "before/after" of Duble Slash itself.

**Screen:**
- Slashes stabilize at 100% opacity.
- **Ignition moment at 3.3s:** left slash flips from `#0e3a35` to brand green `#3dd9b6`. **Right slash simultaneously brightens from `#0e3a35` to warm bright white `#FFFBF0`.** Both slashes gain a 60px radial bloom behind them (blur + low-opacity duplicate).
- Equalizer bars surge from 20% → 100% amplitude on the ignition frame, then settle back to a confident 60–80% breathing pattern.

**Motion:**
- Ignition itself is NOT a tween — it's a single-frame `tl.set()` at 3.3s. Tweens handle the bloom ramp-up (`duration: 0.5, ease: expo.out`) and the equalizer flare.
- "TRUST" word-flash: Instrument Serif Italic, 140px, `#F2EFE8`, positioned 180px below the slashes. Fade in `y: 20 → 0, opacity: 0 → 1` over 0.5s starting at 4.8s. Hold 0.7s. Fade out `opacity → 0` over 0.4s.

**Narration:**
- 0:03.3 — "ChatGPT for writing." *(lands exactly on ignition)*
- 0:04.8 — "Your AI tools are everywhere."
- 0:06.0 — "Your AI work is nowhere."

**Word-flashes:** **TRUST** (Instrument Italic, 4.8s–6.2s)

**Transitions:** 6.5–7.0s iris-push into beacon bloom — camera scale + blur pull that "enters" the green slash as a portal into Beat 3's Claude window.

---

## Beat 3 — The `//` Moment · 7.0s → 15.5s (8.5s) **HERO BEAT**

**Intent:** Show the product's core interaction. Type two slashes → FISH palette + 4 agents + capture fire. This is the "magic" the whole film earns.

**Screen:**
- Layout: dark Claude window (`#12141A`) centered, occupying ~72% of frame. Input field at bottom of the window, cursor blinking.
- Top-right of the void (outside the Claude window): the beacon stays docked — both slashes still lit, equalizer pulsing quietly.

**Motion sequence (tight choreography):**

| Sub-beat | Time | Event |
|---|---|---|
| 3a | 7.0–7.8s | Claude window fades in (`opacity: 0 → 1, scale: 0.96 → 1.0`). Cursor blinks in input. |
| 3b | 8.0–8.4s | User types — one character at a time — **`/`** then **`/`**. Two chunky keystrokes (~200ms each), each accompanied by a single-frame flash on the beacon equalizer. |
| 3c | 8.6–9.4s | **FISH palette blooms** directly under the input field. Four chips render in JetBrains Mono: `Explore` · `Solidify` · `Build` · `Ship` — each separated by `·`. Chips stagger-fade in `y: 8 → 0, opacity 0 → 1` over 0.3s, 0.15s apart. |
| 3d | 10.0–10.8s | **Agent chip 1 appears** top-right of input: `// Solidifier · picking up pricing-page from Tuesday` — JetBrains Mono 24px, green-accented left border 2px solid `#3dd9b6`. Fade in + slight slide-up. |
| 3e | 11.2–11.8s | **Agent chip 2** below chip 1: `// Capture · session linked` — same treatment. |
| 3f | 12.2–13.0s | **Agent chip 3** below chip 2: `// Next move → tier table review` — same treatment. The "explain what to do next" beat. |
| 3g | 13.0–15.4s | FISH chips under the input **glow sequentially** in sync with the narration: Explore (13.0s) → Solidify (13.8s) → Build (14.6s) → Ship (15.4s). Glow = `box-shadow: 0 0 24px rgba(61, 217, 182, 0.6)` + 1.04× scale pulse. |

**Narration:**
- 0:08.0 — "Type two slashes."
- 0:10.0 — "One of four agents picks up your project where you left it."
- 0:13.0 — "Explore."
- 0:13.8 — "Solidify."
- 0:14.6 — "Build."
- 0:15.4 — "Ship."

**Word-flashes:** **SMART** (Instrument Italic, 9.5s–10.5s) · **INNOVATIVE** (11.5s–12.5s). Positioned in margin space left of the Claude window.

**Transitions:** 15.5–16.2s: Claude window softens into a small window in the top-left while the camera widens out — sets up Beat 4's cross-tool montage.

---

## Beat 4 — Cross-Tool Montage · 16.2s → 21.2s (5.0s)

**Intent:** Pay off "keep doing what you do best, where you do it best." Show `//` firing in every tool.

**Screen:**
- 5-cell tool grid — rendered as small floating app windows:
  - Top-left: Claude (from Beat 3, now scaled down)
  - Top-right: **Beacon** (docked in a faux menubar, center-right) — the target of all sync lines
  - Middle-left: Cursor (dark editor chrome)
  - Middle-right: ChatGPT (clean conversation chrome)
  - Bottom-left: Terminal (classic green-on-black)
  - Bottom-right: Perplexity (teal search chrome)

**Motion sequence:**

| Sub-beat | Time | Event |
|---|---|---|
| 4a | 16.2–16.6s | Five tool windows stagger-fade in around the Claude window. |
| 4b | 16.8s | `//` flashes briefly in Cursor. Sync line `#3dd9b6` traces from Cursor to beacon (0.4s). |
| 4c | 17.4s | `//` flashes in ChatGPT. Sync line traces. |
| 4d | 18.0s | `//` flashes in Terminal. Sync line. |
| 4e | 18.6s | `//` flashes in Perplexity. Sync line. |
| 4f | 16.8–19.5s | **Amber badge** `#d98a2b` appears on beacon, ticks **1 → 2 → 3 → 4 → 5** as each sync line arrives. Each tick = badge 1.4× scale-up → 1.0× in 180ms. |

**Narration:**
- 0:16.2 — "Your process syncs across your machines."
- 0:19.0 — "Your teammates pick it up on theirs."

**Word-flashes:** **EVERYWHERE** (Instrument Italic, 17.0s–20.0s — longest hold in montage). Positioned bottom-center, behind the tool windows at 0.5 opacity.

**Transitions:** 21.2–22.0s: cursor glides to the beacon, clicks. Tool windows fade out. Camera zooms to menubar.

---

## Beat 5 — The Reveal · 22.0s → 25.5s (3.5s)

**Intent:** Show what's *in* the Context Cloud. Three views = three brief-sanctioned positioning points made visible.

**Screen:**
- Beacon stays top-right. A panel unfurls downward from the beacon — 1600px wide, rounded 14px, `rgba(18, 20, 26, 0.92)` with 1px `#1E2028` border.
- **Three sub-panels side-by-side inside:**

  **Panel A — FISH / Double-Diamond Ribbon (40% width, left):**
  - 4 nodes in a curved double-diamond arrangement: Explore · Solidify · Build · Ship.
  - Current position pulses green on "Build."
  - Connective curves drawn in SVG, `stroke: #3dd9b6, opacity: 0.5`.
  - Tiny tooltip near "Build": `solidify · 100%  ·  build · 62%`.

  **Panel B — Linear-style task view (30% width, center):**
  - Three columns labeled: `EXPLORE` · `SOLIDIFY` · `BUILD`.
  - 2 task cards per column. Cards show ID, title, phase sigil.
  - Example: `PRICE-42 · Tier table refresh · Build`.

  **Panel C — GitHub-style push history (30% width, right):**
  - Three rows stacked. Each row: branch name, commit message, tool badge (Claude/Cursor/Terminal), relative timestamp.
  - Example: `origin/pricing-refresh · "draft tier copy" · Claude · 12m ago`.

**Motion:**
- 22.0–22.4s: Panel unfurls from beacon (`scaleY: 0 → 1, transformOrigin: top`). `ease: expo.out`.
- 22.6–23.4s: FISH ribbon strokes draw in left-to-right using `stroke-dasharray` technique.
- 23.2–24.0s: Linear cards stagger-fade (150ms apart).
- 23.8–24.6s: GitHub rows stagger-fade.
- 24.0s: "Build" node pulses green with a `box-shadow` flare.

**Narration:** *(silent — no narration in Beat 5. Let the reveal speak.)*

**Word-flashes:** **DESIGNER-FRIENDLY** (Instrument Italic, 22.0s–25.5s — longest hold of the film, 3.5s. This is the editorial moment.) Positioned bottom-center, 160pt, low opacity 0.3 so it reads as background poetry behind the panels.

**Transitions:** 25.5–26.0s: panels fade and collapse back toward the beacon. Beacon floats to center. Tool windows dissolved.

---

## Beat 6 — Manifesto Close · 26.0s → 30.0s (4.0s)

**Intent:** Resolution. The film *answers* its own opening question.

**Screen:**
- Beacon (left green slash + right bright-white slash) centered at ~40% of frame height, logomark scale.
- Below, at ~60% height, **two-line tagline lockup** in Fraunces display:
  - Line 1: *Keep doing what you do best.* (160pt, weight 700, `#F2EFE8`)
  - Line 2: *We'll consolidate the rest.* (160pt, weight 700, `#F2EFE8`)
- Optional: micro-caption 40px below in Fraunces 500, `#6B6E76`: `Duble//Slash`

**Motion:**
- 26.0s: beacon slow-scales `1.0 → 1.08` over 4s (very subtle).
- 26.0–26.8s: Line 1 fades in `y: 20 → 0, opacity: 0 → 1` (`ease: power3.out`).
- 28.0–28.8s: Line 2 fades in same pattern.
- 29.2s: equalizer bars inside the slashes slowly decelerate to 30% amplitude — the beacon is "at rest, waiting."
- 29.8–30.0s: subtle overall opacity dip to 0.85, then hold. Final frame is the whole lockup at 0.85 opacity — the film fades into the void, not cuts.

**Narration:**
- 0:26.0 — "Keep doing what you do best."
- 0:28.0 — "We'll consolidate the rest."

**Word-flashes:** *(none — the tagline IS the final typography)*

**Transitions:** None. End of film.

---

## Asset Audit

| Asset | Used in Beat | Build status |
|---|---|---|
| Duble//Slash logomark (equalizer version — 5 bars per slash) | 1, 2, 4, 6 | Build custom SVG + CSS. Animate the bars independently. |
| Dark Claude window chrome | 3 | Build custom. Dark panel + avatar + input + send button. |
| FISH palette inline chips | 3 | Build custom. JetBrains Mono, 4 chips + `·` separators. |
| Agent chips (3 variants) | 3 | Build custom. Mono, 2px green left border, timestamp. |
| Cursor window chrome (dark editor) | 4 | Build custom. Minimal — title bar + 2 lines of fake code. |
| ChatGPT window chrome | 4 | Build custom. Minimal. |
| Terminal window chrome | 4 | Build custom. Classic green-on-black. |
| Perplexity window chrome | 4 | Build custom. Teal search bar. |
| Sync lines (animated SVG paths) | 4 | Build custom. `stroke-dasharray` technique. |
| Amber badge | 4 | Build custom. CSS + GSAP scale. |
| FISH double-diamond ribbon | 5 | Build custom SVG. 4 nodes + 4 curves. |
| Linear-style task view panel | 5 | Build custom. 3 columns × 2 cards. |
| GitHub-style push history panel | 5 | Build custom. 3 rows with branch badges. |
| Cursor pointer | 4, 5 | Build custom SVG. |
| Fraunces font | 2, 6 | Google Fonts `@import` — Hyperframes auto-embeds. |
| Instrument Serif Italic | 2, 3, 4, 5 | Google Fonts `@import`. |
| JetBrains Mono | 3, 4, 5 | Google Fonts `@import`. |
| Voiceover narration `narration.wav` | 1, 2, 3, 4, 6 | **TTS (Step 5 — pending user approval).** |
| Background music | *(none)* | Not used in first draft. Add post-render if desired. |

---

## Contrast Pre-check (WCAG)

| Element | Foreground | Background | Ratio | Pass |
|---|---|---|---|---|
| Fraunces tagline (Beat 6) | `#F2EFE8` | `#07080B` | 17.3:1 | ✅ AAA |
| Instrument Italic word-flash | `#F2EFE8` | `#07080B` | 17.3:1 | ✅ AAA |
| Green slash on void | `#3dd9b6` | `#07080B` | 9.2:1 | ✅ AAA |
| JetBrains chip text | `#F2EFE8` | `#12141A` | 14.1:1 | ✅ AAA |
| Agent chip green border | `#3dd9b6` | `#12141A` | 7.5:1 | ✅ AAA (non-text threshold) |
| Muted mono timestamps | `#6B6E76` | `#12141A` | 3.1:1 | ⚠️ Large text only (≥22px) |

All passes assuming text sizes hold per DESIGN.md floors. `hyperframes validate` will flag any mis-sized instances at build time.

---

## Critical Path for Build (Step 6)

1. Root `index.html` with 6 sub-composition references + a captions composition.
2. Sub-compositions (one HTML file each): `beat-1-void.html`, `beat-2-ignition.html`, `beat-3-slashes-moment.html`, `beat-4-cross-tool.html`, `beat-5-reveal.html`, `beat-6-close.html`.
3. Shared assets: `assets/logomark.svg`, `assets/cursor.svg`.
4. Audio: `assets/narration.wav` (from Step 5).
5. Lint + validate passes before preview.

Total composition count: 8 (root + 6 beats + captions). All use `data-composition-src`.
