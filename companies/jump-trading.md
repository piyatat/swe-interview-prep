# Jump Trading engineering track

Sits beside [jane-street.md](jane-street.md), [hrt.md](hrt.md), and [quant.md](quant.md): **Core Development C++ / Python on Linux** (Chicago / NY / London / APAC) — not Jane Street’s official open-ended pair loop and not a finance-puzzle trader screen. Official [Careers](https://www.jumptrading.com/hr/overview) + [Technology](https://www.jumptrading.com/technology): real-time systems, custom ASIC / FPGA, proprietary networks, three research data centers plus 100+ colocations. Recruiter confirms **Core Development vs trading-team vs GUI / data / HPC**, C++ vs Python vs Rust, office, and AI (treat live rounds as **off** unless they say otherwise).

Official campus JDs: **no finance or economics study required**. Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md). Jump publishes **no** stage list — treat round counts as **reported**.

## Official culture

Do **not** invent Amazon LPs. Official careers + technology + [students](https://www.jumptrading.com/hr/students-new-grads) lines:

| Official signal | Use it as |
| --- | --- |
| **Curiosity, not ego** (students) | Ambition paired with questions, not a résumé dump |
| **Autonomy, speed, and trust** (technology) | Design Monday, production Friday — own the blast radius |
| **Builders at heart** (technology) | Dig into a system; make it better; no trading pedigree required |
| **Flat structure** (careers) | Mentors who still write code, test models, and trade |
| **@jumptrading.com only** ([contact](https://www.jumptrading.com/contact)) | Never banking details or payment; `recruitingsecurity@jumptrading.com` to verify |

CTO (technology): they build their own hardware, run large-scale AI workloads, and move faster than most tech companies. “Why Jump?” that only says “HFT / Chicago / I like C++” fails. Name a **latency, cache, or from-scratch data-structure** problem you have lived. Campus JDs: build optimal solutions **from scratch**, not by assembling libraries.

## Official + reported process

Careers is apply + talent community. **No** public SWE stage list. Guides (gitGood, DataInterview, Glassdoor 2026). Recruiter wins on OA vs skip.

| Stage | Official / reported |
| --- | --- |
| Apply | [Careers](https://www.jumptrading.com/hr/overview) / [students](https://www.jumptrading.com/hr/students-new-grads); 2027 campus roles opening **by region** (US first) |
| Recruiter (~30 min) | Track, office, C++ vs Python; no finance background required |
| OA (some tracks) | Timed HackerRank-class algos; **not** every experienced candidate |
| Tech screen (45–60 min) | DSA + C++ costs (RAII, lifetime, singleton / vector internals) |
| Superday | Usually Chicago; reports **3–7** hours: coding, systems / concurrency, one fit |
| Close | Base + discretionary bonus, **no equity** on typical SWE packages — ask |

Reports (Glassdoor Oct–Nov 2026): one LC-hard screen then onsite med-hards (mathy DSA, packets, strings); interviewers **hint**. Pair: [../general/cs-fundamentals.md](../general/cs-fundamentals.md), [../general/pair-programming.md](../general/pair-programming.md).

## How this track differs

| vs Jane Street / Citadel Sec | vs FAANG |
| --- | --- |
| Official **hardware + FPGA + colocations**, not OCaml pair or four-stage one-problem | Design is **market data / ring buffer / feed**, not “design Twitter” |
| Campus JD: **from scratch**, C++ or Python on Linux | “I only grind Blind 75” misses CPU / OS / networking |
| No published loop — **ask** OA vs live | Fit is intellectual honesty, not LPs |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Core Development seat — a cache-line or feed-arbitration constraint, not “trading is cool.”
2. Implement `std::vector` growth / a ring buffer; name copies vs moves.
3. Debug a data race: mutex vs atomic vs memory order — [../general/cs-fundamentals.md](../general/cs-fundamentals.md).
4. Culture: a time you were wrong in public and changed the design.
5. Questions: Core vs trading-team, OA vs skip, **confirm AI-off**, Chicago vs NY vs London.

## Prep checklist

- [ ] Read [Careers](https://www.jumptrading.com/hr/overview) + [Technology](https://www.jumptrading.com/technology) + [students / scam line](https://www.jumptrading.com/hr/students-new-grads)
- [ ] Recruiter: track, language, city, OA vs live, **AI-in-pad (expect off)**
- [ ] One C++ lifetime / concurrency mock + one progressive DSA mock with **no** assistant
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Jump Trading](https://www.jumptrading.com/hr/overview) — accessed 2026-11-12
- [Technology — Jump Trading](https://www.jumptrading.com/technology) — accessed 2026-11-12
- [Students & New Grads — Jump Trading](https://www.jumptrading.com/hr/students-new-grads) — accessed 2026-11-12
- [Contact / recruiting security — Jump Trading](https://www.jumptrading.com/contact) — accessed 2026-11-12
- [Jump Trading SWE (Core Development) — gitGood](https://gitgood.dev/prep/jump-trading-swe) — accessed 2026-11-12
- [Jump Trading Quantitative Developer Interview Guide — DataInterview](https://www.datainterview.com/blog/jump-trading-quantitative-developer-interview) — accessed 2026-11-12
