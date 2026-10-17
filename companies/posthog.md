# PostHog engineering track

Sits beside [datadog.md](datadog.md), [sentry.md](sentry.md), and [grafana.md](grafana.md): **product analytics / Product OS** (events, flags, replay, experiments), not APM logs and not error grouping. Official [Careers](https://posthog.com/careers): remote, small autonomous teams, transparent pay calculator, **paid SuperDay**. Recruiter confirms **product-engineer vs platform vs ingest / ClickHouse**, stack, and timezone (careers: GMT+2 to GMT−8 for product engineer).

Typical path is **2–3 short interviews then a paid work day** (careers). SuperDay / take-homes: [../general/take-homes.md](../general/take-homes.md). Debug hour: [../general/debugging-rounds.md](../general/debugging-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Handbook [engineering hiring](https://posthog.com/handbook/people/hiring-process/engineering-hiring) + [values](https://posthog.com/handbook/company/values). Map **your** stories. Do not invent FAANG LPs.

| Official signal | What they score |
| --- | --- |
| **Pick up a new stack fast** | Public stack; years-of-X is not the bar |
| **Built something from scratch** | Founder, solo side project, or only-dev at work |
| **Written communication** | Default-public writing; Slack/handbook, not slideware |
| **AI-pilled** | Things **agents** actually use (API, MCP, evals, machine docs) — scars, not prompts |
| **User-centric** | Eng does support / demos; you want that |
| **You're the driver** | High ownership; ship to learn; fix or give direct feedback |
| **Make it public / Why not now? / Do more weird / Optimistic** | Transparency, ship-today, small-team weird, play offense |

“Why PostHog?” that only says “open-source Mixpanel” fails. Name an **ingest, flag, replay, or warehouse** problem you have lived.

## Official process (engineering)

Handbook is the eng skeleton. Careers is company-wide (times “vary by role”). Prefer the recruiter email.

| Stage | Official |
| --- | --- |
| Application | Talent review vs needs |
| Culture screen | 20–30 min (careers: ~30) — fit, communication, logistics |
| Technical screen | Handbook: **60 min architecture / past-work workshop**. **No whiteboarding, no brain teasers, no live coding** (careers: ~45 min, no live coding) |
| Culture & motivation | 20–25 min with a Blitzscale exec |
| SuperDay | Paid full day (**$1,000 USD**). Build from scratch + 45 min **debug (AI off)** + buddy check-in + short founder/exec chat |
| Decision | Buddy reviews output; **within a few days** (SuperDay guide: aim **48 hours**) |

SuperDay: task is **deliberately too big**; score **prioritize and ship a working core**. **≥80%** of energy on the project. AI is **expected on the project** but you must **walk the architecture**; **no AI in the debug session**. Use Slack; they review **git history**.

## How this track differs

| vs Datadog / Sentry / Grafana | vs FAANG |
| --- | --- |
| Official **no-LeetCode tech screen** + **paid SuperDay** | Product is **events / flags / replay**, not “design Twitter” |
| AI-on-project / AI-off-debug is published | Written handbook culture is the loop |
| Small remote teams; you talk to users | “I only grind DSA” misses SuperDay + product sense |

## Coding and design flavor

Official product: analytics, session replay, feature flags, experiments, data warehouse, error tracking. Design: event ingest, ClickHouse-shaped queries, flag evaluation, replay pipeline. Related: [../answers/system-design-metrics.md](../answers/system-design-metrics.md), [../general/debugging-rounds.md](../general/debugging-rounds.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** product OS — portable “I like analytics” is weak.
2. Tech screen: notification or deploy-guardrail design; say **why this store**, not a tool list.
3. SuperDay: ship one useful path; explain what you skipped and what the data showed.
4. Debug: README first, hypothesis, then change; no AI.
5. Questions for them: SuperDay stack choice, AI-in-pad vs handbook, which small team.

## Prep checklist

- [ ] Read [Engineering hiring](https://posthog.com/handbook/people/hiring-process/engineering-hiring) + [tech screen](https://posthog.com/handbook/people/hiring-process/engineering-tech-screen) + [SuperDay](https://posthog.com/handbook/people/hiring-process/engineering-superday) + [values](https://posthog.com/handbook/company/values)
- [ ] Recruiter: team, 45 vs 60 min screen, SuperDay date, AI rules
- [ ] One product-analytics design + one timed debug-in-unfamiliar-repo
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Engineering Hiring — PostHog Handbook](https://posthog.com/handbook/people/hiring-process/engineering-hiring) — accessed 2026-10-17
- [Preparing for the technical screen — Handbook](https://posthog.com/handbook/people/hiring-process/engineering-tech-screen) — accessed 2026-10-17
- [Preparing for the engineering SuperDay — Handbook](https://posthog.com/handbook/people/hiring-process/engineering-superday) — accessed 2026-10-17
- [Values — PostHog Handbook](https://posthog.com/handbook/company/values) — accessed 2026-10-17
- [Careers - PostHog](https://posthog.com/careers) — accessed 2026-10-17
