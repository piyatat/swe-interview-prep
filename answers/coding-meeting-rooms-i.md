# Meeting Rooms — answer outline

**Prompt:** Meeting intervals `[start, end)`. Can **one** person attend all of them? Return true iff **no two overlap**. A meeting that ends at `t` and another that starts at `t` do **not** conflict. (LeetCode 252; Premium on LC, free on NeetCode)

This is the **boolean** sibling of [coding-meeting-rooms.md](coding-meeting-rooms.md) (min rooms = peak concurrency). Same sort-by-start as [coding-merge-intervals.md](coding-merge-intervals.md) and [coding-nonoverlap-intervals.md](coding-nonoverlap-intervals.md), but you only **detect** overlap — you do not merge or count rooms. NeetCode 150 intervals box. Wikipedia [interval scheduling](https://en.wikipedia.org/wiki/Interval_scheduling): compatibility = pairwise non-overlap.

## Probes

- Touching `[1,2][2,3]` → **true** (`end <= next.start`).
- Empty / one interval → true. Unsorted input.
- Brute pairwise is O(n²) and allowed as a warmup; they want sort + adjacent after that.
- After sort-by-start, a conflict always shows up on **neighbors** — you do not need every pair.

## Strong answer skeleton

1. **Clarify:** half-open vs inclusive; `start < end`; return bool, not a room count.
2. Sort by `start`. Scan `i = 1 … n-1`. If `intervals[i-1].end > intervals[i].start`, overlap → false.
3. Finish the scan → true.
4. **Complexity:** O(n log n) time (sort); O(log n) or O(n) extra depending on the sort.

## Sketch

```
sort intervals by start
for i in 1 .. n-1:
  if intervals[i-1].end > intervals[i].start:
    return False
return True
```

`[[0,30],[5,10],[15,20]]` → false (5 < 30). `[[7,10],[2,4]]` → true after sort `[2,4],[7,10]`.

## Mock narration (30 sec)

> “One person cannot sit in two overlapping meetings. I sort by start so any overlap is between adjacent intervals, then fail on `prev.end > curr.start`. Equal endpoints are fine — you can walk out and into the next room at the same instant.”

## Common mistakes

- Using `>=` and rejecting touching meetings (wrong for this spec; II uses `>=` to **reuse** a room).
- Comparing adjacent pairs **without** sorting (misses a later meeting that overlaps an earlier one).
- Returning a room count (that is 253).
- Sorting by end and then checking starts — works only with extra care; start-sort is the standard story.

## Follow-ups

- **Meeting Rooms II (253):** [coding-meeting-rooms.md](coding-meeting-rooms.md) — heap of end times; peak overlap.
- **Merge Intervals (56):** collapse, do not boolean-test.
- **Non-overlapping Intervals (435):** min removals = n − max compatible (earliest-finish greedy).
- **Car pooling / employee free time:** same sweep, different combine.

## Sources

- [252. Meeting Rooms — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/252/) — accessed 2026-11-16
- [Meeting Rooms — NeetCode](https://neetcode.io/solutions/meeting-rooms) — accessed 2026-11-16
- [Interval scheduling — Wikipedia](https://en.wikipedia.org/wiki/Interval_scheduling) — accessed 2026-11-16
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-16
