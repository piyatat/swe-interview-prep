# Airbnb engineering track

Sits beside [product-companies.md](product-companies.md): **marketplace / travel**, not a generic FAANG slate. Official careers: **Live and Work Anywhere** (one US pay tier in the policy) and four published **Core Values**. Recruiter is the source of truth for **onsite menu**, **code-review hour**, and AI policy.

Typical timeline **~3–5 weeks** (guides). Confirm **level** and whether you get **one or two** values interviews. Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Review format: [../general/code-review-rounds.md](../general/code-review-rounds.md).

## Official culture (Life at Airbnb)

Careers page lists **four** Core Values — use these, not older six-value lists:

| Official value | Careers one-liner |
| --- | --- |
| **Champion the Mission** | Partnership with the community to create connection / belonging |
| **Be a Host** | Caring, open, encouraging to everyone you work with |
| **Embrace the Adventure** | Curiosity, hopeful resilience, belief people can grow |
| **Be a Cereal Entrepreneur** | Determined, creative; turn bold ambition into reality |

“Cereal” is the 2008 Obama O’s / Cap’n McCain’s fundraise — interviewers mean **scrappy under constraint**, not a breakfast joke. Mission language on the careers home: a world where people can **belong**. Do **not** recite the table; map **your** stories to the behaviors.

Live and Work Anywhere (official principles): WFH or office; live anywhere in the employment country **without pay change**; temporary work-from-anywhere with approval; regular in-person gatherings; highly coordinated work.

## How this track differs

| vs FAANG | vs Stripe / LinkedIn |
| --- | --- |
| **Working code** in CoderPad — guides: **no pseudocode** | Domain is **bookings, listings, availability**, not ledger or feed |
| Dedicated **Core Values** hours can **veto** a strong technical loop | DP and interval problems over-represented vs peer product companies |
| Often a **code-review** hour on a seeded PR | Values interviewers are often **outside** the hiring team |

Also study [../general/low-level-design.md](../general/low-level-design.md) and [../answers/system-design-payment.md](../answers/system-design-payment.md) (booking + pay failure).

## Reported SWE loop (guides; confirm)

Recruiter (~30 min) → **45–60 min** coding screen (some early-career reqs: HackerRank / CodeSignal) → virtual onsite **4–6** hours over one or two days → debrief / team match. Exponent: hear back **~3–7 days** after the loop.

| Reported round | Score |
| --- | --- |
| Coding (screen + 1–2 onsite) | Runnable solution; tests as you go; medium–hard; **DP** common |
| Code review | Planted logic / security bugs first; tone; merge-blocker vs follow-up |
| System design (mid+) | Vague prompt; you scope; **double-booking** and consistency |
| Core Values (1–2 × 45–60 min) | Specific STAR; “Why Airbnb?” that is not portable to any company |
| Cross-functional (some loops) | Design / product / data partner — how you work outside eng |

techinterview.org: two values hours, often trained interviewers **not** on the hiring team, can sink a clean technical score. Treat them as **half the interview**, not a formality.

## Coding and design flavor

Problems arrive in **listing / itinerary** costume; underneath: graphs, intervals, DP, heaps. Guides: reconstruct an itinerary (Eulerian path), cheapest route with ≤ K stops, “can this date range book?” with fast repeats.

Design: availability / calendar, host–guest messaging, waitlist for a viral listing. Lead with **what must not double-book**, idempotency on the book API, and payment-succeeds / reservation-fails. Optimistic vs pessimistic lock on the night row — say which and why.

## Sample prompts (shapes, not leaked puzzles)

1. “Why Airbnb?” — a hosting, travel, or **product** opinion; generic “I like travel” is weak.
2. Interval / DP problem dressed as bookings; execute early; no silent 40-line dump.
3. Review a PR: name the security bug before nits.
4. “Design booking” — scope markets, consistency, races; do not jump to microservices.
5. Values: helped someone with nothing in it for you; public risk; made someone belong.

## Prep checklist

- [ ] Read [Life at Airbnb](https://careers.airbnb.com/life-at-airbnb/) + careers home; do not use stale value lists
- [ ] Recruiter: values count, code review, AI, split vs single-day onsite (split if offered)
- [ ] Two weeks of **DP + intervals** in a plain shared editor (execution on)
- [ ] One PR-review mock ([../general/code-review-rounds.md](../general/code-review-rounds.md))
- [ ] Five STAR stories loosely mapped to the four values — never name the values out loud
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Life at Airbnb — Careers at Airbnb](https://careers.airbnb.com/life-at-airbnb/) — accessed 2026-08-31
- [Careers at Airbnb](https://careers.airbnb.com/) — accessed 2026-08-31
- [How Airbnb Interviews Engineers — techinterview.org](https://www.techinterview.org/post/3233476842/airbnb-interview-guide/) — accessed 2026-08-31
- [Airbnb Software Engineer Interview Guide — Exponent](https://www.tryexponent.com/guides/airbnb-software-engineer-interview) — accessed 2026-08-31
- [The Airbnb Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/airbnb-technical-interview-process-2026) — accessed 2026-08-31
- [Airbnb's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/airbnb-interview-process) — accessed 2026-08-31
