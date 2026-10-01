# Grafana Labs engineering track

Sits beside [datadog.md](datadog.md) and [elastic.md](elastic.md): **open-source observability (LGTM: Loki / Grafana / Tempo / Mimir)**, not a closed-source SaaS loop. Official [Careers](https://grafana.com/careers/): **100% remote**, outcomes over hours. Official [Hiring Guide](https://grafana.com/careers/interviewing/) + [backend hiring write-up](https://grafana.com/blog/inside-grafana-labs-hiring-process-for-backend-engineers/) are the process sources of truth. Recruiter confirms **backend vs frontend vs observability product**, language (Go is common), and whether you get **NALSD vs a take-home**.

Typical timeline **3–5 weeks** (2026 guides; distributed calendars stretch). Metrics: [../answers/system-design-metrics.md](../answers/system-design-metrics.md). Pair: [../general/pair-programming.md](../general/pair-programming.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (guiding principles)

Do **not** invent Amazon-style LPs. Use the official principles on [Careers](https://grafana.com/careers/).

| Official principle | What they score |
| --- | --- |
| **Long-term greedy** | Enduring value over a cheap ship |
| **Souls intact** | Integrity you would still respect in a decade |
| **Do (and say) the hard things** | Direct, kind conflict; cost of avoidance |
| **Ship constantly** | Early / often; learn from production |
| **We are all in customer success** | Customer problem crosses org lines |
| **Seek diverse perspectives** | Cross-team, not local optima |
| **Roll your sleeves up** | Hands in the details of the domain |
| **Help each other thrive** | Lift others under pressure |
| **Default to transparency** | Public forums; explain when you cannot |
| **Make the work matter** | Impact over busywork |

Official hiring guide: **no jerks**; technical skill does not outweigh behavior. They **use AI** for JDs / prep / efficiency and **never** for hire/reject — humans decide. “Why Grafana?” that only says “I use dashboards / remote / OSS” fails. Name a **cardinality, scrape, or query-fan-out** problem you have lived.

## Official + reported process

Official careers + backend blog publish the **skeleton**. 2026 guides (techinterview.org) — treat extra hours as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter | Role, remote life, questions; they stay with you |
| Hiring manager (official backend: 45 min) | Recent production work; mutual fit |
| Practical challenge | Careers: coding / presentation / take-home — **no trick questions** |
| Coding exercise (official backend: 60 min, two engineers) | Collaborative; **how you think**, not a silent contest |
| Non-abstract system design (official backend: 60 min) | Google-style **NALSD**: vague prompt; reason **upward** |
| Wayfinder (careers: senior / sales) | Cross-functional values check |
| Decision | Official: aim **two business days** after final; live debrief |

Official NALSD: they watch you go from **knowing little** to a proposed system. Subject-matter trivia can **hurt** if you skip the reasoning.

## How this track differs

| vs Datadog / Elastic | vs FAANG |
| --- | --- |
| Official **remote-first** + published principles | Design is **telemetry / TSDB / query**, not “design Twitter” |
| Official **NALSD** + collaborative coding | Coding is **practical** (parse, queue, state machine) more than Blind-75 theater |
| Humans, not models, make the hire call | OSS / “build in public” stories land; closed-source heroics less so |

## Coding and design flavor

Official backend coding: a **real work-shaped** problem; pair is normal because the company is remote. Guides: Go, parsers, bounded workers, retries. Official design: take a vague system and name write path vs read path, cardinality, and what you would measure. Related: [../general/low-level-design.md](../general/low-level-design.md), [../answers/system-design-metrics.md](../answers/system-design-metrics.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** OSS observability company — a cardinality or on-call call you owned.
2. Pair: parse a log / Prom-style line; narrate; ask when the spec is open.
3. NALSD: ingest + query a high-cardinality metric stream; split write vs read.
4. Principles: default to transparency — a time you published the ugly number.
5. Questions for them: LGTM team, NALSD vs take-home, AI-in-pad.

## Prep checklist

- [ ] Read [guiding principles](https://grafana.com/careers/) + [hiring guide](https://grafana.com/careers/interviewing/) + [backend hiring](https://grafana.com/blog/inside-grafana-labs-hiring-process-for-backend-engineers/)
- [ ] Recruiter: language, NALSD vs take-home, Wayfinder, AI policy
- [ ] Timed pair + one metrics / log ingest design
- [ ] Four STAR stories mapped to principles (hard things, ship, customer, transparency)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers at Grafana Labs](https://grafana.com/careers/) — accessed 2026-10-01
- [Grafana Labs Hiring Guide](https://grafana.com/careers/interviewing/) — accessed 2026-10-01
- [Inside Grafana Labs’ hiring process for backend engineers](https://grafana.com/blog/inside-grafana-labs-hiring-process-for-backend-engineers/) — accessed 2026-10-01
- [Grafana Labs Interview Guide (2026) — techinterview.org](https://www.techinterview.org/companies/grafana-labs-interview-guide/) — accessed 2026-10-01
