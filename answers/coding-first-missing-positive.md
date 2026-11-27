# First Missing Positive — answer outline

**Prompt:** Unsorted integer array `nums`. Return the **smallest positive integer** that is not present. Must run in **O(n)** time and **O(1)** extra space. `n ≤ 10^5`; values may be negative, zero, huge, or duplicated. (LeetCode 41)

This is **index-as-hash / cyclic placement**, not [coding-missing-number.md](coding-missing-number.md) (exact range `[0, n]`, XOR) and not [coding-find-duplicate.md](coding-find-duplicate.md) (Floyd on an index graph). Wikipedia [pigeonhole principle](https://en.wikipedia.org/wiki/Pigeonhole_principle): `n` slots hold at most `n` distinct values from `1..n`, so the answer lives in **`[1, n+1]`**. Interview cousin of Wikipedia [cycle sort](https://en.wikipedia.org/wiki/Cycle_sort) (put `v` at index `v-1`). NeetCode 250 arrays box.

## Probes

- Answer is never `≤ 0`. Ignore negatives, `0`, and values `> n`.
- If `1..n` are all present, return `n+1` — do not return `n` or `-1`.
- Hash set is O(n) space; sort is O(n log n) — they will reject both after the constraint.
- Duplicates: the swap guard must be `nums[home] != nums[i]`, or `[1, 1]` infinite-loops.

## Strong answer skeleton

1. **Clarify:** mutate in place OK? (usually yes). Empty → `1`.
2. **Bound:** pigeonhole → only care about `1..n`. Home of `v` is index `v-1`.
3. **Place:** for each `i`, while `1 ≤ nums[i] ≤ n` and `nums[nums[i]-1] != nums[i]`, swap into home. Save `home` before the swap (Python tuple-assign evaluates the second target after writing `nums[i]`).
4. **Scan:** first `i` with `nums[i] != i+1` → return `i+1`. If every slot matches, return `n+1`.
5. **Complexity:** each successful swap parks a value forever → ≤ n swaps, O(n) time, O(1) extra.

Sign-bucket twin (same bound): treat `nums[i]` sign as “`i+1` seen.” First rewrite non-positives to a sentinel (`n+1` or `1` after a presence check), then flip `nums[v-1]` negative for each in-range `v`. First still-positive index wins. Same O(n)/O(1); cyclic swap is the usual pitch.

## Sketch (cyclic place)

```
n = len(nums)
for i in range(n):
    while 1 <= nums[i] <= n and nums[nums[i]-1] != nums[i]:
        home = nums[i] - 1
        nums[i], nums[home] = nums[home], nums[i]
for i in range(n):
    if nums[i] != i + 1:
        return i + 1
return n + 1
```

`[3,4,-1,1]` → after place `[1,4,3,-1]` → index 1 is not `2`. `[7,8,9,11,12]` → nothing in `1..5` parks → `1`. `[1,2,0]` → `[1,2,0]` → `3`.

## Mock narration (30 sec)

> “With n slots the first missing positive is in 1..n+1, so I use the array as a hash: value v belongs at index v-1. I swap in-range values home, skip junk and duplicates, then the first index that does not hold i+1 is the gap. Linear time, constant extra space.”

## Common mistakes

- Hash set after they asked O(1) extra space.
- Swapping on `nums[i] != i+1` without the duplicate guard — infinite loop on twins.
- Treating `0` as positive, or returning `0` when `1` is missing.
- Forgetting the `n+1` fallback when `1..n` are all present.
- Confusing with Missing Number (XOR on a closed range) or Find Duplicate (cycle in `1..n` with one extra).

## Follow-ups

- **Missing Number (268):** [coding-missing-number.md](coding-missing-number.md) — XOR / Gauss, not cyclic place.
- **Find the duplicate (287):** [coding-find-duplicate.md](coding-find-duplicate.md) — Floyd, do not mutate.
- **Find all missing (448):** same home-index idea; collect every gap, not the first.

## Sources

- [41. First Missing Positive — LeetCode](https://leetcode.com/problems/first-missing-positive/) — accessed 2026-11-27
- [First Missing Positive — NeetCode](https://neetcode.io/solutions/first-missing-positive) — accessed 2026-11-27
- [Pigeonhole principle — Wikipedia](https://en.wikipedia.org/wiki/Pigeonhole_principle) — accessed 2026-11-27
- [Cycle sort — Wikipedia](https://en.wikipedia.org/wiki/Cycle_sort) — accessed 2026-11-27
- [NeetCode 250 list by topic — Thita](https://thita.ai/blog/dsa/neetcode-250-complete-list-by-topic) — accessed 2026-11-27
