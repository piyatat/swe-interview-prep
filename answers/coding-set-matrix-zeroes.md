# Set Matrix Zeroes — answer outline

**Prompt:** `m × n` integer matrix. If any cell is `0`, set its **entire row and column** to `0`. Do it **in place**. (LeetCode 73)

This is **marker storage**, not BFS. You must not let a write-zero **create** new zeros that cascade. Distinct from [coding-rotate-image.md](coding-rotate-image.md) (permutation of cells) and [coding-spiral-matrix.md](coding-spiral-matrix.md) (walk). Blind 75 / NeetCode 150 math-geometry box.

## Probes

- Rectangular, not necessarily square. `1×1` `[[0]]` → `[[0]]`.
- First pass **records** which rows/cols contain a zero; second pass **applies**. One pass that writes zeros immediately is wrong.
- Extra `O(m+n)` boolean arrays is the clean story; they often ask for **O(1)** extra.
- Zeros already in row 0 / col 0 are payload **and** (in the O(1) trick) markers — split those two jobs.

## Strong answer skeleton — O(m+n) markers

1. **Clarify:** mutate `matrix`; any original `0` zeros its row and col; later zeros do not spread further.
2. `row[m]`, `col[n]` flags. Scan; if `matrix[i][j] == 0`, set `row[i] = col[j] = True`.
3. Second scan: if `row[i] or col[j]`, write `0`.
4. Time Θ(mn), extra Θ(m+n).

## Strong answer skeleton — O(1) extra (first row / col as markers)

1. `col0` (or `row0`) boolean: did **column 0** (resp. row 0) originally contain a zero?
2. Use `matrix[i][0]` as the row-i marker and `matrix[0][j]` as the col-j marker. For `i≥1`, `j≥1`: if `matrix[i][j]==0`, set `matrix[i][0] = matrix[0][j] = 0`.
3. Second pass **inner first** (`i=1..`, `j=1..`): if `matrix[i][0]==0 or matrix[0][j]==0`, write `0`.
4. **Last:** zero row 0 if `matrix[0][0]` says so; zero col 0 if `col0`. Order matters — wiping row/col 0 early **erases markers**.

`matrix[0][0]` is both a cell and a marker. That is why one extra boolean exists.

## Sketch (O(1) extra)

```
col0 = any(matrix[i][0] == 0 for i in 0..m-1)
for i in 0..m-1:
  for j in 1..n-1:
    if matrix[i][j] == 0:
      matrix[i][0] = matrix[0][j] = 0
for i in 1..m-1:
  for j in 1..n-1:
    if matrix[i][0] == 0 or matrix[0][j] == 0:
      matrix[i][j] = 0
if matrix[0][0] == 0:
  for j in 0..n-1: matrix[0][j] = 0
if col0:
  for i in 0..m-1: matrix[i][0] = 0
```

`[[1,1,1],[1,0,1],[1,1,1]]` → row 1 and col 1 zeroed → `[[1,0,1],[0,0,0],[1,0,1]]`.

## Mock narration (30 sec)

> “A zero must zero its row and column, but I cannot write those zeros until I have seen every original zero. I park the flags in the first row and first column, keep one extra bit for column zero, update the inner rectangle, then finish the borders.”

## Common mistakes

- Zeroing a row as soon as you see a `0` — later cells in that row look like original zeros and wipe extra columns.
- Using `matrix[0][0]` as the **only** flag for both first row and first column.
- Applying border zeros **before** the inner pass (markers gone).
- Allocating a full copy and calling it in-place.
- Forgetting a matrix that is all nonzero (must be unchanged).

## Follow-ups

- **O(m+n) first** in a 45-min, then compress to O(1) if they ask.
- **Sparse:** list of zero coordinates, then write — still Θ(mn) worst case if you must fill.
- **Immutable API:** return a new matrix; same two-pass flags.
- **Rotate / spiral:** different invariants; do not reuse this marker trick blindly.

## Sources

- [Set Matrix Zeroes — NeetCode](https://neetcode.io/solutions/set-matrix-zeroes) — accessed 2026-09-21
- [Set Matrix Zeroes — LeetCode 73](https://leetcode.com/problems/set-matrix-zeroes/) — accessed 2026-09-21
- [Matrix (mathematics) — Wikipedia](https://en.wikipedia.org/wiki/Matrix_(mathematics)) — accessed 2026-09-21
- Classic LeetCode #73 — two-pass row/col markers, O(1) via first row/col
