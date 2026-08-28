# File storage / sync (Dropbox-style) — system design outline

**Prompt:** Design Dropbox / Google Drive — upload, download, sync a folder across devices.

Listed as a classic FAANG prompt in [../companies/faang-big-tech.md](../companies/faang-big-tech.md). Not collaborative OT/CRDT editing (Docs) unless they ask — that is a different product. Confirm: consumer sync vs enterprise sharing+search.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Upload / download / rename / share | Durable blocks; metadata strongly consistent per namespace |
| Multi-device sync, offline edits | Delta upload (do not re-send a 1 GB file for one page) |
| Version history, conflict when two devices diverge | Dedup identical bytes across files/users |

Ask: typical file size, how many devices, sharing model, whether **block-level** sync is in scope.

## Estimation sketch (example)

- 100M MAU, 5 GB stored / user → **exabyte-class** blob store (Dropbox built **Magic Pocket** for this)
- Writes: small metadata QPS + bursty block PUT
- Sync latency: seconds for a small file, not minutes

## High-level

**Split the planes.** Metadata (tree, permissions, **manifest of block hashes**) ≠ bytes.

```
Client (watcher + chunker)
  → Metadata API (namespaces, versions, block lists)  [SQL / Spanner-class]
  → Block store (content-addressed blobs, ≤ ~4 MB)     [S3 or Magic Pocket]
  → Notification (long-poll / push: “namespace changed”)
```

Dropbox public write-up: files split into **blocks**, replicated, stored separately from **metadata about files and users**. Magic Pocket is the content store: key ≈ **SHA-256 of the block**, immutable blob.

## Deep dives

### Upload / commit

1. Client chunks the file (interview default: **fixed ~4 MB**; mention **content-defined chunking** if they care about inserts shifting every offset).
2. Hash each block; send the **manifest**.
3. Server returns which hashes are **missing**.
4. Client PUTs missing blocks **directly** to object storage (pre-signed URL).
5. **Commit metadata last** — a version must only point at blocks that already exist (no dangling hashes).

Delta sync falls out: unchanged hashes are skipped.

### Why content-addressed blocks

Identical chunks store **once** (cross-user dedup is a product/privacy choice — say you would gate it). Immutability removes cache invalidation on the blob path. Metadata still needs transactions: rename, move, sharing.

### Sync protocol

Local **file-system watcher** + local manifest. On notify, pull new metadata for the namespace, then GET missing blocks. Idle clients need a **push** (WebSocket / long-poll), not polling every file.

### Conflicts (canonical follow-up)

Two devices edit offline:

| Policy | When |
| --- | --- |
| Last-write-wins | Rarely OK for docs people care about |
| **Conflict copy** (`file (conflicted copy)`) | Dropbox-style default; user merges |
| CRDT / OT | Collaborative editors — out of scope unless Drive Docs |

Do not pretend a last-write-wins file sync is “consistent enough” without saying users can lose edits.

### Metadata store

Sharded relational (Dropbox historically **MySQL** by namespace / user) or Spanner-class for global. Strong consistency on the **tree + ACLs**. Blocks can be **eventually** visible as long as commit is atomic.

## Failure / ops

- Commit after partial block PUT: retry missing hashes; GC unreferenced blocks later.
- Device clock skew: versions are **server-assigned**, not mtime.
- Metrics: commit success, unique vs duplicate block ratio, notify lag, rebuild time after disk loss (erasure coding vs 3× replicate — cost vs repair).

## Common mistakes

- “Put files in S3” with no chunking / manifest.
- Strong consistency on **blobs** (unnecessary) and weak consistency on **the folder tree** (user-visible races).
- Re-uploading the whole file on a one-line edit.
- Ignoring notifications (clients never learn about the other laptop).

## Sources

- [Inside the Magic Pocket — Dropbox](https://dropbox.tech/infrastructure/inside-the-magic-pocket) — accessed 2026-08-28
- [Design Dropbox — techinterview.org](https://www.techinterview.org/post/3233474312/system-design-design-dropbox-file-storage-sync-chunking-deduplication-conflict-resolution-delta-sync-sharing-permissions/) — accessed 2026-08-28
- [Dropbox system design — System Design Academy](https://www.systemdesign.academy/interview/design-dropbox) — accessed 2026-08-28
- [File storage (Dropbox / Drive) — intervu.dev](https://intervu.dev/blog/file-storage-dropbox-google-drive-system-design/) — accessed 2026-08-28
- [Dropbox / Google Drive file sync — nSkillHub](https://nskillhub.com/system-design/classic/dropbox-google-drive-file-sync/) — accessed 2026-08-28
