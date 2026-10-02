# PagerDuty engineering track

Sits beside [datadog.md](datadog.md) and [grafana.md](grafana.md): **incident response / digital operations** (AI Operations Cloud), not a metrics-SaaS or LGTM loop. Official [Careers](https://careers.pagerduty.com/): started by three Amazon developers frustrated with on-call; today they sell operations to a large share of the Fortune 100. Official [Hiring Process](https://careers.pagerduty.com/hiring-process) is the process source of truth. Recruiter confirms **product vs infra vs incident-platform**, language (Scala / JVM reports), **assessment vs take-home**, and **AI-in-pad**.

Typical timeline **3–6 weeks** (official: they accommodate schedule; 2026 guides). Incidents: [../roles/devops-sre.md](../roles/devops-sre.md). Notifications: [../answers/system-design-notification.md](../answers/system-design-notification.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Do **not** invent Amazon-style LPs. Use the official five on [Careers](https://careers.pagerduty.com/) / [FAQ](https://careers.pagerduty.com/frequently-asked-questions).

| Official value | What they score |
| --- | --- |
| **Champion the customer** | Users first; make it easy; ship the product they feel |
| **Run together** | Belonging; deepen bonds; team up under a page |
| **Ack & own** | See the opportunity, make it yours, do right (from **ack** on an incident) |
| **Take the lead** | Disrupt, improve everywhere, learn forever |
| **Bring your self** | Earn trust; be present; have heart |

Official [Candidate Promise](https://careers.pagerduty.com/candidate-promise): authentic, timely, fair; you know where you stand. “Why PagerDuty?” that only says “I use PagerDuty / on-call / AI ops” fails. Name a **page, escalation, dedupe, or blast-radius** problem you have lived.

## Official + reported process

Official hiring page publishes the **skeleton**. All interviews are **virtual Zoom**. Official 2020 [engineering blog](https://www.pagerduty.com/eng/evolving-tech-interview-process/): they **retired** balanced-parentheses / sum-to-100 screens for a **small take-home MVP + live extend**. 2026 guides still report that shape — confirm the week you interview.

| Stage | Official / reported |
| --- | --- |
| Application review | Status email at every stage |
| Recruiter screen (~30 min) | Skills, why PagerDuty, questions |
| Assessment (~1 h, if used) | Coding, simulation, or writing — recruiter tells you |
| Hiring manager (~45 min) | Hireability + role fit; bring questions |
| Team interviews (2–3 × ~45 min) | Behavioral **STAR** + technical; values scored |
| Offer | Recruiter / HM / teammate / ERG conversations welcome |

Official: competency-based, not riddles. Blog rubric axes: **culture, code, productivity** — structure, adapting the skeleton, tool use, coachability. Gold-plating the take-home **hurts** the live extend. 2026 guides (Dataford) add a later **system design / data-modeling** hour — treat as **reported**.

## How this track differs

| vs Datadog / Grafana | vs FAANG |
| --- | --- |
| Product is **paging / escalation / ack**, not TSDB cardinality | Official **practical MVP + pair extend**, not Blind-75 theater |
| Official **Ack & own** is a platform verb | Design is **alert routing / status page isolation** |
| Flexible / remote-friendly careers copy | Guides: JVM / Scala fluency helps; not a syntax quiz |

## Coding and design flavor

Official blog: ~30 min **food-app** (or similar) skeleton in **your** stack, then pair on new features. Keep it small. Guides: alert routing, escalation policies, overrides, timezone rotations, dedupe; status page that stays up when the systems it reports on are down. Related: [../general/pair-programming.md](../general/pair-programming.md), [../general/take-homes.md](../general/take-homes.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** operations company — an incident you acked and owned end to end.
2. Take-home: three-feature MVP; do **not** gold-plate; tests you can extend live.
3. Design: escalation policy + override without paging the whole team twice.
4. Values: Ack & own — a time you took a page that was “not your service.”
5. Questions for them: assessment vs take-home, language, AI-in-pad, on-call reality.

## Prep checklist

- [ ] Read [values](https://careers.pagerduty.com/) + [Hiring Process](https://careers.pagerduty.com/hiring-process)
- [ ] Recruiter: assessment shape, take-home vs skip, language, AI / recording
- [ ] Small MVP you can extend in 45 min; one alert-routing sketch
- [ ] Five STAR stories mapped to the five values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [PagerDuty Careers](https://careers.pagerduty.com/) — accessed 2026-10-02
- [Hiring Process — PagerDuty](https://careers.pagerduty.com/hiring-process) — accessed 2026-10-02
- [Candidate Promise — PagerDuty](https://careers.pagerduty.com/candidate-promise) — accessed 2026-10-02
- [Frequently Asked Questions — PagerDuty Careers](https://careers.pagerduty.com/frequently-asked-questions) — accessed 2026-10-02
- [How We Evolved Our Tech Interview Process — PagerDuty Engineering](https://www.pagerduty.com/eng/evolving-tech-interview-process/) — accessed 2026-10-02
- [PagerDuty Interview Guide (2026) — techinterview.org](https://www.techinterview.org/companies/pagerduty-interview-guide/) — accessed 2026-10-02
- [PagerDuty Software Engineer Interview (2026) — Dataford](https://dataford.io/interview-guides/pagerduty/software-engineer) — accessed 2026-10-02
