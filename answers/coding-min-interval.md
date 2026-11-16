# Minimum Interval to Include Each Query — answer outline

**Prompt:** Inclusive intervals `[left, right]` (size = `right - left + 1`) and queries `q_j`. For each query, size of the **shortest** interval that covers `q_j`, or `-1`. (LeetCode 1851)

n, m ≤ **1e5** — nested scan is TLE. This is an **offline sweep**: sort queries, add intervals whose left is already ≤ q, drop those whose right is already < q, read the min size from a heap. Sibling of [coding-meeting-rooms.md](coding-meeting-rooms.md) (heap of ends) and [coding-koko-bananas.md](coding-koko-bananas.md) (search on answer — **not** this problem; sizes are not monotone in q). NeetCode 150 intervals hard. Wikipedia [sweep line](https://en.wikipedia.org/wiki/Sweep_line_algorithm): process events in x-order; only the active set matters.

## Probes

- Inclusive: `[4,4]` covers 4 with size **1**.
- Queries are **independent**; order of answers must match the **original** query index.
- A long interval that starts early can still be the min cover of a later q if nothing shorter remains.
- Heap ordered by **size**; stale entries (right < q) stay until they hit the top — lazy delete.

## Strong answer skeleton

1. **Clarify:** inclusive ends; size `r - l + 1`; missing → `-1`; offline reorder OK.
2. Sort intervals by `left`. Sort copies of queries as `(q, original_index)`.
3. Pointer `i` over intervals. Min-heap of `(size, right)`.
4. For each query `q` in ascending order:
   - Push every interval with `left <= q`.
   - Pop while heap top `right < q`.
   - If heap non-empty, `ans[index] = top.size`; else `-1`.
5. **Complexity:** O((n + m) log (n + m)) time; O(n + m) space.

## Sketch

```
intervals.sort(by left)
qs = sorted((q, j) for j, q in enumerate(queries))
ans = [-1] * m
heap = []          # (size, right)
i = 0
for q, j in qs:
  while i < n and intervals[i][0] <= q:
    l, r = intervals[i]; i += 1
    heappush(heap, (r - l + 1, r))
  while heap and heap[0][1] < q:
    heappop(heap)
  if heap:
    ans[j] = heap[0][0]
return ans
```

`intervals=[[1,4],[2,4],[3,6],[4,4]]`, `queries=[2,3,4,5]` → `[3,3,1,4]`.

## Mock narration (30 sec)

> “I cannot scan n intervals per query. I sort both, walk queries left to right, and keep a min-heap of interval sizes that have already started. I drop anything that already ended before this q. The heap top is the shortest cover still alive. I write back through the original index.”

## Common mistakes

- Online per query without sorting → O(nm).
- Heap of **right** only (you need the **size** as the key).
- Forgetting original indices after sorting queries.
- Popping on `right <= q` (interval is inclusive).
- Segment tree / sparse table over 1e7 coordinates without compression — legal but heavier than the sweep.

## Follow-ups

- **Meeting Rooms II:** same “active intervals” heap; combine is count, not min size.
- **Jump Game II / sliding window max:** different monotone structure.
- Online (queries arrive live): need a dynamic structure (policy-based / segment tree on compressed coords).

## Sources

- [1851. Minimum Interval to Include Each Query — LeetCode](https://leetcode.com/problems/minimum-interval-to-include-each-query/) — accessed 2026-11-16
- [Minimum Interval to Include Each Query — NeetCode](https://neetcode.io/solutions/minimum-interval-to-include-each-query) — accessed 2026-11-16
- [1851. Minimum Interval to Include Each Query — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/1851/) — accessed 2026-11-16
- [Sweep line algorithm — Wikipedia](https://en.wikipedia.org/wiki/Sweep_line_algorithm) — accessed 2026-11-16
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-16
