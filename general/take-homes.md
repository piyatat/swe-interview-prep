# Take-home assignments (2026)

Most companies **kept** take-homes but **changed** them: shorter scope, explicit AI policy, README-as-signal, and a **live debrief** that scores whether you understand the artifact. Startup loops still use them heavily; see [../companies/startup.md](../companies/startup.md) for stage-specific flavor.

**Ask the recruiter** before you start: time box, AI rules, rubric, and whether a walkthrough is scheduled.

## What changed

| Then (pre-2024) | Often now (2025–2026) |
| --- | --- |
| 6–8+ hour “build an app” | **2–4 hour** cap; 90–120 min of productive core |
| Artifact is the grade | Artifact is the **conversation starter** |
| Implicit “no help” | AI **required / optional-disclose / prohibited** |
| Ghost after submit | 30–60 min debrief + live extension |

Formats that still work when AI can generate CRUD: **extend a stub repo**, **review a 200–400 line PR**, or **fix a seeded bug** — then defend it live.

## AI policy (follow it literally)

| Policy | What to do |
| --- | --- |
| Required / “use your job tools” | Use AI; be ready to explain verification |
| Optional + disclose | Use if useful; README “AI notes” (where / what you checked) |
| Prohibited | Unaided only — mismatch is a reject |

Reviewers assume assistance exists. They score **judgment, tests, edges, and live extension**, not whose fingers typed the first draft.

## README is load-bearing

Write this even if the prompt forgets to ask:

1. What you built and how to run (**one command**).
2. Design choices and **why not** the alternative.
3. What you **cut** for time; next 4 hours.
4. Hours actually spent (transparency > heroics).
5. AI notes if policy allows/requires: prompts are optional; **what you verified** is not.
6. Tests: happy path + one real edge.

A working **subset** beats a broken “full” feature. Going ~50% over the stated time is common; **2×** usually means you missed scope.

## How they score you

Typical analytic rubric (sometimes shared up front):

| Criterion | Strong signal |
| --- | --- |
| Correctness | Stated cases work; 1–2 extra edges noted |
| Judgment | Named tradeoffs reflected in the code |
| Communication | Readable modules, honest README |
| Extensibility | Teammate could add a feature without rewrite |
| Debrief | Can extend **your** code under a new requirement |

Staff-flavored extras (mention even if unimplemented): observability, deploy, security, cost.

## Live debrief — practice this

1. **Walkthrough** (10–15 min) — structure, cuts, what you distrust.
2. **Deep dive** — “why this structure?”, “10× input?”, “show a weak area.”
3. **Live extension** — add a small requirement in the editor.

Failure mode: pasted output you cannot modify. Success mode: you caught an AI mistake and can show the fix.

## Candidate hygiene

- Clarify ambiguity **once** (email/Slack) before over-building.
- Time-box; log hours; do not unpaid-10-hour a “2-hour” prompt — decline or ask to narrow.
- Paid stipend ($200–$400) is a positive employer signal, not a requirement to accept a 10-hour ask.
- Decline politely if the ask is unbounded or reputation is poor.

## Related

- [ai-assisted-rounds.md](ai-assisted-rounds.md) — live AI-collaborative formats
- [../companies/startup.md](../companies/startup.md) — take-home as the technical screen

## Sources

- [AI-Era Take-Home Assignments 2026 — techinterview.org](https://www.techinterview.org/post/3233475330/ai-era-take-home-assignments-2026-how-they-changed/) — accessed 2026-08-22
- [Engineering Take-Home Assignments in 2026 — JobsByCulture](https://jobsbyculture.com/blog/engineering-take-home-assignment-design-2026) — accessed 2026-08-22
- [Engineering take-home assignments in 2026 — FlowVerify](https://www.flowverify.co/blog/take-home-engineering-2026) — accessed 2026-08-22
- [AI-resistant take-home design — HackerEarth](https://www.hackerearth.com/blog/how-to-design-a-take-home-coding-assignment-that-ai-tools-cannot-complete-for-your-candidate) — accessed 2026-08-22
