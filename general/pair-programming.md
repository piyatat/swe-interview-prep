# Pair-programming rounds (including Cursor-era)

A live **collaborative coding** round: you and an interviewer share an editor (sometimes with an **AI tool as a third voice**). Distinct from [ai-assisted-rounds.md](ai-assisted-rounds.md) (policy + prompting) and [debugging-rounds.md](debugging-rounds.md) (unfamiliar repo, find-the-bug). Ask the recruiter which variant you will get.

Common at **AI-native startups** and some lab/product teams in 2026. Still **rare at FAANG and quant** — those firms more often run unaided DSA or (separately) AI-collaborative coding without treating the interviewer as a peer in the editor.

## Two families

| Family | Setup | What they score |
| --- | --- | --- |
| **Traditional pair** | Interviewer drives / nudges; you code unaided | Communication, receiving hints, shipping a working slice |
| **Cursor-era (3-way)** | You, interviewer, **and** Cursor/Copilot/Claude | **Negotiation** among three inputs; you stay the senior |

In the 3-way format the interviewer is a **peer**, not a teacher. Always deferring to them **or** to the model both fail.

## Cursor-era sub-formats

1. **Agree / push back / override** — interviewer hints X, model suggests Y; you pick with a reason.
2. **Find the bug (AI on)** — use the model to **scan**, not to dump more code before you diagnose. Related skill: [debugging-rounds.md](debugging-rounds.md).
3. **Open-ended build** — “let’s build X in 45 min”; you scope, decompose, prompt, verify, integrate.

## What scores well

- **Audible weighing:** “You suggested a hash map, the model suggested a tree; I’ll start with the map because n is small and we need O(1) lookups.”
- **Respectful disagreement** with a reason (compliance ≠ judgment).
- **Integrate hints** into the current plan instead of restarting.
- **Verify model output** (tests, edges) without treating the tool as the enemy.
- **Tool fluency** in whatever editor they allow — shortcuts, scoped prompts, when *not* to prompt.

## What scores poorly

- Silent coding while three voices are in play.
- Accepting a confident wrong completion.
- Prompting “write the whole feature” then pasting.
- Ignoring a hint, or following every hint with no filter.

## 45-minute shape (say it)

1. **Restate** the goal and a 10-minute slice.
2. **Choose** the first interface / data structure; invite the interviewer in.
3. **Implement** a thin vertical; run or walk a test.
4. When inputs conflict, **name the tradeoff** and commit.
5. Leave a **known gap** rather than a half-refactored mess.

## Practice

- Solo: timed problem **with** AI; at minute 20 write a fake interviewer hint and integrate it.
- Peer: swap candidate/interviewer; interviewer drops 2–3 hints; candidate must narrate the negotiation.
- Ask recruiter: “Is this a three-way AI pair, traditional pair, or classic CoderPad?”

## Sample prompts

1. “Add retries to this client; don’t break idempotency. You may use the assistant.”
2. “We disagree with the model’s BST idea — say why, then implement your pick.”
3. “Build a tiny in-memory rate limiter together; I’ll add a constraint at minute 25.”

## Sources

- [The Cursor-Era Pair Programming Interview — techinterview.org](https://www.techinterview.org/post/3233474916/cursor-era-pair-programming-interview/) — accessed 2026-08-27
- [How Engineering Interviews Have Changed (AI-augmented loop 2026) — Aveluate](https://aveluate.com/blog/ai-augmented-engineering-interview-prep-2026) — accessed 2026-08-27
- [Software Engineer Interview Process 2026 — Levelop](https://levelop.dev/blog/the-complete-software-engineer-interview-process-in-2026-what-to-expect-at-every) — accessed 2026-08-27
- [Live coding in a real codebase (2026) — gitGood](https://gitgood.dev/blog/live-coding-real-codebase-interview-format-2026) — accessed 2026-08-27
