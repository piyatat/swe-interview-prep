# Revolut engineering track

Sits beside [wise.md](wise.md) and [chime.md](chime.md): **global licensed neobank / super-app** (cards, FX, business, wealth), not a mid-market FX specialist or a US partner-bank neobank. Official [Engineering](https://www.revolut.com/careers/team/engineering/): intro call → tech interviews → team fit → offer; remote-first hubs. Official [How to ace your Java interview](https://www.revolut.com/en-US/blog/post/how-to-ace-your-java-interview-at-revolut/) (2025-03-31) is the detailed SWE source of truth for Java roles. Recruiter confirms **Java vs Python / mobile / web**, **OA vs take-home**, hub, and **AI-in-pad**.

Typical timeline **3–6 weeks** (2026 guides). Payments: [../answers/system-design-payment.md](../answers/system-design-payment.md). LLD: [../general/low-level-design.md](../general/low-level-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Do **not** invent Amazon-style LPs. Use the official five on [Our culture](https://www.revolut.com/our-culture/).

| Official value | What they score |
| --- | --- |
| **Never Settle** | 10x bar; day-1; not “good enough” |
| **Dream Team** | Smaller elite team; radical honesty; no average seats |
| **Think Deeper** | Define the **exact** problem first; “is that true?”; hands-on detail |
| **Get It Done** | Ownership; no “someone else’s job”; decide with incomplete data + a downside plan |
| **Deliver WOW** | Minimum **lovable** product; taste; quality is not optional |

Official engineering blog (mindset traits): customer-centric, detail, DDD, eagerness for feedback. “Why Revolut?” that only says “fast growth / London / fintech” fails. Name a **ledger, FX, card-auth, or concurrency** problem you have lived.

## Official + reported process

Official Java guide publishes **five named stages**. Official engineering page collapses tech into one bucket — **ask** which hours you get. 2026 guides add HackerRank and a 4–8 h take-home; treat those as **reported**.

| Stage | Official / reported |
| --- | --- |
| Intro / recruiter | Experience, goals, why Revolut (STAR) |
| Live coding in Java (official) | Clean, timed solutions; DS, SOLID, tests, **multithreading** |
| Technical interview (official) | Concurrency, DBs (index / txn / distributed), architecture (microservices, DDD, events) |
| System design (official; “boss level” in a Revolut recruiting talk) | Scale, DB performance, resilience — collaborative, not a quiz |
| Team fit + offer | Ways of working; conflict; what excites you |

Official Java stack callouts: **Java 21**, PostgreSQL via jOOQ, Redis, K8s, Docker, GCP; Clean Architecture / DDD / TDD; CQRS; Flyway; SparkJava. Official engineering page: teams of **6–8**, lean launch-then-refine. 2026 reports: timed OA; take-home (FX API / categoriser / notifications) **with tests**; live LLD (load balancer, thread-safe ledger). Confirm OA vs take-home the week you interview.

## How this track differs

| vs Wise / Chime | vs FAANG |
| --- | --- |
| Official **Java-first** live + concurrency hour | Design is **wallet / FX / card / ledger**, not “design Twitter” |
| Published **five values** including Never Settle / Deliver WOW | Official: clarify before you assume; connect answers to **your** systems |
| Licensed global bank, not partner-bank or FX-only | Guides: take-home **without tests** does not advance |

## Coding and design flavor

Official live coding: readable Java, narrate, time-box on LeetCode-style practice. Official technical: sync, thread safety, parallel work; indexing and transactions; event-driven design. Official design: decompose, big picture first, take feedback. Related: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md), [../general/cs-fundamentals.md](../general/cs-fundamentals.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** super-app — a correctness-over-speed call in money movement.
2. Live Java: a small concurrent structure; say the invariant before locks.
3. Design: multi-currency ledger, idempotent postings, failed card auth.
4. Values: Think Deeper — a time you redefined the problem before coding.
5. Questions for them: OA vs take-home, Java 21 vs other, hub vs remote, AI-in-pad.

## Prep checklist

- [ ] Read [Our culture](https://www.revolut.com/our-culture/) (all five) + [Java interview guide](https://www.revolut.com/en-US/blog/post/how-to-ace-your-java-interview-at-revolut/)
- [ ] Recruiter: language, OA / take-home, design hour, AI / recording
- [ ] Timed Java medium + concurrency drill; one ledger / FX sketch
- [ ] Five STAR stories mapped to the five values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Our culture — Revolut](https://www.revolut.com/our-culture/) — accessed 2026-10-02
- [Engineering — Revolut Careers](https://www.revolut.com/careers/team/engineering/) — accessed 2026-10-02
- [How to ace your Java interview at Revolut](https://www.revolut.com/en-US/blog/post/how-to-ace-your-java-interview-at-revolut/) — accessed 2026-10-02
- [10 Mindset Traits for Revolut Engineering Excellence](https://www.revolut.com/en-US/blog/post/10-mindset-traits-for-revolut-engineering-revoluts-excellence/) — accessed 2026-10-02
- [Revolut’s Interview Process (2026) — TechPrep](https://www.techprep.app/blog/revolut-interview-process) — accessed 2026-10-02
