# Binary Tree Zigzag Level Order — answer outline

**Prompt:** Return node values **level by level**, alternating direction: level 0 left→right, level 1 right→left, then alternate. (LeetCode 103)

This is [coding-level-order.md](coding-level-order.md) plus a **direction flag**. Same BFS width snapshot as [coding-right-side-view.md](coding-right-side-view.md). Wikipedia [BFS](https://en.wikipedia.org/wiki/Breadth-first_search) / [Tree traversal](https://en.wikipedia.org/wiki/Tree_traversal). NeetCode 150 trees box.

## Probes

- Empty tree → `[]`, not `[[]]`. Single node → `[[val]]`.
- **Always enqueue left then right.** Zigzag is an **output** transform. Reversing child enqueue order corrupts later levels.
- Snapshot `len(q)` before the inner loop — same trap as LC 102.
- Reverse (or prepend) **after** the level is collected, or write into a sized array from both ends.

## Strong answer skeleton — BFS + reverse odd levels

1. **Clarify:** binary tree; level 0 is L→R; include every non-empty level.
2. If `root is None`: return `[]`. Enqueue root. `left_to_right = True`.
3. While queue: freeze width; drain that many nodes; append children left-then-right; if not `left_to_right`, reverse the level list; toggle the flag.
4. **Complexity:** Θ(n) time, O(w) queue. Reversing a level is still O(n) overall.

## Sketch (collect, then reverse)

```
if not root: return []
q, out, l2r = deque([root]), [], True
while q:
  level = []
  for _ in range(len(q)):
    node = q.popleft()
    level.append(node.val)
    if node.left: q.append(node.left)
    if node.right: q.append(node.right)
  out.append(level if l2r else level[::-1])
  l2r = not l2r
return out
```

`[3,9,20,null,null,15,7]` → `[[3],[20,9],[15,7]]`. `[1,2,3,4,5,6,7]` → `[[1],[3,2],[4,5,6,7]]`.

Optional: pre-size `level` and fill `i` or `width-1-i` so you never reverse. DFS-by-depth then reverse odd lists is a fine follow-up, not the first answer.

## Mock narration (30 sec)

> “I do ordinary level-order BFS and freeze the queue width each depth. Children always go left then right. After I have the values, I reverse every other level. Traversal order stays BFS; only the recorded order zigzags.”

## Common mistakes

- Enqueue right-then-left on odd levels — next level’s visitation is now wrong.
- Toggling the flag **per node** instead of **per level**.
- `list.insert(0, val)` on a Python list → O(n·w) on a wide tree; use reverse or a deque.
- Forgetting empty root.
- Using a stack and emitting zigzag DFS by accident.

## Follow-ups

- **Level order (LC 102):** drop the reverse — [coding-level-order.md](coding-level-order.md).
- **Right side view (LC 199):** last of each width loop.
- **Bottom-up (LC 107):** BFS then reverse `out`.
- **N-ary zigzag:** same flag; enqueue all children in listed order.

## Sources

- [Binary Tree Zigzag Level Order Traversal — NeetCode](https://neetcode.io/solutions/binary-tree-zigzag-level-order-traversal) — accessed 2026-10-06
- [103. Binary Tree Zigzag Level Order Traversal — LeetCode Wiki](https://leetcode.doocs.org/en/lc/103/) — accessed 2026-10-06
- [Binary Tree Zigzag Level Order Traversal — LeetCode 103](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/) — accessed 2026-10-06
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-10-06
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-10-06
