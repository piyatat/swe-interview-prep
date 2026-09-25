# Find the Duplicate Number — answer outline

**Prompt:** `nums` has length `n + 1`; every value is in `[1, n]`; **exactly one** value is repeated (it may appear **more than twice**). Return that value. Follow-up: **do not mutate** `nums`, **O(1)** extra space. (LeetCode 287)

This is **Floyd on the functional graph** `i → nums[i]`, not “sort and scan.” Sibling of [coding-linked-list.md](coding-linked-list.md) (tortoise / hare) and [coding-binary-search.md](coding-binary-search.md) (search the *value* range). NeetCode 150; Wikipedia [cycle detection](https://en.wikipedia.org/wiki/Cycle_detection).

## Probes

- Values are valid **next indices** (range is `1..n`, length is `n+1`) so the walk is well-defined.
- Duplicate value ⇒ two parents point at the same node ⇒ a **cycle**; the entry is the duplicate.
- Index `0` is never a value, so the walk from `0` always enters the cycle.
- First meeting point is **inside** the cycle, not necessarily the duplicate — need the 142 reset.
- Set / sort / negate-in-place fail the follow-up (space or mutation).

## Strong answer skeleton — Floyd

1. **Clarify:** one duplicate value; it can appear 2+ times; cannot modify; O(1) space.
2. **Baseline:** hash set of seen values — O(n) space. Sort — mutates, O(n log n).
3. **Graph:** `next(i) = nums[i]`. Slow `= nums[slow]`, fast `= nums[nums[fast]]` from `0`.
4. When they meet, set `finder = 0`; walk `finder = nums[finder]`, `slow = nums[slow]` until equal. That value is the duplicate.
5. **Complexity:** O(n) time, O(1) space, no writes.

## Sketch (Floyd)

```
slow = fast = 0
while True:
  slow = nums[slow]
  fast = nums[nums[fast]]
  if slow == fast:
    break
finder = 0
while finder != slow:
  finder = nums[finder]
  slow = nums[slow]
return slow
```

`[1,3,4,2,2]`: `0→1→3→2→4→2…` cycle entry `2`.

## Alternate (if they ban pointers) — count binary search

`low, high = 1, n`. Mid `m`; if `count(x <= m) > m` the duplicate is in `[low, m]`, else `[m+1, high]`. Pigeonhole. **O(n log n)** time, O(1) space, no mutation. Mention it; Floyd is the follow-up they usually want.

## Mock narration (30 sec)

> “I treat the array as a linked list: index i points to nums[i]. One extra edge into the repeated value makes a cycle. Floyd finds a meeting node; then I walk from zero and from the meeting node one step at a time — the join is the duplicate, same as list-cycle entry.”

## Common mistakes

- Returning the **first meeting** node (may be mid-cycle).
- Starting slow/fast at `nums[0]` inconsistently, or using `i+1` instead of `nums[i]`.
- Claiming O(1) after allocating a set, or sorting in place against the follow-up.
- Assuming the duplicate appears **exactly twice** (the cycle still works if it appears more).

## Follow-ups

- **Linked List Cycle II (142)** — same math on real nodes.
- **Missing number (268)** — xor / gauss; different constraint.
- **First missing positive (41)** — mutation / index-as-hash is allowed there.

## Sources

- [Find the Duplicate Number — NeetCode](https://neetcode.io/solutions/find-the-duplicate-number) — accessed 2026-09-25
- [Find the Duplicate Number — LeetCode 287](https://leetcode.com/problems/find-the-duplicate-number/) — accessed 2026-09-25
- [Cycle detection (Floyd) — Wikipedia](https://en.wikipedia.org/wiki/Cycle_detection) — accessed 2026-09-25
- Classic LeetCode #287 — array-as-list / tortoise-hare family
