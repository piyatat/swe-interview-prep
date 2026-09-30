# Wise engineering track

Sits beside [paypal.md](paypal.md) and [stripe.md](stripe.md): **cross-border money movement at the mid-market rate**, not a card-network or PSP loop. Official [mission](https://wise.com/our-mission): **build the best way to move and manage the world's money**. Official [Engineering interviews](https://wise.jobs/engineering-interviews): recruiter → technical test / **pair programming** → meet the team (values). Recruiter confirms **backend vs frontend vs platform**, hub (London / Tallinn / Budapest / …), language, and **AI rules**.

Typical timeline **3–6 weeks** (2026 reports; senior loops add a product-mindset hour). Pair: [../general/pair-programming.md](../general/pair-programming.md). Payments: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (four values)

Do **not** invent Amazon-style LPs. Use the official four on [Our values](https://wise.jobs/our-values).

| Official value | What they score |
| --- | --- |
| **This isn’t just a job, we’re a revolution** | Comfort-zone stretch; nobody does FX alone |
| **We get it done** | Ownership; the thing belongs to the team |
| **Customers > team > ego** | Customer voice first; stay humble |
| **No drama. Good karma** | Assume good intent; challenge the argument, not the person |

“Why Wise?” that only says “cheap FX / Estonia / London” fails. Name a **ledger, FX-quote, payout-rail, or reconciliation** problem you have lived.

## Official + reported process

Official pages publish the **skeleton**. 2026 reports (Medium, candidate forums) — treat extra hours as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter | Experience, motivation, role, next steps |
| Pair programming (official: 60 min, HackerRank) | Collaborative coding; **not** system design, riddles, or a resume deep-dive |
| System design (official: ~60 min; often two engineers) | Product-shaped architecture; tradeoffs over a “right” diagram |
| Meet the team | Scenario + values fit; Zoom or office |
| Product mindset + HM (reports) | Customer / KPIs; ownership and reliability |

Official [AI in recruitment](https://wise.jobs/using-ai-in-our-wise-recruitment-process): **no AI** in pair programming or system design; live assistants / notetaker bots are **prohibited**. Take-homes: AI as copilot is expected **if** you did the strategy; disclose the workflow. Humans, not models, make hire/reject calls.

## How this track differs

| vs Stripe / PayPal | vs FAANG |
| --- | --- |
| Official **pair-first** HackerRank hour | Design is **FX / ledger / payout rails**, not “design Twitter” |
| Published **AI-off** live coding + design | Product-engineer bar: customer + metrics in the same loop |
| Local-rail network, not card-scheme trivia | Guides: resilience object (circuit breaker / limiter) over Blind-75 theater |

## Coding and design flavor

Official pair: transform a spec into **working, readable** code; Java is the backend default but **any language** if you tell the recruiter. Reports: circuit breaker / rate limiter on a client, concurrency, tests. Official design prep list: microservices, sync vs async, **high-volume transactions**, idempotency, observability, product thinking. Related: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** money-without-borders company — a correctness-over-speed call.
2. Pair: implement a small resilience object; narrate; ask when the spec is open.
3. Design: keep a scarce sale / payout from overselling while protecting the balance service.
4. Values: customers > ego — a time you dropped a clever design the customer would not feel.
5. Questions for them: language, hub vs remote, take-home AI disclosure.

## Prep checklist

- [ ] Read [values](https://wise.jobs/our-values) (all four names) + [engineering interviews](https://wise.jobs/engineering-interviews)
- [ ] Recruiter: language, pair vs take-home, AI / recording policy
- [ ] Timed pair: circuit breaker / limiter + tests; one FX / ledger design
- [ ] Four STAR stories mapped to the four values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Our values — Wise](https://wise.jobs/our-values) — accessed 2026-09-30
- [Engineering Interviews — Wise](https://wise.jobs/engineering-interviews) — accessed 2026-09-30
- [Backend Pair Programming Interviews — Wise](https://wise.jobs/backend-pair-programming-interviews) — accessed 2026-09-30
- [Backend System Design Interviews — Wise](https://wise.jobs/backend-system-design-interviews) — accessed 2026-09-30
- [Using AI in our Recruitment Process — Wise](https://wise.jobs/using-ai-in-our-wise-recruitment-process) — accessed 2026-09-30
- [The Wise Mission](https://wise.com/our-mission) — accessed 2026-09-30
- [Wise London Interview Experience — Medium](https://debugging-tale.medium.com/wise-london-interview-experience-e63901135c59) — accessed 2026-09-30
