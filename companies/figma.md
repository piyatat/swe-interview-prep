# Figma engineering track

Sits beside [product-companies.md](product-companies.md) and [../roles/frontend.md](../roles/frontend.md): **multiplayer canvas + graphics + real-time sync**, not a generic SaaS DSA slate. Official [Careers](https://www.figma.com/careers/): “nothing great is made alone”; hiring across hubs and **US/Canada remote**. Recruiter confirms **FigJam vs CoderPad**, **AI policy**, frontend vs backend vs graphics loop, and staff **executive screen**.

Typical timeline **~4 weeks / ~25 days** (guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Collab design: [../answers/system-design-collab-editor.md](../answers/system-design-collab-editor.md). FE systems: [../roles/frontend.md](../roles/frontend.md).

## Official culture (company + engineering)

Do **not** recite both lists. Map **your** stories.

Official [Careers](https://www.figma.com/careers/) company values:

| Official value | What the page scores |
| --- | --- |
| **Build community** | Multiplayer people; lift others; bridges to users |
| **Run with it** | Initiative, not a playbook |
| **Love your craft** | Ask why; simple for builders |
| **Grow as you go** | Direct feedback; everyone is in progress |
| **Play** | Unstructured exploration as learning |

Official [engineering values](https://www.figma.com/blog/figmas-engineering-values/) (rolled into **interview and onboarding**): **Communicate early and often**, **Lift your team**, **Craftsmanship**, **Prioritize impact**. Each names a tradeoff (slow consensus, conflict-avoidance, over-engineering, skipped moonshots).

Official [FigJam interview write-up](https://www.figma.com/blog/inside-figma-how-figma-engineering-uses-figjam-to-scale/): design / architecture is often **on a FigJam board** — diagram, then code in the same file. They score how you **collaborate on a whiteboard**, not a silent CoderPad dump.

“Why Figma?” that only says “I use the tool” fails. Name a real **multiplayer, canvas, or craft** problem you have lived.

## Official + reported process

Official careers do **not** publish a fixed SWE stage list. Guides (2026) + interviewing.io:

| Stage | What they score |
| --- | --- |
| Recruiter (20–30 min) | Fit, why Figma, location |
| Hiring manager (30–60 min) | Projects, depth, how you work |
| Technical screen (45–60 min) | Practical coding; data-structure heavy |
| Onsite coding | Algorithms and/or applied (selection, undo, events) |
| System design | Multiplayer sync, presence, or **canvas / render** |
| Domain / exploration | Graphics, web perf, or collab depth by role |
| Values / behavioral | Company + engineering values |
| Staff+ | Extra **director / exec** behavioral |

Guides: interviewers are often a **pooled** panel except HM / exec. Frontend loops can include **HTML/CSS/JS product-coding**. Backend loops still expect a canvas-aware design, not “design Twitter.”

## How this track differs

| vs FAANG | vs Stripe / collab-editor generic |
| --- | --- |
| Official **FigJam** design hour | Stripe is integration / bug-bash / money |
| Design is **viewport, presence, CRDT/OT**, not a feed | Same bones as [collab-editor](../answers/system-design-collab-editor.md) — Figma-shaped constraints |
| Craft + **communicate early** are scored | Recite React trivia and fail the canvas hour |

## Coding and design flavor

Live problems look like **graphs, trees, intervals, or a small editor** (undo stack, hit-test, event dispatch). Design: multiplayer document (ops, presence, 40 cursors), **viewport-culled scene graph**, or undo that survives remote edits. Related: [../answers/coding-lru-cache.md](../answers/coding-lru-cache.md) (cache a tile / mesh), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why a multiplayer design tool — not a generic SaaS loop.”
2. Implement undo / selection / interval merge; then “two clients edit.”
3. Design presence: cursors, selection, disconnect, scale.
4. Canvas: what you **do not** paint this frame (cull, layers, HiDPI).
5. Values: a time you **shared a WIP early** or chose impact over polish.

## Prep checklist

- [ ] Read [Careers](https://www.figma.com/careers/) + [engineering values](https://www.figma.com/blog/figmas-engineering-values/)
- [ ] Recruiter: FigJam vs CoderPad, AI, FE vs BE vs graphics, staff extra round
- [ ] Practice a **whiteboard** design in a FigJam-like tool
- [ ] One applied coding mock (undo / hit-test / events)
- [ ] One multiplayer or canvas design mock
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers at Figma](https://www.figma.com/careers/) — accessed 2026-09-06
- [Figma's engineering values — Figma Blog](https://www.figma.com/blog/figmas-engineering-values/) — accessed 2026-09-06
- [How Figma engineering uses FigJam — Figma Blog](https://www.figma.com/blog/inside-figma-how-figma-engineering-uses-figjam-to-scale/) — accessed 2026-09-06
- [The Figma Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/figma-technical-interview-process-2026) — accessed 2026-09-06
- [Figma’s Interview Process & Questions — interviewing.io](https://interviewing.io/figma-interview-questions) — accessed 2026-09-06
