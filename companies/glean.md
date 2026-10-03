# Glean engineering track

Sits beside [ai-labs.md](ai-labs.md) and [elastic.md](elastic.md): **enterprise Work AI / permission-aware search**, not a consumer answer engine or a foundation-model lab. Official [Careers](https://www.glean.com/careers) + [culture and values](https://www.glean.com/about/culture-and-values) are the culture source of truth. Official SWE postings: every hire completes a **brief AI-focused exercise or discussion** on how you think about, design, and use AI to drive impact — prior Glean use is **not** required. Recruiter confirms **Agents vs search vs infra vs ML**, hub, and AI-in-pad.

Typical timeline **2–5 weeks** (2026 guides). Search design: [../answers/system-design-search.md](../answers/system-design-search.md). LLM serving: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md). AI-on rounds: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (four “Make it” values)

Do **not** invent Amazon-style LPs. Use the official four.

| Official value | What they score |
| --- | --- |
| **Make it customer-driven** | Real admin / end-user / company pain — wow, then follow through |
| **Make it happen** | Dependable, gritty, bias to action; ship today without dropping the long game |
| **Make it better** | Owners; question the status quo; give and take feedback |
| **Make it together** | Integrity, transparency, trust, respect; diversity of thought |

Official careers also: **transparent by default**, hybrid (**four days** in office for most teams), learning stipend. Offices include Mountain View, SF, Bengaluru, Nashville, London, Sydney. “Why Glean?” that only says “enterprise ChatGPT” fails. Name a **ACL, freshness, connector, or retrieval-eval** problem you have lived.

## Official + reported process

Official postings lock the **AI exercise**. Glean does **not** publish a full stage list — remaining rows are **reported** (techinterview.org, 2026 guides). Confirm with the recruiter.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30 min, reported) | Background, motivation, logistics |
| Hiring manager (~45 min, reported) | Past projects, role fit, why Glean |
| Technical phone (~60 min, reported) | Coding + a short design conversation |
| Virtual onsite (reported) | Coding, **search / retrieval** design, often a timed **practical build**, behavioral |
| **AI-focused exercise** | Official: how you **think about, design, and use** AI — tools you already use are fine |
| ML / RAG hour (reported, ML track) | Retrieval quality + evals |
| Founder / exec (reported, senior+) | Judgment, bar |

Guides: medium coding; design is **hybrid index, permissions, freshness, latency** — surfacing a doc the user **must not** see is a fail. Practical build: ship a lot of working code against a clock. Treat extra hours as **reported**.

## How this track differs

| vs Perplexity / OpenAI | vs Elastic / FAANG |
| --- | --- |
| Official **AI fluency** gate on **every** SWE posting | Design is **tenant ACL + connectors**, not a public web index |
| Work AI for **one company’s** corpus | Reported practical build is a **speed / completeness** hour |
| Four named “Make it” values | Hybrid four-day office, not all-remote by default |

## Coding and design flavor

Reported coding: medium graphs / strings / concurrency, clean complexity. Design: permission-aware ranking, incremental crawl, ACL fan-out, stale embeddings, evals. Related: [../answers/system-design-web-crawler.md](../answers/system-design-web-crawler.md), [../roles/data-ml.md](../roles/data-ml.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Work AI — a permission or freshness miss you prevented.
2. AI exercise: a workflow you actually run with an agent — where you **verify**, not paste.
3. Design: query that must not leak a doc after an ACL revoke.
4. Values: Make it better — a time you asked for (or gave) direct feedback and changed the work.
5. Questions for them: AI exercise vs live pad, practical-build length, team (Agents / evals / connectors), hub.

## Prep checklist

- [ ] Read [Careers](https://www.glean.com/careers) (all four values) + [culture](https://www.glean.com/about/culture-and-values)
- [ ] Recruiter: AI exercise format, design vs build, language, office days
- [ ] One permission-aware search sketch + one timed implement
- [ ] STAR mapped to several “Make it” lines (not a slogan dump)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers at Glean](https://www.glean.com/careers) — accessed 2026-10-03
- [Culture and values — Glean](https://www.glean.com/about/culture-and-values) — accessed 2026-10-03
- [Software Engineer posting — Glean (AI exercise language)](https://job-boards.greenhouse.io/gleanwork/jobs/4713145005) — accessed 2026-10-03
- [What Glean’s engineering interview actually tests — techinterview.org](https://www.techinterview.org/post/3233476794/glean-engineering-interview/) — accessed 2026-10-03
- [Glean Interview Prep 2026 — JobsByCulture](https://jobsbyculture.com/blog/glean-interview-prep-2026) — accessed 2026-10-03
