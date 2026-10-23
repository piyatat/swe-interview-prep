# DoorDash engineering track

Sits beside [product-companies.md](product-companies.md): **three-sided marketplace** (consumer, merchant, Dasher), not a generic FAANG slate. Official [Mission & Values](https://careersatdoordash.com/mission-and-values/): grow and empower **local economies**; four values — **leaders, doers, learners, one team**. Official [Engineering](https://careersatdoordash.com/career-areas/engineering/) careers page: virtual process starts with a **30-minute recruiter phone screen**. Recruiter is the source of truth for **CodeCraft vs classic DSA**, **AI working session**, and team.

Typical timeline **3–6 weeks** (guides). Confirm **level** (E3–E7 in public writeups), whether new-grad **HackerRank OA** applies, and whether **your** loop is the official **AI working session** (Mar 2026) or a leftover CodeCraft / DSA hour. Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Debug: [../general/debugging-rounds.md](../general/debugging-rounds.md). AI-allowed hour: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Geo design: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md).

## Official culture (Mission & Values)

Do **not** recite the table. Map **your** stories to the behaviors.

| Official value | Careers one-liner + sub-behaviors |
| --- | --- |
| **We are leaders** | Leadership at every level — owner; dream big / start small; optimism + a plan |
| **We are doers** | Urgency — bias for action; lowest level of detail; “and” not either/or |
| **We are learners** | Rethink assumptions — truth seek; 1% better; customer-obsessed (not competitor) |
| **We are one team** | Every voice — make room at the table; think outside the room; shared success / no-blame |

Mission language: **empowering local economies** and equal access to opportunity. Guides (Exponent) say interviewers also look for genuine product interest (including corporate Dasher shifts). Treat that as **reported**.

## Official + reported process

Official [Mar 2026 engineering blog](https://careersatdoordash.com/blog/doordash-is-rebuilding-its-engineering-interviews-around-ai/): they are **replacing traditional coding rounds** with a **60-minute AI-assisted working session** on a realistic DoorDash-shaped project. Recruiter still wins if your invite names CodeCraft / DSA / OA — treat those as **not yet rolled off**.

| Stage | What they score |
| --- | --- |
| **Recruiter screen (official, ~30 min)** | Work history, level, process preview — [Engineering careers](https://careersatdoordash.com/career-areas/engineering/) |
| **AI working session (official blog, ~60 min)** | Own machine + IDE; **use** an editor-integrated agent (Cursor / Claude Code / Codex free tier is enough). Starter repo in your language. Screen-share and **narrate**. Signals: orient, use+verify AI, debug, manage scope, communicate tradeoffs. Finishing every task matters less than a tight loop |
| Technical screen (guides; may be gone on your loop) | Practical coding or debug; some teams still ask a medium |
| Virtual onsite (guides: 3–4 × 60–75) | Official AI hour and/or leftover CodeCraft / DSA, logistics design, values / manager |
| New-grad opening (guides) | HackerRank OA (two mediums/hards) before live hours |

Official blog: they **want** full agent features (chat, inline, plan, autopilot). Arriving without a working setup, or treating AI as cheating, is a self-own — they send a candidate guide. Early pilot used a three-service Order Management System; they shrank it because people spent 15–20 min just mapping the repo. Example shapes they name: order **dispatch**, smart **menu**, support-request **automation**.

## How this track differs

| vs FAANG | vs Stripe / Uber / Sierra |
| --- | --- |
| Official **60-min AI session on your laptop** (provided starter), not a Gemini-in-pad hour | Sierra’s official build is **2 hours on a product you invent**; DoorDash gives the project |
| Design is **dispatch, ETA, payouts, live tracking** | Three-sided constraints (consumer / merchant / Dasher) in every tradeoff |
| Values hour is **scored** — “lowest level of detail” stories | Ask: leftover CodeCraft vs the official AI hour — do not assume one slate |

## Coding and design flavor

Official AI hour: ramp an unfamiliar starter, use the agent, **verify** (repro, logs, targeted tests — do not trust the model). Algorithm / CodeCraft hours (when you still get them) wear **delivery costume**: grids, intervals, job scheduling; CodeCraft rewards **separating rules from I/O** and bending when a rule changes.

Design: assignment in seconds, reassign on decline, location pings, order state machine, **idempotent payouts**. Pick two deep-ends. Related: [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md), [../answers/system-design-payment.md](../answers/system-design-payment.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why DoorDash / this side of the marketplace?” — a logistics opinion, not “I like the app.”
2. Official AI session: extend dispatch / menu / support starter; narrate plan → agent → check.
3. Leftover CodeCraft (if invited): Dasher pay rules with a change at minute 40.
4. Design Dasher assignment + live tracking for a Super Bowl spike.
5. Values: caught a detail others missed; moved fast and broke something; disagreed with a teammate.

## Prep checklist

- [ ] Read [Mission & Values](https://careersatdoordash.com/mission-and-values/) + [Engineering](https://careersatdoordash.com/career-areas/engineering/) + [AI interview blog](https://careersatdoordash.com/blog/doordash-is-rebuilding-its-engineering-interviews-around-ai/)
- [ ] Recruiter: official AI session vs leftover CodeCraft / DSA, debug hour, OA (new-grad)
- [ ] One **60-min** laptop session: unfamiliar repo + agent + narration; IDE working **before** the slot
- [ ] One **45-min** messy-rules build + tests if they still name CodeCraft
- [ ] One dispatch / ETA design mock ([../general/system-design.md](../general/system-design.md))
- [ ] STAR bank mapped to the four values — metrics, not slogans
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Why DoorDash is rebuilding its engineering interviews around AI](https://careersatdoordash.com/blog/doordash-is-rebuilding-its-engineering-interviews-around-ai/) — accessed 2026-10-23
- [Mission & Values — DoorDash Careers](https://careersatdoordash.com/mission-and-values/) — accessed 2026-09-02
- [Engineering — DoorDash Careers](https://careersatdoordash.com/career-areas/engineering/) — accessed 2026-09-02
- [DoorDash Software Engineer Interview Guide — Exponent](https://www.tryexponent.com/guides/doordash-software-engineer-interview) — accessed 2026-09-02
- [How the DoorDash Engineering Interview Actually Works — techinterview.org](https://www.techinterview.org/post/3233476844/doordash-software-engineer-interview/) — accessed 2026-09-02
- [DoorDash Software Engineer Interview: 2026 Prep Guide — Interview Coder](https://www.interviewcoder.co/blog/doordash-software-engineer-interview) — accessed 2026-09-02
- [DoorDash System Design Interview (2026) — Exponent](https://www.tryexponent.com/blog/doordash-system-design-interview) — accessed 2026-09-02
