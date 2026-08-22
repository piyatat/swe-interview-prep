# CS fundamentals

Many loops include a **fundamentals** round: OS, networking, concurrency, databases, and language/runtime depth for your primary stack.

## Operating systems

1. **Process vs thread** — isolation, memory, context switch cost.
2. **Virtual memory** — paging, TLB, why processes don’t stomp each other.
3. **Deadlock** — four conditions; prevention vs detection.
4. **Scheduling** — preemptive vs cooperative; fairness vs latency.
5. **I/O models** — blocking, non-blocking, async (epoll/kqueue).

## Networking

1. **HTTP/1.1 vs HTTP/2 vs HTTP/3** — head-of-line, multiplexing, QUIC.
2. **TCP vs UDP** — reliability, ordering, use cases.
3. **TLS handshake** — high level; why HTTPS matters in interviews.
4. **DNS** — resolution path; caching; failure modes.
5. **REST semantics** — idempotent methods, status codes, caching headers.

## Concurrency & parallelism

1. **Race condition vs data race** — definitions; fixes (locks, atomics, immutability).
2. **Mutex vs semaphore vs monitor** — when each applies.
3. **Thread pool** — bounded parallelism; backpressure.
4. **Async/await** — cooperative scheduling; don’t block the event loop (Node, etc.).

## Databases

1. **ACID** — practical meaning in transactions.
2. **Indexes** — B-tree intuition; when indexes hurt writes.
3. **Isolation levels** — dirty read, phantom read; MVCC overview.
4. **SQL vs NoSQL** — access patterns drive choice, not religion.
5. **Replication vs sharding** — read scale vs write scale.

## Distributed systems (mid/senior)

1. **CAP / PACELC** — real product tradeoff example.
2. **Idempotency** — payment and webhook handlers.
3. **Exactly-once** — why it’s hard; at-least-once + dedupe.
4. **Consensus** — Raft at high level; why leader election matters.
5. **Clock skew** — ordering events across nodes.

## Language-specific (pick your stack)

Prepare **5–10 depth questions** for your main language:

| Stack | Common probes |
| --- | --- |
| **JavaScript/TS** | Event loop, closures, prototype chain, Promise microtasks |
| **Python** | GIL, decorators, memory model, async asyncio |
| **Java/Kotlin** | JVM memory, GC generations, concurrency utilities |
| **Go** | Goroutines, channels, GC pacing |
| **Rust** | Ownership, borrowing, Send/Sync |

## Sources

- [Software Engineer Interview Questions — TalentVP](https://talentvp.com/en/blog/software-engineer-interview-questions) — accessed 2026-08-22
- [Software Engineer Interview Questions — EduAvenues](https://www.eduavenues.com/blog/software-engineer-interview-questions) — accessed 2026-08-22
