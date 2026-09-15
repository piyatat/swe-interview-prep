# Invert Binary Tree — answer outline

**Prompt:** Given the root of a binary tree, invert it (mirror left/right at **every** node) and return the root. (LeetCode 226)

Wikipedia-style **mirror**: swap the left and right subtrees recursively so the inorder sequence reverses. Same visit-every-node skeleton as [coding-level-order.md](coding-level-order.md) (BFS queue) and [coding-serialize-tree.md](coding-serialize-tree.md) (DFS walk). Blind 75 / NeetCode 150 trees box; famous as a Google-era “too simple until you code it cleanly” filter.

## Probes

- Empty tree → `None`. Single node → itself.
- Swap **pointers**, not values (values stay on their nodes).
- Must invert **every** level, not only the root’s two children.
- Recursion vs iterative BFS / explicit stack — all O(n) time.

## Strong answer skeleton — recursive DFS

1. **Clarify:** binary tree (not BST invariants); mutate in place is fine; return the same root object.
2. If `root is None`: return `None`.
3. Swap `root.left` and `root.right`.
4. Recurse on **both** children (already swapped — names follow the new pointers).
5. Return `root`. Θ(n) time; O(h) stack (skew = n).

Swap-then-recurse and recurse-then-swap both work if you recurse on the **original** children (save them first) or on the swapped ones consistently.

## Sketch (DFS)

```
if not root: return None
root.left, root.right = root.right, root.left
invert(root.left)
invert(root.right)
return root
```

`[4,2,7,1,3,6,9]` → `[4,7,2,9,6,3,1]`. `[]` → `[]`.

## Strong answer skeleton — BFS

Queue the root. While queue: pop, swap its children, enqueue non-null children. Same Θ(n); extra O(w) like level-order. Use this if they ban recursion.

## Mock narration (30 sec)

> “Inverting is swapping left and right at every node. I swap here, then invert both children. Null is a no-op. Linear in the number of nodes; stack depth is the height.”

## Common mistakes

- Swapping values (`left.val, right.val`) and leaving structure (breaks when a child is missing).
- Recursing only on one side after the swap.
- Forgetting the null base case.
- Claiming O(1) extra space while using recursion on a skew tree.
- Returning a **new** tree unnecessarily and dropping the original root.

## Follow-ups

- **Same Tree (100):** compare structure + values; two-pointer DFS.
- **Symmetric Tree (101):** is mirror of itself — invert-or-compare left vs right.
- **Invert N-ary:** reverse the children list at each node.
- **Level order after invert:** [coding-level-order.md](coding-level-order.md) on the result.
- **Serialize:** inverted tree must round-trip if they chain [coding-serialize-tree.md](coding-serialize-tree.md).

## Sources

- [Invert Binary Tree — NeetCode](https://neetcode.io/solutions/invert-binary-tree) — accessed 2026-09-15
- [Invert Binary Tree — LeetCode 226](https://leetcode.com/problems/invert-binary-tree/) — accessed 2026-09-15
- [Binary tree — Wikipedia](https://en.wikipedia.org/wiki/Binary_tree) — accessed 2026-09-15
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-09-15
- Classic LeetCode #226 — swap children at every node
