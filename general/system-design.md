# System design

System design interviews test **engineering judgment**: requirements, scale, components, data model, failure modes, and explicit tradeoffs — not buzzword bingo.

## 45–60 minute framework

| Phase | Time | Do |
| --- | --- | --- |
| 1. Scope | 5–8 min | Users, core flows, functional + non-functional reqs, non-goals |
| 2. Estimates | 5 min | DAU, QPS (read/write), storage, bandwidth — back-of-envelope |
| 3. High-level | 10–15 min | Client → LB → services → caches → DB → queues → object store |
| 4. Deep dive | 15–20 min | Critical path: API, data model, hot spots |
| 5. Reliability | 5–10 min | Failures, monitoring, scaling, security, cost |

Always **trace a read and a write** and name failure points.

## Ten classic prompts

1. **URL shortener** — key generation, redirect latency, analytics, collision handling.
2. **Rate limiter** — token bucket vs sliding window; distributed counters (Redis).
3. **News feed / timeline** — fan-out on write vs read; ranking; celebrity problem.
4. **Chat / messaging** — WebSockets, presence, history, ordering, group rooms.
5. **Video streaming** — CDN, encoding pipeline, adaptive bitrate.
6. **Ride sharing / location** — geospatial indexes, matching, surge.
7. **Web crawler** — frontier queue, politeness, dedupe, distributed workers.
8. **Distributed cache** — consistent hashing, eviction, stampede protection.
9. **Search autocomplete** — trie + ranking; prefix indexes; latency budget.
10. **Payment / ledger** — idempotency, exactly-once illusion, reconciliation.

## Concepts to explain cleanly

| Topic | Interview angle |
| --- | --- |
| **Scaling** | Horizontal vs vertical; stateless services |
| **Load balancing** | L4 vs L7; sticky sessions when needed |
| **Caching** | Cache-aside, TTL, invalidation, thundering herd |
| **Databases** | SQL vs NoSQL; sharding vs replication; indexes |
| **Queues** | Async work, spike absorption, retries, DLQ |
| **CAP / PACELC** | Choose consistency vs availability with a real example |
| **API design** | REST vs gRPC vs GraphQL; versioning; pagination |
| **Observability** | Metrics, logs, traces; SLOs and alerting |

## API design talking points (senior)

- **Idempotency keys** for POST that create resources
- **Cursor pagination** for large, live feeds
- **Versioning** — URL vs header; deprecation policy
- **Rate limits** — per user, per IP, per API key
- **Gateway** — auth, TLS, routing, central limits

## Final checklist

- [ ] Requirements and scale stated before boxes-and-arrows
- [ ] Read + write paths traced
- [ ] Bottleneck identified with mitigation
- [ ] Failure handling: timeouts, retries, idempotency, degradation
- [ ] Monitoring: what alerts fire first?
- [ ] Tradeoffs named (cost, complexity, latency, consistency)

## 2025–2026 additions

Interview loops increasingly add **AI/ML system design** (RAG, recommendation, LLM serving), **cost optimization**, and **security/privacy** as baseline — not optional deep dives at staff level.

## Sources

- [System Design Preparation Master Sheet — Skilled Coder](https://theskilledcoder.com/posts/interview-prep/system-design-preparation-master-sheet) — accessed 2026-08-22
- [System Design Checklist — happysnaker](https://happysnaker.github.io/system-design-checklist/) — accessed 2026-08-22
- [Scalable API Design Guide — InterviewLoop](https://interviewloop.app/articles/scalable-api-design-guide) — accessed 2026-08-22
- [System Design Interview 2025 Guide — youngju.dev](https://www.youngju.dev/blog/culture/2026-03-22-system-design-interview-2025-complete-guide.en) — accessed 2026-08-22
