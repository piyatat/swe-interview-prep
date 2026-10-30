# Combinations — answer outline

**Prompt:** Given `n` and `k`, return **all** combinations of `k` distinct numbers chosen from `1 … n`. Order inside a combination does not create a new answer. (LeetCode 77)

This is **fixed-size** backtracking: [coding-subsets.md](coding-subsets.md) but collect **only** when `len(path) == k`, not at every node. Not [coding-combination-sum.md](coding-combination-sum.md) (unbounded, target sum) and not [coding-letter-combinations.md](coding-letter-combinations.md) (keypad product). NeetCode 150 backtracking box.

## Probes

- Combinations, not permutations: `[1,2]` and `[2,1]` are the **same**. Forward-only `start` is the usual fix.
- Count is `C(n, k) = n! / (k! (n-k)!)` — you cannot beat output size.
- `k == n` → one list `[1..n]`; `k == 1` → `n` singletons.
- Prune: if remaining slots `> remaining numbers`, stop (optional but they like it).

## Strong answer skeleton

1. **Clarify:** range is `1..n` inclusive; they want the list, not the count; `1 ≤ k ≤ n` (LeetCode).
2. **Why not nested loops:** `k` is variable; you would need `k` nested `for`s.
3. **State:** `path`, `start` (next integer you are allowed to pick).
4. **Base:** `len(path) == k` → copy `path`. Do **not** keep going (that would grow past `k`).
5. **Choose / explore / unchoose:** for `i = start .. n`, append `i`, `dfs(i+1)`, pop. `i+1` (not `i`) keeps combinations unique.
6. **Complexity:** O(k · C(n, k)) time (copy each combo); O(k) stack + path.

## Sketch (start-index)

```
ans, path = [], []
def dfs(start):
  if len(path) == k:
    ans.append(path[:]); return
  need = k - len(path)
  for i in start .. n:
    if n - i + 1 < need: break   # optional prune
    path.append(i)
    dfs(i + 1)
    path.pop()
dfs(1)
return ans
```

`n = 4, k = 2` → `[1,2] [1,3] [1,4] [2,3] [2,4] [3,4]`. Walk `n = 3, k = 2` out loud.

Include/exclude form is equivalent: at integer `i`, take `i` then `i+1`, or skip to `i+1`; collect when `i > n` **only if** `len == k`. Same tree, more call frames.

## Mock narration (30 sec)

> “I’ll build combinations in increasing order so I never emit a permutation twice. Recurse with a start index; stop at length k. If the remaining integers cannot fill the remaining slots, I cut the loop.”

## Common mistakes

- Recursing `dfs(i)` (reuse) → Combination Sum, not 77.
- Collecting at every node → Subsets (78), extra smaller lists.
- Swapping into a permutation tree → `k!` too many answers.
- Off-by-one: looping `0..n-1` then forgetting to emit `i+1`.
- Quoting `O(2^n)` without the `C(n,k)` / `k` copy.

## Follow-ups

- **Subsets (78)** — all sizes: [coding-subsets.md](coding-subsets.md).
- **Combination Sum** — unbounded target: [coding-combination-sum.md](coding-combination-sum.md).
- **Permutations** — order matters: [coding-permutations.md](coding-permutations.md).
- **Count only:** multiplicative formula / Pascal `C(n,k) = C(n-1,k-1) + C(n-1,k)`.

## Sources

- [Combinations — NeetCode](https://neetcode.io/solutions/combinations) — accessed 2026-10-30
- [77. Combinations — LeetCode](https://leetcode.com/problems/combinations/) — accessed 2026-10-30
- [Combination — Wikipedia](https://en.wikipedia.org/wiki/Combination) — accessed 2026-10-30
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-30
