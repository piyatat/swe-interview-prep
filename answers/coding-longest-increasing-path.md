# Longest Increasing Path in a Matrix — answer outline

**Prompt:** `m × n` integer matrix. From a cell you may walk **up / down / left / right** (no diagonals, no wrap). Return the length of the **longest strictly increasing** path. (LeetCode 329)

This is **memoized DFS on a DAG**, not BFS “shortest path.” Strict increase ⇒ **no cycles**, so each cell has a well-defined best outgoing path. Cousin of [coding-pacific-atlantic.md](coding-pacific-atlantic.md) (grid DFS) and [coding-longest-increasing.md](coding-longest-increasing.md) (1-D LIS — different). NeetCode 150 hard graph/DP box.

## Probes

- Length counts **cells**, not edges. A lone cell → `1`.
- Strict `>` — equals are walls.
- Naive DFS from every cell is exponential (shared suffixes). Memo makes each cell **once** → `O(m n)`.
- Topological / Kahn alternative: edges to strictly larger neighbors; process indegree 0; longest path in a DAG.
- `m, n ≤ 200` (wiki) / `100` (some statements) — `O(m n)` is the bar, not `4^{mn}`.

## Strong answer skeleton — memo DFS

1. **Clarify:** 4-dir only; strict increase; length in cells; empty not given.
2. `dfs(i, j)` = longest increasing path **starting at** `(i, j)`.
3. For each in-bound neighbor with `matrix[x][y] > matrix[i][j]`: take `1 + dfs(x, y)`.
4. Cache the result. Answer = max `dfs` over all starts.
5. **Complexity:** `O(m n)` time and stack/memo space (each cell + 4 edges once).

Do **not** pass `prev` if you already start only from legal neighbors — one cache key `(i, j)` is enough.

## Sketch

```
dirs = ((1,0),(-1,0),(0,1),(0,-1))
m, n = len(matrix), len(matrix[0])
memo = [[0] * n for _ in range(m)]

def dfs(i, j):
  if memo[i][j]: return memo[i][j]
  best = 1
  for di, dj in dirs:
    x, y = i + di, j + dj
    if 0 <= x < m and 0 <= y < n and matrix[x][y] > matrix[i][j]:
      best = max(best, 1 + dfs(x, y))
  memo[i][j] = best
  return best

return max(dfs(i, j) for i in range(m) for j in range(n))
```

`[[9,9,4],[6,6,8],[2,1,1]]` → **4** (`1-2-6-9`). `[[1]]` → **1**.

## Mock narration (30 sec)

> “Strict increase makes a DAG, so I never loop. From each cell I walk only to larger neighbors and cache the best length. Every cell is solved once — linear in the cells. I return the best start. If they want bottom-up I can Kahn from local minima and peel layers.”

## Common mistakes

- Allowing `>=` (cycles / infinite walk on plateaus).
- Diagonals or wrap-around.
- Returning edge count (`best - 1`).
- DFS without memo — TLE on a smooth ramp.
- BFS from one cell as if it were shortest-path; you need **every** start or a DAG longest-path.

## Follow-ups

- **Kahn / indegree:** edge `u→v` if `v` is a larger neighbor; longest path = max dist while peeling.
- **Path reconstruction:** store the arg-max neighbor.
- **Longest increasing path with jumps / knights:** same memo, different degree.
- **LIS in 1-D (300):** patience / tails — do not force a grid DFS there.

## Sources

- [Longest Increasing Path in a Matrix — NeetCode](https://neetcode.io/solutions/longest-increasing-path-in-a-matrix) — accessed 2026-10-22
- [329. Longest Increasing Path in a Matrix — LeetCode Wiki](https://leetcode.doocs.org/en/lc/329/) — accessed 2026-10-22
- [Longest Increasing Path in a Matrix — LeetCode 329](https://leetcode.com/problems/longest-increasing-path-in-a-matrix/) — accessed 2026-10-22
- [Depth-first search — Wikipedia](https://en.wikipedia.org/wiki/Depth-first_search) — accessed 2026-10-22
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-22
