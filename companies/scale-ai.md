# Scale AI engineering track

Sits beside [ai-labs.md](ai-labs.md) and [anduril.md](anduril.md): **data engine + eval / RLHF infrastructure**, not a foundation-model lab and not a generic FAANG slate. Official [Careers](https://scale.com/careers): mission is to **develop reliable AI systems for the world's most important decisions**. Recruiter confirms **SWE vs Forward Deployed Engineer (FDE)**, HackerRank language, and whether the Credo hour is in the onsite.

Typical timeline **1–3 weeks** (2026 guides; FDE reports run longer). Debugging: [../general/debugging-rounds.md](../general/debugging-rounds.md). LLD: [../general/low-level-design.md](../general/low-level-design.md). LLM serving: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (six Credos)

Do **not** collapse the list to “urgency / ownership” slogans from prep blogs. Use the official six on [Careers](https://scale.com/careers).

| Official Credo | What they score |
| --- | --- |
| **Earn Customer Love** | Trust is earned per delivery — customer *and* contributor |
| **Team Flow** | Optimize for the whole Scale, not a local hero |
| **Quality is Our Cheat Code** | Consistent quality is the structural advantage |
| **Find the 20%** | Finish the high-leverage 20%; reject effort without impact |
| **Write the Market** | Frontier research; bring partners there first |
| **Three Moves Ahead** | Second-order consequences of the decision |

“Why Scale?” that only says “I want to work in AI” fails. Name a **labeling-quality, eval-harness, or human-in-the-loop** problem you have lived.

## Official + reported process

Official careers page publishes **Credos**, not a round-by-round SWE loop. 2026 guides (TechPrep, Exponent, Interview Coder) — treat stage *counts* as **reported**. Guides disagree on whether HackerRank is before or after the first recruiter call (new-grad often OA-first). Confirm.

| Stage | Official / reported |
| --- | --- |
| Recruiter (guides: ~20–30 min) | Why Scale, SWE vs FDE, intensity / pace |
| HackerRank (guides: ~50–60 min) | Practical / evolving spec — **card-game / scheduler** flavor, not Blind-75 theater |
| HM (guides: 30–45) | Roadmap fit; some reports place this **before** the onsite |
| Virtual onsite (guides: 3–5 × ~45) | Coding, debugging unfamiliar repo, AI-infra design, **Credo** |
| Committee | Guides: no single round is the whole decision |

Guides: the screen is graded on **speed + a working increment**. Over-abstracting part one of an evolving spec is a common fail.

## How this track differs

| vs OpenAI / Anthropic | vs FAANG |
| --- | --- |
| Official **six Credos**; data / eval company, not a lab Charter round | Design is **annotation pipeline / eval / routing workers**, not “design Twitter” |
| Reported **card-game / evolving spec** screen | Debugging a multi-file pad is a first-class hour |
| FDE vs SWE often settled **late** (Exponent) | Timeline is **fast** — prep before you apply |

## Coding and design flavor

DSA: intervals, heaps, hash maps — finished mediums over unfinished optimal. LLD: game / scheduler / rate-limited client from a spec that grows. Design: labeling pipeline with quality SLAs; LLM eval harness; routing 100k workers; language-detect or recs **with a training path**, not only serving. Related: [../answers/coding-task-scheduler.md](../answers/coding-task-scheduler.md), [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md), [../roles/data-ml.md](../roles/data-ml.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** data-engine company — a quality vs latency call you owned.
2. Live: implement v1 of a spec in ~25 min, then absorb a rule change.
3. Debug: two logical bugs in an unfamiliar Python/TS repo; trace from entry points.
4. Design: eval harness when the model is wrong 8% of the time (queue, fallback, drift).
5. Credo: a deadline where you named what you **would not** cut.

## Prep checklist

- [ ] Read [Careers](https://scale.com/careers) Credos (all six names)
- [ ] Recruiter: SWE vs FDE, OA vs live, AI-in-pad, onsite mix
- [ ] Timed evolving-spec LLD (card game or scheduler) + one debug pass
- [ ] Four Credo stories (90 s); one AI-infra design with serving **and** training
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers at Scale AI](https://scale.com/careers) — accessed 2026-09-29
- [Scale AI's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/scale-ai-interview-process) — accessed 2026-09-29
- [Scale AI New Grad SWE Interview Guide (2026) — Exponent](https://www.tryexponent.com/guides/scale-ai-software-engineer-new-grad-interview) — accessed 2026-09-29
- [Scale AI FDE Interview Guide (2026) — Exponent](https://www.tryexponent.com/guides/scale-ai-forward-deployed-engineer-interview) — accessed 2026-09-29
- [Scale AI Software Engineer Interview (2026) — Interview Coder](https://www.interviewcoder.co/blog/scale-ai-software-engineer-interview) — accessed 2026-09-29
