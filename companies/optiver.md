# Optiver engineering track

Sits beside [quant.md](quant.md): **market-making SWE (Amsterdam / Chicago / Austin / Sydney / …)**, not Jane Street’s official “no LeetCode / no mental math” SWE loop and not a Citadel Securities four-stage same-engineer day. Official [interview tips for Software Engineers](https://www.optiver.com/join-us/stories/optiver-interview-tips-for-software-engineers/) (Mar 2025): they score **how you think** — collaborative technical discussion, not a one-sided puzzle exam. Recruiter confirms **SWE vs trader vs research**, **C++ / Java / Python**, office, and AI policy (usually **off** unless they say otherwise).

Typical reported SWE path (guides, 2026): **recruiter → 45-min coding → two 60-min technicals, often same day**. Official page does **not** publish a stage list — recruiter wins. Pair flavor: [../general/pair-programming.md](../general/pair-programming.md). CS fundamentals: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (values)

Do **not** invent Amazon-style LPs. Official [About us](https://www.optiver.com/about-us/) values + [Working at Optiver](https://optiver.com/working-at-optiver) “we look for.” Map **your** stories.

| Official value / signal | What they score |
| --- | --- |
| **We take ownership** | Entrepreneurs and initiative-takers |
| **Continuous improvement** | Push to be your best; the problem keeps moving |
| **Collaboration** | Best work is done together (even if you are competitive) |
| **Critical thought + open feedback** | Diverse thinking, self-reflection |
| **Integrity + discipline** | Decisions that support well-functioning markets |
| **Challenge seekers** | Faster, smarter, more efficient every day |
| **Entrepreneurial spirits** | Ideas from anyone; step out of the comfort zone |

Official [diversity statement](https://www.optiver.com/diversity-statement/): differences are the edge; reasonable adjustments during hiring. “Why Optiver?” that only says “HFT / comp / Amsterdam” fails. Name a **latency, correctness-under-load, or market-data** problem you have lived.

## Official process (what they publish)

Official SWE tips are the engineering skeleton. They **explicitly** de-emphasize “standard LeetCode puzzles or brainteasers,” then still require **strong CS**:

| Official ask | What to show |
| --- | --- |
| Language | **C++, Java, or Python** cold — stdlib, collections, algorithms on unfamiliar prompts |
| Data structures | Time/space of operations **and** how the structure sits in memory |
| Algorithms | Complexities you can defend for performance-essential paths |
| Fundamentals | **Architecture, networking, concurrency, memory** — how physics constrains design |
| Design talk | Clarify load / latency / edges first; “why this choice?”; engage hints |
| Communication | Whiteboard or labelled diagrams beat a monologue |
| Behavioral | STAR; authentic; **why SWE here** (traders + researchers in one loop) |

Official: exhaustive scripted prep is **not** advised. Practice **out loud**. Ask questions about life at the firm — fit is two-way.

**Reported 2026 SWE shape** (third-party; confirm): ~20–25 min recruiter → ~45 min coding filter → two ~60-min technicals back-to-back, difficulty stepping up. Some loops add a systems / low-level hour. Do **not** treat this as official stage counts.

## How this track differs

| vs Jane Street / Citadel Sec (see [quant.md](quant.md)) | vs FAANG |
| --- | --- |
| Official: **collaborative** discussion; still **DSA + systems physics** | Product is **liquidity / quoting**, not “design Twitter” |
| JS official: open-ended pair, no mental math for SWE | Official: **memory layout** and concurrency show up |
| Citadel Sec official: one problem, four stages, one interviewer | “I only grind Blind 75 silently” misses the design dialogue |

## Coding and design flavor

Official: pick structures for **performance requirements**; implement details, not only Big-O slogans. Live work looks like arrays / graphs / implementation-heavy prompts that grow a constraint (throughput, lock, cache line). Design: market-data fan-in, order path, failover when a feed dies. Related: [../answers/system-design-metrics.md](../answers/system-design-metrics.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** market maker — a latency or correctness call, not “trading is cool.”
2. Implement a structure; they ask how it sits in cache and what breaks at 10×.
3. A hint appears — engage it; do not defend a dead design.
4. Concurrency: shared book or feed handler; what you lock, what you do not.
5. STAR: continuous improvement — you measured, changed, and kept the win.

## Prep checklist

- [ ] Read [SWE interview tips](https://www.optiver.com/join-us/stories/optiver-interview-tips-for-software-engineers/) + [About us / values](https://www.optiver.com/about-us/) + [Working at Optiver](https://optiver.com/working-at-optiver)
- [ ] Recruiter: SWE vs other tracks, language, city, AI, onsite vs virtual
- [ ] One **progressive** coding mock + one architecture / concurrency sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Optiver interview tips for Software Engineers](https://www.optiver.com/join-us/stories/optiver-interview-tips-for-software-engineers/) — accessed 2026-10-19
- [About Us — Optiver](https://www.optiver.com/about-us/) — accessed 2026-10-19
- [Working at Optiver](https://optiver.com/working-at-optiver) — accessed 2026-10-19
- [Diversity Statement — Optiver](https://www.optiver.com/diversity-statement/) — accessed 2026-10-19
- [Optiver Interview Process for Software Engineers (2026) — getcracked.io](https://getcracked.io/blog/navigating-the-optiver-interview-swe) — accessed 2026-10-19
