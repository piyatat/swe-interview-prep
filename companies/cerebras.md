# Cerebras engineering track

Sits beside [nvidia.md](nvidia.md) and [groq.md](groq.md): **wafer-scale WSE + CS systems / inference cloud**, not a CUDA GPU loop or a compiler-scheduled LPU. Official [Company](https://www.cerebras.ai/company): founded 2015; **WSE** is one chip from a full wafer; 2026 notes **Nasdaq (CBRS)** and **CS-4**. Official [Join us](https://www.cerebras.ai/join-us): integrity, passion, curiosity, humor, **hard problems**. Recruiter confirms **compiler vs kernel vs runtime vs inference / cloud**, C++ / Python, and Sunnyvale hybrid vs onsite.

Typical timeline **~2–6 weeks** (official guide + 2026 reports). AI-assisted: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (four operating principles)

Do **not** invent Amazon-style LPs. Use the interviewing guide + careers language.

| Official signal | What they score |
| --- | --- |
| **Do not over complicate** (interview guide) | Smallest design that fits the SRAM / fabric budget |
| **Worry about the right thing** (interview guide) | Bandwidth / layout before micro-opts |
| **Work together** (interview guide) | Compiler + kernel + silicon as one problem |
| **Time is our enemy** (interview guide) | Bias to ship; interview is two-way — ask real questions |
| **Integrity, curiosity, humor** (careers) | Low-overhead culture; “why AI chips” without the wafer story fails |

Official [AI-native interviews](https://www.cerebras.ai/blog/hiring-engineers-for-an-ai-native-world) (2026-07-09): designated coding hours **allow and expect AI**. They score **framing, context, verification, tests, ownership** — not a prompt recipe. The human still owns what ships.

## Official + reported process

Official [Interviewing @ Cerebras](https://coda.io/@cerebras-careers/cerebras-interviewing-guide/interviewing-cerebras-2) is the skeleton. Guides add pace notes. Confirm which coding hour is **AI-assisted**.

| Stage | Official / reported |
| --- | --- |
| Recruiter | Background; **why wafer-scale** (not “I like GPUs”) |
| Exploratory (~45 min) | Official: engineer discussion; coding **if the role needs it** |
| Deep dive (4 × 45) | Official: **3** engineer sessions on **HackerRank** (one programming, language of choice; role deep-dive) + **1 HM on Teams** |
| Feedback | Official: often **24–48 h**; every offer talks to **CEO / founders** |

Guides (2026): unaided coding can feel like **two mediums in ~45 min** — narrate a working answer, then improve. Team hour forks: tiling / fusion (compiler), layout / vectorize (kernel), collectives (runtime), batch / quant (inference).

## How this track differs

| vs NVIDIA / CUDA | vs Groq |
| --- | --- |
| One **wafer**, on-chip SRAM, **weight streaming** — not HBM + caches as the default story | Chip is **huge + many cores**, not a deterministic LPU schedule |
| Official **AI-expected** coding hour (designated rounds) | Interview guide publishes **HackerRank + HM + founder** path |
| Design: fit a model **larger than local memory** | GroqCloud latency vs Cerebras **train + infer** platform |

## Coding and design flavor

Know **activations resident / weights streamed** as the interview metaphor (guides). Roofline, arithmetic intensity, blocked matmul, reduction cost across many cores. Related: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md). Do **not** recite WSE transistor counts as a substitute for a tiling argument.

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** wafer company — a time you were memory-bound, not FLOP-bound.
2. Principle: do not overcomplicate — what you cut from a “clever” kernel.
3. Tile a matmul into small local SRAM; what happens when the matrix does not fit.
4. AI-allowed hour: add a feature to a small repo; **catch** the polished-wrong patch.
5. Questions for them: compiler vs kernel vs cloud, which hour is AI, C++ bar, founder chat.

## Prep checklist

- [ ] Read [Join us](https://www.cerebras.ai/join-us) + [Company](https://www.cerebras.ai/company) + [interviewing guide](https://coda.io/@cerebras-careers/cerebras-interviewing-guide/interviewing-cerebras-2) + [AI-native blog](https://www.cerebras.ai/blog/hiring-engineers-for-an-ai-native-world)
- [ ] Recruiter: track, AI-in-pad, HackerRank vs CoderPad, location
- [ ] One timed two-medium coding mock + one blocked-matmul / roofline sketch
- [ ] One AI-collaborative repo hour: verify, test, own the diff ([../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md))
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers at Cerebras](https://www.cerebras.ai/join-us) — accessed 2026-10-06
- [About Cerebras](https://www.cerebras.ai/company) — accessed 2026-10-06
- [Interviewing @ Cerebras](https://coda.io/@cerebras-careers/cerebras-interviewing-guide/interviewing-cerebras-2) — accessed 2026-10-06
- [Hiring Engineers for an AI-Native World — Cerebras](https://www.cerebras.ai/blog/hiring-engineers-for-an-ai-native-world) — accessed 2026-10-06
- [How Cerebras interviews engineers for its wafer-scale chips — techinterview.org](https://www.techinterview.org/post/3233476421/how-cerebras-interviews-engineers-wafer-scale/) — accessed 2026-10-06
