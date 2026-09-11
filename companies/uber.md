# Uber engineering track

Sits beside [lyft.md](lyft.md), [doordash.md](doordash.md), and [product-companies.md](product-companies.md): **rides + Eats + freight marketplace**, not a generic FAANG slate. Official [How we hire](https://jobs.uber.com/en/what-moves-us/how-we-hire/): talent-team conversation → **hiring-manager** chat → **technical interview** (shared problem, collaborative) → optional **functional exercise** → **team interview** → recruiter + hiring team decide. Official [Acting with integrity](https://www.uber.com/us/en/about/integrity/): “how we succeed… matters just as much”; **Stand up, Speak up**. Recruiter confirms **CodeSignal vs live-only**, **level (L3–L5+)**, **geo design**, and **AI / editor** rules.

Typical timeline **2–6 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Geo matching: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md). OA: [../general/online-assessments.md](../general/online-assessments.md). LLD: [../general/low-level-design.md](../general/low-level-design.md).

## Official culture (how-we-hire + integrity)

Do **not** recite a list. Map **your** stories. Official how-we-hire: challenges affect **real people, in real time**; they score **how you solve**, not only the answer. Official integrity: own mistakes; no credit-and-deflect.

Guides (2026) still cite a values string such as **Go Get It / Trip Obsessed / Build with Heart / One Uber**. Prefer whatever **your recruiter packet** lists. “Why Uber?” that only says “I use the app” fails. Name a **matching, ETA, surge, or safety** problem you have lived.

## Official + reported process

Official how-we-hire is the skeleton. 2026 guides (TechPrep, techinterview.org, Exponent) add vendor names — treat as **reported**.

| Stage | What they score |
| --- | --- |
| Talent team (~30 min) | Background, team direction, comp; **shapes the loop** |
| Hiring manager (official) | Decisions at scale; team challenges |
| Functional exercise (official, role-dependent) | Guides: **CodeSignal OA**, ~70–90 min, often **four** problems |
| Technical interview (official) | Guides: live CodeSignal + Zoom; **narrate**; one or two mediums |
| Team interview (official) | Guides: 4–6 virtual hours — 2 coding, 1–2 design (mid+), collaboration / bar-raiser-like |
| Decision (official) | Guides: hiring committee; feedback often **3–5** business days |

Guides: OA score beats a heroic unfinished fourth; **graphs** (BFS/DFS, Dijkstra, grids) show up more than on a generic slate. Senior loops add a second design hour. Some 2026 SDE-2 reports add a **machine-coding / LLD** hour — ask.

## How this track differs

| vs FAANG | vs Lyft / DoorDash |
| --- | --- |
| Official **HM before** the deep technical loop | Lyft: laptop programming test; DoorDash: CodeCraft / three-sided marketplace |
| Design is **geo + real-time** (cells, stale pings, surge) | Broader than Lyft (Eats / freight); still **deeper** on matching than generic HLD |
| CodeSignal practice is a skill of its own (guides) | Confirm OA — official page says “some roles” get an exercise |

## Coding and design flavor

Live problems look like **grids, intervals, heaps, windows**, dressed as routes or trip logs. Design: rider–driver matching, live location, Eats tracking, surge cells. Official Uber open source: **[H3](https://h3geo.org/)** hexagonal cells — name **cell + neighbors**, not “split the map somehow.” Related: [../answers/coding-meeting-rooms.md](../answers/coding-meeting-rooms.md), [../answers/coding-rotting-oranges.md](../answers/coding-rotting-oranges.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why Uber — not a generic marketplace?” — matching / safety / real-time, not slogans.
2. Medium graph or interval; then “edge costs change by time of day.”
3. CodeSignal-style: three clean solves beat a half-done hard.
4. Design matching + live tracking for a concert spike (cells, freshness, surge).
5. Integrity: a time you were **wrong** and owned the fix.

## Prep checklist

- [ ] Read [How we hire](https://jobs.uber.com/en/what-moves-us/how-we-hire/) + [integrity](https://www.uber.com/us/en/about/integrity/)
- [ ] Recruiter: **graded level**, OA yes/no, design count, AI / CodeSignal rules
- [ ] Two timed **CodeSignal** sessions if you have an OA
- [ ] 2 narrated mediums (one **graph**, one **interval / heap**)
- [ ] One matching / location design mock; know [H3](https://h3geo.org/) at “hex cell” depth
- [ ] STAR bank mapped to **the values they send you**
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How we hire — Uber](https://jobs.uber.com/en/what-moves-us/how-we-hire/) — accessed 2026-09-11
- [Acting with integrity — Uber](https://www.uber.com/us/en/about/integrity/) — accessed 2026-09-11
- [H3 — Uber’s hexagonal hierarchical geospatial index](https://h3geo.org/) — accessed 2026-09-11
- [Uber's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/uber-interview-process) — accessed 2026-09-11
- [How Uber Interviews Software Engineers in 2026 — techinterview.org](https://www.techinterview.org/post/3233476840/uber-interview-guide/) — accessed 2026-09-11
- [Uber Software Engineer Interview Guide (2026) — Exponent](https://www.tryexponent.com/guides/uber-software-engineer-interview) — accessed 2026-09-11
