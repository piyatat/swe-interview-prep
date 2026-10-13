# Klaviyo engineering track

Sits beside [hubspot.md](hubspot.md) and [twilio.md](twilio.md): **B2C marketing automation** (email / SMS / events / segments), not inbound CRM and not a carrier API. Official [Careers](https://www.klaviyo.com/careers): 200k+ brands; Core Engineering is **ownership + technical depth** at send-time scale. Recruiter confirms **platform vs product vs ML**, Python vs JVM, Boston / Denver / SF / London hubs, and CodeSignal vs live.

Typical timeline **~3–5 weeks** (2026 guides). OA: [../general/online-assessments.md](../general/online-assessments.md). AI policy: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official [Careers](https://www.klaviyo.com/careers) lists **eight** current values. Map **your** stories. Official [AI guidance](https://www.klaviyo.com/careers/ai-guidance) reuses five of them for how you use models in the loop.

| Official value | What they score |
| --- | --- |
| **Put customers first** | Customers > customers’ customers > team > self |
| **Win together** | Honest conflict; disagree and commit |
| **Know the score** | Results, not hours; attribution if AI helped |
| **Be meticulous in your craft** | Rigorous, thorough, prepared |
| **Move fast, no shortcuts** | Speed **without** skipping the critical step |
| **Drivers wanted** | No passengers; raise or fix what is broken |
| **Stay hungry, stay humble** | Slope; no brilliant jerks |
| **We're 1% done** | Beginner’s mindset; next product is ahead |

Official AI line: **AI fluency is assessed**, but the interview is a **skill** test — human in the loop matters most. Disclose live AI use. Interviewers tell you **when** live AI is wanted. Humans make the hiring call.

“Why Klaviyo?” that only says “email marketing / I like AI” fails. Name a **segmentation, event ingest, or send-time** problem you have lived.

## Official + reported process

Official careers do **not** publish a numbered SWE stage list. JDs point at the AI guidelines. 2026 InterviewQuery / candidate reports — treat as **reported**:

| Stage | Official / reported |
| --- | --- |
| Recruiter | Role, hub, level; scam warning: only `@klaviyo.com` |
| Practical OA | Guides: timed **multi-stage CodeSignal-style build** (not classic LeetCode). Later stages unlock; **finishing every stage is not required** to advance |
| HM / project deep-dive | Guides: one project — scale, monitors, SPOFs, why that design |
| Final loop | Guides: debug / extend an existing repo, practical coding, system design or second HM |

Confirm **your** loop. Official rule: do **not** feed live questions to a model or let AI sit the OA unless they invited it.

## How this track differs

| vs HubSpot / generic SaaS | vs FAANG web |
| --- | --- |
| Official **eight values** + **published AI rules** | Design is **events / segments / send**, not a feed |
| Practical staged OA (guides) | “I only grind LeetCode” is the wrong sport |
| AI fluency **and** attribution | Silent copy-paste from a chatbot is an official fail |

## Coding and design flavor

Official products: profiles, events, segments, email/SMS/push, AI in the product. Live work: idempotent event ingest, fan-out, rate limits, backpressure, consent. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../general/debugging-rounds.md](../general/debugging-rounds.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** B2C marketing platform — portable “growth / CRM” is weak.
2. Practical: ingest events with at-least-once delivery; dedupe by id.
3. Design: segment 10⁸ profiles for a send — freshness vs fan-out cost.
4. Value: Move fast, no shortcuts — you slipped a date rather than skip a check.
5. Questions for them: OA shape, when live AI is allowed, hub days.

## Prep checklist

- [ ] Read [Careers](https://www.klaviyo.com/careers) (eight values + AI DNA) + [AI guidance](https://www.klaviyo.com/careers/ai-guidance)
- [ ] Recruiter: OA vs live, languages, hub, when AI is invited
- [ ] One timed practical build + one event / segment sketch
- [ ] STAR vs the eight values — **your** customer / driver story
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers at Klaviyo](https://www.klaviyo.com/careers) — accessed 2026-10-13
- [Guidelines for Using AI in the Interview Process — Klaviyo](https://www.klaviyo.com/careers/ai-guidance) — accessed 2026-10-13
- [Klaviyo Software Engineer Interview Guide 2026 — InterviewQuery](https://www.interviewquery.com/interview-guides/klaviyo-software-engineer) — accessed 2026-10-13
- [Senior Software Engineer, Platform Engineering — Klaviyo](https://www.klaviyo.com/careers/jobs/7783904003) — accessed 2026-10-13
