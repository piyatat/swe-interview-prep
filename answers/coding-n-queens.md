# N-Queens — answer outline

**Prompt:** Place `n` queens on an `n × n` board so **no two attack** (row, column, or diagonal). Return all distinct board layouts; `'Q'` is a queen, `'.'` empty. Order of solutions does not matter. (LeetCode 51)

This is **constrained backtracking**, not a search for one placement. Cousin of [coding-permutations.md](coding-permutations.md) (column permutation of rows) with two extra “used” sets for diagonals. Named with the backtracking family in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150; Wikipedia [eight queens puzzle](https://en.wikipedia.org/wiki/Eight_queens_puzzle).

## Probes

- `n = 1` → `[["Q"]]`. `n = 2` and `n = 3` → no solutions. `n = 4` → two boards.
- One queen **per row** (and per column) is mandatory — that is why you recurse on `row`.
- Diagonals: same `row - col` (or `row - col + n`) and same `row + col`.
- They want **all** solutions (51), not only a count (52 is the follow-up).
- Constraints on LeetCode: `1 ≤ n ≤ 8` — `n!` search is the intended bound, not bit-set golf unless they ask.

## Strong answer skeleton — row + three sets

1. **Clarify:** return drawings, not coordinates; any order; attacks include both diagonal directions.
2. Place exactly one queen in `row`, trying each `col` not in `cols`.
3. Skip if `row - col` is a used diag or `row + col` is a used anti-diag.
4. Place, recurse `row + 1`. At `row == n`, snapshot the board (copy strings).
5. **Undo** col / diag / cell before the next try.
6. **Complexity:** time O(n! ) with pruning (NeetCode target); extra O(n) for the sets besides the output. Building each board is O(n²) per solution.

Scanning “is this cell attacked?” by walking the board is the same idea and slower to write; sets are the interview default.

## Sketch (sets)

```
cols, diag, anti = set(), set(), set()
board = [["."] * n for _ in range(n)]
ans = []

def dfs(r):
  if r == n:
    ans.append(["".join(row) for row in board]); return
  for c in range(n):
    if c in cols or (r - c) in diag or (r + c) in anti:
      continue
    cols.add(c); diag.add(r - c); anti.add(r + c)
    board[r][c] = "Q"
    dfs(r + 1)
    board[r][c] = "."
    cols.remove(c); diag.remove(r - c); anti.remove(r + c)

dfs(0)
return ans
```

`n = 4` → `[".Q..","...Q","Q...","..Q."] ` and the column-mirror. Bitmasks (`cols`, `diag`, `anti` as ints) are the same three constraints.

## Mock narration (30 sec)

> “I put one queen per row. A column and the two diagonal ids are occupied sets. If the cell is free I place, recurse to the next row, then undo. When I place the last row I copy the board. That is permutations of columns with diagonal pruning.”

## Common mistakes

- Checking only columns, not diagonals (or only one diagonal direction).
- Using `row - col` without a set — two pairs can share the id; that **is** the test, but you must track it.
- Forgetting **undo** — later siblings see a permanently blocked column.
- Mutating the same board into `ans` without copying.
- Starting a new search from an arbitrary cell instead of **one per row**.

## Follow-ups

- **N-Queens II (52):** return the count; no board copies.
- **One solution only:** return at the first `r == n`.
- **Bitmask / n ≤ 32:** three ints; lowest-bit iteration.
- **Permutation view:** `cols[r] = p[r]`; reject if any `p[i] - p[j] == i - j`.

## Sources

- [N-Queens — NeetCode](https://neetcode.io/solutions/n-queens) — accessed 2026-09-22
- [N-Queens — LeetCode 51](https://leetcode.com/problems/n-queens/) — accessed 2026-09-22
- [Eight queens puzzle — Wikipedia](https://en.wikipedia.org/wiki/Eight_queens_puzzle) — accessed 2026-09-22
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-09-22
