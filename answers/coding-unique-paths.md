# Unique Paths — answer outline

**Prompt:** An `m × n` grid. You start at the top-left and may move only **right** or **down**. How many paths reach the bottom-right? (LeetCode 62)

This is the usual **grid-count** DP (and a combinatorics one-liner). Same family as [coding-house-robber.md](coding-house-robber.md) (optimal substructure) but **2D**: a cell’s answer is the sum of the cell above and the cell to the left. Listed under DP / grid paths in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Recursion without memo is exponential — overlapping prefixes.
- You are **counting**, not listing (listing is Unique Paths III / backtracking).
- Space: full `m × n` table vs one rolling row of length `n`.
- Combinatorics: exactly `(m-1)` downs and `(n-1)` rights in some order → `C(m+n-2, m-1)`.

## Strong answer skeleton

1. **Clarify:** `1 × 1` → `1`; only right/down; output fits 32-bit in the classic statement (ask if they want big-int).
2. **Search tree:** from `(i, j)` go `(i+1, j)` or `(i, j+1)`; out of bounds → `0`; destination → `1`.
3. **Why DP:** many paths share a suffix. `dp[i][j]` = ways to reach `(i, j)` from the start (or ways from `(i, j)` to the end — pick one).
4. **Forward recurrence:** first row and first column are all `1` (only one corridor). Then `dp[i][j] = dp[i-1][j] + dp[i][j-1]`.
5. **Complexity:** O(m n) time; O(n) extra with a row you overwrite left-to-right (left cell is already this row; “above” is the old value in this slot).

## Sketch (rolling row)

```
# dp[j] = ways to current row, column j
dp = [1] * n
for i in 1 .. m-1:
  for j in 1 .. n-1:
    dp[j] += dp[j-1]
return dp[n-1]
```

`m = 3, n = 7` → **28**. `m = n = 3` → **6**.

Math path: multiplicative formula for `C(m+n-2, min(m-1, n-1))` with a running product — mention overflow and that interviewers usually want the DP first.

## Mock narration (30 sec)

> “Every cell is only reachable from above or left, so I add those two counts. First row and column are a single corridor. I can keep one row. If they want O(1) extra I can say the binomial, but I will derive the table live.”

## Common mistakes

- Starting both `dp[0][0]` and the first row/column wrong (`0` vs `1`).
- Allowing up/left and double-counting.
- Recursing without memo on `m, n ~ 100`.
- Unique Paths II: forgetting start or end **blocked** → `0`; obstacle cells contribute `0`, they do not copy a neighbor.

## Follow-ups

- **Unique Paths II (63):** obstacles; same recurrence with a zero gate.
- **Minimum Path Sum (64):** `min` instead of `+`; still a rolling row.
- **Dungeon Game / cherry pickup:** harder 2D / 3D DP (senior).
- Combinatorics vs DP: DP generalizes to obstacles; binomial does not.

## Sources

- [Unique Paths — NeetCode](https://neetcode.io/solutions/unique-paths) — accessed 2026-09-04
- [Unique Paths II — NeetCode](https://neetcode.io/solutions/unique-paths-ii) — accessed 2026-09-04
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-09-04
- [Combination — Wikipedia](https://en.wikipedia.org/wiki/Combination) — accessed 2026-09-04
- Classic LeetCode #62 / #63 — 2D grid DP / binomial paths
