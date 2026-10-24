# Slack engineering track

Sits beside [salesforce.md](salesforce.md) and [discord.md](discord.md): **workplace messaging / real-time collaboration** (channels, search, presence, Slackbot), not Salesforce’s Trust / V2MOM CRM loop and not Discord’s values + laptop coding. Official [careers](https://slack.com/careers) + [engineering walkthrough](https://slack.engineering/a-walkthrough-guide-to-finding-an-engineering-job-at-slack/): mission is **make work life simpler, more pleasant and more productive**. Recruiter confirms **Slack product vs Salesforce Cloud**, take-home vs PR review, and whether the loop is still **no-whiteboard-coding**.

Typical timeline **3–5 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Review: [../general/code-review-rounds.md](../general/code-review-rounds.md). Take-homes: [../general/take-homes.md](../general/take-homes.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (six values)

Do **not** invent Amazon-style LPs. Official [careers](https://slack.com/careers) and the [walkthrough](https://slack.engineering/a-walkthrough-guide-to-finding-an-engineering-job-at-slack/) publish **six values**. Map **your** stories.

| Official value | Careers / walkthrough signal |
| --- | --- |
| **Empathy** | Level the whole team; customer need, not just the API |
| **Courtesy** | Tone in reviews; respect under time pressure |
| **Craftsmanship** | Clean, readable, performant, maintainable |
| **Solidarity** | Personal responsibility; get stuff done together |
| **Playfulness** | Curiosity about how things work |
| **Thriving** | Remote-friendly / flexible; you interview them too |

“Why Slack?” that only says “I use Slack every day / Salesforce bought it” fails. Name a **fan-out, search, or presence** problem you have lived. Official walkthrough: they hire for **craft + collaboration**, not college pedigree (apply on the careers page; do **not** spray multiple reqs).

## Official + published process

Official walkthrough (web engineering; **ask** if your team still uses this shape). Backend [hiring refactor](https://slack.engineering/refactoring-backend-engineering-hiring-at-slack/) shortened the unbounded take-home into a **~2 hour code-review PR** and moved implementation onto a **laptop pair** (own machine, reference material allowed). 2026 guides still report PR review as the signature gate.

| Stage | Official / published |
| --- | --- |
| Resume screen | Fit for **this** req; passion over school |
| Recruiter (~30 min) | What you want; why Slack |
| Technical exercise | Historically **one week**; later **anonymized PR review** graded on a fixed rubric (30+ criteria). **Most important** technical signal — onsite discusses your choices |
| Hiring manager (~60 min) | Background, current challenges, your questions |
| Onsite / virtual loop | Official: **~4 hours**, 4–5 engineers × 45 min + HM 15 min. Architecture + values. **No whiteboard algorithms** (whiteboard for sketches only). 2026 reports: 3–5 Zoom / CoderPad hours — confirm |

## How this track differs

| vs Salesforce / Discord | vs FAANG |
| --- | --- |
| Official **six Slack values**, not Trust / V2MOM | Practical **PR review + design**, not a six-hour Superday of hards |
| Design is **realtime message server / search / presence** | “I only grind Blind 75 silently” misses courtesy in the review |
| Salesforce ownership ≠ Salesforce loop — **ask** | Whiteboard binary-search theater is explicitly **not** the job |

## Coding and design flavor

Official stack color (walkthrough, dated — confirm): PHP + MySQL heritage, **Java WebSocket** message server, Go / C++ services, clients on many platforms. Design: channel fan-out, unread, search, edge cache, job scheduler. Related: [../answers/system-design-chat.md](../answers/system-design-chat.md), [../answers/system-design-notification.md](../answers/system-design-notification.md), [../answers/system-design-search.md](../answers/system-design-search.md).

Narrate. Official backend refactor: they score **security, performance, tests, docs, empathy** in the review — not clever one-liners.

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Slack surface (search, Slackbot, identity) — a workplace-friction story, not “I like chat.”
2. PR review: bugs + a courteous “what I would change” without dunking on the author.
3. Design: message fan-out when one workspace has 50k members in `#general`.
4. Craftsmanship: a time you slowed a ship for readability or a missing test.
5. Solidarity: you disagreed, then committed.

## Prep checklist

- [ ] Read [walkthrough](https://slack.engineering/a-walkthrough-guide-to-finding-an-engineering-job-at-slack/) + [backend hiring refactor](https://slack.engineering/refactoring-backend-engineering-hiring-at-slack/) + [careers](https://slack.com/careers)
- [ ] Recruiter: Slack vs Salesforce req, PR vs feature take-home, AI, virtual vs onsite
- [ ] One timed **code-review** mock ([../general/code-review-rounds.md](../general/code-review-rounds.md))
- [ ] One chat / notification design mock
- [ ] STAR bank mapped to the **six** values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [A Walkthrough Guide to Finding an Engineering Job at Slack](https://slack.engineering/a-walkthrough-guide-to-finding-an-engineering-job-at-slack/) — accessed 2026-10-24
- [Refactoring Backend Engineering Hiring at Slack](https://slack.engineering/refactoring-backend-engineering-hiring-at-slack/) — accessed 2026-10-24
- [Careers — Slack](https://slack.com/careers) — accessed 2026-10-24
- [Slack's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/slack-interview-process) — accessed 2026-10-24
