# Container With Most Water — answer outline

**Prompt:** `height[i]` is a vertical line at x = `i`. Choose two lines so that with the x-axis they form a container; return the **max water** (area). You may not slant the container. (LeetCode 11)

This is the **two-pointer inward scan** listed next to 3Sum in [../general/coding-patterns.md](../general/coding-patterns.md). Cousin: [coding-3sum.md](coding-3sum.md) (same pointers, different invariant).

## Probes

- Brute O(n²) all pairs — then **why** the linear scan is safe.
- Area = `min(h[L], h[R]) * (R - L)` — width is index distance, not “count of bars.”
- Equal heights: either pointer may move (say it).
- Empty / single bar → 0.

## Strong answer skeleton

1. **Clarify:** non-negative heights; n ≥ 2 usually; return area not the pair.
2. **Brute:** every `(i, j)` — baseline, too slow.
3. **Optimal:** `L = 0`, `R = n-1`. Track `best`. While `L < R`:
   - `best = max(best, min(h[L], h[R]) * (R - L))`
   - Advance the **shorter** pointer (if equal, move one).
4. **Why safe:** the short side is the height cap. Any container that keeps that short line and a **closer** partner has **≤ height** and **smaller width**, so it cannot beat the current pair. Discard that short index.
5. **Complexity:** O(n) time, O(1) extra space.

Do not “move the taller line hoping for width” — width only shrinks and the short wall still caps height.

## Sketch

```
L, R = 0, n-1
best = 0
while L < R:
  best = max(best, min(h[L], h[R]) * (R - L))
  if h[L] <= h[R]: L += 1
  else: R -= 1
return best
```

Walk `[1,8,6,2,5,4,8,3,7]` → best **49** (indices 1 and 8: `min(8,7)*7`).

## Mock narration (30 sec)

> “Start at the widest pair. Area is limited by the shorter wall. Moving the taller wall cannot raise the height and only loses width, so I step the shorter index inward. Each step drops only pairs that cannot beat the current area. Linear, constant space.”

## Common mistakes

- Using `min(R-L+1)` or counting bars as width.
- Moving **both** pointers every step (skips the optimum).
- Moving the **taller** pointer by habit from Two Sum.
- Claiming O(n) without the discard argument (they will ask).
- Confusing this with **Trapping Rain Water** (water **above** each bar, not one container).

## Follow-ups

- **Trapping Rain Water (42):** per-index water = `min(leftMax, rightMax) - h[i]`; two pointers + running maxes, or prefix/suffix max arrays.
- **Largest Rectangle in Histogram (84):** monotonic stack — different problem.
- Return the **pair of indices** (same scan; keep `bestL/bestR`).

## Sources

- [Container With Most Water — two-pointer invariant — techinterview.org](https://www.techinterview.org/post/3233474773/container-with-most-water-two-pointer/) — accessed 2026-08-30
- [Container With Most Water walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/container-with-most-water-interview-walkthrough/) — accessed 2026-08-30
- [Two pointers pattern (container + rain water) — jamongx](https://jamongx.com/understanding-the-two-pointers-technique/) — accessed 2026-08-30
- Classic LeetCode #11 / #42 — two-pointer height family
