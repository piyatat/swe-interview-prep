# Maximum Subarray — answer outline

**Prompt:** Given `nums`, return the **largest sum** of any **contiguous** subarray. At least one element (LeetCode empty-subarray variant is a follow-up). (LeetCode 53)

This is **Kadane**: best ending here vs start fresh. Listed in [../general/coding-patterns.md](../general/coding-patterns.md). Same “reset when the prefix hurts” idea as [coding-house-robber.md](coding-house-robber.md) is **not** — robber skips houses; this one must stay contiguous.

## Probes

- Subarray ≠ subsequence (contiguous).
- All-negative: init from `nums[0]`, not `0` (empty sum is illegal on the usual LC statement).
- O(n²) nested sums vs O(n) one pass.
- Optional: return the **bounds**, not only the sum.

## Strong answer skeleton

1. **Clarify:** empty array? all-negative? return sum vs indices?
2. **Brute:** every `i..j` — O(n²) with running inner sum (O(n³) if you rescan).
3. **State:** `best_end[i]` = max sum of a subarray **ending at** `i`.
4. **Recurrence:** `best_end[i] = max(nums[i], best_end[i-1] + nums[i])`.  
   Global answer = max of `best_end`.
5. **Why greedy reset works:** a **negative** running prefix cannot help any future end (Wikipedia / Kadane).
6. **Complexity:** O(n) time, O(1) space (two scalars). Divide-and-conquer is O(n log n) — mention if they ask history (Shamos, then Kadane).

## Sketch

```
best = cur = nums[0]
for x in nums[1:]:
  cur = max(x, cur + x)   # start fresh vs extend
  best = max(best, cur)
return best
```

Indices: when `x` wins over `cur + x`, set `temp_L = i`; when `cur` updates `best`, save `(temp_L, i)`.

Walk `[-2,1,-3,4,-1,2,1,-5,4]` → best `6` from `[4,-1,2,1]`.

## Mock narration (30 sec)

> “Best subarray ending here is either this element alone or this element plus the best ending just before. If the running sum is dead weight, I drop it. Track a global max. Linear, two variables. I start from nums[0] so all-negative still returns the largest element.”

## Common mistakes

- Init `best = 0` → wrong on `[-3, -1]`.
- Allowing an empty subarray without being asked.
- Confusing with **maximum subsequence** (sort / take positives).
- Off-by-one when asked for the slice.
- Claiming Kadane is “greedy so no proof” — state the ending-at-i invariant.

## Follow-ups

- **Return the subarray** — extra two indices (above).
- **Maximum Product Subarray (152)** — track min and max (sign flips).
- **Best Time to Buy and Sell Stock (121)** — max `price[j] - price[i]` is Kadane on **diffs**.
- **Circular (918)** — `max(normal Kadane, total - min_subarray)` with the all-negative caveat.
- 2D max-sum subrectangle (Kadane on compressed columns) — only if they go staff-plus.

## Sources

- [Maximum subarray problem — Wikipedia](https://en.wikipedia.org/wiki/Maximum_subarray_problem) — accessed 2026-09-01
- [Maximum Subarray walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/maximum-subarray-interview-walkthrough/) — accessed 2026-09-01
- [Kadane's Algorithm (LeetCode 53) — SpaceComplexity](https://spacecomplexity.ai/blog/kadanes-algorithm) — accessed 2026-09-01
- [Kadane's Algorithm — Codecademy](https://www.codecademy.com/article/kadanes-algorithm-find-maximum-subarray-sum-in-an-array) — accessed 2026-09-01
- Classic LeetCode #53 / #152 / #121 / #918 — Kadane family
