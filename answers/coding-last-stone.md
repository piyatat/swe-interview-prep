# Last Stone Weight — answer outline

**Prompt:** Array `stones`; `stones[i]` is a weight. Repeatedly smash the **two heaviest**. If equal, both vanish; if `x < y`, replace with `y - x`. Return the last stone’s weight, or `0` if none remain. (LeetCode 1046)

This is **repeated extract-max**, not sort-once. Wikipedia [heap](https://en.wikipedia.org/wiki/Heap_(data_structure)): a max-heap keeps the heaviest at the root so each smash is logarithmic. NeetCode 150 heap box. Cousin of [coding-top-k.md](coding-top-k.md) (kth, not a simulation) and [coding-median-stream.md](coding-median-stream.md) (two heaps).

## Probes

- `n` is tiny on LeetCode (≤ 30) so sort-each-step still passes — they still want the **heap**.
- Equal smash: **do not** push `0`. Empty heap → `0`; one stone → that weight.
- Python `heapq` is a **min**-heap: negate, or use a max-heap in Java/C++.
- Last Stone Weight **II** is subset-sum (minimize leftover), not this simulation — [coding-partition-subset.md](coding-partition-subset.md).

## Strong answer skeleton

1. **Clarify:** always the current two heaviest; result is one leftover weight or 0.
2. Heapify into a **max-heap** (or negated min-heap).
3. While ≥ 2 stones: pop `y`, pop `x` (`y ≥ x`). If `y > x`, push `y - x`.
4. Return 0 if empty else the last root.
5. **Complexity:** each smash is two pops + optional push → O(n log n) time, O(n) extra. Sorting every round is O(n² log n) and is the “I have not named a heap” tell.

## Sketch (negated min-heap)

```
h = [-s for s in stones]
heapify(h)
while len(h) > 1:
  y, x = -heappop(h), -heappop(h)
  if y != x:
    heappush(h, -(y - x))
return 0 if not h else -h[0]
```

`[2,7,4,1,8,1]` → smash 8 and 7 → `1` back → … → last `1`. Two equal heaviest: both gone, nothing pushed.

## Mock narration (30 sec)

> “I always need the two heaviest, so this is a max-heap simulation, not a single sort. Pop two; if they differ, push the difference. When fewer than two remain, the heap is empty (zero) or holds the last weight.”

## Common mistakes

- Sorting once and walking the array — new weights are not in order.
- Pushing `0` on a tie (pollutes the heap; usually still lucks into 0, but it is wrong).
- Min-heap without negation → always smash the lightest.
- Confusing with **Last Stone Weight II** (partition / knapsack).
- Claiming O(n) — you pay log n per smash.

## Follow-ups

- **Kth largest / top-k:** [coding-top-k.md](coding-top-k.md) — size-k heap, not n smashes.
- **Kth Largest in a Stream (703):** same max/min-heap idea, online inserts.
- **Last Stone Weight II:** minimize `|sumA − sumB|` — subset DP, not a heap.

## Sources

- [1046. Last Stone Weight — LeetCode](https://leetcode.com/problems/last-stone-weight/) — accessed 2026-11-11
- [Last Stone Weight — NeetCode](https://neetcode.io/solutions/last-stone-weight) — accessed 2026-11-11
- [1046. Last Stone Weight — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/1046/) — accessed 2026-11-11
- [Heap (data structure) — Wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)) — accessed 2026-11-11
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-11
