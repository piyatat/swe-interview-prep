# Balanced Binary Tree — answer outline

**Prompt:** Binary tree. Return whether it is **height-balanced**: at **every** node, left and right subtree heights differ by at most **1**. Empty tree is balanced. (LeetCode 110)

Same post-order height walk as [coding-diameter-tree.md](coding-diameter-tree.md), but the signal is “|L−R| > 1 somewhere” instead of “max L+R.” NeetCode 150 trees box.

## Probes

- Balanced at the **root only** is not enough (a deep left-left grandchild fails).
- Height convention: `height(None) = 0`, `height(leaf) = 1` **or** `−1` / `0` — pick one.
- Naive “height at every node” is O(n²) if you recompute.
- Can you abort the walk the moment a subtree is unbalanced?
- Follow-up: return the unbalanced node, or **balance** the tree (different problem).

## Strong answer skeleton

1. **Clarify:** height = longest root→leaf **edge or node** count; they only need the boolean.
2. **Brute:** for each node, `abs(height(left)−height(right)) ≤ 1` and both children balanced — O(n²).
3. **Optimal:** one DFS that returns height **or a poison** (`-1`) if that subtree is already unbalanced.
   - Null → `0`.
   - Recurse left / right; if either is `-1`, return `-1`.
   - If `abs(L−R) > 1`, return `-1`.
   - Else return `1 + max(L, R)`.
4. Answer is `dfs(root) != -1`. Θ(n) time, O(h) stack.

## Sketch (poison height)

```
def height(node):
  if not node: return 0
  L = height(node.left)
  if L < 0: return -1
  R = height(node.right)
  if R < 0: return -1
  if abs(L - R) > 1: return -1
  return 1 + max(L, R)

return height(root) >= 0
```

`[3,9,20,null,null,15,7]` → **true**. `[1,2,2,3,3,null,null,4,4]` → **false** (left-left chain). `[]` → **true**.

A global `ok` flag plus a height-only DFS is the same idea; the poison return avoids visiting the rest of the tree.

## Mock narration (30 sec)

> “I need every node balanced, not just the root. One post-order: I compute both heights, fail fast if a child already failed or the gap is more than one, otherwise I send 1 + max upward. Linear visit; stack is the height.”

## Common mistakes

- Checking only the root’s two subtree heights.
- Recomputing `height` in a separate function at every node (quadratic on a spine).
- Mixing `height(None) = -1` with `1+max` without adjusting the gap test.
- Counting nodes vs edges inconsistently (either works if both sides match).
- Forgetting empty → true.

## Follow-ups

- **Maximum Depth (104):** same height, no balance check.
- **Diameter (543):** [coding-diameter-tree.md](coding-diameter-tree.md) — keep a `best = L+R`.
- **Convert sorted array → AVL / height-balanced BST (108):** build from mid.

## Sources

- [Balanced Binary Tree — NeetCode](https://neetcode.io/solutions/balanced-binary-tree) — accessed 2026-10-26
- [Balanced Binary Tree — LeetCode 110](https://leetcode.com/problems/balanced-binary-tree/) — accessed 2026-10-26
- [AVL tree — Wikipedia](https://en.wikipedia.org/wiki/AVL_tree) — accessed 2026-10-26
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-26
