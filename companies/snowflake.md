# Snowflake engineering track

Sits beside [databricks.md](databricks.md): **cloud data platform**, not a consumer social app. Official careers page: four engineering stages, **about 2–4 weeks**, mix may vary by team; you may be asked to **one in-person** interview. After the loop they run **references and a background check**. Recruiter is the source of truth for **core engine vs AI/platform vs frontend** and AI policy.

Confirm **level** and whether you get a **SQL / data** hour. Design prompts skew **storage–compute split, warehouses, metadata**, not “design Twitter.” SQL literacy: [../general/sql-interviews.md](../general/sql-interviews.md). Concurrency: [../general/cs-fundamentals.md](../general/cs-fundamentals.md).

## Official process (careers / How we hire)

| Stage | Official note |
| --- | --- |
| 1. Initial screen | **30 min** — often hiring manager or recruiter first |
| 2. Technical interviews | **60 min each** |
| 3. Panel | **three to five × 60 min** |
| 4. Decision | Offer + onboarding if both sides match |

If you hear nothing **30 days** after apply, treat it as a no-match on that req (their wording) and keep applying. They point candidates at an official blog: [How (and When) to Use AI in Your Snowflake Interview](https://careers.snowflake.com/us/en/blogarticle/ai-cheat-sheet-how-and-when-to-use-ai-in-your-snowflake-interview) — **ask the recruiter** what is allowed **live**; do not assume Copilot in the panel.

## Architecture talking points (SIGMOD 2016 + docs)

Interviewers expect you to **reason from the public architecture**, not recite the paper. Official PDF: **multi-cluster, shared-data** — storage and compute **decoupled**.

| Layer (paper) | Interview implication |
| --- | --- |
| **Data storage** | Tables as immutable files in object storage (S3-class); durability is the blob store’s job |
| **Virtual warehouses** | Elastic **compute clusters**; credits while **running**; scale for concurrency vs size for a heavy query |
| **Cloud services** | Parser, optimizer, transactions, **metadata**, IAM — the “brain” |

Docs: a warehouse is a cluster used for SQL and DML; **Standard** vs **Snowpark-optimized** (memory-heavy / ML). **Multi-cluster** warehouses add clusters for **user/query concurrency**. Local **cache** on compute nodes (paper) — cold start after resume is a real tradeoff; say it.

Other paper features worth one sentence each: **VARIANT** / semi-structured with columnarization; **time travel** and **zero-copy clone** via immutable files + MVCC; no user-facing “tuning knobs” as the SaaS pitch.

Do **not** design a shared-nothing warehouse that **reshuffles all data** when you add nodes — that is the coupling they left.

## How this track differs

| vs FAANG | vs Databricks |
| --- | --- |
| Design is **warehouse / catalog / scheduler** shaped | Same data-platform family; Snowflake leans **SQL + credits + isolation** |
| Coding follow-ups often get a **DB accent** (runs, skew, memory) | Databricks names a **concurrency / system-programming** panel more explicitly |
| Values / HM close the loop | Both: official docs first, then confirm the 2026 slate |

## Reported 2026 loop (guides; confirm)

Guides stretch the official “technical + panel” into: recruiter → **60 min** coding phone (sometimes SQL bolted on) → virtual onsite of coding + **infra design** + optional **SQL** + values + HM. Senior loops may add a **short project talk**. interviewing.io (older) described a **2-hour** phone that bundled coding **and** design — ask which you have.

| Axis | Show |
| --- | --- |
| Elasticity / cost | When to **resize** vs **multi-cluster**; suspend idle compute |
| Isolation | Warehouses do not stomp each other’s CPU; metadata is shared |
| Query shape | Pruning, skew, late events, VARIANT flatten — not only window syntax |
| Failure | Warehouse resume, cache miss storm, metadata as SPOF |

Design shapes (not leaked puzzles): **result cache** across tenants; **metadata catalog** for millions of files; **quota / credits**; **query scheduler** over object storage; “one partition is huge.”

## Sample prompts (shapes)

1. Why separate storage and compute? What breaks if you couple them again?
2. Design a **multi-tenant result cache** — correctness, eviction, tenant isolation.
3. Thread-safe structure, then a **skewed key** / memory-cap follow-up.
4. SQL: window + dedup + a VARIANT field; then “what does the plan do at 100×?”
5. A time you chose **cost vs latency** with a number.

## Prep checklist

- [ ] Official hire page + AI interview blog + recruiter AI/live-tool rule
- [ ] Read SIGMOD 2016 (architecture sections) + warehouse docs
- [ ] One **warehouse-shaped** design mock (credits, isolation, metadata)
- [ ] Coding + one concurrent / memory-bounded extension
- [ ] If SQL hour: windows, flatten, EXPLAIN intuition ([sql-interviews.md](../general/sql-interviews.md))
- [ ] Contrast Databricks only if asked — do not trash-talk

## Sources

- [Hiring Process — Snowflake Careers](https://careers.snowflake.com/us/en/gethired) — accessed 2026-08-30
- [AI in your Snowflake interview — Snowflake Careers](https://careers.snowflake.com/us/en/blogarticle/ai-cheat-sheet-how-and-when-to-use-ai-in-your-snowflake-interview) — accessed 2026-08-30
- [The Snowflake Elastic Data Warehouse (SIGMOD 2016 PDF)](https://www.snowflake.com/wp-content/uploads/2019/06/Snowflake_SIGMOD.pdf) — accessed 2026-08-30
- [Virtual warehouses — Snowflake Docs](https://docs.snowflake.com/en/user-guide/warehouses) — accessed 2026-08-30
- [Snowflake technical interview 2026 — TechScreen](https://techscreen.app/articles/snowflake-technical-interview-process-2026) — accessed 2026-08-30
- [Snowflake interview process — interviewing.io](https://interviewing.io/snowflake-interview-questions) — accessed 2026-08-30
