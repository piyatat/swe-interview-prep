# Coinbase engineering track

Sits beside [product-companies.md](product-companies.md) and [quant.md](quant.md): **crypto exchange + custody + Base L2**, high-trust money systems, not a generic FAANG slate. Official [Mission](https://www.coinbase.com/mission): **increase economic freedom**. Official culture doc: tenets used as the **interview lens**. Official 2026 eng blog: the loop was **rebuilt for AI-generated code** — score directing tools, critiquing output, and judgment. Recruiter is the source of truth for **OA vs live**, **AI working session**, and team (exchange, custody, Base, platform).

Typical timeline **3–5 weeks** (guides). Confirm **level** and remote + quarterly **surges** (job posts). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). AI-allowed hour: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Debug: [../general/debugging-rounds.md](../general/debugging-rounds.md). Money design: [../answers/system-design-payment.md](../answers/system-design-payment.md).

## Official culture (Mission + 2021 culture doc)

Do **not** recite the table. Map **your** stories. Crypto experience is **not** required (guides + older official eng post); mission curiosity **is**.

| Official tenet | Published one-liner |
| --- | --- |
| **Mission first** | Increase economic freedom — apolitical, intense (2020–21 posts) |
| **Act like an owner** | 100% responsibility; improve things that are “not your job” |
| **Continuous learning** | Humble; candor; setbacks as learning; stay crypto-forward |
| **Championship team** | Company-first; #OneCoinbase; what unites the mission |
| **Repeatable innovation** | Named on the official engineering-interview post as a scored tenet |

Job posts (2026): **remote-first, not remote-only**; quarterly in-person **surges**. Written, async communication is the default.

## Official + reported process

| Stage | What they score |
| --- | --- |
| **Recruiter / AI screen** (careers posts) | Background, mission fit. Some reqs **pilot an AI screening tool**; they say AI does **not** make the hire decision |
| OA / cognitive + culture (guides; intern FAQ) | Gate before live hours — ask which vendor |
| Live coding / **AI-repo hour** (2026 official blog) | Debug, review, rollback in a **real codebase** with tools **on** |
| System design (mid+) | Idempotent transfers, ledgers, matching, custody, compliance |
| Values / tenets hour | Owner / candor / mission — a real **no** even if tech is strong (guides) |

Official 2026 blog (search-indexed): by **March 2026**, AI signals sit in **every** engineering stage. Backend questions are **custom repos**, not adapted LeetCode. They evaluate how you **direct** a model, whether you catch it being wrong, and day-one judgment. Half-life warning: a fluency question can go stale when models jump.

## How this track differs

| vs FAANG | vs Shopify / Stripe |
| --- | --- |
| **Official AI-rebuild** of the whole loop | Shopify pair + Life Story; Stripe bug-bash / integration |
| Security, compliance, and **idempotent money** in every design | Exchange / wallet / L2 — not generic CRUD |
| Tenets hour is a hard gate | OA + culture assessments before the onsite (reported) |

## Coding and design flavor

If you get classic DSA, treat it like a **PR**: edges, tests, clear types. The 2026 signal is **repo work with AI**: find the bug, write the test that would have caught it, say when you would **not** ship. Design: double-entry ledger, withdrawal holds, matching-engine bursts, on-chain finality vs exchange books. Related: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why economic freedom — concretely — and why this team?”
2. Repo + AI: failing withdrawal path; hypothesize, test, patch, rollback plan.
3. “The model suggested this retry — why is it unsafe on a ledger?”
4. Design an internal transfer that is safe under double-click and a worker crash.
5. Tenets: you owned a miss that was “not your job”; you changed your mind in public.

## Prep checklist

- [ ] Read [Mission](https://www.coinbase.com/mission) + [2026 AI interview post](https://www.coinbase.com/blog/interviewing-engineers-in-the-ai-era-lessons-from-a-year-of-rebuilding)
- [ ] Recruiter: OA vendor, AI screen/repo hour, tenets hour, surge travel
- [ ] One **debug-in-repo** mock with AI **on** and a written rollback
- [ ] One payments / ledger design mock
- [ ] STAR bank mapped to **owner / learning / championship** — metrics, not slogans
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Interviewing Engineers in the AI Era — Coinbase (2026)](https://www.coinbase.com/blog/interviewing-engineers-in-the-ai-era-lessons-from-a-year-of-rebuilding) — accessed 2026-09-03
- [Coinbase Mission & Culture](https://www.coinbase.com/mission) — accessed 2026-09-03
- [Culture at Coinbase (2021)](https://www.coinbase.com/blog/culture-at-coinbase-2021) — accessed 2026-09-03
- [How Coinbase interviews for engineering roles](https://www.coinbase.com/blog/how-coinbase-interviews-for-engineering-roles) — accessed 2026-09-03
- [Coinbase internships FAQ](https://www.coinbase.com/careers/internships) — accessed 2026-09-03
- [Coinbase SWE interview guide 2026 — Dataford](https://dataford.io/interview-guides/coinbase/software-engineer) — accessed 2026-09-03
