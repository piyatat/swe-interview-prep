# Sort Colors — answer outline

**Prompt:** Array `nums` of `0` / `1` / `2` (red / white / blue). Sort **in place** so colors are adjacent in that order. **No** library sort. (LeetCode 75)

This is the **Dutch national flag** partition, not a general sort. Sibling of [coding-set-matrix-zeroes.md](coding-set-matrix-zeroes.md) (in-place markers) and [coding-merge-intervals.md](coding-merge-intervals.md) (linear scan after a cheap key). Wikipedia [Dutch national flag problem](https://en.wikipedia.org/wiki/Dutch_national_flag_problem). NeetCode 150 two-pointer / array box.

## Probes

- Follow-up: **one pass**, **O(1)** extra memory (count-then-overwrite is two passes — say so).
- `n` is tiny (≤ 300) so `O(n log n)` would pass judges; they still want the partition.
- Only three values. Four-way partition is a different problem.
- In-place: they score **swaps**, not a new array.

## Strong answer skeleton — three pointers

1. **Clarify:** mutate `nums`; return void; empty / all-one-color are fine.
2. **Count pass (say first):** tally `0,1,2`, then overwrite. Correct, two passes, O(1) space.
3. **One pass:** `lo` = end of `0`s, `hi` = start of `2`s, `i` scans unknown.
4. `nums[i] == 0`: swap with `++lo`, then `i++` (swapped-in value is already seen).
5. `nums[i] == 2`: swap with `--hi`, **do not** increment `i` (new value is unseen).
6. `nums[i] == 1`: `i++`. Stop when `i == hi`.
7. **Complexity:** O(n) time, O(1) space.

## Sketch

```
lo, i, hi = 0, 0, len(nums)
while i < hi:
  if nums[i] == 0:
    nums[lo], nums[i] = nums[i], nums[lo]
    lo += 1; i += 1
  elif nums[i] == 2:
    hi -= 1
    nums[i], nums[hi] = nums[hi], nums[i]
  else:
    i += 1
```

`[2,0,2,1,1,0]` → `[0,0,1,1,2,2]`. All `1`s: `i` walks; `lo` stays 0; `hi` stays `n`.

## Mock narration (30 sec)

> “Three values, so I partition like Dutch flag. Low pointer eats zeros, high pointer eats twos, mid walks. After a swap from the high side I re-check that cell — it might be a zero I still have to place.”

## Common mistakes

- Incrementing `i` after a `2`-swap — the incoming value is not partitioned yet.
- Using `<` instead of `<=` on the mid/hi bound and leaving a stray `2` in the middle.
- Building a new list and calling it in-place.
- Counting sort but forgetting the overwrite order (`0` then `1` then `2`).
- Treating it as “sort any ints” and writing quicksort.

## Follow-ups

- **k colors:** counting sort if k is tiny; otherwise a real sort.
- **Wiggle sort / sort by parity:** different invariants; do not reuse three pointers blindly.
- **Stable partition:** this swap method is **not** stable — say so if they ask.
- **Linked list:** counting or two dummy lists; no index swaps.

## Sources

- [Sort Colors — NeetCode](https://neetcode.io/solutions/sort-colors) — accessed 2026-10-03
- [75. Sort Colors — LeetCode Wiki](https://leetcode.doocs.org/en/lc/75/) — accessed 2026-10-03
- [Sort Colors — LeetCode 75](https://leetcode.com/problems/sort-colors/) — accessed 2026-10-03
- [Dutch national flag problem — Wikipedia](https://en.wikipedia.org/wiki/Dutch_national_flag_problem) — accessed 2026-10-03
