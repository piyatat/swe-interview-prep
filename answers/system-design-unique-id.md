# Unique ID generator — system design outline

**Prompt:** Design a service that mints **globally unique IDs** at high QPS across many machines. Often: 64-bit, roughly **time-sortable**, no per-ID coordination. Cousin of [system-design-url-shortener.md](system-design-url-shortener.md) (key generation).

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Unique across DC / process restarts | 10k–1M IDs/s class (state a number) |
| Optional: roughly increasing with time | Fit in `int64` / `BIGINT` vs 128-bit UUID |
| Optional: extract timestamp from ID | Availability if one generator dies |

Ask: URL-safe short strings? Strict monotonic across **all** nodes? K-sortable is weaker than a single sequence.

## Estimation sketch (example)

Snowflake-class: 12 sequence bits → **4096 IDs/ms/worker**. 10 machine bits → **1024** generators. Throughput is rarely the hard part; **clocks and worker IDs** are.

## Approaches (tradeoffs, then pick)

| Scheme | Pros | Cons |
| --- | --- | --- |
| DB `AUTO_INCREMENT` | Simple, dense | Single writer / shard bottleneck; not multi-DC |
| UUID v4 | No coordination | 128-bit; random → index fragmentation |
| UUID v7 / ULID | Time-ordered, standard | Still 128-bit; less metadata than Snowflake |
| Ticket / range allocator | Strict order possible | Central dependency; block size vs waste |
| **Snowflake-style** | 64-bit, local, sortable | Needs unique worker IDs; NTP / clock backoff |

Interview default for “64-bit, sortable, high QPS”: **Twitter Snowflake** (2010), widely reused (Discord, etc.).

## Snowflake bit layout (classic)

```
0 | timestamp_ms (41) | machine (10) | sequence (12)
```

- Sign bit 0 so it stays a positive signed 64-bit value.
- 41-bit ms from a **custom epoch** ≈ **69 years**.
- Machine ID often split **5 DC + 5 worker** (original Scala service).
- Sequence resets each millisecond; if it **overflows**, wait for the next ms.

**Uniqueness:** same ms + different machine bits cannot collide; same machine + sequence increments.

**Clock:** original Snowflake **refuses** to mint if the wall clock goes **backwards** (NTP step). Mention NTP discipline or a logical wait. Do not invent IDs from a jumped clock.

**Worker ID assignment:** config, orchestration identity, or a one-time lease (ZooKeeper-style) — coordination at **startup**, not per ID.

## Variants to name

- **Instagram-style:** 41-bit time + **shard** bits + sequence (IDs encode shard).
- **UUID v7:** good default when 128-bit is fine and you want **no** worker registry.
- **URL shortener:** Snowflake + **Base62**; collision-free if the integer space is unique.

## Failure / ops

- Worker ID **reuse** after a crash before the clock catches up → collision risk; hold IDs or persist last timestamp.
- Hot worker vs many workers: sequence overflow vs idle bits.
- Multi-DC: embed DC bits; do not assume global ms uniqueness without them.
- Metrics: IDs/s, clock-skew refusals, sequence saturation.

## Common mistakes

- “Just UUID” without index / size / sort discussion.
- Snowflake diagram with **wrong bit counts**.
- Ignoring **backward clocks**.
- Promising **total** order across machines (only per-ms + machine).
- Central Redis `INCR` as the only plan at huge QPS.

## Sources

- [Snowflake ID — Wikipedia](https://en.wikipedia.org/wiki/Snowflake_ID) — accessed 2026-08-24
- [twitter-archive/snowflake (2010 README)](https://github.com/twitter-archive/snowflake/tree/snowflake-2010) — accessed 2026-08-24
- [Universally unique identifier — Wikipedia](https://en.wikipedia.org/wiki/Universally_unique_identifier) — accessed 2026-08-24
- [Sharding & IDs at Instagram — Instagram Engineering](https://instagram-engineering.com/sharding-ids-at-instagram-1cf5a71e5a5c) — accessed 2026-08-24
- [Design a unique ID generator (2026) — System Design Handbook](https://www.systemdesignhandbook.com/guides/design-a-unique-id-generator-in-distributed-systems/) — accessed 2026-08-24
- [Distributed ID generator (Snowflake) — Vibe Engines](https://vibeengines.com/systemdesign/distributed-id-generator-system-design) — accessed 2026-08-24
