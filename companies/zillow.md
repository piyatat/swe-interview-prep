# Zillow engineering track

Sits beside [airbnb.md](airbnb.md) and [ebay.md](ebay.md): **housing marketplace / search / Zestimate**, not a booking OTA and not a social feed. Official [Careers](https://www.zillow.com/careers/): “the work we do helps people get home”; **Cloud HQ** (role-dependent WFH or a few office days). Recruiter confirms **search / listings / mortgages / Premier Agent**, Java vs Python vs TS, and whether coding is **greenfield + refactor** (official) vs a LeetCode hour.

Typical timeline **~3–5 weeks** (guides). Practical coding: [../general/pair-programming.md](../general/pair-programming.md). Refactor: [../general/code-review-rounds.md](../general/code-review-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official [Our values](https://www.zillow.com/careers/our-values/). Map **your** stories. Do not paste Amazon LPs.

| Official value | What they score |
| --- | --- |
| **Consumers are our north star** | Buyer / renter / agent outcome beat an internal metric |
| **Do the right thing** | Integrity when it cost a shortcut |
| **Turn on the lights** | You documented the *why*; nobody was left in the dark |
| **Own it** | Start-to-finish accountability; you moved fast and delivered |
| **Better together** | You pulled in the right voices and still shipped |
| **We play to win** | Hard work + a bold chance that helped someone get home |

Official [Interview prep](https://www.zillow.com/careers/interview-prep/) is unusually explicit: **STAR**, **system design** (customer problem → simple / stable / scalable), **greenfield coding** that “mimics real world problems … vs. leetcode or algorithmic questions,” and **refactoring unfamiliar code**.

“Why Zillow?” that only says “I bought a house / I like maps” fails. Name a **listing search, geospatial filter, media CDN, or valuation-freshness** problem you have lived.

## Official + reported process

Official Interview prep + Careers (Cloud HQ, housing super app). 2026 candidate reports add the seat list — treat extra splits as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter | Reported: fit, level, Cloud HQ location |
| Technical screen | Reported: live pairing or OA on **practical** data / production-shaped code |
| Greenfield coding | Official: on-the-job style, not puzzle LeetCode |
| Refactoring | Official: unfamiliar code; what you change first and why |
| System design | Official: translate a customer problem into a simple, stable, scalable design |
| Behavioral | Official: STAR in the technical hours too |
| Loop shape (reported) | Recruiter → screen → virtual onsite (design, refactor, values STAR, greenfield) |

Confirm AI-in-pad; official prep page does not bless a model in the hour. Cloud HQ: many roles are remote-first; some are a few office days — **ask**.

## How this track differs

| vs Airbnb / Booking | vs FAANG DSA |
| --- | --- |
| Official **greenfield + refactor**, not a graph puzzle as the brand | Design is **listings / geo / Zestimate / media**, not a news feed |
| Cloud HQ distributed; values are consumer + lights-on | Silent “I only grind NeetCode” misses the refactor hour |
| Marketplace is homes + agents + mortgages | “I flipped houses” is not an engineering story |

## Coding and design flavor

Official product: listings, Zestimate, Premier Agent, mortgages / BuyAbility, ChatGPT listings app (2025). Live work: geo search, filter cardinality, photo CDN, ingest freshness, partner feeds. Related: [../answers/system-design-search.md](../answers/system-design-search.md), [../answers/system-design-proximity.md](../answers/system-design-proximity.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** housing marketplace — portable “I like real estate tech” is weak.
2. Value: Turn on the lights — you made an implicit production rule explicit.
3. Greenfield: parse listing payloads from two sources; group; emit a summary.
4. Refactor: a working-but-tangled class; what you change in 45 minutes and what you leave.
5. Design: property search with map bounds, filters, and stale photos.
6. Questions for them: greenfield vs DSA, refactor language, Cloud HQ days, AI-in-pad.

## Prep checklist

- [ ] Read [Careers](https://www.zillow.com/careers/) + [values](https://www.zillow.com/careers/our-values/) + [Interview prep](https://www.zillow.com/careers/interview-prep/) (greenfield + refactor videos)
- [ ] Recruiter: greenfield vs OA, refactor stack, geo vs mortgages team, AI-in-pad
- [ ] One timed **practical** parse + one messy-refactor pass + one STAR per value
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Zillow Careers](https://www.zillow.com/careers/) — accessed 2026-10-16
- [Interview Prep — Zillow Careers](https://www.zillow.com/careers/interview-prep/) — accessed 2026-10-16
- [Values — Zillow Careers](https://www.zillow.com/careers/our-values/) — accessed 2026-10-16
- [Zillow Software Engineer Interview Questions & Guide 2026 — Dataford](https://dataford.io/interview-guides/zillow/software-engineer) — accessed 2026-10-16
- [Zillow Senior Software Engineer Interview — Glassdoor](https://www.glassdoor.com/Interview/Zillow-Senior-Software-Engineer-Interview-Questions-EI_IE40802.0,6_KO7,31.htm) — accessed 2026-10-16
