# Distinct Subsequences — answer outline

**Prompt:** Given strings `s` and `t`, return how many **distinct subsequences** of `s` equal `t`. Order is preserved; you may drop characters of `s`. The answer fits in a 32-bit signed int. (LeetCode 115)

This is **2D counting DP** (take / skip), not LCS and not “generate all subsequences.” Cousin of [coding-interleaving-string.md](coding-interleaving-string.md) (same grid, boolean vs count) and [coding-longest-common-subsequence.md](coding-longest-common-subsequence.md) (length vs ways). NeetCode 150 hard 2D-DP box.

## Probes

- Subsequence ≠ substring — gaps are allowed; order is not.
- Naive take/skip recursion is `2^|s|`. `|s|, |t| ≤ 1000` → must DP.
- Empty `t` has **exactly one** subsequence (delete everything). Empty `s` and non-empty `t` → `0`.
- If `|t| > |s|` you can return `0` immediately.
- They often ask the **O(|t|)** rolling row (walk `t` **right → left** so you do not reuse a just-updated cell).

## Strong answer skeleton

1. **Clarify:** case-sensitive English letters; count **ways**, not the strings themselves; 32-bit fit.
2. `dp[i][j]` = ways for `s[:i]` to form `t[:j]`.
3. Base: `dp[i][0] = 1` for all `i`. `dp[0][j] = 0` for `j > 0`.
4. Recurrence: always **skip** `s[i-1]` → `dp[i-1][j]`. If `s[i-1] == t[j-1]`, also **take** → add `dp[i-1][j-1]`.
5. Answer `dp[m][n]`. Time `O(m n)`, space `O(m n)` or `O(n)`.

## Sketch

```
m, n = len(s), len(t)
if n > m: return 0
dp = [[0] * (n + 1) for _ in range(m + 1)]
for i in range(m + 1):
  dp[i][0] = 1
for i in range(1, m + 1):
  for j in range(1, n + 1):
    dp[i][j] = dp[i-1][j]
    if s[i-1] == t[j-1]:
      dp[i][j] += dp[i-1][j-1]
return dp[m][n]
```

`"rabbbit", "rabbit"` → **3**. `"babgbag", "bag"` → **5**. `"caaat", "cat"` → **3**.

1-D: `f = [1] + [0]*n`; for each `a` in `s`, for `j` from `n` down to `1`, if `a == t[j-1]`: `f[j] += f[j-1]`.

## Mock narration (30 sec)

> “I count ways, not list them. dp[i][j] is how many ways the first i of s make the first j of t. Empty t is one way. I always skip the current s character; if it matches t I also take it. Same table as interleaving, plus instead of or. Right-to-left one row if they want linear space.”

## Common mistakes

- Treating it as LCS length (`== |t|` is necessary, not sufficient for the **count**).
- Updating a 1-D row **left → right** and double-counting the same `s` character.
- Forgetting `dp[*][0] = 1` (or setting `dp[0][0] = 0`).
- Recursing take/skip without memo at `n = 1000`.
- Using `int` in C++ / Java without a wider type on the way — LC says the **answer** fits 32-bit; intermediates can be discussed.

## Follow-ups

- **O(n) space:** one row, `j` descending.
- **Interleaving String (97):** boolean merge of two sources — [coding-interleaving-string.md](coding-interleaving-string.md).
- **Edit Distance (72):** min operations, not ways — [coding-edit-distance.md](coding-edit-distance.md).
- **Wildcard / regex match:** different star semantics — [coding-regex-matching.md](coding-regex-matching.md).

## Sources

- [Distinct Subsequences — NeetCode](https://neetcode.io/solutions/distinct-subsequences) — accessed 2026-10-23
- [115. Distinct Subsequences — LeetCode Wiki](https://leetcode.doocs.org/en/lc/115/) — accessed 2026-10-23
- [Distinct Subsequences — LeetCode 115](https://leetcode.com/problems/distinct-subsequences/) — accessed 2026-10-23
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-23
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-23
