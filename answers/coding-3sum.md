# 3Sum — answer outline

**Prompt:** Given `nums`, return all **unique** triplets `[a, b, c]` with distinct indices such that `a + b + c == 0`. Order of triplets does not matter. (LeetCode 15)

This is the **sort + two pointers** step up from [coding-two-sum.md](coding-two-sum.md). Listed in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Brute O(n³) vs why sort enables an O(n) inner scan.
- Duplicates: unique **triplets**, not unique indices.
- Same value three times (`[0,0,0]`) only if three copies exist.
- Early exit once the fixed value is `> 0` on a sorted array.

## Strong answer skeleton

1. **Clarify:** return values not indices; empty / `n < 3` → `[]`; duplicates in input.
2. **Reduce:** sort; for each `i`, Two Sum II on the suffix for target `-nums[i]`.
3. **Skip duplicates at two levels:** outer `i` (`nums[i] == nums[i-1]`); after a hit, walk `left`/`right` past equal values.
4. **Move both pointers after a match** — moving one stalls or duplicates.
5. **Complexity:** O(n²) time (sort O(n log n) dominated); extra space O(1) besides sort/output. Comparison 3SUM is classically quadratic in interviews; do not claim a fancy subquadratic bound unless asked.

## Sketch

```
sort nums
for i in 0 .. n-3:
  if nums[i] > 0: break
  if i > 0 and nums[i] == nums[i-1]: continue
  L, R = i+1, n-1
  while L < R:
    s = nums[i] + nums[L] + nums[R]
    if s == 0:
      emit; skip equal L/R; L++; R--
    elif s < 0: L++
    else: R--
```

Walk `[-1,0,1,2,-1,-4]` → sort `[-4,-1,-1,0,1,2]` → `[-1,-1,2]` and `[-1,0,1]`.

## Mock narration (30 sec)

> “I’ll sort so two pointers work and duplicates clump. Fix one number; scan the rest like Two Sum II for the complement. Skip the same first value, and after a hit skip equal left/right so we don’t emit the same triplet twice. O(n²).”

## Common mistakes

- Forgetting to sort (Two Sum **hash** does not give unique triplets cheaply).
- Outer skip using `i+1` and dropping a first occurrence.
- Not skipping inner duplicates after a match.
- Returning indices (Two Sum habit).
- Infinite loop: match but only increment `L`.

## Follow-ups

- **3Sum Closest (16):** track best `s` vs target; same pointers.
- **4Sum (18):** one more outer loop + same inner pair; skip at three levels.
- **k-Sum:** k−2 loops + two pointers.

## Sources

- [3SUM — Wikipedia](https://en.wikipedia.org/wiki/3SUM) — accessed 2026-08-25
- [3Sum walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/three-sum-interview-walkthrough/) — accessed 2026-08-25
- [Coding Interview Patterns 2026 — intervu.dev](https://intervu.dev/blog/coding-interview-patterns/) — accessed 2026-08-25
- Classic LeetCode #15 / #16 / #18 — two-pointer k-sum family
