# Toast engineering track

Sits beside [block.md](block.md) and [shopify.md](shopify.md): **restaurant operating system** (POS, payments, online ordering, payroll), not a generic payments or commerce loop. Official [Careers](https://careers.toasttab.com/) is the values source of truth. Official line: empower the restaurant community to **delight guests, do what they love, and thrive**. Recruiter confirms **payments vs POS vs online ordering**, Java/Kotlin vs TypeScript vs Android, Boston / Dublin / remote, and **AI-in-pad**.

Typical timeline **4–7 weeks** new-grad / **3–6 weeks** experienced (guides). Offline POS cousin: [block.md](block.md). Payments: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (do not invent extra pillars)

Official [Careers](https://careers.toasttab.com/). Map **your** stories. Official site: about **two-thirds** of Toasters have worked in restaurants.

| Official value | Careers one-liner |
| --- | --- |
| **All in customer success** | Diverse restaurant needs; earn and keep trust |
| **Ownership mindset** | Decisive; jump in; spend finite resources on what matters |
| **One team** | Empathy; lift each other; team sport |
| **Driven by purpose and impact** | Agility, integrity, urgency; dive into details |
| **Lead with humility** | Strong view, then listen; challenge respectfully |
| **Hungry to build and learn** | Bets and experiments; grace after mistakes |
| **Raise the bar** | Hire talent; coach early; empower great work |

“Why Toast?” that only says “I like restaurants / Boston” fails. Name a **POS, offline sync, kitchen ticket, or hospitality-ops** problem you have lived — even one shift on a register counts.

## Official + reported process

Official [AI in Hiring](https://careers.toasttab.com/ai-in-hiring): **people** review applications and assessments — no AI screen/score/rank; some interviews use **BrightHire** transcription (opt out, 90-day delete, no impact); **no real-time AI** in live interviews unless they say otherwise. 2026 guides (InterviewChamp, Dataford, Interview Query) — treat round *contents* as **reported**.

| Stage | Official / reported |
| --- | --- |
| Apply | Official: humans read the packet |
| Recruiter | Guides: fit, level, restaurant interest |
| Assessment | Guides: HackerRank ~75 min / 2 problems (new-grad); some teams skip |
| Tech screen | Guides: ~45 min live coding |
| Loop | Guides: two coding + restaurant-shaped fundamentals + behavioral; senior adds HM / exec |
| Recording | Official: optional BrightHire; opt-out is allowed |

Guides: backend **Java / Kotlin**, web **TypeScript / React**, POS **Android**. Design is **offline-first terminal, menu sync, split check** — not abstract social-feed scale.

## How this track differs

| vs Block / Square POS | vs FAANG |
| --- | --- |
| Official **restaurant OS** (payroll + ordering + POS) | Official **no AI scoring**; live AI off |
| Values include **hungry to build** + hospitality roots | Domain fundamentals over puzzle-hard DSA |
| Boston-weighted + Dublin hub | Operators are non-engineers — explain downtime in **dollars and covers** |

## Coding and design flavor

DSA: parse a receipt, combo-sum / coin-change, LRU, top-k over a time window. Design: local SQLite queue, conflict when two terminals were offline, tax/tip on a split check, printer path that works without WAN. Related: [../answers/coding-coin-change.md](../answers/coding-coin-change.md), [../answers/coding-lru-cache.md](../answers/coding-lru-cache.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** restaurant OS — offline Friday-night dinner rush, not “food is cool.”
2. Live: practical medium; currency rounding and sold-out modifiers are the test.
3. Design: POS that takes orders and prints tickets when the internet is down; how you reconcile.
4. STAR: ownership under load; translate a constraint for a non-technical partner.
5. Questions for them: POS vs payments on *this* team, office vs remote, BrightHire opt-out.

## Prep checklist

- [ ] Read [Careers](https://careers.toasttab.com/) + [AI in Hiring](https://careers.toasttab.com/ai-in-hiring) + the JD
- [ ] Recruiter: OA vs live, language, site, AI / recording policy
- [ ] One parse/window medium + one offline-sync design
- [ ] One customer-success + one humility STAR
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Working at Toast — Careers](https://careers.toasttab.com/) — accessed 2026-09-27
- [AI in Hiring — Toast](https://careers.toasttab.com/ai-in-hiring) — accessed 2026-09-27
- [Bringing the Toast Values to Life — Toast Careers](https://careers.toasttab.com/blogs/life-at-toast/bringing-the-toast-values-to-life) — accessed 2026-09-27
- [10 Toast SWE (New Grad) Interview Questions (2026) — InterviewChamp](https://interviewchamp.ai/interview-questions/toast/swe-new-grad) — accessed 2026-09-27
- [Toast Software Engineer Interview Guide 2026 — Dataford](https://dataford.io/interview-guides/toast/software-engineer) — accessed 2026-09-27
