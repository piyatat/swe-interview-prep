# Bloomberg engineering track

Sits beside [quant.md](quant.md) and [product-companies.md](product-companies.md): **Terminal + market-data infrastructure**, not a hedge-fund trading desk and not a consumer FAANG loop. Official [Engineering & CTO](https://www.bloomberg.com/company/what-we-do/engineering-cto/): experienced process is **customized to the role**; students/new-grads often apply to a **non-team-specific** SWE req and match later. Recruiter is the source of truth for **HackerRank vs laptop**, **virtual vs in-house**, and **AI policy**.

Typical timeline **4–5 weeks** (guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Low-latency design: [../general/system-design.md](../general/system-design.md). New-grad shape: [../general/new-grad.md](../general/new-grad.md).

## Official culture (How we hire + engineering pages)

Do **not** recite a values slide. Official [How we hire](https://www.bloomberg.com/company/careers/how-we-hire/): they want **what draws you to Bloomberg**, how the role fits your goals, and questions **you** ask. “Doing the right thing” is named as a guiding value. Structure is **flatter** than many banks: mostly **IC vs people manager** (Team Leader / Head of), fewer title rungs.

| Official signal | Interview implication |
| --- | --- |
| **Why Bloomberg** | Terminal, data, clients — not “fintech brand” |
| **Collaborative, open-ended** | Narrate; ask; they score thought process |
| **Language-agnostic** | Use your strongest language; match the team if they say C++ |
| **Honest representation** | Resume + assessments + AI use must be yours |

Official candidate-conduct note: research with tools is fine; **misrepresenting** yourself (including via AI in assessments) is not.

## Official + reported process

Official **experienced** ([application process](https://www.bloomberg.com/company/careers/application-process/engineering-experienced-hire/)):

| Stage | Official note |
| --- | --- |
| **HR or engineer call** | Interests, role fit |
| **Technical phone** | 45–60 min; computer; **coding fluency + DSA + problem-solving**; time for your questions |
| **In-house** | 2 hours to a full day; ~1 hour rounds; **two engineers** per round |
| **Format** | Open-ended; paper / whiteboard / laptop; language of choice |

Official **student / new-grad**: Zoom technical first; then in-house **2–3** technical rounds; resume/projects; same open-ended, language-agnostic rules. Non-CS backgrounds are explicitly welcome if the problem-solving shows.

Official How-we-hire **four pillars** for engineering technicals: data structures, algorithms, problem-solving, **communication**. They say they care more about **how you think and coding fluency** than the single optimal answer or running code.

Guides (2026): recruiter → **HackerRank CodePair** (one or two mediums, narrated) → virtual onsite of **3–5** hours (2–3 coding, design at mid+, behavioral / HM). Problems often wear a **trades / stream** costume over hash maps, trees, graphs. “Why Bloomberg?” is a **hard filter**.

## How this track differs

| vs FAANG | vs Jane Street / Citadel SWE ([quant.md](quant.md)) |
| --- | --- |
| Official bar is **fluency + collaboration**, not contest-optimal | Quant loops lean harder on live correctness and mental math |
| Design (mid+) is **ticker / matching / alerts**, sub-50 ms talk | Not a market-making puzzle interview |
| Motivation for the **Terminal** is scored like a round | Team match is heavier for **students** than many product cos |

## Coding and design flavor

Drill **hash maps, trees, graphs**, then a Bloomberg-tagged stream problem so you can name the pattern in 60 seconds. LRU Cache is a frequent design-and-implement. Mid+: stock ticker ingest, matching engine, anomaly alerts — latency hops, shard-by-instrument, consistency. Related: [../answers/system-design-notification.md](../answers/system-design-notification.md), [../answers/coding-lru-cache.md](../answers/coding-lru-cache.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why Bloomberg — and why not a consumer app or a bank?”
2. Stream of trades: detect a property (duplicate, first unique, windowed sum).
3. Tree: distance-k / vertical order / serialize — say the traversal invariant.
4. Design a ticker fan-out: what you drop vs what must be in-order per symbol.
5. Conflict or ownership STAR; then questions about the team’s actual stack.

## Prep checklist

- [ ] Read experienced or [student process](https://www.bloomberg.com/company/careers/application-process/engineering-student/) + [How we hire](https://www.bloomberg.com/company/careers/how-we-hire/)
- [ ] Recruiter: language, CodePair vs whiteboard, design or not, NYC / other hub
- [ ] 2–3 **narrated** mediums (hash map + tree + graph) with a follow-up constraint
- [ ] Mid+: one low-latency design mock
- [ ] Spoken “Why Bloomberg” that names the Terminal / data plane
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Engineering: Experienced Hire Application Process — Bloomberg](https://www.bloomberg.com/company/careers/application-process/engineering-experienced-hire/) — accessed 2026-09-04
- [Engineering: Student Application Process — Bloomberg](https://www.bloomberg.com/company/careers/application-process/engineering-student/) — accessed 2026-09-04
- [How we hire — Bloomberg](https://www.bloomberg.com/company/careers/how-we-hire/) — accessed 2026-09-04
- [Engineering & CTO — Bloomberg](https://www.bloomberg.com/company/what-we-do/engineering-cto/) — accessed 2026-09-04
- [Bloomberg Software Engineer Interview — SpaceComplexity](https://spacecomplexity.ai/blog/bloomberg-software-engineer-interview) — accessed 2026-09-04
- [Bloomberg Interview Process 2026 — OphyAI](https://ophyai.com/blog/company-guides/bloomberg-interview-guide) — accessed 2026-09-04
