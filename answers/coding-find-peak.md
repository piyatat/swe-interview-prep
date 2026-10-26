# Find Peak Element — answer outline

**Prompt:** Array `nums`. A **peak** is strictly greater than its neighbors. Imagine `nums[-1] = nums[n] = −∞` (ends can be peaks). Return the **index** of **any** peak. Adjacent values are **distinct**. Must be **O(log n)**. (LeetCode 162)

This is binary search on an **unsorted** array: you do not have a target — you walk **uphill**. Same “halve a monotone promise” idea as [coding-binary-search.md](coding-binary-search.md) Prompt B. NeetCode 150 binary-search box.

## Probes

- Why a peak **must** exist (distinct neighbors + −∞ sentinels).
- Any peak is fine — do not hunt the global max unless they ask.
- `l < r` vs `l <= r`: mixing them loops or misses.
- Safe `mid+1`: with `l < r`, `mid` is never the last index.
- 2-D follow-up (1901): same “move toward a higher neighbor.”

## Strong answer skeleton

1. **Clarify:** any peak; `n ≥ 1`; no adjacent equals; O(log n) is the bar (linear scan is the fallback they will ding).
2. **Linear:** first `i` with `nums[i] > nums[i+1]`, else `n-1` — O(n). Fine as a warm-up, not the ask.
3. **Binary search:** at `mid`, compare `nums[mid]` and `nums[mid+1]`.
   - If `nums[mid] > nums[mid+1]`, a peak lives in `[lo, mid]` (this cell **or** left).
   - Else the slope is up, so a peak lives in `[mid+1, hi]`.
4. When `lo == hi`, that index is a peak. Time O(log n), space O(1).

## Sketch (`l < r`)

```
lo, hi = 0, n-1
while lo < hi:
  mid = lo + (hi-lo)//2
  if nums[mid] > nums[mid+1]:
    hi = mid
  else:
    lo = mid + 1
return lo
```

`[1,2,3,1]` → `2`. `[1,2,1,3,4,5,0]` → `1` or `5`. Single element → `0`. Strictly increasing → last index.

Why it is legal: from `mid`, the higher neighbor’s half **cannot** be a strict descent all the way to a −∞ wall, so it still contains a peak.

## Mock narration (30 sec)

> “I am not searching for a value. I look at the slope at mid. If the next cell is higher I throw away the left, because a peak has to exist on the uphill side. If mid is already downhill I keep mid. When the window is one cell, that is a peak. Log time.”

## Common mistakes

- Scanning for the **maximum** (works, but O(n) and not the intended bar).
- Using `l <= r` and then writing `r = mid` without a separate return — infinite loop.
- Indexing `mid+1` when `l == r` (loop should have stopped).
- Assuming the array is bitonic (one peak). Several peaks are allowed.
- Returning the **value** instead of the index.

## Follow-ups

- **Find Minimum in Rotated Sorted Array (153):** still log time; compare `mid` to `hi` — one-liner in [coding-binary-search.md](coding-binary-search.md).
- **Peak Index in a Mountain Array (852):** exactly one peak; same walk-uphill.
- **Find a Peak Element II (1901):** 2-D; pick a mid column, jump to a greater neighbor.

## Sources

- [Find Peak Element — NeetCode](https://neetcode.io/solutions/find-peak-element) — accessed 2026-10-26
- [Find Peak Element — LeetCode 162](https://leetcode.com/problems/find-peak-element/) — accessed 2026-10-26
- [Binary search algorithm — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm) — accessed 2026-10-26
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-26
