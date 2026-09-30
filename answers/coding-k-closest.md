# K Closest Points to Origin — answer outline

**Prompt:** `points[i] = [xi, yi]`. Return the **k** points closest to `(0, 0)` (Euclidean). Any order; unique answer except order. (LeetCode 973)

This is **order statistics on distance**, not [coding-top-k.md](coding-top-k.md) (kth value / k frequent). Compare **squared** distance `x*x + y*y` — `sqrt` is monotone and slower. Wikipedia [binary heap](https://en.wikipedia.org/wiki/Binary_heap): size-*k* max-heap drops the farthest. NeetCode 150 heap box.

## Probes

- `k == n` → return a copy; do not over-engineer.
- Ties: problem says the *set* of k closest is unique.
- Origin itself `[0,0]` is valid.
- Coordinates can be negative; squares still work (no overflow talk unless they use 32-bit `x*x` — mention 64-bit / long).
- Sort all n is correct O(n log n) but they usually want **O(n log k)** or average O(n) quickselect.

## Strong answer skeleton — max-heap of size k

1. **Clarify:** Euclidean; any order; k in `[1, n]`.
2. Push `(dist2, point)` into a **max**-heap; if size > k, pop (farthest of the current closest-k).
3. Drain the heap. O(n log k) time, O(k) extra.
4. **Name the alternatives:** full sort O(n log n); quickselect on `dist2` average O(n), worst O(n²).

Python’s `heapq` is a min-heap — store **negative** `dist2` to simulate max.

## Sketch (size-k max-heap)

```
h = []  # max-heap via -dist2
for x, y in points:
  d2 = x*x + y*y
  heappush(h, (-d2, x, y))
  if len(h) > k: heappop(h)
return [[x, y] for _, x, y in h]
```

`[[1,3],[-2,2]]`, k=1 → `[[-2,2]]` because 8 < 10.

## Strong answer skeleton — quickselect

Partition on `dist2`; target the kth-smallest distance; recurse **one** side. Average linear; mention quadratic worst case and random pivot. Do **not** claim the k-side is sorted.

## Mock narration (30 sec)

> “I don’t need a full sort. Squared distance keeps order. I’ll keep a max-heap of k points so the farthest of the closest k sits at the root — pop when size exceeds k. That’s O(n log k). If they want average linear, that’s quickselect on squared distance.”

## Common mistakes

- Min-heap of **all n** (no k-asymmetry) then slice — extra memory.
- Comparing `sqrt` (slower, float noise) instead of `x*x+y*y`.
- Max-heap vs min-heap flipped (returning the **farthest** k).
- Quickselect claiming sorted output.
- Mutating `points` in quickselect without asking.

## Follow-ups

- **Streaming / unbounded:** heap stays; full sort does not.
- **K farthest:** min-heap of size k, or negate the compare.
- **Kth closest only:** quickselect; do not materialize all k if they do not ask.

## Sources

- [K Closest Points to Origin — NeetCode](https://neetcode.io/solutions/k-closest-points-to-origin) — accessed 2026-09-30
- [973. K Closest Points to Origin — LeetCode Wiki](https://leetcode.doocs.org/en/lc/973/) — accessed 2026-09-30
- [K Closest Points to Origin — LeetCode 973](https://leetcode.com/problems/k-closest-points-to-origin/) — accessed 2026-09-30
- [Binary heap — Wikipedia](https://en.wikipedia.org/wiki/Binary_heap) — accessed 2026-09-30
- [Quickselect — Wikipedia](https://en.wikipedia.org/wiki/Quickselect) — accessed 2026-09-30
