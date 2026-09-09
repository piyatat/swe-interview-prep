# Discord engineering track

Sits beside [snap.md](snap.md) and [reddit.md](reddit.md): **real-time chat, voice, and community**, not a generic FAANG slate. Official [Careers](https://discord.com/careers): flexible work (home, SF HQ, or mix). Official [How to prepare for your Discord interview](https://discord.com/blog/how-to-prepare-for-your-discord-interview) is the process source of truth. Recruiter confirms **level**, **your-laptop vs CoderPad**, **AI / internet**, and whether you get **architecture / troubleshooting / project retrospective**.

Typical timeline **3–4 weeks** (guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Chat / presence: [../answers/system-design-chat.md](../answers/system-design-chat.md). Incident hour: [../general/debugging-rounds.md](../general/debugging-rounds.md).

## Official culture (careers + seven principles)

Do **not** recite a list. Map **your** stories.

Official 2024 [Seven Principles](https://discord.com/blog/the-seven-principles-of-working-at-discord) (the 2020 interview post still points at an older “four values” essay — use the **current** principles):

| Official principle | Signal they score |
| --- | --- |
| **Cultivate Belonging** | Trust, assume good intent, seek other views first |
| **Deliver for Customers** | First-principles customer need, not competitor chase |
| **Surprise & Delight** | Care about the unglamorous details |
| **Debate, Decide, Commit** | Informed debate, then commit even if you disagreed |
| **Progress Over Perfection** | 80/20, ship, compound |
| **Embrace the Brutal Facts** | Inspect reality; cut losses; learn |
| **Strive for Excellence** | Raise the bar for yourself and the team |

Official interview post: Discord is **mission-driven** (belonging). Many employees **are not gamers** — that is the top misconception. “Why Discord?” that only says “I play games” fails. Name a real **fan-out, presence, voice, or trust-and-safety** problem you have lived.

## Official + reported process

Official interview post (Engineering-focused, still the published walkthrough):

| Stage | Official note |
| --- | --- |
| Resume / recruiter | Fit, work auth, **comp needs early** (they would rather not run a 5–6h day if the band cannot work) |
| Hiring manager | Role fit; they will try another team if this one is wrong |
| Skills test (~60 min) | Live coding with an engineer |
| Full-day panel (~5–6h + lunch) | **Values**, **Attitude** (cross-functional partners), 1–2 coding, architecture (mid+), optional specialty |
| Debrief | Same-day panel; result in a **few business days** |

Official coding: **your laptop and IDE**; Google, Stack Overflow, and API docs are **expected**. Interviewer is a collaborator, not a silent judge. Official architecture: requirements + tradeoffs + simplicity at 2× / 10× — **not** domain trivia (no WebRTC recitation). Official **Troubleshooting** (infra): page + diagram; they score **process**, not “got root cause.” Official **Project Retrospective** (senior / TL): one shipped project, success criteria, what you changed next.

2026 guides still describe recruiter → coding screen → virtual onsite of **4–5** hours. Some report a **practical / mock-incident** hour that matches the official troubleshooting specialty. Confirm.

## How this track differs

| vs FAANG | vs Snap / Reddit |
| --- | --- |
| Official **Attitude** hour with CX / Design / Trust & Safety | Snap: Kind/Smart/Creative + S.A.I.L.; Reddit: community + ranking / mod |
| Practical, open-resource coding on **your** machine | Design is **gateway / presence / fan-out**, not “design Twitter” |
| Values + belonging are scored as hard as DSA | Confirm AI — official post predates the 2026 tool split |

## Coding and design flavor

Live problems are **practical** (compile, fulfill spec, runtime, staged refactors, testable seams) more than Blind-75 theater. Design: message fan-out, WebSocket gateway, presence, channel history, shard-by-guild. Related: [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why Discord — and you do not have to be a gamer?” — belonging / real-time community, not slogans.
2. 60-min laptop: feature with a late requirement; talk while you use docs.
3. Design presence or channel fan-out for a 1M-member server coming online.
4. Values: debate → decide → commit, or a time you cut a sunk-cost project.
5. Infra: you get paged; ask for graphs; narrate the next check.

## Prep checklist

- [ ] Read [Careers](https://discord.com/careers), [interview post](https://discord.com/blog/how-to-prepare-for-your-discord-interview), [seven principles](https://discord.com/blog/the-seven-principles-of-working-at-discord)
- [ ] Recruiter: **level**, laptop rules, architecture vs troubleshooting vs retro
- [ ] One **60-min open-resource** build with a requirement change
- [ ] One chat / presence / gateway design mock
- [ ] STAR bank mapped to the **seven principles** + one cross-functional story
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How to prepare for your Discord interview](https://discord.com/blog/how-to-prepare-for-your-discord-interview) — accessed 2026-09-09
- [The Seven Principles of Working at Discord](https://discord.com/blog/the-seven-principles-of-working-at-discord) — accessed 2026-09-09
- [Jobs and Career Opportunities at Discord](https://discord.com/careers) — accessed 2026-09-09
- [Get a Job at Discord: Interview Process — Exponent](https://www.tryexponent.com/blog/discord-interview-process) — accessed 2026-09-09
- [Discord Front End Interview Guide — GreatFrontEnd](https://www.greatfrontend.com/interviews/company/discord/questions-guides) — accessed 2026-09-09
