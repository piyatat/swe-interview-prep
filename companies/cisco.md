# Cisco engineering track

Sits beside [cloudflare.md](cloudflare.md) and [okta.md](okta.md): **enterprise networking, security, and collaboration infrastructure** (IOS, Nexus, Meraki, ThousandEyes, Splunk, Webex), not a consumer social loop. Official [Careers](https://careers.cisco.com/global/en): build **critical infrastructure for the AI era**. Official [How we hire](https://careers.cisco.com/global/en/how-we-hire): process **varies by team**; recruiter tells you the path; many loops finish in **2–3 weeks**; some roles include an assessment. Recruiter confirms **switching / wireless / cloud / security / Full-Stack**, C/C++ vs Python vs Java, Webex vs onsite, and **GenAI policy**.

Typical timeline **2–8 weeks** (official “many interviews 2–3 weeks”; 2026 guides stretch to 4–8). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Networking / OS: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Rate limits / edge: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (People Deal + how they hire)

Do **not** invent a 16-principle list. Official People Deal (WeAreCisco) + careers messaging sit on three values:

| Official value | What they score |
| --- | --- |
| **Connect everything** | Cross-team delivery; you brought quiet voices in; customer outcome |
| **Innovate everywhere** | Speed + a challenged norm with a metric — not “I like new tools” |
| **Benefit everyone** | Inclusive future; mentorship / customer benefit with a denominator |

Official How we hire: tell **your** story; connect experience to the JD; bring questions; collaboration is **how work gets done**. Official inclusion FAQ: mission is **power an inclusive future for all**. “Why Cisco?” that only says “I studied CCNA / they have Webex” fails. Name a **packet path, control-plane, or infra-reliability** problem you have lived.

## Official GenAI policy (do not guess)

Official [GenAI Best Practices](https://careers.cisco.com/global/en/genai-practices) (updated 2025-11-10): **prep yes, live replace no**. Allowed: interview tips, clarity edits, keyword match to **real** experience, brainstorm approaches, calculator, review code. **Not** allowed: paste AI resume/cover/assessment answers, read a script, invent experience, generate the live coding/design solution, present generated code as yours. Same rules on [How we hire](https://careers.cisco.com/global/en/how-we-hire). Interviews are **Webex, phone, or in person** — not chat/email. Recruiters use `@cisco.com` (plus listed scheduling domains).

## Official + reported process

Official page is the skeleton (connect → prepare → interview/assessment → offer). 2026 guides (TechPrep) add the SWE funnel — treat MCQ counts as **reported**.

| Stage | What they score |
| --- | --- |
| Application (official) | Min quals **on the resume**; 7–10 day first response is the target |
| OA (guides: HackerRank ~70–90 min) | 2–3 coding **plus** networking / OS / DB MCQs |
| Recruiter (official) | Fit; what the loop will be |
| Webex tech (guides: 1–2 × 45–60 min) | Resume walk + one medium; clean runnable code |
| Loop (guides: 3–5, sometimes two days) | Coding, infra HLD, LLD, behavioral vs People Deal |
| HM / HR | Team, values, comp |

Networking MCQs are a **known filter** even on SWE reqs (OSI, TCP vs UDP, switch vs router). Do not skip [../general/cs-fundamentals.md](../general/cs-fundamentals.md).

## How this track differs

| vs Cloudflare / Okta | vs FAANG |
| --- | --- |
| Packets, control plane, **enterprise install base** | Medium DSA **and** a TCP handshake on the same loop |
| Official **no live AI solutions**; prep with AI is fine | People Deal, not 16 LPs — still a collaboration veto |
| OA MCQs can fail you after a green coding score | Design is **monitoring, rate limit, campus fabric**, not “design Twitter” |

## Coding and design flavor

Coding: graphs, DP, lists (islands, course schedule, Kadane, reverse list). HLD: network monitoring, URL shortener, rate limiter, scalable APIs. LLD: parking lot, logger, expense split. Talk **dataplane vs control plane**, failure domains, and what you log. Related: [../answers/system-design-metrics.md](../answers/system-design-metrics.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** infra problem (wireless, cloud, security) — “Cisco is stable” is weak.
2. OA: two mediums **and** the MCQ block; guess-and-go is a fail.
3. Webex: one medium; compile; complexity.
4. Design: monitor packet loss across a campus fabric without drowning storage.
5. Connect everything: you unblocked another team’s ship — what you actually did.

## Prep checklist

- [ ] Read [How we hire](https://careers.cisco.com/global/en/how-we-hire) + [GenAI practices](https://careers.cisco.com/global/en/genai-practices) + [Careers home](https://careers.cisco.com/global/en)
- [ ] Recruiter: org (networking vs software), OA vs no OA, languages, hybrid
- [ ] One timed graph/DP medium + OSI/TCP drill + STAR vs **Connect / Innovate / Benefit**
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How We Hire — Cisco Careers](https://careers.cisco.com/global/en/how-we-hire) — accessed 2026-09-17
- [GenAI Best Practices and Permitted Uses — Cisco Careers](https://careers.cisco.com/global/en/genai-practices) — accessed 2026-09-17
- [Careers at Cisco](https://careers.cisco.com/global/en) — accessed 2026-09-17
- [The Deal that Matters Most (People Deal) — WeAreCisco](https://weare.cisco.com/c/r/weare/amazing-stories/amazing-things/the-deal-that-matters-most.html) — accessed 2026-09-17
- [Cisco's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/cisco-interview-process) — accessed 2026-09-17
- [Cisco Interview Response Time (2026) — Leon Consulting](https://leonstaff.com/blogs/cisco-interview-response-time/) — accessed 2026-09-17
