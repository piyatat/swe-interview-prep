# Hugging Face engineering track

Sits beside [ai-labs.md](ai-labs.md) and [scale-ai.md](scale-ai.md): **open-source ML platform (Hub / libraries / Spaces)**, not a closed foundation-model lab or a labeling shop. Official [Careers](https://huggingface.co/careers): mission is to **advance and democratize machine learning for everyone**; thousands of companies run HF tech in production. Apply via the official [Workable board](https://apply.workable.com/huggingface/). Recruiter confirms **Hub vs transformers / datasets vs storage vs product**, whether you get a **take-home**, and remote timezone overlap.

Typical timeline **~3 weeks** on average (2026 guides; take-home review can go quiet for two weeks — that is **not** auto-reject). Take-homes: [../general/take-homes.md](../general/take-homes.md). ML: [../roles/data-ml.md](../roles/data-ml.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (democratize ML)

Do **not** invent Amazon-style LPs. Hugging Face does **not** publish a numbered values table on Careers. Use the mission they print, then treat the rest as **reported**.

| Official / reported | What they score |
| --- | --- |
| **Democratize ML** (official careers) | Why **open** weights / tools, not “I like AI and you are hot” |
| **Show the work** (reported) | Public GitHub, Spaces, merged PRs — they read artifacts before the call |
| **Async / remote-first** (reported) | Written updates; you self-direct without a groomed backlog |
| **Scope the take-home** (reported) | A finished, runnable slice + README beats a 20-hour half-system |
| **Autonomy + opinion** (reported) | What you would change in the ecosystem if nobody assigned you |

“Why Hugging Face?” that only says “ChatGPT but open” fails. Name a **tokenizer, Hub card, dataset stream, or serving** problem you have lived. Guides: a merged PR in `transformers` / `datasets` / `accelerate` is stronger than a LeetCode week.

## Official + reported process

Careers lists openings; HF does **not** publish a full SWE stage list. 2026 guides (techinterview.org, TechPrep). Treat stages as **reported**.

| Stage | Official / reported |
| --- | --- |
| Apply | Official Workable board; they still read **cover letters** (reported) |
| People / recruiter (~30 min) | Why **open-source ML** (not a higher-paying lab API); remote autonomy |
| Hiring manager (45–60 min) | Depth on work you shipped; how you scope ambiguity |
| Take-home (centerpiece) | Team-shaped: bug in a real repo, dataset card, small library feature, Spaces demo. Guides: **4–8 hours** over a week, **no countdown** |
| Walkthrough (~60 min) | Defend tradeoffs; what you would do with another week |
| Team / panel | Collaboration; sometimes a cofounder on senior / research-adjacent |
| Offer | Location-adjusted; **ask 409A / strike / options vs RSU / exercise window** |

Guides disagree on “2–4 vs 5 stages” because some loops skip a live coding hour entirely. Confirm with the recruiter. Most engineering tracks: **no FAANG onsite**, **no Blind-75 pad**.

## How this track differs

| vs OpenAI / Anthropic / Perplexity | vs FAANG |
| --- | --- |
| Product is the **Hub + libraries**, not a closed model API | Take-home **is** the interview; LeetCode grind is the wrong week |
| Official mission is **democratize ML** | Public artifacts are the screen |
| Flat / async (reported) | Quiet after homework is normal, not rejection |

## Coding and design flavor

Reported technical talk is **practical Python**: `from_pretrained` cache miss, fine-tune OOM arithmetic, streaming `datasets`, fast vs slow tokenizers, Hub markdown that renders locally but breaks on the site. Design (when present): RAG, serving, cost. Related: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** OSS ML company — a library or Hub issue you filed or fixed.
2. Take-home: ship something that **runs in one command**; write the assumptions you skipped.
3. Walkthrough: 7B full fine-tune OOM on one 80GB card — do the memory arithmetic, then name LoRA / checkpointing / ZeRO.
4. Culture: a time you proposed direction without a ticket.
5. Questions for them: which repo, take-home hours, live pad or not, timezone, equity type.

## Prep checklist

- [ ] Read [Careers](https://huggingface.co/careers) + browse the team’s GitHub before the first call
- [ ] Recruiter: take-home vs live, team, timezone, AI-on-homework policy
- [ ] One scoped take-home rehearsal (README + tests + “what I skipped”)
- [ ] Optional: one new-contributor PR in a repo you would maintain
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Hugging Face Careers](https://huggingface.co/careers) — accessed 2026-10-04
- [Hugging Face jobs — Workable](https://apply.workable.com/huggingface/) — accessed 2026-10-04
- [Getting Hired at Hugging Face Without a LeetCode Grind — techinterview.org](https://www.techinterview.org/post/3233476859/hugging-face-interview-process/) — accessed 2026-10-04
- [Hugging Face's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/hugging-face-interview-process) — accessed 2026-10-04
- [Hugging Face Interview Process — FinalRound AI](https://www.finalroundai.com/blog/hugging-face-interview-process) — accessed 2026-10-04
