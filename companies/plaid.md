# Plaid engineering track

Sits beside [stripe.md](stripe.md) and [robinhood.md](robinhood.md): **bank-connectivity / financial data APIs**, not a card network or brokerage. Official [About](https://plaid.com/company/): mission is to **unlock financial freedom for everyone** — developer-friendly infrastructure across **12,000+** institutions and **9,000+** fintechs. Official [Engineering](https://plaid.com/engineering/) names three operating notes. Recruiter confirms **OA vs live**, hub (SF / NYC / Seattle / London / Amsterdam / DC), and **AI-in-pad**.

Typical timeline **~2–3 weeks** (2026 guides). Practical coding: [../general/debugging-rounds.md](../general/debugging-rounds.md). Reliability: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (do not invent extra pillars)

Official [Engineering](https://plaid.com/engineering/) + [About](https://plaid.com/company/). Map **your** stories.

| Official note | What they score |
| --- | --- |
| **Unlock financial freedom** | Access / equity — not “I like fintech APIs” |
| **Technical craft** | Sturdy *and* careful; leave the repo better; delay a launch for a rare customer bug |
| **All-in or nothing** | Few bets, then see them through (product, refactor, or velocity tool) |
| **Bottoms up** | IC-driven roadmap; managers are people-first; growth mindset |

“Why Plaid?” that only says “banks + APIs” fails. Name a **Link, webhook, reconciliation, or third-party flakiness** problem you have lived — and who the *developer* customer is.

## Official + reported process

Official careers / engineering pages describe **mission and craft**, not a universal stage list. 2026 guides (techinterview.org; TechPrep) — treat counts as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (guides: 30–45) | Background, mission, level, hub |
| OA (guides: ~90, two problems) | Finance-themed practical coding, not a random graph puzzle |
| Technical phone (guides: 45–90, CoderPad) | Small problem that **gains requirements** — extend, don’t rewrite |
| Virtual onsite (guides) | 1–2 coding, reliability design, project deep-dive, behavioral |
| Senior extra (guides: E5+) | Domain: webhook idempotency, bank-said-yes / we-saw-nothing |

Guides: coding looks like merge-two-feeds, merchant categorization, interval overlap. Design is **what happens when one bank’s API 500s at 3am**.

## How this track differs

| vs Stripe / Robinhood / Affirm | vs FAANG |
| --- | --- |
| Plaid is the **connectivity layer**; Stripe is the PSP | Practical **messy data + extend-your-code** |
| Official craft / all-in / bottoms-up, not LPs | Design is **10k flaky upstreams**, not “design Instagram” |
| Developer-API product sense is scored | Silent LeetCode without talking about *n* (one user’s month) is weak |

## Coding and design flavor

Live work looks like: reconcile two aggregator feeds (same purchase, different timestamps / merchant strings), categorize a stream, merge statement windows. Design: ingest from thousands of FIs without hammering one; circuit breaker + jittered backoff + idempotent writes + DLQ. Related: [../answers/coding-merge-intervals.md](../answers/coding-merge-intervals.md), [../answers/system-design-payment.md](../answers/system-design-payment.md), [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** connectivity layer — a time you owned a shifting integration.
2. Live: start small; interviewer adds a constraint — keep the first design extensible.
3. Design: keep balances fresh without a global rate-limit bottleneck.
4. Behavioral: dual-write vs hard cutover, with a number and a cost you would still pay.
5. Questions for them: Link vs transactions vs identity team, AI policy, private-comp liquidity.

## Prep checklist

- [ ] Read [About](https://plaid.com/company/) + [Engineering](https://plaid.com/engineering/) + a public API surface
- [ ] Recruiter: OA vs live, language, hub, AI policy
- [ ] One “requirements keep arriving” mock + one third-party-failure design
- [ ] STAR: ownership + ambiguity + developer-customer impact
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [About us — Plaid](https://plaid.com/company/) — accessed 2026-09-25
- [Plaid Engineering](https://plaid.com/engineering/) — accessed 2026-09-25
- [Careers — Plaid](https://plaid.com/careers/) — accessed 2026-09-25
- [How the Plaid software engineer interview really runs — techinterview.org](https://www.techinterview.org/post/3233476383/plaid-software-engineer-interview/) — accessed 2026-09-25
- [Plaid's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/plaid-interview-process) — accessed 2026-09-25
