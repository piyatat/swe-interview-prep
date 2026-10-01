# Cockroach Labs engineering track

Sits beside [snowflake.md](snowflake.md) and [mongodb.md](mongodb.md): **distributed SQL (CockroachDB)** — Postgres-compatible, Raft + MVCC — not a warehouse or document-store loop. Official [Careers](https://www.cockroachlabs.com/careers/): mission is **simplify how businesses build and operate world-changing applications**. Official [Open Interview Process](https://www.cockroachlabs.com/careers/open-interview/) is the process source of truth. Recruiter confirms **KV / SQL / CCR / cloud**, language (Go is the default), **office-first Mon/Tue/Thu vs remote**, and take-home vs CoderPad.

Typical timeline **3–5 weeks** (official: they aim to move promptly; 2026 guides). KV / consensus: [../answers/system-design-key-value-store.md](../answers/system-design-key-value-store.md). SQL: [../general/sql-interviews.md](../general/sql-interviews.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (four values)

Do **not** invent Spanner-team trivia as culture. Use the official four on [Careers](https://www.cockroachlabs.com/careers/).

| Official value | What they score |
| --- | --- |
| **Win with Customers** | Their outage / latency is your problem |
| **Build the Future** | Durable over clever; curious under change |
| **Achieve Together** | Understanding over ego; challenge the idea |
| **Own the Outcome** | Start-to-finish; precise; urgent |

Official FAQ: **hybrid** — office-assigned Roachers in **Mon / Tue / Thu**; fully remote roles are labeled. “Why Cockroach?” that only says “distributed SQL / NYC / AI era” fails. Name a **consistency, multi-region, or failover** problem you have lived.

## Official process (Open Interview)

Official page is unusually complete. After the recruiter screen they **do not share your resume or recruiter notes** with the hiring team — they score the **exercises**.

| Stage | Official note |
| --- | --- |
| Application | Greenhouse + Company Guide |
| Recruiter phone (~30 min) | Background; then take-home and/or technical phone |
| Technical phone / take-home | Phone: 30–60 min, **Google Hangouts + CoderPad** — coding, debugging, algorithms. Take-home typically **1–2 hours** |
| Team interviews | **4–5 exercise-based** hours; direct + cross-functional; break in the middle if you want |
| Hiring Committee | Independent hire / no-hire, then consensus; next step is references |
| References | **At least two**: one manager, one peer who did the work with you |
| Offer | Verbal then written; they will extend the deadline **up to one month** |

Official anti-bias bets: **exercise-based interviews**, **remove resumes**, **expectations-based JDs**. Engineering exercises are **coding and system design** (not riddles). 2026 guides (techinterview.org) add graph/tree DSA and Raft / txn design — treat those **shapes** as reported.

## How this track differs

| vs Snowflake / MongoDB | vs FAANG |
| --- | --- |
| Official **resume-blind** after recruiter | Design is **consensus / txn / ranges**, not “design Twitter” |
| Official **HC + mandatory references** | Coding often **systems-framed** graphs / trees |
| Office-first three days unless the posting says remote | Guides: closer to Spanner-team depth than a web-scale feed |

## Coding and design flavor

Official: show **why** you built it that way. Guides: medium-hard graphs / trees dressed as replicas; design probes serializable txns, Raft failover, multi-region quorum vs pin-a-row. Related: [../answers/coding-course-schedule.md](../answers/coding-course-schedule.md), [../general/cs-fundamentals.md](../general/cs-fundamentals.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** distributed-SQL company — a correctness-over-latency call.
2. CoderPad: graph / tree as “nodes = replicas”; narrate the invariant.
3. Design: serializable commit when the coordinator dies mid-2PC.
4. Values: Own the Outcome — a time you stayed through the ugly failover.
5. Questions for them: KV vs SQL team, take-home vs skip, hybrid days.

## Prep checklist

- [ ] Read [values](https://www.cockroachlabs.com/careers/) + [Open Interview Process](https://www.cockroachlabs.com/careers/open-interview/)
- [ ] Recruiter: language, take-home vs CoderPad, office vs remote, AI-in-pad
- [ ] Timed medium (graph / tree) + one Raft / txn / multi-region sketch
- [ ] Four STAR stories mapped to the four values
- [ ] Line up **two references** before HC week
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers at Cockroach Labs](https://www.cockroachlabs.com/careers/) — accessed 2026-10-01
- [Open Interview Process — Cockroach Labs](https://www.cockroachlabs.com/careers/open-interview/) — accessed 2026-10-01
- [Cockroach Labs Interview Guide (2026) — techinterview.org](https://www.techinterview.org/companies/cockroach-labs-interview-guide/) — accessed 2026-10-01
