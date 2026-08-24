# Merge Intervals — answer outline

**Prompt:** Given `intervals[i] = [start_i, end_i]`, merge all overlaps and return the covering non-overlapping intervals. (LeetCode 56)

This is the **sort-then-sweep** pattern behind calendars, coverage, and many “range” follow-ups. Listed in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Overlap after sort: `next.start <= last.end` (usually **`<=`** so touching ranges merge).
- Nested interval: must take **`max` of ends**, not blindly overwrite.
- Empty input; single interval; unsorted input (you must sort unless the prompt says sorted).
- Closed vs half-open ranges — confirm with the interviewer.

## Strong answer skeleton

1. **Clarify:** inclusive ends? integer coords? `start <= end` guaranteed?
2. **Why sort:** unsorted overlap is O(n²) pairwise. After sort by **start**, any overlap is **adjacent** in the sweep.
3. **Sweep:** keep a `current` (or `merged[-1]`). If next overlaps, `end = max(end, next.end)`; else commit and start a new interval.
4. **Complexity:** O(n log n) time (sort), O(n) extra for the output (in-place possible if you overwrite, still O(log n) sort stack).

## Sweep sketch

```
sort intervals by start
merged = [intervals[0]]
for start, end in intervals[1:]:
  if start <= merged[-1].end:
    merged[-1].end = max(merged[-1].end, end)
  else:
    merged.append([start, end])
return merged
```

Walk `[1,3],[2,6],[8,10],[15,18]` → `[1,6],[8,10],[15,18]`. Nested `[1,10],[2,3]` → `[1,10]`.

## Mock narration (30 sec)

> “I’ll sort by start so I only compare each interval to the last merged one. Overlap or touch — extend the end with max. Gap — append a new block. That’s greedy after the sort.”

## Common mistakes

- Comparing with `<` and leaving `[1,2][2,3]` unmerged when the prompt wants merge.
- Setting `end = next.end` and shrinking a nested cover.
- Forgetting to sort; assuming input order.
- Off-by-one on empty / one-element lists.
- Meeting Rooms II: **not** merge — count concurrent with a min-heap on **end** times.

## Follow-ups

- **Insert Interval (57):** input already sorted; three phases (before / overlap / after).
- **Meeting Rooms (252):** overlap? sort and check `start < previous end`.
- **Meeting Rooms II (253):** min rooms = max concurrency; heap of end times.
- **Employee Free Time (759):** merge all, then gaps.

## Sources

- [Merge Intervals walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/merge-intervals-interview-walkthrough/) — accessed 2026-08-24
- [Merge Intervals pattern — Abstract Algorithms](https://abstractalgorithms.hashnode.dev/merge-intervals-pattern) — accessed 2026-08-24
- [Merge Intervals pattern 2026 — PapersAdda](https://papersadda.com/article/merge-intervals-pattern-2026/) — accessed 2026-08-24
- Classic LeetCode #56 / #57 / #252 / #253 — interval family
