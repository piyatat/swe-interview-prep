# Lyft engineering track

Sits beside [doordash.md](doordash.md) and [product-companies.md](product-companies.md) (Uber): **two-sided rideshare + bikes/scooters**, not a generic FAANG slate. Official [Lyft Careers](https://www.lyft.com/careers): purpose is **to serve and connect**; culture “revolves around our core values.” Official [What’s it like to interview at Lyft](https://eng.lyft.com/whats-it-like-to-interview-at-lyft-our-recruiting-team-spills-the-secrets-b58efa584b92) (Engineering, 2023): recruiter intro → **~45 min Technical Phone Screen** (algorithms / data structures, Google Meet) → **virtual onsite of typically four** sessions (architecture, coding, management skills — “may vary”). Recruiter confirms **level**, **hub / remote**, **CoderPad language**, **AI / internet on the laptop hour**, and whether you get a **geo design** hour.

Typical timeline **4–6 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Geo matching: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md). Practical build hour: [../general/low-level-design.md](../general/low-level-design.md).

## Official culture (careers + eng)

Do **not** recite a list. Map **your** stories.

Official careers language: **serve and connect**, belonging, early-talent mentor support. Official recruiting post scores **how you solve**, not memorized formulas — ask clarifying questions, watch the 45–90 min clock, show work.

Prep guides disagree on the exact 2026 values string (TechScreen: *Be Yourself / Uplift Others / Make It Happen*; Exponent still cites *Disagree and Commit / Dive Deep / All-in ownership*). Prefer whatever **your recruiter packet** lists. “Why Lyft?” that only says “I use the app” fails. Name a real **matching, ETA, pricing, or safety** problem you have lived.

## Official + reported process

Official careers do **not** publish a fixed SWE stage list. Official 2023 recruiting post + 2026 guides:

| Stage | What they score |
| --- | --- |
| Recruiter (~30 min) | Why Lyft, **level**, hub / visa, mission fit |
| Technical Phone Screen (~45–60 min) | One or two **medium** problems on CoderPad; often **graph / interval / geo-flavored** |
| Onsite coding | Second medium–hard; graphs, intervals, grids; narration |
| **Laptop programming test (~90 min, guides)** | Build on **your** machine; **open internet**; working software + structure + tests |
| System design (mid+) | Matching, live location, ETA, surge / dispatch — geo cells, not “design Twitter” |
| Behavioral / EM | Values-mapped STAR; ownership, disagreement, uplift |

Guides: algorithms stay **medium**; the differentiator is the **laptop hour** (outcome first, then absorb a late requirement) and a **tight geo design** bar. Senior loops weight design + behavioral more.

## How this track differs

| vs FAANG | vs Uber / DoorDash |
| --- | --- |
| **Laptop test** — your IDE, docs, maybe AI; they watch *how* you use tools | Uber: CodeSignal OA + graphs; DoorDash: CodeCraft / three-sided marketplace |
| Design is **rideshare geo** (H3 / geohash, stale pings, surge cells) | Narrower product than Uber (no freight / grocery sprawl) — go **deeper** on matching |
| Official recruiting post: four virtual sessions, clock discipline | Confirm AI — careers do not publish a loop-wide rule |

## Coding and design flavor

Live problems look like **BFS/DFS, intervals, heaps, windows**, dressed as availability windows or routes. Laptop: parse → domain objects → output; leave a seam for “city minimum + fee before surge.” Design: rider–driver matching, location fan-out, ETA, surge by cell. Related: [../answers/coding-meeting-rooms.md](../answers/coding-meeting-rooms.md), [../general/pair-programming.md](../general/pair-programming.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why Lyft — not a generic marketplace?” — matching / safety / multimodal, not slogans.
2. Medium graph or interval; then “driver locations are a stream.”
3. 90-min laptop: fare / trip module; new fee rule at minute 50.
4. Design matching + live tracking for a concert spike.
5. Values: a time you **uplifted** a teammate or **made it happen** under a constraint.

## Prep checklist

- [ ] Read [Careers](https://www.lyft.com/careers) + [interview recruiting post](https://eng.lyft.com/whats-it-like-to-interview-at-lyft-our-recruiting-team-spills-the-secrets-b58efa584b92)
- [ ] Recruiter: **graded level**, laptop hour rules (internet / AI), design yes/no
- [ ] 2 narrated mediums (one **graph**, one **interval**)
- [ ] One **90-min open-internet build** with tests + a requirement change
- [ ] One matching / ETA design mock
- [ ] STAR bank mapped to **the values they send you**
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Lyft Careers](https://www.lyft.com/careers) — accessed 2026-09-08
- [What’s it like to interview at Lyft? — Lyft Engineering](https://eng.lyft.com/whats-it-like-to-interview-at-lyft-our-recruiting-team-spills-the-secrets-b58efa584b92) — accessed 2026-09-08
- [The Lyft Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/lyft-technical-interview-process-2026) — accessed 2026-09-08
- [Lyft Interview Guide (2026) — techinterview.org](https://www.techinterview.org/companies/lyft-interview-guide/) — accessed 2026-09-08
- [Lyft Software Engineer Interview Guide — Exponent](https://www.tryexponent.com/guides/lyft-software-engineer-interview) — accessed 2026-09-08
