# Serialize and Deserialize Binary Tree — answer outline

**Prompt:** Encode a binary tree to a string and rebuild the **same shape** from that string. (LeetCode 297)

Wikipedia-style **serialization**: turn an in-memory structure into a byte/text stream so another process can reconstruct it. Interview version: **your** format is fine if `deserialize(serialize(root))` is identical. Named under hard trees in [../general/coding-patterns.md](../general/coding-patterns.md). Cousin of [coding-clone-graph.md](coding-clone-graph.md) (map + traversal) and [coding-lowest-common-ancestor.md](coding-lowest-common-ancestor.md).

## Probes

- Without **null sentinels**, preorder / inorder / level-order of **values only** is ambiguous (which child is missing?).
- Preorder DFS + `"N"` (or `"null"`) is the usual interview codec; BFS / LeetCode bracket form also works.
- Values can be **negative** — do not use `-` as the delimiter. Split on `,`.
- Empty tree → a single sentinel. `n` up to ~10⁴ → Θ(n) time and space is the bar.

## Strong answer skeleton — preorder DFS

1. **Clarify:** general binary tree (not a BST); return type is string; values fit in 32-bit ints.
2. **Serialize:** DFS root → left → right. Null → append `"N"`. Else append `str(val)`, then children. Join with `,`.
3. **Deserialize:** split once; consume tokens **in the same order**. `"N"` → `None` and advance. Else `TreeNode(int)`, then left, then right.
4. **Complexity:** Θ(n) time and Θ(n) tokens; recursion depth O(h) (skew = n).

## Sketch (preorder)

```
# serialize
if node is None: append "N"; return
append str(node.val)
dfs(node.left); dfs(node.right)

# deserialize (vals, i)
if vals[i] == "N":
  i += 1; return None
node = TreeNode(int(vals[i])); i += 1
node.left = dfs(); node.right = dfs()
return node
```

`[1,2,3,null,null,4,5]` → `"1,2,N,N,3,4,N,N,5,N,N"`. `[]` → `"N"`.

## Strong answer skeleton — BFS (level order)

Same null rule. Queue nodes; emit val or `"N"`; only enqueue children of **real** nodes. Rebuild: read next two tokens as left/right of the current real node. Same Θ(n). Prefer DFS in a 45-min unless they want the LeetCode display format.

## Mock narration (30 sec)

> “I need a format that records missing children, otherwise two different trees stringify the same. Preorder with an N sentinel does that: write the value, then left, then right. Decode is the same walk — consume one token, N means null, otherwise build a node and recurse.”

## Common mistakes

- Omitting nulls (“just join values”) — structure is not recoverable.
- Using `-` or spaces as separators when negatives exist.
- Advancing the index **after** both children instead of **at** each token.
- Serializing a BST as sorted values and claiming that is enough (needs a second traversal or nulls).
- Sharing one global iterator incorrectly across test cases.

## Follow-ups

- **BST-only codec (LC 449):** values + BST order can drop some nulls; still say why the general tree cannot.
- **Graph / N-ary:** assign ids; emit child lists (see clone-graph).
- **Compact:** length-prefix values; Huffman is out of scope.
- **Streaming:** decoder can build as tokens arrive if the walk is prefix-safe.

## Sources

- [Serialize and Deserialize Binary Tree — NeetCode](https://neetcode.io/solutions/serialize-and-deserialize-binary-tree) — accessed 2026-09-12
- [Serialize and Deserialize Binary Tree — LeetCode 297](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/) — accessed 2026-09-12
- [Serialization — Wikipedia](https://en.wikipedia.org/wiki/Serialization) — accessed 2026-09-12
- [Serialize and Deserialize Binary Tree — interview walkthrough](https://intervu.dev/blog/walkthroughs/serialize-and-deserialize-binary-tree-interview-walkthrough/) — accessed 2026-09-12
- Classic LeetCode #297 — preorder / BFS codec with null sentinels
