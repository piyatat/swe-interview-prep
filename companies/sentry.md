# Sentry engineering track

Sits beside [datadog.md](datadog.md) and [grafana.md](grafana.md): **developer-first error monitoring / APM**, not a full-fleet infra dashboard loop. Official [Careers](https://sentry.io/careers/): **open-source** company; product saves **1M+ developers** at **200K+** orgs; **790B+ events / month**. Recruiter confirms **Issues vs ingest vs SDK vs AI / evals**, language (Python / TypeScript / Rust are common), and **SF / Vienna / Toronto** vs distributed.

Typical timeline **3–4 weeks** (2026 guides). Metrics: [../answers/system-design-metrics.md](../answers/system-design-metrics.md). Incidents: [../general/debugging-rounds.md](../general/debugging-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (six values)

Do **not** invent Amazon-style LPs. Use the six on [Careers](https://sentry.io/careers/) (same list as the 2020 values post, still printed).

| Official value | What they score |
| --- | --- |
| **For every developer** | The user **is** a developer — empathy, not ticket-only fixes |
| **Pixels matter** | Details; craft; the last 5% of the SDK / UI |
| **Feedback is priceless** | Direct, respectful, sincere — on the **work** |
| **Work in progress** | Ownership + autonomy; you add structure, you do not wait for a rulebook |
| **Step by step** | Iterate: small change, measure, try again |
| **Value people** | Disagree on the route, then commit; diverse backgrounds |

Official careers also: **be more than a cog** (small team, high leverage). “Why Sentry?” that only says “I used the SDK / remote / OSS” fails. Name a **grouping, sampling, or symbolication** problem you have lived.

Hubs: San Francisco, Vienna, Toronto. Guides: **distributed-first**; hubs are optional — confirm with the recruiter.

## Official + reported process

Careers publishes values + openings, **not** a full SWE stage list. 2026 guides (techinterview.org). Treat stages as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30 min) | Background, mission fit, logistics |
| Coding pair (~60 min) | Practical Python or TypeScript — parse / transform, not a puzzle |
| Virtual onsite | Guides: **2 coding**, **1 system design**, **1 craft deep-dive**, **1 behavioral** |
| Some loops | Take-home or extra HM hour — ask |
| Decision | ~3–4 weeks door to door |

Design flavor: **ingest, quotas, grouping, symbolication**. Coding: production-style refactors, malformed payloads, tests and names. Behavioral: a time a **developer** was blocked and you fixed it without being told.

## How this track differs

| vs Datadog / Grafana / New Relic | vs FAANG |
| --- | --- |
| Official **developer-as-customer** + six values | Design is **events / fingerprints / symbols**, not “design Twitter” |
| Official **open-source** SDK + self-host path | Coding is **practical parse / pipeline**, not Blind-75 theater |
| Error grouping + native symbolication are the product | Public OSS work is a real signal |

## Coding and design flavor

Guides: Kafka (or similar) so ingest survives a spike; **per-project quotas** so one noisy tenant cannot starve the rest; sampling + dead-letter when the queue overflows; stable **fingerprints** (strip addresses / line noise) vs over- and under-grouping; native symbolication (dSYM / ProGuard / DWARF) at scale. Related: [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md), [../roles/backend.md](../roles/backend.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** error-monitoring company — a time you used a fingerprint or sample-rate call.
2. Pair: parse a messy event; do not crash on bad JSON; add a test.
3. Design: 1M events/sec burst; name the buffer, the quota, and what you drop last.
4. Values: Feedback is priceless — a review that changed the design.
5. Questions for them: Issues vs ingest vs SDK, language, hub vs remote, AI-in-pad.

## Prep checklist

- [ ] Read [Careers values](https://sentry.io/careers/) + [values post](https://blog.sentry.io/motivational-posters-are-so-90s-our-values-are-not/)
- [ ] Recruiter: team, language, onsite mix, location persona
- [ ] One timed practical parse + one ingest / grouping sketch
- [ ] STAR mapped to several of the six (developer customer, pixels, feedback, step-by-step)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers \| Sentry](https://sentry.io/careers/) — accessed 2026-10-04
- [Motivational Posters Are So '90s, Our Values Are Not — Sentry](https://blog.sentry.io/motivational-posters-are-so-90s-our-values-are-not/) — accessed 2026-10-04
- [Sentry Interview Guide (2026) — techinterview.org](https://www.techinterview.org/companies/sentry-interview-guide/) — accessed 2026-10-04
- [Sentry Software Engineer Interview (2026) — knok](https://knok.work/blog/sentry-software-engineer-interview.html) — accessed 2026-10-04
