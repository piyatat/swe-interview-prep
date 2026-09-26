# Booking.com engineering track

Sits beside [airbnb.md](airbnb.md): **OTA marketplace (hotels + trips)**, Amsterdam-centered, **experimentation-heavy** — not Airbnb Experiences and not a US consumer-app loop. Official [Start your journey](https://careers.booking.com/start-your-journey/) is the hire-process source of truth. Official customer line: make it **easier for everyone to experience the world**. Recruiter confirms **search vs availability vs payments vs exp-platform**, Java vs legacy Perl, Amsterdam vs other hub, hybrid days, and **AI-in-pad**.

Typical timeline **3–6 weeks** (official FAQ; technical tests can stretch it). Booking / inventory: [../answers/system-design-ticketmaster.md](../answers/system-design-ticketmaster.md). Search / rank: [../answers/system-design-search.md](../answers/system-design-search.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official values (do not invent extra pillars)

Official [Start your journey](https://careers.booking.com/start-your-journey/). Map **your** stories.

| Official value | What they score |
| --- | --- |
| **Think customer first** | Value for guests, partners, *and* colleagues — friction you removed |
| **Succeed together** | Team credit; trust; diverse perspectives |
| **Own it** | Promises kept; informed decisions; important work *today* |
| **Learn forever** | Resilience; learn from colleagues, outside, and failures |
| **Do the right thing** | Right results the right way — communities and the world around you |

Official site: new backend work is **Java by default**; many apps still **port from Perl** — reading the old codebase is a plus, not a filter. Teams are usually **6–12**. Hybrid: offices still matter for collaboration; discuss relocation on the **first** recruiter call. “Why Booking?” that only says “I travel / I want Amsterdam” fails. Name a **search, availability, experiment, or marketplace** problem you have lived.

## Official + reported process

Official [How we hire](https://careers.booking.com/start-your-journey/): AI-assisted CV match on the careers site (recruiters still review), recruiter conversation, then **several** rounds with manager and teammates. Official technical-interview tip: **understand the problem**; the hour is a **communication** exercise. 2026 guides (techinterview.org; TechPrep) — treat round *contents* as **reported**.

| Stage | Official / reported |
| --- | --- |
| Application | Official: CV + ranked role matches; apply to close fits |
| Recruiter / sourcer | Official first call: history, skills, interest; have the JD + CV |
| Technical tests (role-dependent) | Official FAQ: coding interviews can lengthen the 3–6 week path |
| Loop | Official: several rounds. Guides: OA (often **machine-coding** / HackerRank), live coding, travel-scale design, **experimentation or domain**, behavioral |
| Feedback | Official: recruiter within about **one week** of the loop |

Guides: OA may be a **boilerplate API** (hotel CRUD / proximity) more than three puzzle mediums; some 2025–2026 reports still saw a Java-shaped pad even when the JD said language-agnostic — confirm. Design is **availability + double-book + multi-currency**, then “how would you **A/B** the change?” Graduate / Compass loops may add a cognitive test + assessment centre (official graduate blog).

## How this track differs

| vs Airbnb / Expedia | vs FAANG |
| --- | --- |
| Official five values; **experiment + customer** are the culture | Official **hybrid / Amsterdam-weight**, not Bay Area default |
| Inventory is **hotels + Connected Trip**, not homes-only | Practical machine-coding + stats, fewer puzzle-hard DSA |
| Official **Java-new / Perl-legacy** honesty | Comp is EUR-denominated; Dutch 30% ruling is a *tax* topic, not a level |

## Coding and design flavor

DSA: windows, top-k, merge feeds, itinerary-style graphs, calendars. Design: hotel search + availability, reservation holds, multi-region, currency. Experiment hour (guides): primary metric, sample size, stopping rule, novelty / peeking. Related: [../answers/coding-sliding-window-max.md](../answers/coding-sliding-window-max.md), [../answers/system-design-ticketmaster.md](../answers/system-design-ticketmaster.md), [../answers/system-design-search.md](../answers/system-design-search.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** OTA — experimentation or availability, not “I like travel startups.”
2. Live: practical medium; sold-out dates and currency rounding are the test.
3. Design: reservation without double-book — hold, pay fail, multi-region.
4. Experiment: a ranking change — metric, SRM, when you **do not** ship.
5. Questions for them: Perl vs Java on *this* team, hybrid days, Compass vs experienced hire.

## Prep checklist

- [ ] Read [Start your journey](https://careers.booking.com/start-your-journey/) + the JD (Java / hub / hybrid)
- [ ] Recruiter: OA vs live, language, Amsterdam vs other site, AI policy
- [ ] One machine-coding / API drill + one availability design + one experiment STAR
- [ ] One “Own it / Learn forever” story with a number
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Start your journey — Booking.com Careers](https://careers.booking.com/start-your-journey/) — accessed 2026-09-26
- [Decoding the Software Engineering Graduate Interview Process — Booking.com Careers](https://careers.booking.com/blog/the-graduate-software-engineering-bootcamp-patricia-nicole-experience/) — accessed 2026-09-26
- [Booking.com Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/booking-com-interview-guide/) — accessed 2026-09-26
- [Booking.com's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/booking-interview-process) — accessed 2026-09-26
- [Booking.com Coding Interview Questions (2026) — DSA Prep](https://www.dsaprep.dev/blog/booking-com-coding-interview-questions) — accessed 2026-09-26
