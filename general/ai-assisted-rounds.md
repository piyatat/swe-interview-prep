# AI-assisted interview rounds (2025–2026)

Companies diverged on AI in interviews: some **allow** tools and score collaboration; others run **AI-free** rounds as a baseline filter. **Ask the recruiter** before assuming. Karat’s 2026 leader survey: **62% still prohibit** AI in technical interviews, while **71%** say AI makes skills **harder to assess**. Formation summarizing CoderPad’s 2026 hiring survey: **46%** allow AI (broadly or with constraints), **20%** decide case-by-case, **34%** ban — catching **AI mistakes** is a top allowed-round signal.

Official Google (Pichai, Cloud Next, 2026-04-22): **75% of new code at Google is AI-generated and approved by engineers** (up from 50% the prior fall). That is why some loops added a **human-led, AI-assisted** hour — not because unaided DSA vanished.

## Formats you may see

| Format | What they score |
| --- | --- |
| **AI-collaborative coding** | Prompting, decomposition, verifying output, narration |
| **Code comprehension** | Navigate unfamiliar repo; find bug; optional approved assistant (Google Gemini pilot; Meta multi-model pad) |
| **Eval / test design** | Write tests that catch subtle AI-generated failures |
| **Classic DSA (AI-free)** | Unaided reasoning — still common; often **paired** with one AI hour |
| **Open-ended engineering** | Vague one-liner; they score **clarifying questions** more than the final function |

## If AI is allowed

1. **Clarify before you prompt** — window vs token bucket, empty / `limit=0`, single-process vs distributed. The model will invent a spec if you do not.
2. **Name the algorithm** — tell the assistant which design to build; be ready to defend why not the other two.
3. **Verify adversarially** — read diffs, check big-O vs the actual loop, hunt edge cases. Formation: generated docstrings lie.
4. **Bounded steps** — “class + prune,” then tests; do not “build the whole app.”
5. **Narrate** — why this prompt, what you expect, what you rejected.
6. **Stay fluent unaided** — most FAANG loops still keep **at least one** AI-free coding hour. Practice 2–3 weeks without tools before a major loop.

## If AI is prohibited

- Same Blind/Neetcode-style prep as pre-2024.
- No sneaking tools — Karat: leaders already assume many candidates try anyway; detection risk outweighs benefit.
- Explain every line conversationally.

## What platforms now instrument

HackerRank (2026 docs, via Formation): AI-assisted interviews in an IDE with completion, file-aware chat, Plan / Agent modes so the interviewer sees **how** you work. Some vendors score “strategic use vs overreliance.” Treat the chat transcript as part of the packet.

## Practice habits

- Use AI on **real repos** (bugfix, small feature), not only toy problems.
- Time-box **read-and-debug** sessions on open source (Google’s new hour is comprehension-first).
- Practice **test-first** verification of generated patches.
- Keep a list of **errors you caught** — that is the skill they grade.

## Sample prompts (comprehension / collaboration)

1. “This service returns 500 under load — find the bug and propose a fix.”
2. “Add retry with backoff to this client; don’t break idempotency.”
3. “Write tests that would catch an off-by-one in this parser.”
4. “Review this AI-generated PR — what would you block on?”
5. “Vague one-liner on the pad — ask three constraints before any prompt.”

## Also study

- [debugging-rounds.md](debugging-rounds.md) — repo debug without (or with) an assistant
- [code-review-rounds.md](code-review-rounds.md) — block vs nit on generated diffs
- [take-homes.md](take-homes.md) — async signal is the **fastest** to rot under AI
- [coding-patterns.md](coding-patterns.md) — still needed for the AI-free hour

## Sources

- [Using AI Tools in Tech Interviews: 2026 Canon — techinterview.org](https://www.techinterview.org/post/3233474910/using-ai-tools-tech-interviews-2026-canon/) — accessed 2026-08-22
- [AI-Assisted Interviews Handbook — Vibe Engines](https://vibeengines.com/handbook/ai-assisted-interviews) — accessed 2026-08-22
- [Software Engineer Interview Prep — JobJourney](https://www.jobjourney.pro/interview-prep/software-engineer) — accessed 2026-08-22
- [Engineering Interview Trends in 2026 — Karat](https://karat.com/engineering-interview-trends-2026/) — accessed 2026-09-07
- [AI Assisted Coding Interview: What Gets Scored Now — Formation](https://formation.dev/blog/ai-assisted-coding-interviews) — accessed 2026-09-07
- [Cloud Next ‘26 — Sundar Pichai (Google)](https://blog.google/innovation-and-ai/infrastructure-and-cloud/google-cloud/cloud-next-2026-sundar-pichai/) — accessed 2026-09-07
- [Google's AI-Assisted Coding Interview (2026 Guide) — Exponent / Aced](https://www.tryexponent.com/blog/google-ai-coding-interview) — accessed 2026-09-07
