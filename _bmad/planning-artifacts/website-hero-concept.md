# Trace — Website Hero Concept

**Status:** Concept draft
**Author:** Tal (originated), storyboarded with Claude
**Date:** 2026-04-20

---

## The big idea

The landing page *performs* Trace instead of describing it. A single cinematic sequence demonstrates the capture → handoff → pull loop in ~20 seconds, using a "desktop within a desktop" device that mirrors how the app actually sits in a user's menubar.

The hero replaces the traditional "headline + screenshot + CTA" pattern with a live demo you don't have to start. By the time the animation settles, the viewer has seen the product work across two people and two AI tools — no explanation required.

---

## Narrative beats (three acts)

### Act 1 — Capture
A user asks Claude for something on their desktop. They hit Enter. Trace captures silently.

### Act 2 — Handoff
The camera flies through the Trace menubar icon into a *different person's* desktop, where they're using a different AI tool (GPT / Perplexity / Cursor). The Trace icon there blinks; a counter ticks up.

### Act 3 — Pull
The second user clicks their Trace icon. A panel reveals what landed: which projects updated, which tasks/branches changed. They click **Pull** — and continue the work seamlessly on their machine.

---

## Storyboard — frame by frame

Each frame shows **what's on screen**, **what animates**, **approximate duration**, and **what the viewer is meant to feel/understand**.

### Frame 1 — Empty canvas
- **Screen:** White (or deep-neutral) full-bleed. "Trace" wordmark, top-left. Nothing else.
- **Motion:** Held still for 0.6s. Silence.
- **Duration:** ~0.6s
- **Intent:** Create anticipation. The emptiness is the hook — something is about to happen.

### Frame 2 — Icon drop
- **Screen:** The Trace app icon fades/scales in at center, ~30% of viewport height. Large, confident.
- **Motion:** Soft ease-out scale from 0.8 → 1.0 with a faint breath (subtle pulse).
- **Duration:** ~1.0s
- **Intent:** "Here's the thing. Remember this shape."

### Frame 3 — Minimize to menubar
- **Screen:** The icon shrinks and glides to the top-right corner of the page, settling into a mock macOS menubar position.
- **Motion:** Curved Bézier path (not linear). Slight "landing" bounce when it docks.
- **Duration:** ~0.8s
- **Intent:** "This is where it lives. Quiet. Always-on."
- **Key detail:** As the icon docks, a very faint menubar strip materializes along the top — just enough to establish the viewer is now looking at "a desktop."

### Frame 4 — Desktop establishes
- **Screen:** The page transforms into a stylized desktop. Wallpaper, dock hint, menubar with Trace icon top-right showing a soft slow blink (1s on, 1s off).
- **Motion:** Subtle parallax on wallpaper. Icon blinks silently.
- **Duration:** ~1.2s
- **Intent:** "Trace is here, working, while you do other things."

### Frame 5 — Claude appears
- **Screen:** A Claude chat window fades in on the desktop, center-left. Cursor is in the input.
- **Motion:** Window scales from 0.95 → 1.0 with a soft shadow landing.
- **Duration:** ~0.8s
- **Intent:** Establish the trigger surface. This is what the user is actually doing.

### Frame 6 — The ask
- **Screen:** Text types itself into the Claude input — something evocative and short, e.g. *"Draft the onboarding email for the design system launch"* or *"Spec the pricing page changes we talked about."*
- **Motion:** Keystroke-timed typing (~40ms/char).
- **Duration:** ~2.0s
- **Intent:** Show a *real* piece of work, not a toy prompt. Make it feel like a Monday morning.

### Frame 7 — Enter + capture flash
- **Screen:** The "Enter" key visualizes (or the Send button pulses). A thin line of light travels from the chat window up to the Trace icon in the top-right.
- **Motion:** Line traces the path in ~0.4s. Icon gives a single bright pulse when the signal arrives.
- **Duration:** ~0.6s
- **Intent:** "That just got captured — effortlessly, in the background."

