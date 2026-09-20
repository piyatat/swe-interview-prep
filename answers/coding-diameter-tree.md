# Diameter of Binary Tree — answer outline

**Prompt:** Binary tree. Return the **diameter**: number of **edges** on the longest path between any two nodes. The path may **not** go through the root. (LeetCode 543)

Wikipedia [graph distance](https://en.wikipedia.org/wiki/Distance_(graph_theory)): distance is edges on a shortest path; the **diameter** is the greatest of those distances. In a tree there is one simple path between any pair, so diameter = longest simple path. Same DFS-height skeleton as [coding-invert-binary-tree.md](coding-invert-binary-tree.md) and [coding-lowest-common-ancestor.md](coding-lowest-common-ancestor.md). NeetCode 150 trees box.

## Probes

- Empty / single node → `0`. Two nodes → `1`.
- Count **edges**, not nodes (`nodes_on_path - 1`).
- Longest path can sit entirely in a subtree (root is not a hub).
- Height of a null child is `-1` or `0` — pick one and stay consistent (`height(leaf) = 0` edges down).

## Strong answer skeleton — one DFS

1. **Clarify:** undirected tree edges; return an integer, not the node list.
2. Brute: for every node, height(left)+height(right), take max — O(n²) if you recompute heights.
3. **Optimal:** one post-order walk. At `node`, `via = L + R` (edges down left + down right). Update a global / boxed `best`. Return `1 + max(L, R)` as this node’s height.
4. Answer is `best`, not the height of the root. Θ(n) time, O(h) stack.

## Sketch (post-order)

```
best = 0
def height(node):
  if not node: return 0
  L, R = height(node.left), height(node.right)
  best = max(best, L + R)   # diameter in edges through node
  return 1 + max(L, R)
height(root)
return best
```

`[1,2,3,4,5]` → `3` (path `4-2-5` or `4-2-1-3`). Skew chain of 4 nodes → `3`.

If you define `height(None) = -1` and `height(leaf) = 0`, then `via = L + R + 2` — same numbers, easier to get wrong. Prefer the `0` / `1+max` version above.

## Mock narration (30 sec)

> “Diameter through a node is left height plus right height in edges. I compute both heights in one DFS, update a global max, and return height upward. That catches paths that never touch the root. Linear visit; stack is the height.”

## Common mistakes

- Returning `height(root)` (depth of the tree, not diameter).
- Counting nodes (`L + R + 1`) when the spec wants edges.
- Recomputing `height` in a separate function from every node — quadratic on a skew tree.
- Forgetting a path that lives only on one side (`best` must see every `L+R`).
- Mutating the tree or storing heights on nodes when a return value is enough.

## Follow-ups

- **Return the path:** keep parent pointers or reconstruct from the node that set `best`.
- **N-ary:** diameter = sum of the **two** largest child heights (not only left/right).
- **Unrooted tree as adj list:** two BFS from a leaf (Wikipedia tree-diameter trick) — same O(n).
- **Max path sum (124):** same post-order, but values can be negative — different combine.
- **Balanced (110):** compare `|L-R|` while returning height; cousin of this walk.

## Sources

- [Diameter of Binary Tree — NeetCode](https://neetcode.io/solutions/diameter-of-binary-tree) — accessed 2026-09-20
- [Diameter of Binary Tree — LeetCode 543](https://leetcode.com/problems/diameter-of-binary-tree/) — accessed 2026-09-20
- [Distance (graph theory) — Wikipedia](https://en.wikipedia.org/wiki/Distance_(graph_theory)) — accessed 2026-09-20
- [Tree (graph theory) — Wikipedia](https://en.wikipedia.org/wiki/Tree_(graph_theory)) — accessed 2026-09-20
- Classic LeetCode #543 — post-order height + max(L+R)
