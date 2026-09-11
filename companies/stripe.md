# Stripe engineering track

Sits beside [product-companies.md](product-companies.md) and [coinbase.md](coinbase.md): **payments / economic infrastructure**, not a generic FAANG slate. Official [Jobs](https://stripe.com/jobs) FAQ: most processes include a **recruiter screen**, a **technical or skills-based assessment**, and **interviews with the team**; timelines vary by role, level, and location. Official [Scaling engineering organizations](https://stripe.com/guides/atlas/scaling-eng): questions target **real-world problems**, not esoteric whiteboard skills; **Bug Squash** is a historical open-source bug in **your** language; written **rubrics** + Candidate Review. Listings call the process **language-agnostic**. Recruiter confirms **Bug Squash vs integration**, **own IDE**, **AI policy**, and **team match** (often late).

Typical timeline **4–8 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Debug: [../general/debugging-rounds.md](../general/debugging-rounds.md). Money correctness: [../answers/system-design-payment.md](../answers/system-design-payment.md).

## Official culture (jobs + Atlas)

Do **not** recite slogans. Map **your** stories. Official jobs copy: mission is to **increase economic growth** / “implement the conditions for prosperity”; operating tension is **speed and craft**; **better defaults** (first principles); people who thrive **choose challenge**, change their mind on evidence, and fix things that do not “belong” to them.

“Why Stripe?” that only says “I like payments APIs” fails. Name a **correctness, retry, or developer-experience** story you have lived.

## Official + reported process

Official jobs FAQ is the skeleton. 2026 guides (Exponent, CoPrep) stretch it into a practical loop — treat round names as **reported**.

| Stage | What they score |
| --- | --- |
| Recruiter (~30 min, guides) | Why Stripe, level, team direction |
| Technical / skills assessment (official) | Guides: live **multi-part** practical prompt (parse → validate → graph/rule) |
| Team coding (guides) | Working, readable code; tests; narration |
| **Bug Squash (official Atlas)** | Hypothesis-driven debug in an unfamiliar repo / historical OSS bug |
| Integration (guides) | Small feature against an API; failures, retries, docs |
| System design (mid+) | Idempotency, webhooks, ledger-ish consistency |
| Behavioral | Ownership, craft, evidence — Atlas rubric: **your** work, not “the team” |

Guides: prompts are **wordy**; extract the spec before typing. Ending with **running** code beats a clever unfinished design. Confirm whether you use CoderPad or your laptop.

## How this track differs

| vs FAANG | vs Coinbase / Capital One |
| --- | --- |
| Official **Bug Squash** + practical parse/integrate hours | Coinbase: AI-repo hour + tenets; Capital One: Power Day + AWS case |
| Design is **money movement + APIs**, not “design Twitter” | Same money bar; Stripe is **developer platform**, not exchange or issuer |
| Language-agnostic; Atlas: sit-together debug, not silent puzzles | Writing culture is real — short, specific tradeoffs |

## Coding and design flavor

Live problems look like **CSV/logs, numeronyms, balances, caches, rate limits** — hash maps and graphs under a product costume. Design: webhook fan-out, at-least-once + consumer dedupe, idempotency keys, versioned APIs. Related: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why Stripe — not a generic fintech?” — GDP-of-the-internet / craft, not slogans.
2. Multi-part parse: validate rows, then a cross-field rule, then a cycle.
3. Bug Squash: failing test in an unfamiliar repo; reproduce → hypothesize → narrow.
4. Design merchant → customer webhook delivery with retries and a DLQ.
5. A time evidence **changed your mind** (official jobs: curiosity when something does not add up).

## Prep checklist

- [ ] Read [Jobs](https://stripe.com/jobs) + [Scaling engineering organizations](https://stripe.com/guides/atlas/scaling-eng)
- [ ] Recruiter: Bug Squash vs integration, editor, AI, team-match timing
- [ ] One **wordy multi-part** mock and one **45–60 min repo debug**
- [ ] One payments / webhook design mock
- [ ] STAR bank: ownership, disagreement, failure — **your** impact
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Stripe Jobs](https://stripe.com/jobs) — accessed 2026-09-11
- [Scaling engineering organizations — Stripe Atlas](https://stripe.com/guides/atlas/scaling-eng) — accessed 2026-09-11
- [Full Stack Engineer listing (language-agnostic process) — Stripe](https://stripe.com/jobs/listing/full-stack-engineer-developer-end-user-experience-platform/6567104) — accessed 2026-09-11
- [Stripe Software Engineer Interview Guide (2026) — Exponent](https://www.tryexponent.com/guides/stripe-software-engineer-interview) — accessed 2026-09-11
- [Stripe Software Engineer Interview Preparation 2026 — CoPrep](https://www.coprep.ai/blog/stripe-software-engineer-interview-preparation-2026) — accessed 2026-09-11
