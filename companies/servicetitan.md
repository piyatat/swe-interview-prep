# ServiceTitan engineering track

Sits beside [toast.md](toast.md) and [samsara.md](samsara.md): **operating system for the trades** (HVAC, plumbing, electrical — dispatch, mobile, inventory, payments), not a restaurant POS and not generic SaaS CRUD. Official [Careers](https://www.servicetitan.com/careers): mission to **transform an entire industry**; **100k+** platform users. Recruiter confirms **.NET/C# vs React**, dispatch vs payments vs mobile, office vs remote, and whether the loop is the published **CP1 / CP2 / CP3** pair format.

Typical timeline **3–5 weeks** (2026 guides). Coding: [../general/low-level-design.md](../general/low-level-design.md), [../general/pair-programming.md](../general/pair-programming.md). Dispatch / geo: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (do not invent extra pillars)

Official Careers publishes three culture lines. Map **your** stories. Do not recite.

| Official line | Careers one-liner |
| --- | --- |
| **Be unapologetically you** | Originality; you choose what shows up at work |
| **Keep it human** | Trust, empathy, transparent communication, accessible leadership |
| **Bring your best** | Learning over ego; confident humility; something larger than yourself |

DEI on the same page is framed as **journey, not destination**. “Why ServiceTitan?” that only says “I like SaaS / HVAC is hot” fails. Name a **dispatch, technician mobile, inventory, or job-costing** problem you have lived — even a ride-along or a contractor parent counts if you can talk constraints.

## Official + reported process

Official careers does **not** list SWE stages. Recent **engineering JDs** (e.g. Manager of Software Engineering on public boards) publish a loop — treat as **team-typical, confirm**:

| Stage | Official JD / reported |
| --- | --- |
| Recruiter | ~30 min: background, C# comfort, level, site |
| **CP1** (JD) | 90 min live pair — implement a collection / interface in C# |
| **CP2** (JD) | 90 min live pair — concurrency / async (TPL, rate limits) |
| **CP3** (JD) | 90 min system design — microservices, scale |
| Final | People Business Partner / EM culture (JD: ~30 min on manager reqs) |

2026 guides (Dataford): HackerRank pair often **disables autocomplete and web search**. Practice writing C# generics, `async`/`await`, and `SemaphoreSlim` from memory. Design is **real-time dispatch / fleet telemetry / job board**, not Instagram. Stack in guides: **.NET + Kafka + React**.

## How this track differs

| vs Toast / Block POS | vs FAANG |
| --- | --- |
| **Trades OS** (dispatch + mobile + inventory), not hospitality covers | Pair **machine coding** over puzzle-hard DSA |
| Official culture is three human lines, not 16 LPs | 90-minute C# interface work; LeetCode-only prep misses the pad |
| Downtime stops **trucks in the field** | Senior loop may add a director / PBP closer |

## Coding and design flavor

You do **not** need contractor-industry tenure. You do need to talk like production .NET: interface contracts, thread-safety, at-least-once jobs, geo freshness vs battery. Related: [../roles/backend.md](../roles/backend.md), [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** trades OS — Friday-afternoon HVAC surge, not “home services are growing.”
2. CP1: custom multi-map / dictionary — compile, tests, complexity without IDE sugar.
3. CP2: parallel downloader with a concurrency cap; how you prove the cap in a test.
4. Design: match jobs to techs by skill, location, and live availability; what is stale.
5. Keep it human + bring your best on the same incident with a non-engineer GM.

## Prep checklist

- [ ] Read [Careers](https://www.servicetitan.com/careers) + the JD’s published stages
- [ ] Recruiter: CP1/CP2 language, autocomplete rules, site, recorder
- [ ] One C# collection from scratch + one async/rate-limit pair + one dispatch design
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — ServiceTitan](https://www.servicetitan.com/careers) — accessed 2026-11-02
- [ServiceTitan Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/servicetitan/software-engineer) — accessed 2026-11-02
- [Manager of Software Engineering — ServiceTitan (interview stages on JD)](https://app.welcometothejungle.com/jobs/nD--PL-5) — accessed 2026-11-02
- [What makes a good product designer at ServiceTitan — Medium](https://medium.com/servicetitan-design/what-makes-a-good-product-designer-at-servicetitan-25986806ee52) — accessed 2026-11-02
