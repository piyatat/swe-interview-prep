# Reverse Integer — answer outline

**Prompt:** Signed 32-bit integer `x`. Reverse its **decimal digits**. If the reverse would fall outside `[-2^31, 2^31 - 1]`, return `0`. Do the work **without** using a 64-bit / bigint type if they constrain you to 32-bit registers. (LeetCode 7)

This is **digit pop + overflow-before-write**, not string reverse. Sibling of [coding-plus-one.md](coding-plus-one.md) (carry the other way) and [coding-reverse-bits.md](coding-reverse-bits.md) (base 2, not 10). NeetCode 150 math / bit box. Wikipedia [integer overflow](https://en.wikipedia.org/wiki/Integer_overflow): the multiply-by-10 must be proven safe **before** it happens.

## Probes

- `123` → `321`. `-123` → `-321`. `120` → `21` (leading zeros vanish).
- Range is **asymmetric**: `MIN = -2147483648`, `MAX = 2147483647`. Checking only `MAX` misses `MIN`.
- Language trap: Python `(-123) % 10 == 7` (positive remainder). Need toward-zero last digit (`math.fmod` / language `%` that keeps the sign).
- Interviewers reject `str(x)[::-1]` if the prompt bans 64-bit intermediates — name it, then do arithmetic.

## Strong answer skeleton

1. **Clarify:** 32-bit two’s-complement bounds; overflow → `0`; sign stays with the number, not a separate flag you forget to restore.
2. **Loop:** while `x != 0`: `digit = last decimal digit` (sign-preserving); `x` shrinks toward zero by `/ 10`.
3. **Before** `res = res * 10 + digit`, refuse if the next write would overflow:
   - `res > MAX/10`, or `res == MAX/10` and `digit > 7` (`MAX % 10`).
   - `res < MIN/10`, or `res == MIN/10` and `digit < -8` (`MIN % 10`).
4. Then `res = res * 10 + digit`.
5. **Complexity:** O(1) time and space (≤ 10 digits). Do not claim O(n) on the decimal length unless they want that wording.

## Sketch (check, then multiply)

```
MIN, MAX = -2**31, 2**31 - 1
res = 0
while x != 0:
  digit = toward_zero_mod_10(x)   # not Python % on negatives
  x = toward_zero_div_10(x)
  if res > MAX//10 or (res == MAX//10 and digit > 7): return 0
  if res < MIN//10 or (res == MIN//10 and digit < -8): return 0
  res = res * 10 + digit
return res
```

`1534236469` overflows on the last digit → `0`. Checking **after** `res * 10` is already too late in a 32-bit `int`.

## Mock narration (30 sec)

> “I peel digits with mod 10 and build `res`. The trap is 32-bit overflow, and the range is not symmetric, so I compare `res` to `MAX/10` and `MIN/10` *before* multiplying. Python’s `%` on negatives is the other trap — I take a toward-zero remainder.”

## Common mistakes

- Reversing as a string / `long` then clamping — fails the “stay in 32-bit” follow-up.
- Checking overflow **after** `res * 10 + digit`.
- Assuming `|MIN| == MAX` (it does not: `2147483648` vs `2147483647`).
- Python `%` / `//` on negatives (floor vs truncate).
- Treating this as [coding-reverse-bits.md](coding-reverse-bits.md).

## Follow-ups

- **Reverse Bits (190):** [coding-reverse-bits.md](coding-reverse-bits.md) — 32 steps, place at `31 - i`.
- **Plus One (66):** [coding-plus-one.md](coding-plus-one.md) — digit array, carry, no 32-bit cap.
- **String to integer (atoi):** same overflow-before-multiply check while parsing.

## Sources

- [7. Reverse Integer — LeetCode](https://leetcode.com/problems/reverse-integer/) — accessed 2026-11-12
- [Reverse Integer — NeetCode](https://neetcode.io/solutions/reverse-integer) — accessed 2026-11-12
- [7. Reverse Integer — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/7/) — accessed 2026-11-12
- [Integer overflow — Wikipedia](https://en.wikipedia.org/wiki/Integer_overflow) — accessed 2026-11-12
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-12
