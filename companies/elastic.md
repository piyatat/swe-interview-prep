# Elastic engineering track

Sits beside [datadog.md](datadog.md) and [cisco.md](cisco.md): **Search AI — Elasticsearch / Kibana / Observability / Security**, not a consumer social loop. Official [How we hire](https://www.elastic.co/careers/how-we-hire): they call employees **Elasticians**; most interviews are **virtual**; dress is **As YOU, Are**. Recruiter confirms **Search vs Observability vs Security vs platform**, Java vs Go vs TypeScript, whether you get a **panel presentation** or **proctored coding**, and the live **AI** rule.

Typical timeline **~4 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Search design: [../answers/system-design-search.md](../answers/system-design-search.md). Metrics: [../answers/system-design-metrics.md](../answers/system-design-metrics.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official Source Code (ideas, not a poster LP list)

Official [Our Source Code](https://www.elastic.co/about/our-source-code): “a set of **ideas** rather than a statement of values.” How we hire tells you to learn it. Do **not** invent extra pillars.

| Official idea | What they score |
| --- | --- |
| **Customer, 1st** | Users and community in the product story |
| **It, Depends** | Real tradeoffs; start answers with constraints |
| **Progress, Simple Perfection** | Move; perfection is not a destination |
| **01.02, /FORMAT** | Distributed-by-intention; assume no malice in text |
| **As YOU, Are** | Authentic you; no arbitrary mold |
| **Humble, Ambitious** | Ambition without being an asshole |
| **Speed, Scale, Relevance** | Search DNA — fast, at scale, relevant |

Also on the page: **Home, Dinner** (life balance), **Space, Time** (room to dream / fail). “Why Elastic?” that only says “I used ELK once” fails. Name a **relevance, shard, or ingest** problem you have lived.

## Official AI policy (do not guess)

Official [AI guidelines](https://www.elastic.co/blog/ai-guidelines-interview-process) (2026-07-16) + How we hire FAQ:

| Allowed | Not allowed |
| --- | --- |
| Polish resume; organize thoughts; brainstorm **before** the loop | Invent experience; let a model do the **thinking** |
| Disclose how prep AI shaped a presentation | **Live** AI in human-to-human interviews |
| Fix hallucinations about you or Elastic before send | Covert interview copilots |

Official: conversations stay **human-to-human**. They say they use **AI monitoring** against deception. Misrepresentation can **disqualify** or later **terminate**. Opposite of [canva.md](canva.md) (they **insist** on tools).

## Official + reported process

Official How we hire — stages for **most** roles; order and which technical flavor you get are **role-dependent**.

| Stage | Official note |
| --- | --- |
| Apply | [elastic.co/careers](https://www.elastic.co/careers); tailor to **that** JD; cover letter optional |
| Recruiter screen | **~30 min** phone / Zoom — intro + your questions |
| Department interviews | **45–90 min**, multiple: peer, HM, leadership |
| Panel presentation | **45–90 min**, **may** — role-play / product demo |
| Technical assessment | **60–90 min**, **some** roles: product **deep dive**, architecture, **or** timed coding with a **proctor** |
| Decision | Internal review; offer if best fit; may take extra days if a slate is open |

Guides (2026: TechPrep) — treat as **reported**: remote loop, practical coding over olympiad puzzles, a dedicated Source Code behavioral. Confirm OA vs live vs presentation with the recruiter.

## How this track differs

| vs Datadog | vs Canva / Meta AI hour |
| --- | --- |
| Official **Source Code** + **human-to-human** AI ban | Canva **requires** Copilot/Cursor on the coding hour |
| Design is **inverted index / shards / relevancy**, not only TSDB | Distributed-by-intention (Home, Dinner) vs hub hybrid |
| Optional **panel / deep dive** on Elastic products | Reciting Lucene trivia without a user problem fails |

## Coding and design flavor

Live problems look like **parsers, aggregations, or concurrent maps** — then “what happens at 10× shards.” Design: ingest → analyze → inverted index + doc store → query / aggregations; say **relevance vs recall**, refresh vs refresh-interval, heap vs doc-values. Related: [../answers/system-design-search.md](../answers/system-design-search.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Elastic product (Search / Observability / Security) — portable “I like search” is weak.
2. Live: parse or aggregate a stream; then concurrency / memory.
3. Design: multi-tenant logs or product search; where does a high-cardinality field explode.
4. Source Code: a time “it depends” beat a slogan, or you stayed humble under ambition.
5. Product deep dive: what you actually know about Elasticsearch vs marketing.

## Prep checklist

- [ ] Read [How we hire](https://www.elastic.co/careers/how-we-hire) + [Source Code](https://www.elastic.co/about/our-source-code) + [AI guidelines](https://www.elastic.co/blog/ai-guidelines-interview-process)
- [ ] Recruiter: org, coding vs deep dive vs panel, AI-off confirmation, timezone overlap
- [ ] One practical coding mock + one search/metrics design
- [ ] Two STAR stories mapped to Source Code ideas (not a recitation)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How we hire — Elastic](https://www.elastic.co/careers/how-we-hire) — accessed 2026-09-21
- [Our Source Code — Elastic](https://www.elastic.co/about/our-source-code) — accessed 2026-09-21
- [Elastic’s guide to AI in the interview process](https://www.elastic.co/blog/ai-guidelines-interview-process) — accessed 2026-09-21
- [Elastic's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/elastic-interview-process) — accessed 2026-09-21
- [Elastic Careers](https://www.elastic.co/careers) — accessed 2026-09-21
