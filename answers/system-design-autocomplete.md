# Search autocomplete / typeahead — system design outline

**Prompt:** Design search suggestions: as the user types a prefix, return top-K completions in **tens of milliseconds**. Classic Google/Amazon/LinkedIn prompt. Listed in [../general/system-design.md](../general/system-design.md).

Frontend-only debounce/ARIA is [../roles/frontend.md](../roles/frontend.md); this outline is the **backend ranking + serving** path.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Top-K (5–10) completions for a prefix | p99 server ≪ 100 ms (often 20–50 ms) |
| Optional: personalization, trending, spell-fix | Huge QPS (every keystroke) vs slow-changing popularity |
| Min prefix length (e.g. 2) | Multi-language; abuse / illegal query filtering |

Non-goal unless asked: full web search ranking.

## Estimation sketch (example)

- 10B queries/day → ~100K+ QPS average, multi-× peak
- Each query may fire several prefix requests unless the client **debounces** and **aborts** stale in-flight calls
- Working set must be **in memory** — disk / ES-on-the-hot-path misses the latency bar

## High-level components

```
Client (debounce, local cache)
  → CDN / edge cache (hot prefixes)
  → Autocomplete API → Redis (prefix → top-K)
  → Trie / prefix shard (in-memory, precomputed top-K at node)
Offline: query logs → Kafka → aggregate (Spark/Flink) → build trie blob → atomic swap
```

**Key inversion:** do **not** rank the subtree on every keystroke. Popularity changes slowly; **precompute** top-K at each prefix and serve a lookup.

## Deep dives

### Data structure

- **Trie / radix / FST:** prefix walk; store top-K (term + score) on the node so you never scan millions of children at request time.
- **Shard** by first character(s) or prefix range; replicate each shard.
- Elasticsearch completion suggester is a **managed** alternative at smaller scale — say when you’d pick it vs a custom trie.

### Read path

- Ignore 1-char prefixes or serve a tiny static list
- Cache the head of the Zipf curve (top prefixes absorb most QPS)
- Personalization: re-rank a **small** candidate list with user history — not a full corpus scan

### Update path

- Stream search logs; batch rebuild (hours) + optional streaming bump for **trending**
- Atomic pointer swap of the in-memory trie; never mutate nodes on the hot path
- Filter spam / adult / injection terms in the build, not ad hoc on read

### Client

- Debounce ~200–300 ms; cancel in-flight when the prefix changes
- Optionally filter a cached longer-prefix result locally for the next character

## Failure / ops

- Stale suggestions after a rebuild miss — TTL + scheduled rebuild SLO
- Hot prefix (celebrity / breaking news) — edge cache + extra replicas
- Metrics: p99 suggest latency, cache hit rate, empty-result rate, build freshness

## Startup vs FAANG angle

| FAANG | Startup |
| --- | --- |
| Custom sharded trie, dual-path trending | Postgres `prefix%` + Redis top-K for the head; or a hosted suggester |
| Personalization + spell + multi-locale | Global popularity only |

## Common mistakes

- `LIKE 'pre%'` or ES search **per keystroke** at stated QPS
- “Use a trie” with no top-K precompute, sharding, or zero-downtime reload
- Ranking the entire subtree online

## Sources

- [Trie — Wikipedia](https://en.wikipedia.org/wiki/Trie) — accessed 2026-08-25
- [Design Search Autocomplete / Typeahead — CalibreOS](https://www.calibreos.com/learn/hld-search-typeahead) — accessed 2026-08-25
- [Typeahead / Autocomplete System Design — System Design School](https://systemdesignschool.io/problems/typeahead/solution) — accessed 2026-08-25
- [Design Search Autocomplete — Sujeet Jaiswal](https://sujeet.pro/articles/design-search-autocomplete) — accessed 2026-08-25
