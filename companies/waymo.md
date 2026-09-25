# Waymo engineering track

Sits beside [tesla.md](tesla.md) and [nvidia.md](nvidia.md): **Alphabet autonomy / Waymo Driver**, not a generic consumer-app loop and not Tesla Autopilot. Official [About](https://waymo.com/about/): mission is to be the **world’s most trusted driver** — safer, more accessible, more sustainable movement. Official [How we hire](https://careers.withwaymo.com/how-we-hire) is the process source of truth. Recruiter confirms **planner vs perception vs simulation vs infra vs rider-product**, language (often C++), and the **official no-live-AI** rule.

Typical timeline **~3–8 weeks** once moving (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Geo cousin: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official [How we hire](https://careers.withwaymo.com/how-we-hire) + [Careers](https://careers.withwaymo.com/). Map **your** stories.

| Official note | What they score |
| --- | --- |
| **World’s most trusted driver** ([About](https://waymo.com/about/)) | Safety over slogans — not “I like self-driving cars” |
| **Ask clarifying questions** | Open-ended prompts; they want you to reject bad assumptions |
| **Define and frame** | Break a large problem; structured plan before code |
| **Show your thinking** | Narrate decisions and what data would change them |
| **Refine + test** | First idea is a draft; improve and say how you would test |
| **Connecting the dots** | Ambiguity, complexity, prioritization, matrixed alignment |

Official AI policy (How we hire): **assessments independently** — no AI / LLMs unless the instructions say otherwise. **Live interviews** (technical, behavioral, design) **without AI**. Resume grammar polish is allowed; the application must be **your** history.

“Why Waymo?” that only says “Alphabet / robots / Tesla energy” fails. Name a **safety, simulation, latency, or fleet-ops** problem you have lived.

## Official + reported process

Official [How we hire](https://careers.withwaymo.com/how-we-hire) publishes the skeleton. 2026 guides (Driverless Digest; InterviewChamp) — treat round *contents* as **reported**.

| Stage | Official / reported |
| --- | --- |
| Resume + sourcer / recruiter | Fit; ask timeline and language on this first call (official) |
| 1–2 phone / video | Behavioral **and/or** technical with a peer or manager (official) |
| Virtual onsite | Up to **five** interviewers, ~45 min each, including XFN (official) |
| Offer | Recruiter walks comp / benefits after you are the pick (official) |

Guides: new-grad often adds a timed OA; mid+ loops mix graphs / geometry, C++ memory, simulation or tracker design, and a safety-minded behavioral. Alphabet HC-style debrief is **reported** — confirm.

## How this track differs

| vs Tesla / NVIDIA | vs FAANG web |
| --- | --- |
| Official **no-AI** live + OA unless noted; Tesla is mission / first-principles | Design is **sim, logs, planner, sensor fusion**, not “design Twitter” |
| Alphabet autonomy product; Tesla is in-house Autopilot | Official onsite is **virtual, up to five** 45-min seats |
| Safety + clarifying questions are written into How we hire | C++ / geometry show up more than vanilla JS CRUD |

## Coding and design flavor

DSA: graphs / BFS, windows, geometry (intersection, point-in-polygon) in a vehicle costume. Design: evaluation of a driving model, simulation logging at fleet scale, onboard vs cloud inference under a compute budget. Related: [../answers/coding-course-schedule.md](../answers/coding-course-schedule.md), [../answers/system-design-metrics.md](../answers/system-design-metrics.md), [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** stack (planner vs sim vs infra) — portable “I want AV” is weak.
2. Live: graph or geometry medium; ask what “safe” means before you code.
3. Design: offline eval for a planner change — labels, sim-to-real gap, who can ship.
4. Behavioral: ambiguity + getting alignment in a matrixed org (official prompt family).
5. Questions for them: city rollout vs research, C++ vs Python, official AI rule on *your* pad.

## Prep checklist

- [ ] Read [About](https://waymo.com/about/) + [How we hire](https://careers.withwaymo.com/how-we-hire) + the JD
- [ ] Recruiter: language, OA vs live, team, AI policy (assume **off** unless written)
- [ ] One timed medium + one fleet / sim design + one safety STAR
- [ ] Practice *asking* clarifying questions out loud
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How we hire — Waymo](https://careers.withwaymo.com/how-we-hire) — accessed 2026-09-25
- [About — Waymo](https://waymo.com/about/) — accessed 2026-09-25
- [Careers — Waymo](https://careers.withwaymo.com/) — accessed 2026-09-25
- [How to Get Hired at Waymo — The Driverless Digest](https://www.thedriverlessdigest.com/p/how-to-get-hired-at-waymo) — accessed 2026-09-25
- [Waymo SWE (New Grad) Interview Questions 2026 — InterviewChamp](https://interviewchamp.ai/interview-questions/waymo/swe-new-grad) — accessed 2026-09-25
