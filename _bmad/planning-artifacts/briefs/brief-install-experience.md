# Brief — Install Experience ("the Jobs install")

**Date:** 2026-04-22
**Owner:** Tal
**Status:** Draft v1
**Supersedes:** Per-tool install plumbing originally scoped in FISH-003.

> **Rule of the brief:** Any detail below that adds a choice, a step, or a screen the user must read is wrong and should be deleted.

---

## Problem

The methodology and the agents are only valuable if the user can *start using them* without thinking. Today's plan says "paste this into `CLAUDE.md`, paste this other thing into `.cursorrules`, paste this third thing into ChatGPT Custom Instructions." That is three steps, three places, three chances to quit. Every additional step is a cliff a percentage of users fall off.

The emerging 2026 standard — `AGENTS.md` and `CLAUDE.md` auto-loading across Copilot, Cursor, and Claude Code — is the right substrate, but pasting into it is not the install. The install has to be **one command that leaves the user looking at a live Duble Slash icon in their menu bar.**

## The north star

A user who has never heard of Duble Slash runs one command. Within 20 seconds, the `//` icon appears in the top-right of their macOS menu bar, pulses once, turns steady green. They click it. They see: *"Live across 5 tools."* They open Claude Desktop, type `//explore`, and it works. They did not configure anything. They did not read anything. They did not make a choice.

If that single sequence is not true, the install is broken.

## The one command

```
npx @dubleslash/install
```

That's the install. No flags. No prompts. No config file.

Alternate surfaces (same command, different form factor):

