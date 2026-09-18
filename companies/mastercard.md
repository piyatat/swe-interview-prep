# Mastercard engineering track

Sits beside [visa.md](visa.md) and [paypal.md](paypal.md): **the other card network** (issuers, acquirers, merchants, governments), not a consumer wallet and not a PSP you integrate with a secret key. Official [hiring process](https://careers.mastercard.com/us/en/mastercards-hiring-process) publishes a **five-stage** spine. Recruiter confirms **network / tokenization / fraud vs services / consulting**, **Java vs other**, OA vs live screen, and **AI policy** for *your* assessment.

Typical timeline **3–8 weeks** (2026 guides; official page does **not** publish a clock). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Ledgers / idempotency: [../answers/system-design-payment.md](../answers/system-design-payment.md). Auth / rate limits: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (The Mastercard Way)

Do **not** recite posters. Map **your** stories. Official Code of Conduct + [About](https://www.mastercard.com/us/en/for-the-world/about-us.html): vision is **powering economies and empowering people**. The Mastercard Way is three principles plus **decency / inclusion / force for good**:

| Official principle | Habits they score |
| --- | --- |
| **Create value** | Think big; innovate with intention; **deliver scalable** solutions |
| **Grow together** | Say what you mean; bring other perspectives; help others be great |
| **Move fast** | Prioritize; **learn and pivot**; own the outcome |

Guides also mention a **Decency Quotient** (DQ) — treat the name as **reported**; the official text is decency + do the right thing. “Why Mastercard?” that only says “payments is huge” fails. Name an **authorization, retry, fraud, or multi-party money** problem you have lived — they are a **network**, not “I would add Stripe.”

## Official AI + interview rules (do not guess)

Official [AI guidelines](https://careers.mastercard.com/us/en/ai-guidelines) + [interview tips](https://careers.mastercard.com/us/en/interview-tips):

- **Prep yes:** mock interviews, grammar on resume/cover, industry research.
- **Live replace no:** answers must be **your** experiences; do not use AI to draft live responses.
- Virtual default is **on-camera** unless they require otherwise.
- **No recording / transcription** without Mastercard approval.
- **Technical assessments:** some roles **invite** AI — only if the instructions say so.
- All interviews include **behavioral + problem-solving**. Role types they name: Technical, Product, Consulting (case).

## Official + reported process

Official five stages after apply: recruiter intro → hiring-manager interview → **team** interviews → selection decision → offer. Decision is **HM-led with team input**; no published hiring committee. 2026 guides (TechPrep, ResumeAdapter) layer SWE detail — treat vendors and counts as **reported**.

| Stage | What they score |
| --- | --- |
| Recruiter (official) | Fit, role, location; guides: ~30 min, Java/Spring comfort |
| OA or live screen (guides) | 60–90 min HackerRank **or** Codility, 2–3 easy–medium; **or** a live tech screen |
| Tech 1 (guides) | Medium DSA **plus** Java / SQL / APIs; they **expand** the prompt mid-hour |
| Tech 2 / design (guides) | Payments HLD: txn history, fraud fan-out, monolith split, auth |
| HM / “DQ” (guides) | Projects, influence, how you treat people |

## How this track differs

| vs Visa / PayPal / Stripe | vs FAANG |
| --- | --- |
| Official **published** stage list + **written** AI rules | Medium DSA + **Java internals / SQL** the same day |
| HM-led decision, not a Google-style HC pool | Design is **auth, settlement, tokens, scheme rules**, not “design Twitter” |
| Expanding problem (thread-safe → high QPS) is a known pattern | Decency / grow-together can veto a clever but rude hour |

## Coding and design flavor

OA / live: arrays, strings, lists, sliding window, “second largest,” cycle detect. Design: real-time txn viewer, fraud spike notify, batch settlement, rate limiter. Talk **idempotent auth, tokenization, at-least-once vs exactly-once, PCI-adjacent data you do not store**. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../general/sql-interviews.md](../general/sql-interviews.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** network vs a wallet or PSP — multi-party trust, not “I like fintech.”
2. OA: two mediums, all tests; leftover time = edges.
3. Live: they add “now make it concurrent” — name the lock / queue, do not shrug.
4. Design: notify issuers of a decline spike without drowning them.
5. Grow together: you changed a design after a quieter teammate was right.

## Prep checklist

- [ ] Read [Hiring process](https://careers.mastercard.com/us/en/mastercards-hiring-process) + [AI guidelines](https://careers.mastercard.com/us/en/ai-guidelines) + [Interview tips](https://careers.mastercard.com/us/en/interview-tips)
- [ ] Recruiter: OA vs live, Java vs other, HLD vs LLD, whether **this** assessment allows AI
- [ ] One timed 2-problem OA + one payments design + STAR vs **Create / Grow / Move**
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [An Overview of Mastercard’s Hiring Process](https://careers.mastercard.com/us/en/mastercards-hiring-process) — accessed 2026-09-18
- [AI Use Guidelines for Job Application & Interview — Mastercard](https://careers.mastercard.com/us/en/ai-guidelines) — accessed 2026-09-18
- [Interview Tips — Mastercard Careers](https://careers.mastercard.com/us/en/interview-tips) — accessed 2026-09-18
- [About Mastercard](https://www.mastercard.com/us/en/for-the-world/about-us.html) — accessed 2026-09-18
- [Mastercard's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/mastercard-interview-process) — accessed 2026-09-18
- [Mastercard Interview Process & Questions (2026) — ResumeAdapter](https://www.resumeadapter.com/companies/mastercard/interview-process) — accessed 2026-09-18
