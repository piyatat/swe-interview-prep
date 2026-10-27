# Subsets II — answer outline

**Prompt:** Integer array `nums` that **may contain duplicates**. Return **all unique subsets** (the power set). Order of subsets and of elements inside a subset does not matter. (LeetCode 90)

This is [coding-subsets.md](coding-subsets.md) plus the **same-depth skip** from [coding-combination-sum-ii.md](coding-combination-sum-ii.md). Collect **at every node**, not only when a target hits zero. NeetCode 150 backtracking box.

## Probes

- Result is unique **multisets**: `[1,1,2]` must emit `[1,1]` once, not twice.
- Two equal values at **different depths** are allowed (`[1,1]` uses both slots).
- Sort first so equals sit together. A hash set of tuples works but hides the prune they want.
- Output size is still O(2^n); you cannot beat that in the worst case of all-distinct.

## Strong answer skeleton — sort + same-depth skip

1. **Clarify:** empty → `[[]]`; they want the list of lists, not a count.
2. Sort `nums`. `dfs(start)`:
   - `ans.append(path[:])` **first** (every prefix is a subset, including `[]`).
   - for `j = start .. n-1`: if `j > start` and `nums[j] == nums[j-1]` continue; push, `dfs(j+1)`, pop.
3. The skip is **same depth only**. After you take `nums[start]`, a later equal at a **deeper** index is a different slot.
4. Choose/skip form: take this `x` then `dfs(i+1)`; skip jumps the **whole run** of `x`. Same unique set.
5. **Complexity:** O(n · 2^n) time (copy each subset); O(n) stack + path. Sort is O(n log n) warmup.

## Sketch (start-index + skip)

```
nums.sort()
ans, path = [], []
def dfs(start):
  ans.append(path[:])
  for j in range(start, n):
    if j > start and nums[j] == nums[j-1]:
      continue
    path.append(nums[j])
    dfs(j + 1)
    path.pop()
dfs(0)
return ans
```

`[1,2,1]` → `[[],[1],[1,1],[1,1,2],[1,2],[2]]`. `[7,7]` → `[[],[7],[7,7]]`.

Bitmask over sorted `nums` still needs a skip: if bit `j` is off and `nums[j] == nums[j-1]`, you already generated this mask’s twin.

## Mock narration (30 sec)

> “I sort so duplicates are adjacent. I snapshot the path at every node, then walk from a start index. At the same depth I skip a value I already tried, so two 1s can still both sit in one subset, but I do not emit the same multiset twice.”

## Common mistakes

- Collecting only at `j == n` with a take/skip tree and **no** skip — duplicate lists.
- Skipping when `j > 0` instead of `j > start` — drops `[1,1]`.
- Recursing `j` (reuse the same index) — that is Combination Sum.
- Deduping with a set of sorted tuples and calling it done (hides the blow-up you should prune).
- Forgetting to **copy** `path`.

## Follow-ups

- **Subsets (78):** distinct inputs — [coding-subsets.md](coding-subsets.md).
- **Combination Sum II (40):** same skip, collect only at `remain == 0` — [coding-combination-sum-ii.md](coding-combination-sum-ii.md).
- **Permutations II (47):** used-array + same-depth skip; collect at leaves; `n!` not `2^n`.

## Sources

- [Subsets II — NeetCode](https://neetcode.io/solutions/subsets-ii) — accessed 2026-10-27
- [Subsets II — LeetCode 90](https://leetcode.com/problems/subsets-ii/) — accessed 2026-10-27
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-10-27
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-27
