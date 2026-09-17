# Find Median from Data Stream — answer outline

**Prompt:** Implement `MedianFinder`: `addNum(int)` inserts into a stream; `findMedian()` returns the median of all values so far (odd count → middle; even → mean of the two middles). (LeetCode 295)

This is the usual **two-heap** design problem. Same family as [coding-top-k.md](coding-top-k.md) (heap of bounded size) but you keep **both halves** of the sorted order, not the k largest. Listed as a hard sample in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Sort-on-query is O(n log n) per `findMedian` — too slow at 5e4 mixed calls.
- Insertion into a sorted list is O(n). Need O(log n) insert, O(1) median.
- Even vs odd: two middles vs one. Integers in, `double` out — watch integer division.
- Which heap is “low” (max-heap) vs “high” (min-heap)? Size invariant.

## Strong answer skeleton

1. **Clarify:** `findMedian` only after ≥1 insert; duplicates allowed; negatives OK; even median is the **mean**, not either middle.
2. **Brute force:** store a list; sort (or insert in order) on query. Correct, too slow.
3. **Two heaps:** `low` = max-heap of the smaller half; `high` = min-heap of the larger half. Invariant: `low` and `high` sizes differ by at most 1; every value in `low` ≤ every value in `high`.
4. **Insert:** push into `low`; move `low`’s max into `high` if it belongs on the right (or always push-then-rebalance). Rebalance so `|size(low) - size(high)| ≤ 1`. Convention: keep `low` one larger on odd counts so the median is `low[0]`.
5. **Median:** if sizes equal → `(low[0] + high[0]) / 2.0`; else the root of the larger heap.
6. **Complexity:** O(log n) per insert, O(1) median, O(n) space.

## Sketch (low one larger)

```
# low: max-heap (store negatives in Python), high: min-heap
addNum(x):
  push x onto low
  push pop(low) onto high          # largest of low → high
  if len(high) > len(low):
    push pop(high) onto low        # restore low ≥ high

findMedian():
  if len(low) > len(high): return float(low[0])
  return (low[0] + high[0]) / 2.0
```

`add 1, 3, 2` → medians `1`, `2`, `2`. After `1,3` the heaps are `{1}` and `{3}`.

Do not sort. Do not keep an indexable balanced BST unless they ask (works, heavier to code live).

## Mock narration (30 sec)

> “I split the stream into a max-heap of the lower half and a min-heap of the upper half, and I rebalance so their sizes differ by at most one. The median is the extra root, or the average of the two roots. Insert is log n; query is constant.”

## Common mistakes

- Integer `/` on the even case (`(a+b)/2` in Java truncates).
- Forgetting to move the just-inserted value across the cut (`low`’s max > `high`’s min).
- Letting one heap grow by 2 — median is then not a root.
- Using two min-heaps and losing the lower-half maximum.
- Claiming O(1) insert (that is counting / bucket tricks, not the general stream).

## Follow-ups

- **Sliding window median (480):** same two heaps plus lazy deletion (or a policy for expired values).
- **kth in a stream:** one heap of size k — [coding-top-k.md](coding-top-k.md).
- Multithread `addNum`: lock both heaps as one critical section.

## Sources

- [Find Median from Data Stream — NeetCode](https://neetcode.io/solutions/find-median-from-data-stream) — accessed 2026-09-17
- [Find Median from Data Stream — LeetCode 295](https://leetcode.com/problems/find-median-from-data-stream/) — accessed 2026-09-17
- [Heap (data structure) — Wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)) — accessed 2026-09-17
- [Median — Wikipedia](https://en.wikipedia.org/wiki/Median) — accessed 2026-09-17
- Classic LeetCode #295 — two-heap running median
