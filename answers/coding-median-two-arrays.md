# Median of Two Sorted Arrays — answer outline

**Prompt:** Two **already sorted** arrays `nums1` (length `m`) and `nums2` (length `n`). Return the median of the combined multiset. Required time **O(log (m + n))** — a linear merge is the named brute, not the bar. (LeetCode 4)

This is **binary search on a partition**, not “merge then pick the middle.” Cousin of [coding-binary-search.md](coding-binary-search.md) (halve a monotone space) and **not** [coding-median-stream.md](coding-median-stream.md) (online two-heaps, unsorted stream). NeetCode 150 binary-search hard.

## Probes

- Odd total → one middle; even → **mean of two middles** (return `float`).
- Empty side is legal (`m` or `n` may be 0); `m + n ≥ 1`.
- Duplicates allowed; “sorted” is non-decreasing.
- Merge + index is O(m + n) and fails the stated bound. They still want you to **name** it.
- Search the **shorter** array so the other cut is determined.

## Strong answer skeleton — partition

1. **Clarify:** median of the union, not of each array; even vs odd; empty side.
2. **Goal:** cut both arrays so the left side has `(m + n + 1) // 2` elements and `max(left) ≤ min(right)`.
3. Binary-search cut `i` on the shorter array `A`; `j = half - i` on `B`.
4. If `A[i-1] > B[j]` → `i` is too far right. If `B[j-1] > A[i]` → `i` is too far left.
5. When the cut is valid: odd → `max(left)`; even → average of `max(left)` and `min(right)`. Sentinel `±inf` on empty sides.
6. **Complexity:** O(log min(m, n)) time, O(1) extra. Equivalent k-th-element drop-half is O(log (m + n)).

## Sketch (cut on shorter)

```
if len(A) > len(B): A, B = B, A
m, n = len(A), len(B)
half = (m + n + 1) // 2
lo, hi = 0, m
while lo <= hi:
  i = (lo + hi) // 2
  j = half - i
  aL = A[i-1] if i else -inf
  aR = A[i] if i < m else inf
  bL = B[j-1] if j else -inf
  bR = B[j] if j < n else inf
  if aL > bR: hi = i - 1
  elif bL > aR: lo = i + 1
  else:
    left = max(aL, bL)
    if (m + n) % 2: return float(left)
    return (left + min(aR, bR)) / 2
```

`[1,3]` + `[2]` → `2`. `[1,2]` + `[3,4]` → `2.5`. One empty + `[2,3]` → `2.5`.

## Mock narration (30 sec)

> “I am not merging. I binary-search a cut on the shorter array so the left half of the union is just big enough, and every left value is ≤ every right value. The median sits on that cut. Sentinels handle empty sides. Logarithmic in the shorter length.”

## Common mistakes

- Merging then indexing — correct answer, wrong complexity.
- Forgetting even vs odd (returning only `max(left)` on even).
- Cutting the longer array and overflowing `j`.
- Off-by-one `half` so left is too small / too big.
- Integer division of the two middles (need a float mean).

## Follow-ups

- **k-th of two sorted:** same drop-half; median is k = (total+1)//2 and (total+2)//2.
- **Median of a stream:** [coding-median-stream.md](coding-median-stream.md) — two heaps, not this cut.
- **Rotated + median:** not this problem; restore sort or search-on-answer first.

## Sources

- [4. Median of Two Sorted Arrays — LeetCode](https://leetcode.com/problems/median-of-two-sorted-arrays/) — accessed 2026-11-13
- [Median of Two Sorted Arrays — NeetCode](https://neetcode.io/solutions/median-of-two-sorted-arrays) — accessed 2026-11-13
- [4. Median of Two Sorted Arrays — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/4/) — accessed 2026-11-13
- [Binary search algorithm — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm) — accessed 2026-11-13
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-13
