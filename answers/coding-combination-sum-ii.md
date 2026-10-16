# Combination Sum II — answer outline

**Prompt:** Integer array `candidates` (may contain **duplicates**) and `target`. Return **all unique combinations** that sum to `target`. Each index may be used **at most once**. Order inside a combination does not create a new answer. (LeetCode 40)

This is the **0/1** sibling of [coding-combination-sum.md](coding-combination-sum.md) (unbounded reuse) and the **skip-duplicates** sibling of [coding-subsets.md](coding-subsets.md). Same start-index tree, but recurse `j+1` and **skip equal values at the same depth**. NeetCode 150. Wikipedia [Backtracking](https://en.wikipedia.org/wiki/Backtracking).

## Probes

- Each **index** once — not “each value once.” Two `1`s in the input may both appear (`[1,1,6]` for target `8`).
- Duplicate **combinations** are illegal: `[1,7]` from the first `1` and from the second `1` is one answer.
- Sort so equals sit together; skip with `j > start and candidates[j] == candidates[j-1]`. Skipping without sort still duplicates.
- Positive inputs → prune / `break` when `candidates[j] > remain`.

## Strong answer skeleton — sort + same-depth skip

1. **Clarify:** empty `candidates` → `[]`; `target == 0` → `[[]]` only if they allow empty (LC: positives, `n ≥ 1`).
2. **Why not a set of tuples:** interviewers want the skip in the tree, not a hash of every path.
3. Sort `candidates`. `dfs(start, remain)`:
   - `remain == 0` → copy `path`
   - for `j = start .. n-1`: if `candidates[j] > remain` break; if `j > start` and `candidates[j] == candidates[j-1]` continue; push, `dfs(j+1, remain - candidates[j])`, pop
4. The skip is **same depth only**. After you take `candidates[start]`, a later equal at a **deeper** index is a different slot — that is how `[1,1,6]` survives.
5. **Complexity:** output-exponential, typically **O(2^n · n)** to copy paths; O(n) stack besides the answer. Sort is O(n log n) warmup.

Choose/skip form: take `x` → `dfs(i+1)`; skip → jump the whole run of `x`. Same unique set.

## Sketch (start-index + skip)

```
candidates.sort()
ans, path = [], []
def dfs(start, remain):
  if remain == 0:
    ans.append(path[:]); return
  for j in range(start, n):
    if candidates[j] > remain: break
    if j > start and candidates[j] == candidates[j-1]:
      continue
    path.append(candidates[j])
    dfs(j + 1, remain - candidates[j])   # +1: no reuse
    path.pop()
dfs(0, target)
return ans
```

`[10,1,2,7,6,1,5], target = 8` → `[1,1,6]`, `[1,2,5]`, `[1,7]`, `[2,6]`. `[2,5,2,1,2], target = 5` → `[1,2,2]`, `[5]`.

## Mock narration (30 sec)

> “I sort so duplicates are adjacent. I walk from a start index and never reuse an index. At the same depth I skip a value I already tried, so two different 1s can still both sit in one combination, but I do not emit the same multiset twice.”

## Common mistakes

- Recursing `j` (reuse) — that is Combination Sum I.
- Skipping **all** remaining equals after a pick — you drop `[1,1,6]`.
- Skipping when `j > 0` instead of `j > start` — kills valid later slots.
- Sorting but not skipping — still duplicate lists.
- Deduping with a set of sorted tuples and calling it done (hides the O(2^n) blow-up you should prune).

## Follow-ups

- **Combination Sum (39):** reuse allowed — [coding-combination-sum.md](coding-combination-sum.md).
- **Subsets II (90):** collect every node; same sort + same-depth skip.
- **Combination Sum III (216):** `k` numbers from `1..9`.
- **Coin Change II:** count unbounded combinations — [coding-coin-change-ii.md](coding-coin-change-ii.md).

## Sources

- [Combination Sum II — NeetCode](https://neetcode.io/solutions/combination-sum-ii) — accessed 2026-10-16
- [40. Combination Sum II — LeetCode Wiki](https://leetcode.doocs.org/en/lc/40/) — accessed 2026-10-16
- [Combination Sum II — LeetCode 40](https://leetcode.com/problems/combination-sum-ii/) — accessed 2026-10-16
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-10-16
