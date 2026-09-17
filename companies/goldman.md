# Goldman Sachs engineering track

Sits beside [jpmorgan.md](jpmorgan.md) and [bloomberg.md](bloomberg.md): **bank technology that runs the firm** (trading, risk, platforms), not a generic FAANG slate. Official [Careers](https://www.goldmansachs.com/careers): Engineering **envisions, builds, and deploys** systems that drive the business. Official interview prep: CoderPad / HackerRank live coding; at least one language in depth (C/C++, Java, Python, or JavaScript); APIs, OOP, multithreading, tests, edges. Recruiter confirms **campus vs experienced**, **HireVue vs HackerRank first**, **virtual vs in-person Superday**, and team (AWM / markets / platform).

Typical timeline **6–10 weeks** (2026 guides; campus can compress). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). LLD: [../general/low-level-design.md](../general/low-level-design.md). Payments / ledger: [../answers/system-design-payment.md](../answers/system-design-payment.md). SQL: [../general/sql-interviews.md](../general/sql-interviews.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (four values + engineering tenets)

Do **not** recite 14 principles. Map **your** stories. Official [Purpose and Values](https://www.goldmansachs.com/our-firm/purpose-and-values) distill the 1979 Business Principles into four:

| Official value | What they score |
| --- | --- |
| **Partnership** | Collective over personal credit; no room for “I shipped, they failed” |
| **Client service** | Trust; over-deliver on a named client / internal-user outcome |
| **Integrity** | Transparency, vigilance, pride in the decision — not slogans |
| **Excellence** | Best over biggest; professional quality under volume |

Official [Engineering Tenets](https://www.goldmansachs.com/careers/blog/engineering-tenets) are complementary: **build with purpose**, **obsess over the experience**, **look around corners**, **innovate incrementally**, **inspire trust**, **lead with data**, **keep learning**, **express humanity**, **promote inclusivity**. “Why Goldman?” that only says “finance pays / prestige” fails. Name a **correctness, latency, or client-trust** problem you have lived.

## Official + reported process

Official careers + interview-prep PDF are the skeleton (CoderPad, language depth, Business Principles). 2026 guides (TechPrep, LastRoundAI, candidate threads) stretch Superday mix — treat round counts as **reported**.

| Stage | What they score |
| --- | --- |
| HackerRank OA **or** HireVue (guides) | 2–3 coding **or** recorded STAR; campus often HireVue |
| CoderPad screen (official + guides, ~45–75 min) | Working, tested code; 1–2 mediums; resume 5–10 min |
| Superday (guides: 3–5 × 45–60 min) | DSA; HLD **or** LLD; **SDLC / engineering practices**; behavioral |
| Team fit (guides, after pass) | Stack + team; another team can pick you up |
| MD conversation (guides, some loops) | Career; occasional surprise technical — not a chat |

**SDLC / practices** is the distinctive Superday hour: testing, CI, code review, production incidents, how you ship — not a second Blind 75. Confirm.

## How this track differs

| vs JPMorganChase | vs FAANG |
| --- | --- |
| Superday then **team fit**; JPMC is **cohort Super Day then match** | Medium DSA **plus** SDLC hour; not olympiad graphs |
| Four values + **engineering tenets**, not 20 bank bullets | Design is **trade / risk / notifications**, then SQL + concurrency |
| CoderPad is the brand; HireVue is a **campus filter** | “Why GS over a tech company?” is a real veto |

## Coding and design flavor

OA / CoderPad: sliding window, hashes, BFS/DFS, heaps, LRU. Superday DSA may extend a hashmap / occupancy problem. HLD: notifications, feeds, trade processing, rate limits. LLD: accounts / cards, parking-lot class design, concurrent money movement. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md), [../answers/coding-lru-cache.md](../answers/coding-lru-cache.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** firm vs a product company — client + integrity, not TC.
2. CoderPad: medium; run tests; narrate complexity.
3. Superday practices: how you review a PR that ships a racy map and a secret.
4. Design: notification fan-out that cannot drop a risk alert.
5. Integrity: you were asked to skip a control to hit a date — what you did.

## Prep checklist

- [ ] Read [Purpose and Values](https://www.goldmansachs.com/our-firm/purpose-and-values) + [Engineering Tenets](https://www.goldmansachs.com/careers/blog/engineering-tenets) + [1979 principles history](https://www.goldmansachs.com/our-firm/history/moments/1979-business-principles)
- [ ] Recruiter: HireVue vs OA, Superday mix (SDLC vs extra DSA), virtual vs onsite, team
- [ ] One timed CoderPad pair + one HLD + one STAR vs the **four** values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Goldman Sachs Careers](https://www.goldmansachs.com/careers) — accessed 2026-09-17
- [Our Purpose and Values — Goldman Sachs](https://www.goldmansachs.com/our-firm/purpose-and-values) — accessed 2026-09-17
- [Our Engineering Tenets — Goldman Sachs](https://www.goldmansachs.com/careers/blog/engineering-tenets) — accessed 2026-09-17
- [Goldman Sachs Introduces 14 Business Principles — Goldman Sachs](https://www.goldmansachs.com/our-firm/history/moments/1979-business-principles) — accessed 2026-09-17
- [Goldman Sachs's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/goldman-sachs-interview-process) — accessed 2026-09-17
- [Goldman Sachs Interview Questions (2026) — LastRoundAI](https://lastroundai.com/interview-questions/goldman-sachs) — accessed 2026-09-17
