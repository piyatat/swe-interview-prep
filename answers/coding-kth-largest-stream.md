# Kth Largest Element in a Stream — answer outline

**Prompt:** Design `KthLargest`: construct with `k` and an initial array `nums`; `add(val)` inserts into the stream and returns the **k-th largest** value so far (duplicates count). There will be at least `k` values when you query. (LeetCode 703)

This is a **size-k min-heap**, not a sorted list you re-sort on every add. Cousin of [coding-top-k.md](coding-top-k.md) (offline kth) and [coding-last-stone.md](coding-last-stone.md) (max-heap simulation). Opposite of [coding-median-stream.md](coding-median-stream.md) (two heaps, both halves). NeetCode 150 heap easy.

## Probes

- k-th **largest**, including duplicates: 2nd largest of `[1,2,3,3]` is `3`.
- Initial `nums` may be shorter than `k`; later `add`s fill it (wiki constraints: `1 ≤ k ≤ nums.length + 1`).
- Sorting on every `add` is O(n log n) per call — they want you to **name** it, then reject it.
- Min-heap of the **k largest**: the root is the smallest of those k → the k-th largest overall.
- Max-heap of everything: you would need to pop k times per query or scan — wrong shape.

## Strong answer skeleton

1. **Clarify:** k-th largest not smallest; duplicates; `add` returns the current k-th.
2. Keep a **min-heap** of at most `k` values.
3. On construct, `add` each initial number (or heapify then pop extras).
4. On `add`: push `val`; if size > `k`, pop the min. Return the root.
5. **Complexity:** O(log k) per add, O(k) space. Seeding `n` values is O(n log k).

Do **not** skip the pop when `val` is smaller than the root *and* the heap is already size k — pushing then popping is the same O(log k) and simpler; an early-out `if val <= heap[0] and len == k: return heap[0]` is a valid micro-opt, not required.

## Sketch

```
class KthLargest:
  def __init__(self, k, nums):
    self.k, self.h = k, []
    for x in nums:
      self.add(x)

  def add(self, val):
    heappush(self.h, val)
    if len(self.h) > self.k:
      heappop(self.h)
    return self.h[0]
```

`KthLargest(3, [4,5,8,2])` then `add(3)` → `4`; `add(5)` → `5`; `add(10)` → `5`; `add(9)` → `8`.

## Mock narration (30 sec)

> “I only need the k largest, so a min-heap of size k is enough. The root is the k-th. Each add pushes, and if we grew past k we drop the new smallest. Return the root. Linear extra space in k, log k per insert.”

## Common mistakes

- Max-heap of all values, then “the k-th is somewhere in the heap” — not O(1) to read.
- Re-sorting the whole history on each `add`.
- Size-k **max**-heap (root is the largest, not the k-th).
- Forgetting to pop when size exceeds k, so the root is no longer the k-th.
- Off-by-one: k-th **smallest**, or 1-based vs 0-based in a sorted copy.

## Follow-ups

- **Kth largest in an array (215):** [coding-top-k.md](coding-top-k.md) — heap or quickselect, offline.
- **Median stream:** [coding-median-stream.md](coding-median-stream.md) — two heaps, rebalance.
- **Last stone:** [coding-last-stone.md](coding-last-stone.md) — max-heap smash, not a running k-th.

## Sources

- [703. Kth Largest Element in a Stream — LeetCode](https://leetcode.com/problems/kth-largest-element-in-a-stream/) — accessed 2026-11-13
- [Kth Largest Element in a Stream — NeetCode](https://neetcode.io/solutions/kth-largest-element-in-a-stream) — accessed 2026-11-13
- [703. Kth Largest Element in a Stream — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/703/) — accessed 2026-11-13
- [Heap (data structure) — Wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)) — accessed 2026-11-13
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-13
