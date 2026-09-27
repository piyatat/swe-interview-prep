# Network Delay Time — answer outline

**Prompt:** `n` directed nodes `1 … n`. Edges `times[i] = [u, v, w]` are travel times. Send a signal from node `k`. Return the time when **every** node has received it (max over shortest-path times from `k`). If some node is unreachable, return `-1`. (LeetCode 743)

This is **single-source shortest path on non-negative weights** — [Dijkstra](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm), not BFS (BFS is unit weights) and not Bellman–Ford unless they add negatives. Sibling of [coding-course-schedule.md](coding-course-schedule.md) (unweighted topo) and [coding-rotting-oranges.md](coding-rotting-oranges.md) (multi-source unit BFS). NeetCode 150 advanced-graphs box.

## Probes

- Directed? Isolated nodes? Self-loops? Duplicate edges? (LC: unique pairs, `w ≥ 0`.)
- Answer is `max(dist[v])`, not `dist` of a single target.
- Why not DFS / plain queue? A longer hop-count path can be **faster** in wall time.
- Heap vs array-Dijkstra (`O(V²)`): `n ≤ 100` on LC 743 — either works; say the heap form for interviews.

## Strong answer skeleton — Dijkstra + heap

1. **Clarify:** nodes are `1`-indexed; missing nodes in `times` still count toward `n`; `k` may have no outgoing edges (`n==1` → `0`).
2. Build `adj[u] = [(v, w), …]`.
3. Min-heap of `(time, node)`, start `(0, k)`. `dist` / `seen` so a node is **finalized once** (non-negative edges).
4. Pop the smallest time; skip if already finalized; else record `dist[node] = time` and push neighbors `time + w`.
5. If `|dist| < n` → `-1`; else `max(dist.values())`.
6. Time `O((V + E) log V)` with a binary heap; space `O(V + E)`.

## Sketch (lazy Dijkstra)

```
g = defaultdict(list)
for u, v, w in times:
  g[u].append((v, w))
dist = {}
pq = [(0, k)]                    # (time, node)
while pq:
  t, u = heappop(pq)
  if u in dist: continue
  dist[u] = t
  for v, w in g[u]:
    if v not in dist:
      heappush(pq, (t + w, v))
return max(dist.values()) if len(dist) == n else -1
```

`times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2` → `2`. `[[1,2,1]], n = 2, k = 2` → `-1`.

## Mock narration (30 sec)

> “I need the last node to hear the signal, so I compute shortest times from k and take the max. Weights are non-negative, so Dijkstra: always expand the closest unfinished node. A heap of tentative times, finalize on first pop, push neighbors. If I finalize fewer than n nodes, someone is unreachable.”

## Common mistakes

- BFS by hop count — wrong when a 2-hop path beats a 1-hop heavy edge.
- Forgetting `max(dist)` and returning the last pop (same if you always overwrite `t`, but only after every node is seen).
- Treating the graph as undirected.
- Using Dijkstra on **negative** weights (then Bellman–Ford / SPFA; say you would refuse).
- `0`-index vs `1`-index off-by-one when checking `len(dist) == n`.

## Follow-ups

- **Cheapest flights within K stops (787)** — Bellman–Ford / layered BFS; hop cap breaks plain Dijkstra.
- **Path with minimum effort (1631)** — Dijkstra on *max edge* (or binary search + BFS).
- **Network delay undirected / bidirectional** — add reverse edges.
- **Print the path** — parent pointers on finalize.

## Sources

- [Dijkstra's algorithm — Wikipedia](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) — accessed 2026-09-27
- [Network Delay Time — NeetCode](https://neetcode.io/solutions/network-delay-time) — accessed 2026-09-27
- [Network Delay Time — LeetCode 743](https://leetcode.com/problems/network-delay-time/) — accessed 2026-09-27
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-09-27
- Classic LeetCode #743 — heap Dijkstra, max over shortest times
