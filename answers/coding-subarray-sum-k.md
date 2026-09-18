# Subarray sum equals K — answer outline

**Prompt:** Array of ints `nums` (can be **negative**) and int `k`. Return how many **contiguous** subarrays sum to `k`. (LeetCode 560)

This is **prefix sums + frequency map**, not Kadane and not a sliding window. Cousin of [coding-two-sum.md](coding-two-sum.md) (need `prefix - k` seen before). Different from [coding-maximum-subarray.md](coding-maximum-subarray.md) (best sum, not count) and from “min size subarray ≥ target” (positives → window).

## Probes

- Subarray is contiguous. Negatives and zeros are in the constraints — **window shrink is illegal**.
- Count, not the subarrays themselves. Overlapping counts separately (`[1,1,1]`, `k = 2` → 2).
- Seed the map with `{0: 1}` so a prefix that **is** `k` counts.
- Check `cur - k` **before** incrementing `cur` (or you count the empty / self pair wrong when `k == 0`).

## Strong answer skeleton

1. **Clarify:** negatives? zeros? empty array? need count vs list?
2. **Brute:** every `i..j` running sum — O(n²).
3. **Identity:** `sum(i+1..j) = prefix[j] - prefix[i]`. Want `prefix[j] - k` already seen.
4. **One pass:** `cur += x`; `ans += freq[cur - k]`; `freq[cur] += 1`.
5. **Complexity:** O(n) time, O(n) space. Cannot sort (order is the subarray).

## Sketch

```
ans, cur = 0, 0
freq = {0: 1}
for x in nums:
  cur += x
  ans += freq.get(cur - k, 0)
  freq[cur] = freq.get(cur, 0) + 1
return ans
```

`[1, 1, 1]`, `k = 2` → **2**. `[1, 2, 3]`, `k = 3` → **2** (`[1,2]`, `[3]`). `[2, -1, 1, 2]`, `k = 2` → **4**.

## Mock narration (30 sec)

> “If I have seen a prefix that is current-minus-k, the slice between them sums to k. I store frequencies, not just presence, because several prefixes can share a sum. I start the map at zero so a prefix that itself equals k counts. Sliding window fails once numbers can go down.”

## Common mistakes

- Sliding window / two pointers (negatives break monotonicity).
- Forgetting `{0: 1}`.
- Using a set instead of counts (`[0, 0]`, `k = 0`).
- Updating `freq[cur]` **before** reading `cur - k` when `k == 0` (counts the current prefix as its own pair).
- Returning whether one exists (LC 523-ish) instead of the count.

## Follow-ups

- **Subarray Sum Divisible by K (974):** map `prefix % k` (fix negative mods).
- **Continuous Subarray Sum (523):** same mods, length ≥ 2.
- **Maximum Size Subarray Sum Equals K:** store **first** index of each prefix; `j - first[cur-k]`.
- **Count of range sum:** Fenwick / merge on prefixes — only if they go hard.
- **Kadane** if they switch to “largest sum”: [coding-maximum-subarray.md](coding-maximum-subarray.md).

## Sources

- [Subarray Sum Equals K — NeetCode](https://neetcode.io/solutions/subarray-sum-equals-k) — accessed 2026-09-18
- [Subarray Sum Equals K — LeetCode 560](https://leetcode.com/problems/subarray-sum-equals-k/) — accessed 2026-09-18
- [Prefix sum — Wikipedia](https://en.wikipedia.org/wiki/Prefix_sum) — accessed 2026-09-18
- [Two sum — Wikipedia](https://en.wikipedia.org/wiki/Two_sum) — accessed 2026-09-18
- Classic LeetCode #560 / #974 / #523 — prefix + hash