- **Homebrew:** `brew install dubleslash` — same effect.
- **Claude skills marketplace:** one-click inside Claude Desktop (our #1 distribution channel — has to be zero-terminal for non-technical designers).
- **Website hero CTA:** a single copy button containing the `npx` line. One click to copy. Paste. Enter. Done.

## What the command does, in order

1. **Detect installed AI tools** on the user's machine by scanning known config paths:
   - Claude Desktop — `~/Library/Application Support/Claude/`
   - Claude Code — `~/.claude/`
   - Cursor — `~/Library/Application Support/Cursor/`
   - ChatGPT Desktop — app presence + token-assisted Custom Instructions push
   - VS Code + Copilot — `~/Library/Application Support/Code/User/`
   - JetBrains IDEs — per-IDE config dirs
   - Windsurf, Zed, Warp — similar detection
2. **Write/merge the right instruction file for each** in parallel:
   - `~/.claude/CLAUDE.md` for Claude Code / Claude Desktop
   - `.cursor/rules/fish.mdc` for Cursor
   - Repo-level `AGENTS.md` for Copilot / Zed / Cursor (shared 2026 standard)
   - ChatGPT Desktop Custom Instructions via API
3. **Install the Duble Slash desktop client** (the macOS app that provides the menu-bar icon + the local agents Tally, Cipher, and later Relay/Beacon/Pack).
4. **Start the menu-bar icon.** This is the moment the user has been waiting for without knowing it.
5. **Print a one-screen receipt** in the terminal — see §"Terminal output" below.

Entire flow: **≤ 20 seconds** on a warm machine.

## The menu-bar icon — the "it's alive" moment

Top-right of the macOS menu bar. Small `//` mark. Three visual states only:

| State | Look | Meaning |
|---|---|---|
| **Live** | Solid, subtle green pulse every 8s | Duble Slash is running; at least one tool connected; no work in flight |
| **Working** | Faster pulse, brief color shift | An agent is actively doing something (capture, redaction, handoff) |
| **Attention** | Amber dot overlay | User input required (usually a Cipher redaction diff awaiting approval) |

**Click behaviour — single screen, no nesting:**

```
┌─ Duble Slash ─────────────────────────────┐
│  🟢  Live · 5 tools connected             │
│                                           │
│     Claude Desktop · Cursor · Claude Code │
│     ChatGPT Desktop · VS Code + Copilot   │
│                                           │
│  Today                                    │
│     0 sessions captured                   │
│     0 pending redactions                  │
│     0 handoffs                            │
│                                           │
│  Type //  in any connected tool to begin. │
│                                           │
│  [ Dashboard ]   [ Pause ]   [ Quit ]     │
└───────────────────────────────────────────┘
```

The dropdown has **no tabs, no settings, no preferences link**. Preferences live behind "Dashboard" (a window), so the dropdown stays a glance, not a menu.

## Terminal output

Exact copy, 9 lines maximum:

```
Installing Duble Slash…

 ✓  Claude Desktop          
 ✓  Cursor                  
 ✓  Claude Code             
 ✓  ChatGPT Desktop         
 ✓  VS Code + Copilot       

Duble Slash is live. Look at your menu bar —
  the //  icon is in the top-right of your screen.
```

No "you can now…" copy. No next steps. The menu-bar icon IS the next step, and the user is already looking at it.

## Uninstall

Equally one command:

```
npx @dubleslash/install --remove
```

Rips out every file, quits the desktop client, removes the menu-bar icon. Prints *"Duble Slash removed."* Nothing else. **Reversibility is part of the install contract** — we will never be the tool you can't get rid of cleanly.

## What is deliberately NOT in the install

Every item below was considered and rejected.

- **No onboarding tour.** The menu-bar icon + `//` in any tool is the tour.
- **No settings panel at install.** Sensible defaults only. Settings ship in the Dashboard window, not in the install flow.
- **No account creation.** OSS install is entirely local. Account only appears later, when the user opts into multiplayer (V1).
- **No tool picker.** We install in every tool we detect. If the user wants fewer, they disable from the Dashboard after.
- **No "which agents to enable" screen.** Tally, Cipher, and the local agents all install together as one bundle.
- **No version selector, no channel (stable/beta).** One install, one experience.
- **No telemetry opt-in prompt at install.** Zero telemetry by default. If we ever add opt-in, it lives in Dashboard — never at install.

## Capture rides the install (no second step)

Tally (the capture agent) installs and runs as part of the same command. The first `//explore` the user types in any tool is captured from that moment onwards. **Capture is not a feature the user "turns on later."** It is on from second one, with Cipher gating every outbound push by default.

This removes the single largest friction point from the prior install plan, where capture was a separate onboarding after the methodology bundle.

## Cross-platform

**macOS first** (Tal + Shenhav's OS, target user overlap). Menu-bar icon is macOS-specific.
**Windows** — system tray icon, feature-equivalent. v1 milestone.
**Linux** — terminal status + optional tray. v1.5 milestone.

One command, same URL, different packaged binary per OS.

## Success criteria

- Install completes in **≤ 20 seconds** on a machine with all target tools present.
- **0 prompts** during install under default conditions (permission prompts are OS-level, count as 1 if macOS asks for Accessibility).
- The menu-bar `//` icon is visible within **3 seconds** of the install script finishing.
- First `//explore` in any connected tool works **on the first try**, without the user having opened any settings.
- Uninstall restores the machine to its pre-install state, confirmed by a clean test harness.

## Open questions

1. **Code signing + notarization.** macOS will Gatekeeper-block an unsigned app. Apple Developer certs + notarization pipeline are non-trivial — needs to be the first engineering task, not an afterthought. [Action: Tal to initiate Apple Developer account.]
2. **`AGENTS.md` merge strategy** when the user's repo already has one — append? Section-stamp? Refuse? Current direction: append under a `## FISH` heading with an idempotent marker so re-installs are no-ops.
3. **ChatGPT Desktop instructions surface.** OpenAI doesn't officially expose a Custom Instructions install API. Either: use the unofficial surface, or ship a one-line copy/paste fallback just for that tool. Investigate before committing.
4. **Does the install need to be signed on Windows too** to avoid SmartScreen warnings? Microsoft code-signing process + cert cost.

## What this rewrites

- **[FISH-003](../task-board.md#L104)** scope changes from "spec per-tool install plumbing" to "build the universal `npx` installer + the macOS desktop client + the menu-bar icon." Dependencies expand: Apple Developer account, macOS app scaffolding, `AGENTS.md` merge logic.
- **Website hero CTA** should become the copy-paste of the install command itself. The demo *is* the install.
- **OSS launch checklist** gains: code signing, notarization, the desktop client binary, the uninstaller.

## First build slice (minimum shippable install)

1. `npx @dubleslash/install` script — detects tools, writes instruction files, launches desktop client.
2. Minimal macOS desktop client — menu-bar icon with the three states + dropdown. Tally running inside.
3. `AGENTS.md` + `CLAUDE.md` + `.cursor/rules/fish.mdc` content for the four local agents.
4. Uninstall command.
5. Website hero updated to the single copy button.

Everything else (Dashboard window, Cipher diff UI, Beacon routing, Relay multiplayer) ships *after* this slice proves the install moment works. Without the install moment, the rest has nothing to land on.
