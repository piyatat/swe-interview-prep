# Distributed cache — system design outline

**Prompt:** Design a distributed cache like Redis / Memcached — get/set, TTL, scale beyond one box, survive node loss.

Listed as classic prompt #8 in [../general/system-design.md](../general/system-design.md). Coding cousin: [coding-lru-cache.md](coding-lru-cache.md) (single-process O(1) LRU, not the cluster).

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| `GET` / `SET` / `DEL`, optional TTL | p99 GET in ~1 ms in-region |
| Evict under memory cap | Horizontal scale; add/remove nodes |
| Optional: replication, namespacing | Cache is **not** source of truth |

Ask: read/write ratio, value size, hit-rate target, whether **client-side routing** is OK.

## Estimation sketch (example)

- 1M QPS reads, 10:1 read:write, 2 KB values, 80% hit rate
- Working set 400 GB → many **64 GB** nodes, not one giant box
- Miss path must not melt the DB (stampede)

## High-level

```
App → (optional proxy: Twemproxy / mcrouter)
        → cache nodes (shards)
DB / origin  ← only on miss
```

**Smart client** (Memcached-style): hash in process, one hop. **Proxy**: connection pooling, failover, coalescing; extra hop.

## Deep dives

### Placement: why not `hash(key) % N`

Adding a node remaps **almost every** key. **Consistent hashing** (Karger et al., 1997): map nodes and keys onto a ring; key owned by next node clockwise. On join/leave, only ~**K/N** keys move. **Virtual nodes** (many points per physical box) fix skew and spread a dead node’s load.

**Redis Cluster is not a hash ring.** Official docs: **16,384 hash slots**, `CRC16(key) mod 16384`, slots assigned to masters and **migrated** as units. Gossip carries a slot bitmap (~2 KB). **Hash tags** `{user123}` colocate keys for multi-key ops. Say this if they ask “how does Redis actually shard?”

### Write policies

| Policy | Behavior | Interview default |
| --- | --- | --- |
| **Cache-aside** | App GET cache; miss → DB → SET cache. Write DB then **invalidate** (or SET) | Yes — read-heavy, unpredictable keys |
| Write-through | Write cache + DB in the same path | Need read-after-write freshness |
| Write-behind | Write cache, async DB | Higher write QPS; durability risk |

Cache-aside does **not** guarantee consistency with the DB (another writer, replication lag). Always pair with **TTL**.

### Eviction

Name **capacity + policy**. Redis: `maxmemory` + `maxmemory-policy`. Interview default **`allkeys-lru`** (hot subset / Pareto). **LFU** if a stable popular set beats recency. Redis LRU/LFU are **sampled approximations**, not exact LRU lists (memory). Always set **TTLs** even with LRU.

### Stampede / hot key

- Many clients miss the same key → **thundering herd** on origin.
- **Coalesce**: single-flight in-process; across boxes, lock (`SET NX PX`) so one filler runs.
- **Hot key**: replicate the value to more nodes, local cache, or request coalescing at the proxy. Hash slots **cannot split** one key — say that for Redis.

### Replication / failover

Async replica per shard; promote on primary death; accept a short window of loss if they chose AP. Client must handle **MOVED/ASK** (Redis) or ring rebuild.

## Failure / ops

- Cache down: **fail open** to DB with shed/load limits, or serve stale. Product call.
- Metrics: hit rate, evictions, p99 GET, miss QPS to origin, hot-key cardinality.
- Do not cache secrets / per-user private blobs in a shared cluster without key design.

## Common mistakes

- Stopping at “put Redis in front of Postgres.”
- `mod N` without mentioning remapping.
- Calling Redis Cluster “consistent hashing.”
- No stampede story.
- Treating cache as durable storage.

## Sources

- [Consistent hashing — Wikipedia](https://en.wikipedia.org/wiki/Consistent_hashing) — accessed 2026-08-27
- [Redis Cluster specification](https://redis.io/docs/latest/operate/oss_and_stack/reference/cluster-spec/) — accessed 2026-08-27
- [Redis Cluster scaling (hash slots)](https://redis.io/docs/latest/operate/oss_and_stack/management/scaling/) — accessed 2026-08-27
- [Redis key eviction](https://redis.io/docs/latest/develop/reference/eviction/) — accessed 2026-08-27
- [Cache-Aside pattern — Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/patterns/cache-aside) — accessed 2026-08-27
- [Distributed cache interview walkthrough — SpaceComplexity](https://spacecomplexity.ai/blog/distributed-cache-system-design) — accessed 2026-08-27
