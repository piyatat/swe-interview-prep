# Maximum Product Subarray — answer outline

**Prompt:** Given `nums`, return the **largest product** of any **contiguous** subarray. At least one element. Product fits in 32-bit. (LeetCode 152)

This is **Kadane for products**, not [coding-maximum-subarray.md](coding-maximum-subarray.md) (sums only). A negative flips min↔max; a **zero** resets the run. NeetCode 150 1-D DP box. Wikipedia [maximum subarray](https://en.wikipedia.org/wiki/Maximum_subarray_problem) is the sum cousin — say that, then track **both** ends.

## Probes

- Subarray ≠ subsequence (contiguous).
- Single-element arrays: answer is `nums[0]` (may be negative).
- Zeros: `[-2,0,-1]` → `0`, not `2` (not contiguous).
- Odd vs even negatives: a leftover negative can be dropped from **either** end.
- They usually want O(n) time, O(1) extra.

## Strong answer skeleton — min/max ending here

1. **Clarify:** empty? all-negative? zeros? return product only?
2. **Brute:** every `i..j` product — O(n²) with a running multiply.
3. **State:** `cur_max` / `cur_min` = best / worst product **ending at** `i`.
4. **Recurrence:** for `x`, the three candidates are `x`, `cur_max * x`, `cur_min * x`. New max is the max of those; new min is the min. **Save both old values first.**
5. Global answer = max `cur_max` seen (init `nums[0]`).
6. **Complexity:** O(n) time, O(1) space.

## Sketch (min/max)

```
ans = f = g = nums[0]          # f = max ending here, g = min
for x in nums[1:]:
  ff, gg = f, g
  f = max(x, ff * x, gg * x)
  g = min(x, ff * x, gg * x)
  ans = max(ans, f)
return ans
```

`[2,3,-2,4]` → `6` from `[2,3]`. Walk it: after `-2`, max becomes `-2`, min `-12`; then `4` makes max `4` (start fresh) — global stays `6`.

**Prefix/suffix variant (name it):** left-to-right and right-to-left running products, reset to `1` after a zero; the answer is a prefix or a suffix of a zero-free run. Same O(n)/O(1). Do **not** claim it finds an interior slice that is not a prefix/suffix of such a run — with one leftover negative, dropping the left or right end **is** a prefix or suffix.

## Mock narration (30 sec)

> “Kadane, but products flip sign. I keep the max and min product ending here. Each step I try starting fresh, times old max, or times old min. I snapshot both before I write. Zeros naturally restart. Linear, two extras.”

## Common mistakes

- Tracking only `cur_max` (misses `neg * neg`).
- Overwriting `cur_max` before using it to update `cur_min`.
- Init `ans = 0` → wrong on `[-3]`.
- Treating zeros as “skip” without restarting the run.
- Returning a **subsequence** product (sort / drop a negative).

## Follow-ups

- **Return the slice** — store start indices when you start-fresh.
- **Maximum Subarray (53)** — same skeleton, only the sum.
- **Maximum Product Subarray with k-factor cap** — usually a different DP.
- **Circular** — not the usual follow-up; do not force 918’s sum trick onto products.

## Sources

- [Maximum Product Subarray — NeetCode](https://neetcode.io/solutions/maximum-product-subarray) — accessed 2026-10-01
- [152. Maximum Product Subarray — LeetCode Wiki](https://leetcode.doocs.org/en/lc/152/) — accessed 2026-10-01
- [Maximum Product Subarray — LeetCode 152](https://leetcode.com/problems/maximum-product-subarray/) — accessed 2026-10-01
- [Maximum subarray problem — Wikipedia](https://en.wikipedia.org/wiki/Maximum_subarray_problem) — accessed 2026-10-01
