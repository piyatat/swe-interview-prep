# Subsets — answer outline

**Prompt:** Given distinct integers `nums`, return **all subsets** (the power set). Order of subsets and of elements inside a subset does not matter. (LeetCode 78)

This is the usual **include / exclude** backtracking template. Same family as permutations / combination-sum, but you **collect at every node**, not only at leaves of a permutation tree. Named as the backtracking example in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Result size is `2^n` — you cannot beat that output size.
- Distinct inputs → no extra skip logic. Duplicates → Subsets II.
- Two equivalent trees: **binary** (take / skip each index) vs **start-index** (append `nums[i]` then recurse `i+1`).
- Bitmask loop is the non-recursive twin: bit `j` of mask `0 … 2^n-1` means “include `nums[j]`.”

## Strong answer skeleton

1. **Clarify:** empty `nums` → `[[]]`; distinct vs not; they want the list of lists, not a count.
2. **Why not nested loops:** `n` is variable; you need `n` nested “take or skip” decisions.
3. **State:** `path` = current subset; `i` = next index to decide (or `start` in the for-loop form).
4. **Collect first:** `ans.append(path[:])` **before** the loop / at every `i`, including the empty path.
5. **Choose / explore / unchoose:** append, recurse `i+1`, pop. Do not reuse the same index (that is Combination Sum).
6. **Complexity:** O(n · 2^n) time (copy each subset); O(n) stack + path.

## Sketch (start-index)

```
ans, path = [], []
def dfs(start):
  ans.append(path[:])          # every prefix is a subset
  for i in start .. n-1:
    path.append(nums[i])
    dfs(i + 1)                 # forward only → no {2,1} twin of {1,2}
    path.pop()
dfs(0)
return ans
```

Binary form: `dfs(i)` either skips `nums[i]` or takes it, then `dfs(i+1)`; at `i == n` append. Same `2^n` leaves.

`[1,2,3]` → 8 subsets including `[]` and `[1,2,3]`.

## Mock narration (30 sec)

> “Each element is in or out, so there are 2^n subsets. I walk the array with a start index so order stays canonical, and I snapshot the path at every node — not only at the end. Then I’ll mention the bitmask version if they want no recursion.”

## Common mistakes

- Collecting only when `path` is full (`n` long) → that is **permutations / one combination of size n**.
- Forgetting to **copy** `path` (`append(path)` aliases).
- Recursing `i` instead of `i+1` → infinite or duplicate supersets.
- Subsets II: must **sort** and `continue` when `nums[i] == nums[i-1]` at the same depth.

## Follow-ups

- **Subsets II (90):** sorted + skip duplicates at the same `start`.
- **Permutations (46):** used-array or swap; collect at leaves; `n!` not `2^n`.
- **Combination Sum (39):** reuse allowed (`dfs(i)` not `i+1`); target sum.
- **Letter combinations of a phone number:** same tree, different alphabet.

## Sources

- [Subsets — NeetCode](https://neetcode.io/solutions/subsets) — accessed 2026-09-04
- [Power set — Wikipedia](https://en.wikipedia.org/wiki/Power_set) — accessed 2026-09-04
- [Backtracking templates — NeetCode Practice Framework](https://lufftw.github.io/neetcode/patterns/backtracking_exploration/templates/) — accessed 2026-09-04
- [Backtracking intuition — NeetCode Practice Framework](https://lufftw.github.io/neetcode/patterns/backtracking_exploration/intuition/) — accessed 2026-09-04
- Classic LeetCode #78 / #90 — include/exclude / start-index power set
