# Redundant Connection — answer outline

**Prompt:** Undirected graph with `n` nodes `1…n` and `n` edges. It was a **tree** (`n-1` edges) plus **one extra** edge. Return an edge you can delete so the graph is a tree again. If several work, return the extra edge that appears **last** in the input. No self-loops / no duplicate edges. (LeetCode 684)

This is the **return-the-cycle-edge** twin of [coding-graph-valid-tree.md](coding-graph-valid-tree.md) (boolean) and [coding-connected-components.md](coding-connected-components.md) (count roots). NeetCode 150 graphs box. Wikipedia [Disjoint-set](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) / [Tree (graph theory)](https://en.wikipedia.org/wiki/Tree_(graph_theory)).

## Probes

- Exactly **one** extra edge. The answer is the **first** edge whose two ends are already in the same component when you union **in input order** — that is also the **last** extra edge in the list.
- Nodes are **`1…n`**, not `0…n-1`. Size the parent array `n+1` or remap.
- Directed version (685) is a different problem (two parents / a cycle) — ask if they meant that.
- DFS also works; UF is the intended O(n α(n)) interview bar.

## Strong answer skeleton — union-find

1. **Clarify:** undirected; return the last redundant edge in `edges`; nodes labeled from 1.
2. `parent = [0…n]`, optional rank. `find` with path compression.
3. For each `[u, v]` in order: if `find(u) == find(v)`, **return `[u, v]`**. Else `union`.
4. The prompt guarantees an answer; no extra “not found” path required, but a trailing `[]` is fine.
5. **Complexity:** O(n · α(n)) time, O(n) space. Building all-pairs DFS per edge is O(n²) — mention and skip.

DFS twin: add edges one by one; after each add, parent-skipping DFS from `u` — if you reach `v` without using this edge, it closes a cycle. Same order, more code.

## Sketch (UF)

```
def findRedundantConnection(edges):
  n = len(edges)
  p = list(range(n + 1))
  def find(x):
    while p[x] != x:
      p[x] = p[p[x]]
      x = p[x]
    return x
  for u, v in edges:
    pu, pv = find(u), find(v)
    if pu == pv:
      return [u, v]
    p[pu] = pv
```

`[[1,2],[1,3],[2,3]]` → `[2,3]`. `[[1,2],[2,3],[3,4],[1,4],[1,5]]` → `[1,4]` (the later cycle edge, not `[1,2]`).

## Mock narration (30 sec)

> “It was a tree plus one edge, so the first union that fails is the cycle. I union in input order; when both ends already share a root, I return that pair. That is also the last valid extra edge in the list.”

## Common mistakes

- 0-indexed parent of size `n` → off-by-one on node `n`.
- Returning the **first** edge of the cycle in the drawing, not the **last** in the array.
- Union **before** the same-root check (you never see a collision).
- Treating it as directed (Course Schedule) or as “any edge on the cycle.”
- Path compression skipped, then claiming linear time.

## Follow-ups

- **Graph Valid Tree (261):** boolean; also need `|E| == n-1` + connected — [coding-graph-valid-tree.md](coding-graph-valid-tree.md).
- **Number of Connected Components (323):** same UF, count successful unions — [coding-connected-components.md](coding-connected-components.md).
- **Redundant Connection II (685):** directed; handle a node with two parents.
- **Accounts Merge** — [coding-accounts-merge.md](coding-accounts-merge.md).

## Sources

- [Redundant Connection — NeetCode](https://neetcode.io/solutions/redundant-connection) — accessed 2026-10-18
- [684. Redundant Connection — LeetCode Wiki](https://leetcode.doocs.org/en/lc/684/) — accessed 2026-10-18
- [Redundant Connection — LeetCode 684](https://leetcode.com/problems/redundant-connection/) — accessed 2026-10-18
- [Disjoint-set data structure — Wikipedia](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) — accessed 2026-10-18
- [Tree (graph theory) — Wikipedia](https://en.wikipedia.org/wiki/Tree_(graph_theory)) — accessed 2026-10-18
