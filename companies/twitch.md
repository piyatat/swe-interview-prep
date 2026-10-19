# Twitch engineering track

Sits beside [discord.md](discord.md) and [faang-big-tech.md](faang-big-tech.md): **live communities / creator platform (Amazon)**, not Discord voice-chat and not a generic FAANG slate. Official [Interviewing](https://careers.twitch.com/en/interviewing/): a real human reviews every application (“AI overlord free”); **2–8 weeks** application → decision. Recruiter confirms **full-time vs intern**, **async skills assessment**, **Go / TypeScript / React vs backend**, and AI policy.

Typical full-time path is **recruiter → hiring manager → optional async assessment → remote onsite (4–5 people)**. Intern loop is different — see below. Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Real-time / fan-out: [../answers/system-design-chat.md](../answers/system-design-chat.md). Video: [../answers/system-design-video-streaming.md](../answers/system-design-video-streaming.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (15 Leadership Principles)

Do **not** recite Amazon’s list. Official [Leadership Principles](https://careers.twitch.com/en/leadershipprinciples/) are **fifteen** principles; knowing them can earn **bonus points**. Early-career prep also tells you to review them. Map **your** stories.

Named / clearly worded on the official page (Amazon-family language):

| Official principle | What they score |
| --- | --- |
| **Invent and Simplify** | New ideas from anywhere; accept being misunderstood |
| **Are Right, A Lot** | Judgment; seek views that **disconfirm** you |
| **Hire and Develop the Best** | Raise the bar; coach; mechanisms like Career Choice |
| **Insist on the Highest Standards** | Defects do not ship; problems stay fixed |
| **Think Big** | Bold direction; look around corners for creators / viewers |
| **Bias for Action** | Reversible decisions; calculated speed |
| **Frugality** | Accomplish more with less; no points for headcount |
| **Dive Deep** | Stay in the details; audit when metrics ≠ anecdotes |
| **Have Backbone; Disagree and Commit** | Challenge, then commit wholly |
| **Deliver Results** | Key inputs on time; never settle after a setback |

Official interviewing page: onsites have a **heavy behavioral** focus — concrete examples of using skill to close a gap. “Why Twitch?” that only says “I watch streams / Kappa” fails. Name a **live ingest, chat fan-out, VOD/clips, or creator-tooling** problem you have lived. Official SWE JDs (On Demand / Clips): **Twirp + Go** services, **TypeScript / React**, AWS, concurrency.

## Official process (full-time)

Official [Interviewing](https://careers.twitch.com/en/interviewing/) quest map. Google **G Suite** for calls — set up an account first.

| Stage | Official |
| --- | --- |
| Application | Automated receipt; **human** review. Cover letter optional. |
| Recruiter chat | **15–30 min** — almost every candidate, referred or not |
| Hiring manager | **30–60 min** — role, team, questions you cannot ask a recruiter |
| Skills assessment | **If the role needs it**, async over **1–2 weeks** (coding or writing). You hear during the HM chat — not a surprise. |
| Onsite | **4–5** employees, **45–60 min** each; technical **and** behavioral. Currently **remote**; may span days. |
| Decision | Team debrief; typical **2–8 weeks** end-to-end. Recruiter is the advocate. |

Official FAQ: apply to multiple roles only if you are **equally qualified**; spraying looks unfocused. Accommodations exist — tell the recruiter early. Reapply is normal.

## Official intern / early-career overlay

Official [Early Career](https://careers.twitch.com/en/early-career/): North America college juniors; summer only; **Kappastone** capstone. **AI is not permitted** on the intern CodeSignal.

| Stage | Official intern |
| --- | --- |
| Coding challenge | **60 min** live CodeSignal take-home; language of choice |
| Recruiter | **15–30 min** with the intern team |
| Onsite | **Two** 60-min loops: short behavioral + **40–50 min** technical. One hour is **data structures**, the other **coding**. Host-team interviewer; you may not join that team. |

Full-time SWE JDs still ask **DSA fundamentals**. Confirm whether **your** loop has the async assessment or a live coding hour.

## How this track differs

| vs Discord | vs FAANG / Amazon core |
| --- | --- |
| Official **HM-early** + optional **async** skills week | Same 15 LPs, but product is **live communities / creators**, not retail |
| Intern: official **no-AI CodeSignal** then two remote hours | Design is **ingest / chat / VOD / clips**, not “design Twitter” |
| Onsite **heavy behavioral** + 4–5 remote interviews | “I only grind Blind 75” misses LPs and creator systems |

## Coding and design flavor

Live / async problems: graphs, strings, concurrency-shaped APIs. Design: live ingest + transcode, chat fan-out to a raid, VOD/clips pipeline, presence at Super Bowl scale. Related: [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** live platform — a creator or latency call, not “I like games.”
2. LP: disagree and commit, or a defect you made stay fixed.
3. Design chat or clips when a raid 10×s a channel.
4. Intern: 60-min unaided CodeSignal; narrate afterward.
5. Questions: async vs live coding, Go vs TS, AI policy, SF / Seattle / NYC.

## Prep checklist

- [ ] Read [Interviewing](https://careers.twitch.com/en/interviewing/) + [Leadership Principles](https://careers.twitch.com/en/leadershipprinciples/) + [Early Career](https://careers.twitch.com/en/early-career/) if intern
- [ ] Recruiter: assessment window, onsite shape, language, AI, location
- [ ] STAR bank mapped to **a few** LPs; one live-systems design sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Your Quest to Twitch — Interviewing](https://careers.twitch.com/en/interviewing/) — accessed 2026-10-19
- [Twitch Leadership Principles](https://careers.twitch.com/en/leadershipprinciples/) — accessed 2026-10-19
- [Early Career — Twitch Careers](https://careers.twitch.com/en/early-career/) — accessed 2026-10-19
- [Careers @ Twitch](https://careers.twitch.com/en/) — accessed 2026-10-19
- [Software Engineer, On Demand Products — Twitch Careers](https://careers.twitch.com/en/career-posts/8066916002/) — accessed 2026-10-19
