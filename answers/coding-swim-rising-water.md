# Swim in Rising Water — answer outline

**Prompt:** `n × n` grid of **distinct** heights. At time `t` you may stand on cells with height `≤ t`. You start at `(0,0)` and move 4-directionally. You can wait, so a path’s time is the **max height on that path** (including the start). Return the **minimum** such time to reach `(n-1, n-1)`. (LeetCode 778)

This is a **minimax / bottleneck** path, not a sum of steps. Sibling of [coding-network-delay.md](coding-network-delay.md) (Dijkstra, but relax with `max` not `+`) and [coding-binary-search.md](coding-binary-search.md) (search-on-answer + BFS). NeetCode 150 advanced-graphs box.

## Probes

- Time is **not** hop count. Waiting is free; water only rises.
- You **must** wait for `grid[0][0]` — the answer is at least the start height.
- LC heights are a permutation of `0 … n²-1` (`n ≤ 50`); say that, then write code that does not need it.
- Plain BFS / sum-Dijkstra is the wrong cost.
- Three finishes: Dijkstra-on-max, binary search + reachability, Kruskal / union-find by height.

## Strong answer skeleton — Dijkstra on max

1. **Clarify:** 4-dir; wait allowed; cost of a path = max cell on it; minimize that max.
2. Min-heap of `(time, r, c)` with `time = max height so far`. Push `(grid[0][0], 0, 0)`.
3. Pop the smallest `time`. First time you pop the destination, that `time` is optimal (non-decreasing “weights”).
4. For each unseen neighbor: push `(max(time, grid[nr][nc]), nr, nc)`. Mark a cell **when popped** (or when first pushed — both OK if you skip stale pops).
5. Time `O(n² log n)` with a binary heap; space `O(n²)`.

## Sketch (heap)

```
n = len(grid)
seen = {(0, 0)}
pq = [(grid[0][0], 0, 0)]          # (time, r, c)
while pq:
  t, r, c = heappop(pq)
  if (r, c) == (n - 1, n - 1):
    return t
  for nr, nc in ((r-1,c),(r+1,c),(r,c-1),(r,c+1)):
    if 0 <= nr < n and 0 <= nc < n and (nr, nc) not in seen:
      seen.add((nr, nc))
      heappush(pq, (max(t, grid[nr][nc]), nr, nc))
```

`[[0,2],[1,3]]` → **3**. You wait until `t = 3` so the `3` cell is legal.

## Alternate — binary search + BFS

`can(T)`: BFS/DFS using only cells `≤ T` (start must be `≤ T`). Predicate is monotone → search `T` in `[grid[0][0], max(grid)]`. Same `O(n² log n)` (log of the height range). Union-find: sort cells by height, activate, union 4-neighbors; first time start meets end, that height is the answer.

## Mock narration (30 sec)

> “The clock is the highest tile I step on, not the number of steps. I Dijkstra with a heap keyed by that running max. First time I pop the far corner I am done. If they want the other language I binary-search the water level and BFS through tiles at or below it.”

## Common mistakes

- Relaxing with `+ 1` or `+ height` (shortest *sum*, not minimax).
- Forgetting `grid[0][0]` in the initial time.
- BFS without a `T` cap, or DFS that blows the stack on `n = 50`.
- Binary search `hi` too small (must cover the max cell you might need).
- Re-expanding a cell after it was finalized with a better (smaller) max.

## Follow-ups

- **Path With Minimum Effort (1631):** same minimax; edge cost is `|h1 − h2|`.
- **Network Delay Time (743):** sum-Dijkstra — [coding-network-delay.md](coding-network-delay.md).
- **Koko / search-on-answer:** [coding-koko-bananas.md](coding-koko-bananas.md); here the check is grid reachability.
- Weighted grid with waits that **cost** time: then hop count matters; this prompt’s wait is free.

## Sources

- [Swim in Rising Water — NeetCode](https://neetcode.io/solutions/swim-in-rising-water) — accessed 2026-10-25
- [Swim in Rising Water — LeetCode 778](https://leetcode.com/problems/swim-in-rising-water/) — accessed 2026-10-25
- [Dijkstra's algorithm — Wikipedia](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) — accessed 2026-10-25
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-25
