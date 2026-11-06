# Monzo engineering track

Sits beside [revolut.md](revolut.md) and [wise.md](wise.md): **UK licensed digital bank** (current account, pots, lending) on a **Go microservice** estate, not a global super-app Java loop and not mid-market FX. Official mission: **make money work for everyone**. Recruiter confirms **backend vs mobile vs web / data**, hub vs remote (official: no office-days mandate for engineers), language, and **AI rules**.

Typical timeline **~3–5 weeks** (official four-stage backend loop). Pair: [../general/pair-programming.md](../general/pair-programming.md). Ledger: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (six values)

Do **not** invent Amazon-style LPs. Use the official six in the [FY26 annual report](https://monzo.com/annual-report/2026/Monzo-Annual-Report-2026.pdf). Map **your** stories.

| Official value | Report one-liner |
| --- | --- |
| **Default to transparency** | Open with each other and customers unless there is a good reason not to |
| **Make a difference** | Real problems; biggest impact for customers and teammates |
| **Be hard on problems, not people** | Fix the issue; treat people with respect |
| **Think big, start small, own it** | Ambitious, iterative, accountable |
| **Help everyone belong** | A bank for everyone; differences welcome |
| **Think customer first: grow Monzo safely** | Customer-best is also the **safe** way to grow a bank |

“Why Monzo?” that only says “cute coral card / London fintech” fails. Name a **ledger, Faster Payments, card-auth, or regulated change** problem you have lived. Official inclusive-hiring blog: **no CS degree required**; they will teach Go.

## Official process (backend)

Official [Demystifying the Backend Engineering interview process](https://monzo.com/blog/demystifying-the-backend-engineering-interview-process) (2025-03-01). Four stages, then a **Hiring Committee**. Mobile has its own [prep post](https://monzo.com/blog/preparing-for-mobile-interviews-at-monzo) (same choice of take-home vs pair).

| Stage | Official |
| --- | --- |
| Recruiter | Match, mission, next steps; dedicated recruiter **and** coordinator |
| Initial call (~1 h, engineers) | Recent project: tradeoffs, reliability, security — **no live code** |
| Take-home **or** pair | Candidate **chooses**. Pair: ~45–60 min, Go / Python / Java, tests provided, **not LeetCode**. Take-home: your IDE + language; README; live review |
| Systems design | Hypothetical **non-Monzo** problem; Excalidraw; queues + stores; first principles over buzzwords |
| Behavioural (~1 h, two interviewers) | Communication, learning, team, delivery; Hiring Committee decides |

Official inclusive hiring: final-stage **prep call** (what to expect, feedback so far, logistics). Job ads link **public engineering progression** and salary.

Official [AI interview guide](https://monzo.com/blog/the-ultimate-guide-on-using-ai-to-ace-an-interview-at-monzo): **refine, not replace**. Prep and STARR framing yes; inventing stories no; **do not use AI live** in the interview. Recruiter if the take-home is unclear.

## How this track differs

| vs Revolut / Wise | vs generic FAANG |
| --- | --- |
| PRA-licensed **UK bank**; “grow safely” is a value | Official **choice** of pair vs take-home |
| Practical interface + tests, not invert-a-tree | HC after behavioral; team match is part of the decision |
| Published AI rule: conversational live hour | Design prompt is **not** “design Monzo” |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** bank — customer + safety constraint, not “I like fintech.”
2. Initial call: one recent system; what you would change; what broke.
3. Pair: implement an interface against failing tests; talk structure, not speed.
4. Design: payments-shaped but **non-Monzo**; name consistency vs availability.
5. Questions for them: pair vs take-home, Go bar, remote, HC timing, AI-on-task.

## Prep checklist

- [ ] Read backend [process](https://monzo.com/blog/demystifying-the-backend-engineering-interview-process) + [AI guide](https://monzo.com/blog/the-ultimate-guide-on-using-ai-to-ace-an-interview-at-monzo) + [values](https://monzo.com/annual-report/2026/Monzo-Annual-Report-2026.pdf)
- [ ] Recruiter: track, pair vs take-home, languages, remote, recorder
- [ ] One practical pair (drive, tests green) + one first-principles design + two values STARs
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Demystifying the Backend Engineering interview process — Monzo](https://monzo.com/blog/demystifying-the-backend-engineering-interview-process) — accessed 2026-11-06
- [Inclusive Hiring in Engineering at Monzo](https://monzo.com/blog/inclusive-hiring-in-engineering-at-monzo) — accessed 2026-11-06
- [The ultimate guide on using AI to ace an interview at Monzo](https://monzo.com/blog/the-ultimate-guide-on-using-ai-to-ace-an-interview-at-monzo) — accessed 2026-11-06
- [Preparing for Mobile Interviews at Monzo](https://monzo.com/blog/preparing-for-mobile-interviews-at-monzo) — accessed 2026-11-06
- [FY26 annual report — values](https://monzo.com/annual-report/2026/Monzo-Annual-Report-2026.pdf) — accessed 2026-11-06
