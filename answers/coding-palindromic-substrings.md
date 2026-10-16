# Palindromic Substrings — answer outline

**Prompt:** String `s`. Return the **count** of palindromic **substrings**. Single letters count. Overlapping counts separately (`"aaa"` → 6). (LeetCode 647)

This is the **count** sibling of [coding-longest-palindrome.md](coding-longest-palindrome.md) (same expand, keep a counter instead of a best slice). Not LCS and not “whole string is a palindrome.” NeetCode 150. Wikipedia [Palindrome](https://en.wikipedia.org/wiki/Palindrome).

## Probes

- Substring ≠ subsequence. Count **contiguous** palindromes.
- Odd **and** even centers. Skipping even misses `"aa"` in `"aaa"`’s pairs (you still get odds, so the number is silently short).
- They asked for the **count**, not the longest slice (that is 5) and not the list of strings.
- `n ≤ 1000` → O(n²) expand is the intended bar; Manacher is extra credit.

## Strong answer skeleton — expand and increment

1. **Clarify:** case-sensitive; digits? (LC: lowercase); `n ≥ 1` so answer ≥ n.
2. **Brute:** every `i..j` + two-pointer check → O(n³). DP table `dp[i][j]` is O(n²) time and space.
3. **Centers:** for each `i`, expand `(i, i)` and `(i, i+1)`. Every successful `s[L] == s[R]` step is **one** palindrome → `ans += 1`, then `L -= 1`, `R += 1`.
4. There are `2n-1` centers; each expands at most O(n). Track nothing but `ans`.
5. **Complexity:** O(n²) time, O(1) extra. Manacher O(n) if they push — `ans += p[i] // 2` on the padded string; do not implement cold unless asked.

DP alt: `dp[i][j] = (s[i] == s[j]) and (j-i < 2 or dp[i+1][j-1])`; add 1 when true. Same time, worse space — mention, prefer expand.

## Sketch (expand)

```
def countSubstrings(s):
  n, ans = len(s), 0
  def expand(L, R):
    nonlocal ans
    while L >= 0 and R < n and s[L] == s[R]:
      ans += 1
      L -= 1; R += 1
  for i in range(n):
    expand(i, i)
    expand(i, i + 1)
  return ans
```

`"abc"` → 3 (`a`,`b`,`c`). `"aaa"` → 6 (three singles, two `"aa"`, one `"aaa"`). `"a"` → 1.

## Mock narration (30 sec)

> “Every palindrome has a center. I expand from each character and each gap, and I add one for every successful step. That counts singles, pairs, and longer spans without building a DP table. I am counting substrings, not returning the longest one.”

## Common mistakes

- Only odd centers (`"aa"` → 2 instead of 3).
- Incrementing once per center instead of once per successful expand step.
- Returning the longest slice (problem 5) or a list of strings.
- Counting subsequences or unique strings (`"aaa"` is 6, not 3).
- Claiming O(n) without Manacher.

## Follow-ups

- **Longest palindromic substring (5):** same expand, keep best `(start, len)` — [coding-longest-palindrome.md](coding-longest-palindrome.md).
- **Palindrome Partitioning (131):** all cut sets — [coding-palindrome-partitioning.md](coding-palindrome-partitioning.md).
- **Longest palindromic subsequence:** LCS of `s` and `reverse(s)` — [coding-longest-common-subsequence.md](coding-longest-common-subsequence.md).
- **Manacher:** linear arm lengths; `⌊p[i]/2⌋` palindromes per padded center.

## Sources

- [Palindromic Substrings — NeetCode](https://neetcode.io/solutions/palindromic-substrings) — accessed 2026-10-16
- [647. Palindromic Substrings — LeetCode Wiki](https://leetcode.doocs.org/en/lc/647/) — accessed 2026-10-16
- [Palindromic Substrings — LeetCode 647](https://leetcode.com/problems/palindromic-substrings/) — accessed 2026-10-16
- [Palindrome — Wikipedia](https://en.wikipedia.org/wiki/Palindrome) — accessed 2026-10-16
