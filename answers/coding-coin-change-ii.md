# Coin Change II — answer outline

**Prompt:** Coin denominations `coins` (unique) and target `amount`. Return the number of **combinations** that sum to `amount`. Unlimited use of each denomination. Order does not matter — `{1,2}` and `{2,1}` are one way. Return `0` if impossible. (LeetCode 518)

This is the **count** twin of [coding-coin-change.md](coding-coin-change.md) (min coins) and the unbounded cousin of [coding-partition-subset.md](coding-partition-subset.md) (0/1). Named in [../general/coding-patterns.md](../general/coding-patterns.md). Wikipedia [change-making](https://en.wikipedia.org/wiki/Change-making_problem) / [knapsack](https://en.wikipedia.org/wiki/Knapsack_problem).

## Probes

- Combinations ≠ permutations — **loop order** is the interview.
- `amount = 0` → `1` (one empty combination). Empty `coins` and `amount > 0` → `0`.
- Why coins **outer**, amount **inner forward** (unbounded + each combo once).
- Overflow: some judges want a 32-bit answer; say if you would use a wider type.

## Strong answer skeleton — 1D unbounded knapsack

1. **Clarify:** unlimited supply; combinations not sequences; `amount = 0` is 1.
2. `dp[a]` = number of combinations that make exactly `a`. `dp[0] = 1`.
3. For each `coin`, for `a` from `coin … amount`: `dp[a] += dp[a - coin]`.
4. Coins outer → once you “decide” a coin, later coins cannot reorder it.
5. **Complexity:** O(`amount × |coins|`) time, O(`amount`) space.

If they want permutations (order matters), swap loops: amount outer, coins inner — **different problem**. Do not do that here.

## Sketch (1D)

```
def change(amount, coins):
  dp = [0] * (amount + 1)
  dp[0] = 1
  for coin in coins:
    for a in range(coin, amount + 1):
      dp[a] += dp[a - coin]
  return dp[amount]
```

`amount = 5`, `coins = [1, 2, 5]` → `4` (`5`; `2+2+1`; `2+1+1+1`; `1×5`).

2D twin: `dp[i][a]` using first `i` coins; same recurrence, easier to say “skip vs take.”

## Mock narration (30 sec)

> “I need combinations, not sequences. I’ll walk coins on the outside so each denomination is decided once, and add `dp[a - coin]` going forward so I can reuse a coin. `dp[0]` is 1 — one way to make nothing.”

## Common mistakes

- Amount-outer loop → counts permutations (`1+2` and `2+1` both).
- Backward inner loop (0/1 knapsack) → forbids reuse; under-counts.
- Returning `-1` on impossible (that is 322). Here return `0`.
- Forgetting `dp[0] = 1`.
- Sorting then generating combinations with DFS without memo — TLE on large `amount`.

## Follow-ups

- **Coin Change (322)** — [coding-coin-change.md](coding-coin-change.md): min count, not ways.
- **Combination Sum** — [coding-combination-sum.md](coding-combination-sum.md): emit the lists.
- **Target Sum / 0-1 knapsack** — [coding-partition-subset.md](coding-partition-subset.md).
- Mod 10⁹+7 if they add a contest-style wrap.

## Sources

- [Coin Change II — NeetCode](https://neetcode.io/solutions/coin-change-ii) — accessed 2026-10-12
- [518. Coin Change II — LeetCode Wiki](https://leetcode.doocs.org/en/lc/518/) — accessed 2026-10-12
- [Coin Change II — LeetCode 518](https://leetcode.com/problems/coin-change-ii/) — accessed 2026-10-12
- [Change-making problem — Wikipedia](https://en.wikipedia.org/wiki/Change-making_problem) — accessed 2026-10-12
- [Knapsack problem — Wikipedia](https://en.wikipedia.org/wiki/Knapsack_problem) — accessed 2026-10-12
