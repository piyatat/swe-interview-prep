# Single Number — answer outline

**Prompt:** Array `nums` where every value appears **twice** except one. Return the value that appears once. O(n) time and **O(1) extra space**. (LeetCode 136)

This is the **XOR-fold** identity problem in the NeetCode 150 bit-manipulation box. Sibling of [coding-number-of-1-bits.md](coding-number-of-1-bits.md) (count ones) and [coding-counting-bits.md](coding-counting-bits.md) (prefix popcount). Wikipedia [exclusive or](https://en.wikipedia.org/wiki/Exclusive_or): `a ⊕ a = 0`, `a ⊕ 0 = a`, commutative and associative.

## Probes

- Hash set / count map is O(n) space — they will ask you to drop it.
- Sort + scan pairs is O(n log n) — name it, then improve.
- XOR every element: duplicates cancel; the leftover is the singleton.
- Follow-up **Single Number II** (every value ×3 except one) is **not** this XOR — say so if they change the counts.

## Strong answer skeleton

1. **Clarify:** exactly one singleton; all others appear twice; negatives allowed; order does not matter.
2. **Brute:** nested scan O(n²), or set add/remove O(n) extra memory.
3. **XOR:** `res = 0`; for `x` in `nums`: `res ^= x`. Return `res`.
4. **Why it works:** pairs become 0; 0 ⊕ singleton = singleton. Order does not matter.
5. **Complexity:** O(n) time, O(1) space. No overflow: XOR is bitwise, not a sum.

## Sketch (XOR fold)

```
res = 0
for x in nums:
  res ^= x
return res
```

`[4,1,2,1,2]` → `4`. `[2,2,1]` → `1`. Walk bits of `1 ⊕ 1 ⊕ 2 ⊕ 2 ⊕ 4` out loud.

Sort form (if they ban bits): sort, step by 2, return the first unpaired or the last element. Worse time; still O(1) extra if the sort is in-place.

## Mock narration (30 sec)

> “Every duplicate cancels under XOR, and XOR is associative, so I fold the array starting from 0. Whatever is left is the number that appeared once. Linear time, constant extra space — no hashmap.”

## Common mistakes

- Hash map “because interviews like maps” after they asked O(1) space.
- Summing `2 * unique_sum - array_sum` without handling negatives / overflow, or assuming you may allocate a set of uniques.
- XOR-ing indices instead of values, or returning `res` before the last element.
- Treating **Single Number II / III** (triples, or two singletons) as the same trick.

## Follow-ups

- **Missing Number (268):** XOR `0..n` with the array — same fold.
- **Number of 1 Bits (191):** popcount, not uniqueness — [coding-number-of-1-bits.md](coding-number-of-1-bits.md).
- **Reverse Bits (190):** place bits, do not cancel them — [coding-reverse-bits.md](coding-reverse-bits.md).
- **Find the duplicate (287):** cycle in an index graph — [coding-find-duplicate.md](coding-find-duplicate.md).

## Sources

- [Single Number — NeetCode](https://neetcode.io/solutions/single-number) — accessed 2026-11-02
- [136. Single Number — LeetCode](https://leetcode.com/problems/single-number/) — accessed 2026-11-02
- [Exclusive or — Wikipedia](https://en.wikipedia.org/wiki/Exclusive_or) — accessed 2026-11-02
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-02
