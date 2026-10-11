# Number of Connected Components — answer outline

**Prompt:** Undirected graph on `n` nodes `0…n-1` plus `edges[i] = [a, b]`. Return how many **connected components**. Isolated nodes count. Usual constraints: no self-loops / no multi-edges required, but ask. (LeetCode 323)

This is the **count-roots** twin of [coding-graph-valid-tree.md](coding-graph-valid-tree.md) (tree ⇔ one component and `n-1` edges) and the UF core of [coding-accounts-merge.md](coding-accounts-merge.md). Named in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150 graphs box. Wikipedia [connected component](https://en.wikipedia.org/wiki/Connected_component_(graph_theory)) / [disjoint-set](https://en.wikipedia.org/wiki/Disjoint-set_data_structure).

## Probes

- Start at `n` (every node alone); decrement **only** on a successful union.
- Cycles / extra edges inside a component do **not** change the answer.
- DFS/BFS vs UF: both O(n + E); UF needs no adjacency list.
- `n = 1`, `edges = []` → `1`. `n` nodes, no edges → `n`.

## Strong answer skeleton — union-find

1. **Clarify:** undirected; nodes are `0…n-1`; isolated vertices count.
2. `parent = [0…n-1]`, optional rank/size; `components = n`.
3. `find` with path compression. `union(a, b)`: if roots differ, link (by rank/size) and `components--`.
4. Walk every edge. Return `components`.
5. **Complexity:** O(n + E · α(n)) time, O(n) space.

DFS/BFS twin: build adj (include isolated nodes); walk unvisited starts; increment once per start. Same answer; say UF when they want the pattern name.

## Sketch (UF)

```
def countComponents(n, edges):
  p = list(range(n))
  def find(x):
    while p[x] != x:
      p[x] = p[p[x]]
      x = p[x]
    return x
  parts = n
  for a, b in edges:
    pa, pb = find(a), find(b)
    if pa != pb:
      p[pa] = pb
      parts -= 1
  return parts
```

`n=5`, `[[0,1],[1,2],[3,4]]` → `2`. Same edges plus `[0,2]` (a cycle) → still `2`.

## Mock narration (30 sec)

> “I start with n components. Each edge that joins two different roots merges them and I decrement. Edges inside a component are no-ops. What’s left is the number of roots — the component count.”

## Common mistakes

- Counting visited nodes instead of **starts** (DFS) or forgetting isolates (adj built only from edges).
- Decrementing on every edge, including those that close a cycle.
- Treating the graph as directed.
- `find` without compression and then claiming linear time.
- Returning `len(set(parent))` **without** compressing every node — stale parents over-count.

## Follow-ups

- **Graph Valid Tree (261)** — [coding-graph-valid-tree.md](coding-graph-valid-tree.md): one component **and** no cycle.
- **Redundant Connection (684)** — first edge whose `find`s already match.
- **Number of Islands** — [coding-number-of-islands.md](coding-number-of-islands.md): grid DFS; same “count starts” idea.
- **Accounts Merge** — [coding-accounts-merge.md](coding-accounts-merge.md).

## Sources

- [Number of Connected Components — NeetCode](https://neetcode.io/solutions/number-of-connected-components-in-an-undirected-graph) — accessed 2026-10-11
- [323. Number of Connected Components — LeetCode Wiki](https://leetcode.doocs.org/en/lc/323/) — accessed 2026-10-11
- [Number of Connected Components — LeetCode 323](https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/) — accessed 2026-10-11
- [Connected component (graph theory) — Wikipedia](https://en.wikipedia.org/wiki/Connected_component_(graph_theory)) — accessed 2026-10-11
- [Disjoint-set data structure — Wikipedia](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) — accessed 2026-10-11
