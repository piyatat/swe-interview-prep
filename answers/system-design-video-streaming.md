# Video streaming — system design outline

**Prompt:** Design YouTube-like upload + playback, or Netflix-like catalog streaming. Interviewers want **two pipelines** (ingest vs delivery), not a recommendation-system essay unless they ask.

Listed as a classic in [../general/system-design.md](../general/system-design.md).

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Resumable upload; process many renditions | Time-to-first-frame ~2s; rare rebuffers |
| Playback on variable networks | Huge egress — origin cannot serve it all |
| Metadata: title, owner, visibility | Upload spike ≠ watch spike (asymmetric) |
| Optional: comments, likes, search | Cost: storage + transcode + CDN |

Non-goals unless prompted: full ads, live, DRM deep-dive.

## Estimation sketch (order-of-magnitude)

- Uploads: hours of video per minute at large UGC scale → **parallel transcode**, object storage.
- Watch: read-heavy; popular titles dominate egress → **CDN / edge cache**.
- Storage: raw + N bitrates + segments → cold/warm tiers.

## High-level

```
Upload: Client → API → blob (raw) → queue → transcode workers
                                              ↓
                         segments + HLS/DASH manifests → blob
Playback: Player → CDN edge → (miss) origin shield → blob
Metadata: API → SQL/search  (not on the video bytes path)
```

**Write path** is batchy (encode farm). **Read path** is global HTTP of **immutable segments**.

## Deep dives

### Adaptive bitrate (ABR)

Same title stored as a **ladder** (e.g. 360p–1080p+). Player fetches a **manifest**, then small segments; switches quality from throughput and buffer. Protocols: **HLS** and **DASH** (industry standards). Do not invent a custom streaming TCP protocol in the interview.

### Transcode

Split by time (GOP / chunk); workers emit each rung. Queue + retries + poison-pill. Codec talk (H.264 compatibility vs newer efficiency) is enough — skip ASIC trivia unless they go there.

### CDN

Segments are cacheable static objects. Name **origin shield** so a viral miss does not stampede origin. Netflix **Open Connect** is the extreme: appliances **inside ISP** networks + peering so watch traffic stays local; control plane steers clients to a healthy cache. Most companies buy CloudFront/Akamai/Fastly or multi-CDN.

### Metadata vs bytes

View counts: async counters, not a transaction on every segment GET. Search/recs are **separate** services.

## Failure / ops

- Transcode backlog — degrade new uploads to fewer rungs first.
- Edge miss storm — shield + stale-while-revalidate.
- Corrupt segment — checksum; player fallback to another rung/CDN.
- Metrics: startup time, rebuffer ratio, cache hit rate, encode queue lag.

## Common mistakes

- Serving video from the app monolith / single region DB.
- Designing recs before playback and CDN.
- Ignoring resumable upload and “user closed laptop mid-upload.”
- No distinction between **catalog** (Netflix, pre-position) and **UGC long-tail** (YouTube, pull CDN).

## Sources

- [Adaptive bitrate streaming — Wikipedia](https://en.wikipedia.org/wiki/Adaptive_bitrate_streaming) — accessed 2026-08-23
- [HTTP Live Streaming — Wikipedia](https://en.wikipedia.org/wiki/HTTP_Live_Streaming) — accessed 2026-08-23
- [Netflix Open Connect](https://openconnect.netflix.com/en/) — accessed 2026-08-23
- [Design YouTube / video streaming — techinterview.org](https://www.techinterview.org/post/3233459981/design-youtube-video-streaming/) — accessed 2026-08-23
- [Video streaming HLD example — Abstract Algorithms](https://www.abstractalgorithms.dev/system-design-hld-video-streaming-example) — accessed 2026-08-23
