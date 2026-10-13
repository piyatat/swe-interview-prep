# House Robber III — answer outline

**Prompt:** Houses form a **binary tree**. `root` is the only entrance. Robbing two **directly linked** houses (parent–child) alerts the police. Return the maximum you can rob. (LeetCode 337)

This is **tree DP**, cousin of [coding-house-robber.md](coding-house-robber.md) (path) and [coding-house-robber-ii.md](coding-house-robber-ii.md) (cycle). Same “take vs skip” as 198, but each node returns a **pair**. NeetCode 150 trees / 1D-DP box. Wikipedia [tree traversal](https://en.wikipedia.org/wiki/Tree_traversal) (post-order) and [dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming).

## Probes

- Adjacent means **parent–child only**. Cousins / siblings may both be robbed.
- Returning only a single `max` from each subtree forces a second walk or a cache.
- Naive “rob + grandchildren vs skip + children” without memo is exponential (`n` up to 10⁴).
- Answer at the root is `max(rob, skip)` — not always `rob`.

## Strong answer skeleton — pair per node

1. **Clarify:** empty → `0`; values ≥ 0; `n` up to 10⁴ (recursion depth / memo matters).
2. **Post-order** `dfs(node) → (rob, skip)`:
   - `rob = node.val + left.skip + right.skip`
   - `skip = max(left.rob, left.skip) + max(right.rob, right.skip)`
3. **Null** returns `(0, 0)`.
4. **Answer:** `max(*dfs(root))`.
5. **Complexity:** O(n) time, O(h) stack (worst O(n) skew).

Memo-map twin: cache `rob(node)` as `max(take, skip)` and recurse on children / grandchildren — same asymptotics if you hit every node once; the pair return avoids the hash.

## Sketch

```
def rob(root):
  def dfs(node):
    if not node:
      return (0, 0)          # rob, skip
    lr, ls = dfs(node.left)
    rr, rs = dfs(node.right)
    take = node.val + ls + rs
    skip = max(lr, ls) + max(rr, rs)
    return (take, skip)
  return max(dfs(root))
```

`[3,2,3,null,3,null,1]` → **7** (`3+3+1`). `[3,4,5,1,3,null,1]` → **9** (`4+5`).

## Mock narration (30 sec)

> “Each house is take-or-skip. If I take this node I must skip both children; if I skip it I take the better of each child’s pair. I walk post-order and return both numbers so I never recompute a subtree.”

## Common mistakes

- Treating it as a path / only root-to-leaf (siblings are allowed).
- Recursing on grandchildren **without** memo — TLE on a chain.
- Returning `take` only at the root (optimal may skip the root).
- Mutating the tree or storing answers on `node.val` without saying so.
- Confusing with [coding-max-path-sum.md](coding-max-path-sum.md): that is a **path of edges**, not an independent set.

## Follow-ups

- **House Robber (198)** — the linear helper; already outlined.
- **House Robber II (213)** — circle; two linear runs.
- Print the chosen nodes (keep prev pointers or a second pass).
- General tree (n-ary): same pair; `skip` sums `max(child)` over children.

## Sources

- [House Robber III — NeetCode](https://neetcode.io/solutions/house-robber-iii) — accessed 2026-10-13
- [337. House Robber III — LeetCode Wiki](https://leetcode.doocs.org/en/lc/337/) — accessed 2026-10-13
- [House Robber III — LeetCode 337](https://leetcode.com/problems/house-robber-iii/) — accessed 2026-10-13
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-10-13
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-13
