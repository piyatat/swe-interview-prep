# Harvey engineering track

Sits beside [ai-labs.md](ai-labs.md) and [glean.md](glean.md): **legal / professional-services AI** (document vault, citations, agents), not a foundation-model lab and not consumer search. Official [Careers](https://www.harvey.ai/careers) + [values](https://www.harvey.ai/blog/harvey-values): application-layer product for law firms and in-house teams. Recruiter confirms **product vs AI platform vs research eng**, hub (SF / NYC / London / … vs marked-remote), and **AI-in-pad**.

Typical timeline **~2–5 weeks** (2026 reports). Retrieval / ACL design: [../answers/system-design-search.md](../answers/system-design-search.md), [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md). AI-on rounds: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (three values)

Do **not** invent extra LPs. Official founders’ post + Careers.

| Official value | Careers / blog one-liner |
| --- | --- |
| **Decisiveness** | Bias for action; “don’t take the square root of the weather” — check, move, avoid overanalyzing non-critical work |
| **Simplicity** | Tech and client problems are complex; **solutions can’t be**. Complexity appreciates; simplicity scales |
| **Job’s Not Finished (JNF)** | Intense; never satisfied with the status quo; earn the next opportunity |

Official COO FAQ (2026-08): ~**1,600 associates** across **16** locations; employees are **associates**; **3+ days** in office for most roles (remote is labeled on the posting). Culture is **fast + legally rigorous** — attorneys on staff, not a generic “AI startup vibe.” “Why Harvey?” that only says “legal AI is hot” fails. Name a **citation, ACL, eval, or provenance** problem you have lived. You do **not** need to be a lawyer; you do need curiosity about how lawyers actually work.

## Official + reported process

Official Careers / landing-a-job FAQ discuss **culture and how they hire people**, not a fixed SWE stage list. 2026 reports (Land the Lab, PracHub, Aceoffer) — treat **order and puzzles as reported**. Confirm the week you interview.

| Stage | Official / reported |
| --- | --- |
| Recruiter | Background, intensity / office days, team |
| Coding phone (~60 min, reported) | CoderPad; **multi-part practical** (document / formula / citation-style), not a random Blind-75 one-off |
| Onsite (reported) | Coding + **LLM-application / RAG / ACL** design + project deep dive + values |
| AI-in-pad | **Ask** — one 2026 thread says some onsites are now AI-assisted |

Harvey does **not** publish one sequence. PracHub: confirm team, level, assessment, and AI instructions with your contact. Guides: finishing **every part** of the coding problem and the **permission-aware design** decide more loops than a single clever algorithm.

## How this track differs

| vs OpenAI / Anthropic | vs Glean / Sierra |
| --- | --- |
| Application layer for **law firms + in-house**; not training a frontier model | Design is **citations + matter ACL + versioned sources**, not only enterprise search |
| Official three values; JNF is how founders sign emails | Reported coding is **practical multi-part**, not calendar DSA |
| Hybrid offices; intense on purpose (official FAQ is blunt) | “I only grind LeetCode” misses provenance / eval |

## Coding and design flavor

You do not need bar-exam knowledge. You do need to talk like production retrieval: tenant/matter isolation, **immutable versions**, citation spans that actually appear in the source, revoke-then-deny, abstain when evidence is missing. Related: [../roles/data-ml.md](../roles/data-ml.md), [../answers/system-design-file-storage.md](../answers/system-design-file-storage.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** legal AI — a citation or ACL miss you prevented, not “LLMs are cool.”
2. Practical: lookup + cite a versioned document; deny cross-tenant; fail closed after revoke.
3. Design: RAG over a firm corpus; what happens when a source is updated or a grant is pulled mid-generation.
4. Decisiveness vs simplicity on the same project — you shipped a smaller slice instead of boiling the ocean.
5. Questions for them: AI-in-pad, office days, platform vs product team, how they score JNF.

## Prep checklist

- [ ] Read [Careers](https://www.harvey.ai/careers) + [values](https://www.harvey.ai/blog/harvey-values) + [landing-a-job FAQ](https://www.harvey.ai/blog/landing-a-job-at-harvey)
- [ ] Recruiter: pad vs AI-assisted, design prompt, hub vs remote, recorder
- [ ] One timed practical implement + one permission-aware retrieval sketch + three STARs tagged to the three values
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Harvey](https://www.harvey.ai/careers) — accessed 2026-11-05
- [Harvey's Values — Harvey](https://www.harvey.ai/blog/harvey-values) — accessed 2026-11-05
- [The Ultimate Guide to Landing a Job at Harvey — Harvey](https://www.harvey.ai/blog/landing-a-job-at-harvey) — accessed 2026-11-05
- [Harvey interview process and questions — Land the Lab](https://landthelab.com/companies/harvey) — accessed 2026-11-05
- [Harvey Software Engineer Interview Guide 2026 — PracHub](https://prachub.com/resources/harvey-software-engineer-interview-guide-2026-coding-legal-ai-systems-and-product-judgment) — accessed 2026-11-05
