# ClickHouse engineering track

Sits beside [snowflake.md](snowflake.md) and [cockroach.md](cockroach.md): **columnar OLAP / real-time analytics** (open-source ClickHouse + ClickHouse Cloud) — not a warehouse SQL hour and not Raft distributed SQL. Official [Careers](https://clickhouse.com/company/careers): *the leading data platform for AI*; 25+ countries, remote-first, offsites. Recruiter confirms **core C++ vs Cloud / control plane vs Postgres-adjacent vs frontend**, Go vs C++ vs TypeScript, and take-home vs live pair.

Typical timeline **~4–6 weeks** (Dataford). SQL: [../general/sql-interviews.md](../general/sql-interviews.md). Metrics / ingest: [../answers/system-design-metrics.md](../answers/system-design-metrics.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Do **not** invent Amazon LPs. Official [Careers](https://clickhouse.com/company/careers) lists **five**. Map **your** stories.

| Official value | What they score |
| --- | --- |
| **Customer first** | Their query / ingest pain is your problem |
| **Distributed** | You ship across time zones without a hallway |
| **Empathy at work** | Humility; you asked before assuming |
| **Diversity** | A perspective that changed the design |
| **Trust** | Ownership + accountability while remote |

Core C++ JDs (Ashby): query / distributed-query optimization, aggregation / joins, SIMD, performance tests, **on-call + open-source community**. “Why ClickHouse?” that only says “fast OLAP / I like databases” fails. Name a **scan, merge-tree, or tail-latency** problem you have lived.

## Official + reported process

Official careers page is a **seven-step** list (apply → recruiter → HM → team → leadership → offer / references → welcome). It does **not** name a LeetCode contest. Dataford (2026-09) adds technical screens, take-home, live pairing — treat those as **reported**. **Ask**.

| Stage | Official / reported |
| --- | --- |
| Apply | [Careers](https://clickhouse.com/company/careers) / [Ashby](https://jobs.ashbyhq.com/clickhouse); “a real person reads it” |
| Intro recruiter | You, the role, what you want |
| Hiring manager | Daily work + depth of experience |
| Meet the team | Current projects; relevant skills (Dataford: coding / take-home / pair) |
| Meet leadership | How the team hits company + customer goals |
| Offer | Professional **reference check** + offer conversation |

Guides: large-file / streaming aggregates, cloud-native deploy, columnar vs row store. Pair: [../general/cs-fundamentals.md](../general/cs-fundamentals.md), [../general/take-homes.md](../general/take-homes.md).

## How this track differs

| vs Snowflake / Cockroach | vs FAANG |
| --- | --- |
| Official **five values** + numbered hire list; remote-first | Design is **ingest / MergeTree / fan-out**, not a social feed |
| Core loop is **C++ engine** or Cloud control plane — confirm | Coding is often **systems / streaming**, not Blind-75 bingo |
| Open-source review + customer on-call show up on JDs | Official closer includes **references** |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** OLAP engine — Customer first + Trust on a latency or correctness miss.
2. Stream top-k from a file too large for RAM (heap + one pass).
3. Design: ingest millions of rows/s, then `GROUP BY` with a late dimension.
4. Columnar vs row: when you would **not** pick ClickHouse.
5. Questions: core C++ vs Cloud, take-home vs pair, AI-in-pad, on-call.

## Prep checklist

- [ ] Read [Careers / values](https://clickhouse.com/company/careers) + current SWE JD (C++ vs Go vs TS)
- [ ] Recruiter: team, language, take-home vs live, AI-in-pad, country / PEO
- [ ] Three STAR mapped to **named** values (not “I work hard”)
- [ ] One timed medium (heap / stream) + one ingest / MergeTree / replica sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — ClickHouse](https://clickhouse.com/company/careers) — accessed 2026-11-14
- [Core Software Engineer (C++) — ClickHouse (Ashby)](https://jobs.ashbyhq.com/clickhouse/368bda6e-28bf-43ff-b2ec-3e3a6ad66a8d/) — accessed 2026-11-14
- [Open positions — ClickHouse (Ashby)](https://jobs.ashbyhq.com/clickhouse) — accessed 2026-11-14
- [Clickhouse Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/clickhouse/software-engineer) — accessed 2026-11-14
- [How ClickHouse, Inc. Is Building a Best-in-Class Engineering Culture — Index Ventures](https://www.indexventures.com/perspectives/how-clickhouse-inc-is-building-a-best-in-class-engineering-culture/) — accessed 2026-11-14
