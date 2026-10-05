# Kth Smallest Element in a BST — answer outline

**Prompt:** Given the root of a BST and integer `k` (1-indexed), return the **k-th smallest** value. (LeetCode 230)

Inorder of a BST is sorted order — cousin of [coding-validate-bst.md](coding-validate-bst.md) (same walk, different stop) and [coding-binary-search.md](coding-binary-search.md) (ordered space). Wikipedia [Binary search tree](https://en.wikipedia.org/wiki/Binary_search_tree) / [Tree traversal](https://en.wikipedia.org/wiki/Tree_traversal). Blind 75 trees box.

## Probes

- Inorder left → node → right yields ascending keys; you can **stop at k**, not build the full array.
- Recursive vs iterative stack — iterative is easier to early-exit without a nonlocal `k`.
- Follow-up: many queries after inserts/deletes → store **subtree sizes**, walk like order-statistic tree.
- `k` is in `1..n` on the usual statement — still say what you return if not.
- Not “k-th smallest among children of root.”

## Strong answer skeleton — inorder until k

1. **Clarify:** BST invariant; 1-indexed `k`; unique keys on LeetCode 230.
2. **Naive:** dump inorder to a list, return `arr[k-1]`. O(n) time and space — say it, then improve.
3. **Early-exit inorder:** walk left spine, pop, decrement `k`; when `k == 0` return `node.val`; then go right.
4. **Complexity:** O(h + k) time typical (left spine + k pops), O(h) stack. Skewed: O(n).
5. **Augmented (follow-up):** `left_count = size(node.left)`. If `left_count == k-1` return node; if `left_count >= k` go left; else `k -= left_count + 1`, go right. Query O(h) after O(n) size fill (or maintain sizes on insert).

## Sketch

```
stk = []
cur = root
while cur or stk:
  while cur:
    stk.append(cur)
    cur = cur.left
  cur = stk.pop()
  k -= 1
  if k == 0:
    return cur.val
  cur = cur.right
```

Example: tree `3 / 1 4 / _ 2`, `k=1` → `1`. Same tree `k=3` → `3`.

Morris traversal can drop the stack to O(1) extra; mention only if they ask — easy to corrupt the tree if you forget to restore.

## Mock narration (30 sec)

> “A BST’s inorder is already sorted, so I don’t need a heap. I iterate inorder with a stack, count visits, and return on the k-th pop. If they want frequent queries, I would keep subtree sizes and binary-search the tree.”

## Common mistakes

- Heap / sort of all values — works but signals you missed the BST.
- Recursing both sides after you already found k.
- Off-by-one: decrementing on the left-spine **push** instead of the **visit**.
- Using `size(node)` as left count (includes self).
- Assuming a balanced tree so O(log n) without sizes.

## Follow-ups

- **Kth largest:** reverse inorder (right → node → left) or `n-k+1`-th smallest.
- **Validate BST:** same walk; check strictly increasing ([coding-validate-bst.md](coding-validate-bst.md)).
- **LCA in BST:** walk from root; do not inorder the whole tree.

## Sources

- [Kth Smallest Element in a BST — NeetCode](https://neetcode.io/solutions/kth-smallest-element-in-a-bst) — accessed 2026-10-05
- [230. Kth Smallest Element in a BST — LeetCode Wiki](https://leetcode.doocs.org/en/lc/230/) — accessed 2026-10-05
- [Kth Smallest Element in a BST — LeetCode 230](https://leetcode.com/problems/kth-smallest-element-in-a-bst/) — accessed 2026-10-05
- [Binary search tree — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_tree) — accessed 2026-10-05
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-10-05
