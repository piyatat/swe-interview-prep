# Visa engineering track

Sits beside [paypal.md](paypal.md) and [stripe.md](stripe.md): **the card network between banks, merchants, and governments**, not a consumer wallet and not a PSP you integrate with a secret key. Official [What we do](https://corporate.visa.com/en/about-visa.html): purpose is **uplift everyone, everywhere by being the best way to pay and be paid**; ~5B credentials, 200+ countries. Recruiter confirms **network / tokenization / risk vs Visa Direct vs consulting**, **Java vs other**, OA tool, and whether design is HLD or LLD.

Typical timeline **3–8 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Ledgers / idempotency: [../answers/system-design-payment.md](../answers/system-design-payment.md). Auth / rate limits: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md). LLD: [../general/low-level-design.md](../general/low-level-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (Leadership Principles)

Do **not** recite posters. Map **your** stories. Official [Leadership Principles](https://corporate.visa.com/en/about-visa/leadership-principles.html) group into four:

| Official cluster | What they score |
| --- | --- |
| **Lead courageously** | Owner mindset; think big; hold self and others accountable; integrity |
| **Obsess about customers** | Listen to issuers / acquirers / merchants; simple payments products |
| **Collaborate as one Visa** | Inclusion; constructive debate; remove barriers for other teams |
| **Execute with excellence** | Decide on available data; deliver simply; own mistakes and reverse |

“Why Visa?” that only says “payments is huge” fails. Name an **authorization, retry, fraud, or multi-party money** problem you have lived — Visa is a **network of networks**, not “I would add Stripe.”

## Official + reported process

Official careers + principles pages do **not** publish a round-by-round SWE loop. 2026 guides (TechPrep) and candidate write-ups (Hashnode, Glassdoor) describe the funnel — treat counts as **reported**.

| Stage | What they score |
| --- | --- |
| Recruiter | Background, team, location, band |
| OA (guides: CodeSignal **or** HackerRank, ~70–90 min) | 3–4 easy–medium; finish **clean** (reports: 3/4 is the bar) |
| Tech 1 (guides + 2026 write-up) | Medium DSA **plus** Java/SQL/JWT/APIs from the resume |
| Tech 2 (guides) | HLD or LLD; transactions / rollbacks; resume architecture |
| HM (guides + 2026 write-up) | Project deep dive; concurrency; leadership vs the principles |

2026 candidate reports: **GenAI as a practical conversation** in multiple hours (how you use it, limits) — not a substitute for DSA. Confirm AI policy with the recruiter; do not paste a model into a live pad unless they say so.

## How this track differs

| vs PayPal / Stripe | vs FAANG |
| --- | --- |
| You design **authorization, settlement, tokens, scheme rules**, not a checkout button | Medium DSA + **Java internals / SQL / transactions** the same day |
| Principles are **owner / customer / one Visa / execute**, not 16 LPs | Network scale (issuers × acquirers × merchants), not “design Twitter” |
| OA is a real filter; HM still opens **multithreading** | Breadth over olympiad graphs |

## Coding and design flavor

OA / live: arrays, hashes, heaps, sliding window, trees, binary search on answer. Design: payment notification fan-out, URL shortener, rate limiter, order-delivery LLD, elevator / library OOP. Talk **idempotent auth, at-least-once vs exactly-once, PCI-adjacent data you do not store**. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../general/cs-fundamentals.md](../general/cs-fundamentals.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **the network** vs a wallet or PSP — multi-party trust, not “I like fintech.”
2. OA: three mediums, all tests; leftover time = edges.
3. Live: sliding window + a SQL / JWT follow-up from **your** stack.
4. Design: notify issuers of a decline spike without drowning them.
5. Execute with excellence: you shipped a retry that double-posted — what you changed.

## Prep checklist

- [ ] Read [What we do](https://corporate.visa.com/en/about-visa.html) + [Leadership Principles](https://corporate.visa.com/en/about-visa/leadership-principles.html) + [Careers](https://corporate.visa.com/en/careers.html)
- [ ] Recruiter: OA platform, Java vs other, HLD vs LLD, GenAI policy on the pad
- [ ] One timed 3-question OA + one payments design + STAR vs the **four** clusters
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Visa careers](https://corporate.visa.com/en/careers.html) — accessed 2026-09-17
- [What we do — Visa](https://corporate.visa.com/en/about-visa.html) — accessed 2026-09-17
- [Visa Leadership Principles](https://corporate.visa.com/en/about-visa/leadership-principles.html) — accessed 2026-09-17
- [Visa's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/visa-interview-process) — accessed 2026-09-17
- [My Software Engineer Interview Experience at Visa (2026) — Hashnode](https://animeshk.hashnode.dev/visa-swe-interview-experience) — accessed 2026-09-17
- [Visa Interview Questions (2026) — LastRoundAI](https://lastroundai.com/interview-questions/visa) — accessed 2026-09-17
