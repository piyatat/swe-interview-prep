# IMC Trading engineering track

Sits beside [optiver.md](optiver.md) and [quant.md](quant.md): **market-making SWE (Amsterdam / Chicago / Sydney / …)**, not Jane Street’s official open-ended pair loop and not HRT’s take-home-plus-systems day. Official [How to prepare](https://www.imc.com/ap/articles/how-to-prepare-for-an-interview-at-imc) + [Alex ten Brink on hiring](https://www.imc.com/in/articles/a-unique-approach-to-hiring-in-conversation-with-alex-ten-brink): they **filter with LeetCode-style OA**, then score **how you work** on a stand-in trading system. Recruiter confirms **SWE vs trader vs research**, **C++ / Java** (Python preferred extra), office, and AI (usually **off** unless they say otherwise).

Typical official **campus** path: **online assessment → recruiter behavioral → first technical with an engineer/trader → in-office assessment day** (technical + behavioral stations). Experienced loops reuse the same philosophy; ask. Pair flavor: [../general/pair-programming.md](../general/pair-programming.md). CS fundamentals: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (six values)

Do **not** invent Amazon-style LPs. Official [Culture & values](https://www.imc.com/us/who-we-are/our-culture-values) + intern JD wording. Map **your** stories.

| Official value | What they score |
| --- | --- |
| **Dare to continuously innovate** | Best performance daily; invest for the long term |
| **Champion the best ideas** | Entrepreneurial from day one; idea over title |
| **Collaborate to succeed** | Traders, quants, FPGA, ops as one stack |
| **Take responsibility** | Own actions and team outcomes |
| **Keep both feet on the ground** | Humble; official campus note calls this out by name |
| **Build for our future** | Balance risk/reward; fair, transparent markets |

Official SWE page: **one organization, one codebase, one product**. Flat, early responsibility, mentorship. “Why IMC?” that only says “HFT is fast” fails — name a **shared-platform** or **trader-pairing** problem you have lived.

Official campus: engineering degrees need a **Distinction-class** average (region-specific). They score **how you learn under uncertainty**, not omniscience. Resilience is tested for traders; engineers still get unfamiliar problems.

## Official process

Official campus [How to prepare](https://www.imc.com/ap/articles/how-to-prepare-for-an-interview-at-imc). Official [ten Brink](https://www.imc.com/in/articles/a-unique-approach-to-hiring-in-conversation-with-alex-ten-brink) describes the **engineering assessment** that sits after the filter.

| Stage | Official |
| --- | --- |
| Online assessment | Time-saver; **automated LeetCode-style** questions |
| Recruiter behavioral | Phone / Zoom: you, the role, life at IMC, your questions |
| First technical | Work a problem **with** an engineer or trader |
| Assessment day | In office (or remote variant): technical + behavioral stations |
| Coding hour (ten Brink) | Handout + setup; **approximation of the trading system** (traders get the trades they want) + a colleague-style discussion |

Official ten Brink: they **do not care that much about the end product**. They watch pickup speed, mistake recovery, C++ fluency, reading existing code, standard algorithms, communication, and reaction to criticism. Questions get **harder on purpose** — finishing every item is not the bar. Admit gaps.

Grad JDs (2026): you may complete the process in **Java or C++**; exclusive use of one language is **not** guaranteed. Global trainee programme is a **separate** new-grad onboarding fact, not the interview.

## How this track differs

| vs Optiver / HRT | vs FAANG |
| --- | --- |
| Official **OA filter then job-like system** | Second hour is **trading-system work**, not abstract DSA |
| Six named values; humility is explicit | Assessment day, not a four-disconnected-45s loop |
| One global codebase | “I only grind Blind 75” dies after the OA |

## Coding and design flavor

Official SWE: in-house stack across the trading lifecycle — algorithms with traders, monitoring tools, keep-the-lights-on with trading-engineering / FPGA. Live work: C++ or Java, feed / order path, research tooling. Design: what you lock on a book, what happens when a venue feed dies. Related: [../general/low-level-design.md](../general/low-level-design.md), [../answers/system-design-metrics.md](../answers/system-design-metrics.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** market maker — a shared-platform or trader-pairing call.
2. OA-level DS/algo, then a **read-and-extend** of an existing order path.
3. They criticize an approach — recover without defending a dead design.
4. Values: both feet on the ground after a win, or champion someone else’s idea.
5. Questions: C++ vs Java, desk vs platform, AI, which city runs the assessment day.

## Prep checklist

- [ ] Read [How to prepare](https://www.imc.com/ap/articles/how-to-prepare-for-an-interview-at-imc) + [ten Brink hiring](https://www.imc.com/in/articles/a-unique-approach-to-hiring-in-conversation-with-alex-ten-brink) + [values](https://www.imc.com/us/who-we-are/our-culture-values)
- [ ] Recruiter: SWE vs other tracks, language, city, AI, campus vs experienced loop
- [ ] One timed OA mock + one **extend-existing-code** mock in C++ or Java
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How to prepare for an interview at IMC](https://www.imc.com/ap/articles/how-to-prepare-for-an-interview-at-imc) — accessed 2026-10-20
- [A unique approach to hiring — Alex ten Brink](https://www.imc.com/in/articles/a-unique-approach-to-hiring-in-conversation-with-alex-ten-brink) — accessed 2026-10-20
- [Culture & values — IMC](https://www.imc.com/us/who-we-are/our-culture-values) — accessed 2026-10-20
- [Software Engineering — IMC](https://www.imc.com/us/what-we-do/technology/software-engineering) — accessed 2026-10-20
- [Graduate Software Engineer (2026) — IMC](https://www.imc.com/us/careers/jobs/4564480101) — accessed 2026-10-20
