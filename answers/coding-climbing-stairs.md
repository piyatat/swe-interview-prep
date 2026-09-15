# Climbing Stairs — answer outline

**Prompt:** A staircase has `n` steps. You may climb **1 or 2** steps at a time. Return how many **distinct** ways you can reach the top. Order matters (`1+2` ≠ `2+1`). (LeetCode 70)

This is the interview **Fibonacci**. Same optimal-substructure family as [coding-house-robber.md](coding-house-robber.md) (last choice vs last two) and the **ungated** cousin of [coding-decode-ways.md](coding-decode-ways.md) (decode adds digit-validity gates). Grid analog: [coding-unique-paths.md](coding-unique-paths.md) (right/down instead of 1/2). Blind 75 / NeetCode 150 1D DP box.

## Probes

- Recursion without memo is exponential (binary tree of 1- vs 2-steps).
- Base cases: `n = 1 → 1`, `n = 2 → 2` (or define `dp[0] = 1` as “one way to stay put”).
- O(1) space: only the last two answers.
- They may ask the **closed form** or matrix pow — mention, do not start there.

## Strong answer skeleton

1. **Clarify:** `n ≥ 1` in the classic; only 1 and 2; count ways, do not list them (listing is backtracking).
2. **State:** `dp[i]` = ways to reach step `i`.
3. **Recurrence:** last hop is 1 from `i-1` or 2 from `i-2` → `dp[i] = dp[i-1] + dp[i-2]`.
4. **Base:** `dp[1] = 1`, `dp[2] = 2`. Loop `i = 3 … n`.
5. **Complexity:** O(n) time, O(1) extra with two rolling ints. Naive recursion O(φⁿ).

Wikipedia [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_sequence): this is Fₙ₊₁ with the usual `F₁ = 1, F₂ = 1` indexing — say the shift so you do not argue constants in the hour.

## Sketch (rolling)

```
if n <= 2: return n
a, b = 1, 2          # ways(1), ways(2)
for _ in range(3, n+1):
  a, b = b, a + b
return b
```

`n = 3` → `1+1+1`, `1+2`, `2+1` → `3`. `n = 4` → `5`.

Top-down: `f(i)` from step `i`; `i == n → 1`; `i > n → 0`; memo `f(i+1)+f(i+2)`.

## Mock narration (30 sec)

> “Ways to n is ways to n−1 plus ways to n−2, because the last step is a 1 or a 2. That’s Fibonacci. I keep two variables and walk up; linear time, constant extra space.”

## Common mistakes

- Off-by-one on `dp[0]` vs `dp[1]` (pick one convention and stick to it).
- Returning `n` for all `n` (only true for 1 and 2).
- Recursing without memo in a 45-min and running out of time.
- Listing permutations when they asked for a **count**.
- Integer overflow if they raise `n` (say big-int / mod if the follow-up appears).

## Follow-ups

- **Min Cost Climbing Stairs (746):** same indices; take `min` of pay-from-`i-1` vs `i-2`.
- **Decode Ways (91):** Fibonacci **with gates** — [coding-decode-ways.md](coding-decode-ways.md).
- **Unique Paths (62):** 2D Fibonacci — [coding-unique-paths.md](coding-unique-paths.md).
- **k-step:** `dp[i] = sum(dp[i-j] for j in 1..k)`.
- **Matrix pow / closed form:** O(log n) when they ban the linear scan.

## Sources

- [Climbing Stairs — NeetCode](https://neetcode.io/solutions/climbing-stairs) — accessed 2026-09-15
- [Climbing Stairs — LeetCode 70](https://leetcode.com/problems/climbing-stairs/) — accessed 2026-09-15
- [Fibonacci sequence — Wikipedia](https://en.wikipedia.org/wiki/Fibonacci_sequence) — accessed 2026-09-15
- [Climbing Stairs — AlgoMonster](https://algo.monster/liteproblems/70) — accessed 2026-09-15
- Classic LeetCode #70 — 1D DP / Fibonacci ways
