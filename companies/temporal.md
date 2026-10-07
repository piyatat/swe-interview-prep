# Temporal engineering track

Sits beside [confluent.md](confluent.md) and [cockroach.md](cockroach.md): **durable execution — Workflows, Activities, Event History, Temporal Cloud**, not a generic Kafka or distributed-SQL slate. Official [Careers](https://temporal.io/careers) publishes four values and a **remote-first** “how we work.” Official [Workflows](https://docs.temporal.io/workflows) + [Why Temporal](https://docs.temporal.io/evaluate/why-temporal) are the product vocabulary. Recruiter confirms **open-source server vs Cloud (compute / storage / foundations) vs SDK**, Go vs an SDK language, and on-call (standard on most eng roles).

Typical timeline **~3–5 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Streaming / log cousin: [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md). Job / cron cousin: [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official values (do not invent extra pillars)

Official [Careers](https://temporal.io/careers). Map **your** stories.

| Official value | What they score |
| --- | --- |
| **Unlock possibilities** | Root-cause + user, then build / learn — not ticket-taking |
| **Reliable as gravity** | Reliability is **how you operate**, not a slogan on the product |
| **Feedback that fuels** | Clear is kind; debate ideas, align, assume positive intent |
| **Fly together** | No silos / bystanders; right over easy; own the work, share the win |

Official how-we-work (same page): **remote-first** (most roles in-country remote; some hubs / territory limits); occasional travel for onboarding and offsites; **on-call** on most Engineering teams. “Why Temporal?” that only says “I used the SDK at work” fails. Name a **crash-safe workflow, replay bug, or idempotent activity** problem you have lived.

## Official + reported process

Official pages describe **culture + the job**, not a numbered SWE stage list. 2026 guides (techinterview.org) — treat counts as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30) | Why Temporal; server vs Cloud vs SDK; remote region; on-call |
| Coding (guides: ~60) | Medium DSA; correctness and edges over a clever trick |
| Virtual onsite (guides) | Two coding + system design + craft deep-dive + behavioral |
| Senior+ infra (guides) | Extra distributed-systems / history-shard round |
| Offer | Equity-heavy private company — ask **refresh + liquidity**, not only cash |

Guides: they want **event history + replay**, not “I would store a row and a cron.” Confirm AI-in-pad with the recruiter.

## How this track differs

| vs Confluent / Cockroach | vs FAANG |
| --- | --- |
| Design is **deterministic workflow + activities**, not partitions-only or Raft-SQL | Reported **craft / replay** hour, not only LC + generic HLD |
| Official values are four short lines — do not invent LPs | “I only grind arrays” misses determinism and idempotency |
| Remote-first + on-call is written on Careers | Cadence heritage; still ask what *this* team owns |

## Coding and design flavor

Coding: maps, graphs, queues; then **retries, exactly-once vs at-least-once, shard ownership**. Design: persist an append-only Event History; replay Workflow code from the start (or cache) so a crashed Worker resumes; **never** call `now()` / random / unordered map iteration inside Workflow code — those belong in Activities, with the result recorded. Official docs: Activities do I/O (API, DB, LLM); replay **reuses** the recorded result. Related: [../answers/system-design-payment.md](../answers/system-design-payment.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** surface (Matching, history, Cloud compute, SDK) — “I like distributed systems” is weak.
2. Live: medium + what breaks if a retry fires twice.
3. Design: workflow engine that survives process death; what must be deterministic.
4. Values: you chose the right outcome over the easy one — evidence, who you told.
5. Questions for them: Cloud vs OSS mix, on-call load, Worker versioning on *this* team.

## Prep checklist

- [ ] Read [Careers](https://temporal.io/careers) values + [Workflows](https://docs.temporal.io/workflows) + [Why Temporal](https://docs.temporal.io/evaluate/why-temporal)
- [ ] Recruiter: team, pad language, AI policy, on-call, remote region
- [ ] One medium + one “history + replay + idempotent activity” design
- [ ] STAR: ownership under uncertainty, feedback you gave or took
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Temporal](https://temporal.io/careers) — accessed 2026-10-07
- [Temporal Workflow — docs](https://docs.temporal.io/workflows) — accessed 2026-10-07
- [Why Temporal? — docs](https://docs.temporal.io/evaluate/why-temporal) — accessed 2026-10-07
- [Software Engineer II, Open Source Server — Temporal](https://temporal.io/careers/81cc8698-59f8-418a-85fd-1fc154b33ee4) — accessed 2026-10-07
- [Temporal Interview Guide (2026) — techinterview.org](https://www.techinterview.org/companies/temporal-interview-guide/) — accessed 2026-10-07
