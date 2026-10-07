# Zoox engineering track

Sits beside [waymo.md](waymo.md) and [tesla.md](tesla.md): **Amazon-owned, ground-up robotaxi** (vehicle + autonomy + ecosystem), not Alphabet Driver and not Tesla Autopilot. Official [Careers](https://zoox.com/careers) + [Working at Zoox: Hiring & Interview Process](https://zoox.com/journal/landing-a-job-zoox): mission is safer, cleaner, more enjoyable urban mobility; they hire **thinkers** and **end-to-end** owners — AV experience is **not** required for most roles. Recruiter confirms **planner vs perception vs sim vs vehicle vs infra**, C++ vs Python, Foster City / other site, and intern vs full-time.

Typical timeline **~3–5 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Debug: [../general/debugging-rounds.md](../general/debugging-rounds.md). Geo / fleet cousin: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official [hiring journal](https://zoox.com/journal/landing-a-job-zoox) + intern journal + job-page “About Zoox.” Map **your** stories.

| Official signal | What they score |
| --- | --- |
| **Why Zoox?** (hiring journal) | Mission for **you**, not “Amazon / robotaxis are hot” |
| **End-to-end thinking** (hiring journal) | Mapping, safety, mission assurance — not a single-layer slogan |
| **Thinkers over domain trivia** (hiring journal) | Industry knowledge helps; first-principles problem-solving is the bar |
| **Hands-on projects** (intern journal) | Lab / hackathon / garage you can walk; curiosity + communication |
| **Ground-up vehicle + ecosystem** (job About) | Vehicle *and* operations, not a bolt-on stack on a donor car |
| **Ask us questions** (hiring journal) | Homework-level curiosity about the shared goal |

“Why Zoox?” that only says “I want to work on cars at Amazon” fails. Name a **geometry, latency, safety, or fleet-ops** problem you have lived.

## Official + reported process

Official hiring journal: recruiter review → interviews that **may** mix phone, video, or on-site → **final leader / executive** interview. Formats **vary by role** (coding, math/problem-solving, behavioral, or a hands-on technician assessment). 2026 guides (TechPrep; candidate write-ups) — treat round *contents* as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30, guides) | Background, AV interest, site; ask language and loop shape |
| Tech screen (guides: 1–2 × 60–90, CoderPad) | C++ or Python; language questions + a practical problem |
| Virtual onsite (guides: 5–6 × 45–60) | Coding / debug, design, **math and science**, HM behavioral |
| Leader interview (official) | Executive seat — mission + judgment, not another puzzle |
| Offer | Amazon-owned private subsidiary — ask **level, refresh, site** |

Guides: the unusual hour is **math / science on a whiteboard** (geometry, occupancy, probability) with **no code**. Confirm AI-in-pad; do not assume Waymo’s written no-live-AI rule applies.

## How this track differs

| vs Waymo / Tesla | vs FAANG web |
| --- | --- |
| Official **leader interview** + first-principles math hour (reported) | Design is **onboard / telemetry / planner**, not “design Twitter” |
| Purpose-built vehicle + Amazon capital; Waymo is Alphabet Driver | C++ / Python internals show up more than vanilla JS CRUD |
| AV résumé is optional for many roles (official) | “Why Zoox?” is a published question, not a soft closer |

## Coding and design flavor

DSA in a **vehicle costume**: grids / A*, intervals, windows, graphs. LLD / debug: short C++ snippet, vtable / pointer vs reference, a parking-lot or booking-shaped class sketch. Design: telemetry versioning, onboard vs cloud, what a 10 ms miss means for a brake. Math: talk units and assumptions before the formula. Related: [../answers/coding-course-schedule.md](../answers/coding-course-schedule.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** robotaxi (purpose-built + Amazon) — portable “I want AV” is weak.
2. Live: graph or geometry medium; say what “safe” means before you code.
3. Math: occupancy or relative motion on a whiteboard — narrate, then compute.
4. Design: fleet log / map version that a planner can trust after a bad deploy.
5. Questions for them: city vs research, C++ vs Python, leader-interview format.

## Prep checklist

- [ ] Read [Hiring journal](https://zoox.com/journal/landing-a-job-zoox) + [Careers](https://zoox.com/careers) + the JD
- [ ] Recruiter: language, math hour, leader seat, site, AI policy
- [ ] One timed medium + one C++ debug + one first-principles geometry drill
- [ ] STAR: ownership, ambiguity, cross-team — **your** impact
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Working at Zoox: Hiring & Interview Process](https://zoox.com/journal/landing-a-job-zoox) — accessed 2026-10-07
- [Careers at Zoox](https://zoox.com/careers) — accessed 2026-10-07
- [Zoox Internship Program](https://zoox.com/journal/internship-program-zoox) — accessed 2026-10-07
- [Zoox: It's Not a Car](https://zoox.com/) — accessed 2026-10-07
- [Zoox's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/zoox-interview-process) — accessed 2026-10-07
