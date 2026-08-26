# Ride sharing (Uber / Lyft) — system design outline

**Prompt:** Design a ride-hailing marketplace: riders request trips, nearby drivers are matched, both see live location, trip completes and is billed. Classic #6 in [../general/system-design.md](../general/system-design.md). Product-company flavor: [../companies/product-companies.md](../companies/product-companies.md). Object model of a **single trip** is [../general/low-level-design.md](../general/low-level-design.md), not this round.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Request ride, match driver, start / complete / cancel | Match p99 of a few seconds in a city |
| Live location for both parties during the trip | GPS ingest at city scale (state an order of magnitude) |
| ETA + fare quote; optional surge | **One driver, one trip** — no double assign |
| Driver go online / offline | Degrade maps if matching still works |

Non-goals unless asked: carpool matching, full payments PCI, global multi-city in v1 (start with **one city**).

## Estimation sketch (example)

- Drivers ping every few seconds. 50k online drivers × 0.25 Hz ≈ **12.5k location writes/s** in one city — **not** a Postgres row per ping.
- Rider requests are orders of magnitude rarer than pings. Matching is **read-heavy on the geo index**, write-heavy on **trip state**.

## High-level components

```
Rider/Driver apps → API / WebSocket gateway
                 → Location service  → Redis GEO or H3 cells (TTL)
                 → Matching / dispatch → nearby drivers + notify
                 → Trip service      → Postgres state machine
                 → ETA / pricing     → road graph + surge per cell
                 → Kafka (pings, trip events) → analytics
```

Two stores on purpose: **ephemeral location** vs **authoritative trip**. Hello Interview and later writeups treat Redis geo as the interview default; Uber’s own marketplace analysis uses **H3** hexagons (open-sourced). Name both; pick one and go deep.

## Deep dives

### Location plane

- `GEOADD` + radius search (`GEOSEARCH` / legacy `GEORADIUS`): Redis stores lon/lat in a **geohash** scored sorted set. Interview shorthand for “drivers near me.”
- **H3:** lat/lng → 64-bit hex cell; neighbors via `kRing`. Uniform neighbor distance vs square grids; Uber uses it for **pricing and dispatch analysis**, not as a claim that production matching is a single Redis key.
- Shard the geo index by **city or coarse cell** so a SF ping does not hit a global key.
- TTL (e.g. 30s) on the last ping: crashed app → driver disappears without a janitor job.

### Matching (the race)

1. Query k nearby **AVAILABLE** drivers (filter by product: UberX vs XL).
2. Rank by **ETA** (road network), not crow-flies only.
3. Offer one driver; **compare-and-set** driver state `AVAILABLE → OFFERED` (Redis + Postgres version column). If CAS fails, try the next driver.
4. Timeout → release and offer another. Rider cancel → same.

Do not leave “distributed lock” as the only sentence; say **what is locked** (driver id) and **TTL** so a killed matcher cannot hold a driver forever.

### Trip plane

Postgres (or similar) owns `REQUESTED → MATCHED → EN_ROUTE → IN_PROGRESS → COMPLETED | CANCELLED`. Invalid transitions rejected. Billing reads **completed** trips only. Optimistic `version` beats a ZooKeeper lock for this interview.

### Surge and ETA

H3/geohash cell: `open_requests / available_drivers` → multiplier, cached tens of seconds. ETA from a **prebuilt routing graph**, not a live Google call per ping.

### Transport

WebSockets (or similar) for offers, accept, and in-trip location. Polling is a fallback, not the happy path.

## Failure / ops

- Matcher crash mid-offer: lock TTL + trip still `REQUESTED`.
- Redis city shard down: fail matching in that city; do not take down trip history.
- Metrics: ping ingest, match latency, offer accept rate, double-assign incidents (should be ~0), cascade cancels.

## Common mistakes

- GPS in SQL with `Haversine` at 10k writes/s.
- Matching on distance only (river / one-way streets).
- No story for two riders grabbing the same driver.
- Designing payments and the whole maps stack before the geo index.

## Sources

- [H3: Uber’s Hexagonal Hierarchical Spatial Index — Uber Engineering](https://www.uber.com/us/en/blog/h3/) — accessed 2026-08-26
- [GEOADD — Redis docs](https://redis.io/docs/latest/commands/geoadd/) — accessed 2026-08-26
- [Design a Ride-Sharing Service Like Uber — Hello Interview](https://www.hellointerview.com/learn/system-design/problem-breakdowns/uber) — accessed 2026-08-26
- [Ride-Sharing System Design (Uber / Lyft) — intervu.dev](https://intervu.dev/blog/ride-sharing-uber-lyft-system-design/) — accessed 2026-08-26
- [Ride-Sharing System Design Interview — SpaceComplexity](https://spacecomplexity.ai/blog/ride-sharing-system-design-interview) — accessed 2026-08-26
