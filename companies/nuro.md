# Nuro engineering track

Sits beside [waymo.md](waymo.md), [zoox.md](zoox.md), and [applied-intuition.md](applied-intuition.md): **L4 goods + mobility autonomy (Nuro Driver™)**, not Alphabet robotaxi and not Tesla Autopilot. Official [Company](https://www.nuro.ai/company): Universal Autonomy Platform across personal vehicles, ride-hail, and commercial fleets; **2M+** autonomous miles with **zero at-fault** incidents (as published). Official [Careers](https://www.nuro.ai/careers): AI-first stack on **multiple vehicle platforms**. Recruiter confirms **onboard C++ vs sim / eval vs embedded vs infra**, language, and site.

Typical timeline **~3–5 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Fleet cousin: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official [Careers](https://www.nuro.ai/careers) values + [Company](https://www.nuro.ai/company). Co-CEO Jiajun Zhu’s [Candid Guide](https://www.nuro.ai/blog/a-candid-guide-to-interviewing-at-nuro) (2026-04-15) is the published interview note. Map **your** stories.

| Official signal | What they score |
| --- | --- |
| **Earn it** | Excellence and hard work, not “AV is cool” |
| **1% better every day** | A concrete improvement loop you ran |
| **Find a way** | Ambiguity you unblocked without a playbook |
| **Act now** | Judgment + ownership; everyone is a problem solver |
| **One team** | Cross-discipline delivery (software + vehicle + ops) |
| **Safety first** (careers / company) | Layers of test, validation, monitoring — not slogans |

“Why Nuro?” that only says “I want self-driving / Waymo energy” fails. Name a **latency, log-eval, OTA, or safety** problem you have lived.

## Official + reported process

Official candid guide + careers exist; **round contents** are not a published stage list. 2026 guides (PracHub) — treat as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter / HM screen (guides) | Background, why Nuro, **which stack**; ask language and loop shape |
| Tech screen(s) (guides: 1–2) | Live C++ or Python from a **blank file**; resume deep dive + coding / internals |
| Onsite / virtual onsite (guides) | Algo, LLD / architecture, **domain** (perception / robotics / C++), behavioral |
| Offer | Confirm **team, site, level**; vehicle vs cloud vs eval |

Guides: designs name **bandwidth, intermittent links, onboard memory** and a fallback. Confirm AI-in-pad; do not assume Waymo’s written no-live-AI rule.

## How this track differs

| vs Waymo / Zoox / Applied | vs FAANG web |
| --- | --- |
| Official **five values**; Nuro Driver on **partner vehicles** (Uber / Lucid Houston 2027 announced) | Design is **onboard / logs / OTA / eval**, not “design Twitter” |
| Delivery-rooted L4 + mobility partnerships; Zoox is Amazon robotaxi | Guides: complete programs, not stub-fill LeetCode |
| AV résumé is useful, not required if first-principles hold | C++ ownership / concurrency show up more than vanilla JS CRUD |

## Coding and design flavor

DSA in a **vehicle costume**: graphs / topo, intervals, windows, UF on sparse points. LLD: thread-safe buffer, time-indexed pose, job scheduler with cancel. Design: sim job DAG, drive-log eval, OTA with a bad deploy. Related: [../answers/coding-course-schedule.md](../answers/coding-course-schedule.md), [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Driver (multi-platform L4) — portable “I want AV” is weak.
2. Live: graph or geometry medium from an empty file; say the invariant first.
3. Design: weekly 10k-case sim with phased deps — what you serialize last.
4. Value: Find a way / Act now — a safety vs schedule call you owned.
5. Questions for them: onboard vs eval vs embedded, C++ vs Python, AI-in-pad.

## Prep checklist

- [ ] Read [Candid Guide](https://www.nuro.ai/blog/a-candid-guide-to-interviewing-at-nuro) + [Careers](https://www.nuro.ai/careers) + [Company](https://www.nuro.ai/company)
- [ ] Recruiter: team, language, domain hour, site, AI policy
- [ ] One timed medium from a blank file + one fleet / log design
- [ ] STAR mapped to the five values — **your** impact
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [A Candid Guide to Interviewing at Nuro](https://www.nuro.ai/blog/a-candid-guide-to-interviewing-at-nuro) — accessed 2026-10-10
- [Careers — Nuro](https://www.nuro.ai/careers) — accessed 2026-10-10
- [Company — Nuro](https://www.nuro.ai/company) — accessed 2026-10-10
- [Nuro Software Engineer Interview Questions 2026 — PracHub](https://prachub.com/interview-guide/nuro-software-engineer-interview-questions-guide-2026) — accessed 2026-10-10
- [Nuro Software Engineer Interview Guide 2026 — Dataford](https://dataford.io/interview-guides/nuro/software-engineer) — accessed 2026-10-10
