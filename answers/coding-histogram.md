# Largest Rectangle in Histogram — answer outline

**Prompt:** `heights[i]` is a bar of width `1`. Return the **largest rectangular area** in the histogram (contiguous bars; height = min of the chosen bars). (LeetCode 84)

This is **next-smaller to the left and right** — monotonic **increasing** stack of indices — not two-pointer water ([coding-container-water.md](coding-container-water.md)) and not next-greater days ([coding-daily-temperatures.md](coding-daily-temperatures.md)). NeetCode 150 stack box.

## Probes

- Empty → `0`; one bar → that height; zeros split the histogram.
- Brute: for each `i`, expand while `heights[j] >= heights[i]` — O(n²).
- For bar `i` as the **shortest** bar in a rectangle, width is `(R - L - 1)` where `L` / `R` are the first strictly shorter bars.
- Stack stores **indices**, heights increasing; equal heights need a consistent `<` vs `<=` story.

## Strong answer skeleton — increasing stack

1. **Clarify:** integer heights ≥ 0; area fits in 32-bit on LC; we want max area, not the bounds.
2. Sentinel: append a `0` (and optionally prepend) so every bar is popped.
3. Scan left → right. While the new bar is **shorter** than `heights[stack.top]`, pop `h = heights[j]`; width = `i - stack.top - 1` (or `i` if stack empty).
4. Push `i`. After the loop (thanks to `0`), every bar has been used as a height.
5. Each index push + pop ≤ once → O(n) time, O(n) space.

## Sketch (monotonic increasing indices)

```
max_area = 0
st = []                              # indices; heights[st] increasing
hs = heights + [0]
for i, h in enumerate(hs):
  while st and hs[st[-1]] > h:
    height = hs[st.pop()]
    left = st[-1] if st else -1
    max_area = max(max_area, height * (i - left - 1))
  st.append(i)
return max_area
```

`[2,1,5,6,2,3]` → `10` (bars `5,6`). `[2,4]` → `4`. All equal `1,1,1` → `3`.

## Mock narration (30 sec)

> “The best rectangle that uses bar i as its shortest height runs until the first shorter bar on each side. An increasing stack finds those next-smaller indices in one pass: when a shorter bar arrives, the top just found its right bound; the new top is the left bound. I flush with a zero sentinel so the suffix pops.”

## Common mistakes

- Width `i - j` instead of `i - left - 1` (off-by-one between bounds).
- Using `>=` vs `>` inconsistently — equals should still merge into a wider rectangle.
- Forgetting the sentinel and missing the rightmost bars.
- Confusing with **trapping rain** (water above bars) or **container with most water** (two lines only).
- Claiming O(n²) because of the inner `while` — amortized O(n).

## Follow-ups

- **Maximal rectangle in a binary matrix (85)** — histogram per row of consecutive `1`s, then this.
- **Largest square** — different DP (`dp[i][j] = min(three neighbors) + 1`).
- **Online / streaming bars** — same stack if you can flush at end; otherwise keep pending.
- **Return the bounds** — store `(left, right)` when you update `max_area`.

## Sources

- [Largest Rectangle in Histogram — NeetCode](https://neetcode.io/solutions/largest-rectangle-in-histogram) — accessed 2026-09-27
- [Largest Rectangle in Histogram — LeetCode 84](https://leetcode.com/problems/largest-rectangle-in-histogram/) — accessed 2026-09-27
- [Stack (abstract data type) — Wikipedia](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) — accessed 2026-09-27
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-09-27
- Classic LeetCode #84 — next-smaller bounds via increasing stack
