# Spiral Matrix — answer outline

**Prompt:** `m × n` matrix. Return every value in **clockwise spiral order** (right, down, left, up), starting at the top-left. (LeetCode 54)

This is **boundary walking**, not a graph problem and not [coding-rotate-image.md](coding-rotate-image.md) (that **mutates** a square in place). Four shrinking edges visit each cell once. NeetCode 150 math / geometry box.

## Probes

- Rectangle, not only squares. `1 × n` and `n × 1` must not double-count.
- Empty matrix → `[]`. Values are payload, not indices.
- Extra space: O(1) besides the output list (they will reject a visited-matrix of size `mn`).
- Counterclockwise or start at another corner is a follow-up, not the default.

## Strong answer skeleton — four bounds

1. **Clarify:** clockwise; include every cell exactly once; `m` rows, `n` cols.
2. Bounds `top, bottom, left, right`. While `top <= bottom` and `left <= right`:
   - Top row `left → right`, then `top += 1`
   - Right col `top → bottom`, then `right -= 1`
   - If `top <= bottom`: bottom row `right → left`, then `bottom -= 1`
   - If `left <= right`: left col `bottom → top`, then `left += 1`
3. The two `if`s stop a **single remaining row or column** from being walked twice (once forward, once back).
4. **Complexity:** Θ(mn) time; O(1) extra besides the result.

## Sketch (bounds)

```
top, bottom, left, right = 0, m-1, 0, n-1
out = []
while top <= bottom and left <= right:
  for c in left..right:   out.append(A[top][c])
  top += 1
  for r in top..bottom:   out.append(A[r][right])
  right -= 1
  if top <= bottom:
    for c in right..left: out.append(A[bottom][c])
    bottom -= 1
  if left <= right:
    for r in bottom..top: out.append(A[r][left])
    left += 1
return out
```

`[[1,2,3],[4,5,6],[7,8,9]]` → `[1,2,3,6,9,8,7,4,5]`. One row `[1,2,3]` → itself. One col `[[1],[2],[3]]` → `[1,2,3]`.

**Direction array** `(0,1),(1,0),(0,-1),(-1,0)` plus a turn-when-next-is-out-or-seen is the same idea; bounds is fewer moving parts in a 45-min.

## Mock narration (30 sec)

> “I keep four edges and peel a layer: right, down, left, up. After each side I shrink that edge. The leftover-row and leftover-column checks stop a 1-wide strip from printing twice. Every cell once — linear in the size of the matrix.”

## Common mistakes

- Forgetting the `if` after shrinking `top`/`right` (1×n or n×1 duplicates).
- Using `top < bottom` instead of `<=` (drops the last cell).
- Walking inclusive ranges with the wrong end (`right` after `right -= 1` already moved).
- Allocating a `visited` grid when the output already records the order.
- Starting a new layer without checking `top <= bottom` (infinite loop or empty pops).

## Follow-ups

- **Spiral Matrix II (59):** fill `1..n²` with the same four edges.
- **Spiral Matrix III / generate:** keep walking; skip cells outside the rectangle.
- **Counterclockwise:** swap the side order (down, right, up, left) or negate the direction cycle.
- **Rotate Image (48):** [coding-rotate-image.md](coding-rotate-image.md) — mutate layers, do not emit an order.
- **Set Matrix Zeroes (73):** mark first row/col; still O(1) extra — different invariant.

## Sources

- [Spiral Matrix — NeetCode](https://neetcode.io/solutions/spiral-matrix) — accessed 2026-09-20
- [Spiral Matrix — LeetCode 54](https://leetcode.com/problems/spiral-matrix/) — accessed 2026-09-20
- [Matrix (mathematics) — Wikipedia](https://en.wikipedia.org/wiki/Matrix_(mathematics)) — accessed 2026-09-20
- Classic LeetCode #54 — peel four shrinking bounds
