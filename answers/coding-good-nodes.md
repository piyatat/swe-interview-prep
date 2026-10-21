# Count Good Nodes in Binary Tree — answer outline

**Prompt:** A node `X` is **good** if no node on the path from the root to `X` has a value **strictly greater** than `X`. Return how many nodes are good. The root is always good. Values may be **negative**. (LeetCode 1448)

This is **DFS (or BFS) that carries the path maximum**, not “count nodes ≥ root.” Cousin of [coding-max-path-sum.md](coding-max-path-sum.md) (post-order gain) and [coding-validate-bst.md](coding-validate-bst.md) (bounds travel with the walk). NeetCode 150 trees box.

## Probes

- **`>=` not `>`** — ties on the path are good. `>` misses the root and equal-valued ancestors.
- Root is always good (`n ≥ 1` in the classic statement).
- Values go negative (`[-10^4, 10^4]`) — do **not** seed `maxSoFar = 0`.
- `n` up to `10^5` — a per-node ancestor walk is O(n²). One pass.
- Path max is **per root-to-node path**. A global max poisons sibling subtrees.

## Strong answer skeleton — DFS with path max

1. **Clarify:** empty tree (if allowed) → `0`; root always counts; equals are good; left/right independent.
2. Walk from the root carrying `maxSoFar` = the largest value **already seen on this path** (seed with `root.val` or a value below the lower bound).
3. If `node.val >= maxSoFar`, count `1`. Then pass `max(maxSoFar, node.val)` to both children.
4. **Iterative:** explicit stack or BFS queue of `(node, maxSoFar)` — same recurrence; use a stack if they fear recursion depth on a chain of `10^5`.
5. **Complexity:** O(n) time. O(h) recursion or O(n) worst-case stack/queue.

Do **not** store the whole ancestor list. The running max is a sufficient statistic.

## Sketch

```
def goodNodes(root):
  def dfs(node, mx):
    if not node: return 0
    add = 1 if node.val >= mx else 0
    mx = max(mx, node.val)
    return add + dfs(node.left, mx) + dfs(node.right, mx)
  return dfs(root, root.val)
```

`[3,1,4,3,null,1,5]` → **4** (root 3, left-child 3, 4, 5). `[3,3,null,4,2]` → **3** (2 is not good). `[1]` → **1**.

## Mock narration (30 sec)

> “A node is good when it is a max on its own root path. I DFS and carry that max. I count when the value is at least the max so far, then I push the new max to both kids. Same idea with a queue of pairs if they want iterative. Linear in the nodes.”

## Common mistakes

- Using `>` so the root or a tie does not count.
- Seeding `mx = 0` and dropping a negative root or a negative-but-still-max node.
- One mutable `mx` shared across siblings (left’s update breaks right).
- Re-scanning ancestors at every node (TLE at 10⁵).
- Comparing to the **global** tree max (that is a different problem).

## Follow-ups

- **Return the good nodes**, not the count.
- **Strictly greater** than every ancestor (exclude ties) — flip `>=` to `>`.
- **Path sum / max-path** — [coding-max-path-sum.md](coding-max-path-sum.md); different combine.
- **Validate BST bounds** — same “state travels down,” different predicate.

## Sources

- [Count Good Nodes in Binary Tree — NeetCode](https://neetcode.io/solutions/count-good-nodes-in-binary-tree) — accessed 2026-10-21
- [1448. Count Good Nodes in Binary Tree — LeetCode Wiki](https://leetcode.doocs.org/en/lc/1448/) — accessed 2026-10-21
- [Count Good Nodes in Binary Tree — LeetCode 1448](https://leetcode.com/problems/count-good-nodes-in-binary-tree/) — accessed 2026-10-21
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-10-21
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-21
