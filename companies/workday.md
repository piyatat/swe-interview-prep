# Workday engineering track

Sits beside [salesforce.md](salesforce.md) and [servicenow.md](servicenow.md): **enterprise HCM + Financials SaaS** (workers, orgs, spend, multi-tenant), not a generic CRM loop. Official [AppDev interview prep](https://www.workday.com/content/dam/web/en-us/documents/other/appdev-interview-prep-guide.pdf): live **object-modeling** on **HackerRank CodePair + Zoom** — lightweight UML, **cardinalities**, inheritance; they want you to **traverse the model**, not dump pseudocode. Recruiter confirms **Application Development vs platform / infra**, OA vs modeling hour, and whether a Git/CLI round is in **your** loop.

Typical timeline **2–6 weeks** (2026 guides). LLD: [../general/low-level-design.md](../general/low-level-design.md). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Multi-tenant: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md). Booking-style concurrency (reported design analog): [../answers/system-design-ticketmaster.md](../answers/system-design-ticketmaster.md).

## Official culture (six core values)

Do **not** recite posters. Map **your** stories. Official [Our Core Values](https://www.workday.com/en-us/company/about-workday/core-values.html); [Code of Conduct](https://codeofconduct.workday.com/) (CEO note, Feb 2026) repeats employees-first + integrity.

| Official value | Careers one-liner |
| --- | --- |
| **Employees** | Number one; speak up; bring your best |
| **Customer Service** | Relentless customer / user satisfaction |
| **Innovation** | Safe to experiment; investments that scale |
| **Integrity** | Clear expectations; own outcomes; earn trust |
| **Fun** | Inspire, win, celebrate — relationships, not slogans |
| **Profitability** | Not the reason you exist; follows smart spend |

“Why Workday?” that only says “I used the HR portal” fails. Name a **rules-engine, tenancy, or object-model** problem you have lived.

## Official + reported process

Official PDF covers the **AppDev modeling** hour. 2026 guides (TechPrep, ClavePrep) describe a broader SWE funnel — treat extra rounds as **reported**.

| Stage | What they score |
| --- | --- |
| Recruiter / apply | Background; HCM vs Financials vs Core Platform |
| OA (guides / intern blogs) | Timed HackerRank for some early-career tracks |
| Object modeling (official AppDev) | Class diagram from evolving requirements; Technical Expertise competency |
| Phone / DSA (guides) | One medium; **readable** code over golfed cleverness |
| Loop (guides) | More coding, OOD, enterprise design; some report a **CLI Git / script** hour |
| Behavioral | STAR vs values; “Tell me about a time…” (official PDF) |

Official modeling hour: interviewer demos the pad; language-agnostic **diagrams**; later requirements **refactor** the same model; follow-ups like “remove redundancy.” Daily AppDev language is proprietary **XpressO** (XML + OO + Java platform, model-driven UI/logic/data split) — they hire for **modeling fluency**, not XpressO trivia on day one. Notify the recruiter + `accommodations@workday.com` for access needs.

## How this track differs

| vs Salesforce / ServiceNow | vs FAANG |
| --- | --- |
| Official **UML-lite CodePair** is the AppDev brand | Graph olympiad is not the AppDev hour |
| Design is **worker / org / money objects + tenancy**, not “design Twitter” | Same enterprise bar; Workday is **HCM/FIN objects** |
| XpressO / metadata-driven stack — transferable OO, not a dead end | Confirm infra vs AppDev before you grind LeetCode only |

## Coding and design flavor

AppDev: Student/Course-style **cardinality** drills (official PDF), then Online vs In-Person inheritance, then “how do I get this student’s exam grades?” — pick the **efficient path** through the graph. Guides: medium lists / windows; HLD for multi-tenant SaaS, SLAs, seat-like locking. Git round (**reported**): merge conflicts in a terminal, maybe a small Python/Bash transform — confirm before you skip `git rebase`.

## Sample prompts (shapes, not leaked puzzles)

1. “Integrity — you stopped a payroll-adjacent ship that was wrong.”
2. Model: employees belong to orgs; orgs nest; a worker can have multiple positions — cardinalities first.
3. New requirement: positions are FTE or contractor with different fields — inheritance vs composition, then refactor.
4. Traverse: given a worker, list effective compensation plans without scanning the whole tenant.
5. Design time-off balances for many tenants: isolation, calendar math, audit.

## Prep checklist

- [ ] Read [AppDev prep PDF](https://www.workday.com/content/dam/web/en-us/documents/other/appdev-interview-prep-guide.pdf) + [core values](https://www.workday.com/en-us/company/about-workday/core-values.html)
- [ ] Recruiter: AppDev vs platform, CodePair vs OA, Git/CLI, Zoom, AI
- [ ] One UML-lite drill (requirements arrive in waves) + one timed medium
- [ ] STAR bank mapped to **all six** values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Preparing for your Application Development Interview — Workday (PDF)](https://www.workday.com/content/dam/web/en-us/documents/other/appdev-interview-prep-guide.pdf) — accessed 2026-09-14
- [Our Core Values — Workday](https://www.workday.com/en-us/company/about-workday/core-values.html) — accessed 2026-09-14
- [Living Our Values Every Day — Workday Code of Conduct](https://codeofconduct.workday.com/) — accessed 2026-09-14
- [Workday's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/workday-interview-process) — accessed 2026-09-14
- [Workday Hiring Process Guide 2026 — ClavePrep](https://claveprep.com/blog/workday-hiring-process-guide-2026) — accessed 2026-09-14
