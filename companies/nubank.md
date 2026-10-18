# Nubank engineering track

Sits beside [chime.md](chime.md) and [sofi.md](sofi.md): **LATAM digital bank (Nu)** — credit card, account, and lending in Brazil / Mexico / Colombia — not a US partner-bank neobank loop. Official [international careers](https://international.nubank.com.br/careers/): diverse teams; stage **order can change**. Recruiter confirms **country, product vs platform, Clojure vs other, take-home window**, and whether senior **architecture** is on.

Typical take-home window is **about two weeks** on the official SWE post (Mexico blog: **5–7 days** on some reqs). Take-homes: [../general/take-homes.md](../general/take-homes.md). Pair: [../general/pair-programming.md](../general/pair-programming.md). Payments: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Do **not** invent Amazon-style LPs. Use the official five on [The principles that uphold Nubank’s culture](https://building.nubank.com/the-principles-that-uphold-nubanks-culture/) (May 2026). Map **your** stories.

| Official value | What they score |
| --- | --- |
| **Customers love us fanatically** | Trust as a structural asset; no “good enough” product |
| **Hungry; challenge the status quo** | Structured nonconformism — ambitious, not burnout theater |
| **Think and act with ownership** | Beyond your ticket; disagree, then align |
| **Build strong and diverse teams** | Debate as how you converge; mixed tenure / background |
| **High standards and smart efficiency** | Quality bar first, then the efficient path; choose where **not** to invest |

SWE overlay — official [engineering principles](https://building.nubank.com/nubanks-engineering-principles-interview-with-ed-wible/) (Ed Wible): **leverage through platforms**, **customer trust**, **data as a strategic asset**, **ownership and technical resilience**, **canonical approaches**, **multiple perspectives**. “Why Nu?” that only says “purple card / Clojure / Brazil” fails. Name a **ledger, credit-decision, fraud, or regulated-money** problem you have lived.

## Official process (SWE)

Official [SWE hiring post](https://building.nubank.com/what-is-the-interview-process-like-for-software-engineers-at-nubank/) is the engineering skeleton. International careers is company-wide (apply → technical assessment → online interviews → final). Prefer the recruiter email.

| Stage | Official |
| --- | --- |
| Application | Form; ~**a week** to first signal on the SWE post |
| Take-home | SWE post: **~two weeks**. Process **>** finishing. Trade-offs in writing. You **need not finish**. |
| Pair programming | Real problem with a Nu engineer; collaboration scored |
| Architecture | **Senior** — scalable, resilient systems |
| Engineering interview | Algorithms, logic, system design |
| Talent Acquisition | Culture: collaborate, challenge constructively, adapt |

Official [technical-exercise tips](https://building.nubank.com/tips-software-engineering-technical-exercise/): they score **logic and data-structure evolution**, not syntax. **Pick any language**; keep it readable; no extra complexity. Clojure is the production default — curiosity helps, **fluency is not the gate**. Mexico blog: first conversation may also cover **how Nu uses functional programming** and cross-functional squads.

## How this track differs

| vs Chime / SoFi | vs FAANG |
| --- | --- |
| Official **long take-home + pair**, not a CodeSignal GCA | Product is **credit / account / PIX-shaped money**, not “design Twitter” |
| Five Nu values + six eng principles | Official: **do not treat stages as pure coding tests** |
| LATAM regulated bank; multi-country | “I only grind DSA” misses the exercise write-up |

## Coding and design flavor

Take-home / pair: transform given structures into the stated outputs; tests; a README of trade-offs. Design: credit decisioning, ledger coherence, Kafka-shaped pipelines, Datomic / functional services (named in Nu onboarding posts). Related: [../answers/system-design-payment.md](../answers/system-design-payment.md), [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** digital bank — a trust or correctness call, not “fintech is hot.”
2. Take-home: incomplete on purpose; show the next cut and the risk you skipped.
3. Pair: change the model when they add a requirement; narrate.
4. Design (senior): one customer view when credit, fraud, and ledger disagree.
5. Values: ownership — you ran the thing you shipped, including the night page.

## Prep checklist

- [ ] Read [SWE hiring process](https://building.nubank.com/what-is-the-interview-process-like-for-software-engineers-at-nubank/) + [five values](https://building.nubank.com/the-principles-that-uphold-nubanks-culture/) + [eng principles](https://building.nubank.com/nubanks-engineering-principles-interview-with-ed-wible/)
- [ ] Recruiter: take-home days, pair vs architecture, language, country, AI policy
- [ ] One short take-home you can walk; one money-correct design sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [What is the hiring process like for Software Engineers at Nubank?](https://building.nubank.com/what-is-the-interview-process-like-for-software-engineers-at-nubank/) — accessed 2026-10-18
- [The principles that uphold Nubank’s culture](https://building.nubank.com/the-principles-that-uphold-nubanks-culture/) — accessed 2026-10-18
- [Nubank’s Engineering Principles — Edward Wible](https://building.nubank.com/nubanks-engineering-principles-interview-with-ed-wible/) — accessed 2026-10-18
- [8 tips to solve the SWE technical exercise — Building Nubank](https://building.nubank.com/tips-software-engineering-technical-exercise/) — accessed 2026-10-18
- [Careers — Nu International](https://international.nubank.com.br/careers/) — accessed 2026-10-18
