# Two Sigma engineering track

Sits beside [quant.md](quant.md): **scientific-computing SWE (NYC / Houston / …)**, more FAANG-shaped than Jane Street’s official open-ended pair loop and not Citadel Securities’ official one-problem four-stage day. Official [Interviewing for Software Engineering](https://www.twosigma.com/interviewing-for-software-engineering/): up to **three** process rounds; first block is **three 60-minute technicals**. Recruiter confirms **which of the nine engineering verticals**, **C / C++ / Java / Python**, office vs video, and AI (official: **ChatGPT and any other AI tool are strictly prohibited** — perceived use can end the application).

Typical official path: technical block → compiled feedback → optional **additional 60-minute** interviews on projects and interests. Official: if they decide there is no role, they may **shorten** the remaining slot and tell you. CS: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Design: [../general/system-design.md](../general/system-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (engineering, not invented LPs)

Do **not** invent a principle list they did not publish. Official [engineering careers](https://www.twosigma.com/careers/engineering/): **over 50% of the firm is engineers**; open-source plus familiar languages, proprietary tools for finance. Official site voice: **endlessly curious**, collaborative, scientific method. “Why Two Sigma?” that only says “quant + Python” fails — name a **data, platform, reliability, or trading-systems** problem you have lived.

Official nine engineering verticals (ask which one):

| Vertical | Official work |
| --- | --- |
| **Platform** | Storage / compute at firm scale; modern services architecture |
| **Modeling** | Tools for ideating, testing, deploying models; Arrow / Spark / Jupyter / Pandas |
| **Data** | Ingest from **10,000+** sources/day; dataset health and quality |
| **Reliability** | Mission-critical products, including the main trading system |
| **Trading** | Low-latency / high-throughput execution, compliance, venue choice |
| **Enterprise** | Internal tools for corporate + trading businesses |
| **Infrastructure** | Hardware, networks, next-gen compute |
| **Security** | Design, investigations, response; reduce security friction |
| **Product** | Roadmap and metrics across engineering and business |

Campus / early-career: official intern learning series; **NewTS** for new campus Engineering / Data Science / Quant Research hires.

## Official process

Official [SWE interviewing](https://www.twosigma.com/interviewing-for-software-engineering/) page.

| Stage | Official |
| --- | --- |
| Logistics | Video link or office details emailed **the day before** |
| Technical block | **Three 60-minute** interviews: DS/algo, OOP patterns; **shared codepair**; possible **systems-design** exercise |
| Languages | **C, C++, Java, or Python** |
| Topics they name | Big-O, tree/graph walks, recursion, search/sort, hash tables, **concurrency** |
| After technicals | Feedback compiled; continue or stop |
| Later interviews (~60 min) | More technical depth **and** specific projects / contributions |
| What they grade | Coding, CS knowledge, **testing**, design/architecture, problem solving — they say they want **clean, scalable** code |
| AI (official, emphatic) | **No ChatGPT or any other AI tool** in this examination or any interview; perceived use can disqualify |

Official prep they publish: stop and think; ask to clarify; consider memory and performance (brute force is not always best); **take hints**; walk examples. They point at HackerRank / CareerCup / TopCoder and sample books (CtCI, EPI Python, Algorithm Design Manual) — practice those **shapes**, do not paste chapters.

If you update your resume just before the day, official: **email it in advance**. Confidential project? Official: say so; they will ask something else.

## How this track differs

| vs Jane Street / Citadel Sec | vs FAANG |
| --- | --- |
| Official **three 60s + optional project hours** | Closer to a standard coding + design loop |
| Official **hard AI ban** on the SWE page | Domain is data / models / trading infra |
| Nine named eng verticals | “I only grind in silence” misses testing + design |

## Coding and design flavor

Official: codepair DS/algo + possible systems design. Live work: pipelines, realtime, concurrency, dataset quality. Design: ingest fan-in, what you lock on a book, what happens when a source or venue dies. Related: [../general/low-level-design.md](../general/low-level-design.md), [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md), [../answers/system-design-metrics.md](../answers/system-design-metrics.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** vertical — a data-quality, reliability, or execution call.
2. Codepair: medium DS/algo in C/C++/Java/Python; narrate tests before they ask.
3. Design: ingest or trading path with a dead feed and a compliance gate.
4. Project hour: a contribution with a metric, not a tool list.
5. Questions: which vertical, AI (already banned — confirm anyway), NYC vs Houston, intern vs NewTS vs experienced.

## Prep checklist

- [ ] Read [Interviewing for Software Engineering](https://www.twosigma.com/interviewing-for-software-engineering/) + [engineering careers](https://www.twosigma.com/careers/engineering/)
- [ ] Recruiter: vertical, language, city, AI (official off), campus vs experienced
- [ ] Three timed 60-minute mocks (two coding + one design or LLD) with **no** assistant
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Interviewing for Software Engineering — Two Sigma](https://www.twosigma.com/interviewing-for-software-engineering/) — accessed 2026-10-21
- [Software & Systems Engineering Careers — Two Sigma](https://www.twosigma.com/careers/engineering/) — accessed 2026-10-21
- [Careers — Two Sigma](https://www.twosigma.com/careers/) — accessed 2026-10-21
- [Engineering education at Two Sigma](https://www.twosigma.com/articles/endlessly-curious-and-maximally-effective-engineering-education-at-two-sigma/) — accessed 2026-10-21
- [Curiosity × scientific method — Two Sigma](https://www.twosigma.com/articles/the-innovation-equation-curiosity-x-the-scientific-method-at-two-sigma/) — accessed 2026-10-21
