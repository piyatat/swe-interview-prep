# Ramp engineering track

Sits beside [stripe.md](stripe.md) and [affirm.md](affirm.md): **corporate card / spend platform**, not a consumer PSP. Official [Careers](https://ramp.com/careers): **we only hire builders**; hire question is **“If this person started a company, would we join them?”**; product rule is **“If it doesn’t save you time or money, we don’t build it.”** Official [engineering principles](https://engineering.ramp.com/post/engineering-principles) are the craft bar. Recruiter confirms **CodeSignal vs skip**, NYC vs remote, and **AI-in-pad** (official emerging-talent copy is **practical + open book** — still ask).

Typical timeline **2–4 weeks** (official emerging-talent: 3–4; 2026 guides: 2–3). Practical coding: [../general/debugging-rounds.md](../general/debugging-rounds.md). Money path: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (careers + seven principles)

Do **not** invent extra LPs. Map **your** stories to published language.

| Official note | What they score |
| --- | --- |
| **Only hire builders** ([Careers](https://ramp.com/careers)) | Shipped work; “would we join their company?” |
| **Save time or money** | Product taste — skip work that is neither |
| **Hands off doesn’t exist** | Cross-functional; titles are the least interesting thing |
| **Reversible vs irreversible** (principles #2) | Fast MVP when cheap to change; careful on customer APIs |
| **Customer-aligned systems** (#3) | Data model matches how the user thinks |
| **Opinionated, not infinitely flexible** (#4) | Simple path; don’t kick every decision to a toggle |
| **Wrong abstraction costs more than duplication** (#5) | Cards vs bill-pay money-movement differ |
| **Need vs ask** (#6) | Investigate the real bottleneck (notify vs approve) |
| **Small independent chunks / pods** (#7) | Decompose; 80/20; own a slice |

Official [Emerging Talent](https://ramp.com/emerging-talent) values line: **ownership, think big, grow without fear**. Internships are **in-person NYC**, ~10 weeks. “Why Ramp?” that only says “hot fintech / velocity” fails. Name a **ledger, retry, or spend-policy** problem you have lived.

## Official + reported process

Official emerging-talent FAQ: **technical assessments, phone screens, evaluations**; **practical + open book**; round count **depends on the role**. 2026 guides (techinterview.org; hirecomb) — treat stage list as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (guides: ~25–30) | Motivation, level, location / NYC, comp expectations |
| OA (guides: 90 min CodeSignal ICF) | One problem, **four stacking levels**; seniors often skip |
| Live phone (guides: ~60) | Build-a-feature; edges + concurrency |
| Virtual onsite (guides: four rounds) | Practical repo, product-shaped coding, money design, HM values |
| Offer | Fast pipeline is part of the pitch — confirm |

Guides: some JDs hide a **base64 / DOM** curiosity gate. CodeSignal is incremental — a working level 3 beats a broken level 4. Design is **authorization, ledger balance, duplicate charges**.

## How this track differs

| vs Stripe / Affirm / Brex | vs FAANG |
| --- | --- |
| Official **builder / join-their-company** bar, not LPs | Practical **extend-a-repo** over olympiad DSA |
| Spend / card **credit-limit correctness** | Official intern loop is **open book + in-person NYC** |
| Principles reward **reversible speed** | “I only grind LeetCode” misses product coding + values |

## Coding and design flavor

Live work looks like: in-memory KV + TTL, a reservation or expense-split, concurrent debit of the same limit. Design: card auth, balanced ledger, idempotent charge on retry. Related: [../answers/system-design-payment.md](../answers/system-design-payment.md), [../answers/coding-lru-cache.md](../answers/coding-lru-cache.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** finance platform — a time you shipped without permission and owned the miss.
2. Live: extend a small service; keep level-1 structure from boxing you in later.
3. Design: two retries + two concurrent auths — **one** business debit.
4. Principles: a reversible MVP you shipped vs an API you refused to rush.
5. Questions for them: card vs Bill Pay pod, FDE vs product eng, AI / open-book on *your* loop.

## Prep checklist

- [ ] Read [Careers](https://ramp.com/careers) + [engineering principles](https://engineering.ramp.com/post/engineering-principles)
- [ ] Recruiter: OA vs skip, language, NYC, AI / open-book policy
- [ ] One CodeSignal-style stacking mock + one ledger design
- [ ] STAR: ownership + speed + being wrong
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Ramp](https://ramp.com/careers) — accessed 2026-09-25
- [Engineering principles — Ramp](https://engineering.ramp.com/post/engineering-principles) — accessed 2026-09-25
- [Emerging Talent — Ramp](https://ramp.com/emerging-talent) — accessed 2026-09-25
- [How to pass Ramp’s engineering interview loop — techinterview.org](https://www.techinterview.org/post/3233476263/how-to-pass-ramp-engineering-interview-loop/) — accessed 2026-09-25
- [Ramp Software Engineer Interview Guide (2026) — hirecomb](https://hirecomb.com/blog/ramp-software-engineer-interview-guide) — accessed 2026-09-25
