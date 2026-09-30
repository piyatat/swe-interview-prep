# Binary Tree Right Side View — answer outline

**Prompt:** Standing on the **right** of a binary tree, return node values visible from top to bottom. (LeetCode 199)

This is **one value per depth**, not [coding-level-order.md](coding-level-order.md) (full width lists). Same BFS width-loop; keep the **last** node of each level (or enqueue **right child first** and take the front). Wikipedia [BFS](https://en.wikipedia.org/wiki/Breadth-first_search): explore depth *d* before *d+1*. NeetCode 150 trees box.

## Probes

- Empty tree → `[]`.
- Right spine missing: a deeper **left** child can still be visible (`[1,2,3,4,null,null,null,5]` → `[1,3,4,5]`).
- Walking **only** `node.right` is wrong.
- Left-first DFS that **appends once** captures the **left** side unless you overwrite or visit right first.

## Strong answer skeleton — BFS

1. **Clarify:** binary tree; top-to-bottom; one node per depth.
2. If `root is None`: return `[]`. Enqueue root.
3. While queue: snapshot `width = len(q)`; for `i in 0..width-1`: pop, enqueue left then right, remember `node` as `rightmost`.
4. After the inner loop, append `rightmost.val`. Θ(n) time, O(w) extra.

Variant: enqueue **right then left**; the first node of each width loop is the visible one — same Θ(n).

## Sketch (last-of-level)

```
if not root: return []
q, out = deque([root]), []
while q:
  rightmost = None
  for _ in range(len(q)):
    node = q.popleft()
    rightmost = node
    if node.left: q.append(node.left)
    if node.right: q.append(node.right)
  out.append(rightmost.val)
return out
```

`[1,2,3,null,5,null,4]` → `[1,3,4]`. Single right child `[1,null,2]` → `[1,2]`.

## Strong answer skeleton — DFS (right first)

`dfs(node, depth)`: if `depth == len(out)`, append `val` (first visit at that depth). Recurse **right**, then left. Same Θ(n); stack O(h). Prefer BFS unless they ban queues.

## Mock narration (30 sec)

> “Visible from the right means the last node at each depth. I’ll BFS with a width snapshot, same as level order, and record the last pop of each level. If the right subtree is short, a left child at a deeper level still gets its own row.”

## Common mistakes

- Returning the whole right spine.
- No width snapshot (children leak into this level).
- Left-first DFS with “append if new depth” and never visiting right first.
- Forgetting empty root.
- Claiming O(1) extra space (queue / recursion is O(w) or O(h)).

## Follow-ups

- **Left side view:** first node of each width loop (or left-first DFS).
- **Full level order:** keep the list, not only the last — [coding-level-order.md](coding-level-order.md).
- **N-ary:** last child in the children list is not always “rightmost on screen” — define the view.

## Sources

- [Binary Tree Right Side View — NeetCode](https://neetcode.io/solutions/binary-tree-right-side-view) — accessed 2026-09-30
- [Binary Tree Right Side View — LeetCode 199](https://leetcode.com/problems/binary-tree-right-side-view/) — accessed 2026-09-30
- [199. Binary Tree Right Side View — LeetCode Wiki](https://leetcode.doocs.org/en/lc/199/) — accessed 2026-09-30
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-09-30
