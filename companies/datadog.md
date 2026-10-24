# Datadog engineering track

Sits beside [product-companies.md](product-companies.md) and [../roles/devops-sre.md](../roles/devops-sre.md): **observability + security platform**, write-heavy telemetry, on-call taste — not a generic FAANG slate. Official [Careers](https://careers.datadoghq.com/): **modern monitoring and security for the cloud age**. Official [Candidate Experience](https://careers.datadoghq.com/candidate-experience/) is the process source of truth. Recruiter confirms **CoderPad vs take-home**, **AI policy**, team vs post-loop match, and whether a step is **in person**.

Typical timeline **3–6 weeks** (guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Debug / incident: [../general/debugging-rounds.md](../general/debugging-rounds.md). Metrics design: [../answers/system-design-metrics.md](../answers/system-design-metrics.md).

## Official culture (Careers + Pup Culture)

Do **not** recite a values table. Map **your** stories.

Official careers + engineering write-ups keep repeating the same behaviors:

| Official signal | Where it shows up |
| --- | --- |
| **Ownership and impact** | Propose → build → ship → **run** (Pup Culture / Madrid hub) |
| **Intelligent risk, little red tape** | Experiment, fail fast, retry (eng leadership spotlights) |
| **Accountability, not blame** | Feedback culture; on-call is a skill, not a gotcha |
| **Hybrid + hubs** | NY / Paris / other offices; hybrid days vary by team |

“Why Datadog?” that only says “high-growth SaaS” fails. Name a real telemetry problem (cardinality, alert noise, agent cost) you have lived.

## Official + reported process

Official Candidate Experience (company-wide, not SWE-only):

| Stage | Official note |
| --- | --- |
| **Initial screen** | Recruiter and/or HM; Zoom/phone; aspirations + fit |
| **Face-to-face** | Multiple rounds or panels; **one step is expected in person** |
| **Take-home** | **Role-dependent**; recruiter scopes it |
| **Executive** | Some roles only |
| **Selection** | Panel debrief; recruiter delivers the offer |
| **Survey** | Post-interview feedback |

Official **[AI guidelines](https://careers.datadoghq.com/candidate-experience/interviewing-at-datadog-ai-guidelines/)** (updated **2026-05-13**) are more specific than the Candidate Experience one-liner. Ask the recruiter which hour you are in.

| Setting | Official |
| --- | --- |
| Resume / cover letter | AI polish **OK** if the doc still matches **your** skills |
| Take-home / presentation | Research OK; submission must be **your** conclusions; you will **defend it live** |
| **AI coding interviews** | Some roles **explicitly allow / expect** AI (example named: Claude). You will be told **in advance**. Score: how you use it + why |
| All other live coding / tech assessments | **No AI** unless they said this is an AI hour |
| Non-technical (HM, partnership, people) | **No AI** — undisclosed use can **disqualify** |
| Prep | AI to research Datadog is OK; do not let it be your only source |

Misuse or **failure to disclose** can end the candidacy. Default assumption: **AI-off** in the live pad.

Guides (2026 SWE): 30 min recruiter → 60 min **CoderPad** (systems-flavored mediums: parser, aggregator, thread-safe structure) → virtual loop of **2 coding + design + often debug/incident + behavioral**. Several write-ups say hiring is **centralized** and **team match happens after** the bar — confirm; official page is role/team-dependent.

## How this track differs

| vs FAANG | vs Stripe / Cloudflare |
| --- | --- |
| Design is **ingest / TSDB / tags / alerts**, not “design Twitter” | Stripe is money + bug-bash; Cloudflare is edge / Workers |
| Coding often has a **concurrency or throughput** accent | Official take-home is optional, not the default gate |
| On-call / blast-radius stories are scored | Official default is **AI-off** live; some roles now have an **announced** AI hour |

## Coding and design flavor

Live problems look like a **metrics aggregator, log parser, or rate limiter** — correct, then talk lock grain and memory. Design: agent → ingest → buffer → hot TSDB + tag index → query + alert eval. Name **cardinality** (user-id as a tag) as the failure mode. Related: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md).

Official eng blogs (interview-useful, not a spec to recite): short-term metrics vs tag **index**; later **Monocle** Rust engine, shard-per-core, LSM/memtable. Say the **split** (points vs tags) and why queries fan out.

## Sample prompts (shapes, not leaked puzzles)

1. “Why observability — a time cardinality or alert-fatigue burned you.”
2. Implement a thread-safe sliding-window counter; then “10× hosts.”
3. Design metrics ingest + query for 100k hosts; where does a high-cardinality tag explode?
4. Incident: p99 dashboards jumped; walk symptoms → blast radius → mitigate before root cause.
5. Project deep-dive: a pipeline you owned, a number, what you would change.

## Prep checklist

- [ ] Read [Candidate Experience](https://careers.datadoghq.com/candidate-experience/) + [AI guidelines](https://careers.datadoghq.com/candidate-experience/interviewing-at-datadog-ai-guidelines/) + [Engineering careers](https://careers.datadoghq.com/engineering/)
- [ ] Recruiter: which hours are AI (if any), take-home or not, in-person step, team match timing
- [ ] One **systems-flavored** CoderPad mock (narrate; concurrency follow-up)
- [ ] One metrics design mock ([../answers/system-design-metrics.md](../answers/system-design-metrics.md))
- [ ] One incident STAR ([../answers/behavioral-failure.md](../answers/behavioral-failure.md))
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Candidate Experience — Datadog Careers](https://careers.datadoghq.com/candidate-experience/) — accessed 2026-10-24
- [Interviewing at Datadog: AI Guidelines](https://careers.datadoghq.com/candidate-experience/interviewing-at-datadog-ai-guidelines/) — accessed 2026-10-24
- [Engineering — Datadog Careers](https://careers.datadoghq.com/engineering/) — accessed 2026-10-24
- [Join Our Pack — Datadog Careers](https://careers.datadoghq.com/) — accessed 2026-10-24
- [Evolving our real-time timeseries storage — Datadog](https://www.datadoghq.com/blog/engineering/rust-timeseries-engine/) — accessed 2026-09-04
- [Timeseries indexing at scale — Datadog](https://www.datadoghq.com/blog/engineering/timeseries-indexing-at-scale/) — accessed 2026-09-04
- [Datadog Interview Guide 2026 — techinterview.org](https://www.techinterview.org/post/3233460269/datadog-interview-guide-2026-metrics-monitoring-systems-and-on-call-culture/) — accessed 2026-09-04
- [Datadog Interview Prep 2026 — Jobs by Culture](https://jobsbyculture.com/blog/datadog-interview-prep-2026) — accessed 2026-09-04
