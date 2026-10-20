# Hudson River Trading engineering track

Sits beside [quant.md](quant.md) and [optiver.md](optiver.md): **automated-trading SWE (NYC / London / Austin / …)**, not Jane Street’s official “no LeetCode / no mental math” SWE loop and not Optiver’s published “how you think” pair day. Official [HRTBeat interview guide](https://www.hudsonrivertrading.com/hrtbeat/interview-at-hrt/) (campus) + [Joe Smith, Oct 2025](https://www.hudsonrivertrading.com/hrtbeat/engineering-and-interviewing-at-hrt/): they want **fundamentals without tricks**, and they **program at every level**. Recruiter confirms **SWE vs Algo Engineering vs Algo Dev**, **C++ / Python / TS+Python**, office, and AI (official: LLM cheating on early stages is a **permanent** reject).

Typical official path (campus post; 2025 update still Zoom → onsite): **timed take-home (HackerRank / Codility) → ~two phone hours → onsite coding / debug / design / fit**. Pair flavor: [../general/pair-programming.md](../general/pair-programming.md). CS fundamentals: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (Life at HRT)

Do **not** invent Amazon-style LPs. Official [Life at HRT](https://www.hudson-trading.com/life-at-hrt/) core values + the 2025 engineering essay. Map **your** stories. Official job text: **no “smart jerks.”**

| Official value / signal | What they score |
| --- | --- |
| **Automation & efficiency** | Small tech company, large market impact |
| **Collaboration** | Shared R&D; best ideas are not solo |
| **Code of ethics** | Fair, transparent markets — above the letter of the rule |
| **Diversity & inclusion** | Varied perspectives in the room |
| **Make it better** | Tenacious incrementalism |
| **Togetherness** | Community past the desk |
| **Leaders who code** | Same technical test at every level; EMs still ship |

Algo is **not** a siloed pod shop — engineers can work across trading. That is a “why HRT?” that is **not** “I like HFT.”

## Official process

Official campus [How to prepare](https://www.hudsonrivertrading.com/hrtbeat/interview-at-hrt/) (they iterate; **recruiter wins**). 2025 essay: Zoom series first; they **prefer some onsite in person**.

| Stage | Official |
| --- | --- |
| Take-home | Timed; language may be locked; HackerRank / Codility; books/web OK as **language** reference; **test your own edges**; style is secondary |
| Phones (~2 × 45) | Systems / DS / problem-solving discussion **or** language-specific programming |
| Onsite | Programming (idiomatic, encapsulated), systems (memory / I/O / processes), problem-solving, plus collaboration / teachability / communication |
| Language | C++, Python, or Typescript/Python (fullstack). You may **read** an unfamiliar language; they grade with that in mind |

Official 2025: they **try to avoid burst-of-insight LeetCode**. A strong programmer from a competitive firm should pass **without a grind**. Failures they name (frequency order): shallow fundamentals, poor communication, not listening, avoiding real work / over-abstracting, arrogance, indifference, cheating.

HN reply from the official HRT account (Jan 2025): take-home, one or two technical phones, onsite **3–5** rounds. **SWE / C++ / Python does not assess quant skills**; algo-dev adds stats / probability. Confirm the track.

## How this track differs

| vs Jane Street / Optiver | vs FAANG |
| --- | --- |
| Official **Trading Tech vs R&D** × **Accel vs Platform** map | Design is **systems + debug**, not “design Twitter” |
| Same coding bar for CTOs; leaders code | Take-home **plus** phones; LLM cheat = ban |
| Latency (Trading Tech) vs scale (R&D) | “I only grind Blind 75 tricks” is the anti-signal |

## Coding and design flavor

Official 2025 topology: Trading Tech ≈ **70% C++ / 30% Python** (latency, today); R&D ≈ **70% Python / 30% C++** (scale, history). Accel = embedded with an Algo team; Platform = shared products that still talk to Algo **daily**. Live work: exchange connectivity, FPGA edges, cluster schedulers, research ETL. Related: [../general/cs-fundamentals.md](../general/cs-fundamentals.md), [../answers/system-design-metrics.md](../answers/system-design-metrics.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** automated shop — a latency **or** research-scale call, not “trading is cool.”
2. Explain a tool you use down to **why it exists** (virtuals / Python list growth).
3. Debug a systems snippet; narrate what the machine is doing.
4. They hint — apply it on the next part (teachability).
5. STAR: make-it-better without being the smartest person in the room.

## Prep checklist

- [ ] Read [interview-at-hrt](https://www.hudsonrivertrading.com/hrtbeat/interview-at-hrt/) + [engineering topology / pitfalls](https://www.hudsonrivertrading.com/hrtbeat/engineering-and-interviewing-at-hrt/) + [Life at HRT](https://www.hudson-trading.com/life-at-hrt/)
- [ ] Recruiter: SWE vs AE vs AD, language, city, AI, how much of onsite is in person
- [ ] One **systems** mock + one progressive coding mock; practice talking while coding
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How to Prepare for Your Software Engineer Interview at HRT](https://www.hudsonrivertrading.com/hrtbeat/interview-at-hrt/) — accessed 2026-10-20
- [Engineering and Interviewing at HRT — Joe Smith](https://www.hudsonrivertrading.com/hrtbeat/engineering-and-interviewing-at-hrt/) — accessed 2026-10-20
- [Life at HRT](https://www.hudson-trading.com/life-at-hrt/) — accessed 2026-10-20
- [Work at HRT](https://www.hudsonrivertrading.com/work-at-hrt/) — accessed 2026-10-20
- [HRT official comment on interview shape — Hacker News](https://news.ycombinator.com/item?id=42576574) — accessed 2026-10-20
