# Notion engineering track

Sits beside [figma.md](figma.md) and [asana.md](asana.md): **block workspace + craft / values**, not a generic FAANG slate. Official [How Notion hires](https://www.notion.com/blog/how-notion-hires): they pass if you miss the **craft + values** bar; recruiting is “not a sport”; **references** are a real predictor, not a checkbox; interviews should stay **conversational**. Official [Careers](https://www.notion.com/careers): tool company that exists so customers can do their life’s work; **in-person Mon / Tue / Thu**. Recruiter confirms **product vs infra vs AI**, **AI-in-pad policy**, and whether a **founder / leadership** close sits after the panel.

Typical timeline **2–6 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Collab design: [../answers/system-design-collab-editor.md](../answers/system-design-collab-editor.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official values (do not invent extra pillars)

[How Notion hires](https://www.notion.com/blog/how-notion-hires) names four. [Careers](https://www.notion.com/careers) publishes the current wall wording — same contract, newer labels. Map **your** stories; do not recite both lists as if they were eight LPs.

| How Notion hires | Careers label | What they score |
| --- | --- | --- |
| **Drivers of our mission** | **Customer in every room** | Toolmakers; serving customers is the only quest |
| **Pace setters** | **Why not today** | Urgency; “why not today?” not “next week” |
| **Truth seekers** | **Own the outcome** | Root cause + **agency** — spot it, own the result |
| **Kind and direct** | **Direct and kind** | Candid feedback with care; warmth + speed |

Official craft bar for engineers: proactive input on **technical, product, or business** decisions; domain excellence; improve process so **others** work better. “Why Notion?” that only says “I use the app” fails. Name a **block tree, permission, sync, or workspace-search** problem you have lived.

## Official hiring tenets

From How Notion hires:

| Official tenet | What to do |
| --- | --- |
| **Look for excellence** | One hire compounds; they will pass rather than lower craft + values |
| **Rigorous process** | Open questions get resolved **before** offer; expect **references** |
| **Keep it conversational** | Two-way; they publish role guides so there are “no surprises” |
| **Founder bar (Ivan Zhao)** | Official: involved on **almost every role** — craft, values, was the process fair? |

## Official + reported process

Official post describes **philosophy**, not a universal stage list. 2026 guides (PracHub citing a candidate guide; TechScreen; TechPrep) — treat counts as **reported**.

| Stage | Official / reported |
| --- | --- |
| Talent / recruiter | Motivation, product use, role fit; they do screen for **real Notion use** |
| Live technical assessment | Real-world problem **with** an engineer (not a silent OA-only gate on every track) |
| Panel coding (guides: 2×60) | Readable implementation; iteration; communication |
| Panel design (guides: 60) | Software or system design — blocks, permissions, sync, search |
| Career history (guides: 60) | Scope, decisions, teamwork — not a generic STAR dump |
| Final / leadership | Official: founder-shaped close is common; confirm |
| References | Official: **not** optional theater |

Guides: some new-grad paths still see a short OA; staff may swap a coding hour for a project deep-dive. Confirm AI policy the week you interview.

## How this track differs

| vs Figma / Asana | vs FAANG |
| --- | --- |
| Official **craft + values + references**; Figma is FigJam / canvas | Practical **product-shaped** coding, not only named LC |
| Design is **blocks / CRDT-ish sync / ACL**, not a generic feed | Conversational panel; founder close is a real possibility |
| In-person **3 days** is official culture, not a footnote | “I only grind LeetCode” misses career-history + product judgment |

## Coding and design flavor

Live work looks like a **block tree** (insert / move), a nested **permission resolver**, a tiny query over a workspace, or a search index over blocks. Design: collaborative document sync, offline-first, relations / user-database storage, or full-text at workspace scale. Related: [../answers/system-design-collab-editor.md](../answers/system-design-collab-editor.md), [../answers/system-design-search.md](../answers/system-design-search.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Notion surface (editor, sync, search, AI, mobile) — portable “I like productivity” is weak.
2. Live: model a block tree with move; say what stays consistent if two clients edit.
3. Design: permissions on nested pages — inherit, override, share-to-web.
4. Values: kind **and** direct — the feedback you gave, and what changed.
5. Questions for them: Mon/Tue/Thu in-office, how craft is reviewed, AI coding policy.

## Prep checklist

- [ ] Read [How Notion hires](https://www.notion.com/blog/how-notion-hires) + [Careers](https://www.notion.com/careers) values
- [ ] Recruiter: track, AI policy, founder/final, references timing, office days
- [ ] Use the product as a **power user**; one opinion you would ship
- [ ] One practical coding mock + one collab-sync or ACL design
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How Notion hires](https://www.notion.com/blog/how-notion-hires) — accessed 2026-09-23
- [Careers at Notion](https://www.notion.com/careers) — accessed 2026-09-23
- [Notion SWE Interview Guide 2026 — PracHub](https://prachub.com/resources/notion-software-engineer-interview-guide-2026-process-questions-and-preparation) — accessed 2026-09-23
- [The Notion Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/notion-technical-interview-process-2026) — accessed 2026-09-23
- [Notion's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/notion-interview-process) — accessed 2026-09-23
