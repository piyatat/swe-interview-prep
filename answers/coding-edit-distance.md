# Edit Distance — answer outline

**Prompt:** Two strings `word1`, `word2`. Return the **minimum** number of insertions, deletions, and substitutions to turn `word1` into `word2`. (LeetCode 72)

This is **unit-cost [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)** (Vladimir Levenshtein, 1965). Same **2D DP** family as [coding-unique-paths.md](coding-unique-paths.md), but the recurrence is `min` of three edits, not a path count. Named under DP in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Recursion without memo is exponential (three branches per mismatch).
- Match → copy diagonal (cost 0). Mismatch → substitute (diagonal + 1), delete (up + 1), insert (left + 1).
- Space: full `(m+1)×(n+1)` vs one rolling row. Reconstructing the script needs predecessors or Hirschberg.
- Related distances: LCS = insert/delete only; Hamming = substitute only, equal length; Damerau adds adjacent transpose.

## Strong answer skeleton

1. **Clarify:** unit costs; empty string → other length; case-sensitive; Unicode = code units unless they say otherwise.
2. **State:** `dp[i][j]` = distance between prefixes `word1[:i]` and `word2[:j]`.
3. **Base:** `dp[i][0] = i` (delete all), `dp[0][j] = j` (insert all).
4. **Recurrence:** if `word1[i-1] == word2[j-1]`, `dp[i][j] = dp[i-1][j-1]`; else `1 + min(delete, insert, substitute)`.
5. **Complexity:** Θ(m n) time and space; O(min(m, n)) extra if only the number is needed. Wikipedia: exact strongly-subquadratic time is SETH-hard — do not claim a faster exact interview trick.

## Sketch (full table)

```
# dp[i][j] = lev(word1[:i], word2[:j])
for i in 0..m: dp[i][0] = i
for j in 0..n: dp[0][j] = j
for i in 1..m:
  for j in 1..n:
    if word1[i-1] == word2[j-1]:
      dp[i][j] = dp[i-1][j-1]
    else:
      dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
return dp[m][n]
```

`kitten` → `sitting` = **3**. `""` → `abc` = **3**. Equal strings = **0**.

## Mock narration (30 sec)

> “Prefixes of the two words. If the last characters match I copy the diagonal. If not I take the cheapest of delete, insert, or replace, plus one. First row and column are just the other string’s length. I can keep one row if they only want the number.”

## Common mistakes

- Off-by-one on prefixes (`word1[i]` vs `word1[i-1]`).
- Forgetting base rows (empty-prefix distances).
- Recursing on the full strings without memo.
- Treating substitution as delete+insert (cost 2) — that is LCS distance, not Levenshtein.
- Rolling-row bug: overwriting the “up” cell before you need the old diagonal — keep `prev_diag`.

## Follow-ups

- **One-row / two-row:** store previous row; or `prev` diagonal + current row.
- **Edit script:** parent pointers; several optimal scripts may exist.
- **Threshold k:** only a band around the diagonal (Ukkonen-style) when k ≪ n.
- **Spell-check / fuzzy join:** filter candidates before full DP.

## Sources

- [Levenshtein distance — Wikipedia](https://en.wikipedia.org/wiki/Levenshtein_distance) — accessed 2026-09-11
- [Edit Distance — NeetCode](https://neetcode.io/solutions/edit-distance) — accessed 2026-09-11
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-09-11
- [The String-to-String Correction Problem — Wagner & Fischer, JACM 1974](https://doi.org/10.1145/321796.321811) — accessed 2026-09-11
- Classic LeetCode #72 — unit-cost Levenshtein / 2D DP
