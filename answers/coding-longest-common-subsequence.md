# Longest common subsequence — answer outline

**Prompt:** Strings `text1`, `text2`. Return the **length** of the longest subsequence common to both (delete any characters; **order stays**). Empty common subsequence → `0`. (LeetCode 1143)

This is the usual **2D string DP**. Cousin of [coding-edit-distance.md](coding-edit-distance.md) (insert/delete/replace) and [coding-unique-paths.md](coding-unique-paths.md) (grid recurrence). Different from [coding-longest-increasing.md](coding-longest-increasing.md) (one sequence, value order) and from longest **common substring** (must be contiguous).

## Probes

- Subsequence ≠ substring. `"ace"` is in `"abcde"`; `"aec"` is not.
- Recursion without memo is exponential (two skips at every mismatch).
- They asked for **length** — reconstructing the string needs a second walk (or parent pointers).
- Space: full `m × n` table vs two rows (or one) of length `n`.

## Strong answer skeleton

1. **Clarify:** lowercase only in the classic statement; empty string → `0`; we need length, not the string.
2. **Recurrence:** `dp[i][j]` = LCS length of `text1[i:]` and `text2[j:]` (or of prefixes — pick one and stick to it).
   - If `text1[i] == text2[j]`: `1 + dp[i+1][j+1]`.
   - Else: `max(dp[i+1][j], dp[i][j+1])`.
   - Base: `i == m` or `j == n` → `0`.
3. **Bottom-up:** table `(m+1) × (n+1)` of zeros; fill from the ends (or from prefixes `1..m`, `1..n` with `dp[i][j] = 1+dp[i-1][j-1]` on match else `max(dp[i-1][j], dp[i][j-1])`).
4. **Complexity:** O(m n) time and space; rolling two rows → O(min(m, n)) extra.
5. **Vs edit distance:** LCS only **keeps or skips**; no substitute cost. `len(a) + len(b) - 2 * LCS` is the delete-only edit distance.

## Sketch (prefix table)

```
m, n = len(text1), len(text2)
dp = [[0] * (n+1) for _ in range(m+1)]
for i in 1..m:
  for j in 1..n:
    if text1[i-1] == text2[j-1]:
      dp[i][j] = dp[i-1][j-1] + 1
    else:
      dp[i][j] = max(dp[i-1][j], dp[i][j-1])
return dp[m][n]
```

`"cat"` / `"crabt"` → **3** (`cat`). `"abcde"` / `"ace"` → **3**. `"abc"` / `"def"` → **0`.

Reconstruct: from `(m, n)` walk: on match, prepend that char and go diagonal; else step to the neighbor with the larger value.

## Mock narration (30 sec)

> “If the heads match I take both and add one; if not I skip one character from either string and take the max. That fills an m by n table. I will not confuse this with substring, which resets on a mismatch.”

## Common mistakes

- Treating it as substring (`dp = 0` on mismatch instead of `max(skip left, skip up)`).
- Off-by-one on empty prefixes (need the extra 0 row/column).
- Rolling one row **right-to-left vs left-to-right** and clobbering `dp[j-1]` from the **current** row (keep a `prev_diag` or two rows).
- Returning the string’s last row as “the LCS” (it is lengths).

## Follow-ups

- **Longest common substring:** reset to 0 on mismatch; answer is the global max cell.
- **Edit Distance (72):** three edits — [coding-edit-distance.md](coding-edit-distance.md).
- **Shortest common supersequence:** `m + n - LCS`.
- **Diff tools:** LCS is the backbone of `diff`; mention, do not implement Myers live.

## Sources

- [Longest Common Subsequence — NeetCode](https://neetcode.io/solutions/longest-common-subsequence) — accessed 2026-09-17
- [Longest Common Subsequence — LeetCode 1143](https://leetcode.com/problems/longest-common-subsequence/) — accessed 2026-09-17
- [Longest common subsequence — Wikipedia](https://en.wikipedia.org/wiki/Longest_common_subsequence) — accessed 2026-09-17
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-09-17
- Classic LeetCode #1143 — 2D string DP
