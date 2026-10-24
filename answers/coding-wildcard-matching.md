# Wildcard Matching — answer outline

**Prompt:** Full-string match of `s` against pattern `p`. `'?'` matches any **one** letter. `'*'` matches **any sequence** (including empty). Return whether the **entire** `s` matches. (LeetCode 44)

This is **not** [coding-regex-matching.md](coding-regex-matching.md). Regex `*` binds the **previous token** (`a*`, `.*`). Here `*` is a **standalone glob** and does not need a predecessor. Wikipedia [wildcard character](https://en.wikipedia.org/wiki/Wildcard_character) is the language; say **glob / DP or last-star greedy**, not “I will compile PCRE.”

## Probes

- Match is **anchored** — `"a"` does **not** match `"aa"`.
- `*` eats **0..rest of s**. Consecutive `*`s collapse; trailing `*`s can pad an exhausted `s`.
- `'?'` is exactly one character (cannot be empty).
- `|s|, |p| ≤ 2000` — exponential DFS without memo fails; interviewers want **O(mn) DP** or the **O(1)-space greedy**.

## Strong answer skeleton — `dp[i][j]`

1. **Clarify:** lowercase + `?` + `*`; full match; `*` is glob, not regex.
2. `dp[i][j]` = whether `s[:i]` matches `p[:j]`.
3. `dp[0][0] = True`. Seed empty-string vs leading stars: `dp[0][j] = p[j-1] == '*' and dp[0][j-1]`.
4. If `p[j-1]` is a letter or `?`:  
   `dp[i][j] = match(s[i-1], p[j-1]) and dp[i-1][j-1]`.
5. If `p[j-1] == '*'`:  
   `dp[i][j] = dp[i][j-1]`  *(eat nothing)*  
   `or dp[i-1][j]`  *(eat `s[i-1]`)*.
6. Answer `dp[m][n]`. Time / space `O(m n)` (roll the row if asked).

`match(a, b)` is `b == '?' or a == b`.

## Greedy (last star)

Walk `s` and `p`. On a forced match (`letter` / `?`) advance both. On `*` save `(star_j, star_i)` and try **empty**. On mismatch, if a star exists, give it **one more** char and resume just after that star. Only the **latest** star needs a checkpoint. After `s` is done, leftover `p` must be all `*`. Worst case still `O(mn)`, space `O(1)`.

## Sketch (DP)

```
m, n = len(s), len(p)
dp = [[False] * (n + 1) for _ in range(m + 1)]
dp[0][0] = True
for j in range(1, n + 1):
  dp[0][j] = p[j-1] == '*' and dp[0][j-1]
for i in range(1, m + 1):
  for j in range(1, n + 1):
    if p[j-1] == '*':
      dp[i][j] = dp[i][j-1] or dp[i-1][j]
    elif p[j-1] == '?' or p[j-1] == s[i-1]:
      dp[i][j] = dp[i-1][j-1]
return dp[m][n]
```

`"aa", "a"` → **false**. `"aa", "*"` → **true**. `"cb", "?a"` → **false**. `"adceb", "*a*b"` → **true**.

## Mock narration (30 sec)

> “Full match only. This star is a glob, not regex. I ask whether the first i of s match the first j of p. A letter or question mark eats one. A star is either unused or it swallows one more letter and stays. Empty s is only matched by a run of stars. Same O(mn) grid as regex, different recurrence.”

## Common mistakes

- Using the **regex** star recurrence (`dp[i][j-2]` / bind previous).
- Forgetting empty-`s` seeding on a prefix of `*`.
- Treating leftover `?` as optional after `s` ends.
- Recursing star-counts `0..len(s)` without memo.

## Follow-ups

- **Regular Expression Matching (10):** `*` binds the previous token — [coding-regex-matching.md](coding-regex-matching.md).
- **Edit Distance (72):** min edits, not a boolean automaton — [coding-edit-distance.md](coding-edit-distance.md).
- Reconstruct a match: store which branch won per `(i, j)`.

## Sources

- [Wildcard Matching — NeetCode](https://neetcode.io/solutions/wildcard-matching) — accessed 2026-10-24
- [44. Wildcard Matching — LeetCode Wiki](https://leetcode.doocs.org/en/lc/44/) — accessed 2026-10-24
- [Wildcard Matching — LeetCode 44](https://leetcode.com/problems/wildcard-matching/) — accessed 2026-10-24
- [Wildcard character — Wikipedia](https://en.wikipedia.org/wiki/Wildcard_character) — accessed 2026-10-24
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-24
