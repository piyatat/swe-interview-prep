# Pow(x, n) — answer outline

**Prompt:** Implement `myPow(x, n)` = `x^n` for float `x` and integer `n` (possibly negative). (LeetCode 50)

This is **exponentiation by squaring**, not `x` multiplied `n` times. Wikipedia [exponentiation by squaring](https://en.wikipedia.org/wiki/Exponentiation_by_squaring): `x^{2k} = (x^2)^k`, `x^{2k+1} = x · (x^2)^k`. NeetCode 150 math box. Sibling of [coding-counting-bits.md](coding-counting-bits.md) (walk bits of `n`) — here the bits of the **exponent** pick which squares to multiply in.

## Probes

- Naive loop is O(|n|) — `|n|` can be `2^31`, so it TLE.
- Negative `n` → compute the positive power, then **reciprocal**.
- `n = INT_MIN` (`-2^31`): `-n` overflows a 32-bit signed int — work in a wider type / take `abs` carefully.
- `x == 0` and `n > 0` → `0`; `n == 0` → `1` (even for `x == 0` if they allow it — confirm).
- Recursive vs iterative: same O(log |n|) multiplies; iterative is O(1) stack.

## Strong answer skeleton

1. **Clarify:** integer `n` (can be negative); float `x`; overflow of `-n`; what `0^0` should be if it appears.
2. **Reject** `result *= x` in a `|n|`-loop.
3. **Iterative fast pow:** `ans = 1`, `base = x`, `e = abs(n)` as a wide integer. While `e > 0`: if `e` is odd, `ans *= base`; `base *= base`; `e //= 2`.
4. If original `n < 0`, return `1 / ans`, else `ans`.
5. **Complexity:** O(log |n|) multiplies, O(1) extra space (iterative).

## Sketch (iterative)

```
if n == 0: return 1.0
e = abs(n)                         # widen first if n can be INT_MIN
ans, base = 1.0, x
while e:
  if e & 1: ans *= base
  base *= base
  e >>= 1
return ans if n >= 0 else 1.0 / ans
```

`2^10` → `1024`. `2^-2` → `0.25`. Walk `n = 13 = 1101b`: multiply in `x`, `x^4`, `x^8`.

Recursive: `pow(x, n) = pow(x*x, n//2)` extra-multiply `x` when `n` odd; depth O(log |n|).

## Mock narration (30 sec)

> “Multiplying n times dies when n is two billion. I walk the bits of the exponent: square the base each step, and when the current bit is set I multiply that square into the answer. Negative n is the reciprocal of the positive power. Log n multiplies, constant extra space.”

## Common mistakes

- `for _ in range(n)` on a 32-bit exponent.
- `n = -n` when `n == -2^31`.
- Bitwise `e >>= 1` on a language that wraps to 32-bit (JS): use integer divide instead.
- Forgetting the reciprocal for negative `n`.
- Using `**` / `Math.pow` when they asked you to implement it.

## Follow-ups

- **Modulo pow** (`a^n mod m`): same loop, multiply mod `m`; coprime vs not for inverses.
- **Counting Bits / Number of 1 Bits:** bits of the *value*, not the exponent — [coding-counting-bits.md](coding-counting-bits.md).
- **Matrix power / Fibonacci:** same square-and-multiply on 2×2 matrices.

## Sources

- [50. Pow(x, n) — LeetCode](https://leetcode.com/problems/powx-n/) — accessed 2026-11-05
- [Pow(x, n) — NeetCode](https://neetcode.io/solutions/powx-n) — accessed 2026-11-05
- [50. Pow(x, n) — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/50/) — accessed 2026-11-05
- [Exponentiation by squaring — Wikipedia](https://en.wikipedia.org/wiki/Exponentiation_by_squaring) — accessed 2026-11-05
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-05
