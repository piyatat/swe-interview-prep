# Search engine — system design outline

**Prompt:** Design web search (or “search over 10B docs / posts”): query in, top-10 URLs/titles in **~200 ms**. Classic sibling of [system-design-web-crawler.md](system-design-web-crawler.md) (frontier + politeness) and [system-design-autocomplete.md](system-design-autocomplete.md) (prefix as you type). Here the scored part is **index + query + rank**, not crawl ethics.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Keyword / phrase query → ranked hits + snippets | p99 ~100–200 ms in-region |
| Freshness: new/important pages in hours, not months | Index 1B–10B docs (they will scale the number) |
| Spell / “did you mean” optional v1 | Query QPS high; crawl is a **different** SLO |

Ask: public web vs in-app posts; whether **crawler** is in scope (usually “assume a feed of docs”); personalization (usually **out** for v1).

## Estimation sketch (example)

- 10B docs × 10 KB raw → 100 TB crawl store; inverted index is smaller but still **multi-machine**.
- 100k QPS: you cannot scan documents. You **must** invert first.
- Fan-out to 100 shards: p99 is the **slowest** shard, not the mean.

## High-level components

```
Offline: docs → parse / tokenize → inverted index segments → (PageRank / quality)
Online:  query → rewrite → scatter to index shards → local top-k
       → mixer merge → snippet / title fetch → optional ML re-rank → cache
```

Wikipedia: an **inverted index** maps term → postings (doc ids, often positions). A **forward** index (doc → terms) is what you invert; you do not query it at serving time.

## Deep dives

### Inverted index + partition

Posting list: sorted `doc_id` (+ tf, positions for phrases). Intersection of two sorted lists is linear.

**Document-partitioned** shards (usual interview default): each doc lives on one shard; a write / reindex hits **one** place; a query **fans out to all** shards. Term-partitioned (one term → one machine) makes writes ugly and creates hot terms.

Segments (Lucene-style): write new immutable pieces; merge in the background; serving reads a snapshot. That is how you index continuously without pausing queries.

### Ranking cascade

Do not BERT-score a billion docs.

1. **Retrieve:** BM25 / tf-idf on posting intersections → local top-k per shard.
2. **Blend:** query-independent signals baked at index time (PageRank / static quality / freshness).
3. **Re-rank:** heavier model on a few hundred survivors only.

PageRank (Wikipedia / Brin–Page): authority from the **link graph**, query-independent — compute offline, store next to the doc.

### Query path latency

Mixer waits on every shard. Mitigations: replicas + **hedged** retry of a slow shard, tight per-shard deadline, results cache for head queries. Snippets come from a **document store**, not from scanning postings.

Fresh / news: a small real-time index merged at query time; full rebuild stays batch.

## Failure / ops

- Shard death: serve from replica; query with one shard down is **wrong recall** unless you fail the request — say which.
- Corrupt segment: drop it, rebuild from the forward/doc store.
- Metrics: p99, shards past deadline, cache hit, index lag (time-to-searchable), spelling trigger rate.

## Startup vs FAANG angle

| Interview default (web-scale) | Product / startup |
| --- | --- |
| Homegrown shards, cascade, PageRank story | OpenSearch / Elasticsearch; one cluster; BM25 + filters |
| Crawler + index + serve on one whiteboard | “Assume Kafka of documents”; spend time on query + freshness |

## Common mistakes

- Spending 40 minutes on the [crawler](system-design-web-crawler.md) and never drawing **query fan-out**.
- SQL `LIKE '%term%'` or “scan every doc.”
- One giant hash map of terms on one box at 10B docs.
- Neural rank on the full corpus.
- Confusing this with [autocomplete](system-design-autocomplete.md) (prefixes, not recall@10).

## Sources

- [Inverted index — Wikipedia](https://en.wikipedia.org/wiki/Inverted_index) — accessed 2026-09-03
- [PageRank — Wikipedia](https://en.wikipedia.org/wiki/PageRank) — accessed 2026-09-03
- [Design a Search Engine — System Design Academy](https://www.systemdesign.academy/interview/design-google-search) — accessed 2026-09-03
- [System Design: Search Engine — techinterview.org](https://www.techinterview.org/post/3233460402/system-design-search-engine/) — accessed 2026-09-03
- [Design a Search Engine — SpaceComplexity](https://spacecomplexity.ai/blog/search-engine-system-design-interview) — accessed 2026-09-03
