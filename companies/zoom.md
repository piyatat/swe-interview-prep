# Zoom engineering track

Sits beside [discord.md](discord.md) and [../answers/system-design-video-conferencing.md](../answers/system-design-video-conferencing.md): **real-time meetings, Phone, Contact Center, and AI Companion**, not a generic SaaS DSA slate. Official [Careers](https://careers.zoom.us/): “Build Meaningful Connections”; hiring process is **application → recruiter screen → tech assessment (role dependent) → interview(s) → offer → New Zoomie onboarding**. Recruiter confirms **Meetings client vs media/SFU vs Phone vs AI Companion**, language (C++ / Java / Go / TypeScript), and whether you get a **domain deep-dive**.

Typical timeline **2–5 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Conferencing design: [../answers/system-design-video-conferencing.md](../answers/system-design-video-conferencing.md). Chat / presence: [../answers/system-design-chat.md](../answers/system-design-chat.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (Care + Deliver Happiness)

Do **not** recite posters. Map **your** stories. Official [About](https://www.zoom.com/en/about/) + careers: mission is an **AI-first work platform for human connection**. Core value is **Care** for customers, company, communities, teammates, and ourselves. Careers also lists how Zoomies work: **Respect, Reliability, Empathy, Professionalism**, plus **Exceed Expectations & Anticipate Needs** and **Be Knowledgeable**.

“Why Zoom?” that only says “I used it in 2020” fails. Name a **latency, packet-loss, recording, or meeting-AI** problem you have lived. Use the product (Meetings + AI Companion) and have an opinion.

## Official + reported process

Official careers lists the **stage names**. 2026 guides (TechPrep, techinterview.org) describe SWE round mix — treat counts as **reported**.

| Stage | What they score |
| --- | --- |
| Recruiter (~30 min) | Background; why Zoom; team (client / media / Phone / Companion) |
| Tech assessment (official, role dependent) | Timed coding **or** skip to live screen |
| Technical screen (guides, 45–60 min) | One medium on CoderPad / HackerRank; concurrency follow-up common |
| Loop (guides, 4–5 rounds) | 2 coding (one applied / real-time); HLD; domain deep-dive; behavioral |
| Take-home (some senior / ML, guides) | 4–6 h API or eval harness + live walkthrough |
| HM / director (guides, 30–45 min) | Impact, growth, final alignment |

Guides: client/media hours are **C++ and jitter/bitrate**; backend is Java/Go; Companion is Python / TypeScript + speech/LLM. Confirm.

## How this track differs

| vs Discord / Slack-style chat | vs FAANG |
| --- | --- |
| Design is **SFU, simulcast, ICE/STUN/TURN**, not “design Twitter” | Medium DSA **plus** a media or Companion vocabulary hour |
| Official **Care / happiness** stories, not Googleyness | Native clients are a **proprietary** stack; web still talks WebRTC concepts |
| Cross-US/Asia timezone collaboration is scored | Applied coding may be buffers / bitrate, not only Blind 75 |

## Coding and design flavor

DSA: clean mediums (arrays, trees, graphs) plus **thread-safety** on LRU / queues. Design: 100k concurrent meetings, global SFU POPs, per-participant recording → Companion summary. Know **SFU vs MCU vs mesh** in 60 seconds: mesh is O(n²) uplinks; MCU mixes (CPU + extra latency); SFU **forwards selected layers**. Related: [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** cloud (Meetings media vs Companion vs Phone) — “video is important” is weak.
2. Live: medium coding; state complexity; handle a **multi-threaded** follow-up.
3. Design: media routing for a global SFU with POP failure mid-meeting.
4. Walk ICE / NAT failure: host candidate works at home, fails on corp Wi-Fi — what next (STUN vs TURN).
5. Care: a customer-visible quality regression — detect, contain, communicate across time zones.

## Prep checklist

- [ ] Read [Careers](https://careers.zoom.us/) + [About](https://www.zoom.com/en/about/); try AI Companion once
- [ ] Recruiter: team, language, OA vs live, deep-dive vs generic HLD, AI policy
- [ ] One timed medium + one conferencing design + SFU vs MCU in 90 seconds
- [ ] STAR bank for **Care, ownership under latency SLOs, async global teammates**
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Career Portal — Zoom](https://careers.zoom.us/) — accessed 2026-09-16
- [About Zoom — We Deliver Happiness](https://www.zoom.com/en/about/) — accessed 2026-09-16
- [Zoom's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/zoom-interview-process) — accessed 2026-09-16
- [Zoom Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/zoom/) — accessed 2026-09-16
- [WebRTC — Wikipedia](https://en.wikipedia.org/wiki/WebRTC) — accessed 2026-09-16
- [Zoom Video Communications Hiring Process Guide 2026 — ClavePrep](https://claveprep.com/blog/zoom-video-communications-hiring-process-guide-2026) — accessed 2026-09-16
