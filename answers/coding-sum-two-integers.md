# Sum of Two Integers — answer outline

**Prompt:** Integers `a` and `b`. Return `a + b` **without** using `+` or `-`. (LeetCode 371)

This is **hardware addition in software**: XOR is the sum-without-carry; AND shifted left is the carry. Wikipedia [adder](https://en.wikipedia.org/wiki/Adder_(electronics)): a half-adder is XOR + AND. Negatives are [two’s complement](https://en.wikipedia.org/wiki/Two%27s_complement), so the same loop works on fixed-width ints. NeetCode 150 bit-manipulation box. Cousin of [coding-single-number.md](coding-single-number.md) (XOR fold) and [coding-number-of-1-bits.md](coding-number-of-1-bits.md) (bit loop).

## Probes

- `+` / `-` / `sum()` / increment are banned. Bitwise `^`, `&`, `|`, `<<` are the point.
- Range includes **negatives** (`-1000…1000`). Two’s complement addition is the same circuit.
- Python ints are unbounded — mask to **32 bits** or the carry loop never ends on negatives.
- Interviewer may ask: why `<< 1` on the carry? That is the next higher bit, same as a full-adder `Cout`.

## Strong answer skeleton

1. **Clarify:** 32-bit two’s complement; both signs; `b == 0` is already the answer.
2. **Sum without carry:** `a ^ b`. **Carry:** `(a & b) << 1`.
3. Repeat: `a, b = a ^ b, (a & b) << 1` until `b == 0`. Then `a` is the sum.
4. **Python:** `& 0xFFFFFFFF` each step; if the sign bit is set (`a > 0x7FFFFFFF`), convert back with `~(a ^ mask)`.
5. **Complexity:** O(1) — at most 32 carry passes. O(1) space.

## Sketch

```
# Java / C++ (fixed-width two's complement)
while b != 0:
  carry = (a & b) << 1
  a = a ^ b
  b = carry
return a
```

Python (mask or the carry grows forever):

```
mask = 0xFFFFFFFF
while b:
  a, b = (a ^ b) & mask, ((a & b) << 1) & mask
return a if a <= 0x7FFFFFFF else ~(a ^ mask)
```

`1 + 2`: `01 ^ 10 = 11`, carry `0` → `3`. `1 + 1`: `00` with carry `10` → next round `2`.

## Mock narration (30 sec)

> “XOR is add without carry; AND shifted left is the carry into the next bit. I loop until the carry is gone. In Python I mask to 32 bits so negatives do not run forever, then restore the sign if the high bit is set.”

## Common mistakes

- Using `+` “just this once” (including `a++` or `sum`).
- Forgetting the left shift on the carry (`a & b` sits in the **same** bit, not the next).
- Python: no 32-bit mask → infinite loop when `b` stays negative.
- Treating the problem as string-digit addition (works, but they want bits).
- Swapping XOR and AND.

## Follow-ups

- **Single Number:** [coding-single-number.md](coding-single-number.md) — XOR cancels pairs; no carry.
- **Number of 1 Bits:** [coding-number-of-1-bits.md](coding-number-of-1-bits.md) — Kernighan `n & (n-1)` still uses `-` on some languages; name it.
- **Subtract without `-`:** add two’s complement (`b` → `~b + 1`, which is this routine plus a not).
- **Multiply / divide without `*` `/`:** shifts + this adder; ask before coding.

## Sources

- [371. Sum of Two Integers — LeetCode](https://leetcode.com/problems/sum-of-two-integers/) — accessed 2026-11-14
- [Sum of Two Integers — NeetCode](https://neetcode.io/solutions/sum-of-two-integers) — accessed 2026-11-14
- [371. Sum of Two Integers — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/371/) — accessed 2026-11-14
- [Adder (electronics) — Wikipedia](https://en.wikipedia.org/wiki/Adder_(electronics)) — accessed 2026-11-14
- [Two's complement — Wikipedia](https://en.wikipedia.org/wiki/Two%27s_complement) — accessed 2026-11-14
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-14
