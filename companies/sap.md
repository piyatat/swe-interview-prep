# SAP engineering track

Sits beside [oracle.md](oracle.md), [workday.md](workday.md), and [salesforce.md](salesforce.md): **S/4HANA / HANA / BTP / Fiori**, not a consumer social loop. Official [company FAQ](https://www.sap.com/about/company/faq.html): purpose is **help the world run better and improve people’s lives** (sustainability at the core); vision is **bring out the best in every business**. Recruiter confirms **S/4 vs BTP vs HANA vs analytics vs industry cloud**, Java vs ABAP vs TypeScript, OA vendor, and site (Walldorf, Bangalore, Palo Alto, Dublin, …).

Typical timeline **~4–8 weeks** (2026 guides; German **works-council** sign-off can add days). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). SQL: [../general/sql-interviews.md](../general/sql-interviews.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official purpose (do not invent extra pillars)

Official FAQ — vision + three mission goals. Use these names, not a made-up “SAP LP” list.

| Official line | What they score |
| --- | --- |
| **Bring out the best in every business** | Customer process outcome, not vanity QPS |
| **Agility at scale** | Ship something adoptable; upgrade / migration path |
| **Achieve more across the value chain** | Integration across finance, supply, HR — not a standalone toy |
| **Sustainability at your core** | Data you can audit; planetary / ESG constraints when relevant |
| **Integrity** (ethics / Code) | Trust with customer data; speak up; no silent risk |

“Why SAP?” that only says “stable / ERP / they are German” fails. Name a **close, inventory, payroll, or residency** problem you have lived.

## Official AI policy (do not guess)

Job postings point at [Ethical Usage of AI in the Recruiting Process](https://jobs.sap.com/content/Ethical_usage_of_AI_in_the_recruiting_process/?locale=en_US). SAP LeanIX publishes the same candidate rules (SAP group):

| Allowed | Not allowed |
| --- | --- |
| Format / grammar on **your** CV; research SAP; STAR practice | Invent experience; paste an unedited AI essay as “you” |
| Clarify a concept before the loop | **Live** copilot on phone / video / recorded interviews |
| | Complete OA / psychometric / coding **with** a model |

Official: humans decide; SuccessFactors parse/match may assist; they say they **will not** auto-reject. Violation can **remove** you from the process.

## Official + reported process

Official [Hiring & Application Process](https://jobs.sap.com/content/Hiring-Process/?locale=en_US) exists; SWE round lists are **not** on that page. Some **intern / rotation** JDs (2026) publish four stages: OA → HR / Talent Discovery → onsite assessment → HM. Experienced SWE loops in 2026 guides (OphyAI, Papersadda, Dataford) — treat counts as **reported**.

| Stage | What they score |
| --- | --- |
| Apply (official) | [jobs.sap.com](https://jobs.sap.com); keywords that match **that** JD (BTP vs ABAP) |
| OA (guides: coding + aptitude; some intern JDs: two assessments) | Easy–medium DSA; sometimes CS MCQs |
| Recruiter (guides + intern JDs) | Why SAP; “IA / AI adoption mindset” on some student loops; visa / German |
| Tech loop (guides: 2–3 × 45–60 min) | Clean mediums, OOP / SQL / OS, **resume**, enterprise design |
| HM / HR (guides; Germany: works council) | Customer empathy, consensus, logistics |

## How this track differs

| vs Oracle / Workday | vs FAANG |
| --- | --- |
| Official **written** candidate AI rules + ERP domain | SQL + **process** talk over olympiad graphs |
| Walldorf consensus / works council vs US Super Day | Design is **multi-tenant close, GDPR residency**, not “design Twitter” |
| ABAP / HANA / CAP only if the **JD** says so | “How does the **controller** use this?” is a real probe |

## Coding and design flavor

OA / live: arrays, strings, hashing, trees, Two Sum family, reverse words, cycle detect, second-highest salary SQL. LLD: URL shortener, vending ER, parking lot. HLD (mid+): inventory that talks to S/4, multi-tenant BTP, OData / Fiori path. Talk **GDPR, close window, upgrade compatibility**. Related: [../answers/system-design-url-shortener.md](../answers/system-design-url-shortener.md), [../general/sql-interviews.md](../general/sql-interviews.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** SAP unit (S/4, BTP, HANA, Signavio) — portable “I like enterprise” is weak.
2. OA: one or two mediums plus aptitude; narrate as if they read the replay.
3. Tech: a join / index you would add — and a miss you would look up.
4. Design: real-time inventory with **residency** and a nightly finance close.
5. Customer success: you changed the API after sitting with the process owner.

## Prep checklist

- [ ] Read [Company FAQ](https://www.sap.com/about/company/faq.html) (purpose / vision) + [Ethical AI recruiting](https://jobs.sap.com/content/Ethical_usage_of_AI_in_the_recruiting_process/?locale=en_US) + the JD on [jobs.sap.com](https://jobs.sap.com)
- [ ] Recruiter: ABAP vs Java vs TS, OA vendor, Germany vs US loop, works-council clock
- [ ] One timed easy–medium pair + SQL drill + STAR vs **customer / integrity / value chain**
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Company FAQ — About SAP SE](https://www.sap.com/about/company/faq.html) — accessed 2026-09-20
- [Hiring & Application Process — SAP Careers](https://jobs.sap.com/content/Hiring-Process/?locale=en_US) — accessed 2026-09-20
- [Ethical Usage of AI in the Recruiting Process — SAP Careers](https://jobs.sap.com/content/Ethical_usage_of_AI_in_the_recruiting_process/?locale=en_US) — accessed 2026-09-20
- [Ethical Usage of GenAI — SAP LeanIX](https://www.leanix.net/company/career/ethical-usage-of-genai-in-the-application-and-recruiting-process) — accessed 2026-09-20
- [SAP Interview Process 2026 — OphyAI](https://ophyai.com/blog/company-guides/sap-interview-guide) — accessed 2026-09-20
- [SAP SWE Guide 2026 — Dataford](https://dataford.io/interview-guides/sap/software-engineer) — accessed 2026-09-20
- [SAP Interview Process 2026 — Papersadda](https://papersadda.com/article/sap-interview-process-2026/) — accessed 2026-09-20
