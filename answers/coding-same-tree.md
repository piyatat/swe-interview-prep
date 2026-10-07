# Same Tree — answer outline

**Prompt:** Given roots `p` and `q`, return whether the trees are **structurally identical** and every corresponding node has the **same value**. Empty trees are equal. (LeetCode 100)

This is **lockstep DFS (or BFS)** on two roots, cousin of [coding-invert-binary-tree.md](coding-invert-binary-tree.md) (same walk, mutate vs compare) and [coding-serialize-tree.md](coding-serialize-tree.md) (nulls are data). Wikipedia [Binary tree](https://en.wikipedia.org/wiki/Binary_tree) / [Tree traversal](https://en.wikipedia.org/wiki/Tree_traversal). NeetCode 150 trees box.

## Probes

- Null handling **before** `.val` — one empty, one not → false; both empty → true.
- Structure vs values: `[1,2]` vs `[1,null,2]` is false even if an inorder dump looks close.
- Recursion vs explicit stack vs two queues — same O(n); say the stack/queue bound.
- Early exit: first mismatch, not a full walk of the larger tree.

## Strong answer skeleton — paired DFS

1. **Clarify:** null roots allowed; values may repeat; “same” means shape **and** values.
2. **Base:** `p` and `q` both null → true; exactly one null → false; `p.val != q.val` → false.
3. **Recur:** `same(p.left, q.left) and same(p.right, q.right)`.
4. **Iterative alt:** stack or two BFS queues of **pairs**; enqueue children only after a value match; check child **presence** before enqueue (missing left vs present left).
5. **Complexity:** O(min(m, n)) time to the first mismatch (worst O(n)); O(h) recursion or O(w) BFS space.

Do **not** serialize both to strings unless you encode nulls. A values-only traversal is wrong.

## Sketch

```
def same(p, q):
  if p is None and q is None: return True
  if p is None or q is None or p.val != q.val: return False
  return same(p.left, q.left) and same(p.right, q.right)
```

`[1,2,3]` vs `[1,2,3]` → true. `[1,2]` vs `[1,null,2]` → false. `[1,2,1]` vs `[1,1,2]` → false.

## Mock narration (30 sec)

> “I’ll walk both trees together. If both nodes are missing, that branch matches. If only one is missing or the values differ, I stop. Otherwise I compare left with left and right with right. Same idea works with two queues if they want iterative.”

## Common mistakes

- Reading `.val` before a null check.
- Comparing only values (or only inorder) and missing a shifted child.
- Recursing `p.left` with `q.right` (that is **symmetric tree**, LC 101).
- Claiming O(1) extra space on a skew tree while using recursion.
- Serializing without null markers (`1,2` vs `1,null,2`).

## Follow-ups

- **Subtree of Another Tree (572):** `same(root, sub)` or recur into children.
- **Symmetric Tree (101):** `same(left, mirrored right)`.
- **Invert then compare** — [coding-invert-binary-tree.md](coding-invert-binary-tree.md).
- Return the first mismatch node, or a diff of structures.

## Sources

- [Same Tree — NeetCode](https://neetcode.io/solutions/same-tree) — accessed 2026-10-07
- [100. Same Tree — LeetCode Wiki](https://leetcode.doocs.org/en/lc/100/) — accessed 2026-10-07
- [Same Tree — LeetCode 100](https://leetcode.com/problems/same-tree/) — accessed 2026-10-07
- [Binary tree — Wikipedia](https://en.wikipedia.org/wiki/Binary_tree) — accessed 2026-10-07
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-10-07
