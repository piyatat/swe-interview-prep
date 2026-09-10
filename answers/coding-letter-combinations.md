# Letter combinations of a phone number — answer outline

**Prompt:** String `digits` using only `2–9`. Return **all** letter strings the old phone keypad could mean, any order. Empty `digits` → `[]` (not `[""]`). (LeetCode 17)

This is a **Cartesian product** / decision tree: one digit per level, 3–4 branches. Sibling of [coding-generate-parentheses.md](coding-generate-parentheses.md) (prune by an invariant) and [coding-permutations.md](coding-permutations.md) / [coding-subsets.md](coding-subsets.md) (same tree, different alphabet). Wikipedia [backtracking](https://en.wikipedia.org/wiki/Backtracking).

## Probes

- Keypad: `2=abc` … `6=mno`, **`7=pqrs`**, `8=tuv`, **`9=wxyz`**. `7` and `9` have **four** letters.
- No `0` / `1` in the classic prompt — say what you would do if they appeared.
- They want the list, not the count `∏ |letters(d)|`.
- Iterative “expand a queue of prefixes” is the same tree, BFS-shaped.

## Strong answer skeleton

1. **Clarify:** empty → `[]`; `n` small (≤ 4 on LeetCode); order irrelevant.
2. **Map** digit → string. Hard-code; do not invent `qprs` for `7`.
3. **Backtrack:** index `i`, path. At `i == n`, copy path. Else try each letter of `digits[i]`, recurse, pop.
4. **Iterative alt:** start `res = [""]`; for each digit, replace `res` with `prefix + ch` for every prefix and letter.
5. **Complexity:** time / output O(n · 4ⁿ) worst case (`7`/`9`); recursion stack O(n).

## Sketch (backtracking)

```
PAD = {"2":"abc", "3":"def", "4":"ghi", "5":"jkl",
       "6":"mno", "7":"pqrs", "8":"tuv", "9":"wxyz"}
if digits == "": return []
ans, path = [], []
def dfs(i):
  if i == len(digits):
    ans.append("".join(path)); return
  for ch in PAD[digits[i]]:
    path.append(ch); dfs(i + 1); path.pop()
dfs(0)
return ans
```

`"23"` → 9 strings `ad`…`cf`. `""` → `[]`. `"7"` → `p,q,r,s`.

## Mock narration (30 sec)

> “Each digit is a level; I pick one mapped letter and go on. Empty input is no combinations. Seven and nine have four letters, so the bound is 4^n, not 3^n. I can also expand prefixes iteratively — same product.”

## Common mistakes

- Returning `[""]` for empty input.
- Mapping `7` → `pqrs` as three letters, or the NeetCode typo `qprs`.
- Treating this as permutations of a multiset (order of digits is **fixed**).
- Forgetting to pop / concatenating immutable strings without a plan (fine if you pass `cur + ch`).
- Claiming O(n!) — that is permutations, not this product.

## Follow-ups

- **Count only:** multiply mapping sizes; still special-case empty.
- **Restore IP / generate parentheses:** same DFS, extra prune.
- **Word search / combination sum:** backtracking with a used-set or remaining budget.

## Sources

- [Letter Combinations of a Phone Number — NeetCode](https://neetcode.io/solutions/letter-combinations-of-a-phone-number) — accessed 2026-09-10
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-09-10
- [LeetCode 17 Letter Combinations — JZLeetCode](https://jzleetcode.github.io/posts/leet-0017-letter-combinations-of-a-phone-number/) — accessed 2026-09-10
- [Letter Combinations — DSA Prep](https://www.dsaprep.dev/blog/letter-combinations-of-a-phone-number-leetcode-solution) — accessed 2026-09-10
- Classic LeetCode #17 — keypad Cartesian product
