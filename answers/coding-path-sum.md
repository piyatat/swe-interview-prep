# Path Sum — answer outline

**Prompt:** Given `root` and `targetSum`, return whether a **root-to-leaf** path sums to `targetSum`. A leaf has **no children**. Empty tree → `false` even if target is `0`. (LeetCode 112)

This is **DFS that tests the remaining sum only at a leaf**, cousin of [coding-max-depth.md](coding-max-depth.md) (same walk, different combine) and **not** [coding-max-path-sum.md](coding-max-path-sum.md) (any node-to-node, values may be negative). NeetCode 250 trees. Wikipedia [depth-first search](https://en.wikipedia.org/wiki/Depth-first_search): walk a branch fully, then backtrack.

## Probes

- Leaf = **both** children null. A node with one child is **not** a leaf — do not accept a match there.
- Empty tree is `false` (`targetSum == 0` does not save it).
- Node values and target may be **negative** — pruning on `remaining < 0` is wrong.
- Recursion vs explicit stack vs BFS `(node, remaining)` — all O(n); skew → O(n) space.

## Strong answer skeleton

1. **Clarify:** root-to-leaf only; empty; negatives; return bool (112) vs list of paths (113).
2. **Base:** `root is None` → `false`.
3. **At a leaf:** `root.val == remaining` (or running sum == target).
4. **Else:** `dfs(left, remaining - val) or dfs(right, remaining - val)`. Short-circuit is fine.
5. **Complexity:** O(n) time; O(h) recursion.

Do **not** store the path unless they ask 113.

## Sketch

```
def hasPathSum(root, target):
  if root is None: return False
  if root.left is None and root.right is None:
    return root.val == target
  rest = target - root.val
  return hasPathSum(root.left, rest) or hasPathSum(root.right, rest)
```

`[5,4,8,11,null,13,4,7,2,null,null,null,1]`, target `22` → `true` (`5-4-11-2`). `[]`, `0` → `false`.

BFS twin: queue `(node, remaining)`; at a leaf check equality.

## Mock narration (30 sec)

> “I subtract as I go and only compare at a leaf — a node with one child is not a leaf. Null is false, so an empty tree never matches. Either child can succeed. Linear time, height of stack.”

## Common mistakes

- Treating a **one-child** node as a leaf.
- Returning `true` for `None` when remaining is `0`.
- Pruning on negative remaining (values can be negative).
- Checking the sum at every node (that is a different problem).
- Confusing with **124** (any path, can start/end mid-tree) or **437** (any downward path, not from root).

## Follow-ups

- **Path Sum II (113):** collect every matching path; push/pop the node.
- **Path Sum III (437):** prefix-sum on the walk; paths need not start at root.
- **Max path sum (124):** [coding-max-path-sum.md](coding-max-path-sum.md).
- **Min depth:** BFS until the **first** leaf — [coding-max-depth.md](coding-max-depth.md).

## Sources

- [112. Path Sum — LeetCode](https://leetcode.com/problems/path-sum/) — accessed 2026-11-17
- [Path Sum — NeetCode](https://neetcode.io/solutions/path-sum) — accessed 2026-11-17
- [112. Path Sum — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/112/) — accessed 2026-11-17
- [Depth-first search — Wikipedia](https://en.wikipedia.org/wiki/Depth-first_search) — accessed 2026-11-17
- [NeetCode 250 list — DSA Prep](https://www.dsaprep.dev/sheets/neetcode-250) — accessed 2026-11-17
