# Pub/sub / distributed log — system design outline

**Prompt:** Design a **pub/sub** or **Kafka-like message log**: producers publish to topics; many consumers read independently; survive broker loss; do not pretend exactly-once is free. Complements [system-design-notification.md](system-design-notification.md) (fan-out to devices) and [system-design-job-scheduler.md](system-design-job-scheduler.md) (due work ≠ an event log).

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Publish to a **topic**; subscribe / consume | Throughput (MB/s), p99 produce latency |
| Multiple consumer **groups** (each sees the stream) | Retention (time / size), replay from an offset |
| Optional keys, headers, batching | Order **per partition**, not global |

**Queue vs pub/sub vs log.** A work queue (Rabbit-style) often **deletes on ack** — one consumer wins the message. Pub/sub **fans out** copies. Kafka (official design + Wikipedia): an **append-only partitioned log**; retain for a window; consumers **pull** and store an **offset**. Interview default: **log**, not a pure in-memory bus.

Ask: work-queue (competing consumers) vs broadcast (independent groups)? at-least-once OK?

## Estimation sketch (example)

- 1M events/s × 1 KB → ~1 GB/s ingest; partition until each leader is comfortable
- Retain 7 days → petabyte-class disk if you actually hit that rate — say the number
- Fan-out: 20 groups reading the same topic is 20× read I/O unless pagecache hits

## High-level components

```
Producer  →  partitioner (hash(key) or sticky)  →  partition leader
Broker log: segment files, sequential append, pagecache
Replicas   →  ISR (in-sync) ; controller (KRaft quorum) elects leader
Consumer group  →  one member per partition  →  fetch from offset  →  commit offset
```

Official Kafka: producer talks to the **leader**; consumer **fetches** (“pull”) so a slow reader **lags** instead of being force-fed. Offset is “one integer per partition” — cheap ack.

## Deep dives

### Partitions = order × parallelism

Same **key** → same partition → total order for that key. No key → spread for throughput. **Hot key** (one celebrity user) pins a partition — name split keys or local buffering. A group assigns each partition to **exactly one** member; extra members sit idle unless you add partitions (or use newer **share groups** / “Queues for Kafka” for cooperative consume).

### Durability and delivery

- **acks=all** + min ISR: commit only when replicas have the batch.
- Consume: commit offset **after** side effects → **at-least-once**; before → at-most-once.
- “Exactly-once” is **transactions + idempotent produce** (Kafka docs) inside a limited scope — not a magic consumer flag. Handlers still **dedupe** on `message_id` for money.
- Retention / **compaction** (keep last value per key) vs delete-old-segments.

### Why it is fast (say one sentence)

Official design: **sequential disk + OS pagecache + batched message sets**; `sendfile` from pagecache to socket when TLS is off. Do not invent an in-heap cache that doubles the data and GC-pauses.

## Failure / ops

- Leader dies → controller promotes an ISR replica; producers refresh metadata.
- Consumer crash → rebalance; resume from last **committed** offset (duplicates possible).
- Lag SLO: `group_lag` per partition; scale members **up to partition count**; DLQ after N fails.
- Poison pill: skip + DLQ, or the partition stalls.

## Startup vs FAANG angle

| FAANG / LinkedIn-scale | Startup |
| --- | --- |
| Kafka / Pulsar, KRaft, multi-AZ ISR | Managed pub/sub (GCP / SNS+SQS) + idempotent workers |
| Compaction, EOS for a ledger path | At-least-once + DB unique key |

## Common mistakes

- Global order on a partitioned topic.
- Push from broker to every consumer (no backpressure story).
- Delete-on-read and then promising replay.
- “Exactly-once everywhere” with no txn / dedupe sketch.
- One partition “for simplicity” at 1M/s.

## Sources

- [Design — Apache Kafka](https://kafka.apache.org/43/design/design/) — accessed 2026-09-06
- [Apache Kafka — Wikipedia](https://en.wikipedia.org/wiki/Apache_Kafka) — accessed 2026-09-06
- [Design a Pub/Sub System — System Design Handbook](https://www.systemdesignhandbook.com/guides/design-a-pub-sub-system/) — accessed 2026-09-06
- [Apache Kafka system design — System Design Academy](https://www.systemdesign.academy/interview/design-kafka) — accessed 2026-09-06
- [Design a Distributed Message Queue — SpaceComplexity](https://spacecomplexity.ai/blog/message-queue-system-design) — accessed 2026-09-06
