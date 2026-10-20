# Maximal Square — answer outline

**Prompt:** `matrix` is `m × n` of `'0'` / `'1'` (often **chars**, not ints). Return the **area** of the largest axis-aligned square of only `'1'`s. (LeetCode 221)

This is **min-of-three 2D DP**, not “flood-fill the biggest island.” Cousin of [coding-unique-paths.md](coding-unique-paths.md) (grid DP) but each cell is a **side length**, and you return `side²`. NeetCode 150 2D-DP box.

## Probes

- They want **area**, not side. Empty / all-zero → `0`.
- A 1×1 `'1'` is a valid square.
- Histogram / stack (maximal **rectangle**) is the harder cousin — do not start there unless they change the prompt.
- Brute “expand from every cell” is O(m n · min(m,n)²); DP is O(m n).
- Cells are often **`'1'`** not `1` — a silent fail.

## Strong answer skeleton — side ending at (i, j)

1. **Clarify:** char vs int; area vs side; only squares; axis-aligned.
2. Let `dp[i][j]` = max side of a square whose **bottom-right** is `(i, j)`.
3. If `matrix[i][j] != '1'`: `dp = 0`. Else  
   `dp[i][j] = 1 + min(up, left, up-left)`.
4. Why min: the square of side `k` needs the three neighboring squares to already support side `k-1`. One short neighbor caps you.
5. Track `best` side; return `best * best`.
6. **Complexity:** O(m n) time. Extra space O(n) with one rolling row (keep the previous “up-left” before you overwrite).

Pad a `0` row/col so `i-1` / `j-1` stay in range.

## Sketch (padded table)

```
m, n = len(matrix), len(matrix[0])
dp = [[0] * (n + 1) for _ in range(m + 1)]
best = 0
for i in range(m):
  for j in range(n):
    if matrix[i][j] == '1':
      dp[i+1][j+1] = 1 + min(dp[i][j+1], dp[i+1][j], dp[i][j])
      best = max(best, dp[i+1][j+1])
return best * best
```

Example: the classic 4×5 board with a 2×2 block of ones → **4**. `[["0"]]` → **0**. `[["1"]]` → **1**.

## Mock narration (30 sec)

> “I only need the largest square that ends at each cell. A one can grow by one plus the shortest of the square above, left, and diagonal. Zeros reset. I keep the best side and square it. Linear in the cells; one rolling row if they care about space.”

## Common mistakes

- Returning `best` (side) instead of `best * best`.
- Comparing `matrix[i][j] == 1` when the grid is chars.
- Using `max` of the three neighbors (overstates the square).
- Forgetting the 1×1 case (`min` of zeros around a lone `'1'` + 1 = 1).
- Maximal **Rectangle** (85) stack — different problem; mention only as a follow-up.

## Follow-ups

- **Maximal Rectangle (85):** histogram heights + largest rectangle in histogram.
- **Count Square Submatrices with All Ones (1277):** same DP; **sum** the `dp` cells instead of tracking max.
- **Unique Paths / Min Path Sum:** same grid walk, different combine (`+` / `min`).
- **1-D rolling:** `prev_diag` stash because `dp[j]` is about to become “left.”

## Sources

- [Maximal Square — NeetCode](https://neetcode.io/solutions/maximal-square) — accessed 2026-10-20
- [221. Maximal Square — LeetCode Wiki](https://leetcode.doocs.org/en/lc/221/) — accessed 2026-10-20
- [Maximal Square — LeetCode 221](https://leetcode.com/problems/maximal-square/) — accessed 2026-10-20
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-20
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-20
