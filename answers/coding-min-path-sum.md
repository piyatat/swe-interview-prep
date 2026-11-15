# Minimum Path Sum — answer outline

**Prompt:** `m × n` grid of **non-negative** ints. Path from top-left to bottom-right, moving only **right** or **down**. Return the **minimum** sum along a path (include both ends). (LeetCode 64)

This is **grid DP with `min`**, not Unique Paths’ `+`. Same DAG: a cell is entered only from **above** or **left**. Wikipedia [dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming): overlapping prefixes; do not enumerate `C(m+n-2, m-1)` paths (`m, n ≤ 200`). Sibling of [coding-unique-paths.md](coding-unique-paths.md) and [coding-unique-paths-ii.md](coding-unique-paths-ii.md). Common Blind / grid-DP medium; Unique Paths pages already point here.

## Probes

- First row / first column have **one** corridor: prefix sums, not `min` of two neighbors.
- Recursion without memo is exponential. Table or rolling row is O(mn).
- In-place: `grid[i][j] += min(up, left)` if they allow mutating.
- Non-negative means greedy “always take the smaller neighbor locally” is **wrong** (a cheap cell can sit behind a wall of large cells). Need global DP.
- `1×1` → that cell. Empty grid is out of spec.

## Strong answer skeleton

1. **Clarify:** only right/down; include start and end; values ≥ 0.
2. `dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])` with the missing neighbor treated as absent (first row uses left only; first col uses up only).
3. Fill by rows. Answer `dp[m-1][n-1]`.
4. Space: full table, or one row of length `n` left-to-right (`dp[j] +=` is “above”; `dp[j-1]` is “left”).
5. **Complexity:** O(mn) time, O(n) extra (or O(1) extra if in-place).

## Sketch (rolling row)

```
m, n = len(grid), len(grid[0])
dp = grid[0][:]
for j in range(1, n):
  dp[j] += dp[j - 1]
for i in range(1, m):
  dp[0] += grid[i][0]
  for j in range(1, n):
    dp[j] = grid[i][j] + min(dp[j], dp[j - 1])
return dp[-1]
```

`[[1,3,1],[1,5,1],[4,2,1]]` → **7** (`1-3-1-1-1`). `[[1,2,3],[4,5,6]]` → **12**.

## Mock narration (30 sec)

> “Every cell has one cheapest way in: min of the cell above and the cell to the left, plus itself. First row and column are prefix sums. I can keep one row. Greedy local choice is wrong because a later cheap cell does not save a huge detour we were not allowed to take.”

## Common mistakes

- Initializing first row/col to `0` instead of prefix sums.
- Using Unique Paths’ **sum of ways** instead of **min of costs**.
- Dijkstra “because it’s a shortest path” — legal but overkill on a right/down DAG; interviewers want the table.
- Mutating while scanning right-to-left and mixing old/new (pick a direction and stick to it).
- `Integer.MAX_VALUE + grid` overflow if they pad a sentinel row.

## Follow-ups

- **Unique Paths / II:** [coding-unique-paths.md](coding-unique-paths.md), [coding-unique-paths-ii.md](coding-unique-paths-ii.md) — count, not min; obstacles zero a cell.
- **Maximal Square:** [coding-maximal-square.md](coding-maximal-square.md) — `min` of three, different combine.
- **Dungeon Game:** need enough HP; DP **from the end**.
- 4-direction path: then it is Dijkstra / 0-1 BFS, not this recurrence.

## Sources

- [64. Minimum Path Sum — LeetCode](https://leetcode.com/problems/minimum-path-sum/) — accessed 2026-11-15
- [Minimum Path Sum — NeetCode](https://neetcode.io/solutions/minimum-path-sum) — accessed 2026-11-15
- [64. Minimum Path Sum — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/64/) — accessed 2026-11-15
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-11-15
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-15
