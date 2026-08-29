# SQL interviews (SWE)

Backend, full-stack, and data loops still run a **SQL hour** (or 15 minutes at the end of a coding screen). 2026 guides score **production reasoning** — isolation, plans, window functions — not “what does `INNER JOIN` mean.” Distinct from the five-bullet DB list in [cs-fundamentals.md](cs-fundamentals.md). Data/ML roles go deeper: [../roles/data-ml.md](../roles/data-ml.md).

Ask the recruiter: live CoderPad SQL, take-home `.sql`, or whiteboard only.

## What they score

| Signal | Weak | Strong |
| --- | --- | --- |
| **Intent** | Recite JOIN types | Translate a business question, then write the query |
| **Correctness** | Forget `NULL`, duplicates, grain | State the grain; `COUNT(*)` vs `COUNT(col)`; `LEFT JOIN` + filter trap |
| **Concurrency** | “Transactions are ACID” | Name the anomaly; pick an isolation level; say when to retry |
| **Performance** | “Add an index” | `EXPLAIN` shape, selectivity, covering vs write cost |

## Isolation (Postgres-shaped)

SQL standard names four levels; Postgres implements three. Official table (dirty / nonrepeatable / phantom / serialization anomaly):

| Level | What interviewers want you to say |
| --- | --- |
| **Read committed** (PG default) | Snapshot **per statement**. Two statements in one txn can see different committed rows. |
| **Repeatable read** | Snapshot **per transaction**. PG also blocks phantoms here. Must **retry** on serialization failure. |
| **Serializable** | Effect of some serial order. Same retry contract. Use for inventory / double-spend-style invariants. |

Postgres **Read uncommitted** behaves like read committed (MVCC). Dirty reads are not the interesting story — **lost updates**, **write skew**, and “do we retry `40001`?” are.

**Prompt:** two checkouts decrement the same SKU. What isolation + app pattern? Strong shape: `UPDATE … WHERE stock >= n` returning row count, or serializable + retry, or a reservation row with a unique constraint.

## Window functions

Postgres: a window computes over related rows **without collapsing** them (`OVER`). `PARTITION BY` splits groups; `ORDER BY` inside `OVER` sets peer order and the default frame (start of partition → current peer).

Interview staples (shape, not a script):

1. **Nth salary / top-N per group** — `DENSE_RANK()` or `ROW_NUMBER()` in a subquery, then filter. `ROW_NUMBER` breaks ties arbitrarily; `DENSE_RANK` keeps ties.
2. **Dedupe** — `ROW_NUMBER() OVER (PARTITION BY natural_key ORDER BY updated_at DESC)` and keep `= 1`.
3. **Running total** — `SUM(amt) OVER (PARTITION BY acct ORDER BY ts)`.
4. **Gaps-and-islands / sessionize** — date diffs or `LAG` then a cumulative sum of “new session” flags.

Windows are illegal in `WHERE` / `GROUP BY` — wrap them, then filter (`pos < 3`).

## EXPLAIN (do not memorize cost numbers)

Postgres `EXPLAIN` shows the **planner** (scan type, join algo). `EXPLAIN ANALYZE` **runs** the statement and adds actual time/rows — do not `ANALYZE` a `DELETE` in prod by accident.

Narrate:

1. Seq scan vs index scan vs bitmap — expected vs actual rows (stats stale?).
2. Nested loop vs hash vs merge join — which side is inner.
3. Sort / `WindowAgg` cost if you used `OVER`.
4. Fix: selective index matching `WHERE` + join keys; rewrite correlated subquery → join / window; avoid wrapping the indexed column in a function.

## Sample prompts

1. Users who purchased in March but not April (`LEFT JOIN` + `IS NULL`, or `NOT EXISTS`).
2. Latest order per customer (window or `DISTINCT ON` in PG).
3. This query is 8s — here is `EXPLAIN ANALYZE`. What do you change first?
4. Recursive org chart (`WITH RECURSIVE`) plus a cycle guard.
5. Two sessions: dirty vs nonrepeatable vs phantom — give a one-row story for each.

## Common mistakes

- `WHERE right.col = x` after a `LEFT JOIN` (turns it into an inner join).
- Selecting non-grouped columns without an aggregate or window.
- `BETWEEN` on timestamps that drops the last day (use `[start, next_day)`).
- Floats for money; use integer cents.
- “Serializable so we never retry.”

## Sources

- [PostgreSQL 13.2. Transaction Isolation](https://www.postgresql.org/docs/current/transaction-iso.html) — accessed 2026-08-29
- [PostgreSQL 3.5. Window Functions](https://www.postgresql.org/docs/current/tutorial-window.html) — accessed 2026-08-29
- [PostgreSQL 14.1. Using EXPLAIN](https://www.postgresql.org/docs/current/using-explain.html) — accessed 2026-08-29
- [SQL Interview Questions 2026 — AI2SQL](https://builder.ai2sql.io/blog/sql-interview-questions) — accessed 2026-08-29
- [40 SQL Interview Questions (2026) — Dev Encyclopedia](https://devencyclopedia.com/blog/sql-database-interview-questions) — accessed 2026-08-29
