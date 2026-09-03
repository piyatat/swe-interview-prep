# Trapping Rain Water — answer outline

**Prompt:** `height[i]` is a bar of width 1. After it rains, how many units of water sit **in the valleys**? (LeetCode 42, Hard)

Listed as a hard stretch in [../general/coding-patterns.md](../general/coding-patterns.md). **Not** [coding-container-water.md](coding-container-water.md) (one pair of walls, one rectangle). Here each index can hold water.

## Probes

- Water at `i` is `min(leftMax, rightMax) - height[i]` if positive, else 0. `leftMax` / `rightMax` include walls **strictly outside** or **at** `i` — say which (same if you take running max including `i`).
- Ends never hold water (no wall on one side).
- Two pointers vs prefix arrays vs monotonic stack — they want the **optimization journey**, not a memorized snippet.

## Strong answer skeleton

1. **Clarify:** non-negative; empty → 0; return **total units**, not a map.
2. **Brute:** for each `i`, scan left and right for max — O(n²).
3. **O(n) space:** `L[i]` = max on `[0..i]`, `R[i]` = max on `[i..n)`. Sum `min(L[i], R[i]) - height[i]`. Easy to draw; good checkpoint.
4. **O(1) space:** two pointers. Track `leftMax` / `rightMax` while `L < R`. The side with the **smaller height** is limited by **its** running max (the other side is at least as tall). Bank water there and step that pointer inward.
5. **Complexity:** all honest solutions O(n) time; extra space O(n) vs O(1). Stack is also O(n) and harder to derive live.

## Sketch (two pointers)

```
L, R = 0, n-1
leftMax = rightMax = 0
water = 0
while L < R:
  if height[L] < height[R]:
    leftMax = max(leftMax, height[L])
    water += leftMax - height[L]
    L += 1
  else:
    rightMax = max(rightMax, height[R])
    water += rightMax - height[R]
    R -= 1
return water
```

`[0,1,0,2,1,0,1,3,2,1,2,1]` → **6**. `[4,2,0,3,2,5]` → **9**.

Prefix arrays first in a mock if the invariant is shaky; then drop the arrays.

## Mock narration (30 sec)

> “Water at an index is capped by the shorter of the tallest wall on each side. I’ll precompute those maxes in linear time, then show we only need the binding side: process the shorter pointer, because its running max is the cap.”

## Common mistakes

- Using **container-with-water** (move shorter for **area**) without the running-max bank.
- Forgetting ends / treating `max` as exclusive and double-subtracting the bar.
- Claiming O(n) two-pointers without the “smaller side is determined” argument.
- Returning the water **array** when they asked for a sum.

## Follow-ups

- **Trapping Rain Water II (407):** 2D grid; min-heap from the border inward (senior).
- **Container With Most Water (11):** one rectangle — [coding-container-water.md](coding-container-water.md).
- Stream of bars / cannot see the right end — prefix trick dies; say you need a different model.
- Monotonic decreasing stack: pop and fill **horizontal** layers.

## Sources

- [Trapping Rain Water — NeetCode](https://neetcode.io/solutions/trapping-rain-water) — accessed 2026-09-03
- [Trapping Rain Water: two pointers — DSA Prep](https://www.dsaprep.dev/blog/trapping-rain-water-leetcode-solution) — accessed 2026-09-03
- [Trapping Rain Water, brute force to two pointers — techinterview.org](https://www.techinterview.org/post/3233476036/trapping-rain-water-brute-force-to-two-pointers/) — accessed 2026-09-03
- [75 LeetCode problems FAANG asks most (2026) — Aceloop](https://aceloop.ai/blog/top-75-leetcode-faang-frequency) — accessed 2026-09-03
- Classic LeetCode #42 — two-pointer / prefix-max family
