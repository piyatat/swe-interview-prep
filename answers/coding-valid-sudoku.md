# Valid Sudoku — answer outline

**Prompt:** Given a `9×9` board of digits `'1'`–`'9'` and `'.'`, return whether the **filled** cells obey Sudoku rules: no repeat in any row, column, or `3×3` box. The board need **not** be solvable. (LeetCode 36)

This is **one-pass membership**, not a solver. Cousin of [coding-set-matrix-zeroes.md](coding-set-matrix-zeroes.md) (row/col marks) and [coding-group-anagrams.md](coding-group-anagrams.md) (hash the group). NeetCode 150 arrays box. Wikipedia [Sudoku](https://en.wikipedia.org/wiki/Sudoku).

## Probes

- Validation ≠ solution: do **not** backtrack empty cells (that is LC 37).
- Box index: `k = (r // 3) * 3 + (c // 3)` — say it before coding.
- `'.'` is skip, not a value. Digits are characters; `int(c) - 1` or `c - '1'` for a 0–8 slot.
- Early exit on the first collision; 81 cells is O(1) in interview speech, O(1) extra if you use bitmasks.

## Strong answer skeleton — three seen-sets

1. **Clarify:** only filled cells; duplicates of `'.'` are fine; no need to prove a unique solution.
2. **Structures:** `rows[9]`, `cols[9]`, `boxes[9]` as sets, bool arrays, or 9-bit masks.
3. **Scan** `(r, c)`. If `board[r][c] == '.'`: continue. Else if `v` already in that row, col, or box → false; else insert.
4. **Done:** true.
5. **Complexity:** O(81) time; O(81) space for sets, or O(1) extra with bitmasks on 9 ints.

Hash-set-of-strings (`f"{v} in row {r}"`) is the same idea; three typed sets are easier to debug live.

## Sketch

```
def isValidSudoku(board):
  row = [set() for _ in range(9)]
  col = [set() for _ in range(9)]
  box = [set() for _ in range(9)]
  for r in range(9):
    for c in range(9):
      v = board[r][c]
      if v == '.': continue
      k = (r // 3) * 3 + (c // 3)
      if v in row[r] or v in col[c] or v in box[k]:
        return False
      row[r].add(v); col[c].add(v); box[k].add(v)
  return True
```

The official example that swaps the top-left `5` for `8` fails because **two 8s share the top-left box**, even if rows still look fine.

## Mock narration (30 sec)

> “I only check filled cells. For each digit I ask whether I’ve already seen it in this row, this column, or this 3×3 box. Box index is `(r//3)*3 + (c//3)`. First collision is false; finishing the board is true. I’m not solving it.”

## Common mistakes

- Writing a full Sudoku solver (backtracking) and blowing the clock.
- Wrong box formula (`r // 3 + c // 3`, or 9 boxes flattened as `r*3+c`).
- Treating `'.'` as a digit, or using `0` as empty without skipping.
- Checking only rows and columns (boxes are the usual miss).
- Claiming the board must be completable.

## Follow-ups

- **Sudoku Solver (37):** backtrack empties; reuse the same three sets / bitmasks to prune.
- **N-Queens** — [coding-n-queens.md](coding-n-queens.md) (same “is this unit free?” prune).
- Bitmask per unit: `1 << (v-1)`; test-and-set in O(1) with no hash.
- `n² × n²` boards (generic Latin / Sudoku).

## Sources

- [Valid Sudoku — NeetCode](https://neetcode.io/solutions/valid-sudoku) — accessed 2026-10-09
- [36. Valid Sudoku — LeetCode Wiki](https://leetcode.doocs.org/en/lc/36/) — accessed 2026-10-09
- [Valid Sudoku — LeetCode 36](https://leetcode.com/problems/valid-sudoku/) — accessed 2026-10-09
- [Sudoku — Wikipedia](https://en.wikipedia.org/wiki/Sudoku) — accessed 2026-10-09
