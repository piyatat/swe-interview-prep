# Job scheduler — system design outline

**Prompt:** Design a **distributed job scheduler**: one-shot, delayed, and cron/recurring work; workers execute handlers; you must survive crashes without silent drops or unbounded duplicate side effects. Classic mid/senior prompt; also shows up as “cron at scale” or “internal async tier.” Databricks-flavored loops mention a scheduler over object storage — same bones.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Create / pause / cancel; cron + one-shot + delay | At-least-once **dispatch**; idempotent **effects** |
| Due-time discovery; retries; DLQ | p99 schedule lag (e.g. seconds), 10M schedules (example) |
| Optional: priorities, DAG/deps, tenants | Missed-run policy after downtime (skip / fire-once / catch-up) |

A **queue is not a scheduler**. The DB owns definitions, recurrence, next run, history. The ready queue holds work that is **due soon**. Google Cloud Scheduler’s public contract: **at-least-once**; handlers must be **idempotent**; `X-CloudScheduler-ScheduleTime` is stable across retries for dedupe.

## Estimation sketch (example)

- 10M active schedules; 100k due/min; 10× top-of-hour spike
- Precision: **minute** vs **second** changes poll vs timing-wheel cost
- History: keep metadata in SQL; dump bulky logs to object storage

## High-level components

```
API → JobDefinition + Run rows (SQL, unique occurrence key)
    → Outbox → Dispatcher → Ready queue (SQS / Kafka)
    → Workers (lease / visibility timeout, heartbeat)
    → Result + audit; DLQ; Reconciler (stuck READY / missing enqueue)
```

Scheduler shards **do not** run the job body. Workers pull; that scales the fleet independently.

## Deep dives

### Models

- **JobDefinition** — schedule, handler, retry policy, version
- **Run** — one occurrence: `(job_id, schedule_version, scheduled_at)` unique
- **Attempt** — worker, lease generation, error class

States: `SCHEDULED → READY → LEASED → SUCCEEDED` (or `RETRY_WAIT` / `DEAD`).

### Finding due work

Small: `next_run_at` index + `FOR UPDATE SKIP LOCKED`. Large: time buckets + hash shards; promote a near-term **horizon** into memory (optional **timing wheel**). Store the rule in the original TZ; materialize instants in UTC. Say the **misfire** policy.

### Leases, not hope

Visibility timeout / lease + heartbeat. Fencing **generation** so a late worker cannot commit after expiry. SQS-style: unacked message reappears — still **at-least-once**.

### Exactly-once (honest)

Worker can finish the side effect and die before ack → retry. Promise **at-least-once dispatch**; engineer **one business outcome** with `execution_id` as the downstream idempotency key, transactional inbox, or reconcile after timeout. Kafka EOS does not extend to “charged the card.” Cloud Scheduler: same job + schedule-time header for handler dedupe.

### Retries and poison

Backoff + **jitter**; cap attempts/age; DLQ is an **alert + redrive** surface, not trash. Isolate tenant / job-class queues so a bad cron cannot starve OTPs (see [system-design-notification.md](system-design-notification.md)).

## Failure / ops

- DB commit, enqueue fail → **outbox + reconciler**
- Clock drift → leader or per-shard ownership; do not trust raw `now()` across regions without saying so
- Metrics: schedule lag, oldest ready age, lease expiries, retry rate, DLQ depth, duplicate suppressions

## Startup vs FAANG angle

| FAANG | Startup |
| --- | --- |
| Sharded wheels, multi-region fencing, fair-share | Cloud Scheduler / EventBridge / one SQS + Postgres + idempotent workers |
| DAG / Temporal-shaped workflows | Cron + a worker pool |

## Common mistakes

- “Exactly-once because Kafka.”
- Cron table as the only queue (full-table poll, thundering herd).
- Unbounded retry; no misfire policy.
- Recurring job without a unique occurrence key → double materialize after a split brain.

## Sources

- [About Cloud Scheduler — Google Cloud](https://cloud.google.com/scheduler/docs/overview) — accessed 2026-08-31
- [Job Scheduler System Design — PracHub](https://prachub.com/resources/job-scheduler-system-design-interview-guide-queues-retries-and-exactly-once-execution) — accessed 2026-08-31
- [Design a Distributed Job Scheduler — System Design Handbook](https://www.systemdesignhandbook.com/guides/design-a-distributed-job-scheduler/) — accessed 2026-08-31
- [Amazon SQS visibility timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html) — accessed 2026-08-31
