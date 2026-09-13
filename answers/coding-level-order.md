# Binary Tree Level Order Traversal — answer outline

**Prompt:** Return the values of a binary tree **level by level**, left to right, as a list of lists. (LeetCode 102)

Wikipedia [BFS](https://en.wikipedia.org/wiki/Breadth-first_search): explore all nodes at the current depth before the next; a **queue** holds the frontier. This is the tree-BFS template behind [coding-rotting-oranges.md](coding-rotting-oranges.md) (level = minute) and the BFS codec in [coding-serialize-tree.md](coding-serialize-tree.md). Distinct from DFS preorder / inorder. NeetCode 150 trees box.

## Probes

- Empty tree → `[]`, not `[[]]`.
- Snapshot `len(q)` **before** the inner loop — that is the level width. Do not `for node in q` while you append children.
- Left child then right — order is part of the spec.
- Wide level uses O(w) queue memory (complete tree w ≈ n/2).

## Strong answer skeleton — BFS

1. **Clarify:** binary tree (not N-ary unless they switch); include every level that has a node.
2. If `root is None`: return `[]`. Enqueue root.
3. While queue: `width = len(q)`; build `level`; repeat `width` times: pop, append `val`, enqueue existing children.
4. Append `level` to the answer. Θ(n) time, O(w) extra space.

## Sketch (queue + width)

```
if not root: return []
q, out = deque([root]), []
while q:
  level = []
  for _ in range(len(q)):
    node = q.popleft()
    level.append(node.val)
    if node.left: q.append(node.left)
    if node.right: q.append(node.right)
  out.append(level)
return out
```

`[3,9,20,null,null,15,7]` → `[[3],[9,20],[15,7]]`. Single node → `[[1]]`.

## Strong answer skeleton — DFS with depth

`dfs(node, d)`: append `val` to `out[d]` (create the list when `d == len(out)`). Left then right. Same Θ(n). Recursion depth O(h). Prefer BFS in a 45-min unless they ban queues — DFS is the usual follow-up, not the first answer.

## Mock narration (30 sec)

> “Level order is BFS: the queue holds one level at a time. I freeze the queue length, drain that many nodes, and their children become the next level. That gives me a list per depth without a depth field on the node.”

## Common mistakes

- Forgetting the empty-tree case (`[[]]`).
- Using a stack / recursion-first and emitting preorder while calling it level order.
- Mixing children into the current level (no width snapshot).
- Right-then-left enqueue.
- `pop` from a list (end) instead of `popleft` — that is not BFS.

## Follow-ups

- **Zigzag (LC 103):** reverse every other `level` (or deque pop left vs right).
- **Right side view (LC 199):** last node of each width loop.
- **Average / max per level:** same width loop, reduce the values.
- **N-ary:** enqueue all children; same width trick.
- **Bottom-up (LC 107):** BFS then reverse `out`, or DFS insert at `0`.

## Sources

- [Binary Tree Level Order Traversal — NeetCode](https://neetcode.io/solutions/binary-tree-level-order-traversal) — accessed 2026-09-13
- [Binary Tree Level Order Traversal — LeetCode 102](https://leetcode.com/problems/binary-tree-level-order-traversal/) — accessed 2026-09-13
- [102. Binary Tree Level Order Traversal — LeetCode Wiki](https://leetcode.doocs.org/en/lc/102/) — accessed 2026-09-13
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-09-13
- Classic LeetCode #102 — BFS with per-level queue width
