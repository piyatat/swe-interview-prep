# News feed / home timeline — system design outline

**Prompt:** Design Instagram / Twitter / Facebook home feed — publish a post, followers see a ranked stream.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Create post (text / media) | Read p99 ~100–200 ms |
| Home feed: recent + ranked | High read:write (often 50:1+) |
| Follow graph | Celebrity authors (10^6–10^8 followers) |
| Optional: unseen badge, mute, delete | Eventual consistency OK for most feeds |

Non-goals until asked: ads, full search, DMs.

## Estimation sketch (example)

- 100M DAU; 20 feed opens/user/day → ~20k feed reads/s average, 10× peak
- 5 posts/user/day → writes much smaller than reads; **fan-out writes** dominate if you push to every follower
- Store **post IDs** in timelines, hydrate bodies from a post cache

## High-level components

```
Client → API → Post service → posts DB + media (S3/CDN)
                 ↓ event (Kafka)
           Fan-out workers → per-user timeline cache (Redis ZSET of IDs)
Client → Feed service → merge inbox + celebrity pull → rank → hydrate
```

## Deep dive — fan-out (the interview)

| Model | Write | Read | When |
| --- | --- | --- | --- |
| **On write (push)** | Copy `post_id` into each follower inbox | O(1) inbox read | Typical authors |
| **On read (pull)** | Write author’s outbox only | Merge followees at read | Celebrities |
| **Hybrid** | Push below a follower threshold (~10k, tunable) | Inbox + pull celeb outboxes, sorted merge | Production default |

Twitter’s public 2013 “Timelines at Scale” talk is the usual citation: spend work on the write path so reads stay cheap, then **skip push** for huge accounts.

**Cache only IDs** (and score/time). Cap inbox length (hundreds). Hydrate post bodies from a post cache; filter deletes at read time if you do not fan-out deletes.

## Ranking & pagination

- Chronological first; then ML rank on a **candidate set** (engagement, recency, relationship, media type).
- **Cursor** `(score, post_id)` — offsets duplicate/skip when new posts arrive.

## Failure / ops

- Fan-out lag → user sees own post (write-through own timeline) while followers catch up
- Hot celebrity post → pull path + CDN for media; do not 50M inbox writes
- Metrics: publish ack latency, fan-out lag, feed p99, cache hit, hydrate miss

## Startup vs FAANG angle

| FAANG | Startup |
| --- | --- |
| Hybrid + ranking stages + multi-region | Chronological inbox in Postgres/Redis |
| Migration / backfill story | One region, skip celebrity special-case until you have one |

## Common mistakes

- Picking only push or only pull
- Storing full post objects in every inbox
- Offset pagination on a live ranked list
- No mention of async workers (user waits on 1M writes)

## Sources

- [Timelines at Scale — Raffi Krikorian, QCon / InfoQ](https://www.infoq.com/presentations/Twitter-Timeline-Scalability/) — accessed 2026-08-22
- [Low Level Design: News Feed Service — techinterview.org](https://www.techinterview.org/post/3233472201/lld-newsfeed/) — accessed 2026-08-22
- [Design a News Feed System — CodeJeet](https://codejeet.com/system-design/design-a-news-feed-system) — accessed 2026-08-22
- [Design a News Feed — Systems Explained](https://systeminternals.dev/system-design-interview/news-feed/) — accessed 2026-08-22
