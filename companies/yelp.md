# Yelp engineering track

Sits beside [pinterest.md](pinterest.md) and [ebay.md](ebay.md): **local-business reviews / search / ads**, not a generic social feed. Official [Preparing for Your Tech Role Interview](https://www.yelp.careers/us/en/preparing-for-your-tech-role-interview) is the process source of truth. Official mission: **connect people to great local businesses**. Recruiter confirms **backend vs ads vs search vs mobile vs SRE**, HackerRank vs live pad, and **AI-in-pad**.

Typical timeline **~3–5 weeks** (2026 guides). Geo search cousin: [../answers/system-design-proximity.md](../answers/system-design-proximity.md). Rank / typeahead: [../answers/system-design-search.md](../answers/system-design-search.md), [../answers/system-design-autocomplete.md](../answers/system-design-autocomplete.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official values (do not invent extra pillars)

Official [Culture](https://www.yelp.careers/us/en/culture-at-yelp) + [Preparing…](https://www.yelp.careers/us/en/preparing-for-your-tech-role-interview). Map **your** stories. They are the hire / promote bar.

| Official value | What they score |
| --- | --- |
| **Be tenacious** | Battle smart; underdog moments; turn mistakes into learning |
| **Play well with others** | Respect; diversity of viewpoints; positive attitude |
| **Be unboring** | Creativity over conformity; be your remarkable self |
| **Protect the source** | Community and consumers first — without trust, local businesses get nothing |
| **Authenticity** | Tell the truth; over-communicate; no spin |

Official remote note: Yelp is a **remote company**; leadership says career-advancement equity should not depend on location. “Why Yelp?” that only says “I use the app / I like reviews” fails. Name a **local-search, review-trust, ads, or small-business** problem you have lived.

## Official + reported process

Official [Preparing…](https://www.yelp.careers/us/en/preparing-for-your-tech-role-interview) publishes the skeleton. Role-specific packs live on [Engineering Interview Prep](https://www.yelp.careers/us/en/engineering-interview-prep). 2026 guides (Dataford) + the 2019 [engineering blog](https://engineeringblog.yelp.com/2019/09/breaking-down-technical-interview.html) — treat *contents* as **reported**.

| Stage | Official / reported |
| --- | --- |
| Application | Official step 1 |
| Coding challenge (engineering) | Official step 2. Blog / guides: timed **HackerRank**; hidden cases are the gate |
| Recruiting partner conversation | Official step 3. Fit, level, remote TZ |
| First-round interview | Official step 4. Guides: live coding / technical phone |
| Panel interview | Official step 5. Guides: virtual onsite — more coding, design (mid+), values |
| Decision / welcome | Official close. Recruiter usually within **one week** (official FAQ) |

Guides: coding is LeetCode-medium maps / strings / intervals / top-k dressed as reviews. Design is **near-me, autocomplete, rate-limit bots**, not “design Instagram.” Official FAQ: competing offer — tell the recruiter immediately so they can **pace or cancel**.

## How this track differs

| vs Pinterest / eBay | vs FAANG |
| --- | --- |
| Official five values; **protect the source** is consumer trust | Official **remote-first** + published prep pages |
| Design is **local geo + review integrity + ads** | HackerRank OA is an official named step |
| Mission is **people ↔ local businesses**, not pins or auctions | Panel, not a sports-draft HC story |

## Coding and design flavor

DSA: hash maps, anagrams, merge intervals (hours), top-k on a review stream. Design: geohash / H3 “near me,” typeahead for business names, bot rate limits on write APIs. Related: [../answers/coding-group-anagrams.md](../answers/coding-group-anagrams.md), [../answers/coding-top-k.md](../answers/coding-top-k.md), [../answers/system-design-proximity.md](../answers/system-design-proximity.md), [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** product — a local-search or review-trust story, not “I like food.”
2. OA: medium with hidden edges; empty / huge input is part of the test.
3. Design: nearby businesses — cells, ranking, stale hours, abuse.
4. Values: protect the source — a time you chose user trust over a metric.
5. Questions for them: ads vs consumer vs SRE, remote huddles, AI-on-pad.

## Prep checklist

- [ ] Read [Preparing…](https://www.yelp.careers/us/en/preparing-for-your-tech-role-interview) + [Culture](https://www.yelp.careers/us/en/culture-at-yelp) + your role pack
- [ ] Skim mission / IR so “where Yelp is headed” is not a blank
- [ ] Recruiter: language, OA vendor, panel shape, AI policy
- [ ] One timed HackerRank-style medium + one geo / autocomplete design + one values STAR
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Preparing for Your Tech Role Interview — Yelp](https://www.yelp.careers/us/en/preparing-for-your-tech-role-interview) — accessed 2026-09-26
- [Engineering Interview Prep — Yelp](https://www.yelp.careers/us/en/engineering-interview-prep) — accessed 2026-09-26
- [Culture at Yelp](https://www.yelp.careers/us/en/culture-at-yelp) — accessed 2026-09-26
- [Breaking Down Technical Interviews — Yelp Engineering](https://engineeringblog.yelp.com/2019/09/breaking-down-technical-interview.html) — accessed 2026-09-26
- [Yelp Software Engineer Interview Guide 2026 — Dataford](https://dataford.io/interview-guides/yelp/software-engineer) — accessed 2026-09-26