### Frame 8 — Zoom through the icon (transition)
- **Screen:** Camera accelerates toward the top-right icon. The icon fills the screen, then we pass *through* it (white flash or iris-wipe through the icon's silhouette).
- **Motion:** Scale + slight motion blur. The icon becomes the portal.
- **Duration:** ~0.8s
- **Intent:** Visual metaphor for the capture traveling across machines. Also the scene transition.
- **Comprehension cue:** As we emerge on the other side, the wallpaper is clearly *different* (different color, different dock arrangement, maybe a family photo instead of abstract art). The menubar clock shows a different timezone. **This is a different person.**

### Frame 9 — Second desktop lands
- **Screen:** New desktop. Different wallpaper. A ChatGPT (or Perplexity, or Cursor) window is already open. Trace icon top-right.
- **Motion:** Brief settle, no movement for 0.3s to let the viewer clock the change.
- **Duration:** ~0.8s
- **Intent:** "Your teammate works somewhere else, in a different tool. Trace doesn't care."

### Frame 10 — Blink + counter tick
- **Screen:** The Trace icon blinks with slightly more urgency. A small badge appears: **"1"** → ticks to **"2"** → **"3"** as more captures land.
- **Motion:** Badge scales in with each increment; subtle haptic-feel bounce.
- **Duration:** ~1.5s
- **Intent:** "Work is arriving. Ambient, not interruptive."

### Frame 11 — Click the icon
- **Screen:** A stylized cursor moves to the Trace icon and clicks.
- **Motion:** Cursor travel ~0.5s, click pulse.
- **Duration:** ~0.7s
- **Intent:** User-initiated reveal. Agency returns to the viewer.

### Frame 12 — Quick-look panel opens
- **Screen:** A panel drops from the menubar. Two sections:
  - **Projects updated:** 2–3 project rows, each with a brief summary ("Onboarding email draft," "Pricing page spec").
  - **Tasks / branches:** Specific items, with source tool badges (Claude, GPT, Cursor).
- **Motion:** Panel slides down with elastic ease. Rows stagger-fade in.
- **Duration:** ~1.2s
- **Intent:** "Here's exactly what's waiting for you. Nothing more."

### Frame 13 — Pull
- **Screen:** The cursor hovers a row; a **Pull** button highlights. Click. The row animates — a small "down" arrow traces into the local workspace, and the row gets a green check.
- **Motion:** Button press, arrow pull, check state.
- **Duration:** ~1.2s
- **Intent:** "One click. It's on your machine. Keep going."

### Frame 14 — Resting state (the actual landing page)
- **Screen:** The desktop fades back, the page simplifies: the Trace wordmark stays top-left, the icon rests top-right (still gently blinking), and a real headline + primary CTA resolve into the center.
- **Motion:** Crossfade + slight settle.
- **Duration:** held
- **Intent:** This is where late arrivals and second-time visitors live. The animation can replay on demand; the page is functional without it.
- **Proposed copy (placeholder, not final):**
  - **Headline:** *Your AI work, wherever you left it.*
  - **Sub:** *Trace captures what you do across Claude, GPT, and Cursor — and brings it to the machine you're working on now.*
  - **Primary CTA:** Download for Mac
  - **Secondary:** View on GitHub

---

## Total runtime

~14 seconds animated, then resting state. Budget: keep under 18s even with breathing room. Anything longer and bounce rate spikes.

---

## Interaction & accessibility rules

- **Skip control:** A subtle "Skip intro" pill, top-right of the canvas, visible from frame 2 onward. One click jumps to Frame 14.
- **Replay:** Once the resting state lands, a small "Replay" button appears near the icon.
- **Reduced motion:** Respect `prefers-reduced-motion`. For those users, skip straight to Frame 14 with a single static composite image that tells the story (two desktops side-by-side, arrow between them).
- **No audio.** The concept is silent. Never auto-play sound.
- **Mobile:** The sequence doesn't translate directly to phone. On narrow viewports, fall back to a 3-panel vertical comic (Capture / Handoff / Pull), each with a looping micro-animation.
- **SEO / crawlability:** All headline, sub, and CTA copy must be present in the DOM from first paint, even if visually hidden behind the animation. Don't let the animation own the indexable content.
- **Performance:** Target Lottie or Rive, not video. LCP should fire on the headline in the resting state, not on animation completion.

---

## Comprehension risks (and fixes)

| Risk | Fix |
|---|---|
| Viewer thinks it's one user switching laptops (not two people). | Second desktop must read as a *person*: different wallpaper, different dock apps, different timezone on the clock. Optionally, show a subtle name/avatar in the menubar on each desktop. |
| "Zoom through the icon" reads as a glitch, not a journey. | Add a 1-frame whoosh line + brief motion blur. The icon should clearly be the portal, not a cut. |
| Viewers miss the "silent background" message. | The icon's blink cadence must be *slow and calm* — not a notification-dot pulse. Closer to a breathing LED than a red badge. |
| People scroll past before the demo finishes. | The resting state (Frame 14) must stand alone. Everything below the fold should be independently comprehensible. |

---

## What this concept commits us to

- A short, **silent**, cinematic hero.
- A design language where the **menubar icon** is the persistent anchor across the whole site (nav, footer, loading states can all reuse it).
- A story that positions Trace as **cross-tool and cross-person**, not a single-user utility. This is a strategic choice — it leans into the team/handoff angle, not just personal capture.

If any of those commitments are wrong for launch positioning, the concept needs rework before build.

---

## Resolved decisions

### 1. Named AI tools, not stand-ins

**Decision:** Use real product names and recognizable chrome for Claude, ChatGPT, Cursor, Perplexity — stylized inside *our* desktop mockup, not pixel-perfect screenshots.

**Why:** Named tools are instantly legible. Viewers don't have to decode "what AI is this" — they just get it. Showing competitor/partner product UIs inside a demo is standard practice (Zapier, Linear, Raycast all do this). No trademark issue as long as we don't imply endorsement.

**How to apply:**
- Stylized, not screenshotted. Each tool gets a simplified window with its signature color and logo mark. Don't copy current UI pixel-for-pixel — it will date fast and look creepy.
- Rotate which tools appear on each desktop so no single vendor dominates.
- Footer disclaimer: "Claude, ChatGPT, Cursor, and Perplexity are trademarks of their respective owners. Trace is not affiliated with or endorsed by any of them."
- If any vendor objects later, swap for stylized stand-ins — but don't preemptively neuter the demo.

### 2. Teammate story (collaboration), not continuity

**Decision:** The second desktop is a **different person**. Trace's landing positions it as a team capture/handoff layer. Solo continuity (same user, different machine) is a real use case but not what the hero sells.

**Why:** Three reasons.
- **Original intent:** Your wording — *"goes to another person's computer"* — was explicitly a different person. Trust the first instinct.
- **The magic is the handoff.** Solo capture is valuable but not viscerally demo-able in 14 seconds. "Work moves between people without friction" is the visually striking story.
- **It matches pricing.** Trace is $12/seat above 5 (from project memory). That pricing only makes sense if the story is team software. A continuity-only pitch undersells the model.

**How to apply:**
- Second desktop must read unambiguously as another person: different wallpaper, different dock, different timezone clock, subtle name/avatar in the menubar.
- Headline (Frame 14): *"Your team's AI work, wherever you pick it up."*
  Sub: *"Trace captures what your team does across Claude, ChatGPT, and Cursor — and lands it on the machine you're working on now."*
- Solo use is not hidden; it's just not the hero. Belongs in a "Also works solo" section below the fold.
- **Watch for regression:** if the broader product positioning shifts toward solo-first, this hero needs to shift with it. Flag to PM/founders before any repositioning.

### 3. Concrete tool reveal on Pull, briefly

**Decision:** Frame 13's Pull animation ends with a **real tool surface** appearing — a VS Code window for a code branch, or a Linear/Notion card for a task. 1.5s max. Stylized, not screenshotted.

**Why:** Concrete beats abstract for a launch landing. Viewers need to close the loop: *"pulled — now what?"* A real tool appearing answers that in one frame. Abstract "green check, done" leaves the value of the pull ambiguous.

**How to apply:**
- Keep it brief — the Pull is the climax, not a new scene.
- Match the tool to the task type shown earlier in the quick-look panel (code task → VS Code; doc task → the doc opens).
- Evergreen-proofing: stylize aggressively. Signature colors and layout, no specific UI details that will date.
- This frame ships with the same "respective owners" disclaimer as decision #1.

### 4. First-visit autoplay, cookied

**Decision:** Full sequence autoplays on **first visit only**. Returning visitors land directly on the resting state (Frame 14) with a visible **Replay** pill near the icon.

**Why:** First-time visitors need the magic. Returning visitors are usually there to convert, find a link, or re-read copy — an animation they've seen becomes friction. A cookie is cheap; returner tolerance is not.

**How to apply:**
- Cookie name: `trace_hero_seen`, 30-day expiry. After 30 days, autoplay again — product story may have evolved, and the memory refresh is worth one replay.
- Replay pill is always visible on the resting state, not just for returners. First-time viewers may want to rewatch.
- **Skip intro** (from the accessibility rules) remains available during first-visit playback — autoplay ≠ forced watch.
- Analytics: track `hero_completed`, `hero_skipped`, `hero_replayed`. If skip rate exceeds ~35% among first-time visitors, the animation is too long — cut frames.

---

## Headline copy — locked (pending creative pass)

**Frame 14 resting state:**

- **Headline:** *Your team's AI work, wherever you pick it up.*
- **Sub:** *Trace captures what your team does across Claude, ChatGPT, and Cursor — and lands it on the machine you're working on now.*
- **Primary CTA:** Download for Mac
- **Secondary CTA:** View on GitHub

Treat these as **placeholders with intent locked, wording open**. A copywriter should punch them up without changing the positioning (team, cross-tool, pick-up-where-you-left-off).

---

## Next steps

- [x] Resolve the four open questions.
- [ ] Creative pass on headline copy (keep positioning, improve punch).
- [ ] Design pass on both desktops (wallpapers, window chrome, icon states, second-person cues).
- [ ] Stylized tool-chrome kit: Claude, ChatGPT, Cursor, Perplexity, VS Code / Linear window frames.
- [ ] Prototype in Rive or Lottie. Measure actual file size + LCP impact before committing.
- [ ] Build reduced-motion and mobile fallbacks in parallel, not after.
- [ ] Wire the cookie + analytics events (`hero_completed`, `hero_skipped`, `hero_replayed`) before launch, not after.
