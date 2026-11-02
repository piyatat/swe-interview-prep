# Reverse Bits — answer outline

**Prompt:** Given a **32-bit unsigned** integer `n`, reverse its bits and return the new integer. (LeetCode 190)

This is **fixed-width bit reverse**, not string reverse and not [coding-number-of-1-bits.md](coding-number-of-1-bits.md) (count, do not move). NeetCode 150 bit-manipulation box. Wikipedia [bitwise operation](https://en.wikipedia.org/wiki/Bitwise_operation): extract with `>>` / `& 1`, place with `<<` / `|`.

## Probes

- Width is **exactly 32**, including leading zeros. `1` becomes `1 << 31`, not `1`.
- Signed `>>` on a high `1` can sign-fill. Prefer unsigned / `>>>` / mask `0xFFFFFFFF`.
- Interview “O(1) time” means 32 is constant. A 32-loop is the expected first sketch.
- Optional: SWAR / divide-and-conquer swaps (16, 8, 4, 2, 1) — follow-up, not the opener.

## Strong answer skeleton

1. **Clarify:** 32-bit; reverse **bits**, not decimal digits ([Reverse Integer](https://leetcode.com/problems/reverse-integer/) is different); leading zeros count.
2. **32-loop:** `res = 0`; for `i` in `0..31`: take bit `i` of `n`, write it at position `31 - i`.
3. **Extract / place:** `bit = (n >> i) & 1`; `res |= bit << (31 - i)` (or `res += …` if they fear `|`).
4. **Do not** build a Python string of bits unless you immediately say it is the same 32-step idea.
5. **Complexity:** O(32) = O(1) time, O(1) space.

## Sketch (place at 31 − i)

```
res = 0
for i in 0..31:
  bit = (n >> i) & 1
  res |= bit << (31 - i)
return res
```

`n = 21` (`…00010101`) → `2818572288` (`10101000…0`). Walk bit 0 → bit 31 on the pad.

Shift-in form: 32 times `{ res = (res << 1) | (n & 1); n >>= 1 }` — same answers if `n` is treated unsigned.

## Mock narration (30 sec)

> “I’ll walk 32 positions. Bit i of n belongs at 31 minus i. I mask it off and OR it into the result. Fixed width so leading zeros move to the low end. I’ll use an unsigned shift so a high one does not sign-fill.”

## Common mistakes

- Stopping when `n` becomes 0 (drops leading zeros → wrong magnitude).
- Arithmetic `>>` in Java/JS when the high bit is set.
- Reversing 8 bits of a “small” number, or reversing decimal digits.
- Off-by-one: writing to `32 - i` or looping `0..30`.
- Quoting O(n) as if the input were a variable-length bitstring.

## Follow-ups

- **Number of 1 Bits (191):** count, do not reverse — [coding-number-of-1-bits.md](coding-number-of-1-bits.md).
- **Single Number (136):** XOR fold, different trick — [coding-single-number.md](coding-single-number.md).
- **Reverse Integer (7):** base-10 + overflow, not bits.
- **SWAR reverse:** swap halves, then bytes, nibbles, pairs, bits (masks `0xFFFF`, `0xFF00FF00`, …).

## Sources

- [Reverse Bits — NeetCode](https://neetcode.io/solutions/reverse-bits) — accessed 2026-11-02
- [190. Reverse Bits — LeetCode](https://leetcode.com/problems/reverse-bits/) — accessed 2026-11-02
- [Bitwise operation — Wikipedia](https://en.wikipedia.org/wiki/Bitwise_operation) — accessed 2026-11-02
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-02
