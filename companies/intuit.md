# Intuit engineering track

Sits beside [capital-one.md](capital-one.md) and [product-companies.md](product-companies.md): **consumer + SMB financial products** (TurboTax, Credit Karma, QuickBooks, Mailchimp), not a generic FAANG slate. Official [Hiring process](https://www.intuit.com/careers/hiring-process/): final day starts with **set-up + Craft Demonstration**. Official [values](https://www.intuit.com/careers/working-at-intuit/): **Integrity without Compromise, Courage, Customer Obsession, Stronger Together, We Care and Give Back**. Mission language: **powering prosperity**. Recruiter confirms **Craft vs live DSA**, **Glider / GitHub brief**, **AI hour**, and level.

Typical timeline **2–4 weeks** (2026 guides; official: feedback target **24 hours** after the final loop). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). LLD / craft: [../general/low-level-design.md](../general/low-level-design.md). Money correctness: [../answers/system-design-payment.md](../answers/system-design-payment.md). SQL: [../general/sql-interviews.md](../general/sql-interviews.md).

## Official culture (five values)

Do **not** recite the table. Map **your** stories. Official careers copy:

| Official value | Careers one-liner |
| --- | --- |
| **Integrity without Compromise** | Speak the truth; assume best intent; do the right thing unseen |
| **Courage** | Bold, high bar, speed + learning + action |
| **Customer Obsession** | Fall in love with the **problem**, not the solution |
| **Stronger Together** | Belonging; diverse voices for diverse customers |
| **We Care and Give Back** | Communities, environment, paid volunteer time, donation match |

“Why Intuit?” that only says “tax season is interesting” fails. Name a **money-correctness, seasonal load, or customer-problem** story.

## Official + reported process

Official hiring page (final-round shape). Earlier screens and AI hours are **reported** (TechPrep 2026; official India SWE blog — Craft / A4A).

| Stage | What they score |
| --- | --- |
| Recruiter (~30–40 min, guides) | Background, mission fit, process |
| Technical screen (guides: ~60–90 min, often Glider) | Medium DSA; sometimes SQL / light design |
| **Craft Demonstration (official, 60 min, ~4 hiring-team members)** | Case / craft: how you work — not a resume recitation |
| Skills deep-dive (official, 45 min, 2 assessors) | Follow-up on the craft + role skills |
| Values / cross-func (official, 30 min) | Values named as essential to the role |
| People manager (official, 30–60 min) | Motivation, successes, learnings; you interview them too |

Official engineer set-up: **up to ~90 min** before the craft to install tools and **solve a technical question alone** to present. Official blog (Ramamurthy): Craft can include DSA (e.g. maximum subarray), LLD walkthrough, and how **AI** would change the design — panel cross-questions. TechPrep: some loops send a **GitHub repo 24–48h** ahead and implement user stories live — tests over feature-complete. Ask which variant you have.

Guides also mention a short **AI-readiness** hour (critique generated output). Pair with [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md).

## How this track differs

| vs FAANG | vs Capital One / Stripe |
| --- | --- |
| Official **Craft** is the signature hour — present + defend | Capital One: Power Day + AWS case; Stripe: integration / bug-bash |
| Design is **tax / books / cash-flow**, seasonal peaks | Same money bar; Intuit is **consumer + SMB**, not issuer/processor |
| Values hour is scored; official 24h feedback commit | Craft is closer to [../general/take-homes.md](../general/take-homes.md) + live debrief |

## Coding and design flavor

DSA: medium graphs, DP, heaps, windows. Craft: clean modules, tests first, error paths on money-ish types (integer cents).

Design: TurboTax notification fan-out, QuickBooks multi-tenant books, filing-deadline write spike, idempotent payments. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../answers/system-design-metrics.md](../answers/system-design-metrics.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Customer Obsession — you killed a clever design because the problem was different.”
2. Craft: extend a small repo (comments, cache, limiter) + tests before extra features.
3. Design filing-deadline ingest when one form type spikes 20×.
4. SQL: latest filing per customer; watch `NULL` and grain.
5. Integrity: you were the only one who saw a money bug.

## Prep checklist

- [ ] Read [Hiring process](https://www.intuit.com/careers/hiring-process/) + [Working at Intuit](https://www.intuit.com/careers/working-at-intuit/)
- [ ] Recruiter: Craft brief vs live-only, Glider, SQL, AI hour, AI policy
- [ ] One **90-min craft** mock (tests + narration) and one timed medium
- [ ] One financial / seasonal design mock ([../general/system-design.md](../general/system-design.md))
- [ ] STAR bank mapped to **all five** values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Hiring Process — Intuit Careers](https://www.intuit.com/careers/hiring-process/) — accessed 2026-09-10
- [Working at Intuit — Intuit Careers](https://www.intuit.com/careers/working-at-intuit/) — accessed 2026-09-10
- [How to ace your software engineer interview at Intuit — Intuit Blog](https://www.intuit.com/blog/social-responsibility/job-readiness/how-to-ace-your-software-engineer-interview-at-intuit/) — accessed 2026-09-10
- [Intuit's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/intuit-interview-process) — accessed 2026-09-10
- [Careers — Intuit](https://www.intuit.com/careers/) — accessed 2026-09-10
