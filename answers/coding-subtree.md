# Subtree of Another Tree — answer outline

**Prompt:** Given roots `root` and `subRoot`, return whether `root` contains a **subtree** identical to `subRoot` (same structure and values). A tree is a subtree of itself. (LeetCode 572)

This is **walk + Same Tree**, cousin of [coding-same-tree.md](coding-same-tree.md) (the inner check) and [coding-serialize-tree.md](coding-serialize-tree.md) (nulls are data). Wikipedia [Tree traversal](https://en.wikipedia.org/wiki/Tree_traversal). NeetCode 150 trees box.

## Probes

- Subtree means a node **plus all descendants**, not “these values appear somewhere.”
- `[4,1,2]` inside `[3,4,5,1,2]` is true; the same shape with an extra child `0` is false.
- Call `same` **before** recursing into children, or you miss “root is the match.”
- Naive `O(n · m)` is in limits (`n ≤ 2000`, `m ≤ 1000`); say that out loud.

## Strong answer skeleton — nested same-tree

1. **Clarify:** empty `subRoot`? (constraints usually `m ≥ 1`; still define: empty is a subtree of everything, or ask.) Empty `root` with non-empty `subRoot` → false.
2. **Helper `same(p, q)`:** both null → true; one null → false; values differ → false; else `same(left) and same(right)` — same as LC 100.
3. **Search:** `same(root, subRoot)` **or** `isSubtree(root.left, subRoot)` **or** `isSubtree(root.right, subRoot)`.
4. **Early exit:** first true; do not walk the rest of `root`.
5. **Complexity:** worst O(n · m) time, O(h) recursion. Merkle / serialized-string match is an optional follow-up, not required.

Do **not** check “every `subRoot` value appears in `root`.” A BST search that only walks toward `subRoot.val` misses a match on the other side when values repeat.

## Sketch

```
def same(p, q):
  if not p and not q: return True
  if not p or not q or p.val != q.val: return False
  return same(p.left, q.left) and same(p.right, q.right)

def isSubtree(root, sub):
  if not root: return False
  return same(root, sub) or isSubtree(root.left, sub) or isSubtree(root.right, sub)
```

`root=[3,4,5,1,2]`, `sub=[4,1,2]` → true. Extra `0` under that `4` → false. `sub == root` → true.

## Mock narration (30 sec)

> “I’ll reuse Same Tree. At every node in the big tree I ask if this node is identical to the pattern. If not, I try the left child and the right. First hit wins; worst case I compare the pattern at every node.”

## Common mistakes

- Forgetting to test `same` at the **current** node (only searching children).
- Treating a **partial** overlap as a subtree (missing descendants).
- Using inorder / values-only equality — [coding-same-tree.md](coding-same-tree.md) traps apply.
- Claiming O(n) without a hash/serialization scheme you can defend.

## Follow-ups

- **Same Tree (100)** — the helper; already outlined.
- **Serialize both** with null markers, then substring search (watch overlapping encodings).
- Hash each subtree (Merkle) so `same` is O(1) after an O(n+m) pass — collisions if you skip a 64-bit pair.
- Count how many times `subRoot` appears, not just existence.

## Sources

- [Subtree of Another Tree — NeetCode](https://neetcode.io/solutions/subtree-of-another-tree) — accessed 2026-10-08
- [572. Subtree of Another Tree — LeetCode Wiki](https://leetcode.doocs.org/en/lc/572/) — accessed 2026-10-08
- [Subtree of Another Tree — LeetCode 572](https://leetcode.com/problems/subtree-of-another-tree/) — accessed 2026-10-08
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-10-08
- [Binary tree — Wikipedia](https://en.wikipedia.org/wiki/Binary_tree) — accessed 2026-10-08
