# Lowest Common Ancestor — answer outline

**Prompt (BST, LeetCode 235):** Unique-key BST; nodes `p` and `q` both exist. Return their **lowest common ancestor**. A node **may be** an ancestor of itself.

**Prompt (binary tree, LeetCode 236):** Same definition, but the tree is **not** ordered.

Wikipedia-style definition: deepest node that has both as descendants. BST cousin of [coding-validate-bst.md](coding-validate-bst.md). Listed under trees in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- BST: walk with **value comparisons** — O(h), iterative O(1) extra.
- General tree: cannot compare values; recurse both sides — O(n).
- Inclusive split: if `p` or `q` **is** the current node, that node is the LCA (do not walk past it).
- Interview BST is usually **strict** unique keys; confirm `p != q` and both present (classic 235/236 guarantee).

## Strong answer skeleton — BST (preferred first)

1. **Clarify:** BST vs general tree; return the **node**, not the value; ancestor-of-self allowed.
2. From `cur = root`: if both keys `< cur.val`, go left; if both `> cur.val`, go right; else **split** (or one equals `cur`) → return `cur`.
3. Iterative walk is enough; recursion is the same logic with an O(h) stack.
4. **Complexity:** O(h) time; O(1) iterative / O(h) recursive.

## Sketch (BST iterative)

```
cur = root
while cur:
  if p.val < cur.val and q.val < cur.val:
    cur = cur.left
  elif p.val > cur.val and q.val > cur.val:
    cur = cur.right
  else:
    return cur
```

Example: root `20`, left `8` / right `22`; `8` has `4` and `12`; `12` has `10` and `14`. LCA(`4`,`14`) = **8**. LCA(`10`,`14`) = **12**. LCA(`8`,`8`’s child) = **8**.

## Strong answer skeleton — general binary tree

1. If `node` is `None` or `node` is `p` or `q`, return `node`.
2. `L = lca(left)`, `R = lca(right)`.
3. If both non-null, `node` is the split. Else return the non-null side (or `None`).
4. Relies on **both nodes existing**. If a node might be missing, you need an extra “found” flag.

## Mock narration (30 sec)

> “On a BST I do not DFS the whole tree. I walk from the root until p and q split — that node is the lowest ancestor, including the case where one of them is the node itself. If it is not a BST I search both subtrees and take the node where both sides report a hit.”

## Common mistakes

- Treating 235 like 236 (full-tree DFS) and missing the O(h) signal.
- Strict inequalities that **skip** the node when `p` or `q` equals `cur`.
- Returning a **value** instead of the node pointer.
- Parent-pointer / path-to-root sets when they asked for the BST walk.
- 236 without the “both exist” assumption — a lone hit might be a false ancestor.

## Follow-ups

- **LCA of a BST vs BST validation:** same order property; 235 walks, 98 checks bounds.
- **Kth smallest (230):** inorder, not LCA.
- **Parent pointers:** walk depths, then climb together (space O(1) if parents exist).

## Sources

- [Lowest Common Ancestor of a Binary Search Tree — NeetCode](https://neetcode.io/solutions/lowest-common-ancestor-of-a-binary-search-tree) — accessed 2026-09-11
- [Lowest Common Ancestor in a Binary Search Tree — GeeksforGeeks](https://www.geeksforgeeks.org/dsa/lowest-common-ancestor-in-a-binary-search-tree/) — accessed 2026-09-11
- [Binary search tree — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_tree) — accessed 2026-09-11
- [Lowest common ancestor — Wikipedia](https://en.wikipedia.org/wiki/Lowest_common_ancestor) — accessed 2026-09-11
- Classic LeetCode #235 / #236 — BST walk vs postorder split
