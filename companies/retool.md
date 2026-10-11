# Retool engineering track

Sits beside [figma.md](figma.md), [notion.md](notion.md), and [vercel.md](vercel.md): **internal-tools platform + reactive engine + untrusted JS**, not a generic CRUD SaaS slate. Official [Careers](https://retool.com/careers): founded 2017; **10,000+** orgs (Amazon, Stripe, Brex named) run production apps on business data with **real permissions**. Recruiter confirms **Apps vs Automations / Agent Platform vs Sandbox vs Cloud / Core Services**, TypeScript vs Go, and whether your eval is a take-home.

Typical timeline **~3–5 weeks** (2026 guides). Pair / applied: [../general/pair-programming.md](../general/pair-programming.md). Take-homes: [../general/take-homes.md](../general/take-homes.md). Graph cousin: [../answers/coding-course-schedule.md](../answers/coding-course-schedule.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official Careers publishes **who we are** and **how we work**. Map **your** stories.

| Official signal | What they score |
| --- | --- |
| **Ambitious** | Massive change, not incremental busywork |
| **Intensely curious** | Root-cause “why?”; fail fast / learn fast |
| **Energetic** | Urgency that ships, not motion |
| **Care deeply** | High bar because the work matters |
| **Obsess over customers** | Internal-ops users are the customer |
| **Move uncomfortably fast** | Action with purpose |
| **Act like an owner** | Optimize for Retool, not comfort |
| **Be demanding and supportive** | High bar **and** help people clear it |

“Why Retool?” that only says “I like low-code / I used the editor once” fails. Name a **reactive-eval, sandbox, connector, or agent-tool** problem you have lived.

## Official + reported process

Official Careers loop (some roles add or drop a stage; eval may be **before or after** onsite):

| Stage | Official / reported |
| --- | --- |
| Intro calls (official) | Recruiter **and** hiring manager — mutual fit, questions welcome |
| Technical evaluation or practical exercise (official) | Tailored to the role; “mirrors day-to-day work” |
| Onsite (official: **3–5** + a cross-functional partner) | They walk you through who / what in advance |

2026 TechInterview — treat extra split as **reported**: applied TS (dependency graph / safe-eval), one algo hour, reactive / connector / agent design, craft vs Airtable / Bubble, HM. Guides also mention a **4–6h** senior take-home — **ask**; do not assume a second unpaid project. Hybrid offices: SF, NYC, Salt Lake City, London (official).

## How this track differs

| vs Figma / Notion / Vercel | vs FAANG web |
| --- | --- |
| Official **practical eval** + small-team hybrid, not a puzzle gauntlet | Design is **reactivity / sandbox / connectors / agents**, not “design Twitter” |
| Untrusted customer JS is a daily constraint | “I only grind LeetCode” misses craft + customer empathy |
| Product opinions about low-code vs code are scored | Confirm AI-in-pad; agent teams ≠ editor teams |

## Coding and design flavor

Applied TypeScript: DAGs, cycle detect, incremental recompute, component trees. Design: isolate user JS (Worker / iframe / isolate), 60+ connectors behind one auth + cache + pagination shape, agent tool-calling with cost caps. Related: [../answers/coding-course-schedule.md](../answers/coding-course-schedule.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** surface (Apps vs Agents vs Sandbox) — portable “internal tools” is weak.
2. Live: recompute a formula DAG after one cell changes; name the cycle check first.
3. Design: timeout + memory-cap a customer snippet without trusting `eval`.
4. How-we-work: you were demanding **and** supportive on a review that slipped.
5. Questions for them: eval vs take-home, languages, AI-in-pad, team, office days.

## Prep checklist

- [ ] Read [Careers](https://retool.com/careers) (values + three-stage loop) and a current eng JD
- [ ] Recruiter: team, eval format, languages, unpaid take-home or not, AI policy
- [ ] One timed graph / topo pad + one sandbox or connector sketch
- [ ] Stories for curious / owner / demanding-and-supportive — **your** impact
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Join a small (but growing) team — Retool Careers](https://retool.com/careers) — accessed 2026-10-11
- [Software Engineer, Apps — Retool](https://retool.com/careers/software-engineer-apps--engineering--san-francisco-united-states) — accessed 2026-10-11
- [Retool Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/retool/) — accessed 2026-10-11
