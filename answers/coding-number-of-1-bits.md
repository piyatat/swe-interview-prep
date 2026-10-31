# Number of 1 Bits — answer outline

**Prompt:** Given a non-negative 32-bit integer `n`, return how many `1` bits it has (Hamming weight / popcount). (LeetCode 191)

This is **one-word popcount**, the sibling of [coding-counting-bits.md](coding-counting-bits.md) (fill `0 … n`). NeetCode 150 bit-manipulation box. Wikipedia [Hamming weight](https://en.wikipedia.org/wiki/Hamming_weight): count of non-zero bits.

## Probes

- Scan 32 positions: `(n & (1 << i)) != 0` — O(32) / O(1). Fine; say the word width.
- Shift: `res += n & 1; n >>= 1` until `n == 0`. Same bound; fewer iterations if high bits are 0.
- **Kernighan:** `n &= n - 1` clears the **lowest set bit**; loop count equals the popcount — O(k) for k ones.
- Built-ins (`bit_count`, `__builtin_popcount`) are OK **after** you can derive Kernighan.

## Strong answer skeleton

1. **Clarify:** unsigned / non-negative; 32-bit; return a count, not the bits.
2. **Name the 32-loop first**, then improve to Kernighan so they see both.
3. **Kernighan:** `c = 0; while n: n &= n - 1; c += 1`. Why: `n - 1` flips the lowest `1` and the zeros below it; AND drops that `1`.
4. **Complexity:** O(k) ≤ O(32) time, O(1) space. Interview “O(1)” means word size is constant.
5. **Signed languages:** arithmetic `>>` on a negative can infinite-loop. Use unsigned, `>>>`, or the 32-mask loop — LeetCode 191 is non-negative, but mention it.

## Sketch (Kernighan)

```
c = 0
while n:
  n &= n - 1
  c += 1
return c
```

`n = 23` (`10111`) → four clears → `4`. `n = 8` (`1000`) → one iteration.

Mask form: `for i in 0..31: c += (n >> i) & 1`. Same answers, always 32 steps.

## Mock narration (30 sec)

> “Hamming weight. I’ll clear the lowest set bit with n & (n-1) and count loops. That’s one iteration per 1, not per bit. I’ll mention the 32-mask scan if they want a fixed bound, and that I’d use hardware popcnt in production.”

## Common mistakes

- `n >> 1` on a signed negative (arithmetic shift) → infinite ones.
- `n % 2` / `n // 2` instead of `& 1` / `>>` after claiming bit ops.
- Returning early on the first `1`, or counting **zero** bits.
- Using `bin(n).count('1')` with no algorithm when they asked “how.”
- Confusing with [coding-counting-bits.md](coding-counting-bits.md) (array of all prefixes).

## Follow-ups

- **Counting Bits (338):** DP `ans[i] = ans[i >> 1] + (i & 1)` — [coding-counting-bits.md](coding-counting-bits.md).
- **Reverse Bits (190):** rotate, not count.
- **Hamming distance (461):** popcount of `x ^ y`.
- **Missing / Single Number:** xor fold, different trick.

## Sources

- [Number of 1 Bits — NeetCode](https://neetcode.io/solutions/number-of-1-bits) — accessed 2026-10-31
- [191. Number of 1 Bits — LeetCode](https://leetcode.com/problems/number-of-1-bits/) — accessed 2026-10-31
- [Hamming weight — Wikipedia](https://en.wikipedia.org/wiki/Hamming_weight) — accessed 2026-10-31
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-31
