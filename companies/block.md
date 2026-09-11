# Block engineering track (Square, Cash App, Afterpay, Bitkey)

Sits beside [coinbase.md](coinbase.md), [stripe.md](stripe.md), and [product-companies.md](product-companies.md): **multi-brand fintech** (sellers + consumer money + BNPL + bitcoin), not a generic FAANG slate. Official [Careers](https://block.xyz/careers): build tools for an economy **open to all** — Square (sellers), Cash App (send / spend / store), Afterpay, TIDAL, Bitkey, Proto. Official [AI Hiring Principles](https://block.xyz/careers/our-ai-hiring-principles): **designed by humans, powered by AI**; **humans** make the hire decision; you may use AI to **prepare** the way you would on the job, but **not** paste model output into a live exercise unless told. Recruiter confirms **which brand**, **CoderPad vs existing-repo hour**, **BrightHire consent**, and **AI rules**.

Typical timeline **3–5 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Pair / repo: [../general/pair-programming.md](../general/pair-programming.md). Money: [../answers/system-design-payment.md](../answers/system-design-payment.md). Offline / sync: [../general/low-level-design.md](../general/low-level-design.md).

## Official culture (careers + AI principles)

Do **not** recite a list. Map **your** stories. Official careers: **economic empowerment** / open financial system. Official AI principles: taste, creativity, discernment; assessments (if any) score **how you think alongside tools**, not copy-from-a-model. BrightHire is the **only** approved recording tool; you may **opt out**; personal recorders are not allowed.

“Why Block?” that only says “I like Cash App” fails if you are on a **Square** req. Name the **brand’s** customer (seller vs consumer vs self-custody) and a money-correctness or **offline** story.

## Official + reported process

Official AI-principles page: you meet teammates who score **technical skill, collaboration, communication, leadership**; some loops add extra managers for strategy. 2026 guides (TechPrep, techinterview.org) fill in SWE stages — treat as **reported**.

| Stage | What they score |
| --- | --- |
| Recruiter (~15–30 min, guides) | Brand preference, mission, level |
| Technical screen (~60 min, guides) | CoderPad; often a **stream / window** (spend threshold, fraud-ish) |
| Pair / existing-code hour (guides) | Add a feature to a Java/Go service; **match the house style** |
| System design (mid+) | Payments pipeline, **offline-first POS**, P2P transfer + fraud |
| Behavioral | Empathy, accessibility, user impact — not slogan culture-fit |
| Decision | Official: humans decide (AI may summarize scorecards) |

Guides: BUs hire **somewhat independently** — Square (merchant / POS), Cash App (consumer velocity), Afterpay (credit risk), Bitkey (hardware / crypto). Easy–medium DSA; **readable** code over micro-opts. Multi-part problems: finish part 1 before optimizing.

## How this track differs

| vs FAANG | vs Stripe / Coinbase |
| --- | --- |
| **Pair + existing repo** more than silent Blind 75 | Stripe: Bug Squash + integration; Coinbase: AI-repo + tenets |
| Design is **offline sync / seller POS** as often as “ledger” | Same money bar; Block is **multi-brand** — prep **your** unit |
| Official published **AI hiring** rules (prep OK, live paste not) | Confirm BrightHire + live-AI — careers are explicit |

## Coding and design flavor

Live problems look like **sliding windows, deques, maps**, dressed as transactions. Repo hour: micro-deposits, limiter, verification — follow existing modules. Design: Square Register **offline → reconnect → dedupe**; Cash App P2P with bounded latency; Bitkey recovery constraints. Related: [../answers/coding-meeting-rooms.md](../answers/coding-meeting-rooms.md) (windows), [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why this brand — Square vs Cash App?” — seller offline vs consumer P2P, not “fintech.”
2. Stream: flag a user who exceeds a spend cap in a rolling window.
3. Extend a small payments service; do not rewrite the package layout.
4. Design POS that keeps selling when the network drops, then syncs without double-charge.
5. A time you changed a design for **accessibility** or a left-out user.

## Prep checklist

- [ ] Read [Careers](https://block.xyz/careers) + [AI Hiring Principles](https://block.xyz/careers/our-ai-hiring-principles)
- [ ] Recruiter: **brand**, existing-repo language, BrightHire, live-AI
- [ ] One **window / stream** mock and one **pair-on-unfamiliar-code** mock
- [ ] One offline-POS or P2P design mock
- [ ] STAR bank: user impact, disagreement, failure — **your** work
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Block Careers](https://block.xyz/careers) — accessed 2026-09-11
- [Our AI Hiring Principles — Block](https://block.xyz/careers/our-ai-hiring-principles) — accessed 2026-09-11
- [Block's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/block-interview-process) — accessed 2026-09-11
- [Block Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/block/) — accessed 2026-09-11
- [Square Software Engineer Interview Guide 2026 — Dataford](https://dataford.io/interview-guides/square/software-engineer) — accessed 2026-09-11
