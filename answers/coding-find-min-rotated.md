# Find Minimum in Rotated Sorted Array — answer outline

**Prompt:** Array `nums` was sorted ascending, then rotated `1…n` times. All values **distinct**. Return the **minimum** element (not its index). Must be **O(log n)**. (LeetCode 153)

Sibling of [coding-binary-search.md](coding-binary-search.md) Prompt A (search a **target** in the same shape) and [coding-find-peak.md](coding-find-peak.md) (walk a slope). Here there is **no target**: you locate the **rotation seam**. NeetCode 150 binary-search box.

## Probes

- Un-rotated input (`[11,13,15,17]`) must return the first element — compare to **`hi`**, not `lo`.
- Distinct values (154 with duplicates is a different, linear-worst-case problem).
- Return the **value**, not the index (opposite of peak / rotated search).
- `lo < hi` so `mid+1` is safe; `mid` may **be** the min — do not drop it when going left.

## Strong answer skeleton

1. **Clarify:** unique ints; rotation count unknown (including 0 / n); O(log n).
2. **Linear:** one pass — O(n). Warm-up only.
3. **Invariant:** min lives in `nums[lo…hi]`. Compare `nums[mid]` to `nums[hi]` (the right end sits on the **higher** of the two runs).
   - If `nums[mid] > nums[hi]`, the seam is **strictly right** of mid → `lo = mid + 1`.
   - Else mid is in the unrotated suffix (or *is* the min) → `hi = mid`.
4. Stop when `lo == hi`. Time O(log n), space O(1).

## Sketch (`lo < hi`)

```
lo, hi = 0, n-1
while lo < hi:
  mid = lo + (hi-lo)//2
  if nums[mid] > nums[hi]:
    lo = mid + 1
  else:
    hi = mid
return nums[lo]
```

`[3,4,5,1,2]` → `1`. `[4,5,6,7,0,1,2]` → `0`. `[11,13,15,17]` → `11`. `[2,1]` → `1`.

Why `hi` not `lo`: `nums[lo]` can sit on **either** run depending on how far you rotated. `nums[hi]` is a stable reference on the upper run until the window collapses onto the min.

## Mock narration (30 sec)

> “The array is two sorted runs. I binary-search by comparing mid to the right end. If mid is bigger than the right end, the minimum is strictly to the right of mid. Otherwise I keep mid. When the window is one cell, that is the min. Log time.”

## Common mistakes

- Comparing `nums[mid]` to `nums[lo]` (breaks on un-rotated or `[2,1]`).
- `hi = mid - 1` when `nums[mid] <= nums[hi]` — drops the answer.
- Returning the **index**.
- Treating this as “search for target” ([coding-binary-search.md](coding-binary-search.md) Prompt A) and looking for a value the prompt never gave.
- Assuming there is always a wrap (rotation of `n` is a valid sorted array).

## Follow-ups

- **Search in Rotated Sorted Array (33):** identify the **sorted half**, then ask if target lives there — [coding-binary-search.md](coding-binary-search.md).
- **Find Minimum II (154):** duplicates; when `nums[mid] == nums[hi]` you can only `hi -= 1` (O(n) worst).
- **Find Peak (162):** different predicate (uphill), same “halve a promise” idea.

## Sources

- [Find Minimum in Rotated Sorted Array — NeetCode](https://neetcode.io/solutions/find-minimum-in-rotated-sorted-array) — accessed 2026-11-06
- [Find Minimum in Rotated Sorted Array — LeetCode 153](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/) — accessed 2026-11-06
- [Binary search algorithm — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm) — accessed 2026-11-06
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-06
