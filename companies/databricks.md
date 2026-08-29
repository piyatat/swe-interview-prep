# Databricks engineering track

Sits beside [product-companies.md](product-companies.md) and [ai-labs.md](ai-labs.md): **data + AI platform**, not a consumer social app. Official careers page: after apply, expect **hiring-manager phone → technical phone → virtual panel → references → hiring committee**. Recruiter is the source of truth for your team (backend vs FE vs database vs intern).

Confirm **level and AI policy**. Design prompts skew **infra / lakehouse**, not “design Twitter.” Concurrency is a **first-class** panel, not trivia — see [../general/cs-fundamentals.md](../general/cs-fundamentals.md).

Typical timeline **4–8 weeks** (guides). Official backend packet (Apr 2025) also lists an internal **team-matching** step before the full panel.

## Official process (careers + interview-prep PDF)

Backend / general SWE (summarized from Databricks’ own prep PDF):

| Stage | Official note |
| --- | --- |
| Recruiter screen (~30 min) | Fit, role, logistics |
| Technical screen (~60 min) | Live code (CoderPad). Language-agnostic; fluency + DS/perf expected |
| Team matching | Internal — nothing to prep |
| Full panel (4–6 × ~60 min) | Mix below |
| Hiring committee | Internal packet |
| References, then offer | Official careers page lists both |

**Backend panel types they name:** Coding (production-quality, tests, edges, Big-O), Algorithms, **System Programming** (threads, sync, I/O, buffering), Architecture (end-to-end, CoderPad Draw), Domain deep-dive, Cross-functional / hiring manager.

**FE / full-stack mix they name:** FE code (fetch + UI state; vanilla or React/etc. in CoderPad), FE systems (API + sync, some implementation), product-design collab, FE infrastructure (refactors, builds, perf), HM.

**Database-track extras:** storage or stream-processing design; optional **papers** seminar (open-book) on query/storage optimization.

2020 hiring-manager blog (dated; still useful signals): laptop over whiteboard, staged feature specs, tests as you go, **take hints**, STAR on behavioral. Systems roles emphasize multithreading. They score **ownership under unclear team boundaries** and **learning rate**.

## How 2026 candidate guides differ (confirm)

Guides often insert a **proctored OA** (CodeSignal / HackerRank, ~70 min) and describe the panel as two coding hours + **one concurrency hour** + one design + HM. Official PDF folds that work into **System Programming** + Coding/Algorithms. Ask which slate you have.

OA / phone-screen logistics overlap [../general/online-assessments.md](../general/online-assessments.md).

## What they score (official + consistent reports)

| Axis | Show |
| --- | --- |
| Correctness under concurrency | Bounded queue, wait/signal, shutdown; no “hope the race does not hit” |
| Infra design | Partitioning, shuffle/skew, consistency of writers, at-least-once + idempotent sinks |
| Collaboration | Interviewer hints are the job; do not lock a dead approach |
| Ownership | Adjacent systems you actually understood; what you would redo |

Design shapes (not leaked puzzles): lakehouse **table-version metadata** with concurrent writers; job scheduler over object storage; ingest → aggregate firehose; “one partition is 10× the others.”

## Sample prompts (shapes)

1. Thread-safe **bounded blocking queue**; then many producers/consumers; then clean shutdown.
2. Metadata service for table versions — two writers, no silent clobber.
3. Sliding-window top-K over an event stream (ties to [../answers/coding-top-k.md](../answers/coding-top-k.md)).
4. Cycle in a build graph ([../answers/coding-course-schedule.md](../answers/coding-course-schedule.md)).
5. Project deep-dive without employer jargon.

## Prep checklist

- [ ] Recruiter: backend vs FE vs database vs intern; OA or not; AI tools; CoderPad language
- [ ] One **concurrency** mock (queue / RW lock / thread pool) until the race is boring
- [ ] One **data-infra** design (partition, commit, failure) in a shared doc
- [ ] Read lakehouse / Spark / Delta at **vocabulary** level — do not fake production Spark
- [ ] HM: ownership + ambiguity stories ([../general/hiring-manager.md](../general/hiring-manager.md))

Private-company equity is illiquid until a tender/IPO — treat headline TC like any late-stage offer: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Sources

- [Engineering at Databricks — How we interview](https://www.databricks.com/company/careers/engineering-at-databricks) — accessed 2026-08-29
- [Engineering Careers Site Interview Prep (Apr 2025 PDF) — Databricks](https://www.databricks.com/sites/default/files/2025-04/engineering-careers-site-interview-prep-april-2025-002.pdf) — accessed 2026-08-29
- [Engineering Interviews — A Hiring Manager's Guide — Databricks Blog (2020)](https://www.databricks.com/blog/2020/01/22/engineering-intervews-a-hiring-managers-guide.html) — accessed 2026-08-29
- [What the Databricks engineering interview actually tests — techinterview.org](https://www.techinterview.org/post/3233476801/databricks-engineering-interview/) — accessed 2026-08-29
- [Databricks SWE interview questions — interviewing.io](https://interviewing.io/databricks-interview-questions) — accessed 2026-08-29
