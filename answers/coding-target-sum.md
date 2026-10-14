# Target Sum — answer outline

**Prompt:** Given integers `nums` and a `target`, assign each value `+` or `−` so the expression equals `target`. Return the **number of ways**. (LeetCode 494)

This is **signed subset-sum / 0/1 knapsack count**, cousin of [coding-partition-subset.md](coding-partition-subset.md) (boolean subset-to-half) and [coding-coin-change-ii.md](coding-coin-change-ii.md) (unbounded combinations). NeetCode 150 1D-DP box. Wikipedia [Knapsack problem](https://en.wikipedia.org/wiki/Knapsack_problem).

## Probes

- Order of signs does not matter; different index choices do — `[1,1]` → target `0` has **two** ways.
- Rewrite: let `P` be the + subset. `P − (total − P) = target` ⇒ `2P = total + target`. If `total + target` is odd, negative, or `P` exceeds `total`, answer is **0**.
- Zeros are allowed (`0 ≤ nums[i]`); `+0` and `−0` are the same value but **two assignments** — a count DP must still branch, or treat `0` as doubling reachable counts.
- Live target: O(`n × total`) time, O(`total`) space. Raw `2^n` DFS is only a start (`n ≤ 20` on some statements — still name the DP).

## Strong answer skeleton — subset-sum count

1. **Clarify:** return **count**, not one assignment; every index must get a sign.
2. `s = sum(nums)`. Need `(s + target) % 2 == 0` and `s >= abs(target)`. `need = (s + target) // 2`.
3. **State:** `dp[j]` = number of subsets of values seen so far that sum to `j`.
4. **Init:** `dp[0] = 1`; rest 0.
5. **For each `x`:** walk `j` from `need` down to `x`: `dp[j] += dp[j - x]` (0/1; a forward loop **reuses** `x`).
6. **Answer:** `dp[need]`.
7. **Complexity:** O(`n × s`) time, O(`s`) extra space.

DFS+memo twin: `dfs(i, t)` with two branches `± nums[i]`; cache `(i, t)`. Same recurrence, O(`n × s`) states if you shift `t` by `s`.

## Sketch

```
def findTargetSumWays(nums, target):
  s = sum(nums)
  if (s + target) % 2 or s < abs(target):
    return 0
  need = (s + target) // 2
  dp = [1] + [0] * need
  for x in nums:
    for j in range(need, x - 1, -1):
      dp[j] += dp[j - x]
  return dp[need]
```

`[1,1,1,1,1]`, target `3` → **5**. `[1]`, target `2` → **0**. `[0,0,1]`, target `1` → **4** (two zeros each flip).

## Mock narration (30 sec)

> “Plus-or-minus is subset-sum: the plus group must total `(sum + target) / 2`. I count 0/1 subsets with a one-dimensional DP, walking the amount backward so each number is used once. Odd or impossible totals are an immediate zero.”

## Common mistakes

- Forward `j` loop — unbounded reuse (Coin Change II).
- Forgetting the parity / `|target| > sum` reject and running DP anyway.
- Boolean `or` instead of **adding** ways.
- Treating `0` as a no-op that should not multiply the count.
- Returning whether a way exists (416) instead of the count.

## Follow-ups

- **Partition Equal Subset Sum (416):** boolean half — [coding-partition-subset.md](coding-partition-subset.md).
- **Last Stone Weight II:** minimize `|P − N|` — same subset-to-half.
- **Expression add operators:** insert `+ − ×` into a digit string — backtracking, not knapsack.
- Reconstruct one assignment — keep a prev pointer or second array of choices.

## Sources

- [Target Sum — NeetCode](https://neetcode.io/solutions/target-sum) — accessed 2026-10-14
- [494. Target Sum — LeetCode Wiki](https://leetcode.doocs.org/en/lc/494/) — accessed 2026-10-14
- [Target Sum — LeetCode 494](https://leetcode.com/problems/target-sum/) — accessed 2026-10-14
- [Knapsack problem — Wikipedia](https://en.wikipedia.org/wiki/Knapsack_problem) — accessed 2026-10-14
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-14
