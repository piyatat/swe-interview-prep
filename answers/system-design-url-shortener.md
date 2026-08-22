# URL shortener — system design outline

**Prompt:** Design a service like bit.ly — short URLs, redirects, optional analytics.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Shorten long URL → short code | Low redirect latency (p99 < 50ms) |
| Redirect GET short → original | Highly available reads |
| Optional: expiration, custom alias | 100M new URLs/month (scale example) |

## Estimation sketch (example)

- 100M creates/mo ≈ ~40 writes/s average, higher peak
- Read:write often 100:1 → thousands of redirects/s
- Storage: 500B × 100M/mo × 12 mo ≈ 600GB/year order of magnitude

## High-level components

```
Client → LB → API (write/read) → Redis cache → DB
                    ↓
              Analytics queue → workers → OLAP store
```

## Deep dives

### Key generation

- **Base62** counter (Snowflake / DB auto-inc) — no collision check
- Or hash + truncate + collision retry (mention birthday paradox at scale)

### Read path (critical)

- Cache short code → long URL (Redis)
- Cache miss → DB → populate cache
- 301 vs 302 — analytics implications

### Write path

- Validate URL, auth if custom alias
- Insert mapping, warm cache async

### DB choice

- SQL (Postgres) fine at moderate scale; shard by hash of code at huge scale

## Failure / ops

- Hot key on viral link — CDN or regional cache
- DB down — stale cache serve with TTL tradeoff
- Metrics: redirect QPS, cache hit rate, create error rate

## Startup vs FAANG angle

| FAANG | Startup |
| --- | --- |
| Discuss global sharding, multi-region | Single region + managed Postgres + Redis |
| Analytics pipeline depth | Simple click counter table |

## Common mistakes

- Designing before requirements
- No read path optimization
- Ignoring collision strategy

## Sources

- [System Design Master Sheet — Skilled Coder](https://theskilledcoder.com/posts/interview-prep/system-design-preparation-master-sheet) — accessed 2026-08-22
