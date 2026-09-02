# DoorDash engineering track

Sits beside [product-companies.md](product-companies.md): **three-sided marketplace** (consumer, merchant, Dasher), not a generic FAANG slate. Official [Mission & Values](https://careersatdoordash.com/mission-and-values/): grow and empower **local economies**; four values — **leaders, doers, learners, one team**. Official [Engineering](https://careersatdoordash.com/career-areas/engineering/) careers page: virtual process starts with a **30-minute recruiter phone screen**. Recruiter is the source of truth for **CodeCraft vs classic DSA**, **AI working session**, and team.

Typical timeline **3–6 weeks** (guides). Confirm **level** (E3–E7 in public writeups) and whether new-grad **HackerRank OA** applies. Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Debug: [../general/debugging-rounds.md](../general/debugging-rounds.md). AI-allowed hour: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Geo design: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md).

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

| Stage | What they score |
| --- | --- |
| **Recruiter screen (official, ~30 min)** | Work history, level, process preview — [Engineering careers](https://careersatdoordash.com/career-areas/engineering/) |
| Technical screen (~60 min, guides) | Practical coding or debug on HackerRank / CoderPad; some teams still ask a medium |
| Virtual onsite (3–4 × 60–75 min, guides) | CodeCraft and/or DSA, optional debug, logistics design, values / manager |
| New-grad opening (guides) | HackerRank OA (two mediums/hards) before live hours |

Exponent (2026): some loops add an **AI-assisted working session** (use tools, verify output) and keep AI **off** elsewhere unless invited. Ask.

## How this track differs

| vs FAANG | vs Stripe / Uber (same product-company bucket) |
| --- | --- |
| **CodeCraft** — messy pay / menu / assigner rules, then a late requirement change | More **debug + ship** than Stripe’s integration/bug-bash or Uber’s graph OA |
| Design is **dispatch, ETA, payouts, live tracking** | Three-sided constraints (consumer / merchant / Dasher) in every tradeoff |
| Values hour is **scored** — “lowest level of detail” stories | Decentralized: team picks CodeCraft vs LeetCode — do not assume one slate |

## Coding and design flavor

Algorithm hours (when you get them) wear **delivery costume**: grids, intervals, job scheduling. CodeCraft rewards **separating rules from I/O**, tests you write without being asked, and bending when a rule changes.

Design: assignment in seconds, reassign on decline, location pings, order state machine, **idempotent payouts**. Pick two deep-ends. Related: [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md), [../answers/system-design-payment.md](../answers/system-design-payment.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why DoorDash / this side of the marketplace?” — a logistics opinion, not “I like the app.”
2. CodeCraft: Dasher pay (base + tips + peak + guarantee) with a rule change at minute 40.
3. Debug a small order service; run tests before editing.
4. Design Dasher assignment + live tracking for a Super Bowl spike.
5. Values: caught a detail others missed; moved fast and broke something; disagreed with a teammate.

## Prep checklist

- [ ] Read [Mission & Values](https://careersatdoordash.com/mission-and-values/) + [Engineering](https://careersatdoordash.com/career-areas/engineering/)
- [ ] Recruiter: CodeCraft vs DSA, debug hour, AI session, OA (new-grad)
- [ ] One **45-min build** of messy business rules + tests; one **debug-in-repo** mock
- [ ] One dispatch / ETA design mock ([../general/system-design.md](../general/system-design.md))
- [ ] STAR bank mapped to the four values — metrics, not slogans
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Mission & Values — DoorDash Careers](https://careersatdoordash.com/mission-and-values/) — accessed 2026-09-02
- [Engineering — DoorDash Careers](https://careersatdoordash.com/career-areas/engineering/) — accessed 2026-09-02
- [DoorDash Software Engineer Interview Guide — Exponent](https://www.tryexponent.com/guides/doordash-software-engineer-interview) — accessed 2026-09-02
- [How the DoorDash Engineering Interview Actually Works — techinterview.org](https://www.techinterview.org/post/3233476844/doordash-software-engineer-interview/) — accessed 2026-09-02
- [DoorDash Software Engineer Interview: 2026 Prep Guide — Interview Coder](https://www.interviewcoder.co/blog/doordash-software-engineer-interview) — accessed 2026-09-02
- [DoorDash System Design Interview (2026) — Exponent](https://www.tryexponent.com/blog/doordash-system-design-interview) — accessed 2026-09-02
