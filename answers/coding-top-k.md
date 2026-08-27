# Top-K (kth largest + k frequent) — answer outline

**Prompts:** (1) Find the **kth largest** element in an unsorted array (LeetCode 215). (2) Return the **k most frequent** elements (LeetCode 347; order usually does not matter).

Listed as a medium in [../general/coding-patterns.md](../general/coding-patterns.md). Heap family cousin of [coding-merge-k-lists.md](coding-merge-k-lists.md) (k lists, not k order statistics).

## Probes

- Sort is O(n log n) — when is that good enough?
- **Min-heap of size k** vs **max-heap of n** vs **quickselect**.
- 347 follow-up: **better than O(n log n)** → bucket by frequency (counts ∈ [1, n]).
- Streaming / unbounded input: heap stays; full sort and bucket-of-n do not.
- Quickselect: **kth only**; recovering **sorted** top-k needs extra work.

## Strong answer skeleton

1. **Clarify:** kth **largest** vs smallest; duplicates; k vs n; 347 unique values vs counts.
2. **Name three costs before coding:**

   | Approach | Time | When |
   | --- | --- | --- |
   | Sort | O(n log n) | k ≈ n, or you need full order |
   | Min-heap size k | O(n log k), space O(k) | Default; k ≪ n; streams |
   | Quickselect | O(n) avg, O(n²) worst | In-memory, need the threshold |
   | Bucket by freq | O(n) | 347; frequencies bounded by n |

3. **Heap (215):** scan; push; if size > k, pop min. Root is kth largest. Heap holds the k largest.
4. **Quickselect (215):** target index `n - k` in 0-based ascending; partition; recurse **one** side. Random pivot; mention O(n²) worst.
5. **347:** `Counter` then either size-k heap on **(freq, value)** or `buckets[freq].append(value)` and walk freq from n down until k values.

## Sketch (heap, 215)

```
h = min-heap
for x in nums:
  push x
  if len(h) > k: pop
return h[0]
```

Walk `[3,2,1,5,6,4]`, k=2 → heap ends `{5,6}`, root **5**.

## Sketch (bucket, 347)

```
count = Counter(nums)
buckets = [[] for _ in 0..n]
for val, f in count: buckets[f].append(val)
out = []
for f from n down to 1:
  out.extend(buckets[f])
  if len(out) >= k: return out[:k]
```

`[1,1,1,2,2,3]`, k=2 → `{1:3, 2:2, 3:1}` → **[1, 2]**.

## Mock narration (30 sec)

> “I don’t need a full sort. I’ll keep a min-heap of size k so the smallest of the k largest is at the root — O(n log k). If you want average linear, that’s quickselect on index n−k, with a random pivot and a quadratic worst case. For top-k frequent I’ll count in a hash map, then either the same heap or bucket-sort by count because count cannot exceed n.”

## Common mistakes

- Max-heap of **all n** (no k-asymmetry).
- Quickselect claiming sorted top-k (partition leaves the k-side **unordered**).
- 347 heap on **values** instead of **frequencies**.
- Off-by-one: kth **largest** vs kth **smallest** index.
- Mutating the caller’s array in quickselect without asking.

## Follow-ups

- **K closest points** — heap on distance, or quickselect on distance.
- **Median from stream** — two heaps (harder; not this page).
- Unbounded log lines: heap or sketch; cannot bucket on n.

## Sources

- [Quickselect — Wikipedia](https://en.wikipedia.org/wiki/Quickselect) — accessed 2026-08-27
- [Top-K via heap or quickselect — DSA Handbook](https://dsa.handbook.academy/patterns/top-k-heap-or-quickselect/) — accessed 2026-08-27
- [Quickselect vs heap for top-K — DSA Handbook](https://dsa.handbook.academy/patterns/quickselect-vs-heap-top-k/) — accessed 2026-08-27
- [Top K Elements Pattern 2026 — PapersAdda](https://papersadda.com/article/top-k-elements-pattern-2026/) — accessed 2026-08-27
- Classic LeetCode #215 / #347 — heap / order-statistic family
