# Palantir engineering track

Sits beside [product-companies.md](product-companies.md) and [databricks.md](databricks.md): **data platforms (Gotham / Foundry / AIP)** plus a loop built around **published competencies**, not a standard FAANG slate. Official careers page: interview **count and format are personalized**; everyone starts with **one or two phone interviews**, then an onsite (in-person or virtual). Recruiter is the source of truth for **Dev vs Delta** and AI policy.

Typical timeline **~3–4 weeks** (guides). Confirm **SWE (Dev)** vs **Forward Deployed (Delta / FDSE)** before you prep — same engineering bar, different center of gravity.

## Official process (Getting Hired + phone-interview guide)

| Stage | Official note |
| --- | --- |
| Phone (1–2 × 20–45 min) | Background, interest in Palantir; **engineers get a coding question**. HackerRank or Google Docs may be used. |
| Onsite | Personalized mix; talk through approach; **ask clarifying questions** (they name this as how they work). |
| After | Response often **within 1–2 weeks**; they may add another phone or invite onsite. |

They publish **six competency guides** on Getting Hired (read them; do not treat third-party round names as official):

| Official competency | What to show |
| --- | --- |
| The Phone Interview | Quiet setup, think out loud, start simple then expand |
| Writing Good Code | Readable, working, tested-enough code |
| Analyzing Efficiency | Big-O plus a real bottleneck (I/O, copies, hot path) |
| Navigating Open-Ended Questions | Scope a vague prompt before you implement |
| Solving Technical Problems | Decompose; collaborate; take hints |
| Working Inside Existing Systems | Read, hypothesize, extend — do not rewrite from scratch |

**Official phone tips (summarized):** think out loud (they cannot see you); ask if anything is unclear; simple solution first; have questions about the work, not a generic “tech interview questions” list.

## Dev vs Delta (official blog)

Palantir’s own framing: **Dev** = Software Engineer on **Product Development** — one **platform capability**, many customers (Foundry / Gotham components). **Delta** = Forward Deployed Software Engineer — **one customer, many capabilities**; success is the customer’s outcome, not a generic roadmap. Same bar; people move between tracks. A third role (Deployment Strategist / “Echo”) is more product/strategy — not this page.

2020 hiring-blog (dated; still the official voice): they adapt the loop to **your** background; they ask about **real failures**; they want **value orientation** (why this model exists), not a clustering algorithm you cannot justify. Interactive “how would you approach this?” over trick brainteasers.

## How this track differs

| vs FAANG | vs Databricks / Snowflake |
| --- | --- |
| Motivation / mission is a **hard filter** at recruiter | Less lakehouse-internals trivia; more **ambiguity + existing systems** |
| Onsite assembled from a **menu**, not 2 coding + 1 design | Coding is practical; **decomp / re-eng / learning** are the brand |
| Behavioral is **inside every hour**, not one STAR panel | Design is data-integration flavored, not “design Twitter” |

Also study [../general/debugging-rounds.md](../general/debugging-rounds.md), [../general/low-level-design.md](../general/low-level-design.md), [../general/hiring-manager.md](../general/hiring-manager.md).

## Reported 2026 loop (guides; confirm)

Guides map official competencies onto named rounds. You typically get **three** of: **Decomposition**, Coding, System Design, **Re-engineering**, **Learning**, then often an HM close. Decomposition is the common high-weight hour.

| Reported round | Maps to | Score |
| --- | --- | --- |
| Decomposition | Open-ended questions | Scope entities, APIs, constraints; interviewer **changes the brief** |
| Re-engineering | Existing systems | Unfamiliar 200–500 lines; bug or extend; hypothesis → verify |
| Learning | Solving + existing systems | New API/docs in-session; absorb and apply (not prior trivia) |
| Coding | Writing good code + efficiency | Working code; Python common; language usually yours |
| Design | Technical problems | Data platforms, workflows, messy integrations |

Do **not** start writing classes in the first five minutes of decomp. Spend the opening on questions and a model; treat it as a **co-working session** (official blog + consistent reports).

## Sample prompts (shapes, not leaked puzzles)

1. “Why Palantir — and Dev vs Delta?” — specific product/mission, not “data is important.”
2. Vague domain: parking garage, field logistics, or a data collection workflow — **entities, invariants, APIs**, then a constraint lands.
3. Unfamiliar package-manager / query snippet: find the bug; then parallelize or cache correctly.
4. A time you failed and what you changed (they say they are **not** fishing for a success story).
5. Practical coding: parse / model a small system; extend when a new rule appears.

## Prep checklist

- [ ] Read Getting Hired + the six competency pages + Dev vs Delta blog
- [ ] Recruiter: Dev vs Delta, AI policy, onsite menu, HM after panel
- [ ] Two **decomp** mocks: 15 min of questions before code
- [ ] One **re-eng** mock on a repo you did not write ([debugging-rounds.md](../general/debugging-rounds.md))
- [ ] “Why this company” + one real failure, not a polished LP bank

## Sources

- [Getting Hired — Palantir Careers](https://www.palantir.com/careers/getting-hired/) — accessed 2026-08-30
- [The Phone Interview — Palantir Careers](https://www.palantir.com/careers/getting-hired/the-phone-interview/) — accessed 2026-08-30
- [Interviewing at Palantir — Palantir Blog](https://blog.palantir.com/interviewing-at-palantir-advice-from-palantirians-88444a90e7c4) — accessed 2026-08-30
- [Dev versus Delta — Palantir Blog](https://blog.palantir.com/dev-versus-delta-demystifying-engineering-roles-at-palantir-ad44c2a6e87) — accessed 2026-08-30
- [Palantir FDE interview — Exponent](https://www.tryexponent.com/guides/palantir-forward-deployed-engineer-interview) — accessed 2026-08-30
- [Palantir interview process — interviewing.io](https://interviewing.io/palantir-interview-questions) — accessed 2026-08-30
