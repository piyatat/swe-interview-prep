# Unique Paths II — answer outline

**Prompt:** An `m × n` grid. Start at the top-left; move only **right** or **down**. Some cells are **obstacles** (`1`); free cells are `0`. How many paths reach the bottom-right without stepping on an obstacle? (LeetCode 63)

This is [coding-unique-paths.md](coding-unique-paths.md) with a **zero gate**. The binomial `C(m+n-2, m-1)` **does not** survive obstacles — you need the DP. NeetCode 150 2-D DP box.

## Probes

- Start or end blocked → **0** immediately (easy miss).
- An obstacle contributes **0**; it does not copy a neighbor.
- First row / first column are no longer all `1` — a block **kills the rest of that corridor**.
- You are **counting**, not listing (listing is Unique Paths III).
- Space: full table vs one rolling row. Watch the rolling-row update when `grid[i][j] == 1`.

## Strong answer skeleton

1. **Clarify:** `1` is blocked; `0` is free; only right/down; `m, n ≤ 100`; answer fits 32-bit on LC.
2. If `grid[0][0] == 1` or `grid[m-1][n-1] == 1` → `0`.
3. Recurrence: `dp[i][j] = 0` if blocked, else `dp[i-1][j] + dp[i][j-1]` (missing neighbor = `0`).
4. Seed: `dp[0][0] = 1` if free. Walk the first row left→right and first column top→down: stay `1` until the first obstacle, then **stay 0**.
5. Time `O(m n)`; extra space `O(n)` with a row you overwrite left-to-right.

## Sketch (rolling row)

```
m, n = len(grid), len(grid[0])
if grid[0][0] or grid[m-1][n-1]:
  return 0
dp = [0] * n
dp[0] = 1
for i in range(m):
  for j in range(n):
    if grid[i][j]:
      dp[j] = 0
    elif j > 0:
      dp[j] += dp[j-1]
return dp[n-1]
```

`[[0,0,0],[0,1,0],[0,0,0]]` → **2**. Start blocked → **0**. A first-row obstacle zeros every cell to its right.

Why the inner `elif j > 0`: column 0 only copies “above” (already in `dp[0]`) unless this cell is blocked.

## Mock narration (30 sec)

> “Same grid-count DP as Unique Paths, but a one kills the cell. I zero the start or end if they are blocked. First row and column stop being a corridor after the first rock. I can keep one row: when I see a one I write zero so it does not leak into the next free cell.”

## Common mistakes

- Forgetting start/end blocked → claiming `1`.
- Seeding the first row/column as all `1` **after** an obstacle.
- Adding a neighbor **through** a blocked cell.
- Using the binomial shortcut (wrong the moment any `1` exists).
- Rolling row: `dp[j] += dp[j-1]` on a blocked cell instead of assigning `0`.

## Follow-ups

- **Unique Paths (62):** no obstacles — [coding-unique-paths.md](coding-unique-paths.md).
- **Minimum Path Sum (64):** `min` instead of `+`; obstacles become walls or high costs — ask.
- **Dungeon Game / cherry pickup:** harder 2-D / 3-D DP (senior).
- Unique Paths III: must visit every empty cell — backtracking, not this count DP.

## Sources

- [Unique Paths II — NeetCode](https://neetcode.io/solutions/unique-paths-ii) — accessed 2026-10-25
- [Unique Paths II — LeetCode 63](https://leetcode.com/problems/unique-paths-ii/) — accessed 2026-10-25
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-25
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-25
