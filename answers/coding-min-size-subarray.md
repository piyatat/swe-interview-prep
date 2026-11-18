# Minimum Size Subarray Sum — answer outline

**Prompt:** Positive ints `nums` and positive `target`. Return the **shortest** contiguous subarray whose sum is **≥ `target`**. If none, `0`. (LeetCode 209)

This is a **shrinkable window on a monotone sum**, not [coding-subarray-sum-k.md](coding-subarray-sum-k.md) (count exact `k`, negatives allowed → prefix hash) and not [coding-min-window.md](coding-min-window.md) (coverage of a string). NeetCode 150 sliding-window box. Wikipedia [prefix sum](https://en.wikipedia.org/wiki/Prefix_sum): positives make prefixes strictly increasing, so the left pointer only moves right.

## Probes

- All `nums[i] ≥ 1` — **that** is why two pointers are legal. Negatives break it (use 560).
- Return **length**, not the subarray. No window → `0`, not `-1`.
- `≥ target`, not `==`. A single `nums[i] ≥ target` → `1`.
- Follow-up they publish: `O(n log n)` prefix + lower-bound — name it; code the `O(n)` window unless they insist.

## Strong answer skeleton — two pointers

1. **Clarify:** positives; length; empty / all-too-small → `0`.
2. `left = 0`, `s = 0`, `ans = inf`.
3. For each `right`: `s += nums[right]`. **While** `s >= target`: `ans = min(ans, right-left+1)`; `s -= nums[left]`; `left += 1`.
4. Return `0` if `ans` never updated.
5. **Complexity:** each index enters/leaves once → O(n) time, O(1) space.

Prefix+BS twin: `s[0]=0`, `s[i+1]=s[i]+nums[i]`; for each `i` lower-bound `s[i]+target`; length `j-i`. O(n log n), O(n) space — the follow-up, not the default.

## Sketch

```
ans, s, left = inf, 0, 0
for right, x in enumerate(nums):
  s += x
  while s >= target:
    ans = min(ans, right - left + 1)
    s -= nums[left]
    left += 1
return 0 if ans == inf else ans
```

`target=7`, `[2,3,1,2,4,3]` → `2` (`[4,3]`). `target=11`, eight `1`s → `0`. `target=4`, `[1,4,4]` → `1`.

Shrink as far as the while allows — a leftover valid prefix is **longer**, never shorter.

## Mock narration (30 sec)

> “Numbers are positive, so the window sum only grows when I expand and only shrinks when I drop the left. I expand right, then while I’m at least target I record the length and eat from the left. Linear because each index moves once. If they allow negatives I switch to prefix hashes.”

## Common mistakes

- Stopping at `== target` (a longer window can overshoot into a **shorter** suffix).
- Using a prefix-hash exact-k solution (560) and returning a count.
- Forgetting `0` when the whole array is still short.
- Binary-searching `nums` itself (unsorted) instead of the **prefix** array.
- `for` instead of `while` on the left — misses nested shrinks.

## Follow-ups

- **O(n log n):** prefix + lower-bound (published follow-up).
- **Exact sum k with negatives:** [coding-subarray-sum-k.md](coding-subarray-sum-k.md).
- **Shortest covering substring:** [coding-min-window.md](coding-min-window.md).
- **Maximum subarray (Kadane):** [coding-maximum-subarray.md](coding-maximum-subarray.md) — best *sum*, not shortest length.

## Sources

- [209. Minimum Size Subarray Sum — LeetCode](https://leetcode.com/problems/minimum-size-subarray-sum/) — accessed 2026-11-18
- [Minimum Size Subarray Sum — NeetCode](https://neetcode.io/solutions/minimum-size-subarray-sum) — accessed 2026-11-18
- [209. Minimum Size Subarray Sum — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/209/) — accessed 2026-11-18
- [Prefix sum — Wikipedia](https://en.wikipedia.org/wiki/Prefix_sum) — accessed 2026-11-18
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-18
