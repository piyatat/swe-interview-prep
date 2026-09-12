# Ticket booking (Ticketmaster) — system design outline

**Prompt:** Design Ticketmaster / BookMyShow: browse events, pick **named seats**, pay, get a ticket. Users must never be sold the **same seat twice**.

This is **strong consistency on inventory**, not QPS theater. Browse can be AP + stale; checkout is CP. Different from [system-design-payment.md](system-design-payment.md) (money movement) and [system-design-ride-sharing.md](system-design-ride-sharing.md) (fungible geo match). Hello Interview (Feb 2026): availability for search; **consistency for booking**.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| List / search events; render a seat map | Search p95 ≪ 500 ms; browse 100:1 vs book |
| Hold seats → pay → confirm | **No double sell**; holds expire |
| Cancel / expire returns inventory | Hot onsale: millions of waiters, tens of thousands of seats |

Non-goals unless asked: dynamic pricing, resale marketplace, full PCI (use a PSP), GDPR deep-dive.

**Named seat ≠ flash-sale SKU.** “1 GA ticket” is a counter (`DECR`). “Sec 103 Row K Seat 14” is a **unique row**. Per-seat locks beat one hot counter — and force a **seat-map cache** problem.

## Estimation sketch (example)

- Browse: cache + search index. Book: tiny write QPS **after** a waiting room.
- Hold window (often ~8–10 min) × concurrent checkouts = seats in limbo. Say the tradeoff.

## High-level

```
Client → CDN / API
       → Search / event catalog (cached, AP)
       → Virtual waiting room (admit ≤ booking capacity)
       → Booking: SET seat:{event}:{id} token NX PX hold_ms
       → Payments (idempotency key) → unique (event, seat) row = sold
Seat map: compact bitmap / snapshot, not 60k Redis GETs per render
```

Two paths: **read-your-catalog** vs **linearize holds**. Never cache “this seat is free” as truth.

## Deep dives

### Hold, then pay (two-phase)

Hello Interview: ticket states **available / reserved / booked** (or reserved-but-expired). Short DB txn: `available → reserved` + expiry, **or** Redis hold then one commit.

Official Redis lock pattern: `SET resource token NX PX ttl_ms`. Unlock only if the value still matches (Lua / `DELEX IFEQ`) so an expired holder cannot delete the **next** owner’s key. Do **not** `SETNX` then `EXPIRE` (crash = forever lock).

DB **UNIQUE (event_id, seat_id)** on sold rows is the last belt. Redis is the fast gate; Postgres is the truth.

### Virtual waiting room

Hot onsale: most people will **not** get a seat. Admit a leaky-bucket of users into booking; everyone else waits (Redis ZSET / queue position). Bots (Verified Fan, device signals) are product, not an afterthought — mention, then return to inventory.

### Payment saga

Reserve → charge PSP → mark sold. Client timeout after charge: **same idempotency key**. Hold TTL vs 3DS latency is the pivotal tradeoff. Abandoned checkout: TTL frees the seat; do not wait on a cron if Redis expiry is the timer.

## Failure / ops

| Failure | Response |
| --- | --- |
| Two clicks on 14K | One `NX` wins; the other sees `SEAT_UNAVAILABLE` |
| Holder dies mid-pay | TTL releases; unique index blocks a double confirm |
| Waiting room overflow | Queue, don’t melt booking |
| Seat-map stale | Optimistic: click may fail; poll / push invalidation |

Metrics: hold→sold conversion, expired-hold rate, double-book attempts (must be 0), queue wait, map staleness.

## Common mistakes

- One Redis counter for the venue (GA thinking on reserved seating).
- Long interactive DB transactions for the whole checkout.
- Caching availability as authoritative.
- `DEL` lock without a token check.
- Designing fraud ML before the hold/pay state machine.

## Sources

- [Design a Ticket Booking Site Like Ticketmaster — Hello Interview](https://www.hellointerview.com/learn/system-design/problem-breakdowns/ticketmaster) — accessed 2026-09-12
- [SET — Redis docs](https://redis.io/docs/latest/commands/set/) — accessed 2026-09-12
- [Distributed locks — Redis docs](https://redis.io/docs/latest/develop/clients/patterns/distributed-locks/) — accessed 2026-09-12
- [Design a Ticketing System — HLD Handbook](https://hld.handbook.academy/curriculum/case-studies/ticketing-system/) — accessed 2026-09-12
- [Ticketmaster system design — SpaceComplexity](https://spacecomplexity.ai/blog/ticketmaster-system-design-interview) — accessed 2026-09-12
