# Search a 2D Matrix II — answer outline

**Prompt:** `m × n` matrix. Each **row** sorted left→right. Each **column** sorted top→bottom. Return whether `target` exists. (LeetCode 240)

This is **not** [coding-search-2d-matrix.md](coding-search-2d-matrix.md) (LeetCode 74). In 74, `matrix[i][0] > matrix[i-1][-1]`, so the grid **is** one sorted array and you flatten. Here a later row can **start below** the previous row’s end — flatten is wrong. NeetCode-adjacent staircase / Young tableau walk.

## Probes

- Empty matrix / empty first row → `false`.
- Why top-right (or bottom-left) and **not** top-left?
- Per-row binary search is correct O(m log n) — when is that better than O(m+n)?
- Duplicates allowed; stop on first hit. Negatives allowed.

## Strong answer skeleton — staircase

1. **Clarify:** rows and columns independently sorted; not a flattened sequence.
2. Start at **top-right** `(r, c) = (0, n-1)`. That cell is **max in its row** and **min in its column**.
3. Compare `v = matrix[r][c]` to `target`:
   - equal → `true`
   - `v > target` → nothing below in this **column** can be smaller enough; `c -= 1`
   - `v < target` → nothing left in this **row** can be larger enough; `r += 1`
4. Stop when `r == m` or `c < 0`.
5. **Complexity:** at most `m + n` steps, O(1) extra.

Bottom-left is the mirror (too big → up, too small → right). Top-left is **both** minima — a “too small” result does not tell you which way to go.

## Sketch (top-right)

```
if not matrix or not matrix[0]: return False
r, c = 0, len(matrix[0]) - 1
while r < len(matrix) and c >= 0:
  v = matrix[r][c]
  if v == target: return True
  if v > target: c -= 1
  else: r += 1
return False
```

`[[1,4,7,11,15],[2,5,8,12,19],…]`, target `5` → true; `20` → false. Walk for `12`: `(0,4)=15 > 12` left, `(0,3)=11 < 12` down, `(1,3)=12` hit.

## Strong answer skeleton — binary search each row

For each row, skip if `row[0] > target` (and you may break remaining rows because column 0 is sorted). Else `bisect` the row. O(m log n). Prefer when `m ≪ n` or interviewers banned the staircase.

Do **not** binary-search the whole grid as one range — the monotone invariant is gone.

## Mock narration (30 sec)

> “Rows and columns are sorted, but the matrix is not one list, so I will not flatten. From the top-right corner one comparison drops a whole row or column. I walk until I fall off the grid.”

## Common mistakes

- Flatten + `mid // n` from problem 74.
- Starting at top-left / bottom-right (no unique direction).
- `while r < m and c < n` from top-right (c only decreases; bound is `c >= 0`).
- Claiming O(log(mn)) — that bound is 74’s.

## Follow-ups

- **Search a 2D Matrix (74):** flatten — [coding-search-2d-matrix.md](coding-search-2d-matrix.md).
- **Young tableau extract-min:** same corner idea; heap of boundary cells.
- **Count negatives in a sorted-row/col grid:** staircase from a corner, count in O(m+n).

## Sources

- [Search a 2D Matrix II — LeetCode Wiki](https://leetcode.doocs.org/en/lc/240/) — accessed 2026-10-28
- [240. Search a 2D Matrix II — LeetCode](https://leetcode.com/problems/search-a-2d-matrix-ii/) — accessed 2026-10-28
- [Search a 2D Matrix II: Staircase Search — DataDank](https://datadank.com/interview/dsa/search-a-2d-matrix-ii/) — accessed 2026-10-28
- [Young tableau — Wikipedia](https://en.wikipedia.org/wiki/Young_tableau) — accessed 2026-10-28
