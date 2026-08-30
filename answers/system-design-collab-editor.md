# Collaborative editor (Google Docs-style) — system design outline

**Prompt:** Design a real-time document editor: many users type in one doc; everyone converges to the same text in ~100 ms.

Listed as a different product from [system-design-file-storage.md](system-design-file-storage.md) (sync **files/blocks**, last-write / conflict copies — **not** character-level merge). Confirm: plain text vs rich text; offline; presence/cursors.

This is **concurrency control on a sequence**, not QPS theater.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Insert / delete (maybe style spans) | Convergence: all clients same doc |
| Presence, caret, comments (v2) | Interactive latency (~50–150 ms in-region) |
| Persist + reload, version history | One doc can be hot; millions of cold docs |

Non-goals unless asked: full offline-first mesh, CRDT research paper, Google-scale multi-region active-active.

## Estimation sketch (example)

- 100M docs, 1% open → session fan-out, not storage
- Open doc: 2–20 concurrent editors; ops are **tiny** (char / retain)
- Bottleneck is **ordering + transform/merge**, then WebSocket fan-out — not disk GB

## High-level

```
Clients ⇄ WS gateway ⇄ Session (sticky per doc)
                         → OT/CRDT engine (in memory)
                         → Op log + periodic snapshot (DB / object store)
Presence (carets) can be ephemeral pub/sub on the same session.
```

**Pin each open document to one session process** (or a small primary). That gives you a **serializer** — the cheap way to make OT tractable.

## Deep dives

### Why last-write-wins / locking fail

LWW drops concurrent intent. Per-doc locks feel like 1998 Word. You need **ops that commute after rewrite** (OT) or **ops that commute by construction** (CRDT).

### Operational transformation (Wikipedia)

An op is authored against the state the author last saw. If another insert lands first, a position-based delete can hit the **wrong** character. **OT** rewrites the incoming op against concurrent ops so intent is preserved. Classic systems (GROVE, Google Wave OT) use a **central transform server** plus causal order — Wave OT in the Wikipedia table: transform + composition, **central server**, stop-and-wait-ish propagation, scalar timestamps. Interview default for “like Docs”: **server-mediated OT** (Jupiter-style: client only reasons about *my ops* vs *server stream*).

Tradeoff: **tiny wire format** (position + char); transform functions are easy to get **wrong** (TP1/TP2); offline/long fork is awkward.

### CRDTs (Wikipedia)

State-based: merge is commutative, associative, **idempotent** (semilattice). Op-based: broadcast updates that commute; need reliable exactly-once-ish delivery. **Sequence CRDTs** (Treedoc, RGA, Logoot, …) are the editor alternative to OT: each atom has a **stable id**; insert/delete name ids, not shifting indexes.

Tradeoff: offline / peer topologies; **tombstones + id metadata** grow; Figma-style products often use **LWW registers + fractional indexing** (Wikipedia notes this) rather than full text OT.

### Interview pick

Say **server OT for v1** (you already need a session primary). Mention CRDT if they ask offline or multi-primary. Do not implement a full transform table on the whiteboard — walk **one insert vs one insert** at the same index (tie-break by site id).

### Persistence

Op log is source of truth for the session; **snapshot every N ops** so reload is not a 10k-op replay. Presence is not in the snapshot.

## Failure / ops

| Failure | Response |
| --- | --- |
| Session dies | Clients reconnect; reload snapshot + tail; carets reset |
| Partition | One primary; other region is read-only or “offline buffer” |
| Duplicate op | Op id / idempotency on the log |
| Hot doc | Scale **sessions**, not a global QPS number |

Metrics: apply lag, transform errors (should be ~0), WS disconnects, snapshot age.

## Common mistakes

- Designing Dropbox (chunks, hash trees) and calling it Docs.
- “Just use WebSockets” with no merge story.
- Claiming CRDT is always better (or OT is obsolete) — name the **serializer vs metadata** tradeoff.
- Multi-primary writes without saying who orders ops.

## Sources

- [Operational transformation — Wikipedia](https://en.wikipedia.org/wiki/Operational_transformation) — accessed 2026-08-30
- [Conflict-free replicated data type — Wikipedia](https://en.wikipedia.org/wiki/CRDT) — accessed 2026-08-30
- [How Google Docs real-time collaboration works (OT vs CRDT) — Akshay Ghalme](https://akshayghalme.com/blogs/how-google-docs-real-time-collaboration-works/) — accessed 2026-08-30
- [Google Docs / collaborative editing — System Design School](https://systemdesignschool.io/problems/google-docs/solution) — accessed 2026-08-30
- [Design Google Docs: collaborative editing — techinterview.org](https://www.techinterview.org/post/3233460997/system-design-collaborative-editing/) — accessed 2026-08-30
