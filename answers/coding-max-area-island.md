# Max Area of Island — answer outline

**Prompt:** `m × n` grid of `1` land / `0` water. An island is **4-connected** land. Return the **max number of cells** in any island, or `0`. (LeetCode 695)

Count sibling of [coding-number-of-islands.md](coding-number-of-islands.md) (same flood, return size instead of incrementing a counter). Not 8-connected, not “number of distinct shapes.” NeetCode 150. Wikipedia [Flood fill](https://en.wikipedia.org/wiki/Flood_fill).

## Probes

- 4-direction only. Diagonals do **not** join islands (the LC figure with area 6 vs a tempting 11).
- Empty / all-water → `0`, not `None`.
- `m, n ≤ 50` → O(mn) DFS/BFS is the bar; union-find is extra, not required.
- Mutate to `0` vs `visited[][]` — same tradeoff as islands.

## Strong answer skeleton — flood and take max

1. **Clarify:** 4 vs 8; mutate OK?; all water; single cell `[[1]]` → 1.
2. **Count vs area:** islands increments once per component; here each flood **returns the cell count**.
3. **DFS:** on land, mark visited, `return 1 + sum(four neighbors)`. Skip water / OOB / already marked.
4. Scan every cell; `best = max(best, dfs(i, j))`. Do not DFS water (returns 0).
5. **Complexity:** O(mn) time — each cell enters DFS at most once. O(mn) recursion/stack worst case (one giant island). Iterative BFS/stack if they fear recursion depth (`50×50` is fine).

Union-find: parent + size; on union add sizes; track a global max. Same time, more code — mention, prefer flood.

## Sketch (mutate DFS)

```
def maxAreaOfIsland(grid):
  m, n = len(grid), len(grid[0])
  def dfs(i, j):
    if i < 0 or j < 0 or i >= m or j >= n or grid[i][j] == 0:
      return 0
    grid[i][j] = 0
    return 1 + dfs(i+1, j) + dfs(i-1, j) + dfs(i, j+1) + dfs(i, j-1)
  best = 0
  for i in range(m):
    for j in range(n):
      if grid[i][j] == 1:
        best = max(best, dfs(i, j))
  return best
```

All zeros → 0. A single `1` → 1. Two islands of 3 and 6 → 6.

## Mock narration (30 sec)

> “Same flood as number of islands, but I return the size. I walk the grid; on land I DFS, mark visited, and add one for every cell I paint. I keep the maximum. Four neighbors only — diagonals do not count.”

## Common mistakes

- Counting islands instead of cells (always 1 per component).
- 8-connected neighbors (over-merge).
- Forgetting to mark visited → infinite recursion / double count.
- Returning the **last** island’s area, not the max.
- Off-by-one bounds; mutating after the recursive calls (neighbors see the cell twice).

## Follow-ups

- **Number of Islands (200):** count components — [coding-number-of-islands.md](coding-number-of-islands.md).
- **Surrounded Regions (130):** flood from the **border** — [coding-surrounded-regions.md](coding-surrounded-regions.md).
- **Pacific Atlantic (417):** reverse multi-source — [coding-pacific-atlantic.md](coding-pacific-atlantic.md).
- **Max area without mutating:** `visited` set; same DFS.

## Sources

- [Max Area of Island — NeetCode](https://neetcode.io/solutions/max-area-of-island) — accessed 2026-10-17
- [695. Max Area of Island — LeetCode Wiki](https://leetcode.doocs.org/en/lc/695/) — accessed 2026-10-17
- [Max Area of Island — LeetCode 695](https://leetcode.com/problems/max-area-of-island/) — accessed 2026-10-17
- [Flood fill — Wikipedia](https://en.wikipedia.org/wiki/Flood_fill) — accessed 2026-10-17
