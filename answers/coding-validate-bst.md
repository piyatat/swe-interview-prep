# Validate BST — answer outline

**Prompt:** Given the root of a binary tree, return whether it is a **valid binary search tree**. (LeetCode 98)

Wikipedia: every node’s key is **greater than all keys in its left subtree** and **less than all keys in its right subtree** (interview BST is usually **strict** — no duplicates). This is a **global** property, not “left child < parent < right child.”

Tree cousin of [coding-binary-search.md](coding-binary-search.md) (ordered space). Listed under trees in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Naive parent/child check fails on a right-grandchild that violates an ancestor.
- Bounds DFS vs inorder “strictly increasing.”
- Inclusive vs exclusive bounds; `Integer.MIN_VALUE` / `MAX_VALUE` nodes — use **wider** sentinels (`long` / `±inf`), not `min+1`.
- Empty tree: valid. One node: valid.
- Duplicates: LeetCode 98 forbids equals; say your policy if they allow a multiset BST.

## Strong answer skeleton — bounds (preferred)

1. Recurse with `(node, lo, hi)` meaning `lo < node.val < hi` (open interval).
2. Root starts at `(-∞, +∞)`.
3. Left child: `(lo, node.val)`. Right child: `(node.val, hi)`.
4. Null → true. Violation → false. Both subtrees must hold.
5. O(n) time, O(h) stack (skewed worst O(n)).

## Bounds sketch

```
def valid(node, lo, hi):
  if node is None: return True
  if not (lo < node.val < hi): return False
  return valid(node.left, lo, node.val) and valid(node.right, node.val, hi)

return valid(root, -inf, +inf)
```

Counterexample the naive check misses: `root=5`, left=`3`, left-right=`6` — 6 > 3 but 6 is not < 5.

## Inorder alternative

Inorder of a valid BST is **strictly increasing**. Keep `prev`; at each node, fail if `node.val <= prev`, then `prev = node.val`. Same O(n) / O(h). Bounds are easier to narrate (pure arguments, no mutable `prev`).

## Mock narration (30 sec)

> “Local child comparisons are not the BST invariant — every ancestor tightens a range. I’ll DFS with an open interval, start at ±infinity, push the current value as the new high on the left and new low on the right. Any node outside its interval fails. Alternatively, inorder must be strictly increasing.”

## Common mistakes

- Only comparing children.
- `<=` vs `<` (duplicates).
- Using `int` min/max as bounds so a legal `INT_MIN` node looks invalid.
- Returning true after checking one subtree and skipping the other.

## Follow-ups

- **Kth smallest in BST (230)** — inorder until k; or augmented subtree counts.
- **LCA in BST (235)** — walk from root; split when `p` and `q` are on different sides (or one equals the node).
- **Insert / delete** — still O(h); mention AVL / red-black if they ask worst-case.

## Sources

- [Binary search tree — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_tree) — accessed 2026-08-28
- [Validate Binary Search Tree walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/validate-binary-search-tree-interview-walkthrough/) — accessed 2026-08-28
- [Validate BST min/max bounds — Paul Epps](https://paulepps.substack.com/p/validate-bst-the-minmax-bounds-pattern) — accessed 2026-08-28
- [Validate BST range + inorder — DTDucas](https://dtducas.com/blog/validate-binary-search-tree) — accessed 2026-08-28
- Classic LeetCode #98 — ancestor-bounds / inorder family
