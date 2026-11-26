# Real-time leaderboard — system design outline

**Prompt:** Design a **real-time leaderboard**: submit scores, show top-N, show **my rank**, show neighbors around me. Classic mid/senior prompt (Meta / Reddit / Walmart game or seller boards). Redis documents this as a first-class [sorted-set](https://redis.io/docs/latest/develop/data-types/sorted-sets/) use case.

**Not** [system-design-metrics.md](system-design-metrics.md) (TSDB / cardinality). **Not** [coding-top-k.md](coding-top-k.md) (offline heap). **Not** [system-design-news-feed.md](system-design-news-feed.md) (fan-out). Here the new work is **rank in O(log N) under a write-heavy score stream**.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Ingest score updates (set or increment) | p99 rank / top-N in a few ms |
| Top-N page (e.g. 100) with display names | Millions of members; bursty writes (match end) |
| Exact rank for the caller | Daily / weekly / season boards that expire |
| Neighbors: ±k around me | Ties: define order (score, then time or id) |
| Optional: around-me on a friends board | Eventual seconds of lag on replicas is usually OK |

Out of scope unless asked: matchmaking, anti-cheat, payments, replay of every historical score.

## Estimation sketch (example)

~10M DAU, ~50 score writes/s average, **10k/s** at season peaks. Top-N is almost all reads. A SQL `ORDER BY score` on every request is O(N) and dies. Redis: one ZSET, `ZADD` / `ZREVRANK` / `ZREVRANGE` are **O(log N)**; official [leaderboard](https://redis.io/docs/latest/develop/use-cases/leaderboard/) note: millions of members in hundreds of MB.

## High-level — ordered set, not a table scan

```
Client → score API (idempotent match_id)
        → validate + persist event (log / SQL: player, score, ts)
        → ZADD lb:<game>:<window>  composite_score  player_id
        → HASH player:<id>  {name, avatar}   (keep the ZSET small)
        → cache top-N snapshot (1–2 s TTL)
Read: top-N from cache; my rank = ZREVRANK; around-me = ZREVRANGE offset
```

Wikipedia [skip list](https://en.wikipedia.org/wiki/Skip_list): Redis ZSET is a hash (`member → score`) plus a skip list with **spans**, so rank is a walk that **sums skipped nodes** — not a count of every player. `ZADD` reinserts on score change in O(log N). Official commands: `ZINCRBY` for deltas; `ZREVRANGE 0 N-1 WITHSCORES` for top-N; `ZREVRANK` for 0-based rank from the high end (add 1 for “you are #k”).

Tie-break: pack `score << 32 | (MAX - timestamp)` into the double, or use a second ZSET. State the rule.

## Deep dives

### Windows

One key per board: `lb:game:season-2026`, `lb:game:2026-11-26`. `EXPIRE` the daily key. `ZUNIONSTORE` merges windows if they ask for all-time vs this week — do not sort in the app.

### Sharding (only when one node is not enough)

- **By board / game / season:** each ZSET stays on one shard. Rank is local. This is the default.
- **By player hash:** even memory, but global rank is scatter-gather (`how many scores > mine?` on every shard). Top-N is a k-way merge.
- **By score range:** rank = local rank + `ZCARD` of higher buckets. Players **move** shards when they cross a boundary — two commands, not atomic; low-score shards stay huge.

Start with one primary + read replicas. Cache the hot top-N page so 90% of reads never touch the ZSET.

### Authority

The ZSET is the **serving** copy. Persist the score event first (or dual-write with the log as source of truth) so a Redis flush can rebuild. Do not treat in-memory rank as the ledger.

## Common mistakes

- `SELECT … ORDER BY score` on every profile view.
- One global ZSET for every game forever (hot key + no expiry).
- Promising **exact** rank for 40M players on a 50-shard hash without naming scatter-gather.
- Forgetting ties (two players, same score, flickering rank).
- Putting display names in the ZSET member and breaking `ZADD` identity when someone renames.
- Designing anti-cheat or matchmaking before rank works.

## Sources

- [Redis sorted sets](https://redis.io/docs/latest/develop/data-types/sorted-sets/) — accessed 2026-11-26
- [Redis leaderboard use case](https://redis.io/docs/latest/develop/use-cases/leaderboard/) — accessed 2026-11-26
- [ZADD — Redis](https://redis.io/docs/latest/commands/zadd/) — accessed 2026-11-26
- [ZRANK — Redis](https://redis.io/docs/latest/commands/zrank/) — accessed 2026-11-26
- [Skip list — Wikipedia](https://en.wikipedia.org/wiki/Skip_list) — accessed 2026-11-26
- [Design a real-time leaderboard — AlgoRung](https://algorung.com/system-design/problems/leaderboard) — accessed 2026-11-26
- [Gaming leaderboard — System Design From First Principles](https://firstprinciplesapproach.dev/learn/system-design/case-studies/gaming-leaderboard/) — accessed 2026-11-26
