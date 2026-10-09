# Graph Valid Tree — answer outline

**Prompt:** `n` nodes `0…n-1` and undirected `edges`. Return whether they form a **tree**: connected and acyclic (equivalently: connected with exactly `n-1` edges). No self-loops or duplicate edges in the usual constraints. (LeetCode 261)

This is the **union-find / DFS tree check** named in [../general/coding-patterns.md](../general/coding-patterns.md) and listed as a follow-up on [coding-accounts-merge.md](coding-accounts-merge.md). Cousin of [coding-course-schedule.md](coding-course-schedule.md) (directed cycle) and [coding-number-of-islands.md](coding-number-of-islands.md) (components). NeetCode 150 graphs box. Wikipedia [Tree (graph theory)](https://en.wikipedia.org/wiki/Tree_(graph_theory)) / [Disjoint-set](https://en.wikipedia.org/wiki/Disjoint-set_data_structure).

## Probes

- Tree ⇔ **connected + acyclic** ⇔ **exactly `n-1` edges + connected** (undirected, simple).
- `|E| > n-1` ⇒ cycle (or extra edge). `|E| < n-1` ⇒ disconnected. Still verify; don’t trust count alone if they allow junk edges.
- Undirected: when DFS-ing, **ignore the parent** or UF will see every tree edge as a cycle.
- `n = 1`, `edges = []` is a tree. Isolated node + any extra component is not.

## Strong answer skeleton — union-find

1. **Clarify:** undirected; nodes are `0…n-1`; no multis in the prompt (ask anyway).
2. **UnionFind(`n`)** with path compression. Optional: reject immediately if `len(edges) != n-1`.
3. For each `[a, b]`: if `find(a) == find(b)` → cycle → false; else `union`.
4. **Connected:** one root left (or `components == 1`). If you already required `|E| == n-1` and never cycled, this is implied.
5. **Complexity:** O(n + E · α(n)) time; O(n) space.

DFS/BFS twin: if `|E| != n-1` return false; walk from `0` skipping parent; revisit (not parent) ⇒ cycle; `visited == n` ⇒ connected. Interviewers accept either; UF matches the pattern name.

## Sketch (UF)

```
def validTree(n, edges):
  if len(edges) != n - 1: return False
  p = list(range(n))
  def find(x):
    while p[x] != x:
      p[x] = p[p[x]]
      x = p[x]
    return x
  for a, b in edges:
    pa, pb = find(a), find(b)
    if pa == pb: return False
    p[pa] = pb
  return True
```

`n=5`, `[[0,1],[0,2],[0,3],[1,4]]` → true. Same `n` with an extra `[1,3]` → false (cycle). Two components with `n-1` edges still fail the union count if you skip the `|E|` gate — keep the `find` collision **or** a component counter.

## Mock narration (30 sec)

> “A tree is connected and has no cycle, so it has exactly n−1 edges. I’ll union each edge; if both ends are already in the same set, that’s a cycle. If I never cycle and I used n−1 edges, it’s one component — a tree.”

## Common mistakes

- Treating the graph as directed (Course Schedule instincts).
- DFS without skipping parent → every undirected edge looks like a cycle.
- Checking `|E| == n-1` only (a disconnected graph plus a cycle elsewhere can still have `n-1` edges).
- `n = 1` returning false because the walk never runs.
- Union without path compression / rank and then claiming O(n).

## Follow-ups

- **Number of Connected Components (323)** — same UF; count roots.
- **Redundant Connection (684)** — return the first edge that closes a cycle.
- **Accounts Merge** — [coding-accounts-merge.md](coding-accounts-merge.md).
- Directed version: rooted tree / arborescence (one parent, no cycle) — different check.

## Sources

- [Graph Valid Tree — NeetCode](https://neetcode.io/solutions/graph-valid-tree) — accessed 2026-10-09
- [261. Graph Valid Tree — LeetCode Wiki](https://leetcode.doocs.org/en/lc/261/) — accessed 2026-10-09
- [Graph Valid Tree — LeetCode 261](https://leetcode.com/problems/graph-valid-tree/) — accessed 2026-10-09
- [Tree (graph theory) — Wikipedia](https://en.wikipedia.org/wiki/Tree_(graph_theory)) — accessed 2026-10-09
- [Disjoint-set data structure — Wikipedia](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) — accessed 2026-10-09
