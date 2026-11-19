# Path With Minimum Effort — answer outline

**Prompt:** `heights` is an `m × n` grid. Start at `(0,0)`, walk 4-directionally to `(m-1, n-1)`. A path’s **effort** is the **max** absolute height difference between consecutive cells. Return the **minimum** effort of any path. (LeetCode 1631)

This is a **minimax / bottleneck** path: minimize the worst step, not the sum of steps. Sibling of [coding-swim-rising-water.md](coding-swim-rising-water.md) (minimax on **cell height**) and [coding-network-delay.md](coding-network-delay.md) (Dijkstra, but relax with `+` not `max`). NeetCode 150 advanced-graphs box. Wikipedia [Dijkstra](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm).

## Probes

- Effort is **max |Δh|**, not hop count and not sum of |Δh|.
- 4-dir only (not 8). Start effort is **0** (you are already on `(0,0)`).
- `m, n ≤ 100`, heights up to `10^6` — heap Dijkstra or binary search + BFS both fit.
- Plain BFS treats every step as cost 1 — wrong cost.

## Strong answer skeleton — Dijkstra on max

1. **Clarify:** 4-dir; effort = max edge so far; minimize that max; start effort 0.
2. `dist[r][c] = inf` except `dist[0][0] = 0`. Min-heap of `(effort, r, c)`.
3. Pop the smallest effort. Skip stale pops (`effort > dist[r][c]`). First time you pop the destination, return that effort.
4. For each in-bound neighbor: `e = max(effort, abs(h[nr][nc] - h[r][c]))`. If `e < dist[nr][nc]`, set and push.
5. Time `O(mn log(mn))` with a binary heap; space `O(mn)`.

## Sketch (heap)

```
m, n = len(H), len(H[0])
dist = [[inf]*n for _ in range(m)]
dist[0][0] = 0
pq = [(0, 0, 0)]                    # effort, r, c
while pq:
  e, r, c = heappop(pq)
  if e > dist[r][c]: continue
  if (r, c) == (m-1, n-1): return e
  for nr, nc in ((r-1,c),(r+1,c),(r,c-1),(r,c+1)):
    if 0 <= nr < m and 0 <= nc < n:
      ne = max(e, abs(H[nr][nc] - H[r][c]))
      if ne < dist[nr][nc]:
        dist[nr][nc] = ne
        heappush(pq, (ne, nr, nc))
```

`[[1,2,2],[3,8,2],[5,3,5]]` → **2**. The path that hugs the `2`s never takes a step worse than 2.

## Alternate — binary search + BFS

`can(T)`: BFS/DFS using only edges with `|Δh| ≤ T`. Predicate is monotone → search `T` in `[0, max(H) - min(H)]`. Same `O(mn log H)` feel. Union-find: sort edges by |Δh|, union endpoints, first time start meets end that |Δh| is the answer.

## Mock narration (30 sec)

> “Effort is the hardest single step on the path, not the sum. I Dijkstra with the heap keyed by that running max: new effort is max(current, |height difference|). First time I pop the far corner I am done. If they want the other language I binary-search the effort cap and BFS through edges at or below it.”

## Common mistakes

- Relaxing with `+ abs(Δh)` (shortest **sum**, not minimax).
- Using hop-count BFS.
- Forgetting the start cell’s effort is 0, or treating `heights[0][0]` as the initial effort (unlike swim-in-rising-water).
- 8-directional moves.
- Re-expanding after a cell is finalized with a better (smaller) max.

## Follow-ups

- **Swim in Rising Water (778):** minimax on the **cell** you stand on — [coding-swim-rising-water.md](coding-swim-rising-water.md).
- **Network Delay Time (743):** sum-Dijkstra — [coding-network-delay.md](coding-network-delay.md).
- **Koko / search-on-answer:** [coding-koko-bananas.md](coding-koko-bananas.md); here the check is grid reachability under a cap.
- Path that **must** also minimize hops among min-effort routes: keep `(effort, steps)` in the heap key.

## Sources

- [1631. Path With Minimum Effort — LeetCode](https://leetcode.com/problems/path-with-minimum-effort/) — accessed 2026-11-19
- [Path With Minimum Effort — NeetCode](https://neetcode.io/solutions/path-with-minimum-effort) — accessed 2026-11-19
- [Dijkstra's algorithm — Wikipedia](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) — accessed 2026-11-19
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-19
- [Path With Minimum Effort template — NeetCode Practice Framework](https://lufftw.github.io/neetcode/patterns/shortest_path/templates/) — accessed 2026-11-19
