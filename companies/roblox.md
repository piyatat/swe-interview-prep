# Roblox engineering track

Sits beside [product-companies.md](product-companies.md) and [../general/online-assessments.md](../general/online-assessments.md): **real-time multiplayer + engine/infra + a game-shaped OA**, not a generic SaaS DSA slate. Official [Careers](https://careers.roblox.com/): vision is to **reimagine the way people come together** in a world that is **safe, civil, and optimistic**. Recruiter confirms **San Mateo in-office days**, **C++ vs language-flexible track**, **AI policy**, and whether the **simulation OA / SJT** is still on your loop.

Typical timeline **4–6 weeks** (guides); official 2022 hiring write-up asked for **at least two weeks** and a **hiring committee**. Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Real-time design cousins: [../answers/system-design-video-conferencing.md](../answers/system-design-video-conferencing.md), [../answers/system-design-chat.md](../answers/system-design-chat.md).

## Official culture (careers + interview write-up)

Do **not** recite the four values. Map **your** stories.

Official [Careers](https://careers.roblox.com/) values (VP Eng: treat them as a **decision-making algorithm**):

| Official value | What the page scores |
| --- | --- |
| **Respect the Community** | Youth-heavy platform; safety and civility are product constraints |
| **Take the Long View** | First-principles, not “how we have always done it” (CTO line on the interview page) |
| **Be Responsible** | Own side effects: latency, moderation, economy, kids |
| **Get Stuff Done** | Initiative / grit — unblock yourself instead of waiting |

Official [What it’s like to interview](https://corp.roblox.com/newsroom/2022/02/like-interview-roblox-engineer): open-ended **creative problem-solving** is **not** a trick coding puzzle — structure ambiguity with the interviewer. They score **how you think**, plus values alignment. “Why Roblox?” that only says “I played as a kid” fails. Name a real **latency, replication, creator-economy, or safety** problem you have lived.

## Official + reported process

Official careers [interviewing page](https://careers.roblox.com/interviewing-at-roblox) is a prep portal, not a fixed stage list. Official 2022 write-up + 2026 guides:

| Stage | What they score |
| --- | --- |
| Recruiter (30–45 min) | Why Roblox, **level**, **in-office**, comp band |
| OA (~2 hr, CodeSignal / HackerRank) | Medium coding + **strategy mini-games** + timed **situational judgment** |
| Phone screen (60–90 min) | Live coding (mid) or project / light design (senior); **C++** on engine/systems |
| Onsite coding ×2 | Medium–hard; scale / memory / real-time follow-up |
| System design | Matchmaking, replication, presence, or **moderation** |
| Behavioral / values | Four values + grit stories |
| Domain (engine / graphics / infra) | Rendering, netcode, or low-level perf |
| Hiring committee | Packet + calibrated bar (official) |

Guides still report a **Bar Raiser–like** outside interviewer on some loops — confirm with the recruiter. Early-career official copy: the **assessment is the first interview**; you can pace modules over a week.

## How this track differs

| vs FAANG | vs Snap / Figma |
| --- | --- |
| Official **game / simulation OA** + SJT | Snap is S.A.I.L. + ephemeral media; Figma is FigJam + canvas |
| Design budget is **single-digit ms**, not 200 ms API p99 | Not a CRUD / payments loop |
| **C++ / Luau / replication** on engine tracks | Web/product teams are closer to a normal product company |

## Coding and design flavor

Live problems look like **graphs, heaps, windows, trees**, then “10M events / bound memory / concurrent writers.” Design: **matchmaking**, state **replication** (who is authority?), presence, or a **safety / report queue** that must not stall the sim. Related: [../answers/coding-top-k.md](../answers/coding-top-k.md), [../answers/system-design-notification.md](../answers/system-design-notification.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why a real-time creation platform — not a generic social app.”
2. Top-K active experiences in a sliding window; then “now it is a stream.”
3. Design matchmaking: skill, region, party size, cheat / smurf, queue SLA.
4. Replicate a small world: tick rate, interest management, late joiner.
5. Values: a time you **got stuff done** around a blocker, or chose the **long view** over a local hack.

## Prep checklist

- [ ] Read [Careers](https://careers.roblox.com/) + [interviewing](https://careers.roblox.com/interviewing-at-roblox) + the [engineer interview write-up](https://corp.roblox.com/newsroom/2022/02/like-interview-roblox-engineer)
- [ ] Recruiter: **office days**, C++ vs any language, OA modules, AI, domain extra
- [ ] Practice CodeSignal mediums **and** stay calm on an unfamiliar strategy game
- [ ] One real-time or matchmaking design mock
- [ ] STAR bank mapped to the **four** values (not a FAANG LP dump)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers Homepage — Roblox](https://careers.roblox.com/) — accessed 2026-09-07
- [Interviewing at Roblox](https://careers.roblox.com/interviewing-at-roblox) — accessed 2026-09-07
- [What It’s Like to Interview at Roblox as an Engineer — Roblox](https://corp.roblox.com/newsroom/2022/02/like-interview-roblox-engineer) — accessed 2026-09-07
- [The Roblox Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/roblox-technical-interview-process-2026) — accessed 2026-09-07
- [What Is the Roblox Interview Process Like? — Design Gurus](https://www.designgurus.io/answers/detail/what-is-the-roblox-interview-process-like-round-by-round) — accessed 2026-09-07
