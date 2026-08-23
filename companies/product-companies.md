# Product-company track (Stripe, Uber, late-stage)

Sits between [faang-big-tech.md](faang-big-tech.md) and [startup.md](startup.md): **structured loops and high bar**, but more **domain-shaped** work than generic DSA. Typical timeline **2–6 weeks**. Confirm the exact mix with the recruiter — team and level change the onsite.

Examples: Stripe, Uber, late-stage product (Airbnb, DoorDash, Rippling-scale). Netflix-style loops are often more conversational / design-heavy; still prep a coding baseline.

## How this track differs

| vs FAANG | vs Seed–Series C |
| --- | --- |
| Coding may be practical (parse, integrate, debug) not only Blind 75 | Still timed, rubric-scored, sometimes OA + committee |
| Design prompts use **their** domain (money, maps, marketplace) | Scale and reliability expected; “monolith for 2K users” is not enough |
| Bar-raiser / HC still common | Faster than classic FAANG; more process than a founder chat |

Also study [../general/debugging-rounds.md](../general/debugging-rounds.md) — Stripe-style bug bash and Google/Meta comprehension rounds overlap this skill.

## Stripe (practical + payments taste)

**Shape (2026 guides):** recruiter → 60 min practical phone screen → virtual onsite (integration and/or bug-squash, payments-flavored design, bar raiser, values).

| Round | What they score |
| --- | --- |
| Practical coding | Read docs/repo; ship working behavior; edge cases (money, retries) |
| Integration | HTTP/JSON, pick the right API, handle failures, talk while wiring |
| Bug bash | Find subtle bugs (off-by-one, races, bad error handling) in a live repo |
| System design | Idempotency, webhooks, ledger-ish consistency, retry semantics |
| Bar raiser | Judgment, writing, ambiguity — often the veto round |

**Prep:** wordy parsing / validation problems; extend a small codebase; API design (idempotency keys, versioning). Language usually your choice; Ruby/Sorbet helps later, not as a screen filter. Writing culture is real — short memos and clear tradeoffs.

See [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md) for a related reliability outline.

## Uber (predictable + graphs + marketplace)

**Shape (2026 guides):** recruiter → CodeSignal OA (often 4 problems, ~70–90 min) → live coding screen → virtual onsite (2 coding, 1–2 design at mid+, behavioral / bar-raiser-like).

| Emphasis | Prep implication |
| --- | --- |
| OA score | Practice **in CodeSignal**; three clean solves beat a heroic unfinished fourth |
| Graphs | BFS/DFS, Dijkstra-flavored routing; maps/dispatch framing |
| Design | Geospatial indexes, matching, surge, real-time location |
| Behavioral | Ownership stories; interviewer may have built the system they ask about |

Coding bar is “correct + clear” more than “only the optimal unpublished trick.” Narrate before typing.

## Shared prep checklist

- [ ] Recruiter: AI policy, OA vs live, integration/bug-bash or classic DSA
- [ ] One **debug-in-repo** mock and one **API-integration** mock
- [ ] Domain design: payments **or** marketplace/geo (match the company)
- [ ] 8–12 STAR stories (not a full Amazon LP bank unless they use LPs)
- [ ] Read their eng blog + one public API (Stripe docs, Uber engineering)

## Sample questions

1. Parse a billing CSV; compute totals; define invalid-row policy.
2. Integrate a mock payments API; retries + idempotency keys.
3. Design webhook delivery with at-least-once and consumer dedupe.
4. Design rider–driver matching in a city grid (consistency vs freshness).
5. “Find the bug in this checkout service” — hypothesis before edits.

## Sources

- [Stripe Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/stripe/) — accessed 2026-08-23
- [Stripe technical interview process 2026 — TechScreen](https://techscreen.app/articles/stripe-technical-interview-process-2026) — accessed 2026-08-23
- [How Uber interviews SWEs in 2026 — techinterview.org](https://www.techinterview.org/post/3233476840/uber-interview-guide/) — accessed 2026-08-23
- [Uber interview process (2026) — TechPrep](https://www.techprep.app/blog/uber-interview-process) — accessed 2026-08-23
- [Stripe SWE interview experience — Exponent](https://www.tryexponent.com/experiences/stripe-software-engineer-interview-7b110b) — accessed 2026-08-23
