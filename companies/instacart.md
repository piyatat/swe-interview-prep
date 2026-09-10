# Instacart engineering track

Sits beside [doordash.md](doordash.md) and [product-companies.md](product-companies.md): **grocery marketplace** (customer, in-store shopper, retailer), not restaurant dispatch and not a generic FAANG slate. Official [Careers](https://www.instacart.careers/) is the jobs portal. Public eng values (early [tech blog](https://tech.instacart.com/just-getting-started-5ee3d886efeb)): **Customers First, Ownership, Urgency & Quality**. Recruiter confirms **CodeSignal vs live**, **OA vs supervised screen**, **AI policy**, and Flex First / office.

Typical timeline **4–6 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Marketplace geo: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md). Inventory / catalog: [../answers/system-design-search.md](../answers/system-design-search.md).

## Official culture (engineering values)

Do **not** recite a list. Map **your** stories.

| Public eng value | One-liner from the tech blog |
| --- | --- |
| **Customers First** | Earn trust; code and process serve customers |
| **Ownership** | Small customer-shaped teams; decisions pushed to the engineer |
| **Urgency & Quality** | Prioritize high leverage; iterate until you would show it |

Exponent (2026): no standalone “values hour” — collaboration / agility are scored **throughout**. “Why Instacart?” that only says “I like the app” fails. Name a real **stale-shelf, substitution, or shopper-routing** problem.

## Official + reported process

Official careers page is the **jobs** source of truth; round mix is **reported** (Exponent, DSA Prep, DesignGurus). Confirm with the recruiter.

| Stage | What they score (guides) |
| --- | --- |
| Recruiter (~30–45 min) | Background, why grocery / Instacart, level, Flex First |
| Unsupervised CodeSignal (~60–70 min) | Timed mediums — arrays, strings, maps; **tests must pass** |
| Supervised coding (~60 min) | Live CodeSignal / CodePair; some teams skip if volume is low |
| Virtual onsite (4 × ~60 min) | Two coding, grocery-scoped design, bar-raiser / HM |

Onsite design (guides + DesignGurus): **narrow** product slice — inventory freshness, shopper dispatch, fulfillment state machine — not “design Twitter.” Inventory is **always partly wrong**; say that yourself.

## How this track differs

| vs FAANG | vs DoorDash / Uber |
| --- | --- |
| Coding is heavier than many product loops; Exponent: results / passing tests more than hint-seeking | DoorDash: restaurant + Dasher; Instacart: **walk-the-store** + substitutions |
| Design is one grocery feature, often PM-shaped follow-ups | Uber: rider–driver geo; here **SKU availability** is the hard constraint |
| Bar-raiser is leadership + collaboration, not a values recitation | Three-sided: customer / shopper / retailer in every tradeoff |

## Coding and design flavor

Live problems wear **cart / catalog / schedule** costumes: maps, strings, build-from-scratch (cart, KV, time-based get). Write tests on the screen when they are not provided.

Design: order → shopper assign → substitutions → checkout; **idempotent** payment; stale inventory vs oversell. Related: [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md), [../answers/system-design-payment.md](../answers/system-design-payment.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why Instacart — a substitution or stock-out you would fix.”
2. Medium map / string; then “this is cart line items.”
3. Design real-time availability across 500 stores when shelves change without events.
4. Shopper dispatch for a dinner-rush spike; reassign on decline.
5. Bar-raiser: a project with messy stakeholders and a number you moved.

## Prep checklist

- [ ] Read [Careers](https://www.instacart.careers/) + one [tech blog](https://tech.instacart.com/) post
- [ ] Recruiter: CodeSignal OA vs live, design yes/no, AI policy, office vs Flex
- [ ] 2 timed CodeSignal-style mediums (maps + strings)
- [ ] One inventory / dispatch design mock ([../general/system-design.md](../general/system-design.md))
- [ ] STAR: conflict, mentorship, measurable impact — not slogans
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Instacart Careers](https://www.instacart.careers/) — accessed 2026-09-10
- [Just getting started — Instacart Engineering](https://tech.instacart.com/just-getting-started-5ee3d886efeb) — accessed 2026-09-10
- [Instacart Software Engineer Interview Guide — Exponent](https://www.tryexponent.com/guides/instacart-software-engineer-interview) — accessed 2026-09-10
- [Instacart Coding Interview Questions (2026) — DSA Prep](https://www.dsaprep.dev/blog/instacart-coding-interview-questions) — accessed 2026-09-10
- [What to Expect in the Instacart System Design Interview — DesignGurus](https://www.designgurus.io/answers/detail/what-to-expect-in-the-instacart-system-design-interview) — accessed 2026-09-10
