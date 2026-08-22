# Rate limiter — system design outline

**Prompt:** Design API rate limiting — e.g. 100 requests/minute per user or API key.

## Requirements

| Functional | Non-functional |
| --- | --- |
| Allow/deny request with clear headers | Low overhead per request |
| Per user, per IP, or per API key | Distributed across N API servers |
| Optional burst | Accurate enough (not perfect global sync) |

## Algorithms (name tradeoffs)

| Algorithm | Pros | Cons |
| --- | --- | --- |
| **Token bucket** | Allows burst | State per key |
| **Fixed window** | Simple | Spike at window edge |
| **Sliding window log** | Accurate | Memory heavy |
| **Sliding window counter** | Hybrid approximate | Good production choice |

## Architecture

```
Client → API Gateway / middleware → Rate limit service → Redis (counters)
                ↓
           Upstream services
```

- **Redis:** `INCR` with TTL, or sorted sets for sliding window
- **Local cache + Redis** for hot keys (mention stale allowance)

## Response contract

- `429 Too Many Requests`
- Headers: `X-RateLimit-Limit`, `Remaining`, `Reset`

## Failure modes

- Redis down: fail open vs closed — **product decision** (payments fail closed)
- Clock skew across nodes — use Redis central time

## Follow-ups

- Global vs per-region limits
- Different tiers (free vs paid)

## Sources

- [Scalable API Design — InterviewLoop](https://interviewloop.app/articles/scalable-api-design-guide) — accessed 2026-08-22
