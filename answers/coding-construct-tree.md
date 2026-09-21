# Construct Binary Tree from Preorder and Inorder — outline

**Prompt:** Arrays `preorder` and `inorder` of the **same** binary tree (unique values). Rebuild and return the root. (LeetCode 105)

Wikipedia [tree traversal](https://en.wikipedia.org/wiki/Tree_traversal): **preorder** is root → left → right; **inorder** is left → root → right. Preorder alone (or inorder alone) does **not** fix the shape. Together they do. Cousin of [coding-serialize-tree.md](coding-serialize-tree.md) (you **choose** the format) and [coding-lowest-common-ancestor.md](coding-lowest-common-ancestor.md). Blind 75 / NeetCode 150 trees box.

## Probes

- Values are **unique** on the classic problem — that is why an inorder index map is legal.
- Empty arrays → `None`. Single node → that node.
- Preorder `[root, ...left_pre, ...right_pre]`. Inorder `[...left_in, root, ...right_in]`. Left size = inorder index of root − left bound.
- They want **O(n)** after the map, not `inorder.index` at every node (O(n²) skew).

## Strong answer skeleton — map + DFS bounds

1. **Clarify:** general binary tree; unique ints; return `TreeNode`.
2. Build `pos[val] = index in inorder` once.
3. Walk preorder **left-to-right** with an index `i` (or pass `pre_lo`). `dfs(in_lo, in_hi)` builds the subtree whose inorder slice is `[in_lo, in_hi]`.
4. If `in_lo > in_hi`, return `None`. Else root = `preorder[i++]`, `mid = pos[root]`, left = `dfs(in_lo, mid-1)`, right = `dfs(mid+1, in_hi)`.
5. **Must build left before right** so `i` consumes the left preorder chunk first. Θ(n) time, O(n) map + O(h) stack.

## Sketch (shared preorder index)

```
pos = {v: i for i, v in enumerate(inorder)}
i = 0
def dfs(lo, hi):
  nonlocal i
  if lo > hi: return None
  root = TreeNode(preorder[i]); i += 1
  mid = pos[root.val]
  root.left  = dfs(lo, mid-1)
  root.right = dfs(mid+1, hi)
  return root
return dfs(0, n-1)
```

`preorder = [3,9,20,15,7]`, `inorder = [9,3,15,20,7]` → root `3`, left `9`, right `20` with `15`/`7`.

Slicing (`preorder[1:mid+1]`, `inorder[:mid]`) is the same split but copies arrays — fine to **explain**, then switch to indices.

## Mock narration (30 sec)

> “Preorder gives the next root. That value splits inorder into left and right. I map inorder once so the split is O(1), then recurse left before right so the preorder cursor stays aligned. Linear nodes, no rescan.”

## Common mistakes

- Searching inorder with `.index` on every call — worst-case quadratic on a skew tree.
- Building **right** first while using a shared preorder pointer (cursor walks the wrong chunk).
- Off-by-one on `mid-1` / `mid+1` or using `lo >= hi` so a single node vanishes.
- Assuming a BST and walking values as if they were sorted (this is **not** 108 / 105-as-BST).
- Forgetting the empty-tree base case.

## Follow-ups

- **Postorder + inorder (106):** last postorder value is the root; build **right** before left if you consume postorder from the end.
- **Preorder + postorder (889):** ambiguous without extra assumptions (full tree / unique children).
- **Duplicates:** classic 105 forbids them; say you would need counts or another signal.
- **Serialize (297):** you emit nulls so **one** traversal is enough — opposite constraint.

## Sources

- [Construct Binary Tree from Preorder and Inorder — NeetCode](https://neetcode.io/solutions/construct-binary-tree-from-preorder-and-inorder-traversal) — accessed 2026-09-21
- [Construct Binary Tree from Preorder and Inorder — LeetCode 105](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/) — accessed 2026-09-21
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-09-21
- [Binary tree — Wikipedia](https://en.wikipedia.org/wiki/Binary_tree) — accessed 2026-09-21
- Classic LeetCode #105 — preorder root + inorder split
