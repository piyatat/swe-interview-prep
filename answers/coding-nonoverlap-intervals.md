# Non-overlapping Intervals — answer outline

**Prompt:** `intervals[i] = [start_i, end_i]`. Return the **minimum number of intervals to remove** so the rest are non-overlapping. Touching at an endpoint is **not** an overlap (`[1,2]` and `[2,3]` stay). (LeetCode 435)

This is **interval scheduling** (keep the most, then `n − kept`), not merge. Sibling of [coding-merge-intervals.md](coding-merge-intervals.md) (union coverage) and [coding-insert-interval.md](coding-insert-interval.md) (already listed as a follow-up). Named under intervals in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150. Wikipedia [Interval scheduling](https://en.wikipedia.org/wiki/Interval_scheduling).

## Probes

- Min removals ⇔ **max compatible set**. Earliest-finish greedy is the classic proof.
- Sort by **end**, not start. Sorting by start then dropping the later-ending of a clash also works if you rewrite the kept end — say both, implement one.
- Closed vs half-open: this prompt treats `end == next.start` as OK (`<=` vs `<` on the keep test).
- All identical → keep 1, remove `n−1`. Already disjoint → 0.

## Strong answer skeleton

1. **Clarify:** return a **count**, not the surviving list; touching allowed.
2. **Why not DP subset:** 2ⁿ / n² is overkill; greedy is optimal for this objective.
3. **Sort by `end` ascending.** Scan left to right.
4. Keep when `start >= last_kept_end`; else this one is a removal (do **not** move `last_kept_end`).
5. Answer = `n − kept` (or increment removals on each reject).
6. **Complexity:** O(n log n) time, O(1) extra besides sort.

## Sketch (count removals)

```
intervals.sort(key=lambda x: x[1])
kept_end = -inf
remove = 0
for start, end in intervals:
  if start >= kept_end:
    kept_end = end
  else:
    remove += 1
return remove
```

`[[1,2],[2,3],[3,4],[1,3]]` → sort ends; drop `[1,3]`; answer `1`.

## Mock narration (30 sec)

> “Minimum deletions is the complement of the largest non-overlapping set. I’ll sort by finish time and keep an interval only when it starts at or after the last finish. Earliest finish leaves the most room. Removals are n minus how many I kept.”

## Common mistakes

- Sorting by **start** and always dropping the current one (can drop a short early-finish that would have fit).
- Using `<` so touching `[1,2][2,3]` counts as overlap (wrong on this prompt).
- Merging instead of deleting (that is LC 56).
- Returning `kept` instead of `n − kept`.
- Updating `kept_end` on a **rejected** interval (shrinks or expands the fence incorrectly).

## Follow-ups

- **Merge Intervals (56)** — [coding-merge-intervals.md](coding-merge-intervals.md).
- **Insert Interval (57)** — [coding-insert-interval.md](coding-insert-interval.md).
- **Meeting Rooms / Meeting Rooms II** — overlap test vs concurrency heap — [coding-meeting-rooms.md](coding-meeting-rooms.md).
- Weighted interval scheduling → DP on predecessor, not this greedy.

## Sources

- [Non-overlapping Intervals — NeetCode](https://neetcode.io/solutions/non-overlapping-intervals) — accessed 2026-10-10
- [435. Non-overlapping Intervals — LeetCode Wiki](https://leetcode.doocs.org/en/lc/435/) — accessed 2026-10-10
- [Non-overlapping Intervals — LeetCode 435](https://leetcode.com/problems/non-overlapping-intervals/) — accessed 2026-10-10
- [Interval scheduling — Wikipedia](https://en.wikipedia.org/wiki/Interval_scheduling) — accessed 2026-10-10
- [Insert Interval — NeetCode](https://neetcode.io/solutions/insert-interval) — accessed 2026-10-10
