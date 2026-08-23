# Coin Change — answer outline

**Prompt:** Given coin denominations `coins` and a target `amount`, return the **fewest coins** that sum to `amount`. Unlimited use of each denomination. Return `-1` if impossible. (LeetCode 322)

## Probes

- Why greedy fails on arbitrary sets (US coins happen to be canonical).
- Top-down memo vs bottom-up? State definition before code.
- Variant: **count combinations** (518) vs permutations — **loop order**.

## Strong answer skeleton

1. **Clarify:** `amount = 0` → `0`; empty `coins`; zeros/negatives usually excluded.
2. **Greedy trap:** coins `[1, 3, 4]`, amount `6` — greedy `4+1+1` is 3; optimal `3+3` is 2.
3. **State:** `dp[a]` = min coins to make exactly `a` (or “impossible”).
4. **Recurrence:** `dp[a] = min(dp[a - c] + 1)` over coins `c ≤ a` that are reachable.
5. **Bottom-up:** `dp[0] = 0`; others `∞`; fill `1 … amount`. If still `∞`, return `-1`.
6. **Complexity:** O(`amount × |coins|`) time, O(`amount`) space.

This is **unbounded knapsack** (reuse allowed). Forward amount loop is what permits reuse; 0/1 knapsack often sweeps amount **backward**.

## Bottom-up sketch

```
dp[0] = 0; dp[1..amount] = INF
for a in 1..amount:
  for c in coins:
    if c <= a and dp[a-c] != INF:
      dp[a] = min(dp[a], dp[a-c] + 1)
return dp[amount] if finite else -1
```

Top-down: `f(a)` memoized; same recurrence. BFS from 0 (each coin = edge weight 1) is a valid “shortest path” framing.

## Mock narration (30 sec)

> “Greedy isn’t safe for arbitrary denominations. I’ll DP on amount: min coins to make `a` is one coin plus the best for the remainder. Unbounded — I can reuse a coin. Impossible stays infinity.”

## Common mistakes

- Assuming greedy after sorting.
- Forgetting the impossible sentinel.
- Counting **permutations** when asked for combinations (518): coins **outer**, amounts inner.
- Integer overflow if using a large sentinel — pick `amount + 1` as INF.

## Follow-ups

- Coin Change II (518) — number of combinations; loop order matters.
- Perfect Squares (279) — denominations are squares.
- Bounded supply — cannot reuse freely; different DP or extra state.

## Sources

- [Change-making problem — Wikipedia](https://en.wikipedia.org/wiki/Change-making_problem) — accessed 2026-08-23
- [Coin Change DP walkthrough — techinterview.org](https://www.techinterview.org/post/3233460127/coin-change-bottom-up-and-top-down-dynamic-programming/) — accessed 2026-08-23
- [Why greedy fails on Coin Change — techinterview.org](https://www.techinterview.org/post/3233476079/why-greedy-fails-coin-change-dp/) — accessed 2026-08-23
- [Coin Change interview walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/coin-change-interview-walkthrough/) — accessed 2026-08-23
- Classic LeetCode #322 / #518 — unbounded knapsack pattern
