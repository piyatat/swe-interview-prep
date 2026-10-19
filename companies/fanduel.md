# FanDuel engineering track

Sits beside [robinhood.md](robinhood.md) and [toast.md](toast.md): **US sportsbook / iGaming (Flutter)**, not a brokerage and not restaurant POS. Official [How we hire](https://www.fanduel.careers/future-teammates/how-we-hire/): process is **tailored by role and location**; they move fast. Recruiter confirms **sportsbook vs casino vs platform**, **NYC / Atlanta / Glasgow / …**, **Java vs frontend**, and AI policy.

Typical official path: **apply → recruiter screen (role, team, salary, benefits) → virtual first interview → second (panel / technical / behavioral) → senior-leader final → possible references → DocuSign offer**. Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Payments / ledger: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (ten principles)

Do **not** invent Amazon-style LPs. Official [FanDuel Life](https://www.fanduel.careers/fanduel-life/) principles are the playbook. How-we-hire also quotes **We are One Team**. Map **your** stories.

| Official principle | What they score |
| --- | --- |
| **Everything Begins With The Customer** | Real money on the line; trusted play |
| **We Are One Team** | Act for the company, not a local silo |
| **Assume Positive Intent** | Calm, respectful disagreement |
| **Anything is possible** | Benchmark the world, not only sports betting |
| **Simpler is always better** | Bite-size the impossible |
| **Win With Integrity** | Hungry to win; integrity is non-negotiable |
| **We Say Thank You** | Appreciate intensity in teammates |
| **Own the Outcome** | Vocally self-critical; sustainable journey |
| **Stay Humble Stay Hungry** | Learning never stops |
| **Challenge Then Commit** | Voice concerns; then deliver the decision |

Official careers: Engineering / IT / Cyber / Data / Cloud / AI is the “backbone” in a **highly regulated** market — fast, secure, rock-solid. Official Life page: **Responsible Gaming** is core, not a slogan. “Why FanDuel?” that only says “I like sports / DFS” fails. Name a **odds feed, wallet, geo-compliance, or peak-slate** problem you have lived.

Official How we hire: **STAR**; 60-second pitch; dress professionally even on video; thank-you to the recruiter within **24 hours**. Casual workplace ≠ casual interview.

## Official process (company-wide)

Official [How we hire](https://www.fanduel.careers/future-teammates/how-we-hire/). SWE flavor is **inside** the second-round “Technical / Case / Skills” bucket — ask.

| Stage | Official |
| --- | --- |
| Application | Jobs on fanduel.careers / LinkedIn / Indeed; apply ASAP |
| Resume review | ATS + recruiting |
| Initial screening | Phone / virtual: role, team, **salary and benefits**, interest |
| First interview (virtual) | Stakeholders; experience. Feedback may wait (multiple candidates). |
| Second interview | 1:1 or panel: **behavioral (STAR)**, **technical / case**, skills tests, work-style |
| Debrief | Up to **~5 days** (sometimes longer) |
| Final | Senior leader: strategy, leadership, team fit, your questions |
| Offer | Optional **references**; DocuSign; background check + laptop after sign |

Official: detailed reject feedback is **not** guaranteed. Glassdoor-family reports (~26 days average for SWE) are **not** a promise.

**Reported SWE overlay** (guides / candidate notes; confirm): algorithm or **practical / concurrency** coding, plus a verbal or experience hour. Frontend notes: JS that is **not** classic LeetCode; recruiter may contrast backend Java. Dataford-style “3 rounds / 3–5 weeks” is a **guide**, not the official map.

## How this track differs

| vs Robinhood / brokerage | vs FAANG |
| --- | --- |
| Official **senior-leader closer** + possible references | Product is **sportsbook / iGaming + jurisdiction rules** |
| Ten named principles; integrity / RG are hard filters | Second round may be **case + skills**, not only DSA |
| Peak load is **slate / Super Bowl**, not a generic QPS | “I only grind Blind 75” misses compliance and wallet |

## Coding and design flavor

Official engineering blurb: scale a **regulated** platform. Live work: Java concurrency, feed handlers, wallets, geo fences. Design: accept a bet when odds move, idempotent wallet debit, multi-state rules, live-odds fan-out. Related: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md), [../answers/system-design-ticketmaster.md](../answers/system-design-ticketmaster.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** sportsbook — a trust or correctness call when a customer has money on the line.
2. Principles: challenge then commit, or own the outcome after a bad ship.
3. Design: bet placement when the price changes mid-click; what you store, what you charge.
4. Coding: practical concurrency or a feed you can extend live.
5. Questions: Java vs TS, slate-week on-call, AI on the assessment, office.

## Prep checklist

- [ ] Read [How we hire](https://www.fanduel.careers/future-teammates/how-we-hire/) + [FanDuel Life / principles](https://www.fanduel.careers/fanduel-life/)
- [ ] Recruiter: coding vs case, language, hub, AI, references
- [ ] STAR bank mapped to **a few** principles; one wallet / odds design sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How We Hire — FanDuel Careers](https://www.fanduel.careers/future-teammates/how-we-hire/) — accessed 2026-10-19
- [FanDuel Life](https://www.fanduel.careers/fanduel-life/) — accessed 2026-10-19
- [FanDuel Careers](https://www.fanduel.careers/) — accessed 2026-10-19
- [FanDuel Frontend Engineer Interview Guide 2026 — Dataford](https://dataford.io/interview-guides/fanduel/frontend-engineer) — accessed 2026-10-19
- [FanDuel Software Engineer Interview Questions — Glassdoor](https://www.glassdoor.co.uk/Interview/FanDuel-Software-Engineer-Interview-Questions-EI_IE894936.0,7_KO8,25.htm) — accessed 2026-10-19
