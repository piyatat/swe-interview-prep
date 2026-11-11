# Multiply Strings — answer outline

**Prompt:** Two non-negative integers given as **strings** `num1`, `num2` (no leading zeros unless the number is `0`). Return their product as a string. Do **not** use a bigint library or parse the inputs as machine integers. (LeetCode 43)

This is **grade-school multiplication on digit arrays**, not `int(num1) * int(num2)` (length up to 200). Wikipedia [multiplication algorithm](https://en.wikipedia.org/wiki/Multiplication_algorithm): the product of digit `i` and digit `j` lands at a fixed place; carry can wait. NeetCode 150 math box. Sibling of [coding-plus-one.md](coding-plus-one.md) (carry on +1) and [coding-add-two-numbers.md](coding-add-two-numbers.md) (digit add, not multiply).

## Probes

- `"0"` times anything → `"0"` (do not return `"000…"`).
- Product length is `m + n` or `m + n − 1`. Scratch array of size `m + n` is enough.
- Digit `num1[i]` × `num2[j]` accumulates at index `i + j + 1` (strings are MSD-first).
- Carry can be deferred: add all products, then walk right-to-left `// 10`.
- Do not `eval` / `BigInt` / `int()` — they forbade it and 200-digit strings overflow.

## Strong answer skeleton

1. **Clarify:** digits only; no leading zeros except `0`; output has no leading zeros.
2. If either is `"0"`, return `"0"`.
3. `arr = [0] * (m + n)`. For `i` from `m-1` down, `j` from `n-1` down: `arr[i + j + 1] += a * b`.
4. From the right: `arr[i-1] += arr[i] // 10`; `arr[i] %= 10`.
5. Skip a leading `0` if `arr[0] == 0`; join digits.
6. **Complexity:** O(mn) time, O(m + n) extra.

## Sketch (place-value array)

```
if num1 == "0" or num2 == "0": return "0"
m, n = len(num1), len(num2)
arr = [0] * (m + n)
for i in range(m - 1, -1, -1):
  a = ord(num1[i]) - 48
  for j in range(n - 1, -1, -1):
    arr[i + j + 1] += a * (ord(num2[j]) - 48)
for i in range(m + n - 1, 0, -1):
  arr[i - 1] += arr[i] // 10
  arr[i] %= 10
k = 0 if arr[0] else 1
return "".join(str(d) for d in arr[k:])
```

`"123" × "456"` → `"56088"`. Index `i+j+1` is the ones place of that digit pair; carry ripples on the second pass.

## Mock narration (30 sec)

> “I cannot parse 200-digit strings as ints, so this is schoolbook multiply. Each digit pair writes into a fixed slot of an m+n array; I add everything first, then carry. Strip a leading zero and return the digit string.”

## Common mistakes

- `int(num1) * int(num2)` (overflow + forbidden).
- Off-by-one place index (`i+j` vs `i+j+1`) → shifted product.
- Leaving leading zeros (`"00"` instead of `"0"`).
- Carrying inside the inner loop incorrectly and double-counting.
- Multiplying MSD-first without reversing the place mapping.

## Follow-ups

- **Plus One / Add Two Numbers:** [coding-plus-one.md](coding-plus-one.md), [coding-add-two-numbers.md](coding-add-two-numbers.md) — add, not multiply.
- **Karatsuba / FFT multiply:** faster than O(mn) for huge n; interview default is grade-school.
- **Divide strings / add strings:** same digit arrays, different op.

## Sources

- [43. Multiply Strings — LeetCode](https://leetcode.com/problems/multiply-strings/) — accessed 2026-11-11
- [Multiply Strings — NeetCode](https://neetcode.io/solutions/multiply-strings) — accessed 2026-11-11
- [43. Multiply Strings — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/43/) — accessed 2026-11-11
- [Multiplication algorithm — Wikipedia](https://en.wikipedia.org/wiki/Multiplication_algorithm) — accessed 2026-11-11
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-11
