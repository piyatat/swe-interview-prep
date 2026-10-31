# 01 Matrix — answer outline

**Prompt:** `m × n` binary matrix. For every cell, return the **distance to the nearest `0`**. Adjacent (4-dir) distance is 1. At least one `0`. (LeetCode 542)

This is **multi-source BFS for distance**, the same template as [coding-walls-and-gates.md](coding-walls-and-gates.md) (gates) and [coding-rotting-oranges.md](coding-rotting-oranges.md) (minutes). Wikipedia [BFS](https://en.wikipedia.org/wiki/Breadth-first_search): unweighted shortest path; first visit is the answer.

## Probes

- BFS **from every `1`** is O((mn)²) — they want **one** BFS from **all zeros**.
- First time you touch a `1` is the nearest-`0` distance; do not relax later.
- DP two-pass (top-left then bottom-right, `min` of already-computed neighbors + 1) also works; name it as a follow-up, not the first sketch.
- Constraint usually `m * n ≤ 10^4` — linear is required.

## Strong answer skeleton

1. **Clarify:** 4-dir, not 8; distance in steps; zeros stay `0`; there is ≥1 zero.
2. **Enqueue every** `(r, c)` where `mat[r][c] == 0`. Mark those distance `0`. Unseen `1`s start as `-1` / `INF`.
3. While queue: pop `(r, c)`; for each in-bounds neighbor still unseen: `dist = parent + 1`, enqueue.
4. **Do not** BFS from each `1`. Do not Dijkstra (unweighted).
5. **Complexity:** each cell enqueued ≤ once → O(mn) time and O(mn) queue / output.

In-place: you may overwrite `mat` if they allow; otherwise allocate `dist`. Overwriting `1`s as you go is fine if you never mistake a written distance for a source.

## Sketch (multi-source BFS)

```
dist = [[-1]*n for _ in rows]
q = deque()
for r,c in cells:
  if mat[r][c] == 0:
    dist[r][c] = 0
    q.append((r,c))
while q:
  r,c = q.popleft()
  for nr,nc in neighbors:
    if in_bounds and dist[nr][nc] == -1:
      dist[nr][nc] = dist[r][c] + 1
      q.append((nr,nc))
return dist
```

`[[0,0,0],[0,1,0],[1,1,1]]` → `[[0,0,0],[0,1,0],[1,2,1]]`.

Two-pass DP: init zeros `0`, ones `INF`; scan ↘ with `min(self, up+1, left+1)`; scan ↖ with `min(self, down+1, right+1)`. Same O(mn), no queue.

## Mock narration (30 sec)

> “Nearest zero is unweighted shortest path. I multi-source BFS from every zero so the first time I reach a one is the distance. I only step onto unseen cells, write parent+1, and enqueue. Linear in cells.”

## Common mistakes

- One BFS per `1` — quadratic, timeouts.
- Starting from ones and walking to a zero (works but repeats work).
- 8-directional steps; or relaxing a cell already set (BFS first-hit is enough).
- Forgetting to enqueue **all** zeros before the loop (then distances are from one source).
- DFS / Dijkstra on an unweighted grid.

## Follow-ups

- **Walls and Gates:** same template from gates; walls are impassable — [coding-walls-and-gates.md](coding-walls-and-gates.md).
- **Rotting oranges:** return **minutes** or `-1` — [coding-rotting-oranges.md](coding-rotting-oranges.md).
- **Pacific Atlantic:** two reverse floods; intersect — [coding-pacific-atlantic.md](coding-pacific-atlantic.md).
- Weighted cells → Dijkstra, not this BFS.

## Sources

- [01 Matrix — LeetCode 542](https://leetcode.com/problems/01-matrix/) — accessed 2026-10-31
- [542. 01 Matrix — leetcode.ca](https://leetcode.ca/2017-05-25-542-01-Matrix/) — accessed 2026-10-31
- [01 Matrix — multi-source BFS — eetcode](https://www.eetcode.com/learn/solution_types/multi-source-bfs) — accessed 2026-10-31
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-10-31
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-31
