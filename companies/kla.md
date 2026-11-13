# KLA engineering track

Sits beside [applied-materials.md](applied-materials.md) and [asml.md](asml.md): **process-control software** (inspection, metrology, yield analytics on the tool) — not the scanner that prints the wafer and not the etch/deposition tool that makes it. Official [Company](https://www.kla.com/company): *advanced inspection tools, metrology systems, process solutions and computational analytics that make electronics possible.* Recruiter confirms **inspection vs metrology vs HPC/image vs applications**, C++ vs C# vs Python, Milpitas / Ann Arbor / other sites, and **AI-off live** unless the interviewer invites a tool.

Typical timeline **~4–6 weeks** (Dataford, updated 2026-10). Concurrency: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Embedded cousin: [../roles/embedded.md](../roles/embedded.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (Values in Action)

Do **not** invent Amazon LPs. Official IR [Whistleblower Policy](https://ir.kla.com/corporate-governance/whistleblower-policy): **honesty and integrity** are the cornerstones of **Values in Action**; put them into action by asking questions, seeking guidance, and reporting concerns. Map **your** stories to that speak-up bar plus customer-tool ownership — not a five-word LP recitation from a prep blog.

| Official note | What they score |
| --- | --- |
| **Honesty / integrity** (IR) | You named a miss and the fix, not a slogan |
| **Values in Action** | Speak up when a measurement, recipe, or ship date is wrong |
| **Process control** (company) | Defect / CD / film / e-beam — a real yield problem, not “I like chips” |

“Why KLA?” that only says “Milpitas / semiconductors” fails. Name an **image-pipeline, real-time control, or metrology-repeatability** problem you have lived. Core SWE JDs: multi-threaded C++ / C#, Linux, tool software next to optics.

Official JD **Use of AI Statement** (Workday 2026): interviews seek *individual skills, problem-solving approach and authentic thinking*; **AI, recording, or other tools to generate responses are not permitted** unless pre-approved as an accommodation or **invited by the interviewer**.

## Official + reported process

No public numbered “how we hire” stage list. Dataford (updated 2026-10) + campus reports. Treat stages as **reported**. **Ask** OA vs live.

| Stage | Official / reported |
| --- | --- |
| Apply | [Careers](https://www.kla.com/careers) / Workday (`kla.wd1.myworkdayjobs.com`) |
| HR screen | Background, site, compensation, why process-control |
| OA / tech screen | HackerRank / HackerEarth **or** 30–45 min live DSA + OOP |
| Technical rounds | C++ / C# internals, multithreading, tool / image constraints |
| Presentation (reported) | 15–30 min past project for many experienced loops |
| Close | Behavioral / values; many lab roles are **on-site** |

Pair: [../general/low-level-design.md](../general/low-level-design.md), [../general/behavioral.md](../general/behavioral.md).

## How this track differs

| vs Applied Materials / ASML | vs FAANG |
| --- | --- |
| Product is **inspect / measure / analytics**, not etch chambers or scanners | Design is **image path / recipe / HPC**, not a social feed |
| Official **Values in Action** + **AI-off** pad | Concurrency + custom structures beat Blind-75 bingo |
| Physics + software in the same loop | Interviewer extends a defect / throughput constraint |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** process-control house — a measurement, false-positive, or lock you have lived.
2. Thread-safe producer/consumer for a camera / e-beam stream — [../general/cs-fundamentals.md](../general/cs-fundamentals.md).
3. LLD: recipe / measurement session object model; illegal states named.
4. Values: you spoke up when a number looked good and was wrong.
5. Confirm **AI-off** unless invited; ask inspection vs metrology vs HPC.

## Prep checklist

- [ ] Read [Company](https://www.kla.com/company) + current SWE JD (C++ / Linux / tool software) + [Values in Action note](https://ir.kla.com/corporate-governance/whistleblower-policy)
- [ ] Recruiter: product, language, OA vs live, **AI-in-pad (expect off)**, Milpitas vs other site
- [ ] One concurrency mock + one custom structure + one inspect/measure sketch
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Company — KLA](https://www.kla.com/company) — accessed 2026-11-13
- [Careers — KLA](https://www.kla.com/careers) — accessed 2026-11-13
- [Software Engineer (Metrology Systems) — KLA (Workday)](https://kla.wd1.myworkdayjobs.com/en-US/Search/job/Software-Engineer--Metrology-Systems-_2641468) — accessed 2026-11-13
- [Whistleblower Policy (Values in Action) — KLA IR](https://ir.kla.com/corporate-governance/whistleblower-policy) — accessed 2026-11-13
- [KLA Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/kla/software-engineer) — accessed 2026-11-13
