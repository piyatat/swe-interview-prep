# LinkedIn engineering track

Sits beside [faang-big-tech.md](faang-big-tech.md) and [product-companies.md](product-companies.md): **Microsoft-owned** (2016) but a **separate hiring loop**. Official careers page: four stages — application, conversation, interview, decision. Recruiter is the source of truth for **centralized vs team-tied req**, **AI policy**, and whether you get a **technical communication** hour.

Typical timeline **~3–8 weeks** (guides). Confirm **level** and whether team matching happens **after** the bar — same idea as [../general/team-matching.md](../general/team-matching.md).

## Official process (How We Hire)

| Stage | Official note |
| --- | --- |
| 1. Application | Recruiting reviews basic + some preferred qualifications on the JD |
| 2. Conversation | Recruiter call; may add a video with the HM or another teammate on experience and technical depth |
| 3. Interview | Several teammates; each hour a different skill. Recruiter may flag a **case study or whiteboard** ahead of time. Interviewers take notes for the hiring team |
| 4. Decision | Hiring team assesses potential to succeed; **may take several weeks**. Apply again if not selected |

Official page is process-shaped, not a named SWE slate. Ask what your packet actually is.

## How this track differs

| vs FAANG | vs Stripe / Airbnb product loops |
| --- | --- |
| **Centralized** hire then **team match** (Google-like) | More social-graph / feed / search design than payments or bookings |
| Phone screen often has a **shadow interviewer** | Coding is still DSA; craftsmanship / tech-comm hour is the brand |
| Part of Microsoft, **not** the Microsoft loop | Values are member-first / One LinkedIn, not Airbnb Host / Stripe writing |

Also study [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md), [../general/hiring-manager.md](../general/hiring-manager.md), [../answers/system-design-news-feed.md](../answers/system-design-news-feed.md), [../answers/system-design-autocomplete.md](../answers/system-design-autocomplete.md).

## Reported SWE loop (guides; confirm)

interviewing.io (mid-level / senior baseline): recruiter (~30 min) → **60 min** phone screen → **second recruiter** (they historically lose people to FAANG) → **5–6 hour** onsite → team match. Onsite mix often: coding, optional **domain** coding (mobile / niche), **system design**, **technical communication** (project deep-dive), behavioral. Extra algo / OOD / design if scores are mixed. Packet stays useful for match for **up to a year** if no team closes.

Phone screen shape (same source): niche domain warm-up (~10 min) if relevant, **~15 min** small problem, **~30 min** medium. Two people on the call is common (primary + shadow).

| Reported round | Score |
| --- | --- |
| Coding | Working code; company question bank; arrays / trees / graphs / intervals |
| Design | Scale for a professional network: feeds, trending, request logs, APIs |
| Tech comm | One project end-to-end: your decisions, tradeoffs, what you would redo |
| Behavioral | Conversational; tie stories to published values without reciting them |

Guides report a **4-point** onsite scale where **3 is passing**; borderline → extra hour. Hiring committee sets hire + level after the panel.

## AI policy (do not assume)

interviewing.io: **AI use strictly prohibited** in LinkedIn interviews. 2026 prep sites (Hello Interview, Coditioning) describe a **possible** onsite variant: one **traditional** coding hour plus one **AI-enabled** CoderPad hour (assistant in a side panel; you copy snippets yourself). Treat that as a **packet-specific** format, not a company-wide rule.

If the AI hour is on your slate: own the **algorithm**, use the assistant for boilerplate / tests, **refuse output you cannot explain**, then spend the second half on **concurrency and production** follow-ups (cache + lock, races, scale). See [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why LinkedIn — not generic big tech?” — product or member-impact, not “professional network is important.”
2. Medium DSA: intervals, trees, graphs; narrate edges before you type.
3. Design: home feed, trending posts, or a search/typeahead for 700M+ members.
4. Tech comm: walk a production change you owned; they will keep asking “why that?”
5. If AI-enabled: implement LRU / intervals, then thread-safety and traffic.

## Prep checklist

- [ ] Read How We Hire; ask recruiter: centralized vs team, AI, tech-comm, match timing
- [ ] Two unaided mediums in a shared editor (shadow interviewer is normal)
- [ ] One feed / search design mock ([../general/system-design.md](../general/system-design.md))
- [ ] One 15-min project deep-dive with metrics
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How We Hire — LinkedIn Careers](https://careers.linkedin.com/Howwehire) — accessed 2026-08-31
- [LinkedIn interview process — interviewing.io](https://interviewing.io/linkedin-interview-questions) — accessed 2026-08-31
- [LinkedIn's AI-Enabled Coding Interview — Hello Interview](https://www.hellointerview.com/blog/linkedin-ai-enabled-coding) — accessed 2026-08-31
- [LinkedIn SWE Interview: AI-Enabled Coding Guide — Coditioning](https://www.coditioning.com/blog/1406/linkedin-swe-ai-enabled-coding) — accessed 2026-08-31
- [LinkedIn Software Engineer Interview Questions 2026 — PracHub](https://prachub.com/interview-guide/linkedin-software-engineer-interview-guide) — accessed 2026-08-31
