# Affirm engineering track

Sits beside [stripe.md](stripe.md) and [paypal.md](paypal.md): **transparent installment / BNPL lending**, not a generic PSP or wallet. Official [Careers](https://www.affirm.com/careers): **remote-first** (home-country), published compensation philosophy. Official five values are in the FY2026 [Form 10-K](https://investors.affirm.com/static-files/1cba8462-bfcd-40e9-9b7a-7674cb7162b8) and the [FY2025 Impact Report](https://investors.affirm.com/news-releases/news-release-details/affirms-fy2025-impact-report-progress-toward-more-honest). Recruiter confirms **HackerRank live vs take-home**, language, and **AI-in-pad** (2026 guides: treat live rounds as no-assistance unless told otherwise).

Typical timeline **3–5 weeks** (2026 guides). Practical coding: [../general/debugging-rounds.md](../general/debugging-rounds.md). Money correctness: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official values (do not invent extra pillars)

Five values in the 10-K (“permeate every part of Affirm”) and the Impact Report. Map **your** stories; do not recite them as five LPs.

| Official value | What they score |
| --- | --- |
| **People come first** | Consumer success first; no late fees / no profiting from mistakes (10-K) |
| **No fine print** | Transparent with customers **and** teammates; no hidden fees or tricks |
| **It’s on us** | Own the problem and the fix; no buck-passing |
| **Simpler is better** | Payments are historically complex; Affirm’s product is the simple path |
| **Push the envelope** | Innovate, build robust systems, take **smart** risks (10-K) |

Official mission language: **honest financial products that improve lives**. “Why Affirm?” that only says “fintech / BNPL is hot” fails. Name a **ledger, retry, or consumer-clarity** problem you have lived — and a time transparency cost you something.

## Official + reported process

Official careers describe **workplace**, not a public stage list. 2026 guides (TechPrep; OphyAI) — treat counts as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (guides: ~30) | Background, mission, remote / location, band |
| Technical screen (guides: 60–90, HackerRank) | Live with an engineer **or** take-home; live often moves faster |
| Hiring manager (guides: 45–60) | Two or three projects you can defend; decisions that were **yours** |
| Virtual onsite (guides: 4–5 rounds) | Two **practical** coding hours, financial-systems design, values |
| Offer | Written offer before comp theater: [../general/offer-negotiation.md](../general/offer-negotiation.md) |

Guides: coding is often **an existing Python/Flask-shaped repo** (add a feature, fix a bug, encode a business rule) — not a silent puzzle. Design is **installments, fraud, retries, reconciliation**. Some 2026 reports mention a short **written** tradeoff memo; confirm.

## How this track differs

| vs Stripe / PayPal / Block | vs FAANG |
| --- | --- |
| Affirm is the **lender / installment plan**, not only the API rail | Practical **codebase** hours over olympiad DSA |
| Values probe **honesty under cost** (no-fine-print stories) | Design is **ledger + ACH window**, not “design Instagram” |
| Remote-first is official careers copy | “I only grind LeetCode” misses HM depth + values |

## Coding and design flavor

Live work looks like: sliding-window duplicate charges, end-of-day balances from an event stream, a repayment state machine, or a bug in checkout math. Design: BNPL schedule + bank debit window, fraud scoring, payment pipeline with **idempotency** and unknown-result reconciliation (debit may have succeeded; do not retry blindly). Related: [../answers/system-design-payment.md](../answers/system-design-payment.md), [../answers/coding-subarray-sum-k.md](../answers/coding-subarray-sum-k.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **honest credit** — a time you chose clarity over a dark pattern or a hidden fee.
2. Live: extend a small service; tests stay green; name the money invariant.
3. Design: daily ACH window, retries, notifications — exactly-once **business** effect.
4. Values: “It’s on us” — you owned a miss end-to-end, including the customer sentence.
5. Questions for them: underwriting vs merchant-integration team, AI policy, remote hubs.

## Prep checklist

- [ ] Read [Careers](https://www.affirm.com/careers) + the five 10-K / Impact Report values
- [ ] Recruiter: live vs take-home, language, written memo, AI policy
- [ ] One practical-repo mock + one installment / ledger design
- [ ] STAR bank: people-first, no-fine-print, ownership — with a real cost
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Affirm](https://www.affirm.com/careers) — accessed 2026-09-24
- [Form 10-K — Affirm Holdings (filed 2026-08-27)](https://investors.affirm.com/static-files/1cba8462-bfcd-40e9-9b7a-7674cb7162b8) — accessed 2026-09-24
- [Affirm’s FY2025 Impact Report — Affirm Holdings](https://investors.affirm.com/news-releases/news-release-details/affirms-fy2025-impact-report-progress-toward-more-honest) — accessed 2026-09-24
- [Affirm's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/affirm-interview-process) — accessed 2026-09-24
- [Affirm Interview Process 2026 — OphyAI](https://ophyai.com/blog/company-guides/affirm-interview-guide) — accessed 2026-09-24
