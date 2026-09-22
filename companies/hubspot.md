# HubSpot engineering track

Sits beside [salesforce.md](salesforce.md) and [atlassian.md](atlassian.md): **inbound CRM / Marketing–Sales–Service Hubs for SMBs**, not a generic FAANG slate. Official [Software Engineering Interview Prep](https://www.hubspot.com/careers/software-engineering-interview-prep): **no brain teasers**; they score writing and understanding code, working with people, and **real problems**. Recruiter confirms **frontend vs backend vs infra**, own laptop vs pad, and whether the **3-hour API** assessment is on your loop.

Typical timeline **~2–4 weeks** (2026 guides). Take-home shape: [../general/take-homes.md](../general/take-homes.md). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official HEART (do not invent extra pillars)

Official [Culture Code](https://blog.hubspot.com/blog/tabid/6307/bid/34234/the-hubspot-culture-code-creating-a-company-we-love.aspx) (Dharmesh Shah): employees have **HEART**. Map **your** stories — do not recite the acronym.

| Official value | What they score |
| --- | --- |
| **Humble** | Learn in public; credit the team; change your mind on evidence |
| **Empathetic** | Solve for the **customer** (success, not only happiness) and the teammate |
| **Adaptable** | Ambiguity; re-prioritize when the inbound motion shifts |
| **Remarkable** | Work you are proud of; diamond-with-a-flaw over a safe pebble |
| **Transparent** | Share context; “sunlight”; raise bad news early |

Culture Code highlights that show up in screens: **solve for the customer**, results over where/when work happens, influence independent of hierarchy, fail by trying. “Why HubSpot?” that only says “nice culture / not Salesforce” fails. Name a **SMB, inbound, or multi-hub** problem you have lived.

## Official interview philosophy

From the SWE prep page:

| Official stance | What to do |
| --- | --- |
| **No brain teasers** | No golf-ball riddles; practical code + systems |
| **Working solution first** | Optimize after it runs; multiple valid answers |
| **Own laptop + Google / SO** | Comfortable IDE; they still score *your* reasoning |
| **Ask them questions** | Time at start and end — treat it as two-way |
| **“I don’t know” is OK** | They probe the edge of experience on purpose |
| **Track-specific** | Frontend (core JS, not framework trivia) vs backend vs infra |

Official frontend: JavaScript depths, algorithm coding, **front-end systems design** (data flow, render, UI updates — no coding). Official backend: design a common web system (storage, reliability, performance, scale) + coding. Official **Senior Software Engineer II**: written/live **deep dive** on a project you led (design, impl, rollout, org impact).

## Official + reported process

Official page describes **what hours contain**, not a universal stage list. Guides (jobsbyculture 2026, interviewing.io) — treat composition as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30 min) | Why HubSpot, HEART signal, location / band |
| Async coding (~3 h) | Call an API, reshape JSON, **POST** the answer; then zip the code |
| Live coding (~60 min) | Easy–medium; **edges and tests** unprompted; CoderPad or your IDE |
| System design (1–2 × 60) | Broad “Netflix-shaped” then product/API depth (weather / CRM-ish) |
| Behavioral / HM | HEART + situational; SWE II deep-dive may sit here |

Official: interviews are on **Zoom**; bring a notepad, Zoom whiteboard, or a drawing app. Guides: interviewers are often **not** your future teammates except the HM; some loops give **feedback** after the technical block.

## How this track differs

| vs Salesforce | vs FAANG |
| --- | --- |
| Official **HEART + Culture Code**, not Trust / V2MOM | Official **Google/SO allowed**; still narrate |
| Design is **inbound / SMB hubs**, not org-wide Salesforce isolation | Puzzle-hard DSA is **not** the brand |
| Reported **3-hour API take-home** is the filter | Live hour still wants edges like a production PR |

## Coding and design flavor

Assessment: HTTP client, status codes, nested JSON, unhappy paths — not two mediums. Live: arrays / strings / maps; they know prompts leak, so they drill **the next case**. Design: millions of SMB portals, email/marketing fan-out, tenant-ish isolation without calling it Salesforce. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Hub (Marketing vs Sales vs Service vs platform) — portable “I like CRM” is weak.
2. HEART: you told a customer or VP bad news **before** the launch date slipped.
3. Assessment: fetch, aggregate by timestamp / enum, POST; handle 5xx and malformed JSON.
4. Design: inbound form → contact timeline → email send with per-portal quotas.
5. SWE II: one-pager on a project you **rolled out** — metrics and what you would undo.

## Prep checklist

- [ ] Read [SWE interview prep](https://www.hubspot.com/careers/software-engineering-interview-prep) + [Culture Code](https://blog.hubspot.com/blog/tabid/6307/bid/34234/the-hubspot-culture-code-creating-a-company-we-love.aspx)
- [ ] Recruiter: FE/BE, 3-hour link, language, SWE I vs II deep-dive, AI policy
- [ ] One timed API + JSON mock ([../general/take-homes.md](../general/take-homes.md))
- [ ] STAR bank for **all five** HEART letters
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Software Engineering Interview Prep — HubSpot Careers](https://www.hubspot.com/careers/software-engineering-interview-prep) — accessed 2026-09-22
- [The HubSpot Culture Code — HubSpot](https://blog.hubspot.com/blog/tabid/6307/bid/34234/the-hubspot-culture-code-creating-a-company-we-love.aspx) — accessed 2026-09-22
- [HubSpot Interview Prep 2026 — jobsbyculture](https://www.jobsbyculture.com/blog/hubspot-interview-prep-2026) — accessed 2026-09-22
- [HubSpot’s Interview Process & Questions — interviewing.io](https://interviewing.io/hubspot-interview-questions) — accessed 2026-09-22
- [HubSpot Interview Guide 2026 — techinterview.org](https://www.techinterview.org/post/3233460314/hubspot-interview-guide-2026-crm-engineering-marketing-automation-and-multi-tenant-saas/) — accessed 2026-09-22
