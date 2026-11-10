# Plus One — answer outline

**Prompt:** Array `digits` is a non-negative integer, **most-significant digit first**, no leading zeros. Increment the integer by one and return the digit array. (LeetCode 66)

This is **schoolbook carry**, not converting the array to an `int` (length up to 100 → overflow). Wikipedia [Carry (arithmetic)](https://en.wikipedia.org/wiki/Carry_(arithmetic)): transfer from a column that overflowed 9. Same carry walk as [coding-add-two-numbers.md](coding-add-two-numbers.md), but **one** addend is the implicit `+1` and digits are MSD-first. NeetCode 150 math box.

## Probes

- `[1,2,3]` → `[1,2,4]`. `[9]` → `[1,0]`. `[9,9,9]` → `[1,0,0,0]` — **new leading 1**, do not return `[0,0,0]`.
- Walk from the **right**. First non-9: increment and return. A 9 becomes 0 and carry continues.
- Mutating in place is fine unless they forbid it. All-nines is the only length change.
- Do not `int("".join(...))+1` — they will reject it on overflow and on intent.

## Strong answer skeleton

1. **Clarify:** MSD-first; digits `0–9`; no leading zero except the number 0 (here at least one digit).
2. **Reject** parsing as a machine integer.
3. From `i = n-1` down to `0`: if `digits[i] < 9`, increment, return `digits`; else set `0` and continue.
4. If the loop finishes, every digit was 9: return `[1] + digits` (or allocate `n+1` zeros with `result[0] = 1`).
5. **Complexity:** O(n) time. Extra space O(1) if they allow mutating and you only allocate on the all-nines path; O(n) if you always copy.

## Sketch (right-to-left)

```
for i in range(len(digits) - 1, -1, -1):
  if digits[i] < 9:
    digits[i] += 1
    return digits
  digits[i] = 0
return [1] + digits
```

`[1,2,9]` → `[1,3,0]`. `[9,9]` → `[1,0,0]`. Early return means you do not touch digits left of the first non-9.

## Mock narration (30 sec)

> “This is plus-one with carry, not a bigint parse. I walk from the least significant digit: if it is under 9 I increment and stop; if it is 9 I write 0 and keep going. If the whole array was nines I allocate one extra digit and put a 1 in front.”

## Common mistakes

- Starting at index 0 (carry runs the wrong way).
- Returning `[0,0,0]` for `[9,9,9]`.
- Using language `int` / `Number` (64-bit cannot hold 100 digits).
- Building a new array on every step instead of mutating until the all-nines case.
- Confusing with **Add Two Numbers** (LSD-first linked lists) and reversing first without saying why.

## Follow-ups

- **Add Two Numbers:** [coding-add-two-numbers.md](coding-add-two-numbers.md) — two numbers, LSD-first nodes, leftover carry node.
- **Plus One on a linked list / Add Two Numbers II:** MSD-first → reverse or stack, then the same carry.
- **Arbitrary-precision add:** same loop with a carry that can be >1 if the addend is not 1.

## Sources

- [66. Plus One — LeetCode](https://leetcode.com/problems/plus-one/) — accessed 2026-11-10
- [Plus One — NeetCode](https://neetcode.io/solutions/plus-one) — accessed 2026-11-10
- [66. Plus One — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/66/) — accessed 2026-11-10
- [Carry (arithmetic) — Wikipedia](https://en.wikipedia.org/wiki/Carry_(arithmetic)) — accessed 2026-11-10
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-10
