# Contains Duplicate — answer outline

**Prompt:** Integer array `nums`. Return whether **any value appears at least twice**. If every element is distinct, return false. (LeetCode 217)

This is NeetCode 150 / Blind 75 **arrays-and-hashing #1** — the hash-set membership drill before [coding-two-sum.md](coding-two-sum.md) (map of value → index) and [coding-longest-consecutive.md](coding-longest-consecutive.md) (set + run starts). Wikipedia [Hash table](https://en.wikipedia.org/wiki/Hash_table). Named under hash map / set in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Empty / single element → false (no pair). Duplicates of **any** value, not a specific target.
- Sort + adjacent scan is O(n log n) and **mutates** unless you copy.
- Hash set is O(n) expected time, O(n) space. `len(set(nums)) < len(nums)` is the same idea in one line — mention it, then show the early-exit loop.
- Follow-up: **Contains Duplicate II (219)** — same value within distance `k`.

## Strong answer skeleton

1. **Clarify:** any duplicate (not a given target); unsorted; values can be negative; n up to 1e5.
2. **Brute:** nested pairs O(n²). Inner loop must start at `i + 1` or you match an index with itself.
3. **Sort:** sort, scan neighbors. O(n log n) time; extra space depends on the sort; destroys order.
4. **Set:** for each `x`, if `x` in `seen` → true; else add. Early exit on the first repeat.
5. **Complexity:** O(n) time expected, O(n) space. Worst-case hash pile-up is rare; sorting is the deterministic backup.

## Sketch (early-exit set)

```
seen = set()
for x in nums:
  if x in seen: return True
  seen.add(x)
return False
```

`[1,2,3,1]` → true on the last `1`. `[1,2,3,4]` → false. One-liner `len(set(nums)) < n` always scans the whole array.

## Mock narration (30 sec)

> “I need to know if any value repeats. I’ll keep a hash set of what I’ve seen and return true on the first hit. That’s linear time and linear space. If they forbid extra memory, I’d sort and compare neighbors — slower, and it mutates.”

## Common mistakes

- Comparing `nums[i] == nums[j]` with `j` starting at `0` (self-match → always true).
- Sorting in place after they need the original order.
- Using a list (`x in seen`) → O(n²) again.
- Solving **219** (window of size `k`) by accident, or **220** (value range `t`).
- Empty-array off-by-one in the neighbor scan (`range(1, n)` on `n == 0` is fine; a `nums[0]` peek is not).

## Follow-ups

- **Contains Duplicate II (219):** sliding set of the last `k` indices, or map value → last index and check `i - last <= k`.
- **Two Sum:** [coding-two-sum.md](coding-two-sum.md) — need the **partner**, not “any repeat.”
- **Find the Duplicate Number (287):** [coding-find-duplicate.md](coding-find-duplicate.md) — n+1 values in `1..n`, **O(1)** extra, Floyd.
- **Longest consecutive:** [coding-longest-consecutive.md](coding-longest-consecutive.md).

## Sources

- [217. Contains Duplicate — LeetCode](https://leetcode.com/problems/contains-duplicate/) — accessed 2026-11-09
- [Contains Duplicate — NeetCode](https://neetcode.io/solutions/contains-duplicate) — accessed 2026-11-09
- [217. Contains Duplicate — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/217/) — accessed 2026-11-09
- [Hash table — Wikipedia](https://en.wikipedia.org/wiki/Hash_table) — accessed 2026-11-09
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-09
