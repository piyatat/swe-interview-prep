# Pastebin — system design outline

**Prompt:** Design a **paste service** (Pastebin / gist): user pastes text, gets a short URL, anyone with the link can read it. Optional expiry, visibility, and a size cap.

**Not** [system-design-url-shortener.md](system-design-url-shortener.md) (you store a **pointer** to someone else’s URL). **Not** [system-design-object-storage.md](system-design-object-storage.md) (you **use** a blob store; you do not design S3). Wikipedia [pastebin](https://en.wikipedia.org/wiki/Pastebin): text-hosting for snippets and logs; [pastebin.com](https://pastebin.com) since **2002**. The new work is **metadata vs bytes**, **expiry / burn-after-read**, and a **read-heavy CDN**.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Create paste → short code; GET by code | Create p99 tens of ms; read from edge when public |
| Size cap (e.g. 1–10 MB); text only unless they ask | High durability of content; 404/410 after expiry |
| TTL: never / 10 min / 1 day / 1 week | Read:write often ~10:1 (primer example) |
| Visibility: public / unlisted / private | Private and burn-after-read **bypass** the CDN |
| Optional: custom alias, syntax language tag | Analytics can be eventual (queue) |

Out of scope unless asked: collaborative editing ([system-design-collab-editor.md](system-design-collab-editor.md)), accounts, comments, malware scanning as a product.

## Estimation sketch (example)

System Design Primer numbers (say them as **assumptions**): 10M writes/mo, 100M reads/mo → ~4 writes/s, ~40 reads/s average; 1 KB paste → ~13 GB content/mo. Real viral pastes are the spike: a CDN + origin shield matters more than the average QPS.

## High-level — split the blob from the row

```
Client → LB → Write API
              → PUT object  pastes/{code}     (S3 / GCS)
              → INSERT pastes(code, s3_key, vis, expires_at, size)
              → return https://p.example/{code}

Read:  CDN (public/unlisted) → origin: metadata cache → GET object
       private / burn-after-read: API auth, then presigned GET (no cache)
```

Official AWS: an [S3 object](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html) is data + metadata in a bucket. Keep **your** metadata (expiry, visibility, owner) in SQL/Dynamo — S3 user-metadata is not a query index. Primer: SQL `pastes` PK = `shortlink`, `paste_path` in the object store.

Code: random **Base62** (7 chars ≈ 3.5e12) + insert-if-absent retry, or a key pool. Hash of content is a bonus for identical-paste dedupe, not uniqueness (two users can paste the same log). Custom alias: unique constraint, reserved-word deny list.

## Deep dives

### Write order

Two stores, no distributed transaction. Safer: **PUT object first**, then INSERT. Crash → orphan blob; a sweeper deletes objects with no row. The opposite (row then blob) 404s a live link — worse. Small pastes (<2 KB) **may** live in the row (Postgres TOAST already does this); say it, then pick one path.

### Expiry

Every read compares `expires_at`. CDN / Redis TTL = `min(default, remaining life)`. Worker (or DynamoDB TTL + S3 lifecycle) deletes rows then objects. Burn-after-read: `DELETE` (or `views_left--`) **after** a successful GET; never cache.

### Privacy

Public: CDN OK. Unlisted: security-by-link; still cacheable if the code is unguessable. Private: session / password at the API; **presigned** object URL, short TTL. Do not put secrets in the code itself.

## Common mistakes

- Treating this as bit.ly (no blob, only a URL map).
- Storing 10 MB bodies in the primary key-value row.
- Caching private or burn-after-read pastes at the edge.
- 301 to the object URL without checking expiry.
- Sequential integer codes (enumerable).
- Designing syntax highlighting as a storage problem — it is a **render** of the same bytes.

## Sources

- [Pastebin — Wikipedia](https://en.wikipedia.org/wiki/Pastebin) — accessed 2026-11-27
- [Pastebin.com](https://pastebin.com) — accessed 2026-11-27
- [Pastebin solution — System Design Primer](https://github.com/donnemartin/system-design-primer/blob/master/solutions/system_design/pastebin/README.md) — accessed 2026-11-27
- [What is Amazon S3? — AWS Docs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html) — accessed 2026-11-27
- [Design a paste service (Pastebin) — System Design Interview Handbook](https://www.systemdesigninterview.com/guides/system-design-interview-handbook/83-design-a-paste-service-pastebin) — accessed 2026-11-27
- [Pastebin system design — designbeyondcode](https://designbeyondcode.com/system-design/problems/pastebin/) — accessed 2026-11-27
