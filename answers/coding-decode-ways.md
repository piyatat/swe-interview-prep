# Decode Ways — answer outline

**Prompt:** A message is encoded with `A→1` … `Z→26`. Given a digit string `s`, return how many ways it can be decoded. (LeetCode 91)

This is the usual **count-the-parses** DP. Same family as Climbing Stairs / [coding-house-robber.md](coding-house-robber.md) (last one vs last two), but every transition has a **validity gate**. Listed as a medium sample in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- `'0'` is never a letter. `"06"` → `0`, not “6”.
- Two-digit take is valid only for **`10`–`26`** (not `00`, `27`, `07`).
- You are **counting**, not listing (listing is Decode Ways II / Word Break II).
- Recurrence needs only the last **two** answers → O(1) space.

## Strong answer skeleton

1. **Clarify:** empty → `0` (or `1` if they treat empty as one empty decode — ask). Leading zero → `0`. Digits only.
2. **Search tree:** at index `i`, take 1 digit if `s[i] ≠ '0'`; take 2 if `int(s[i:i+2])` is in `10…26`. Sum the ways.
3. **Why DP:** the same suffix is counted many times → memo / bottom-up.
4. **State:** `dp[i]` = ways to decode `s[i:]` (or prefix `s[:i]` — pick one and stick).
5. **Transitions (suffix form):** `dp[n] = 1`. If `s[i] == '0'` then `dp[i] = 0`. Else `dp[i] = dp[i+1]` plus `dp[i+2]` when the pair is `10–26`.
6. **Complexity:** O(n) time, O(1) extra with two rolling ints.

## Sketch (prefix, rolling)

```
# dp0 = ways through i-2, dp1 = ways through i-1
# walk i = 1 .. n on 1-indexed s
if s[0] == '0': return 0
dp0, dp1 = 1, 1          # empty prefix; first digit already valid
for i in 2 .. n:
  cur = 0
  if s[i-1] != '0': cur += dp1
  two = int(s[i-2:i])
  if 10 <= two <= 26: cur += dp0
  dp0, dp1 = dp1, cur
return dp1
```

`"226"` → 3 (`2|2|6`, `22|6`, `2|26`). `"06"` → 0. `"10"` → 1.

## Mock narration (30 sec)

> “This is Climbing Stairs with gates. At each index I add the one-digit decode if it isn’t zero, and the two-digit decode if the pair is 10–26. Zeros kill a branch instead of counting it. Linear, two variables.”

## Common mistakes

- Treating `'0'` as `A` or allowing `"07"` as a pair.
- `dp[0] = 0` vs `1` off-by-one on the empty prefix.
- Recursing without memo → exponential on long all-`1`/`2` strings.
- Returning the **list** of decodings when they asked for a **count**.

## Follow-ups

- **Decode Ways II (639)** — `*` wildcards; same recurrence, more cases.
- **Word Break (139)** — [coding-word-break.md](coding-word-break.md); dictionary instead of `1–26`.
- **Climbing Stairs (70)** — drop the digit gates.

## Sources

- [Decode Ways: DP walkthrough — Whiteboard Ready](https://www.whiteboardready.com/post/decode-ways-dp-walkthrough) — accessed 2026-09-02
- [Decode Ways solution — NeetCode](https://neetcode.io/solutions/decode-ways) — accessed 2026-09-02
- [Decode Ways pattern (2026) — ShadeCoder](https://articles.shadecoder.com/decode-ways-leetcode-solution-pattern-explained-2026) — accessed 2026-09-02
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-09-02
- Classic LeetCode #91 — count valid 1-/2-digit encodings
