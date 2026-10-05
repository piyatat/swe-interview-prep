# Groq engineering track

Sits beside [nvidia.md](nvidia.md) and [ai-labs.md](ai-labs.md): **LPU inference + compiler-scheduled silicon / GroqCloud**, not a CUDA GPU loop or a closed foundation-model lab. Official [Careers](https://groq.com/careers) / [Company](https://groq.com/company): premier **neocloud for fast inference**; pioneered the **LPU**; **LPX** works alongside next-gen NVIDIA GPUs. Recruiter confirms **compiler vs kernel/runtime vs silicon vs GroqCloud serving**, language (C++ / Python), and Mountain View / Santa Clara hybrid vs remote.

Typical timeline **~3–5 weeks** (2026 guides). Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). LLM serving: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (inference + software-first)

Do **not** invent Amazon-style LPs. Groq does **not** publish a numbered values table. Use careers + the [LPU explainer](https://groq.com/blog/the-groq-lpu-explained).

| Official signal | What they score |
| --- | --- |
| **Inference is the bottleneck** (careers) | Why **serving latency / $/token**, not “I like training labs” |
| **Tell us what you built** (careers) | GitHub / shipped kernels / compilers — not a LeetCode week |
| **Software-first LPU** (blog) | Compiler lays out the schedule; hardware executes it |
| **Deterministic + on-chip SRAM** (blog) | Predictable cycles; no GPU-style cache / HBM dance as the default model |
| **@groq.com only** ([fraud page](https://groq.com/recruitment-fraud-awareness)) | Never pay; never a gmail “offer” |

Official LPU principles (blog): **software-first**, **programmable assembly line**, **deterministic compute and networking**, **on-chip memory**. “Why Groq?” that only says “fast Llama” fails. Name a **static schedule, tiling, KV-cache bytes, or p99 batching** problem you have lived.

## Official + reported process

Careers is mission + apply; **no** public SWE stage list. 2026 guides (techinterview.org, Dataford, Design Gurus). Treat stages as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30 min) | Motivation; which **track**; logistics |
| Tech screen (45–60 min) | Coding in a language you choose + domain chat (often staff) |
| Virtual onsite | Guides: domain depth (LPU tradeoffs); performance-sensitive code; behavioral (sometimes VP) |
| GroqCloud track | Batching, tail latency, expensive cold starts — closer to serving design |
| Offer | Startup equity — ask **409A / strike / options vs RSU** |

Guides: they **de-emphasize Blind-75** and read artifacts. Coding still exists — clean C++ under a **memory budget** beats a memorized graph puzzle. Confirm AI-in-pad with the recruiter.

## How this track differs

| vs NVIDIA / CUDA | vs OpenAI / Anthropic |
| --- | --- |
| Chip is **compiler-scheduled**; no cache hierarchy as the story | Product is **inference silicon + cloud**, not a closed model API |
| Official blog: model-independent compiler vs per-model GPU kernels | Design hour is **tokens / SRAM / interconnect**, not “design ChatGPT” |
| LPX is **alongside** GPUs (official careers), not “GPUs are dead” | Public work + first-principles tradeoffs beat OA grind |

## Coding and design flavor

Know **inference ≠ training** (latency / bandwidth vs throughput). Tradeoff they probe: static schedule hates **data-dependent control flow and dynamic shapes**; SRAM is fast and **small**. KV-cache arithmetic for context length is fair game. Kernel roles: ring buffers, false sharing, layout. Cloud: continuous batch vs p99 when one long prompt lands in a short batch. Related: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** inference company — a time you were bandwidth-bound, not compute-bound.
2. Token in → token out: where the time goes; what you attack first.
3. Tile a matmul into fixed on-chip SRAM; no DRAM cache behind it.
4. Compiler scheduled every op — what breaks when a branch depends on a value.
5. Questions for them: compiler vs cloud vs silicon, C++ bar, GitHub they actually read, equity type.

## Prep checklist

- [ ] Read [Careers](https://groq.com/careers) + [LPU explainer](https://groq.com/blog/the-groq-lpu-explained) in your own words (determinism, SRAM, assembly line)
- [ ] Recruiter: track, onsite mix, AI-in-pad, location
- [ ] One performance / memory-budget coding mock + KV-cache size arithmetic
- [ ] Clean public artifact that shows a real perf decision
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Groq](https://groq.com/careers) — accessed 2026-10-05
- [Company — Groq](https://groq.com/company) — accessed 2026-10-05
- [What is a Language Processing Unit? — Groq](https://groq.com/blog/the-groq-lpu-explained) — accessed 2026-10-05
- [Recruitment Fraud Awareness — Groq](https://groq.com/recruitment-fraud-awareness) — accessed 2026-10-05
- [Inside the Groq interview for compiler and inference roles — techinterview.org](https://www.techinterview.org/post/3233476417/groq-interview-compiler-inference-roles/) — accessed 2026-10-05
- [Groq Software Engineer Interview Guide 2026 — Dataford](https://dataford.io/interview-guides/groq/software-engineer) — accessed 2026-10-05
