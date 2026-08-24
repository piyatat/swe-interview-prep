# AI lab track (OpenAI, Anthropic)

Sits beside [faang-big-tech.md](faang-big-tech.md) and [product-companies.md](product-companies.md): **production engineering bar plus mission/values**, with **AI-infra-shaped** design. Confirm the exact mix with the recruiter — Applied vs Safety vs Research (OpenAI) and team-matching after the loop (Anthropic) change the onsite.

Typical timeline **4–8 weeks** (OpenAI) or **4 weeks to 3+ months** (Anthropic, often waiting on references / match). Generic Blind-75-only prep leaves the values and work-trial rounds underprepared.

## How this track differs

| vs FAANG | vs Stripe/Uber-style product |
| --- | --- |
| Mission / safety questions are **hard filters**, not soft culture add-ons | Coding is often **progressive systems** (KV store, iterator, TTL) not calendar DSA |
| Design is **inference, serving, evals, retrieval** — not “design Twitter” | Take-home or OA is a **gate**, not a warmup |
| Team match may happen **after** hire decision | Recruiter already probes “why this lab” |

Also study [../general/take-homes.md](../general/take-homes.md), [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md), and [../roles/data-ml.md](../roles/data-ml.md) (LLM serving / RAG).

## OpenAI (official process + 2026 candidate notes)

**Official shape:** recruiter → skills assessment (pair coding, take-home, or test — **varies by team**) → **4–6 hours** of final interviews with 4–6 people. Engineering finals score **design, code quality, performance, tests**, plus communication. Virtual by default; SF onsite optional.

**Reported 2026 SWE pattern** (guides; confirm with recruiter): 30 min recruiter → 60 min **progressive** live coding → **48 h paid NDA work trial** (reliability + tests + write-up, then a line-by-line debrief) → 60 min system design → 45 min behavioral / mission → offer + team matching.

| Round | What they score |
| --- | --- |
| Recruiter | Why OpenAI (not “AI is hot”); level band; timing |
| Live coding | Clean working code **per gate**; extend under new constraints |
| Work trial | Scope, tests, documented assumptions on an under-specified brief |
| Design | GPU/KV-cache/streaming/moderation-shaped answers, not generic feeds |
| Behavioral | Ownership + a **specific** opinion on the Charter / deployment tradeoffs |

**Prep:** progressive “build then extend” (LRU, time-based KV, resumable iterator, rate limiter). Treat the trial like production: README is a deliverable. Mission answers that only say “safe AGI” fail; name a real tension.

## Anthropic (official process + values gate)

**Official:** Google Meet; technical roles use **Colab / CodeSignal**; you **may look things up** but must be fluent in syntax. About half of technical staff had **no prior ML**; apply as engineer if that is your background. **No internships** (as of careers FAQ). Recruiter email is `@anthropic.com` only.

**AI policy (Jul 2025 guidance):** Claude for **prep and polish** of *your* drafts; **no invented experience**. Take-homes **without** Claude unless the prompt allows it. Live interviews **no AI** unless they say otherwise.

**Reported SWE pattern:** CodeSignal OA (~90 min, 4 escalating levels; candidates cite ~520+ to advance) → recruiter → HM judgment screen → 4–5 onsite rounds. **Dedicated ~45 min values round** is the common filter: rehearsed STAR + flattery fail; **specific, skeptical** views on safety pass. They expect you to have read **Core Views on AI Safety** and the **Responsible Scaling Policy** and to be able to **push back**.

Team placement often happens **after** the technical loop + references (weeks). Design prompts: LLM serving, retrieval/embeddings, model-behavior monitoring; concurrency shows up outside “the design round.”

## Shared prep checklist

- [ ] Recruiter: AI policy, OA vs live vs paid trial, values round or not, team vs post-loop match
- [ ] One **progressive** coding mock (level 1 works before you start level 4)
- [ ] One **AI-infra** design: serving **or** evals **or** retrieval (match the lab)
- [ ] Primary docs: OpenAI interview guide + Charter; Anthropic careers, candidate AI guidance, Core Views, RSP
- [ ] Values: 2–3 true stories only you could tell — not a polished LP bank

## Sample questions

1. “Why this lab, not the other?” — product velocity vs safety-first framing; pick honestly.
2. In-memory KV: GET/SET, then TTL, then snapshot — **working at each gate**.
3. Design inference serving with batching, KV cache, and a safety/moderation path.
4. Work-trial debrief: why this retry/DLQ choice; what you would not build in 48 h.
5. Values: a time you changed your mind; a genuine critique of the company’s public stance.

## Sources

- [OpenAI interview guide](https://openai.com/interview-guide/) — accessed 2026-08-24
- [Anthropic careers — How we hire](https://www.anthropic.com/careers) — accessed 2026-08-24
- [Guidance on Candidates' AI Usage — Anthropic](https://www.anthropic.com/candidate-ai-guidance) — accessed 2026-08-24
- [Core Views on AI Safety — Anthropic](https://www.anthropic.com/news/core-views-on-ai-safety) — accessed 2026-08-24
- [Responsible Scaling Policy (v3.1 PDF) — Anthropic](https://www-cdn.anthropic.com/files/4zrzovbb/website/bf04581e4f329735fd90634f6a1962c13c0bd351.pdf) — accessed 2026-08-24
- [OpenAI vs Anthropic SWE interview — SpaceComplexity](https://spacecomplexity.ai/blog/openai-vs-anthropic-interview) — accessed 2026-08-24
- [OpenAI SWE interview (2026) — Interview Coder](https://www.interviewcoder.co/blog/openai-software-engineer-interview) — accessed 2026-08-24
- [Anthropic SWE interview — IGotAnOffer](https://igotanoffer.com/en/advice/anthropic-software-engineer-interview) — accessed 2026-08-24
