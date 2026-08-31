# House Robber — answer outline

**Prompt:** Houses in a line, `nums[i]` is cash in house `i`. Adjacent houses have a security system. Return the **maximum** you can rob without robbing two neighbors. (LeetCode 198)

## Probes

- Why greedy (always take the larger neighbor) fails.
- State definition before code: “best through house `i`,” not “path of houses.”
- O(1) space: you only need the last two answers.
- Circle variant (213): first and last are adjacent.

## Strong answer skeleton

1. **Clarify:** empty → `0`; one house → that value; negatives usually excluded.
2. **Greedy trap:** `[2, 1, 1, 2]` — taking both `2`s (skip the middle pair) beats any local “take the max of the next two.”
3. **State:** `dp[i]` = max loot using houses `0 … i` (inclusive).
4. **Recurrence:** at `i`, skip (`dp[i-1]`) or take (`nums[i] + dp[i-2]`).  
   `dp[i] = max(dp[i-1], nums[i] + dp[i-2])`.
5. **Base:** `dp[0] = nums[0]`; `dp[1] = max(nums[0], nums[1])`.
6. **Complexity:** O(n) time, O(1) space with two rolling variables.

This is the same **optimal substructure** idea as [coding-coin-change.md](coding-coin-change.md), but **0/1 along a line** (each house at most once) instead of unbounded knapsack.

## Bottom-up sketch

```
prev2, prev1 = 0, 0   # best ending two steps / one step back
for x in nums:
  cur = max(prev1, prev2 + x)
  prev2, prev1 = prev1, cur
return prev1
```

Top-down: `f(i) = max(f(i+1), nums[i] + f(i+2))` with memo; out of range → `0`. Recursion without memo is O(2^n).

## Mock narration (30 sec)

> “At each house I either skip it and keep the best so far, or take it plus the best from two houses back. That’s linear DP; two variables are enough.”

## Common mistakes

- Off-by-one on the first two houses.
- Mutating `nums` in place without saying so (valid O(1) extra, easy to mess up).
- Treating it as “take every other house” (fixed parity) — the optimal parity can switch.
- House Robber II: running 198 on `nums[0..n-2]` **and** `nums[1..n-1]`, then `max`; empty / single still special-case.

## Follow-ups

- **House Robber II (213)** — circular street; first and last conflict.
- **House Robber III (337)** — binary tree; pair `(rob_this, skip_this)` per node.
- Delete-and-earn (740) — histogram + this recurrence.
- Max independent set on a path — same DP.

## Sources

- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-08-31
- [House Robber solution — NeetCode](https://neetcode.io/solutions/house-robber) — accessed 2026-08-31
- [House Robber — Whiteboard Ready](https://www.whiteboardready.com/post/house-robber) — accessed 2026-08-31
- [198. House Robber — Codinginterview.com](https://www.codinginterview.com/problems/198-house-robber/) — accessed 2026-08-31
- Classic LeetCode #198 / #213 — 1D DP / path independent set
