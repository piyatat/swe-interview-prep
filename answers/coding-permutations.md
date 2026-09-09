# Permutations — answer outline

**Prompt:** Array `nums` of **distinct** integers. Return **all** permutations. Order of the lists does not matter. (LeetCode 46)

This is the **used-array / swap** sibling of [coding-subsets.md](coding-subsets.md): same choose / explore / unchoose tree, but you **collect only at leaves** (`path` length `n`) and you **must not reuse** an index. Named under backtracking in [../general/coding-patterns.md](../general/coding-patterns.md). Cousin of [coding-combination-sum.md](coding-combination-sum.md) (reuse allowed) and [coding-generate-parentheses.md](coding-generate-parentheses.md) (different prune).

## Probes

- Distinct inputs here. Duplicates in `nums` → Permutations II (sort + skip `==` at the same depth).
- Why `n!` leaves, not `2^n` (that is subsets).
- Used-array vs **in-place swap** — same tree, different state.
- Copy `path` (or `nums`) when you record; the buffer is mutated after.

## Strong answer skeleton

1. **Clarify:** `n` is tiny (LeetCode ≤ 6); empty → `[[]]`; they want the lists, not a count (`n!`).
2. **Why backtracking:** unknown order; every unused element can sit in the next slot.
3. **State:** `path` + `used[i]`, **or** a `start` index with swaps on `nums`.
4. **Base:** `len(path) == n` → append a **copy**.
5. **Choose / explore / unchoose:** try each unused `i`; mark; recurse; unmark + pop.
6. **Complexity:** **O(n · n!)** time (copy each permutation) and **O(n)** stack / used (output not counted).

## Sketch (used array)

```
ans, path, used = [], [], [False] * n
def dfs():
  if len(path) == n:
    ans.append(path[:]); return
  for i in range(n):
    if used[i]: continue
    used[i] = True; path.append(nums[i])
    dfs()
    path.pop(); used[i] = False
dfs()
return ans
```

Swap form: at `start`, for `i` in `start..n-1`, swap `start` with `i`, recurse `start+1`, swap back. Prefix `0..start-1` is already placed. Same `O(n · n!)` bound.

`[1,2,3]` → six lists. Checking `x in path` instead of `used` is correct but **O(n)** per try — interviewers prefer the boolean.

## Mock narration (30 sec)

> “I fill positions left to right. At each slot I try every unused index, mark it, recurse, then unmark. I snapshot when the path is length n. That’s n-factorial leaves; copying each costs another n.”

## Common mistakes

- Collecting at every node (Subsets) or recursing `i+1` only (combinations).
- Forgetting **undo** — later siblings see a permanently used index.
- Appending `path` without a copy — every answer mutates into the last one.
- Treating Permutations II like 46: without the same-depth skip you emit duplicates.

## Follow-ups

- **Permutations II (47):** sort; skip `nums[i] == nums[i-1]` when `i-1` is unused.
- **Next Permutation (31):** one step of the lexicographic successor.
- **Letter combinations of a phone number:** same tree, different alphabet per slot.
- **N-Queens:** same used idea on columns / diagonals.

## Sources

- [Permutations — NeetCode](https://neetcode.io/solutions/permutations) — accessed 2026-09-09
- [LeetCode 46 Permutations — DTDucas](https://dtducas.com/blog/permutations) — accessed 2026-09-09
- [Permutations — JZLeetCode](https://jzleetcode.github.io/posts/leet-0046-permutations/) — accessed 2026-09-09
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-09-09
