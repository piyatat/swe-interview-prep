# Chime engineering track

Sits beside [block.md](block.md) and [robinhood.md](robinhood.md): **member-first neobank on partner banks**, not a card network or a brokerage. Official [Careers](https://careers.chime.com/en/): mission is to help everyday Americans **Unlock Financial Progress**; Chime is a fintech, not a bank — deposits sit at **The Bancorp Bank, N.A.** and **Stride Bank, N.A.** Official [About](https://www.chime.com/about-us/): profit *with* members (interchange), not overdraft / monthly fees. Recruiter confirms **ledger / cards / risk / mobile**, language (Go / Python / TS reports), hub (SF / Chicago / NYC / Vancouver), and **AI-in-pad**.

Typical timeline **2–6 weeks** (2026 guides; some pipelines wrap in ~2 weeks). Payments: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Do **not** collapse the list to “move fast / fintech hustle.” Use the official five on [About Us](https://www.chime.com/about-us/).

| Official value | What they score |
| --- | --- |
| **Be member-obsessed** | Trust earned per product decision; user impact in the story |
| **Be bold** | Outsized bet with a named risk, not slogan ambition |
| **Win together** | Chime-first; raise the bar as a team |
| **Respect the rules** | Members, regulators, bank partners, public — all in one sentence |
| **Be an owner** | Treat it like equity; out-execute without a hero narrative |

Official careers: **four days in office, Friday WFH**. “Why Chime?” that only says “no fees / IPO / AI banking” fails. Name a **ledger, SpotMe-style limit, reconciliation-with-a-partner-bank, or false-decline** problem you have lived.

## Official + reported process

Official careers / About pages do **not** publish a round-by-round SWE loop. 2026 guides (TechPrep, Nora AI, Dataford) — treat stage *counts* as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (guides: ~30) | Why consumer finance, band, hub, AI-in-pad |
| Tech screen (guides: 45–60, live pad) | Easy–medium applied coding; strings / hashes / graphs more than olympiad Hards |
| Take-home (guides: senior/staff, 4–6 h) | Transaction aggregator / notification router flavor |
| Virtual onsite (guides: 4–5 × 45–60) | Coding, applied backend, **money-correct** design, product/craft, HM |
| Decision | Guides: HM / product hours can veto a strong DSA day |

Guides: design almost always includes **idempotency and partner-bank reconciliation**. Skipping “we are not the bank of record” is a common fail.

## How this track differs

| vs Robinhood / Block | vs FAANG |
| --- | --- |
| Official **five values** + partner-bank ledger | Design is **auth → ledger → partner bank**, not “design Twitter” |
| Reported **product/craft** hour on member impact | Coding is **applied** (parse, state machine, exactly-once) |
| 4-day office is published, not a rumor | “I only grind LeetCode” misses compliance + reconciliation |

## Coding and design flavor

DSA: hash maps, windows, graphs — often dressed as transactions / limits / retries. Integer **cents**. LLD: card-auth state machine, idempotent POST. Design: 50k TPS transfer; fraud under a latency budget; keep Chime’s books aligned with Bancorp / Stride when a webhook is late. Related: [../answers/coding-subarray-sum-k.md](../answers/coding-subarray-sum-k.md), [../answers/system-design-payment.md](../answers/system-design-payment.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** member-first neobank — a time you chose the member over a dark pattern.
2. Live: rolling spend limit or retry-safe transfer; no floats for money.
3. Design: debit that is correct when the partner bank times out.
4. Product/craft: one concrete friction in a consumer banking app you would change.
5. Questions for them: org (ledger vs risk vs mobile), take-home vs skip, AI policy.

## Prep checklist

- [ ] Read [About Us](https://www.chime.com/about-us/) values (all five names) + [Careers](https://careers.chime.com/en/)
- [ ] Recruiter: hub / 4-day office, language, AI-in-pad, take-home
- [ ] One timed medium + one partner-bank reconciliation design
- [ ] Four STAR stories (member-obsessed, respect the rules, owner, win together)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Chime Careers](https://careers.chime.com/en/) — accessed 2026-09-30
- [About Us — Chime](https://www.chime.com/about-us/) — accessed 2026-09-30
- [Chime's Interview Process (2026) — TechPrep](https://www.techprep.app/companies/chime) — accessed 2026-09-30
- [Chime Software Developer Interview (2026) — Nora AI](https://interview.norahq.com/interview-guides/chime-software-developer-interview-guide-2026) — accessed 2026-09-30
- [Chime Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/chime/software-engineer) — accessed 2026-09-30
