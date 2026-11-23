# Photo sharing (Instagram) — system design outline

**Prompt:** Design Instagram-like **photo sharing**: upload a photo + caption, follow people, see a **home feed** of followees. Hello Interview lists this as a common FAANG prompt.

**Not** [system-design-news-feed.md](system-design-news-feed.md) alone (IDs + fan-out — reuse it). **Not** [system-design-file-storage.md](system-design-file-storage.md) (Dropbox folder sync). **Not** [system-design-object-storage.md](system-design-object-storage.md) (generic S3). Here the new work is **large blobs + async derivatives + CDN**, then a feed of **IDs**.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Create post (photo + caption); follow; chronological home feed | Upload “feels instant”; image render from edge; feed p99 ~300–500 ms |
| Profile grid of **your** posts | Read-heavy; 100:1–1000:1 views:uploads |
| Optional later: like / comment | Durability on the original; eventual OK on feed |

Hello Interview below-the-line: stories, live, search, shopping. Lock **photos only** unless they insist on video (then you inherit [system-design-video-streaming.md](system-design-video-streaming.md) transcode).

## Estimation sketch (example)

Hello Interview / handbooks often use **~500M DAU, ~100M posts/day**. Bytes dominate money: a few MB ingest × variants × views. Store **post IDs** in timelines; **never** copy JPEG bytes into Redis.

## High-level — three planes

```
Client
  → API (auth, create post metadata = pending)
      → presigned PUT → object store (original)
          → queue → workers (thumbnails, transcode, moderate)
              → mark post visible; emit fan-out event
  → Feed service → inbox of IDs (hybrid push/pull) → hydrate metadata
  → CDN → image variants (immutable keys)
```

Instagram Engineering (2011): photos in **S3 + CloudFront**; metadata in **Postgres**; feeds in **Redis**; async work on a queue. Uploads originally went **through app servers then S3**. The interview-default upgrade: **presigned URL** so the API is not a byte proxy ([system-design-object-storage.md](system-design-object-storage.md)). Say both.

## Deep dives

### Upload (large blob)

1. Client asks API for permission. Server picks the **object key** (never client-chosen) and returns a **short-lived presigned PUT**.
2. Write a `post_pending` row. Bytes never touch the API.
3. Client uploads; storage notify or client “complete” → enqueue **variant + moderate**.
4. Workers write **immutable** keys per size/format (`id/320.webp`). CDN `Cache-Control: immutable`. Edits = new key.
5. Only then `visible`. Orphan pending rows need a **TTL GC**.

### Feed (reuse news-feed)

Push `post_id` to follower inboxes; **pull** celebrity outboxes; cap list length; hydrate bodies from a post cache. See [system-design-news-feed.md](system-design-news-feed.md). Image URLs in the JSON point at the **CDN**, not origin.

### IDs

Instagram’s public [sharding IDs](https://instagram-engineering.com/sharding-ids-at-instagram-1cf5a71e5a5c) post: time-sortable 64-bit IDs (timestamp + shard + seq) so you can sort without a central ticket server. Mention [system-design-unique-id.md](system-design-unique-id.md).

## Failure / ops

- Upload complete, worker down: post stays pending; client polls / push “processing.”
- Viral photo: CDN + origin shield; **do not** fan-out 50M JPEG copies.
- Delete: tombstone metadata; let CDN TTL die (or purge). Immutable URLs 404 after origin delete.
- Metrics: upload complete, time-to-visible, CDN hit, fan-out lag, moderate reject rate.

## Common mistakes

- Streaming the file through the API (Hello Interview: works for small, dies at scale).
- Storing bytes in the DB or in every inbox.
- Overwriting the same CDN key (you cannot cache forever).
- Only push **or** only pull for the feed.
- Skipping moderation / orphan pending GC.

## Sources

- [Design a Photo Sharing App Like Instagram — Hello Interview](https://www.hellointerview.com/learn/system-design/problem-breakdowns/instagram) — accessed 2026-11-23
- [What Powers Instagram — Instagram Engineering](https://instagram-engineering.com/what-powers-instagram-hundreds-of-instances-dozens-of-technologies-adf2e22da2ad) — accessed 2026-11-23
- [Sharding & IDs at Instagram — Instagram Engineering](https://instagram-engineering.com/sharding-ids-at-instagram-1cf5a71e5a5c) — accessed 2026-11-23
- [Uploading objects using presigned URLs — AWS S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/PresignedUrlUploadObject.html) — accessed 2026-11-23
- [Design a Photo Sharing Service — The HLD Handbook](https://hld.handbook.academy/curriculum/case-studies/photo-sharing/) — accessed 2026-11-23
