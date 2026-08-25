# Code review interview rounds

A growing 2026 filter: you are handed a **diff or snippet** (often 30–400 lines) and asked to review it as a teammate would — flag issues, rank them, and defend the comments. Distinct from [debugging-rounds.md](debugging-rounds.md) (you usually **fix** a failing repo) and from writing code from scratch. Ask the recruiter whether AI is allowed; many live reviews still score **your** judgment in conversation.

Related: [ai-assisted-rounds.md](ai-assisted-rounds.md) (tool policy) and [hiring-manager.md](hiring-manager.md) (some labs nest review inside the HM screen).

## What interviewers score

| Signal | Strong | Weak |
| --- | --- | --- |
| **Intent** | Summarize what the change is *for* before nits | Line-by-line without a thesis |
| **Priority** | Correctness / safety first, then perf, then style | Lead with naming; miss the race |
| **Impact** | “This swallows the error → silent failed charge” | “This doesn’t look thread-safe” |
| **Block vs nit** | One blocking comment; rest suggestions | Every comment equal-weight |
| **Tone** | Actionable, about the code | Takedown of the (imaginary) author |
| **Fix shape** | Sketch the patch or a test that would catch it | Critique with no direction |

Google’s public review guide still ranks **design and functionality** above style; “Nit:” is for personal preference. Same hierarchy reads as senior in interviews.

## 20–45 minute loop (say it out loud)

1. **PR description / tests first** — what is supposed to change? Any missing tests?
2. **Main file / hot path** — don’t start at `utils` cosmetics.
3. **Correctness sweep** — edges, nulls, error paths, races, resource leaks, authz.
4. **Perf / scale** — N+1, unbounded memory, lock scope — only after safety.
5. **Maintainability** — names, duplication, over-engineering (future-proofing nobody asked for).
6. **What you would not block on** — knowing what to ignore is a senior signal.

If AI is allowed: use it as a first pass, then **argue** the comments. Pasted LLM prose that you cannot defend fails the live half.

## Bug classes that recur in review snippets

Silent catch / wrong default · check-then-act races · lock too wide or too narrow · connection not closed on error · N+1 query · missing idempotency on retries · authz on the client only · tests that assert implementation, not behavior.

## Sample prompts

1. “Walk the comments you’d post, in the order you’d post them.”
2. “What is the single blocking comment?”
3. “Author pushes back — second-best argument?”
4. “What’s *not* in this diff that should be?”
5. “If you had five minutes, what would you address first?”

## Common failure modes

- Style first while a correctness bug sits three lines down
- Listing ten nits instead of two load-bearing issues
- No production impact (“could NPE” vs who pages and what users see)
- Blocking on taste that the style guide does not require

## Practice that transfers

- Review a real OSS PR cold; time-box 20 min; narrate priority order.
- Plant mixed issues (two correctness, one perf, two style) and force the order every time.
- For each finding, finish: “In production this would …”

## Sources

- [What to look for in a code review — Google eng-practices](https://google.github.io/eng-practices/review/reviewer/looking-for.html) — accessed 2026-08-25
- [Code Review Interview: Questions, Rubric — ClarityHire](https://clarity-hire.com/blog/code-review-interview-questions-rubric) — accessed 2026-08-25
- [Anthropic SWE Interview: Code Review Round — Coditioning](https://www.coditioning.com/blog/31/anthropic-swe-code-review) — accessed 2026-08-25
- [Code Review Round: What Interviewers Look for 2026 — ShadeCoder](https://articles.shadecoder.com/code-review-round-what-interviewers-look-for-in-2026) — accessed 2026-08-25
