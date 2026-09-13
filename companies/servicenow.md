# ServiceNow engineering track

Sits beside [salesforce.md](salesforce.md) and [atlassian.md](atlassian.md): **enterprise workflow / Now Platform** (ITSM, HR, CSM, Now Assist), not a generic FAANG slate. Official [How we hire](https://careers.servicenow.com/how-we-hire/): human TA review (not a machine) → interviews with **prescriptive** guides → debrief. Official: coding assessment **or** presentation possible. Official AI FAQ: use AI to **prepare**; **no AI** on interviews, tests, or challenges unless they say otherwise. Recruiter confirms **HackerRank vs live**, Now Platform vs Now Assist vs infra, **work persona** (flex / remote / office), and AI policy.

Typical timeline **2–4 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). CS / SQL: [../general/cs-fundamentals.md](../general/cs-fundamentals.md), [../general/sql-interviews.md](../general/sql-interviews.md). LLD: [../general/low-level-design.md](../general/low-level-design.md). Workflows: [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md). Multi-tenant: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md).

## Official culture (four values)

Do **not** recite posters. Map **your** stories. Official [Workflow — Win as a Team](https://www.servicenow.com/au/workflow/culture/exploring-servicenow-values-win-team.html) names the set:

| Official value | What they score |
| --- | --- |
| **Win as a Team** | Cross-func help; hybrid collaboration; grow others |
| **Wow our Customers** | Enterprise predictability; customer problem first |
| **Stay Hungry and Humble** | Learn next; ego down as the company scales |
| **Create Belonging** | Unique perspective; inclusive default |

People Pact (CPO / careers): do your best work, live your best life, fulfill purpose together. “Why ServiceNow?” that only says “ITSM / AI is hot” fails. Name a **multi-tenant, upgrade-safe, or workflow** tradeoff you have lived.

## Official + reported process

Official How-we-hire is the skeleton. Guides (TechPrep, DesignGurus, techinterview.org) stretch it — treat OA MCQ counts as **reported**.

| Stage | What they score |
| --- | --- |
| Application (official) | Human review; transferable skills; dream-big |
| Recruiter (guides: ~30 min) | Why this product surface; enterprise comfort |
| Assessment (official: possible) | Guides: ~60 min HackerRank — 1–2 mediums + OS/DBMS MCQs |
| Technical screen (guides) | Reason **before** code; practical DSA / OO |
| Loop (guides: coding + design + HM) | Multi-tenant HLD; LLD / rules engine; ownership |
| Decision (official) | Team debrief; offer or notify |

Official: rounds vary by position; fair hiring + standard eval guides. Work personas are assigned by role and office distance.

## How this track differs

| vs FAANG | vs Salesforce / Atlassian |
| --- | --- |
| Official **AI-off** on scored work unless invited | Salesforce: Trust / V2MOM + CRM; Atlassian: Team Anywhere |
| Design is **tenants, workflows, upgrades**, not “design Twitter” | Same enterprise bar; ServiceNow is **metadata platform + Now Assist** |
| OA still has **CS-fundamentals MCQs** (guides) | Config-vs-code is a first-class design probe |

## Coding and design flavor

DSA: practical arrays / maps / trees; live round rewards the **plan**. Mid+: Java-flavored OO (workflow, permissions, rules). Design: isolate tenants, customer-specific config, upgrade without breaking anyone, SOC-ish audit. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Wow the customer — predictability beat a clever rewrite.”
2. OA-style: one medium + explain isolation vs a join.
3. LLD: approval / rules engine — extension point for a new predicate.
4. Design a workflow runner: millions of flows, thousands of tenants, one bad customer script.
5. When do you **configure** (Flow-style) vs write code?

## Prep checklist

- [ ] Read [How we hire](https://careers.servicenow.com/how-we-hire/) + [values](https://www.servicenow.com/au/workflow/culture/exploring-servicenow-values-win-team.html)
- [ ] Recruiter: OA vs live, Java vs JS, Now Assist vs platform, persona, AI (official: off unless invited)
- [ ] One CS/SQL pass and one timed medium pair
- [ ] One multi-tenant / workflow design + one OO LLD
- [ ] STAR bank: customer, ownership, humble learning
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How We Hire — ServiceNow Careers](https://careers.servicenow.com/how-we-hire/) — accessed 2026-09-13
- [Exploring ServiceNow Values: Win as a Team — Workflow](https://www.servicenow.com/au/workflow/culture/exploring-servicenow-values-win-team.html) — accessed 2026-09-13
- [ServiceNow's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/servicenow-interview-process) — accessed 2026-09-13
- [What Is the ServiceNow Interview Process Like? — DesignGurus](https://www.designgurus.io/answers/detail/what-is-the-servicenow-interview-process-like-round-by-round) — accessed 2026-09-13
- [ServiceNow Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/servicenow/) — accessed 2026-09-13
