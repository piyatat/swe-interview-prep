# Move Zeroes — answer outline

**Prompt:** Array `nums`. Move every `0` to the **end**, keep the relative order of the **non-zeros**, **in place** (no copy of the array). (LeetCode 283)

This is **stable partition** with two pointers, not a sort. Sibling of [coding-sort-colors.md](coding-sort-colors.md) (Dutch flag: three values, order of 1s still required) and [coding-remove-nth.md](coding-remove-nth.md) (in-place list edit). Grind 75 / NeetCode 150 arrays box. Wikipedia [in-place algorithm](https://en.wikipedia.org/wiki/In-place_algorithm): extra memory is O(1) besides the input.

## Probes

- Must **preserve order** of non-zeros (`[1,0,2]` → `[1,2,0]`, not `[2,1,0]`).
- Follow-up: **minimize writes** (swap only when `l != r`).
- Extra array of non-zeros then overwrite is O(n) space — they will ask O(1).
- Negatives and values other than `{0,1}` are allowed; **only `0` is special**.
- Return type is `void` — mutate `nums`.

## Strong answer skeleton — two pointers

1. **Clarify:** stable; in-place; `0` only; empty / all zeros / no zeros.
2. **Brute:** collect non-zeros, write them back, fill the tail with `0` — O(n) extra.
3. **Write pointer:** `l = 0`. Scan `r`. If `nums[r] != 0`, write/swap into `nums[l]` and `l += 1`. Zeros are overwritten or swapped right.
4. **Two-pass variant:** copy non-zeros left, then `while l < n: nums[l] = 0`. Same complexity; more writes on dense-zero tails.
5. **Complexity:** O(n) time, O(1) extra.

## Sketch (one-pass swap)

```
l = 0
for r in 0..n-1:
  if nums[r] != 0:
    swap(nums[l], nums[r])
    l += 1
```

`[0,1,0,3,12]` → `[1,3,12,0,0]`. After the loop, `l` is the count of non-zeros.

Swap when `l == r` is a no-op (already a non-zero prefix). Optional `if l != r` before the swap is the “minimize operations” follow-up, not required for correctness.

## Mock narration (30 sec)

> “I keep a write index at the next non-zero slot. I scan once: every non-zero swaps into that slot and the index advances, so zeros bubble right and the non-zero order never changes. Linear time, constant extra memory — no second array.”

## Common mistakes

- Sorting (`sort` puts negatives first and **destroys** the required order).
- Counting zeros then compacting **without** a write pointer (easy to drop a non-zero).
- Two pointers from both **ends** (that is palindrome / container-water, not this).
- Building a new list after they asked in-place.
- Treating the problem as Dutch flag with only `{0,1}` — extra values must stay in order.

## Follow-ups

- **Remove Element (27) / Remove Duplicates (26):** same write pointer; the tail is ignored, not zero-filled.
- **Sort Colors (75):** three-way partition — [coding-sort-colors.md](coding-sort-colors.md).
- **Move zeroes vs partition odds/evens:** same pattern, different predicate.

## Sources

- [283. Move Zeroes — LeetCode](https://leetcode.com/problems/move-zeroes/) — accessed 2026-11-24
- [Move Zeroes — NeetCode](https://neetcode.io/solutions/move-zeroes) — accessed 2026-11-24
- [283. Move Zeroes — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/283/) — accessed 2026-11-24
- [In-place algorithm — Wikipedia](https://en.wikipedia.org/wiki/In-place_algorithm) — accessed 2026-11-24
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-24
