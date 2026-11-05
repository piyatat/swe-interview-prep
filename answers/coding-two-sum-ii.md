# Two Sum II (sorted) — answer outline

**Prompt:** 1-indexed array `numbers` **already sorted** non-decreasing. Return indices `[i, j]` (`i < j`) whose values sum to `target`. Exactly one solution; do not reuse the same element. **O(1) extra space.** (LeetCode 167)

This is the **sorted two-pointer** sibling of [coding-two-sum.md](coding-two-sum.md) (unsorted → hash map). Same “find a pair” prompt; the sort is a gift you must spend. Wikipedia [in-place algorithm](https://en.wikipedia.org/wiki/In-place_algorithm): constant extra memory, not a second array of indices.

## Probes

- Hash map still works — **O(n) space**, so it **fails the constraint**.
- Why moving the **right** pointer can never skip a needed pair (array is sorted).
- 1-based output; empty / one-element are excluded by the guarantee.
- Binary search for `target - numbers[i]` on the suffix is O(n log n) extra-time, still O(1) space — name it, then improve.

## Strong answer skeleton

1. **Clarify:** already sorted; exactly one pair; 1-indexed; O(1) extra space; negatives allowed.
2. **Reject** the unsorted Two Sum map on space.
3. **Two pointers:** `l = 0`, `r = n - 1`. While `l < r`:
   - `s = numbers[l] + numbers[r]`
   - `s == target` → return `[l+1, r+1]`
   - `s < target` → `l += 1` (need a larger left)
   - `s > target` → `r -= 1` (need a smaller right)
4. **Invariant:** every discarded end is too small or too large to participate with any remaining partner.
5. **Complexity:** O(n) time, O(1) extra space.

## Sketch (two pointers)

```
l, r = 0, n-1
while l < r:
  s = numbers[l] + numbers[r]
  if s == target: return [l+1, r+1]
  if s < target: l += 1
  else: r -= 1
```

`[2,7,11,15], 9` → `[1,2]`. `[2,3,4], 6` → `[1,3]`. `[-1,0], -1` → `[1,2]`.

Binary-search form: for each `i`, search `target - numbers[i]` in `(i+1)..end`. Correct, slower. Do not sort again.

## Mock narration (30 sec)

> “The array is sorted, and I only get constant extra space, so a hash map is out. I put pointers at both ends. If the sum is short I need a bigger left; if it overshoots I shrink the right. Each step throws away an index that cannot be in the pair. Linear time, constant extra memory, and I add one for the 1-based answer.”

## Common mistakes

- Returning 0-based indices.
- Using the Two Sum hash map after they asked O(1) space.
- `l <= r` and using the same index twice.
- Moving **both** pointers after a miss.
- Assuming all positives (negatives are in the examples).

## Follow-ups

- **Two Sum (1):** unsorted → map — [coding-two-sum.md](coding-two-sum.md).
- **3Sum (15):** sort, then this scan on the suffix — [coding-3sum.md](coding-3sum.md).
- **Container With Most Water (11):** same ends, different invariant (area) — [coding-container-water.md](coding-container-water.md).

## Sources

- [167. Two Sum II - Input Array Is Sorted — LeetCode](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/) — accessed 2026-11-05
- [Two Sum II — NeetCode](https://neetcode.io/solutions/two-sum-ii-input-array-is-sorted) — accessed 2026-11-05
- [167. Two Sum II — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/167/) — accessed 2026-11-05
- [In-place algorithm — Wikipedia](https://en.wikipedia.org/wiki/In-place_algorithm) — accessed 2026-11-05
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-05
