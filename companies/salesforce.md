# Salesforce engineering track

Sits beside [atlassian.md](atlassian.md): **multi-tenant CRM / platform SaaS** (Sales Cloud, Service Cloud, Slack, Agentforce), not a generic FAANG slate. Official [How we hire](https://www.salesforce.com/company/careers/culture/how-we-hire/): behavioral / competency / situational stories; know the business via [Trailhead](https://trailhead.salesforce.com/). Official [values](https://www.salesforce.com/company/legal/compliance/code-of-conduct/leadership-and-values/): **Trust, Customer Success, Innovation, Equality, Sustainability** — Trust is #1. Recruiter confirms **AMTS–PMTS level**, **HackerRank**, and AI policy (careers: AI may screen **resumes**; that is not permission in the coding hour).

Typical timeline **2–6 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Multi-tenant / quotas: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md). Events / webhooks: [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md).

## Official culture (values + V2MOM)

Do **not** recite the table. Map **your** stories. Official Code of Conduct: values guide decisions; speaking up is expected.

| Official value | Careers / CoC one-liner |
| --- | --- |
| **Trust** | Integrity of people + technology; transparency; deliver on commitments |
| **Customer Success** | Earn the right to guide customers; partner, not vendor |
| **Innovation** | Beginner’s mind; AI / agents + humans; easy, integrated, scalable |
| **Equality** | Active allies; inclusive workplace; fundamental rights |
| **Sustainability** | Help orgs to net zero / nature positive |

Official [V2MOM](https://www.salesforce.com/blog/how-to-create-alignment-within-your-company/) (Benioff): **Vision, Values, Methods, Obstacles, Measures**. Every employee writes one; they are visible internally. “Why Salesforce?” that only says “CRM is big” fails. Name a **trust, isolation, or customer-success** tradeoff you have lived.

Trailhead SWE module: remote programming test on **HackerRank** (compile, design, scale, readable OO); onsite — **narrate**, clarify, whiteboard / pad.

## Official + reported process

Official How we hire + Trailhead SWE module; mix is **team-dependent**. Guides (SpaceComplexity, 2026):

| Stage | What they score |
| --- | --- |
| Recruiter (~20–30 min) | Level, location, process |
| HackerRank OA (official remote test; guides: 2 problems, ~60–75 min) | Compiles, edges, readable design — **hidden tests** |
| Live coding (2 × 45–60 min, guides) | Approach first, then code, then cases unprompted |
| System design (MTS+) | **Org / tenant isolation**, quotas, noisy neighbor, integrations |
| Values / behavioral (~45 min) | Trust + collaboration — solo-optimizer stories fail |

IC ladder in public writeups: **AMTS → MTS → SMTS → LMTS → PMTS**. Design bar jumps at MTS+; LMTS prompts stay vague on purpose.

## How this track differs

| vs FAANG | vs Atlassian |
| --- | --- |
| Values hour is a **real veto**; Trust outranks cleverness | Atlassian: five values + HC + Team Anywhere |
| Design is **multi-tenant CRM**, not “design Instagram” | Jira permissions vs **org-wide data isolation** |
| Official HackerRank is a **filter**, not a vibe check | Slack is in-house (Harris); still confirm team stack |

## Coding and design flavor

OA / live: medium windows, graphs, heaps, DP. Explain brute force, then the cleaner bound.

Design: one customer’s runaway Flow cannot starve the cell; **per-tenant** rate limits and storage; event bus → outbound webhooks with retry isolation. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Trust over ship date — a time you delayed or scoped down.”
2. Medium graph / window; narrate before typing.
3. Rate-limit a multi-tenant API so one org cannot noisy-neighbor another.
4. Org data migration with rollback and field-mapping conflicts.
5. V2MOM-shaped: vision + **measure** for a project you led (not only the method).

## Prep checklist

- [ ] Read [How we hire](https://www.salesforce.com/company/careers/culture/how-we-hire/) + [values](https://www.salesforce.com/company/legal/compliance/code-of-conduct/leadership-and-values/) + [V2MOM](https://www.salesforce.com/blog/how-to-create-alignment-within-your-company/)
- [ ] Recruiter: level, HackerRank vs live mix, AI policy, design yes/no
- [ ] Timed 75-min two-problem OA mock
- [ ] One multi-tenant design mock ([../general/system-design.md](../general/system-design.md))
- [ ] STAR bank for **all five** values — Equality and Sustainability included
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How we hire — Salesforce](https://www.salesforce.com/company/careers/culture/how-we-hire/) — accessed 2026-09-10
- [Leadership and values / Code of Conduct — Salesforce](https://www.salesforce.com/company/legal/compliance/code-of-conduct/leadership-and-values/) — accessed 2026-09-10
- [What is the Salesforce V2MOM? — Salesforce](https://www.salesforce.com/blog/how-to-create-alignment-within-your-company/) — accessed 2026-09-10
- [Remote programming test — Trailhead](https://trailhead.salesforce.com/content/learn/modules/strategies-for-successful-software-engineer-interviews/take-the-remote-programming-test) — accessed 2026-09-10
- [Salesforce SWE interview (2026) — SpaceComplexity](https://spacecomplexity.ai/blog/salesforce-software-engineer-interview) — accessed 2026-09-10
