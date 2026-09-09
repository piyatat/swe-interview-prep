# Longest increasing subsequence — answer outline

**Prompt:** Integer array `nums`. Return the **length** of the longest **strictly** increasing subsequence (order preserved; not necessarily contiguous). (LeetCode 300)

This is the usual **sequence DP**, then the interview upgrade to **patience sorting + binary search**. Different from [coding-maximum-subarray.md](coding-maximum-subarray.md) (contiguous) and from [coding-longest-consecutive.md](coding-longest-consecutive.md) (values, any order). Same family as [coding-house-robber.md](coding-house-robber.md) (best-through-`i`) but the inner choice is “which earlier tail.”

## Probes

- Subsequence vs subarray.
- Strict vs non-decreasing (`bisect_left` vs `bisect_right`).
- They asked for **length** — `tails` is **not** an LIS (do not print it as the sequence).
- When is O(n²) enough? When must you say O(n log n)?

## Strong answer skeleton

1. **Clarify:** empty → `0`; all equal → `1`; negatives OK; reconstruct the actual sequence only if they ask.
2. **O(n²) DP:** `dp[i]` = LIS **ending at** `i`.  
   `dp[i] = 1 + max({ dp[j] | j < i and nums[j] < nums[i] } or {0})`.  
   Answer = `max(dp)`. O(n²) time, O(n) space.
3. **O(n log n) (patience / piles):** keep `tails[k]` = **smallest tail** of any increasing subsequence of length `k+1`. `tails` stays sorted.
   - For each `x`: lower-bound the first `tails[k] >= x`; replace, or append if `x` is larger than every tail.
   - `len(tails)` is the LIS length. Wikipedia [patience sorting](https://en.wikipedia.org/wiki/Patience_sorting): leftmost pile whose top is ≥ `x`.
4. **Why replace:** a smaller tail of the same length is easier to extend later. The pile tops are **not** one real subsequence.
5. **Complexity:** O(n log n) time, O(n) space.

## Sketch (patience / tails)

```
tails = []
for x in nums:
  i = lower_bound(tails, x)   # first tails[i] >= x
  if i == len(tails): tails.append(x)
  else: tails[i] = x
return len(tails)
```

`[10,9,2,5,3,7,101,18]` → length `4` (e.g. `2,3,7,101`). After the run, `tails` might look like `[2,3,7,18]` — that happens to be an LIS here; it is **not guaranteed**.

To reconstruct: store predecessor pointers when you place a card (patience-sort back-links), then walk from the last pile.

## Mock narration (30 sec)

> “Quadratic DP is fine if n is a thousand: best LIS ending at each index. For n up to 1e5 I keep the smallest tail per length and binary-search the pile for each value. The number of piles is the length. I will not claim the tails array is the subsequence.”

## Common mistakes

- Returning `tails` as the sequence.
- Using `>` instead of `>=` in the lower bound (duplicates extend a **non-decreasing** LIS).
- Confusing with longest **contiguous** increasing run (one pass, reset on drop).
- Recursion over all subsequences without memo — exponential.

## Follow-ups

- **Russian Doll Envelopes (354):** sort one dimension, LIS the other.
- **Longest increasing subsequence II / count LIS:** extra DP on number of ways.
- **Print any LIS:** predecessor pointers, not `tails` alone.

## Sources

- [Longest Increasing Subsequence — NeetCode](https://neetcode.io/solutions/longest-increasing-subsequence) — accessed 2026-09-09
- [Patience sorting — Wikipedia](https://en.wikipedia.org/wiki/Patience_sorting) — accessed 2026-09-09
- [LIS: patience sort — The DSA Handbook](https://dsa.handbook.academy/curriculum/dynamic-programming/lis-patience-sort/) — accessed 2026-09-09
- [LIS and sequence DP variants — CalibreOS](https://www.calibreos.com/learn/dsa-lis-variants) — accessed 2026-09-09
