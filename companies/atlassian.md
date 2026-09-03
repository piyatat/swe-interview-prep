# Atlassian engineering track

Sits beside [product-companies.md](product-companies.md): **multi-tenant collaboration SaaS** (Jira, Confluence, Bitbucket, Trello), not a generic FAANG slate. Official [Engineering interview guide](https://www.atlassian.com/company/careers/resources/interviewing/engineering): language-agnostic loop — **how you think**, not one stack. Official [Careers](https://www.atlassian.com/company/careers): **Team Anywhere** (distributed by default). Recruiter is the source of truth for **P-level**, **frontend vs backend vs SRE**, and AI policy.

Typical timeline **3–6 weeks** (guides + official PDFs). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). LLD / code design: [../general/low-level-design.md](../general/low-level-design.md). Values hour: [../general/behavioral.md](../general/behavioral.md). Team match: [../general/team-matching.md](../general/team-matching.md).

## Official culture (Values)

Do **not** recite the table. Map **your** stories to the behaviors. Official [Core values](https://www.atlassian.com/company/values): values ≠ office culture — they stay fixed.

| Official value | Careers / values one-liner |
| --- | --- |
| **Open company, no bullshit** | Open by default; brains + timing + care when you speak |
| **Build with heart and balance** | “Measure twice, cut once” — urgency **and** care, then ship |
| **Don’t #@!% the customer** | Collective customer view first |
| **Play, as a team** | Team over ego; serious work without self-seriousness |
| **Be the change you seek** | Shared improvement; **you** start the action |

Team Anywhere (Careers): choose office / home / mix in a country they operate, with timezone overlap. Async-first stories beat “I only work well in the room.”

## Official process (Engineering guide + P30–P50 PDF)

| Official stage | What they score |
| --- | --- |
| **Coding — data structures** (60 min, PDF) | Problem-solving; **your** language; tradeoffs over trivia |
| **Coding — code design** (60 min, PDF) | Extend / refactor a model; tests; edges |
| **System design** (60 min) | Practical Atlassian-shaped scale; questions, cost, partners — **laddered** follow-ups |
| **Manager** (guide) | Collaboration style, past project + **business why**, growth |
| **Values** (45 min) | Alignment with the five values — often **not** your future team (Sales / HR / Support OK) |
| **Hiring committee** then **team match** | HC is independent of interviewers; then HM chats — **you** pick among presented teams (PDF: ~24h) |

Official: missing a line of code is not a deal-breaker; learning agility when constraints change **is**.

## How this track differs

| vs FAANG | vs Shopify / Coinbase |
| --- | --- |
| **Values + HC + team match** like Google-shaped process | Shopify Life Story; Coinbase AI-repo loop |
| Code design hour is **OOP / extend**, not only Blind 75 | Multi-tenant isolation, permissions, enterprise compliance |
| Team Anywhere is the default work story | Design is Jira/Confluence-flavored, not flash-sale checkout |

## Coding and design flavor

DSA is standard mediums. Code design: class hierarchy, permissions, plugins. Design: tenant isolation, Jira-scale permissions, Confluence collab ([../answers/system-design-collab-editor.md](../answers/system-design-collab-editor.md)), cross-product notifications ([../answers/system-design-notification.md](../answers/system-design-notification.md)). Prefer **practical** over microservices-everywhere.

## Sample prompts (shapes, not leaked puzzles)

1. “A customer’s Jira is slow after a marketplace app — how do you isolate blast radius?”
2. Code design: model issues, projects, and a late “custom fields per tenant” requirement.
3. Design permissions for enterprise Jira (groups, project roles, guest access).
4. Values: you shared bad news early; you stopped a ship that would have hurt customers.
5. Manager: a project’s business justification, not only the tech.

## Prep checklist

- [ ] Read [Engineering interview guide](https://www.atlassian.com/company/careers/resources/interviewing/engineering) + [Values](https://www.atlassian.com/company/values)
- [ ] Recruiter: P-level, code-design vs DSA mix, AI policy, team-match timing
- [ ] One **code-design** mock (extend + tests) and one **DSA** timed medium
- [ ] One multi-tenant / permissions design mock ([../general/system-design.md](../general/system-design.md))
- [ ] STAR bank mapped to the **five values** — not slogans
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Atlassian Engineering Interview Guide](https://www.atlassian.com/company/careers/resources/interviewing/engineering) — accessed 2026-09-03
- [Atlassian core values](https://www.atlassian.com/company/values) — accessed 2026-09-03
- [Atlassian Careers (Team Anywhere)](https://www.atlassian.com/company/careers) — accessed 2026-09-03
- [P30–P50 Backend Interview Guide (PDF)](https://wac-cdn.atlassian.com/dam/jcr:cf9c7fc1-ab28-47d6-bb56-9c01fb09b871/P30-P50-Backend-Interview-Guide.pdf) — accessed 2026-09-03
- [Atlassian Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/atlassian/) — accessed 2026-09-03
