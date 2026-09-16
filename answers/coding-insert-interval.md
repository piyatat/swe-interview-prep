# Insert Interval — answer outline

**Prompt:** You are given **non-overlapping** intervals sorted by start. Insert `newInterval` and return the list still sorted and non-overlapping (merge if needed). (LeetCode 57)

This is the **already-sorted** cousin of [coding-merge-intervals.md](coding-merge-intervals.md). You do **not** sort again. NeetCode 150 / Blind 75 intervals box; listed in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Input guarantee: sorted, pairwise non-overlapping. If the interviewer drops that, fall back to merge-intervals (sort + sweep).
- Closed vs half-open — confirm overlap: usually `a.end >= b.start`.
- `newInterval` may sit **before all**, **after all**, or swallow several.
- Empty `intervals` → `[newInterval]`.

## Strong answer skeleton

1. **Clarify:** inclusive ends? `start <= end`? integers?
2. **Three phases** (linear scan, one pass):
   - **Before:** `end < new.start` → copy as-is.
   - **Overlap:** `start <= new.end` (and not already in “before”) → `new = [min(starts), max(ends)]`.
   - **After:** remaining intervals start after the merged `new.end` → append `new` once, then copy the rest.
3. **Why it is enough:** because the input is sorted and disjoint, overlap is a **contiguous** block.
4. **Complexity:** O(n) time, O(n) output. Binary-search the first overlap is optional — still Θ(n) to write the result.

## Sketch (three phases)

```
res = []
i = 0
n = len(intervals)
# before
while i < n and intervals[i][1] < new[0]:
  res.append(intervals[i]); i += 1
# merge overlap
while i < n and intervals[i][0] <= new[1]:
  new[0] = min(new[0], intervals[i][0])
  new[1] = max(new[1], intervals[i][1])
  i += 1
res.append(new)
# after
while i < n:
  res.append(intervals[i]); i += 1
return res
```

Walk `[[1,3],[6,9]]` + `[2,5]` → `[[1,5],[6,9]]`. `[[1,2],[3,5],[6,7],[8,10],[12,16]]` + `[4,8]` → `[[1,2],[3,10],[12,16]]`.

## Mock narration (30 sec)

> “The list is already sorted and disjoint, so I copy everything that ends before the new start, merge the contiguous overlap with min/max, append the merged interval once, then copy the tail. Linear, no sort.”

## Common mistakes

- Sorting first (wastes n log n and hides the invariant).
- Merging with `<` and leaving touching `[1,2][2,3]` split when the prompt wants merge.
- Appending `new` in the overlap loop (duplicates).
- Forgetting the “new sits in a gap” case — overlap loop never runs; you still append `new`.
- Mutating `newInterval` without a local copy if they want the input untouched.

## Follow-ups

- **Merge Intervals (56):** unsorted — [coding-merge-intervals.md](coding-merge-intervals.md).
- **Non-overlapping Intervals (435):** min removals so none overlap — sort by **end**, greedy keep.
- **Meeting Rooms II:** concurrency heap, not merge — [coding-meeting-rooms.md](coding-meeting-rooms.md).

## Sources

- [Insert Interval — NeetCode](https://neetcode.io/solutions/insert-interval) — accessed 2026-09-16
- [Insert Interval — LeetCode 57](https://leetcode.com/problems/insert-interval/) — accessed 2026-09-16
- [Interval scheduling — Wikipedia](https://en.wikipedia.org/wiki/Interval_scheduling) — accessed 2026-09-16
- [Insert and Merge Interval — GeeksforGeeks](https://www.geeksforgeeks.org/dsa/insert-in-sorted-and-non-overlapping-interval-array/) — accessed 2026-09-16
- Classic LeetCode #57 — three-phase scan on a sorted disjoint list
