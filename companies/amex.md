# American Express engineering track

Sits beside [visa.md](visa.md), [mastercard.md](mastercard.md), and [capital-one.md](capital-one.md): **closed-loop issuer + network + premium card**, not a four-party scheme you integrate with a secret key. Official [Careers](https://www.americanexpress.com/en-us/careers/): technology is **architect, code and ship software that makes us an essential part of our customers’ digital lives**. Recruiter confirms **issuer / fraud / rewards vs merchant / cloud**, Java vs other, HireVue vs Codility first, and **AI-in-pad**.

Typical timeline **4–6 weeks** (2026 guides). Payments: [../answers/system-design-payment.md](../answers/system-design-payment.md). SQL: [../general/sql-interviews.md](../general/sql-interviews.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (Blue Box Values)

Do **not** recite a four- or five-item list from prep blogs — that is **stale**. Official [Code of Conduct](https://www.americanexpress.com/content/dam/amex/en-us/newsroom/pdfs/AMEX-Code-of-Conduct-Policy_English.pdf) (Apr 2024) publishes **eight**:

| Official Blue Box Value | What they score |
| --- | --- |
| **We Do What’s Right** | Integrity over the shortcut; speak up |
| **We Back Our Customers** | Card Member first; relationships, not volume theater |
| **We Make It Great** | Excellence that is **controlled**, not “move fast and break the ledger” |
| **We Respect People** | Open dialogue; every voice |
| **We Embrace Diversity** | Different experience as fuel for the product |
| **We Stand for Equity & Inclusion** | Belonging; no bias that excludes |
| **We Win as a Team** | Individual performance never at the team’s expense |
| **We Support Our Communities** | Outside the Blue Box, still the brand |

“Why Amex?” that only says “payments / NYC / travel points” fails. Name an **auth-latency, fraud-false-decline, rewards-idempotency, or PCI-scope** problem you have lived. Amex is unusual in acting as **both issuer and network** — you still need the four-party vocabulary (cardholder, merchant, acquirer, network) to contrast.

## Official + reported process

Official careers + CoC do **not** publish a round-by-round SWE loop. 2026 guides (techinterview.org, Dataford, OphyAI) — treat stage *order* as **reported**. Campus / early-career often **HireVue** before live engineers.

| Stage | Official / reported |
| --- | --- |
| Recruiter | Band, site (NYC / Phoenix / Bengaluru / …), hybrid days |
| OA / HireVue (guides) | Codility or coding OA **or** recorded STAR (~25 min); video round can cut more people than coding |
| Tech 1–2 (guides: live Webex/Zoom) | Medium DSA **plus** Java / Spring / SQL from the resume |
| Design (guides; senior) | Auth → clearing → settlement; fraud under a latency budget; rewards exactly-once |
| Director / HM | Blue Box stories; regulated launch you slowed and still shipped |

Guides: narrate brute → optimize before typing. Design almost always includes **idempotency and what you do when the model / network times out**.

## How this track differs

| vs Visa / Mastercard | vs FAANG |
| --- | --- |
| **Closed loop** — issuer *and* network; Card Member relationship | Design is **auth / fraud / rewards / PCI**, not “design Instagram” |
| Official **eight** Blue Box names | Reported **HireVue** campus filter |
| Hybrid enterprise (guides: ~3 days office on many reqs) | Java + SQL hour is a real veto, not an afterthought |

## Coding and design flavor

DSA: arrays, maps, heaps, lists, windows — often dressed as merchant streams. Java OOP / Spring annotations and **ACID / isolation** show up. Design: sub-100ms fraud with a fail-open vs fail-closed timeout; points engine that survives duplicate events; card-swipe path without storing PAN. Related: [../answers/system-design-payment.md](../answers/system-design-payment.md), [../answers/coding-subarray-sum-k.md](../answers/coding-subarray-sum-k.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** closed-loop issuer — a control you would not skip for a launch date.
2. Live: medium + complexity out loud; money in **integer cents**.
3. Design: authorize a swipe when the fraud model exceeds the latency SLO.
4. SQL / Java: isolation level vs lost update on a rewards balance.
5. Questions for them: issuer vs merchant platform, HireVue vs OA, AI policy.

## Prep checklist

- [ ] Read [Careers](https://www.americanexpress.com/en-us/careers/) + eight Blue Box names from the [Code of Conduct](https://www.americanexpress.com/content/dam/amex/en-us/newsroom/pdfs/AMEX-Code-of-Conduct-Policy_English.pdf)
- [ ] Recruiter: OA vs HireVue, language, hybrid site, AI-in-pad
- [ ] Timed medium + one auth / fraud / rewards design with timeout fallback
- [ ] Three Blue Box STARs (customer, integrity, team)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [American Express Careers](https://www.americanexpress.com/en-us/careers/) — accessed 2026-09-29
- [Amex Career Benefits, Programs & Culture](https://www.americanexpress.com/en-us/careers/about-teamamex/) — accessed 2026-09-29
- [American Express Code of Conduct (Blue Box Values)](https://www.americanexpress.com/content/dam/amex/en-us/newsroom/pdfs/AMEX-Code-of-Conduct-Policy_English.pdf) — accessed 2026-09-29
- [American Express Interview Guide (2026) — techinterview.org](https://www.techinterview.org/companies/american-express-interview-guide/) — accessed 2026-09-29
- [American Express Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/american-express/software-engineer) — accessed 2026-09-29
