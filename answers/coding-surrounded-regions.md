# Surrounded Regions — answer outline

**Prompt:** `m × n` board of `'X'` / `'O'`. Capture every **surrounded** `'O'` region in place (flip those `'O'`s to `'X'`). A region is 4-connected `'O'`s. It is surrounded iff **none** of its cells touch the border. Do not return a new board. (LeetCode 130)

This is the **invert-the-flood** twin of [coding-number-of-islands.md](coding-number-of-islands.md) and [coding-pacific-atlantic.md](coding-pacific-atlantic.md): mark what **cannot** be captured (border-connected), then flip the rest. Named in [../general/coding-patterns.md](../general/coding-patterns.md). Wikipedia [flood fill](https://en.wikipedia.org/wiki/Flood_fill) / [connected component](https://en.wikipedia.org/wiki/Connected_component_(graph_theory)).

## Probes

- Surrounded ⇔ **not** reachable from a border `'O'`. Do not hunt enclosed shapes.
- 4-dir only. Diagonals do not save a cell.
- In-place: a temporary mark (`'T'` / `'#'`) then a second pass.
- 1×n / m×1 / all-border: **nothing** is surrounded.

## Strong answer skeleton — reverse flood from the border

1. **Clarify:** 4-dir; in-place; border `'O'`s and anything they reach stay `'O'`.
2. DFS/BFS from every border `'O'`; paint those cells `'T'` (safe).
3. Scan: leftover `'O'` → `'X'` (captured); `'T'` → `'O'` (restore).
4. **Complexity:** O(mn) time, O(mn) stack/queue worst case.

UF twin: union every `'O'` to 4-neighbors; union border `'O'`s to a dummy “ocean” node; flip anyone not connected to the dummy.

## Sketch (DFS mark)

```
def solve(board):
  if not board: return
  m, n = len(board), len(board[0])
  def dfs(r, c):
    if r < 0 or c < 0 or r >= m or c >= n or board[r][c] != 'O':
      return
    board[r][c] = 'T'
    for dr, dc in ((1,0),(-1,0),(0,1),(0,-1)):
      dfs(r+dr, c+dc)
  for i in range(m):
    dfs(i, 0); dfs(i, n-1)
  for j in range(n):
    dfs(0, j); dfs(m-1, j)
  for i in range(m):
    for j in range(n):
      if board[i][j] == 'O': board[i][j] = 'X'
      elif board[i][j] == 'T': board[i][j] = 'O'
```

BFS from collected border `'O'`s if they worry about recursion depth (`m, n` up to 200).

## Mock narration (30 sec)

> “Anything that touches the edge cannot be surrounded, so I flood from every border O and mark those safe. Whatever O is left has no path out — I flip it to X, then restore the marks.”

## Common mistakes

- Flooding **interior** `'O'`s first and guessing which are closed — misses irregular shapes.
- 8-directional neighbors.
- Forgetting to restore the temporary mark (board left full of `'T'`).
- Treating a single border `'O'` as captured.
- Extra visited matrix when the temporary char already marks visited.

## Follow-ups

- **Number of Islands** — [coding-number-of-islands.md](coding-number-of-islands.md): count starts, not flip interiors.
- **Pacific Atlantic** — [coding-pacific-atlantic.md](coding-pacific-atlantic.md): two reverse floods, keep the intersection.
- **Walls and Gates / 01 Matrix** — multi-source BFS from gates / zeros.
- **Number of Enclaves (1020)** — same idea; return the count of captured land.

## Sources

- [Surrounded Regions — NeetCode](https://neetcode.io/solutions/surrounded-regions) — accessed 2026-10-12
- [130. Surrounded Regions — LeetCode Wiki](https://leetcode.doocs.org/en/lc/130/) — accessed 2026-10-12
- [Surrounded Regions — LeetCode 130](https://leetcode.com/problems/surrounded-regions/) — accessed 2026-10-12
- [Flood fill — Wikipedia](https://en.wikipedia.org/wiki/Flood_fill) — accessed 2026-10-12
- [Connected component (graph theory) — Wikipedia](https://en.wikipedia.org/wiki/Connected_component_(graph_theory)) — accessed 2026-10-12
