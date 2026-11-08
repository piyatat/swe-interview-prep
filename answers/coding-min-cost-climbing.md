# Min Cost Climbing Stairs — answer outline

**Prompt:** Array `cost` where `cost[i]` is the fee to **step on** floor `i`. After paying, you may climb **1 or 2** floors. You may start at index `0` or `1`. Return the **minimum** cost to reach the top (just past the last index). (LeetCode 746)

This is the **min-cost Fibonacci** in the NeetCode 150 1D DP box. Sibling of [coding-climbing-stairs.md](coding-climbing-stairs.md) (count ways) — same 1/2 step graph, `min` instead of `+`. Cousin of [coding-house-robber.md](coding-house-robber.md) (choose among last two). Wikipedia [dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming): overlapping subproblems on a line.

## Probes

- Top is **past** `n - 1`, not “land on the last floor and stop without a last pay” — you **do** pay `cost[n-1]` if you step on it.
- Start at 0 **or** 1 for free (you still pay that floor’s cost when you leave it).
- `n >= 2`; costs are non-negative — greedy “always jump 2” is wrong.
- O(1) extra: only two rolling cells.

## Strong answer skeleton — bottom-up from the top

1. **Clarify:** pay to stand on `i`; then +1 or +2; start at 0 or 1; top = index `n`.
2. **State:** `f(i)` = min cost to finish **from** floor `i` (you will pay `cost[i]` if `i < n`).
3. **Recurrence:** `f(i) = 0` for `i >= n`; else `cost[i] + min(f(i+1), f(i+2))`.
4. **Answer:** `min(f(0), f(1))`.
5. **Complexity:** O(n) time, O(1) extra with two ints. Naive recursion O(2ⁿ).

Forward form: `dp[i] = cost[i] + min(dp[i-1], dp[i-2])` after seeding `dp[0]`, `dp[1]`; return `min(dp[n-1], dp[n-2])` — same numbers, opposite walk.

## Sketch (rolling from the end)

```
one = two = 0          # f(i+1), f(i+2); beyond n is 0
for i in range(n-1, -1, -1):
  one, two = cost[i] + min(one, two), one
return min(one, two)   # f(0), f(1)
```

`[1,2,3]` → start at 1, pay 2, jump 2 → **2**. `[10,15,20]` → start at 1, pay 15, jump 2 → **15**.

## Mock narration (30 sec)

> “From any floor I pay that floor, then take the cheaper of one step or two. The top costs nothing. I walk from the end with two variables so I never keep the whole table. Answer is the cheaper of starting on floor 0 or 1.”

## Common mistakes

- Returning `dp[n-1]` only — you may skip the last floor from `n-2`.
- Treating start as free **and** not paying `cost[0]` / `cost[1]`.
- Greedy jump-2 (counterexample `[1,100,1,100,1]`).
- Off-by-one: `f(n-1)` still pays `cost[n-1]` then steps to top.
- Recursing without memo on `n = 100`.

## Follow-ups

- **Climbing Stairs (70):** count instead of min — [coding-climbing-stairs.md](coding-climbing-stairs.md).
- **House Robber (198):** skip-adjacent max — [coding-house-robber.md](coding-house-robber.md).
- **Unique Paths (62):** 2D same recurrence — [coding-unique-paths.md](coding-unique-paths.md).
- **k-step / variable costs per jump:** keep a window of last k.

## Sources

- [746. Min Cost Climbing Stairs — LeetCode](https://leetcode.com/problems/min-cost-climbing-stairs/) — accessed 2026-11-08
- [Min Cost Climbing Stairs — NeetCode](https://neetcode.io/solutions/min-cost-climbing-stairs) — accessed 2026-11-08
- [746. Min Cost Climbing Stairs — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/746/) — accessed 2026-11-08
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-11-08
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-08
