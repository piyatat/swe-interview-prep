# Binary Tree Maximum Path Sum — answer outline

**Prompt:** Binary tree with (possibly **negative**) node values. A path is any non-empty node sequence connected by edges; a node appears at most once. Return the maximum sum of **any** such path — it need not pass through the root. (LeetCode 124)

This is **post-order + global max**, not “max root-to-leaf.” Sibling of [coding-diameter-tree.md](coding-diameter-tree.md) (same walk, edges not values) and [coding-house-robber.md](coding-house-robber.md) (House Robber III pairs). NeetCode 150 trees box; Wikipedia [tree traversal](https://en.wikipedia.org/wiki/Tree_traversal) (post-order).

## Probes

- A single node is a valid path — answer can be the largest **leaf** if everything else is worse.
- Negatives: you may **drop** a child (`max(0, gain)`). You may **not** drop the node you are sitting on when you consider a path that starts there.
- The function that talks to the parent returns **one** downward arm (`node + max(L, R, 0)`). The forked path `L + node + R` updates a global only.
- Empty tree is out of spec (non-empty root). One node → that value.

## Strong answer skeleton — one DFS

1. **Clarify:** values in `[-1000, 1000]` typical; path is undirected along parent/child; return a number, not the node list.
2. Brute: all pairs — O(n²) after you have a tree (worse if you recompute).
3. **Optimal:** post-order. At `node`, `L = max(0, dfs(left))`, `R = max(0, dfs(right))`.
4. Update `best` with `node.val + L + R` (best path that **peaks** here).
5. Return `node.val + max(L, R)` as the best **open** path the parent may extend.
6. Answer is `best` after `dfs(root)`. Θ(n) time, O(h) stack.

## Sketch (post-order)

```
best = -inf
def gain(node):
  if not node: return 0
  L = max(0, gain(node.left))
  R = max(0, gain(node.right))
  best = max(best, node.val + L + R)
  return node.val + max(L, R)
gain(root)
return best
```

`[1,2,3]` → `6` (`2-1-3`). `[-10,9,20,null,null,15,7]` → `42` (`15-20-7`). All-negative `[-3,-2,-1]` → `-1` (pick the least-bad node).

## Mock narration (30 sec)

> “At each node I ask for the best downward gain from left and right, treating a negative child as skip. I update a global with left + me + right — that is the best path that turns around here. I return only one side to my parent so I never fork twice. Same linear post-order as diameter, but I clamp negatives and keep values, not edge counts.”

## Common mistakes

- Returning `gain(root)` (best **root-anchored** arm, not the global path).
- Returning `L + val + R` to the parent — double-counts a fork higher up.
- Forgetting `max(0, child)` and letting a negative child drag a good node.
- Initializing `best = 0` — fails when every node is negative.
- Confusing with **path sum to target** (112 / 113) or **max root-to-leaf**.

## Follow-ups

- **Diameter (543)** — same skeleton; combine heights, not values.
- **House Robber III (337)** — pair `(rob, skip)` per node; no “path of edges.”
- **Return the path:** keep the node that last raised `best` + parent pointers.
- **N-ary:** best two non-negative child gains + `val` for the fork.

## Sources

- [Binary Tree Maximum Path Sum — NeetCode](https://neetcode.io/solutions/binary-tree-maximum-path-sum) — accessed 2026-09-26
- [Binary Tree Maximum Path Sum — LeetCode 124](https://leetcode.com/problems/binary-tree-maximum-path-sum/) — accessed 2026-09-26
- [Tree traversal — Wikipedia](https://en.wikipedia.org/wiki/Tree_traversal) — accessed 2026-09-26
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-09-26
- Classic LeetCode #124 — post-order gain + global fork
