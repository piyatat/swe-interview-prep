# Search a 2D Matrix — answer outline

**Prompt:** `m × n` integer matrix. Each **row** is sorted non-decreasing. The **first** of row `i+1` is **greater than** the last of row `i`. Return whether `target` exists. Must be `O(log(m·n))`. (LeetCode 74)

This is **one binary search on a virtual flattened array**, not [coding-binary-search.md](coding-binary-search.md) (rotated / Koko feasibility) and not a graph walk. Index `mid` maps to `matrix[mid // n][mid % n]`. NeetCode 150 binary-search box.

## Probes

- Empty matrix / empty first row → `false`.
- The row-start invariant is **load-bearing**. Without it you cannot flatten; that is **Search a 2D Matrix II (240)** (rows and columns sorted, but `matrix[i][0]` may be *less* than `matrix[i-1][n-1]`).
- `O(m + n)` staircase from a corner is correct for **240**, too slow vs the asked `O(log(mn))` here.
- Integers may be negative. Duplicates inside a row are allowed; still return true on the first hit.

## Strong answer skeleton — flatten

1. **Clarify:** row-major sorted as **one** sequence; `n = len(matrix[0])` is constant.
2. `lo, hi = 0, m * n - 1`. While `lo <= hi`:
   - `mid = lo + (hi - lo) // 2`
   - `val = matrix[mid // n][mid % n]`
   - equal → `true`; `val < target` → `lo = mid + 1`; else `hi = mid - 1`
3. Return `false`.
4. **Complexity:** `O(log(mn))` time, `O(1)` extra. Two nested binary searches (pick row, then column) is the same big-O (`log m + log n = log(mn)`); flatten is fewer moving parts.

## Sketch (1D index)

```
if not matrix or not matrix[0]: return False
m, n = len(matrix), len(matrix[0])
lo, hi = 0, m * n - 1
while lo <= hi:
  mid = lo + (hi - lo) // 2
  val = matrix[mid // n][mid % n]
  if val == target: return True
  if val < target: lo = mid + 1
  else: hi = mid - 1
return False
```

`[[1,3,5,7],[10,11,16,20],[23,30,34,60]]`, target `3` → true; `13` → false.

## Strong answer skeleton — two searches (alt)

Binary-search rows using `matrix[row][0]` (and optionally `matrix[row][-1]`) until the unique candidate row, then binary-search that row. Off-by-one on “which row owns this target” is the usual fail — flatten avoids that branch.

## Mock narration (30 sec)

> “Because each row starts after the previous row ends, the matrix *is* a sorted array of length `m·n`. I binary-search the logical index and convert with `// n` and `% n`. I never allocate the flatten.”

## Common mistakes

- Treating it as 240 and walking from the top-right (`O(m+n)`).
- Using `m` instead of `n` in the index map (`mid // m`).
- `while lo < hi` without a final check (drops the last cell).
- Overflow-unsafe `(lo+hi)//2` in languages with fixed ints — prefer `lo + (hi-lo)//2`.
- Searching each row linearly “because n is small.”

## Follow-ups

- **Search a 2D Matrix II (240):** start top-right (or bottom-left); move down or left. Do **not** flatten.
- **Koko / ship-in-D-days:** search the **answer**, not an index — [coding-binary-search.md](coding-binary-search.md).
- **Peak in a 2D grid:** different compare; still halving.

## Sources

- [Search a 2D Matrix — NeetCode](https://neetcode.io/solutions/search-a-2d-matrix) — accessed 2026-09-29
- [Search a 2D Matrix — LeetCode 74](https://leetcode.com/problems/search-a-2d-matrix/) — accessed 2026-09-29
- [Binary search algorithm — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm) — accessed 2026-09-29
- [Search a 2D Matrix — LeetCode Wiki](https://leetcode.doocs.org/en/lc/74/) — accessed 2026-09-29
