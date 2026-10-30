# Counting Bits — answer outline

**Prompt:** Given `n`, return `ans` of length `n+1` where `ans[i]` is the number of `1` bits in `i` (Hamming weight / popcount) for every `i` in `0 … n`. (LeetCode 338)

This is **DP on bits**, not “loop 32 flags for each i.” Sibling of Number of 1 Bits (single integer) and of [coding-climbing-stairs.md](coding-climbing-stairs.md) (linear DP from a cheaper subproblem). NeetCode 150 bit-manipulation box.

## Probes

- Naive: for each `i`, `while x: x &= x-1; count++` (Kernighan) → O(n log n) / O(n · set-bits).
- Linear: reuse `ans` you already filled. Two equivalent recurrences:
  - `ans[i] = ans[i >> 1] + (i & 1)` — drop LSB after counting it.
  - `ans[i] = ans[i & (i-1)] + 1` for `i > 0` — clear lowest set bit.
- `ans[0] = 0`. Powers of two reset the high bit: `ans[8] = 1`, `ans[9] = 2`.

## Strong answer skeleton

1. **Clarify:** include `0` and `n`; they want the **array**, not a single popcount; `n` up to ~10^5 in follow-ups (LeetCode 338 is smaller).
2. **Name O(n log n) first** so they see you can popcount one word, then improve.
3. **DP:** allocate `ans[n+1]`; `ans[0] = 0`; for `i = 1 .. n` set `ans[i] = ans[i >> 1] + (i & 1)`.
4. **Why it works:** `i >> 1` is `⌊i/2⌋`, already solved; the bit you dropped is exactly `i & 1`.
5. **Complexity:** O(n) time, O(n) output space (required). No extra tables.

## Sketch (right-shift DP)

```
ans = [0] * (n + 1)
for i in 1 .. n:
  ans[i] = ans[i >> 1] + (i & 1)
return ans
```

`n = 5` → `[0,1,1,2,1,2]` because `0,1,10,11,100,101`.

Lowest-set-bit form: `ans[i] = ans[i & (i-1)] + 1` (each `i` has one more `1` than `i` with that bit cleared). Same O(n).

Offset form (NeetCode): keep `high = 1` (largest power of two `≤ i`); when `i == high * 2`, `high = i`; `ans[i] = 1 + ans[i - high]`. Same numbers, more state.

## Mock narration (30 sec)

> “I’ll fill popcounts in order. Half of i is already done; I add the bit I shifted off. That is one pass, no 32-iteration inner loop. I’ll mention Kernighan if they only need one integer.”

## Common mistakes

- Inner loop over 32 bits after claiming O(n).
- `ans[i] = ans[i // 2] + 1` — wrong for even `i` (`4` is `100`, weight 1, not `ans[2]+1`).
- Returning `ans[n]` instead of the array.
- Using language `bit_count()` / `__builtin_popcount` without being able to derive O(n).
- Off-by-one length `n` instead of `n+1`.

## Follow-ups

- **Number of 1 Bits (191):** one word; Kernighan or hardware `popcnt`.
- **Hamming distance (461):** popcount of `x ^ y`.
- **Missing Number / Single Number:** xor fold, different trick.
- **Wikipedia Hamming weight:** SWAR / table / `x &= x-1` history if they go hardware.

## Sources

- [Counting Bits — NeetCode](https://neetcode.io/solutions/counting-bits) — accessed 2026-10-30
- [338. Counting Bits — LeetCode](https://leetcode.com/problems/counting-bits/) — accessed 2026-10-30
- [Hamming weight — Wikipedia](https://en.wikipedia.org/wiki/Hamming_weight) — accessed 2026-10-30
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-30
