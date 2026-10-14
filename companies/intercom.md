# Intercom / Fin engineering track

Sits beside [zendesk.md](zendesk.md), [hubspot.md](hubspot.md), and [glean.md](glean.md): **messenger + AI customer agent (Fin)**, not a ticket ITSM suite and not inbound CRM. Official [Careers](https://www.intercom.com/careers) now brands **Fin** (“Customer Agent company”; founded as Intercom). Recruiter confirms **Product Engineer vs platform vs AI**, Dublin / London / SF / Chicago / Berlin / Sydney, and whether **Minicom** is still your coding hour.

Typical timeline **~3–5 weeks** (guides). Practical build: [../general/low-level-design.md](../general/low-level-design.md). Pair: [../general/pair-programming.md](../general/pair-programming.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official careers lists **seven** current values. Map **your** stories. Do not recycle the 2015 engineering-principles list as if it replaced these.

| Official value | What they score |
| --- | --- |
| **Success First** | Shareholder value via great work + culture — not vanity output |
| **Incredibly High Standards** | Bar you would apply to your own PR |
| **Open Mindedness** | You changed your mind on evidence |
| **Resilience** | Recovered after a miss without drama |
| **Impatience** | Bias to ship the cupcake, not the wedding cake |
| **Positive and Optimistic** | Constructive under load |
| **Customer Obsessed** | End-user / teammate outcome, not ticket count |

Official [culture-contribution](https://www.intercom.com/blog/how-we-hire-engineers-culture-contribution) still publishes **five engineering principles** (shape the solution; technically conservative; small steps; keep it simple; positivity / pride / love) and an **SBI** behavioral format (Situation → Behavior → Impact). Use both: values for “why Fin,” principles for how you build.

“Why Intercom / Fin?” that only says “chat widget / I like AI agents” fails. Name a **messenger, inbox, or agent-handoff** problem you have lived.

## Official + reported process

Official [Minicom](https://www.intercom.com/blog/building-minicom-engineering-interviews): build a **smaller Messenger**, pick features after the core works, demo tradeoffs, then **pair**. Public [minicom-public](https://github.com/intercom/minicom-public) is a setup skeleton (foo / bar sites + server) — not the live prompt. 2026 InterviewQuery / candidate reports — treat extra splits as **reported**:

| Stage | Official / reported |
| --- | --- |
| Recruiter / HM | Role, office, Fin vs classic Intercom product; confirm Minicom |
| Coding screen | Guides: practical / OOP more than puzzle DSA |
| Minicom | Official live build + pair; guides: ~45 min solo + ~45 min pair; stack choice (Rails / Spring / Node / Django scaffolds) |
| Design / modeling | Guides: evolving **data model** (many follow-ups), not “design Twitter” |
| Culture contribution | Official 45-min SBI; 10–15 min per example; they will press “we” |

Confirm AI-in-pad. Reports: tools may be allowed; over-reliance is scored — **ask**, do not assume.

## How this track differs

| vs Zendesk / HubSpot | vs FAANG web |
| --- | --- |
| Official **Minicom** + **SBI** culture hour | Design is **inbox / messenger / agent**, not a feed |
| Fin AI-agent story **plus** shipping a cupcake | “I only grind LeetCode” misses the pair-to-demo |
| Product Engineer title is common | Silent “I will polish forever” fails Impatience |

## Coding and design flavor

Official products: Messenger, Inbox, Series, Fin agent. Live work: real-time events, identity, permissions, handoff when the agent is wrong. Related: [../answers/system-design-chat.md](../answers/system-design-chat.md), [../answers/system-design-notification.md](../answers/system-design-notification.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** customer-agent company — portable “support SaaS” is weak.
2. Minicom-style: smallest messenger that posts + displays; then you choose the next feature.
3. Design: conversation + agent suggestion + human takeover — consistency and audit.
4. Value: Impatience — you shipped a thin slice and measured.
5. Questions for them: Fin vs Intercom team, Minicom stack, AI-in-pad, office days.

## Prep checklist

- [ ] Read [Careers](https://www.intercom.com/careers) (seven values + Fin story) + [Minicom](https://www.intercom.com/blog/building-minicom-engineering-interviews) + [culture contribution](https://www.intercom.com/blog/how-we-hire-engineers-culture-contribution)
- [ ] Recruiter: Minicom setup, languages, office, AI policy
- [ ] One timed **unfamiliar-repo** feature + demo of what you would build next
- [ ] SBI vs the seven values — **your** customer / standards story (not overlapping)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers at Fin / Intercom](https://www.intercom.com/careers) — accessed 2026-10-14
- [Building “Minicom” — Intercom Engineering](https://www.intercom.com/blog/building-minicom-engineering-interviews) — accessed 2026-10-14
- [How we hire engineers: Culture contribution — Intercom](https://www.intercom.com/blog/how-we-hire-engineers-culture-contribution) — accessed 2026-10-14
- [intercom/minicom-public — GitHub](https://github.com/intercom/minicom-public) — accessed 2026-10-14
- [Intercom Interview Questions — InterviewQuery](https://www.interviewquery.com/interview-guides/intercom) — accessed 2026-10-14
