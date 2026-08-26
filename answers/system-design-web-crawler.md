# Web crawler — system design outline

**Prompt:** Design a distributed crawler that starts from seed URLs, fetches pages, extracts links, and stores content for search / archive. Classic #7 in [../general/system-design.md](../general/system-design.md). This is a **scheduling + politeness** problem more than “HTTP GET in a loop.”

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Discover URLs from seeds + outlinks | Billions of URLs; many fetchers |
| Honor `robots.txt` (RFC 9309) | **Polite:** cap in-flight / rate **per host** |
| Dedupe URLs (and optionally content) | Freshness: recrawl important/changing pages |
| Store raw bytes + metadata | Survive worker death without stampeding a host |

Ask: public web vs intranet; JS rendering (usually **out of scope** unless they insist); WARC vs “just HTML.”

## Estimation sketch (example)

Even “small” crawls produce **huge URL sets**. You cannot `SELECT url FROM seen` on every outlink. Need an approximate membership structure plus an exact store for the maybe-seen case.

## High-level components

```
Seeds → URL frontier (priority + per-host queues)
      → Fetcher workers (HTTP, timeouts, size caps)
      → robots.txt cache (per host)
      → Parser (links, canonical URL)
      → URL dedup (Bloom → exact KV)
      → Content store (object storage / WARC)
      → Optional: content fingerprint (SimHash) for near-dupes
```

Mercator-style split (frontier, fetcher, indexer) is the interview skeleton everyone since 1999 still draws.

## Deep dives

### URL frontier

- Not one global FIFO (that DDoSes a hot host).
- **Partition by hostname hash** so one shard owns politeness for `example.com`.
- Per-host queue + **token bucket** (1 req/s default, or `Crawl-delay` if you honor the de-facto extension — **not** in RFC 9309’s ABNF).
- Priority: seeds / high PageRank / change-rate vs long-tail. Recrawl loop separate from first-seen.

### robots.txt (RFC 9309)

- Fetch `https://host/robots.txt` (lowercase path). **Not an access-control mechanism** — still honor it in this design.
- Match `User-agent` groups; most specific `Allow`/`Disallow` path wins; `/robots.txt` itself is always allowed.
- Cache: RFC says crawlers **SHOULD NOT** use a cached copy **more than 24 hours**, unless the file is unreachable. Use normal HTTP cache control when present.
- 5xx / missing file: RFC defines unavailability behavior — do not invent “crawl everything” without stating the RFC case.

### Dedup

**URL normalize** first: lowercase host, drop fragment, resolve relative links, consistent query-param order.

**Bloom filter** (standard): **no false negatives**. If it says *absent*, the URL is new → enqueue. If it says *present*, **maybe** seen → check a sharded KV (or skip; skipping a never-crawled URL is the usual acceptable false-positive). Size in the interview: ~1% FPR is the usual back-of-envelope.

Bloom filters do not delete; rotating filters for recrawl generations is a fine follow-up.

**Content:** SimHash / checksum so `http` vs `https` mirrors do not blow storage. Different layer from URL dedup.

### Fetchers

- Timeouts, max bytes, robots + politeness already decided **before** GET.
- DNS cache (otherwise DNS is the bottleneck).
- Distill: store status, headers, body pointer, fetch time.

## Failure / ops

- Worker crash: lease URLs with TTL so another worker can take them; do not recrawl the whole host.
- robots.txt 404 vs timeout: different RFC paths — say which you implement.
- Metrics: fetch QPS, robots deny rate, Bloom FPR (sample exact checks), per-host delay, parser errors, storage bytes.

## Common mistakes

- Global Kafka topic of URLs with no per-host cap.
- “Hash set of all URLs” as the only dedup at web scale.
- Treating robots.txt as optional or as authentication.
- JS rendering and full Chrome farm as v1.

## Sources

- [RFC 9309: Robots Exclusion Protocol](https://www.rfc-editor.org/rfc/rfc9309.html) — accessed 2026-08-26
- [Robots.txt — Wikipedia](https://en.wikipedia.org/wiki/Robots.txt) — accessed 2026-08-26
- [Bloom filter — Wikipedia](https://en.wikipedia.org/wiki/Bloom_filter) — accessed 2026-08-26
- [Design a Web Crawler (Googlebot-style) — HLD Handbook](https://hld.handbook.academy/curriculum/case-studies/web-crawler/) — accessed 2026-08-26
- [8.12 Design a web crawler — System Design Interview Handbook](https://www.systemdesigninterview.com/guides/system-design-interview-handbook/812-design-a-web-crawler) — accessed 2026-08-26
- [Web Crawler LLD: frontier and politeness — techinterview.org](https://www.techinterview.org/post/3233469422/lld-web-crawler/) — accessed 2026-08-26
