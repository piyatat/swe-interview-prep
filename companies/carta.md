# Carta engineering track

Sits beside [stripe.md](stripe.md), [affirm.md](affirm.md), and [rippling.md](rippling.md): **private-capital infrastructure (cap table → fund ERP)**, not a consumer payments loop and not HRIS. Official [Engineering careers](https://carta.com/careers/engineering/): “infrastructure for private capital”; engineers must **understand the domain, not just the stack**. Recruiter confirms **equity vs fund admin vs payments vs data/AI vs infra**, Python/Django vs JVM, and take-home vs live.

Typical timeline **~2–4 weeks** (reported JDs). Take-home: [../general/take-homes.md](../general/take-homes.md). Team match: [../general/team-matching.md](../general/team-matching.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official [Careers](https://carta.com/careers/) **Operating Principles**. Map **your** stories.

| Official principle | What they score |
| --- | --- |
| **Mastery** | Judgment + taste + curiosity; autonomous ownership of hard problems |
| **Velocity** | Fast **and** aimed; narrow/deep scope, then move |
| **Impact** | Customer problems solved — not hours worked |
| **Helpful & Kind** | Unblock others quickly; share expertise without burning the team |

Staff / other JDs also name identity traits **Helpful, Relentless, Unconventional, Kind**. Official How we hire: they score how you **think, solve, collaborate, and build** — not trivia — and they expect **modern tools, including AI**, in the work. Do not invent extra LP names.

“Why Carta?” that only says “fintech / cap tables are interesting” fails. Name a **multi-entity waterfall, 409A, secondary, or capital-call** problem you have lived.

## Official + reported process

Official Engineering page does **not** publish a numbered stage list. Current Staff JDs: **pooled hire** (Carta first, then team match). Older official JDs described:

| Stage | Official / reported |
| --- | --- |
| Recruiter | Role, level, hubs (SF, NYC, Santa Clara, …) |
| Engineering leader / HM | Experience, skills, goals (older JDs) |
| Skills eval | Older JDs: **real-world take-home**, explicitly **not** LeetCode / “doubly-linked list” |
| Virtual loop | Collaboration, coding efficacy, systems design (older JDs) |
| Team match | Official pooled model: strengths + interests → domain |

Confirm **your** loop — take-home vs live coding has moved by year and team. Official comms come only from `@carta.com` / `@carta-external.com` (fraud warning on Careers). Confirm AI-in-pad vs “AI in the job.”

## How this track differs

| vs Stripe / Affirm / Rippling | vs FAANG web |
| --- | --- |
| Official **four OPs**; domain is **private markets** | Design is **cap table / fund admin / waterfall**, not “design Twitter” |
| Pooled hire + (often) practical take-home | “I only grind LeetCode” may be the wrong sport |
| Compliance + money movement in one graph | Ask the eval format; do not assume a CodeSignal GCA |

## Coding and design flavor

Official products: Equity Management, Fund ERP (multi-entity waterfalls, reconciliation), Carta Law, payments (capital calls / distributions), data/AI agents. Live work is Python/Django, React, Postgres; JVM / gRPC / AWS show up on infra. Related: [../answers/system-design-payment.md](../answers/system-design-payment.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** private-capital platform — portable “fintech” is weak.
2. Practical: model a cap-table event (issue / transfer / cancel) with an audit trail.
3. Design: capital call across entities — idempotency, reconciliation, a failed wire.
4. Principle: Velocity — you cut scope to ship the aimed slice.
5. Questions for them: take-home vs live, pool vs team, AI-in-eval, stack.

## Prep checklist

- [ ] Read [Engineering careers / How we hire](https://carta.com/careers/engineering/) + [Careers OPs](https://carta.com/careers/)
- [ ] Recruiter: take-home vs live, pooled match, languages, AI policy
- [ ] One practical exercise + one ledger / waterfall sketch
- [ ] STAR vs Mastery / Velocity / Impact / Helpful & Kind
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Build the infrastructure for private capital — Carta Engineering](https://carta.com/careers/engineering/) — accessed 2026-10-12
- [Let’s build the future of private capital — Carta Careers](https://carta.com/careers/) — accessed 2026-10-12
- [Staff Software Engineer — Carta (pooled hire)](https://job-boards.greenhouse.io/carta/jobs/7656155003) — accessed 2026-10-12
- [Software Engineer II @ Carta — interview process (take-home)](https://www.purpose.jobs/discover/companies/carta-com/jobs/26538113-software-engineer-ii) — accessed 2026-10-12
