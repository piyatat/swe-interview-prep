# Missing Number — answer outline

**Prompt:** Array `nums` of `n` **distinct** ints in `[0, n]`. Exactly one value in that range is absent. Return it. Follow-up: O(n) time, **O(1) extra space**. (LeetCode 268)

This is the **range-cancel** problem in the NeetCode 150 bit-manipulation box. Sibling of [coding-single-number.md](coding-single-number.md) (XOR pairs in the array) — here you XOR **indices `0..n` with the values**. Wikipedia [exclusive or](https://en.wikipedia.org/wiki/Exclusive_or): `a ⊕ a = 0`. Gauss sum `n(n+1)/2` is the math twin.

## Probes

- Range is `[0, n]` for length `n` — **`n` itself may be missing**.
- Hash set is O(n) space — they will ask you to drop it.
- Sort + `nums[i] == i` is O(n log n); if every index matches, answer is `n`.
- Sum vs XOR: sum can overflow 32-bit; XOR cannot. Gauss formula needs a wide type or a running `res += i - nums[i]`.

## Strong answer skeleton — XOR

1. **Clarify:** distinct; exactly one missing; `0` and `n` both legal answers; order arbitrary.
2. **Brute:** for `x` in `0..n`, scan the array — O(n²). Set of values, then probe — O(n) extra memory.
3. **XOR:** start `xorr = n`. For each `i`: `xorr ^= i ^ nums[i]`. Return `xorr`.
4. **Why:** every index `0..n-1` and every present value cancel; leftover is the missing one (including `n` if it never appears).
5. **Complexity:** O(n) time, O(1) space.

## Sketch (XOR)

```
xorr = n
for i, x in enumerate(nums):
  xorr ^= i ^ x
return xorr
```

`[3,0,1]` → `2`. `[0,1]` → `2`. `[1,2,3]` → `0`.

Math form: `res = n`; loop `res += i - nums[i]`. Same O(1) extra; mention overflow if they use `n*(n+1)/2` in 32-bit.

## Mock narration (30 sec)

> “The missing value is the one that appears in 0..n but not in the array. XOR both sequences: duplicates vanish, leftover is the gap. I seed with n so that if n is missing it still sits in the fold. Linear time, constant extra space — no hashmap.”

## Common mistakes

- Looping only `0..n-1` and never considering **`n`**.
- Hash set after they asked O(1) space.
- `n*(n+1)/2 - sum(nums)` overflowing int; or integer-dividing before the even product.
- Sorting then returning the first `nums[i] != i` **without** the “all matched → n” fallback.
- Confusing with [coding-find-duplicate.md](coding-find-duplicate.md) (length `n`, values `1..n`, **one extra**).

## Follow-ups

- **Single Number (136):** XOR the array only — [coding-single-number.md](coding-single-number.md).
- **Find the duplicate (287):** Floyd on the index graph, not XOR.
- **First Missing Positive (41):** permutation-cycle / sign-bucket — different constraints.
- Bitset / in-place swap-into-index if they allow mutating `nums`.

## Sources

- [268. Missing Number — LeetCode](https://leetcode.com/problems/missing-number/) — accessed 2026-11-07
- [Missing Number — NeetCode](https://neetcode.io/solutions/missing-number) — accessed 2026-11-07
- [268. Missing Number — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/268/) — accessed 2026-11-07
- [Exclusive or — Wikipedia](https://en.wikipedia.org/wiki/Exclusive_or) — accessed 2026-11-07
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-07
