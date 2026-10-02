# Adyen engineering track

Sits beside [stripe.md](stripe.md) and [paypal.md](paypal.md): **single-platform acquiring / payments** (Adyen as processor + acquirer), not a developer-API startup or a consumer wallet loop. Official [How we hire](https://careers.adyen.com/faqs): process is **rooted in the Adyen Formula** across teams and regions. Official [Formula](https://careers.adyen.com/formula) is the culture source of truth. Recruiter confirms **Unified Platform / Java vs other**, Amsterdam vs other hubs, **skills test vs case study**, and **AI-in-pad**.

Typical timeline **~4 weeks** (official: a little over a month). Payments: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (Adyen Formula)

Do **not** invent Amazon-style LPs. Use the official eight on [The Adyen Formula](https://careers.adyen.com/formula). Official interview-tips blog: they want **lived connections**, not recitation — and they are glad to talk about the Formula from their side.

| Official principle | What they score |
| --- | --- |
| **Build to benefit all customers (not just one)** | Platform, not a one-off merchant hack |
| **Long-term benefits for customers, Adyen, and the world** | Play the long game; no cheap local win |
| **Launch fast and iterate** | Speed with continuous learning, not sloppy |
| **Winning > ego; work as a team** | Across cultures and time zones |
| **Don’t hide behind email — pick up the phone** | Direct talk over async theater |
| **Talk straight without being rude** | Honest, respectful, fast |
| **Seek different perspectives** | Ask for challenge; sharpen the idea |
| **Create your own path** | Industry-first problems; own your growth |

Official prep: know the **business, products, and Formula** (Knowledge Hub, earnings, case studies). “Why Adyen?” that only says “payments / Amsterdam / fintech” fails. Name a **authorization, idempotency, or multi-acquirer routing** problem you have lived.

## Official + reported process

Official [How we hire](https://careers.adyen.com/faqs) + [interview tips](https://www.adyen.com/knowledge-hub/interview-tips-from-our-global-recruitment-team) (2025-09-01) publish the **six stages**. Order of team vs leadership may swap.

| Stage | Official note |
| --- | --- |
| Application review | Reply within **five business days** |
| Recruiter screen | Experience vs the role |
| Team interview | Role, ways of working (sometimes after leadership) |
| Skills assessment | **Technical test** or **case-study presentation** — real-world scenario; say the **why** |
| Leadership interview | Motivation; how you drive outcomes and grow others |
| Final interview | **Management Board or Global Leadership** |

Official: no dress code; Zoom / phone / in person; mail only from **@adyen.com**. Reapply: **30-day** wait on the same role. ATS deletes data after **12 months**. 2026 guides (techinterview.org) and 2026 Glassdoor reports add Java DSA, HackerRank, whiteboard design, and a CTO / board closer — treat extra hours as **reported**.

## How this track differs

| vs Stripe / PayPal | vs FAANG |
| --- | --- |
| Official **board / Global Leadership** closer | Design is **routing / capture / idempotency**, not “design Twitter” |
| Formula is **eight working rules**, not LPs | Official skills hour is a **scenario**, not a riddle |
| Single in-house platform + acquiring | Guides: **Java** is the core-platform default |

## Coding and design flavor

Official skills hour: think on your feet on a **real-world** problem; communicate. Guides: Java mediums with concurrency / nullability; design a global routing table, fallbacks, and **never double-charge**. Related: [../general/cs-fundamentals.md](../general/cs-fundamentals.md), [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** payments platform — a correctness call that protected a merchant.
2. Skills test: narrate assumptions; do not hide behind a silent perfect solution.
3. Design: retry a capture after timeout without a second debit.
4. Formula: talk straight — a time you picked up the phone instead of a long email.
5. Questions for them: test vs case study, Java vs other, hub, AI-in-pad.

## Prep checklist

- [ ] Read [Formula](https://careers.adyen.com/formula) (all eight) + [How we hire](https://careers.adyen.com/faqs)
- [ ] Recruiter: skills-test shape, language, hub, AI / recording
- [ ] Timed Java medium + one idempotent payments sketch
- [ ] STAR stories mapped to several Formula points (not a slogan dump)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How we hire at Adyen](https://careers.adyen.com/faqs) — accessed 2026-10-02
- [The Adyen Formula](https://careers.adyen.com/formula) — accessed 2026-10-02
- [Interview tips from our Global Recruitment team — Adyen](https://www.adyen.com/knowledge-hub/interview-tips-from-our-global-recruitment-team) — accessed 2026-10-02
- [Adyen Interview Guide (2026) — techinterview.org](https://www.techinterview.org/companies/adyen-interview-guide/) — accessed 2026-10-02
