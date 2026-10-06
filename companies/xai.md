# xAI engineering track

Sits beside [ai-labs.md](ai-labs.md) and [spacex.md](spacex.md): **Grok + Colossus training / serving**, not an OpenAI-style work-trial lab or a rocket-software loop. Official [Careers](https://x.ai/careers): mission is **understand the universe** and **build AI that advances humanity**. Official process is short and engineer-run: **technical team** reviews the CV + **statement of exceptional work**; they **generally do not use recruiters for assessments**. Recruiter (if you have one) still confirms **research vs SWE vs infra / Colossus**, language (Python / Rust / C++), and Palo Alto / Seattle / Tennessee / London in-person.

Typical timeline **~1 week** for the published main process; 2026 guides often see **3–6 weeks**. Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). LLM serving: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (exceptional work + urgency)

Do **not** invent Amazon-style LPs. xAI does **not** publish a numbered values table. Use careers + the [Colossus](https://x.ai/colossus) page.

| Official signal | What they score |
| --- | --- |
| **Curiosity, commitment, urgency** (careers) | Ship under incomplete info — not “I like AI labs” |
| **Statement of exceptional work** (careers) | One artifact you can defend at implementation depth |
| **Engineers assess applications** (careers) | Technical substance over recruiter polish |
| **In-person prioritized** (careers) | Fast collaboration; confirm the site |
| **Colossus pace** (official compute page) | 200k-GPU cluster built in months — infra candidates talk power / fabric, not slogans |

“Why xAI?” that only says “Grok is funny” fails. Name a **training, serving, data-firehose, or cluster** problem you have lived. Guides: mission framing is **lighter** than Anthropic safety / OpenAI AGI — pace and ownership still filter.

## Official + reported process

Careers publishes four stages. Job posts and 2026 guides (Exponent, techinterview.org) add flavor. Treat extra rounds as **reported**.

| Stage | Official / reported |
| --- | --- |
| Application | CV + **statement of exceptional work** — technical team reads both |
| Screening | Official: short fit + technical questions. Guides: **15–30 min engineer** call (sometimes no recruiter) |
| Technical interviews | Official: deep expertise. Job posts: coding (language of choice) + **systems hands-on** + **project deep-dive** + team meet |
| Offer | Official: exceptional skills + mindset. Guides: equity is **private / tender** — ask structure |

Guides: coding is **applied class design / infra** with extension follow-ups, not Blind-75 theater. AI-in-pad is **often allowed with verification** — confirm the week you interview. New-grad path may add a take-home; do not assume it.

## How this track differs

| vs OpenAI / Anthropic | vs Groq / Cerebras |
| --- | --- |
| Official **exceptional-work** essay replaces a long recruiter funnel | Product is **frontier model + GPU cluster**, not a custom inference chip |
| Published goal: finish the **main process in a week** | Design hour is **Grok / X firehose / Colossus**, not SRAM tiling |
| Less values-panel theater; more **build-and-debug live** | In-person across PA / Seattle / Memphis / London |

## Coding and design flavor

Know **training ≠ serving**. Fair prompts: TTL / iterator / rate-limit class you must extend; inference batching across API + X; data pipeline from a real-time firehose; GPU cluster failure / rollback. Related: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** lab — a time you shipped when the spec moved under you.
2. Walk one exceptional project: what **you** owned, what broke, what you measured.
3. Coding: implement a small store; then add TTL / concurrency without a rewrite.
4. Design: serve one model to API + a real-time product surface; where p99 dies.
5. Questions for them: track, AI-in-pad, which site, equity type / tenders.

## Prep checklist

- [ ] Read [Careers](https://x.ai/careers) + [Colossus](https://x.ai/colossus); write the exceptional-work statement **before** mocks
- [ ] Confirm track, language, AI-in-pad, location
- [ ] One applied C++/Python class-design mock + one training / serving sketch
- [ ] Used Grok enough to have a concrete opinion if the role touches the product
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — xAI](https://x.ai/careers) — accessed 2026-10-06
- [Colossus — xAI](https://x.ai/colossus) — accessed 2026-10-06
- [xAI Interview Process 2026 — techinterview.org](https://www.techinterview.org/post/3233474930/xai-interview-process-2026/) — accessed 2026-10-06
- [xAI Software Engineer Interview Guide (2026) — Aced / Exponent](https://www.tryexponent.com/guides/xai-software-engineer-interview) — accessed 2026-10-06
- [xAI Exceptional Engineer (SWE) Interview Guide (2026) — Aced / Exponent](https://www.tryexponent.com/guides/xai-exceptional-engineer-swe-interview) — accessed 2026-10-06
