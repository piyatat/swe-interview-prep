# Min Cost to Connect All Points — answer outline

**Prompt:** Distinct points on the plane, `points[i] = [xi, yi]`. Cost of an edge is **Manhattan** `|xi−xj| + |yi−yj|`. Return the **minimum cost** to connect all points so there is exactly one path between every pair (a tree). (LeetCode 1584)

This is the **MST** sibling of [coding-network-delay.md](coding-network-delay.md) (shortest paths, not a spanning tree) and uses the same UF as [coding-redundant-connection.md](coding-redundant-connection.md) (skip edges that close a cycle). NeetCode 150 advanced-graphs box. Wikipedia [Minimum spanning tree](https://en.wikipedia.org/wiki/Minimum_spanning_tree) / [Kruskal](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm) / [Prim](https://en.wikipedia.org/wiki/Prim%27s_algorithm).

## Probes

- Metric is **Manhattan**, not Euclidean. Distinct points; `n` up to **1000** → you may materialize **O(n²)** edges.
- Connect **all** points; isolated `n = 1` → cost `0`.
- MST, not Steiner: you may **not** add extra Steiner vertices.
- Kruskal (sort + UF) and Prim (heap from a root) are both O(n² log n) here; either is the bar.

## Strong answer skeleton — Kruskal

1. **Clarify:** Manhattan; undirected complete graph; return total weight, not the edge list.
2. Build all pairs `i < j` with weight `|dx| + |dy|`.
3. Sort edges by weight. UF on `n` point **indices**.
4. Walk sorted edges; `union` if different roots; add weight. Stop at `n-1` unions.
5. **Complexity:** O(n² log n) time (sort) and O(n²) space.

**Prim:** start at 0; `dist[j] = Manhattan(0, j)`; `inMST` set. Repeat: pick unused min `dist`, add it, relax neighbors. Array-min Prim is O(n²) time / O(n) extra — nicer if they fear n² edges. Heap Prim is O(n² log n).

## Sketch (Kruskal)

```
def minCostConnectPoints(points):
  n = len(points)
  edges = []
  for i in range(n):
    x, y = points[i]
    for j in range(i + 1, n):
      w = abs(x - points[j][0]) + abs(y - points[j][1])
      edges.append((w, i, j))
  edges.sort()
  p = list(range(n))
  def find(x):
    while p[x] != x:
      p[x] = p[p[x]]
      x = p[x]
    return x
  cost = used = 0
  for w, a, b in edges:
    pa, pb = find(a), find(b)
    if pa == pb: continue
    p[pa] = pb
    cost += w
    used += 1
    if used == n - 1: break
  return cost
```

`[[0,0],[2,2],[3,3],[2,4],[4,2]]` → `10` (classic LC figure). One point → `0`.

## Mock narration (30 sec)

> “This is an MST on the complete graph with Manhattan weights. I generate every pair, sort by distance, and Kruskal-union until I have n−1 edges. Same-root pairs are cycles — skip them. Prim from one point is the same answer with an n² scan.”

## Common mistakes

- Euclidean `sqrt` / squared Euclidean (wrong metric).
- Connecting a point twice into the tree (forgetting the UF / `inMST` gate).
- Returning the last edge weight, not the **sum**.
- Directed MST / arborescence talk — the graph is undirected.
- `n = 1` falling into `used == n-1` never-runs → wrong default.

## Follow-ups

- **Prim vs Kruskal:** dense complete graph → Prim O(n²) array is cleaner; Kruskal needs all edges.
- **Network Delay Time (743):** Dijkstra — [coding-network-delay.md](coding-network-delay.md).
- **Min cost to connect all cities with a cap** (1135-style) — same Kruskal, extra `used` check.
- **Redundant Connection** — [coding-redundant-connection.md](coding-redundant-connection.md).

## Sources

- [Min Cost to Connect All Points — NeetCode](https://neetcode.io/solutions/min-cost-to-connect-all-points) — accessed 2026-10-18
- [1584. Min Cost to Connect All Points — LeetCode Wiki](https://leetcode.doocs.org/en/lc/1584/) — accessed 2026-10-18
- [Min Cost to Connect All Points — LeetCode 1584](https://leetcode.com/problems/min-cost-to-connect-all-points/) — accessed 2026-10-18
- [Minimum spanning tree — Wikipedia](https://en.wikipedia.org/wiki/Minimum_spanning_tree) — accessed 2026-10-18
- [Kruskal's algorithm — Wikipedia](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm) — accessed 2026-10-18
- [Prim's algorithm — Wikipedia](https://en.wikipedia.org/wiki/Prim%27s_algorithm) — accessed 2026-10-18
