---
name: ds-wf-wireframe-spec
description: Sol writes a wireframe spec — low/mid-fidelity wireframe(s) plus microinteraction annotations (Triggers / Rules / Feedback / Loops / Modes per Saffer). Tuna standard. Not pixel-final — that's Bran's turf. Anchored to AC; any interaction not in AC must be annotated here.
---

# Wireframe Spec — Sol runs this

**Who's at the wheel.** Sol. Spec-writer mode — the wireframe spec tells Bran what to build, at the structure level, with the microinteractions called out. Not pixel perfection; the design system handles pixels.

## What you get

At the end of WF you're holding:

- **A wireframe spec** at `planning/wireframes/wf-<card-id>-<date>.md` — one or more low/mid-fidelity wireframe descriptions (or linked Figma frames), plus microinteraction annotations per Saffer's 5-part framework.
- **Trigger / Rule / Feedback / Loop / Mode** for every novel microinteraction — if the interaction isn't covered by an existing design-system pattern, it gets spelled out.
- **Design-system primitive list** — what this wireframe reuses, what (if anything) it extends, what is genuinely new.
- **AC cross-reference** — each AC bullet has a pointer to the wireframe region that satisfies it (and vice-versa, any wireframe region has the AC it implements).
- **Next-method call** — typically HO to Bran, after AC is also locked.

## How Sol and you split the work

| Sol (AI) does | You do | We iterate together |
|---|---|---|
| Describe wireframe(s) in text form (or read Figma MCP if frames already exist) | Confirm described wireframes match your intent; upload / link the actual frames | If frames don't exist yet, Sol describes in text and flags Figma generation as a follow-up |
| Annotate each novel microinteraction with T/R/F/L/M | Add interactions Sol couldn't see (industry-specific patterns, compliance flows) | Sol reframes in Saffer's grammar |
| Name design-system primitives used | Correct against your live design system (Sol doesn't know which primitives are current) | — |
| Cross-reference wireframe regions with AC | Confirm coverage — each AC must map somewhere in the wireframe | Sol flags any AC not covered by wireframe as a gap |

**The split rule here.** Sol is fast at structural wireframe description and microinteraction annotation in the Saffer grammar; you know your current design system, your active components, and what the team's shipping conventions are. WF is as good as the design-system fidelity — don't let Sol invent components that don't exist.

## Where this fits in the Solidify stream

WF is the **Tuna standard** — per [methodology/flow.md §7.2 Tuna Solidify](../../../../../methodology/flow.md#72-solidify-streams) steps 3–5 and [solidifier.md §5](../../../../../methodology/local-agents/solidifier.md#5-capabilities-codes-the-user-can-request-directly), Tuna needs microspec-level wireframes. WF runs after SB and BR — the storyboard sets the flow, the brief sets the shape, WF sets the per-screen structure and microinteractions. WF does not run on Nemo (sketch is enough), Salmon (CT fixture is the prototype), or Willy (pitch carries structure at higher level, wireframes happen in Build).

## When WF refuses to emit

- **Sigil is not Tuna** — redirect.
- **No BR first** — wireframes without a brief are design exercises. Sol asks for BR or at minimum a locked shape.
- **Would require net-new design-system components without flag** — Sol flags and asks you to decide: extend the design system (separate decision) or rework the wireframe to fit existing primitives.
- **AC not yet written** — Sol can write the wireframe but flags that AC must follow before HO, and will not HO without it.

## Model

Microinteraction annotation in Saffer's 5-part grammar is structured + interpretive — "what's the feedback mechanism when the network fails mid-upload?" requires judgment. **Sonnet** default. Drop to Haiku for the structural wireframe description on simple screens; return to Sonnet for the microinteraction annotations. Set in [`agents/config.yaml → model_policy.hints.wf`](../../../../config.yaml).

---

The wireframe description scaffold, Saffer annotation sweep, design-system anchoring, and AC cross-reference live in [./workflow.md](./workflow.md).
