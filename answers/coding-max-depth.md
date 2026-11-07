# Maximum Depth of Binary Tree — answer outline

**Prompt:** Given the `root` of a binary tree, return its **depth**: number of nodes on the longest root→leaf path. Empty tree → `0`. (LeetCode 104)

This is the **tree-recursion baseline** in the NeetCode 150 / Blind 75 trees box. Cousin of [coding-diameter-tree.md](coding-diameter-tree.md) (depth as a byproduct) and [coding-balanced-tree.md](coding-balanced-tree.md) (poison if heights differ by >1). Wikipedia [Tree traversal](https://en.wikipedia.org/wiki/Tree_traversal): DFS post-order, or BFS level count.

## Probes

- Null root is `0`, not `1`. A single node is `1`.
- Depth vs height naming: here they want **nodes on the path**, not edges (`nodes = edges + 1` on a non-empty path).
- Recursion vs explicit stack vs BFS queue — all O(n); say the space (skew → O(n)).
- “Can you do it without recursion?” → BFS: answer is the number of levels you dequeue.

## Strong answer skeleton — DFS

1. **Clarify:** empty tree; one node; skewed vs balanced; count **nodes**.
2. **Base:** `root is None` → `0`.
3. **Recur:** `1 + max(depth(left), depth(right))`.
4. **Iterative DFS:** stack of `(node, depthSoFar)`; track a running max.
5. **Complexity:** O(n) time (must see every node in the worst case); O(h) recursion / O(w) BFS space.

Do **not** stop at the first leaf. The longest path may be the other child.

## Sketch (recursive)

```
def maxDepth(root):
  if root is None: return 0
  return 1 + max(maxDepth(root.left), maxDepth(root.right))
```

`[1,2,3,null,null,4]` → `3`. `[]` → `0`. `[1]` → `1`.

BFS: queue the root; while queue: `level = len(queue)`; pop that many, enqueue children; `depth += 1`. Return `depth`.

## Mock narration (30 sec)

> “Depth is one plus the deeper child. Null is zero, so a leaf returns one. I’ll recurse both sides and take max — same information a BFS level-count would give, with O(height) stack instead of a queue.”

## Common mistakes

- Returning `1` for `None` (off-by-one on every path).
- Counting **edges** (`max(left,right)` without `+1`, or `+1` only on leaves).
- Walking only the left child “because that’s the chain in the drawing.”
- Claiming O(1) extra space on a recursive solution for a 10k-node skew tree.
- Mixing 0-based **level** (root = 0) with this problem’s 1-based node count.

## Follow-ups

- **Diameter (543):** two heights at a node — [coding-diameter-tree.md](coding-diameter-tree.md).
- **Balanced (110):** |left−right| ≤ 1 everywhere — [coding-balanced-tree.md](coding-balanced-tree.md).
- **Min depth:** BFS until the **first** leaf (do not DFS-max).
- **N-ary depth:** `1 + max(child depths)` over the children list.

## Sources

- [104. Maximum Depth of Binary Tree — LeetCode](https://leetcode.com/problems/maximum-depth-of-binary-tree/) — accessed 2026-11-07
- [Maximum Depth of Binary Tree — NeetCode](https://neetcode.io/solutions/maximum-depth-of-binary-tree) — accessed 2026-11-07
- [104. Maximum Depth of Binary Tree — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/104/) — accessed 2026-11-07
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-11-07
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-07
