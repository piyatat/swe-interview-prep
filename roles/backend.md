# Backend engineer

Focus: **APIs, data stores, caching, messaging, security, and distributed architecture**.

## What interviewers probe

| Area | Signals |
| --- | --- |
| REST/HTTP | Resources, status codes, versioning, pagination |
| Auth | Sessions vs JWT, OAuth2 flows, RBAC |
| Databases | Schema design, indexes, transactions, sharding |
| Caching | Redis patterns, invalidation, stampede |
| Messaging | Queues, at-least-once, idempotent consumers |
| Reliability | Retries, circuit breakers, graceful degradation |

## Sample questions

### APIs & HTTP

1. Design a REST API for a bookstore (resources, errors, versioning).
2. How do you implement rate limiting? Compare token bucket vs sliding window.
3. When REST vs gRPC vs GraphQL?
4. How do you design idempotent POST for payments?
5. Explain cursor vs offset pagination for live feeds.

### Databases

1. When NoSQL over SQL? Give an access-pattern example.
2. Explain ACID; when would you relax isolation?
3. How do you debug a slow query?
4. What is connection pooling and why it matters?
5. Explain sharding vs read replicas.

### Caching & performance

1. Cache-aside vs read-through vs write-through.
2. Redis vs Memcached — when which?
3. How does a CDN help API-heavy apps?
4. How do you measure and improve p99 latency?

### System design (backend-flavored)

1. Design a URL shortener at scale.
2. Design a chat system with history and groups.
3. Design a job queue for async image processing.
4. Design rate limiting for a public API (distributed).
5. Explain CAP with a real product tradeoff.

### Security

1. Walk through OAuth2 authorization code flow.
2. Common API vulnerabilities (OWASP API top risks).
3. How do you store passwords? How **not** to?

### Behavioral (backend-specific angles)

1. Production outage you led — detection, mitigation, postmortem.
2. Time you pushed back on a schema migration.
3. Performance regression you diagnosed.

## Level expectations

| Level | Depth |
| --- | --- |
| Junior | CRUD, SQL basics, simple API design |
| Mid | Optimization, integration testing, tradeoff talk |
| Senior | Distributed design, security, mentoring, SLO thinking |

## Also study

- [../general/system-design.md](../general/system-design.md)
- [../general/coding-patterns.md](../general/coding-patterns.md)

## Sources

- [Backend Developer Interview Questions — LastRound AI](https://lastroundai.com/blog/backend-developer-interview-questions) — accessed 2026-08-22
- [Backend Developer Interview Questions — mortit.com](https://mortit.com/blog/backend-developer-interview-questions) — accessed 2026-08-22
- [Backend Preparation Guide — hackajob](https://hackajob.com/en-us/talent/technical-assessment/backend-developer-interview-questions-preparation-guide-for-2025) — accessed 2026-08-22
- [Scalable API Design — InterviewLoop](https://interviewloop.app/articles/scalable-api-design-guide) — accessed 2026-08-22
