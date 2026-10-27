# Valid Parenthesis String — answer outline

**Prompt:** String `s` of `'('`, `')'`, and `'*'`. Return whether some interpretation of each `'*'` as `'('`, `')'`, or empty makes a valid parentheses string. (LeetCode 678)

This is [coding-valid-parentheses.md](coding-valid-parentheses.md) plus a wildcard. Interviewers want the **O(n) greedy balance range**, not 3^n recursion. NeetCode 150 greedy box. Wikipedia [Greedy algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm).

## Probes

- `'*'` is three-way: open, close, or skip — brute force is exponential.
- Balance never goes negative **in any surviving interpretation**, and can finish at 0.
- Two stacks (open indices + star indices) also work; they will ask why greedy is O(1) extra space.
- Empty / all-stars is valid. `")("` is not. `"(((*)"` cannot close the extra opens.

## Strong answer skeleton — min/max open count

1. **Clarify:** only these three chars; they want a boolean, not a witness string.
2. Walk left to right with `lo`, `hi` = fewest / most possible unmatched `'('`:
   - `'('`: `lo += 1`, `hi += 1`
   - `')'`: `lo = max(lo - 1, 0)`, `hi -= 1`
   - `'*'`: `lo = max(lo - 1, 0)` (treat as `)` or empty), `hi += 1` (treat as `(`)
3. If `hi < 0` at any point, too many closes even if every `'*'` is `'('` → false.
4. End: `lo == 0` (some assignment closed every open). `lo` is clamped at 0 so leftover opens that **could** be eaten by stars stay representable.
5. **Complexity:** O(n) time, O(1) space.

Stack twin: push `'('` indices and `'*'` indices. On `')'`, pop an open else a star. Then pair leftover opens with **later** stars (`open_i < star_i`). Same O(n), O(n) space.

DP twin: `dp[i][open]` — fine for n ≤ 100, overkill if they asked linear.

## Sketch (balance range)

```
lo = hi = 0
for c in s:
  if c == '(':
    lo += 1; hi += 1
  elif c == ')':
    lo = max(lo - 1, 0); hi -= 1
  else:  # *
    lo = max(lo - 1, 0); hi += 1
  if hi < 0: return False
return lo == 0
```

`"((**)"` → true. `"(((*)"` → false. `"*"` → true. `")*("` → false.

## Mock narration (30 sec)

> “I do not try every star. I keep the lowest and highest number of opens still possible. A close or a star can drop the low, but not below zero. If the high goes negative I already have too many closes. At the end the low must be zero so some assignment balanced.”

## Common mistakes

- Tracking a single balance and treating `'*'` as optional close only (misses `"(*("`).
- Letting `lo` go negative instead of clamping — end check lies.
- Forgetting the `hi < 0` mid-string fail (`")("` looks fine if you only check the end).
- Matching leftover opens to **earlier** stars in the two-stack version.
- Recursing all three choices without memo — TLE on n = 100.

## Follow-ups

- **Valid Parentheses (20):** no stars; one stack — [coding-valid-parentheses.md](coding-valid-parentheses.md).
- **Generate Parentheses (22):** emit all, no wildcards — [coding-generate-parentheses.md](coding-generate-parentheses.md).
- **Minimum Add to Make Parentheses Valid:** count unmatched; related lo/hi idea.
- **Longest Valid Parentheses:** stack of indices or DP; different problem.

## Sources

- [Valid Parenthesis String — NeetCode](https://neetcode.io/solutions/valid-parenthesis-string) — accessed 2026-10-27
- [Valid Parenthesis String — LeetCode 678](https://leetcode.com/problems/valid-parenthesis-string/) — accessed 2026-10-27
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-10-27
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-27
