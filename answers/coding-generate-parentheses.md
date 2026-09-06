# Generate Parentheses — answer outline

**Prompt:** Given `n` pairs, return **all** well-formed parenthesis strings. Order does not matter. (LeetCode 22)

This is **constrained backtracking** — prune while building, do not generate `2^(2n)` strings and filter. Sibling of [coding-valid-parentheses.md](coding-valid-parentheses.md) (check, not generate) and [coding-subsets.md](coding-subsets.md) (include/exclude without a balance invariant). Named with the backtracking family in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Count of answers is the **nth Catalan number** `C_n = (1/(n+1)) * (2n choose n)`.
- Empty / `n = 1` → `[""]` vs `["()"]` — confirm `n ≥ 1`.
- A prefix is valid iff `#)` never exceeds `#(` and totals will hit `n` each.
- Interviewers want the **two-counter** prune, not “generate then stack-check.”

## Strong answer skeleton

1. **Clarify:** only `()`? they want the list, not `C_n`? `n` small (Catalan grows fast).
2. **Why not brute force:** all length-`2n` binary strings is `O(n · 4^n)`; most are invalid.
3. **State:** `path`, `open` used, `close` used.
4. **Place `(`** only if `open < n`. **Place `)`** only if `close < open` (not `close < n`).
5. **Collect** when `len(path) == 2n` — already valid by construction.
6. **Complexity:** time `O(n · C_n)` ≈ `O(4^n / √n)` (Wikipedia Catalan asymptotics); stack `O(n)` plus output.

## Sketch (two counters)

```
ans, path = [], []
def dfs(open, close):
  if len(path) == 2 * n:
    ans.append("".join(path)); return
  if open < n:
    path.append("("); dfs(open + 1, close); path.pop()
  if close < open:
    path.append(")"); dfs(open, close + 1); path.pop()
dfs(0, 0)
return ans
```

`n = 3` → 5 strings: `((()))`, `(()())`, `(())()`, `()(())`, `()()()`. Walk `n = 2` out loud: `(())` and `()()`.

## Mock narration (30 sec)

> “I only place a character that stays a prefix of some valid string. I can open while I have budget; I can close only when there is an unmatched open. Every leaf of length 2n is already valid — Catalan many, not 4^n.”

## Common mistakes

- Allowing `)` when `close < n` → `())(`-shaped junk.
- Generating all `(` / `)` strings, then running Valid Parentheses.
- Forgetting to **pop** / copying `path` by alias.
- Quoting `O(2^n)` or `O(n!)` instead of Catalan / `4^n / √n`.
- Iterative stack of partial strings is fine; still need the same two rules.

## Follow-ups

- **Valid Parentheses (20):** check only — [coding-valid-parentheses.md](coding-valid-parentheses.md).
- **Count** valid strings: `C_n` DP `dp[i] += dp[j] * dp[i-1-j]`.
- **Letter combinations / subsets / permutations:** same tree, different prune.
- **Remove Invalid Parentheses:** BFS on deletions, not this generator.

## Sources

- [Generate Parentheses — NeetCode](https://neetcode.io/solutions/generate-parentheses) — accessed 2026-09-06
- [Catalan number — Wikipedia](https://en.wikipedia.org/wiki/Catalan_number) — accessed 2026-09-06
- [Generate Parentheses — InterviewLoop](https://interviewloop.app/learn/code/backtracking/generate-parentheses) — accessed 2026-09-06
- [Generate Parentheses — DSA Prep](https://www.dsaprep.dev/blog/generate-parentheses-leetcode-solution) — accessed 2026-09-06
- Classic LeetCode #22 — Catalan backtracking
