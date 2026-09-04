# Metrics / monitoring — system design outline

**Prompt:** Design a metrics and monitoring system (Datadog / Prometheus-shaped): hosts and services emit time series; users graph them and get paged when a rule fires. Classic observability prompt; sibling of [system-design-notification.md](system-design-notification.md) (how the page leaves the building) and [system-design-job-scheduler.md](system-design-job-scheduler.md) (alert eval on a clock). Datadog-flavored loops expect this domain — [../companies/datadog.md](../companies/datadog.md).

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Ingest tagged points (name + tags + timestamp + value) | Write-heavy; ack to agent in tens of ms |
| Query: `avg:cpu{env:prod} by {service}` over a window | Dashboard p99 ~0.5–1 s; alert delay ~1 min |
| Alert rules + mute; dashboards | Eventual consistency OK (graph 5 s stale) |
| Retention / downsample | Raw days → 1m weeks → 1h months |

**Out of v1:** full logs, distributed traces, exact-once billing. Wikipedia: a **TSDB** is built for append-only chronological points, compression, and time-range aggregates — not FK-heavy OLTP.

Ask: **push** (Datadog agent) vs **pull** (Prometheus scrape). Interview default: push + buffer; mention pull for service discovery.

## Estimation sketch (example)

- 100k hosts × 100 series × 1 point / 10 s → **1M points/s**
- 1M × 8 B × 86400 ≈ **~0.7 TB/day raw**; compression (Gorilla-class XOR / delta) is why you do not store 16-byte tuples forever
- Reads are rare vs writes. Do **not** write 1M/s through a single SQL primary.

## High-level components

```
Agent / SDK → ingest gateway → Kafka (WAL, partition by series key)
    → writers → hot TSDB (recent points) + tag index
    → downsample / cold object store
Query: parser → index (tag filter → series IDs) → scatter TSDB → merge
Alert: streaming eval on ingest and/or poller + state machine
```

Datadog’s public split is the interview gold: **points** (`series_id, t, value`) vs **index** (`series_id, tags`). A query is “which IDs match these tags?” then “fetch those ranges.” Later they describe unifying the two (Monocle) — say the **problem**, not the product name as a flex.

## Deep dives

### Series identity and cardinality

A series is `metric + sorted tag set`. **Bounded** tags (`env`, `az`, `service`). **Never** `user_id` / request-id as a tag — that is a new series per event and melts the index (Influx and every TSDB post the same warning). Fields vs tags: tags are indexed; high-cardinality dimensions belong on events/logs.

### Storage

Hot path: time-bucketed blocks, shard by hash(series). Wikipedia + Gorilla (VLDB 2015): timestamps compress with **deltas**; floats with **XOR** of consecutive values. Memtable → LSM / immutable segments; queries read a snapshot. Cold: downsample `(min, max, avg, sum, count)` and drop raw.

### Query + alert

Index (inverted tag → series IDs, same idea as [system-design-search.md](system-design-search.md)) then fan-out. p99 is the **slowest** shard. Alerts: duration (“error rate > 5% for 2 min”), not a single blip; hysteresis / mute; page via the notification stack. Monitoring must stay up when the **customer** app is down — isolate the control plane.

## Failure / ops

- Ingest spike → Kafka backlog, not dropped acks; shed **high-cardinality** tenants first
- Missing points → stale-alert vs “no data” policy (say it)
- Metrics: ingest lag, writer drop, query timeout, series-create rate, alert delay

## Startup vs FAANG angle

| FAANG / Datadog-scale | Startup |
| --- | --- |
| Custom hot TSDB + tag index + Kafka | Prometheus + Grafana, or managed (Datadog / Mimir) |
| Cardinality police in the agent | One scrape interval, local disk |

## Common mistakes

- “Postgres + timestamp index” at 1M writes/s with no buffer.
- Treating logs, traces, and metrics as one store.
- Unbounded tags; no downsample plan.
- Alerts on raw 1 s noise with no duration or grouping.

## Sources

- [Time series database — Wikipedia](https://en.wikipedia.org/wiki/Time_series_database) — accessed 2026-09-04
- [Timeseries indexing at scale — Datadog](https://www.datadoghq.com/blog/engineering/timeseries-indexing-at-scale/) — accessed 2026-09-04
- [Evolving our real-time timeseries storage — Datadog](https://www.datadoghq.com/blog/engineering/rust-timeseries-engine/) — accessed 2026-09-04
- [Design a metrics/monitoring system — System Design Interview Handbook](https://www.systemdesigninterview.com/guides/system-design-interview-handbook/819-design-a-metricsmonitoring-system-datadog) — accessed 2026-09-04
- [Design a Metrics and Monitoring System — techinterview.org](https://www.techinterview.org/post/3233462372/system-design-metrics-monitoring/) — accessed 2026-09-04
