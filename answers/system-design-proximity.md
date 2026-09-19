# Proximity / nearby search (Yelp) — system design outline

**Prompt:** Design “businesses / places near me”: a lat/lng + radius (or map box) + filters (category, open now) → ranked list. Classic geo hour; sibling of [system-design-ride-sharing.md](system-design-ride-sharing.md) (dynamic drivers + trip CAS) and [system-design-search.md](system-design-search.md) (inverted text, not space).

Here the scored part is **candidate generation in 2D**, then rank. POIs are **mostly static**; pings are not 10k writes/s.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Nearby query: center + radius or viewport | p99 tens–low hundreds of ms in-region |
| Filters: category, price, open hours | 10M–100M POIs (they will scale the number) |
| Rank: distance, rating, relevance | Read-heavy; writes = hours / new listing |
| Optional: pin clustering / heatmap on zoom-out | v1: one metro; no “live friends on a map” |

Non-goals unless asked: full Maps routing, user-generated photos CDN, ride matching.

## Estimation sketch (example)

- 50M POIs × ~2 KB attributes → ~100 GB metadata (fits sharded SQL / search replicas).
- Nearby QPS is high; **you cannot Haversine-scan the table**.
- A 1-D B-tree on latitude (or a composite lat,lon) returns a **strip**, not a disk — Hello Interview: closeness in 2D is not a single sort order.

## High-level components

```
App → API / geo router
    → Search coordinator  → cell IDs (geohash / H3 / S2) or ES geo query
    → POI index shards    → candidate IDs
    → Rank / hydrate      → distance + rating + text
    → Cache (Redis)       → hot “pizza near downtown” keys (short TTL)
Writes: listing service → CDC → reindex cells / ES
```

## Deep dives

### Why a normal index fails

Latitude-only or longitude-only ranges pull millions of rows. A spatial index’s job is a **small candidate set**; exact distance (haversine / ellipsoid) runs on that set only.

### Encoded keys (interview default for points)

Wikipedia **geohash**: lat/lng → base32 string; longer shared **prefix** ⇒ usually closer; the reverse is **false** (fault lines). Query the center cell **plus 8 neighbors**, then filter by true radius.

**H3** (Uber Engineering): 64-bit **hex** cells; six equidistant neighbors; `gridDisk` / k-ring. H3 IDs are **not** a space-filling range scan — you compute neighbor IDs, then `IN (...)`. Size the cell near the radius so one ring covers it.

**S2:** spherical cells + Hilbert order; same “cover + neighbors” story.

Redis `GEO*`: geohash in a sorted set — fine for a **hot city** or session; not the system of record for 50M listings.

### Trees when the data is shapes

Polygons, delivery zones, “does this county contain the pin”: **R-tree / GiST** (PostGIS) or Elasticsearch **geo_shape**. ES **geo_point** today is a **BKD** (block k-d) tree — good for mostly-static points + `geo_distance` / `geo_bounding_box`. Say: filter cheap, **score** with a ranker.

### Rank

Recall: cell / ES filter. Precision: distance + rating + review count + optional LTR. Do not rank every POI on Earth.

## Failure / ops

- Hot downtown cell: cache + replica; do not one-shard Times Square.
- Stale hours: CDC delay vs “open now” — accept seconds/minutes or read-through hours.
- Metrics: query p99, candidates/query, cache hit, index lag.

## Common mistakes

- `SELECT * FROM poi` + haversine `HAVING`.
- Geohash prefix **only**, no neighbor cells (miss the restaurant across the boundary).
- Treating this as Uber matching (CAS on a driver, 1 Hz GPS).
- Designing the review social graph before the geo index.

## Sources

- [Proximity Search — Hello Interview](https://www.hellointerview.com/learn/system-design/deep-dives/proximity-search) — accessed 2026-09-19
- [Geohash — Wikipedia](https://en.wikipedia.org/wiki/Geohash) — accessed 2026-09-19
- [H3: Uber’s Hexagonal Hierarchical Spatial Index — Uber Engineering](https://www.uber.com/us/en/blog/h3/) — accessed 2026-09-19
- [H3 vs Geohash — H3 docs](https://h3geo.org/docs/comparisons/geohash) — accessed 2026-09-19
- [Yelp System Design: Nearby Business Search — System Design Academy](https://www.systemdesign.academy/interview/design-yelp) — accessed 2026-09-19
