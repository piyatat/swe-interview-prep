# Distributed lock / lease — system design outline

**Prompt:** Design a **distributed lock service**: named locks, acquire / release, crash-safe, so uncoordinated processes can take turns on a shared resource (leader election, primary for a shard, exclusive mutate). Classic mid/senior prompt; Chubby / ZooKeeper / etcd shaped.

**Not** [system-design-job-scheduler.md](system-design-job-scheduler.md) (due-time + workers) and not [system-design-ticketmaster.md](system-design-ticketmaster.md) (inventory holds). Here the hard part is **mutual exclusion under pauses and slow networks**, not QPS.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Acquire / release named lock; exclusive (optional shared/read) | Safety: **never two active holders** who can both mutate |
| Session + KeepAlive / lease so a dead client cannot hold forever | Deadlock-free: lock returns after crash / expiry |
| Fencing token on every grant | Coarse-grained (minutes–hours) vs fine-grained (ms) — pick one |

Ask: advisory vs enforced; single region vs multi-region; is the **resource** able to check a token? Google Chubby (OSDI ’06): designed for **coarse-grained** locks (elect a primary, hold for hours), reliability over throughput.

## Estimation sketch (example)

- 50k client sessions, 20k locks, KeepAlives ~10k/s (Chubby-scale interview numbers)
- Lock acquire rate is **not** the app’s transaction rate if holders stay primary
- Five-replica **cell** in one metro; cross-region lock is a different (harder) design

## High-level

Locks are **state on a consensus log**, not a Redis `SETNX` you hope is unique.

```
Client
  → Session (KeepAlive / lease)
      → Lock table (name → holder, mode, generation)
          → Replicated state machine (Paxos / Raft; 5 replicas, 1 leader)
```

Chubby exposes a small filesystem + **advisory** locks. etcd: `lease` + `Lock` on a prefix. ZooKeeper: ephemeral znodes + `zxid` as a generation.

## Deep dives

### Lease vs “I still think I hold it”

A TTL is **required** (otherwise a crashed holder blocks forever) and **insufficient** (GC pause, packet delay, or a write in flight after expiry). Kleppmann: you cannot check “do I still hold it?” then write — the pause can sit **between** the check and the write.

**Fencing token:** every grant returns a **strictly increasing** number (Chubby sequencer / generation; ZooKeeper `zxid` or znode version). The **storage service** remembers the highest token and **rejects** lower ones. The lock service alone cannot stop a stale write.

Chubby also ships **lock-delay**: after a holder dies, delay re-grant so a stale holder can finish dying — used when the resource **cannot** check a sequencer.

### Redis / Redlock

Official Redis Redlock: N independent masters, majority + TTL. Safety for **efficiency** (dedupe work) can be OK. For **correctness** (money, unique primary), Redis docs themselves tell you to implement **fencing tokens**; Kleppmann’s critique is that Redlock does not mint a monotonic token and relies on bounded pause / clock / delay. Interview default: **consensus lock + fencing** for correctness; single Redis lock for “best-effort don’t double-run.”

### Session / KeepAlive

Client heartbeats. Missed KeepAlive → session dies → locks drop. Leader of the lock cell is itself elected by the same consensus. Split-brain on the **resource** is what fencing prevents if the old leader is paused.

## Failure / ops

- Lock cell minority: **no new grants**; existing leases expire — name this
- Clock jump on Redis TTL: another reason not to use it for correctness
- Metrics: grant p99, KeepAlive timeout rate, rejected stale tokens, leader elections
- Do not hold a lock across a user-facing request if you can elect a primary instead

## Common mistakes

- `SETNX` + TTL and calling it safe.
- Checking lock expiry in the client, then writing (TOCTOU with pauses).
- No fencing, and the resource accepts any holder’s write.
- Fine-grained per-row locks at Chubby QPS (wrong workload).
- Multi-region lock without saying you just designed a WAN consensus cell.

## Sources

- [The Chubby lock service — Burrows, OSDI 2006](https://research.google.com/archive/chubby-osdi06.pdf) — accessed 2026-11-06
- [How to do distributed locking — Martin Kleppmann](https://martin.kleppmann.com/2016/02/08/how-to-do-distributed-locking.html) — accessed 2026-11-06
- [Distributed locks with Redis — Redis docs (Redlock)](https://redis.io/docs/latest/develop/clients/patterns/distributed-locks/) — accessed 2026-11-06
- [Design a Distributed Lock Service — Hiring Bar](https://hiringbar.dev/cases/distributed-locking) — accessed 2026-11-06
