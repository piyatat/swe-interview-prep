# Interleaving String — answer outline

**Prompt:** Given `s1`, `s2`, `s3`, return whether `s3` is an **interleaving** of `s1` and `s2`: you consume both inputs **in order** (each may be split into substrings) and concatenate those pieces so they rebuild `s3`. Empty strings are allowed. (LeetCode 97)

This is **2D boolean DP** (or memoized DFS on two pointers), not “merge like merge-sort and hope.” Cousin of [coding-longest-common-subsequence.md](coding-longest-common-subsequence.md) (two strings, grid) and [coding-edit-distance.md](coding-edit-distance.md) (choices at `(i, j)`). NeetCode 150 2D-DP box.

## Probes

- First gate: `len(s1) + len(s2) == len(s3)` — if not, **false**. Do this before DP.
- Relative order inside `s1` and inside `s2` is **fixed**. You only choose which string donates the next `s3` character.
- The `|n − m| ≤ 1` “number of pieces” wording is the formal definition; the implementable invariant is **two pointers**.
- Recursion without memo is exponential (two choices at many steps). `n ≤ 100` still dies.
- Follow-up they publish: **O(min(m, n))** extra space with a rolling row.

## Strong answer skeleton — `dp[i][j]`

1. **Clarify:** empties allowed; lowercase; must use **all** of both strings; order preserved.
2. Let `dp[i][j]` = whether `s3[:i+j]` is an interleaving of `s1[:i]` and `s2[:j]`.
3. `dp[0][0] = True`. First row: only `s2` prefixes; first col: only `s1` prefixes (chain of equalities).
4. Recurrence:  
   `dp[i][j] = (dp[i-1][j] and s1[i-1] == s3[i+j-1]) or (dp[i][j-1] and s2[j-1] == s3[i+j-1])`.
5. Return `dp[m][n]`. **Complexity:** O(m n) time. One boolean row of length `n+1` if they ask for space (walk `i` outer; keep “up” before overwrite).

DFS+memo on `(i, j)` with `k = i+j` is the same DAG. Either is fine if you name the state.

## Sketch (full table)

```
if len(s1) + len(s2) != len(s3): return False
m, n = len(s1), len(s2)
dp = [[False] * (n + 1) for _ in range(m + 1)]
dp[0][0] = True
for i in range(1, m + 1):
  dp[i][0] = dp[i-1][0] and s1[i-1] == s3[i-1]
for j in range(1, n + 1):
  dp[0][j] = dp[0][j-1] and s2[j-1] == s3[j-1]
for i in range(1, m + 1):
  for j in range(1, n + 1):
    from1 = dp[i-1][j] and s1[i-1] == s3[i+j-1]
    from2 = dp[i][j-1] and s2[j-1] == s3[i+j-1]
    dp[i][j] = from1 or from2
return dp[m][n]
```

`"aabcc", "dbbca", "aadbbcbcac"` → **true**. Same inputs vs `"aadbbbaccc"` → **false**. `"", "", ""` → **true**.

## Mock narration (30 sec)

> “Lengths must add. I ask whether the first i of s1 and first j of s2 can build the first i+j of s3. A cell is true if I can take the next letter from s1 after a true above, or from s2 after a true left. One rolling row if they care about space.”

## Common mistakes

- Skipping the length check and walking off `s3`.
- Allowing a character from `s1` **out of order** (set / multiset match).
- Indexing `s3` as `i+j` vs `i+j-1` off-by-one on a 1-based table.
- Recursing both branches without memo.
- Treating this as LCS (`== len`) — LCS does not require using **every** character of both strings in a merge.

## Follow-ups

- **O(n) space:** one row; `s1` is the outer loop.
- **Count the number of interleavings** — same DAG, add instead of or (mod if they say).
- **Wildcard / extra characters** — becomes a different edit problem; [coding-edit-distance.md](coding-edit-distance.md).
- **Distinct Subsequences (115):** consume `s` to build `t`; same grid, different take/skip.

## Sources

- [Interleaving String — NeetCode](https://neetcode.io/solutions/interleaving-string) — accessed 2026-10-21
- [97. Interleaving String — LeetCode Wiki](https://leetcode.doocs.org/en/lc/97/) — accessed 2026-10-21
- [Interleaving String — LeetCode 97](https://leetcode.com/problems/interleaving-string/) — accessed 2026-10-21
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-21
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-21
