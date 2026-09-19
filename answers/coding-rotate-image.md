# Rotate image — answer outline

**Prompt:** Square `n × n` matrix. Rotate **90° clockwise in place**. Do not allocate a second matrix. (LeetCode 48)

This is **index algebra**, not a graph problem. Two interview-clean constructions: **transpose + reverse each row**, or **4-cycles on layers**. Both are O(n²) time, O(1) extra space.

## Probes

- Clockwise, not counterclockwise. Square only (`n == n`).
- In-place: a full copy then write-back is the brute they will reject.
- `n = 1` is a no-op. Negatives allowed; values are payload, not indices.
- Say the mapping: `(i, j) → (j, n-1-i)`.

## Strong answer skeleton

1. **Clarify:** 90° clockwise; mutate `matrix`; no extra n×n.
2. **Brute:** `B[j][n-1-i] = A[i][j]`, then copy — O(n²) extra.
3. **Two reflections (usual):** transpose across the main diagonal, then reverse each row. Equivalently: reverse rows (vertical flip), then transpose.
4. **Layers (optional):** for each layer, cycle four cells with one temp.
5. **Complexity:** visit each cell a constant number of times; extra space O(1) besides the input.

## Sketch (transpose + reverse rows)

```
# transpose: swap (i,j) with (j,i) for j > i
for i in 0..n-1:
  for j in i+1..n-1:
    swap matrix[i][j], matrix[j][i]
# reverse each row
for i in 0..n-1:
  reverse matrix[i]
```

`[[1,2,3],[4,5,6],[7,8,9]]` → transpose `[[1,4,7],[2,5,8],[3,6,9]]` → reverse rows `[[7,4,1],[8,5,2],[9,6,3]]`.

**4-cycle** (same map): `tmp = (i,j); (i,j)=(n-1-j,i); …` around the square. Use if they forbid “library reverse.”

## Mock narration (30 sec)

> “Clockwise 90 is transpose then reverse each row — two involutions, no extra matrix. I only swap above the diagonal so I do not swap twice. If they want the cycle, (i,j) goes to (j, n-1-i).”

## Common mistakes

- Reverse rows **then** transpose without checking the composition (easy to get **counterclockwise**).
- Transposing the **full** rectangle including `j < i` (undoes the transpose).
- Building `new[i][j] = old[j][i]` and calling it rotation (that is transpose only).
- Off-by-one on `n-1-i` in the 4-cycle; rotating the same layer twice.
- Allocating `n` extra rows “just for the reverse.”

## Follow-ups

- **90° counterclockwise:** reverse each row, then transpose (or transpose + reverse columns).
- **180°:** reverse rows and reverse each row (or two 90s).
- **Spiral Matrix (54):** walk layers; do not mutate for order.
- **Set Matrix Zeroes (73):** mark first row/col; still O(1) extra — different invariant.

## Sources

- [Rotate Image — NeetCode](https://neetcode.io/solutions/rotate-image) — accessed 2026-09-19
- [Rotate Image — LeetCode 48](https://leetcode.com/problems/rotate-image/) — accessed 2026-09-19
- [Transpose — Wikipedia](https://en.wikipedia.org/wiki/Transpose) — accessed 2026-09-19
- [In-place matrix transposition — Wikipedia](https://en.wikipedia.org/wiki/In-place_matrix_transposition) — accessed 2026-09-19
