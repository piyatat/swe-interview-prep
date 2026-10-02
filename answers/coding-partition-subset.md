# Partition Equal Subset Sum — answer outline

**Prompt:** Given positive integers `nums`, return whether you can split them into **two subsets with equal sum**. (LeetCode 416)

This is **0/1 knapsack / subset-sum**, not unbounded Coin Change. Sibling of [coding-coin-change.md](coding-coin-change.md) (reuse allowed; minimize count) and [coding-house-robber.md](coding-house-robber.md) (another 1-D DP with an include/skip choice). Wikipedia [Knapsack problem](https://en.wikipedia.org/wiki/Knapsack_problem). NeetCode 150 DP box.

## Probes

- Odd total → **impossible** (say this before DP).
- Equal split ⇔ a subset sums to `total / 2`. The complement is automatic.
- Each number is used **at most once** — forward 1-D update **reuses** (unbounded); sweep **backward**.
- `n ≤ 200`, values ≤ 100 → `O(n × target)` is the intended bar, not `2^n` subset enum.

## Strong answer skeleton

1. **Clarify:** empty / single → false unless they allow `{0}` (positives in the usual statement); zeros are rare — ask.
2. **Sum `s`:** if `s` odd, return false. `target = s // 2`.
3. **State:** `dp[j]` = whether some subset of the numbers seen so far sums to `j`.
4. **Init:** `dp[0] = True`; rest false.
5. **For each `x`:** for `j` from `target` down to `x`: `dp[j] = dp[j] or dp[j - x]`. Stop early if `dp[target]`.
6. **Complexity:** O(`n × target`) time, O(`target`) space.

## Sketch

```
s = sum(nums)
if s % 2: return False
t = s // 2
dp = [True] + [False] * t
for x in nums:
  for j in range(t, x - 1, -1):
    dp[j] = dp[j] or dp[j - x]
  if dp[t]: return True
return dp[t]
```

`[1,5,11,5]` → `s=22`, `t=11` → `{11}` or `{1,5,5}` → true. `[1,2,3,5]` → `s=11` odd → false.

## Mock narration (30 sec)

> “Equal partition is subset-sum to half. Odd total is an immediate no. I keep a boolean array of reachable sums and place each number at most once by walking the array backward — same trick as 0/1 knapsack. If half is reachable, the rest matches.”

## Common mistakes

- Forward `j` loop — each `x` can be used many times (Coin Change / unbounded).
- Skipping the odd-sum check and burning the DP anyway.
- Building the actual subsets when they only asked **true/false**.
- Sorting + greedy “take largest” — `[1,1,1,3]` vs a bad split; greedy is not safe.
- Using `//` on a negative (not in this problem) or treating `target` as `s` not `s/2`.

## Follow-ups

- **Last Stone Weight II** — same subset-to-half, minimize leftover.
- **Target Sum (494)** — assign ±; rewrite as subset-sum.
- **Coin Change II (518)** — **unbounded** combinations; coins outer, amounts forward.
- **Return one subset** — keep a prev pointer or second array of choices.

## Sources

- [Partition Equal Subset Sum — NeetCode](https://neetcode.io/solutions/partition-equal-subset-sum) — accessed 2026-10-02
- [416. Partition Equal Subset Sum — LeetCode Wiki](https://leetcode.doocs.org/en/lc/416/) — accessed 2026-10-02
- [Partition Equal Subset Sum — LeetCode 416](https://leetcode.com/problems/partition-equal-subset-sum/) — accessed 2026-10-02
- [Knapsack problem — Wikipedia](https://en.wikipedia.org/wiki/Knapsack_problem) — accessed 2026-10-02
