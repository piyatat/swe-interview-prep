# Detect Squares — answer outline

**Prompt:** Stream of points on the plane. `add([x, y])` inserts a point (**duplicates count as distinct**). `count([x, y])` returns how many ways to pick **three stored points** that, with the query point, form an **axis-aligned** square of **positive area**. (LeetCode 2013)

This is **frequency geometry**, not “enumerate all quadruples.” Wikipedia [square](https://en.wikipedia.org/wiki/Square_(geometry)): equal sides, right angles; here edges must be **parallel to the axes** (no diamond). NeetCode 150 math box. Sibling of [coding-k-closest.md](coding-k-closest.md) (points) but the win is a **count map**, not a heap.

## Probes

- Axis-aligned only: a diagonal partner `(x, y)` of query `(px, py)` needs `|px-x| == |py-y|` **and** `x != px`, `y != py` (same row/col is a degenerate line, not a square).
- Other two corners are then `(x, py)` and `(px, y)`. Ways = `freq[(x,py)] * freq[(px,y)]` (product because duplicates are independent).
- Query point is **not** in the structure unless you added it earlier; `count` does not insert.
- `0 <= x, y <= 1000`; total `add`+`count` ≤ ~3000 → `count` may scan all stored points.

## Strong answer skeleton

1. **Clarify:** axis-aligned; positive area; duplicates multiply; query is one corner, not necessarily already stored.
2. Store `freq[(x, y)]` (hash of pairs, or `dict[x][y]`). Optionally keep a list of points for the scan.
3. `add`: increment frequency (O(1)).
4. `count`: for each stored point as **diagonal**, if side lengths match and it is a true diagonal, add the product of the two side-corner frequencies. Equivalently: enumerate other x-coordinates `x2 != px`, side `d = x2 - px`, add the two squares (up and down) via `(px, py±d)` and `(x2, py±d)`.
5. **Complexity:** `add` O(1); `count` O(n) in stored points / distinct x; space O(n).

## Sketch (diagonal scan)

```
# freq: Counter of (x, y)
def add(point):
  freq[tuple(point)] += 1

def count(point):
  px, py = point
  ans = 0
  for (x, y), _ in freq.items():
    if abs(px - x) == abs(py - y) and x != px and y != py:
      ans += freq[(x, py)] * freq[(px, y)]
  return ans
```

Doocs form: group by x, enumerate `x2 != x1`, `d = x2 - x1`, add `cnt[x2][y1] * cnt[x1][y1+d] * cnt[x2][y1+d]` and the `y1-d` square. Same O(n). Example: add `(3,10), (11,2), (3,2)` then `count((11,10))` → **1**; add another `(11,2)` → **2**.

## Mock narration (30 sec)

> “I only count axis-aligned squares, so a partner is a diagonal: equal |Δx| and |Δy|, not on the same row or column. The other two corners are the axis projections. I keep a frequency map so duplicates multiply. Add is increment; count scans stored points.”

## Common mistakes

- Allowing rotated diamonds (`|Δx|==|Δy|` is necessary **after** picking a diagonal; sharing a side is not a diagonal).
- Using a **set** and dropping duplicate points → undercount.
- Adding the query point inside `count`.
- Side length 0 (same point) counting as a square.
- Scanning combinations of three points (too slow; 3000 calls).

## Follow-ups

- **K closest points:** [coding-k-closest.md](coding-k-closest.md) — distance, not squares.
- **Valid square / detect rectangle:** four given points; sort or check distances; still axis-aligned vs rotated.
- **Range count of points:** Fenwick / 2D if they raise n.

## Sources

- [2013. Detect Squares — LeetCode](https://leetcode.com/problems/detect-squares/) — accessed 2026-11-15
- [Detect Squares — NeetCode](https://neetcode.io/solutions/detect-squares) — accessed 2026-11-15
- [2013. Detect Squares — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/2013/) — accessed 2026-11-15
- [Square (geometry) — Wikipedia](https://en.wikipedia.org/wiki/Square_(geometry)) — accessed 2026-11-15
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-15
