# Asana engineering track

Sits beside [atlassian.md](atlassian.md) and [product-companies.md](product-companies.md): **Work Graph + collaborative tasks**, not a generic FAANG slate. Official [Engineering Interview Guide](https://asana.com/eng/interview-guide): they want to know **what it is like to work with you day to day** — IDEs not whiteboards, **how** you solve, **collaborate**. Recruiter confirms **product vs infra vs AI Studio**, laptop vs provided, CodeSignal vs skip, and whether you get a **Mindful / values** hour.

Typical timeline **varies** (guides often **5–8 weeks** new-grad; mid-level shorter). LLD: [../general/low-level-design.md](../general/low-level-design.md). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official engineering values (candidate eval)

Official [engineering values](https://asana.com/inside-asana/asana-engineering-values) — written to answer “what are we looking for when we evaluate engineering candidates?” Use **these** names, not a made-up Asana LP list.

| Official value | What they score |
| --- | --- |
| **Learn with curiosity** | Unblock yourself; Five Whys without blame |
| **Strive for simplicity** | Could this be simpler? Readability over clever |
| **Articulate your mental model** | Design-doc clarity before a pile of code |
| **Teach with compassion** | Mentorship; no inferiority theater |
| **Ship fast, sustainably** | Flow + tooling; not burnout-as-virtue |
| **Fix problems, even when they’re not yours** | 100% responsibility; thank-you culture |

Company mission (official [company](https://asana.com/company) / 10-K): **help humanity thrive by enabling the world's teams to work together effortlessly**. 10-K culture names include **Co-Creation**, **Mindfulness**, **Give and Take Responsibility**, **Be Real**, **Do Great Things, Fast**, **Reject False Tradeoffs**. Do not recite both lists — map **your** stories.

“Why Asana?” that only says “I use the app” fails. Name a **work-graph, reactive, or clarity** problem you have lived.

## Official interview philosophy

From the Engineering Interview Guide:

| Official stance | What to do |
| --- | --- |
| **IDEs, not whiteboards** | Code in an editor; whiteboard is for **logic / collaboration** |
| **How, not only the answer** | Tradeoffs; MVP then evolve; name criteria first on design |
| **Collaborate** | Ask; iterate with the interviewer; take feedback and run |
| Four question types | **Coding**, **Algorithms**, **Design**; **behavioral** more on senior loops |

Official coding: language + editor of **your** choice (bring a laptop or they provide). Some coding hours: they leave you to work, then **review** what you wrote **and** what you did not finish. Algorithms: **data structures** with a helpful partner — they do not require every structure from memory. Design: **clarity with a bias toward simplicity**; say the tradeoff out loud. Behavioral: **STAR**.

## Official + reported process

Official guide describes **question types**, not a universal stage list. University events mention **CodeSignal GCA** as a first step for some early-career paths. 2026 guides (techinterview.org, PracHub) — treat counts as **reported**.

| Stage | What they score |
| --- | --- |
| Apply / recruiter | [asana.com/jobs](https://asana.com/jobs); why Asana; track (product / infra / AI) |
| OA (guides + some intern/new-grad) | CodeSignal GCA or similar — confirm |
| Tech screen (guides: ~60 min) | Collaborative coding / algorithms |
| Onsite / virtual (guides: 4–5) | Coding + algorithms + **data modeling / LLD** + design + values |
| Senior | Official: extra behavioral depth |

Guides: a distinctive **model the Work Graph** hour (tasks, deps, custom fields, rules). Confirm AI policy — official guide does **not** publish a live-copilot rule.

## How this track differs

| vs Atlassian / Workday | vs FAANG |
| --- | --- |
| Official **published** eng interview philosophy + six eng values | Collaborative **editor** coding, not silent whiteboard syntax |
| Design is **tasks / reactive / Work Graph**, not “design Twitter” | Simplicity and mental-model talk are scored like code |
| “Ship fast, **sustainably**” — crunch stories can hurt | Recite Luna internals you never used and fail authenticity |

## Coding and design flavor

Live problems look like **graphs, trees, incremental state, or a small model** (undo, derived fields). Design / LLD: task graph, permissions, notifications when a field changes, fan-out without a thundering herd. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../answers/coding-course-schedule.md](../answers/coding-course-schedule.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Asana team — portable “I like productivity software” is weak.
2. Live: model dependencies or incrementally recompute a field; narrate options.
3. Design: “complete parent when all children done” — data model + invalidation.
4. Values: you taught with patience, or fixed a problem that was not yours.
5. Questions for them: No Meeting Wednesday, mentorship, how simplicity is reviewed.

## Prep checklist

- [ ] Read [Engineering Interview Guide](https://asana.com/eng/interview-guide) + [engineering values](https://asana.com/inside-asana/asana-engineering-values)
- [ ] Recruiter: CodeSignal vs skip, laptop, AI, values hour, level
- [ ] One **collaborative** coding mock (talk options; take a hint)
- [ ] One Work Graph / reactive design or LLD mock
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Engineering Interview Guide — Asana](https://asana.com/eng/interview-guide) — accessed 2026-09-21
- [6 Engineering Values — Asana](https://asana.com/inside-asana/asana-engineering-values) — accessed 2026-09-21
- [The Asana Engineering Interview Guide — Inside Asana](https://asana.com/inside-asana/asana-engineering-interview-guide) — accessed 2026-09-21
- [Asana company](https://asana.com/company) — accessed 2026-09-21
- [Asana Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/asana/) — accessed 2026-09-21
- [Asana SWE Interview Guide 2026 — PracHub](https://prachub.com/resources/asana-software-engineer-interview-guide-2026-coding-ood-system-design-and-collaboration) — accessed 2026-09-21
