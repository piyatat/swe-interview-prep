# AI-assisted interview rounds (2025–2026)

Companies diverged on AI in interviews: some **allow** tools and score collaboration; others run **AI-free** rounds as a baseline filter. **Ask the recruiter** before assuming.

## Formats you may see

| Format | What they score |
| --- | --- |
| **AI-collaborative coding** | Prompting, decomposition, verifying output, narration |
| **Code comprehension** | Navigate unfamiliar repo; find bug without writing from scratch |
| **Eval / test design** | Write tests that catch subtle AI-generated failures |
| **Classic DSA (AI-free)** | Unaided reasoning — still common at many companies |

## If AI is allowed

1. **Decompose** — small, reviewable chunks (“implement X in this file”), not “build the whole app.”
2. **Verify adversarially** — read diffs, run tests, hunt edge cases.
3. **Narrate** — interviewer must hear *why*, not only see generated code.
4. **Stay fluent unaided** — practice 2–3 weeks without AI before a major loop.

## If AI is prohibited

- Same Blind/Neetcode-style prep as pre-2024.
- No sneaking tools — detection risk outweighs benefit.
- Explain every line conversationally.

## Practice habits

- Use AI on **real repos** (bugfix, small feature), not only toy problems.
- Time-box **read-and-debug** sessions on open source.
- Practice **test-first** verification of generated patches.

## Sample prompts (comprehension / collaboration)

1. “This service returns 500 under load — find the bug and propose a fix.”
2. “Add retry with backoff to this client; don’t break idempotency.”
3. “Write tests that would catch an off-by-one in this parser.”
4. “Review this AI-generated PR — what would you block on?”

## Sources

- [Using AI Tools in Tech Interviews: 2026 Canon — techinterview.org](https://www.techinterview.org/post/3233474910/using-ai-tools-tech-interviews-2026-canon/) — accessed 2026-08-22
- [AI-Assisted Interviews Handbook — Vibe Engines](https://vibeengines.com/handbook/ai-assisted-interviews) — accessed 2026-08-22
- [Software Engineer Interview Prep — JobJourney](https://www.jobjourney.pro/interview-prep/software-engineer) — accessed 2026-08-22
