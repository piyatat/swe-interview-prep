# Debugging / code-comprehension rounds

A growing 2026 filter: you get an **unfamiliar repo or a broken snippet**, failing tests or a vague symptom, and 45–60 minutes to **reproduce → hypothesize → fix → verify**. Distinct from writing a solution from scratch. Ask the recruiter whether AI is allowed.

Related: [ai-assisted-rounds.md](ai-assisted-rounds.md) (tool policy) and [take-homes.md](take-homes.md) (async cousin).

## What interviewers score

| Signal | Strong | Weak |
| --- | --- | --- |
| **Orient** | Entry point, tests, one happy-path trace | Linear read of every file |
| **Hypothesis** | Expected vs actual; one variable per check | Edit on a hunch; shotgun prints |
| **Narrow** | Smallest failing input / layer | Rewriting the module |
| **Verify** | Re-run tests; name remaining risk | “Looks fixed” without evidence |
| **Narrate** | What you know, what you check next | Silent scrolling |

Google’s 2026 code-comprehension pilot (select US teams) and Meta’s AI-enabled loop still score **human-led judgment** — AI is an assistant, not the author.

## 45-minute loop (say it out loud)

1. **Symptom** — what is wrong in user terms? Which test is red?
2. **Reproduce** — smallest input; note environment (seed, clock, locale).
3. **Map** — request/command path; ignore unrelated packages.
4. **Hypothesis** — “I think X because Y; I’ll check Z.”
5. **One experiment** — breakpoint, log, or a tighter test. Do not change two things.
6. **Minimal patch** — match existing style; no drive-by refactors.
7. **Regression** — suite green; name an edge you did **not** prove.

If AI is allowed: prompt for a **subtask** (“explain this function”, “list callers of `settle`”). Validate every suggestion against the repo. Accepting a confident wrong answer is a common fail.

If AI is off (still common): same loop — paper/Google Doc review of ~200 lines happens at some levels.

## Bug classes that recur

Off-by-one / slice bounds · comparison flipped · mutate-while-iterate · early return skipping work · integer vs float division · shadowed locals · race / wrong await order · money or timezone rounding · swallowed errors · pagination cursor inclusive/exclusive.

Do not memorize a script — recognize the **class**, then prove it.

## Practice that transfers

- Clone a mid-size OSS repo; pick a real issue; time-box 45 min; narrate.
- `git bisect` a known regression once so the muscle is there.
- Plant 2–3 logic bugs in a repo you wrote last year; debug without rereading the design.
- If the company names a model (e.g. Gemini at Google), practice **that** tool on debug/review tasks.

LeetCode volume barely moves this skill.

## Sample prompts

1. “Three invoice tests are red — find and fix; don’t change the public API.”
2. “This handler 500s under concurrent checkout — hypothesize before editing.”
3. “Review this 80-line PR; list bugs you’d block on, then patch one.”
4. “Add a failing test that isolates the bug, then the smallest fix.”

## Sources

- [The debugging interview — techinterview.org](https://www.techinterview.org/post/3233476091/debugging-interview-format/) — accessed 2026-08-23
- [Google's AI-Assisted Coding Interview (2026) — Exponent](https://www.tryexponent.com/blog/google-ai-coding-interview) — accessed 2026-08-23
- [AI-assisted technical interviews in 2026 — Cadence](https://cadence.withremote.ai/blog/ai-technical-interviews) — accessed 2026-08-23
- [Debugging Interviews in 2026 — Interview AiBox](https://interviewaibox.co/en/blog/real-work-technical-screen-debugging-interview-2026) — accessed 2026-08-23
- [Live coding in a real codebase (2026) — gitGood](https://gitgood.dev/blog/live-coding-real-codebase-interview-format-2026) — accessed 2026-08-23
