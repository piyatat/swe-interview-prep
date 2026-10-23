# Regular Expression Matching — answer outline

**Prompt:** Implement full-string match of `s` against pattern `p`. `'.'` matches any **one** letter. `'*'` matches **zero or more** of the **preceding** token. Return whether the **entire** `s` matches. (LeetCode 10)

This is **2D boolean DP** (or memo DFS on two indices), not a parser and not “glob with `*` = anything.” Cousin of [coding-edit-distance.md](coding-edit-distance.md) (grid of prefixes) and [coding-decode-ways.md](coding-decode-ways.md) (look-ahead of one token). NeetCode 150 hard 2D-DP box. Wikipedia [regular expression](https://en.wikipedia.org/wiki/Regular_expression) is the language; say **NFA / DP**, not “I will compile PCRE.”

## Probes

- Match is **anchored** — `"a"` does **not** match `"aa"`.
- `*` binds only the **one** previous token (`a*` or `.*`). Constraints: every `*` has a valid predecessor.
- `*` has **two** exits: consume **zero** of that token (`skip the pair`), or consume **one** `s` char if it fits and **stay on the same** `*`.
- The zero-copy branch is what lets `"c*a*b"` match `"aab"` (`c*` eats nothing).
- `|s|, |p| ≤ 20` — exponential DFS can pass; interviewers still want **memo / O(mn)**.

## Strong answer skeleton — `dp[i][j]`

1. **Clarify:** lowercase + `.` + `*`; full match; `*` never leads the pattern.
2. `dp[i][j]` = whether `s[:i]` matches `p[:j]`.
3. `dp[0][0] = True`. Seed empty-string vs `x*x*…`: `dp[0][j] = p[j-1] == '*' and dp[0][j-2]`.
4. If `p[j-1]` is a letter or `.`:  
   `dp[i][j] = match(s[i-1], p[j-1]) and dp[i-1][j-1]`.
5. If `p[j-1] == '*'`:  
   `dp[i][j] = dp[i][j-2]`  *(zero copies)*  
   `or (match(s[i-1], p[j-2]) and dp[i-1][j])`  *(one more copy)*.
6. Answer `dp[m][n]`. Time / space `O(m n)`.

`match(a, b)` is `b == '.' or a == b`.

DFS+memo on suffixes is the same DAG: if next is `*`, try `dfs(i, j+2)` and maybe `dfs(i+1, j)`.

## Sketch

```
def match(a, b):
  return b == '.' or a == b

m, n = len(s), len(p)
dp = [[False] * (n + 1) for _ in range(m + 1)]
dp[0][0] = True
for j in range(2, n + 1):
  dp[0][j] = p[j-1] == '*' and dp[0][j-2]
for i in range(1, m + 1):
  for j in range(1, n + 1):
    if p[j-1] == '*':
      dp[i][j] = dp[i][j-2]
      if match(s[i-1], p[j-2]):
        dp[i][j] = dp[i][j] or dp[i-1][j]
    elif match(s[i-1], p[j-1]):
      dp[i][j] = dp[i-1][j-1]
return dp[m][n]
```

`"aa", "a"` → **false**. `"aa", "a*"` → **true**. `"ab", ".*"` → **true**. `"aab", "c*a*b"` → **true**.

## Mock narration (30 sec)

> “Full match only. I ask whether the first i of s match the first j of p. A bare token must eat one letter. A star is a pair: I can drop the pair, or if the token fits the last letter I keep the same star and eat one. Empty s is only matched by a run of x* pairs. Same O(mn) grid as edit distance.”

## Common mistakes

- Treating `*` as “match anything” (that is `.*`, or a **wildcard** problem).
- Forgetting the **zero-copy** `dp[i][j-2]` branch.
- Looking at `p[j]` as the star instead of `p[j-1]`, then walking off the pattern.
- Partial match (`search` vs `match`) — leftover `s` or leftover `p` must fail.
- Recursing `*`-counts `0..len(s)` without memo.

## Follow-ups

- **Wildcard Matching (44):** `*` matches any sequence and does **not** bind a previous token — different recurrence; ask.
- **Edit Distance (72):** min edits, not a boolean automaton — [coding-edit-distance.md](coding-edit-distance.md).
- **Decode Ways / letter combinations:** token look-ahead, not regex — [coding-decode-ways.md](coding-decode-ways.md).
- Reconstruct a match: store which branch won per `(i, j)`.

## Sources

- [Regular Expression Matching — NeetCode](https://neetcode.io/solutions/regular-expression-matching) — accessed 2026-10-23
- [10. Regular Expression Matching — LeetCode Wiki](https://leetcode.doocs.org/en/lc/10/) — accessed 2026-10-23
- [Regular Expression Matching — LeetCode 10](https://leetcode.com/problems/regular-expression-matching/) — accessed 2026-10-23
- [Regular expression — Wikipedia](https://en.wikipedia.org/wiki/Regular_expression) — accessed 2026-10-23
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-23
