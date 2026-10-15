# Palindrome Partitioning — answer outline

**Prompt:** Partition string `s` so **every substring in the partition is a palindrome**. Return **all** partitions (any order). (LeetCode 131)

This is **cut-placement backtracking**, cousin of [coding-subsets.md](coding-subsets.md) (include / skip a cut) with a palindrome gate. NeetCode 150 backtracking box. Wikipedia [Backtracking](https://en.wikipedia.org/wiki/Backtracking) / [Palindrome](https://en.wikipedia.org/wiki/Palindrome). `n` is tiny (≤ 16 on LeetCode) because there are up to `2^{n-1}` partitions.

## Probes

- Single letters are palindromes — `"a"` → `[["a"]]`. `"aab"` → `[["a","a","b"],["aa","b"]]`.
- They want **every** valid cut set, not the **minimum cut** count (that is 132, DP).
- Expand-around-center or DP table so each `s[i..j]` palindrome test is O(1) after O(n²) preprocess. Rescanning every span inside DFS is the same idea and slower to write under pressure.
- Output order does not matter; copy `path` when `i == n`.

## Strong answer skeleton — DFS + palindrome table

1. **Clarify:** lowercase only unless they say otherwise; empty `s` is usually not in play (`n ≥ 1`).
2. Precompute `pal[i][j]`: true iff `s[i..j]` is a palindrome. Fill by increasing length: `s[i] == s[j] and (j - i < 2 or pal[i+1][j-1])`.
3. `dfs(i)` = partition the suffix starting at `i`. If `i == n`, snapshot `path`.
4. For `j = i .. n-1`, if `pal[i][j]`, push `s[i..j]`, `dfs(j+1)`, pop.
5. **Complexity:** O(n · 2^n) time (NeetCode target) to list partitions; O(n²) extra for the table plus O(n) stack / path besides the answer list.

Two-pointer check per candidate span is acceptable if you narrate the O(n) scan; the table is what you mention when they ask to speed the inner test.

## Sketch (table + DFS)

```
n = len(s)
pal = [[False] * n for _ in range(n)]
for i in range(n):
  pal[i][i] = True
for i in range(n - 1):
  pal[i][i + 1] = s[i] == s[i + 1]
for length in range(3, n + 1):
  for i in range(n - length + 1):
    j = i + length - 1
    pal[i][j] = s[i] == s[j] and pal[i + 1][j - 1]

ans, path = [], []
def dfs(i):
  if i == n:
    ans.append(path[:]); return
  for j in range(i, n):
    if pal[i][j]:
      path.append(s[i:j + 1])
      dfs(j + 1)
      path.pop()
dfs(0)
return ans
```

## Mock narration (30 sec)

> “I try every end index for the next piece. I only cut when that substring is a palindrome, then recurse on the rest. A DP table answers the palindrome test in O(1). When the start index hits n, I copy the path.”

## Common mistakes

- Collecting when `path` is non-empty but `i < n` (partial partition).
- Forgetting to **copy** `path`.
- Checking palindromes only on the whole `s`, not on every candidate span.
- Returning one partition or the min-cut count (132) instead of the list of lists.
- Treating it as [coding-partition-labels.md](coding-partition-labels.md) (greedy last-index, different problem).

## Follow-ups

- **Palindrome Partitioning II (132):** min cuts — DP on prefixes, not the full list.
- **Longest palindromic substring:** expand centers — [coding-longest-palindrome.md](coding-longest-palindrome.md).
- **Word Break II:** same suffix DFS, dictionary gate instead of palindrome.

## Sources

- [Palindrome Partitioning — NeetCode](https://neetcode.io/solutions/palindrome-partitioning) — accessed 2026-10-15
- [131. Palindrome Partitioning — LeetCode Wiki](https://leetcode.doocs.org/en/lc/131/) — accessed 2026-10-15
- [Palindrome Partitioning — LeetCode 131](https://leetcode.com/problems/palindrome-partitioning/) — accessed 2026-10-15
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-10-15
- [Palindrome — Wikipedia](https://en.wikipedia.org/wiki/Palindrome) — accessed 2026-10-15
