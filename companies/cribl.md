# Cribl engineering track

Sits beside [datadog.md](datadog.md) and [splunk.md](splunk.md): **telemetry control plane** (route, reduce, enrich, store, search) so IT and security keep **vendor choice**, not an APM agent loop and not a SIEM ingest-only hour. Official [platform](https://cribl.io/platform/): **Stream** (data in motion), **Edge** (collect on the host), **Lake** (open-format retain), **Search** (query in place). Recruiter confirms **Stream vs Edge vs Cloud / Search**, Node/Go vs frontend, remote, and whether the technical is **pair or take-home**.

Typical timeline **~3–5 weeks** (2026 guides). Pipeline design: [../answers/system-design-metrics.md](../answers/system-design-metrics.md), [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Official [Culture at Cribl](https://cribl.io/careers/culture-at-cribl/). Map **your** stories. Employees are **goats**; do not perform the mascot.

| Official value | Careers one-liner |
| --- | --- |
| **Customers First, Always** | Customer love is a team sport; balance needs across functions |
| **Irreverent, but Serious** | Fun is real; shipping is still the job |
| **Insatiably Curious** | Hungry for the problem; stand in the customer’s shoes |
| **Open and Authentic** | Clarity is an advantage; information without context confuses |
| **Excel Together** | Great work is a herd sport, not every-goat-for-themselves |

Official [Scaling Culture](https://cribl.io/blog/scaling-culture-on-purpose/) publishes a **Values Interview Rubric** (curiosity, customer-first, collaboration) and sample questions. “Why Cribl?” that only says “observability is hot / goats” fails. Name a **ingest tax, route-and-reduce, or multi-destination** problem you have lived.

## Official + reported process

Official eng blog: they **dropped early take-homes** as the default because review became hunt-the-weakness. First technical: **pair with a senior** on a project with **feature requirements and real bugs**. Structured behavioral + on-the-job hypotheticals (Google Rework / OPM-style), not brain teasers.

2026 guides (Dataford) still report recruiter → HM → **take-home** → panel. Treat extra take-home as **reported**. Ask which you have.

| Stage | Official / reported |
| --- | --- |
| Recruiter | Background, team, remote, next steps |
| Hiring manager (reports) | Experience, telemetry domain, level |
| Technical | **Official:** collaborative pair, real bugs. **Reports:** take-home + code walk |
| Panel / values | Architecture, ingest / route design, Values Interview Rubric |
| Timeline | ~3–5 weeks (guides) |

Pair: [../general/pair-programming.md](../general/pair-programming.md). If you get a take-home: production README, stream large files, error handling — then **defend** it.

## How this track differs

| vs Datadog / Splunk | vs generic FAANG |
| --- | --- |
| Product is **where data goes**, not only how you chart it | Official interview change: pair over kit/take-home |
| Design names **reduce / route / replay**, not “put it in Kafka” | Values rubric is scored, not a vibe check |
| Goat culture is public; still a serious telemetry bar | Practical parse / I/O more than puzzle DSA |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** telemetry pipeline — vendor lock-in or ingest-cost constraint, not “I like logs.”
2. Pair: add a feature and fix a bug in an existing processor; narrate, accept hints.
3. Design: 100 GB look-up / multi-destination route; memory vs stream; what you drop.
4. Curiosity: a problem you did not know, how you learned, what you shipped.
5. Questions for them: pair vs take-home, Stream vs Edge seat, remote, AI-in-pad.

## Prep checklist

- [ ] Read [Culture](https://cribl.io/careers/culture-at-cribl/) + [interview-process blog](https://cribl.io/blog/how-cribl-changed-its-interview-process-for-engineers/) + [platform](https://cribl.io/platform/)
- [ ] Recruiter: pair vs take-home, language, team (Stream / Edge / Search / Cloud)
- [ ] One pair in an unfamiliar repo + one ingest/route design with an explicit drop policy
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Culture at Cribl](https://cribl.io/careers/culture-at-cribl/) — accessed 2026-11-06
- [How Cribl Changed Its Interview Process for Engineers](https://cribl.io/blog/how-cribl-changed-its-interview-process-for-engineers/) — accessed 2026-11-06
- [Scaling Culture on Purpose — Cribl](https://cribl.io/blog/scaling-culture-on-purpose/) — accessed 2026-11-06
- [The Cribl Platform](https://cribl.io/platform/) — accessed 2026-11-06
- [Cribl Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/cribl/software-engineer) — accessed 2026-11-06
