# Walls and Gates — answer outline

**Prompt:** `m × n` grid: `-1` wall, `0` gate, `INF` (`2^31-1`) empty room. Fill each empty room with the **distance to the nearest gate**. Unreachable rooms stay `INF`. 4-directional. Modify **in place**. (LeetCode 286; NeetCode 150 also uses “treasure chest” wording for `0`.)

This is **multi-source BFS for distance**, the cousin of [coding-rotting-oranges.md](coding-rotting-oranges.md) (minutes until all fresh rot) and [coding-pacific-atlantic.md](coding-pacific-atlantic.md) (reverse reach). Wikipedia [BFS](https://en.wikipedia.org/wiki/Breadth-first_search): unweighted shortest path; first time you touch a cell is the answer.

## Probes

- BFS **from every room** is O((mn)²) — they want **one** BFS from **all gates**.
- First visit is shortest; never write a smaller number later if you only enqueue `INF` cells.
- Walls (`-1`) and gates (`0`) are not destinations to overwrite.
- Empty grid of walls only, or a single gate, or a room boxed in — stay `INF`.

## Strong answer skeleton

1. **Clarify:** 4-dir; in-place; `INF == 2147483647`; distance in **steps**, not Euclidean.
2. **Enqueue every** gate `(r, c)` where `rooms[r][c] == 0`.
3. While queue: pop `(r, c)`; for each 4-neighbor still `INF`: set `rooms[nr][nc] = rooms[r][c] + 1`, enqueue.
4. Do **not** increment a separate “level” if you write `parent + 1` — same result, fewer off-by-ones.
5. **Complexity:** each cell enqueued ≤ once → O(mn) time and O(mn) queue.

DFS / Dijkstra is the wrong shape (unweighted grid). 01 Matrix (LeetCode 542) is the same template from all zeros.

## Sketch

```
INF = 2**31 - 1
q = deque((r,c) for r,c in cells if rooms[r][c] == 0)
while q:
  r,c = q.popleft()
  for nr,nc in neighbors:
    if in_bounds and rooms[nr][nc] == INF:
      rooms[nr][nc] = rooms[r][c] + 1
      q.append((nr,nc))
```

`[[INF,-1,0,INF],[INF,INF,INF,-1],[INF,-1,INF,-1],[0,-1,INF,INF]]` → `[[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]`.

## Mock narration (30 sec)

> “Nearest gate is unweighted shortest path. I multi-source BFS from every gate so the first time I reach a room is the distance. I only step onto INF cells, write parent+1, and enqueue. Linear in cells.”

## Common mistakes

- One BFS per empty room — quadratic, timeouts on 250×250.
- Overwriting gates or walking through walls.
- 8-directional steps; or treating `INF` as “unvisited” after you already wrote a distance, then relaxing again.
- Level-counter off-by-one (counting the gate as distance 1).
- Returning a new grid when they asked in-place.

## Follow-ups

- **Rotting oranges:** same multi-source; return **minutes** or `-1` — [coding-rotting-oranges.md](coding-rotting-oranges.md).
- **01 Matrix:** distance to nearest `0`.
- **Pacific Atlantic:** two reverse multi-source floods; intersect — [coding-pacific-atlantic.md](coding-pacific-atlantic.md).
- Weighted cells → Dijkstra, not this BFS.

## Sources

- [Walls and Gates — NeetCode](https://neetcode.io/solutions/walls-and-gates) — accessed 2026-10-19
- [286. Walls and Gates — LeetCode Wiki](https://leetcode.doocs.org/en/lc/286/) — accessed 2026-10-19
- [Walls and Gates — LeetCode 286](https://leetcode.com/problems/walls-and-gates/) — accessed 2026-10-19
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-10-19
