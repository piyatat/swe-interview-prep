# Key-value store (Dynamo-style) — system design outline

**Prompt:** Design a **distributed key-value store**: `get(key)` / `put(key, value)`, survive node loss, add nodes without reshuffling everything. Classic mid/senior prompt.

**Not** [system-design-distributed-cache.md](system-design-distributed-cache.md) (TTL cache in front of a DB). Here the store **is** the source of truth. Placement still uses a hash ring — say that once and move to **durability, versions, quorums**.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| `get` / `put` (optional `delete` + tombstone) | Always writable during a single-node / AZ blip (Dynamo’s shopping-cart goal) |
| Opaque values, primary key only (no joins) | Incremental scale: add one box, move ~1/N keys |
| Tunable consistency (`N`, `R`, `W`) | p99 in-region a few ms if local; cross-region is a different SLA |

Ask: object size, read/write ratio, whether **client library** can be partition-aware, conflict policy (app merge vs last-write-wins).

## Estimation sketch (example)

- 1M keys, 2 KB values, 3 replicas → low terabytes with headroom
- 50k writes/s shopping-cart shaped: **leaderless** + WAL / memtable per node beats a global lock
- `hash % N` remap on join is the estimate they want you to reject

## High-level components

```
Client  →  coordinator (any node, or a smart client)
              → preference list: N distinct physical nodes on the ring
Node: WAL + memtable / LSM (or similar) + hinted-handoff buffer
Membership: gossip  |  anti-entropy: Merkle trees per range
```

Amazon Dynamo (SOSP 2007; Wikipedia summary): **symmetry** (no special node), **decentralization**, **heterogeneity** (bigger boxes take more virtual nodes). DynamoDB the **product** is different — Wikipedia / Kleppmann: **single-leader** per partition. Say the paper first unless they said “DynamoDB.”

## Deep dives

### Partitioning

Same ring idea as the [cache](system-design-distributed-cache.md) page: key and node IDs on a circle; owner = first node clockwise; **virtual nodes** spread load and a death. Preference list = next **N distinct physical** nodes (skip two vnodes on the same box).

### Quorum (`N`, `R`, `W`)

Coordinator sends the op to the preference list; **put** waits for `W` acks, **get** for `R` replies. `R + W > N` (e.g. `N=3, R=W=2`) means a read should **intersect** a completed write — still not linearizability; clocks and sloppy lists leak. Dynamo’s point: **tune** (fast write `W=1` vs safer `W=N`).

### Versions

Concurrent puts → siblings. Paper: **vector clocks**; get may return multiple values; **app reconciles** (cart union) and puts back. Last-write-wins is simpler and **loses** a concurrent add — name that.

### Temporary vs permanent failure

| Technique | When |
| --- | --- |
| **Sloppy quorum + hinted handoff** | Preference node down: write to the next healthy node with a hint; replay later |
| **Read repair** | Get sees mixed versions; push newest in the background |
| **Merkle anti-entropy** | Replica ranges diverge for a long time; sync without sending everything |

## Failure / ops

- Coordinator timeout → retry another node; do not block the cart
- Delete = **tombstone** or you resurrect on repair
- Hot key → salt / split; vnodes fix **key count**, not **one celebrity key**
- Metrics: put/get p99, hinted backlog, sibling rate, repair bytes

## Startup vs FAANG angle

| Interview default (Dynamo paper) | Managed / later systems |
| --- | --- |
| Leaderless, vector clocks, hinted handoff | DynamoDB: leader + replicas; Cassandra: similar ring, often LWW / CQL |
| Client or LB as coordinator | Redis Cluster: **hash slots**, not this paper (see cache page) |

## Common mistakes

- Drawing a **cache** (eviction, stampede) and calling it a database.
- `hash % N` as the final placement.
- “`R+W>N` ⇒ linearizable.”
- Confusing **Dynamo the paper** with **DynamoDB**.
- Forgetting tombstones, hints, or app-level merge.

## Sources

- [Dynamo: Amazon’s Highly Available Key-value Store (SOSP 2007 PDF)](https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf) — accessed 2026-09-02
- [Dynamo (storage system) — Wikipedia](https://en.wikipedia.org/wiki/Dynamo_(storage_system)) — accessed 2026-09-02
- [Design a Key-Value Store — InterviewLoop](https://interviewloop.app/learn/system-design/design-a-keyvalue-store) — accessed 2026-09-02
- [Design a Key-Value Store — System Design Interview Handbook](https://www.systemdesigninterview.com/guides/system-design-interview-handbook/818-design-a-keyvalue-store) — accessed 2026-09-02
- [Consistent hashing — Hello Interview](https://www.hellointerview.com/learn/system-design/core-concepts/consistent-hashing) — accessed 2026-09-02
