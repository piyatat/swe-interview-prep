# Brex engineering track

Sits beside [ramp.md](ramp.md) and [stripe.md](stripe.md): **corporate card / spend platform**, not a consumer BNPL loop. Official [Careers](https://www.brex.com/careers): **launchpad, not a landing pad**; hire for grit, autonomy, ambition. Official [manifesto](https://www.brex.com/manifesto): **be the founder of your career**. Recruiter confirms **SF vs NYC vs São Paulo**, Kotlin vs TypeScript, CodeSignal vs CoderPad, and **AI-in-pad**.

Typical timeline **3–5 weeks** (2026 guides). Money path: [../answers/system-design-payment.md](../answers/system-design-payment.md). Practical coding: [../general/debugging-rounds.md](../general/debugging-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (values + principles)

Do **not** invent extra LPs. Official careers lists **six values** and **four principles**. Guides that say “four Brex Way values” are collapsing the page — use the published names.

| Official value | Careers one-liner |
| --- | --- |
| **Dream Big** | Think 10x, not 10% |
| **Ownership** | If it’s broken, you fix it |
| **Impatient Optimism** | Move fast, stay positive |
| **One Brex** | No silos, no egos |
| **Customer Obsession** | Build something loved |
| **Growth Mindset** | Ask questions relentlessly |

Official principles ([Careers](https://www.brex.com/careers) + [manifesto](https://www.brex.com/manifesto)): **founders are built by doing hard things**; work should feel **hard, not difficult** (hard = real problems; difficult = politics); **leaders operate at all levels** (CTO still codes); **run the company close to the metal** (strategy and financials visible).

“Why Brex?” that only says “hot fintech / I like Ramp” fails. Name a **card-auth, ledger, or spend-policy** problem you have lived.

## Official + reported process

Official careers / manifesto are culture, not a public stage list. 2026 guides (TechScreen; PracHub) — treat counts as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (guides: ~30) | Motivation, hub, level, why *this* spend platform |
| HM screen (guides: some pipelines) | Team fit before the coding gauntlet |
| Coding screen (guides: 60, CoderPad) | One medium–hard; Kotlin shows up more than at peers |
| Virtual onsite (guides: 4–5) | Algo + **applied** implement, ledger design, project deep-dive, values |
| Optional bar-raiser (guides, L5+) | Skip-level / cross-org |
| Offer | São Paulo loop reported equivalent in PT or EN |

Guides: second coding hour is often a **small system** (rate limiter, parser, transaction matcher) — API + tests beat a clever one-liner. Design is **ledger, tenant isolation, idempotent charge**.

## How this track differs

| vs Ramp / Stripe | vs FAANG |
| --- | --- |
| Official **founder-school** bar, not puzzle LPs | More **standardized** than Ramp’s pair / product hour |
| Spend / card **credit-limit correctness** | Applied implement + project deep-dive, not only DSA |
| Hubs include **São Paulo** as a first-class loop | “I only grind LeetCode” misses values + money |

## Coding and design flavor

DSA: graphs with constraints, intervals, hash dedupe, windows. Applied: sliding-window limiter, matcher that stays correct on replay. Design: two concurrent auths + one debit; multi-tenant isolation; refund that reverses points. Related: [../answers/system-design-payment.md](../answers/system-design-payment.md), [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** founder school — a time you owned a miss without waiting for permission.
2. Live: medium graph / interval; name edges before they do.
3. Implement: matcher or limiter; thread-safety and replay called out.
4. Design: card auth that cannot double-spend when the network retries.
5. Questions for them: card vs bill-pay vs travel pod, hub, AI policy.

## Prep checklist

- [ ] Read [Careers](https://www.brex.com/careers) + [manifesto](https://www.brex.com/manifesto)
- [ ] Recruiter: language, hub, screen vendor, AI policy
- [ ] One CoderPad medium + one small-system implement + one ledger design
- [ ] STAR: ownership, One Brex (no silo), customer cost
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Brex](https://www.brex.com/careers) — accessed 2026-09-28
- [Join the founder school — Brex manifesto](https://www.brex.com/manifesto) — accessed 2026-09-28
- [Be the founder of your career — Brex Journal](https://www.brex.com/journal/be-the-founder-of-your-career) — accessed 2026-09-28
- [The Brex Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/brex-technical-interview-process-2026) — accessed 2026-09-28
- [Brex Interview Questions (Updated 2026) — PracHub](https://prachub.com/companies/brex) — accessed 2026-09-28
