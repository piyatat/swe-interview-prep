# Binary search (rotated array + search-on-answer) — outline

**Prompt A:** Search `target` in a rotated sorted array of distinct ints; return index or `-1`. (LeetCode 33)

**Prompt B:** Minimize a value `x` such that a **monotonic** feasibility check holds (Koko / ship-in-D-days family). (e.g. LeetCode 875)

Interview binary search is often **not** “find in a sorted list” — it is **halving a monotone space**. Off-by-one on the invariant is the usual fail.

## Probes

- Loop invariant: `lo <= hi` vs `lo < hi`; what does `mid` exclude?
- Overflow-safe mid: `lo + (hi - lo) // 2`.
- Duplicates in rotated array (81) — when you cannot tell which half is sorted.
- Name the **feasibility** function before coding B.

## Strong answer skeleton — rotated search

1. One of the two halves `[lo, mid]` / `[mid, hi]` is always sorted (distinct values).
2. If left half sorted and target in that range → shrink right; else search the other half. Symmetric for right-sorted.
3. O(log n) time, O(1) space.

## Rotated sketch

```
lo, hi = 0, n-1
while lo <= hi:
  mid = lo + (hi-lo)//2
  if nums[mid] == target: return mid
  if nums[lo] <= nums[mid]:          # left sorted
    if nums[lo] <= target < nums[mid]: hi = mid-1
    else: lo = mid+1
  else:                              # right sorted
    if nums[mid] < target <= nums[hi]: lo = mid+1
    else: hi = mid-1
return -1
```

Min-in-rotated (153): compare `nums[mid]` to `nums[hi]` to decide which side still contains the min.

## Strong answer skeleton — search on answer

1. **Monotone:** if `feasible(x)` then `feasible(x+1)` (or the reverse). Otherwise not this pattern.
2. Search space `[lo, hi]` = min/max **possible answer** (e.g. speed `1 … max(piles)`).
3. `mid` works → try smaller (`hi = mid`); else `lo = mid + 1`. Return `lo` as the first feasible.
4. Time: O(n log(range)) if each check is O(n).

Classic “minimize the maximum” / “minimum X such that we finish in H”.

## Koko-style sketch

```
feasible(k): hours to finish all piles at speed k <= h
lo, hi = 1, max(piles)
while lo < hi:
  mid = lo + (hi-lo)//2
  if feasible(mid): hi = mid
  else: lo = mid+1
return lo
```

## Mock narration (30 sec)

> “For rotated, I identify the sorted half and ask whether the target lives there. For Koko, I’m not searching the array — I’m binary-searching **speed** because ‘can finish’ is monotone.”

## Common mistakes

- Inclusive/exclusive bounds that infinite-loop.
- Treating a rotated array as fully sorted.
- Feasibility that is **not** monotone (then BS is wrong).
- Using float `ceil` carelessly; integer `(p + k - 1) // k` is safer.

## Follow-ups

- First bad version; capacity to ship packages; split array largest sum; `sqrt(x)`.
- Peak element — still halving, different compare.

## Sources

- [Binary search algorithm — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm) — accessed 2026-08-23
- [Binary search patterns 2026 — Copilot Interview](https://copilotinterview.com/blog/binary-search-patterns) — accessed 2026-08-23
- [Advanced binary search (rotated + on-answer) — techinterview.org](https://www.techinterview.org/post/3233461982/binary-search-advanced-interview-patterns/) — accessed 2026-08-23
- [Interview binary search (monotonic space) — Atharva Pandey](https://www.atharvapandey.com/post/fundamentals/interview-binary-search/) — accessed 2026-08-23
- Classic LeetCode #33 / #153 / #875 — modified binary search
