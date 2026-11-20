# Combination Sum IV — answer outline

**Prompt:** Distinct positive ints `nums` and integer `target`. Return how many **ordered sequences** (the statement says “combinations,” then clarifies that **different sequences count as different**) sum to `target`. Unlimited reuse. Answer fits in 32-bit. (LeetCode 377)

This is the **permutation-count** twin of [coding-coin-change-ii.md](coding-coin-change-ii.md) (unordered) and the count twin of [coding-combination-sum.md](coding-combination-sum.md) (emit lists). Same recurrence body as 518; **loop nesting** is the interview. Wikipedia [knapsack](https://en.wikipedia.org/wiki/Knapsack_problem).

## Probes

- Combinations ≠ permutations — **amount outer, nums inner**.
- `target = 0` → `1` (empty sequence). Impossible → `0` (example: `[9]`, `3`).
- Why swapping loops silently passes tiny tests (`[1,2]`, amount `2`) and fails at `3`.
- Follow-up: negatives (unbounded cycles) — you must cap length.
- 32-bit wrap: some languages need `unsigned` / wider accumulators for **dead** intermediates.

## Strong answer skeleton — 1D unbounded permutation DP

1. **Clarify:** order **matters**; reuse allowed; nums unique and positive in the stock prompt.
2. `dp[t]` = number of sequences that sum to `t`. `dp[0] = 1`.
3. For `t` from `1 … target`, for each `x` in `nums` with `x ≤ t`: `dp[t] += dp[t - x]`.
4. Amount-outer means every value can be the **last** addend of every total — that is what splits `(1,2)` from `(2,1)`.
5. **Complexity:** O(`target × n`) time, O(`target`) space.

Top-down twin: `dfs(remain)` with memo; branch on which `x` you append next. Same “last coin” picture.

## Sketch (1D)

```
def combinationSum4(nums, target):
  dp = [1] + [0] * target
  for t in range(1, target + 1):
    for x in nums:
      if x <= t:
        dp[t] += dp[t - x]
  return dp[target]
```

`nums = [1, 2, 3]`, `target = 4` → `7`. Coin-first 518 nesting would under-count (unordered).

## Mock narration (30 sec)

> “The title says combinations, but the statement counts order. I’ll walk totals on the outside so each number can be the last element of a sequence, and add `dp[t - x]`. `dp[0]` is 1 — one empty sequence. Swapping the loops would be Coin Change II.”

## Common mistakes

- Coins-outer loop → Coin Change II (518); example answer becomes 4, not 7.
- Forgetting `dp[0] = 1` → entire table stays 0.
- Min-coin transition (`+ 1` / `min`) — that is [coding-coin-change.md](coding-coin-change.md).
- Emitting lists with DFS on `target = 1000` — TLE; they asked for a **count**.
- Ignoring the negative follow-up: `A + (-A)` loops forever without a max length.

## Follow-ups

- **Coin Change II (518)** — [coding-coin-change-ii.md](coding-coin-change-ii.md): unordered; coins outer.
- **Combination Sum** — [coding-combination-sum.md](coding-combination-sum.md): emit combinations.
- **Combination Sum II** — [coding-combination-sum-ii.md](coding-combination-sum-ii.md): 0/1 + duplicates.
- Negatives allowed: cap sequence length (or forbid zero-sum cycles) before counting.

## Sources

- [377. Combination Sum IV — LeetCode](https://leetcode.com/problems/combination-sum-iv/) — accessed 2026-11-20
- [377. Combination Sum IV — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/377/) — accessed 2026-11-20
- [Knapsack problem — Wikipedia](https://en.wikipedia.org/wiki/Knapsack_problem) — accessed 2026-11-20
- [Change-making problem — Wikipedia](https://en.wikipedia.org/wiki/Change-making_problem) — accessed 2026-11-20
- [Unbounded knapsack (LC 377 loop order) — The DSA Handbook](https://dsa.handbook.academy/curriculum/dynamic-programming/knapsack-unbounded/) — accessed 2026-11-20
