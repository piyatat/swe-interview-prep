# Object storage (S3-style) — system design outline

**Prompt:** Design object storage like Amazon S3: `PUT` / `GET` / `DELETE` / `LIST` by **bucket + key**, large objects, high durability.

**Not** [system-design-file-storage.md](system-design-file-storage.md) (Dropbox **folder sync**, chunk manifests, multi-device conflict). Here the API is a **flat namespace of immutable-ish blobs** plus a **metadata index**. Keys may contain `/` but those are prefixes, not directories. Official AWS: an object is data + metadata; a bucket is the container.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| `PutObject` / `GetObject` / `Delete`; `List` by prefix | Durability first (S3 public target: **11 nines**); availability a notch lower |
| Multipart upload for large objects | Read-after-write on PUT/DELETE (S3: strong since **Dec 2020**, all regions) |
| Versioning / overwrite; optional lifecycle to colder class | Private by default; IAM / bucket policy, not public ACLs as the design |

Ask: max object size, request mix, single-region vs cross-region, whether LIST must be strongly consistent too (S3: yes for LIST after PUT).

## Estimation sketch (example)

- 100B objects, mean 1 MB → **~100 PB** raw; 3 AZ copies or equivalent erasure blows that up
- Small-object PUT QPS vs GB/s of large multipart — **split control plane from byte path**
- LIST of a million-key prefix cannot scan every disk

## High-level

**Metadata plane ≠ data plane.** Commit the index only after bytes are durable.

```
Client
  → Front (auth, rate limit, request ID)
      → Metadata service (bucket, key → locator, version, etag, ACL)
      → Placement / chunk tracker
      → Storage nodes (or erasure shards) in ≥3 failure domains
```

AWS docs: you create a bucket in a Region, then upload objects; each object has a **key**. Versioning keeps prior versions so overwrite/delete is recoverable.

## Deep dives

### PUT path

1. AuthN/Z; reject illegal keys; choose object id + placement.
2. **Small object:** write N replicas or k-of-n shards; checksum; **then** commit metadata (etag = hash).
3. **Large object:** multipart — client uploads parts in parallel (S3: single PUT cap historically **5 GB**; bigger → parts). Complete = metadata points at an ordered part list. Incomplete uploads need GC.
4. Overwrite: new bytes + new version id; old bytes stay until GC if versioning is on.

Do not ACK the client until the durability bar for **this class** is met (S3 Standard: multiple AZs).

### GET / LIST

GET: metadata → locator(s) → nearest healthy shard; checksum on read. LIST: the **index** is the source of truth (B-tree / LSM per bucket-prefix shard). Scanning storage nodes for LIST is a fail.

S3 (Barr, 2020): GET/PUT/LIST and metadata updates are **strongly consistent** — what you write is what you read; LIST reflects completed writes. Interview: the **index pointer** is the linearization point. Eventual blob replication behind a committed pointer is a different (weaker) design — name it if you choose it.

### Durability vs availability

| Knob | Interview default |
| --- | --- |
| Replication (3 AZ) | Simple; 3× storage |
| Erasure coding (e.g. k+m) | Better efficiency at TB+; rebuild cost on failure |
| One-zone class | Lower latency / cost; **not** 3-AZ durability (S3 Express / One Zone-IA) |

Lifecycle: hot → infrequent → archive (Glacier-class: retrieval minutes–hours). Object Lock / WORM if they ask compliance.

## Failure / ops

- Bit rot: periodic checksum + repair from other shards
- Metadata committed, bytes missing: do **not** serve; background heal or fail the PUT (depends when you committed — prefer bytes first)
- Hot key / prefix: shard the index by key hash; LIST a prefix still needs an ordered secondary
- Metrics: PUT/GET p99, 5xx, repair backlog, incomplete multipart age, checksum mismatch rate

## Common mistakes

- Drawing Dropbox **sync** (watchers, conflict, block manifests) and calling it S3.
- Eventual consistency on GET after PUT **without** saying so (S3’s public bar is strong).
- LIST implemented as “walk all storage nodes.”
- Single-disk “files in a folder” with no checksum or second AZ.
- Storing the whole object in the metadata DB.

## Sources

- [What is Amazon S3? — AWS Docs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html) — accessed 2026-09-29
- [Amazon S3](https://aws.amazon.com/s3/) — accessed 2026-09-29
- [Amazon S3 Update – Strong Read-After-Write Consistency — AWS News Blog](https://aws.amazon.com/blogs/aws/amazon-s3-update-strong-read-after-write-consistency/) — accessed 2026-09-29
- [System Design Interview: Object Storage (Amazon S3) — techinterview.org](https://www.techinterview.org/post/3233461700/system-design-object-storage/) — accessed 2026-09-29
- [Amazon S3 System Design Interview — System Design Academy](https://www.systemdesign.academy/interview/design-s3-object-storage) — accessed 2026-09-29
