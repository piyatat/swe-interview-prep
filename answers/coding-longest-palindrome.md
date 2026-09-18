# Longest palindromic substring — answer outline

**Prompt:** String `s`. Return **any** longest palindromic **substring** (contiguous). Length at least 1. (LeetCode 5)

This is **expand around centers**, not LCS. Different from [coding-longest-common-subsequence.md](coding-longest-common-subsequence.md) (order, not contiguous, two strings) and from “valid palindrome” (two pointers on the **whole** string).

## Probes

- Substring ≠ subsequence. `"aba"` in `"abxa"` is **not** a substring palindrome of length 3.
- Odd centers (`i`) **and** even centers (`i`, `i+1`). Skipping even fails on `"abbc"`.
- They asked for the **string**, not only the length (647 is the count cousin).
- `n ≤ 1000` on the classic statement → O(n²) is the intended bar; Manacher is extra credit.

## Strong answer skeleton

1. **Clarify:** any longest if ties; case-sensitive; digits allowed; empty? (LC: `n ≥ 1`).
2. **Brute:** every `i..j` + palindrome check → O(n³).
3. **Centers:** each index (odd) and each gap (even) is a center. Expand while `L ≥ 0`, `R < n`, `s[L] == s[R]`. Track best `(start, length)`.
4. **DP alternative:** `dp[i][j]` true if `s[i] == s[j]` and (length ≤ 2 or `dp[i+1][j-1]`). Same O(n²) time, O(n²) space — mention, prefer expand for O(1) extra.
5. **Complexity:** O(n²) time, O(1) extra (expand). Manacher O(n) if they push.

## Sketch (expand)

```
best_i, best_len = 0, 1

def expand(L, R):
  while L >= 0 and R < n and s[L] == s[R]:
    L -= 1; R += 1
  # now (L+1)..(R-1) is the palindrome
  return L+1, R-L-1

for i in 0..n-1:
  for start, length in (expand(i, i), expand(i, i+1)):
    if length > best_len:
      best_i, best_len = start, length
return s[best_i : best_i+best_len]
```

`"ababd"` → `"bab"` or `"aba"`. `"abbc"` → `"bb"`. `"a"` → `"a"`.

## Mock narration (30 sec)

> “Every palindrome has a center. I expand from each character and from each pair of neighbors, keep the longest slice. That is n centers times n expand steps. I will not use LCS — that solves a different problem.”

## Common mistakes

- Only odd centers (`"cbbd"` → miss `"bb"`).
- Off-by-one after the while loop (the last successful pair is `L+1..R-1`).
- Returning length when they asked for the substring.
- Treating it as subsequence or as “whole string is / is not a palindrome.”
- Claiming O(n) without Manacher (or a proven linear method).

## Follow-ups

- **Palindromic Substrings (647):** same expand; increment a counter per successful step.
- **Longest palindromic subsequence:** LCS of `s` and `reverse(s)` — [coding-longest-common-subsequence.md](coding-longest-common-subsequence.md).
- **Valid Palindrome II:** at most one delete; two pointers + one skip.
- **Manacher:** linear; sketch the idea, do not implement cold unless they ask.

## Sources

- [Longest Palindromic Substring — NeetCode](https://neetcode.io/solutions/longest-palindromic-substring) — accessed 2026-09-18
- [Longest Palindromic Substring — LeetCode 5](https://leetcode.com/problems/longest-palindromic-substring/) — accessed 2026-09-18
- [Longest palindromic substring — Wikipedia](https://en.wikipedia.org/wiki/Longest_palindromic_substring) — accessed 2026-09-18
- [Manacher's algorithm — Wikipedia](https://en.wikipedia.org/wiki/Longest_palindromic_substring#Manacher's_algorithm) — accessed 2026-09-18
- Classic LeetCode #5 / #647 — expand-around-center
