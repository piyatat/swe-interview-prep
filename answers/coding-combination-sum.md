# Combination Sum — answer outline

**Prompt:** Distinct positive integers `candidates`, integer `target`. Return **all unique combinations** that sum to `target`. The same number may be chosen **unlimited** times. Order inside a combination does not create a new answer. (LeetCode 39)

This is the **unbounded** sibling of [coding-subsets.md](coding-subsets.md): same start-index tree, but you **reuse the current index** and you **collect only when remaining hits 0**. Named under backtracking in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Reuse: recurse `dfs(i)`, not `dfs(i+1)`. Forward-only `i` keeps `[2,3]` and `[3,2]` as one combination.
- Positive inputs → prune when `remaining < 0` (or `> target` if you add).
- Sort first if you want to **break** the loop once `candidates[j] > remaining`.
- Distinct `candidates` here. Duplicates in the array → Combination Sum II (skip same value at the same depth).

## Strong answer skeleton

1. **Clarify:** empty `candidates` → `[]`; `target == 0` → `[[]]` if they allow empty; all values `> 0`; they want the list, not a count (that is Coin Change II).
2. **Why not nested loops:** unknown combination length; unbounded repeats.
3. **State:** `path`, `start` (or `i`), `remaining` (or running sum).
4. **Base:** `remaining == 0` → copy `path`; `remaining < 0` or `i == n` → stop.
5. **Choose / explore / unchoose:** from `j = start .. n-1`, append `candidates[j]`, `dfs(j, remaining - candidates[j])`, pop.
6. **Complexity:** output-exponential. Common bound **O(n^(T/M))** time where `T` is target and `M` is the smallest candidate (depth ≤ `T/M`); O(T/M) stack + path besides the answer list.

## Sketch (start-index + reuse)

```
sort candidates            # optional; enables break
ans, path = [], []
def dfs(start, remain):
  if remain == 0:
    ans.append(path[:]); return
  for j in start .. n-1:
    if candidates[j] > remain: break   # only after sort
    path.append(candidates[j])
    dfs(j, remain - candidates[j])     # j, not j+1
    path.pop()
dfs(0, target)
return ans
```

`candidates = [2,3,6,7], target = 7` → `[2,2,3]`, `[7]`.

Binary twin: at index `i`, skip (`dfs(i+1)`) or take and **stay** (`dfs(i)`). Same reuse rule.

## Mock narration (30 sec)

> “I walk candidates from a start index so combinations stay in non-decreasing order. I may reuse the same index because the prompt allows repeats. I snapshot only when remaining is zero, and I prune when a candidate overshoots.”

## Common mistakes

- Recursing `j+1` after a pick → that is Combination Sum II / Subsets (no reuse).
- Recursing from `0` every time → permutations of the same multiset.
- Collecting at every node (Subsets) or only at `i == n` without a sum check.
- Forgetting to **copy** `path`.
- Treating it as [coding-coin-change.md](coding-coin-change.md) (min coins / count), not the combination list.

## Follow-ups

- **Combination Sum II (40):** each value once; sort + skip `==` at the same `start`.
- **Combination Sum III (216):** fixed `k` from `1..9`.
- **Combination Sum IV (377):** **permutations** count — DP, loop order flipped vs Coin Change II.
- **Subsets / Permutations:** collect-every-node vs used-array / swap at leaves.

## Sources

- [Combination Sum — NeetCode](https://neetcode.io/solutions/combination-sum) — accessed 2026-09-05
- [Combination Sum walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/combination-sum-interview-walkthrough/) — accessed 2026-09-05
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-09-05
- Classic LeetCode #39 / #40 / #216 / #377 — unbounded vs once vs permutation-count
