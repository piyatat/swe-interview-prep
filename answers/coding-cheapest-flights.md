# Cheapest Flights Within K Stops — answer outline

**Prompt:** `n` airports `0 … n-1`. Directed flights `[from, to, price]`. Return the **cheapest** price from `src` to `dst` using **at most `k` stops** (so ≤ `k+1` edges). If impossible, `-1`. (LeetCode 787)

This is **shortest path with an edge budget** — Bellman–Ford / layered relaxation — not plain Dijkstra ([coding-network-delay.md](coding-network-delay.md) ignores hop caps). NeetCode 150 advanced-graphs box. Aim for about `O(k · E)` time.

## Probes

- A **stop** is an intermediate airport; `k` stops ⇒ at most `k+1` flights.
- Cheaper long path can be illegal: example `0→1→2→3` costs less than `0→1→3` but needs 2 stops when `k == 1`.
- Dijkstra by price first can finalize `dst` on a cheap-but-over-budget path — need **(node, hops)** state or BF layers.
- Prices ≥ 1 on LC; no self-loops / duplicate flights in the official statement.

## Strong answer skeleton — Bellman–Ford `k+1` rounds

1. **Clarify:** `src != dst`; isolated airports; `k == 0` means **direct** only.
2. `dist[i] = inf`, `dist[src] = 0`.
3. Repeat **`k + 1` times**: copy `dist` → `next` (or relax into a fresh array) so this round only extends paths from the **previous** hop count.
4. For each flight `u → v` with price `w`: if `dist[u] + w < next[v]`, update `next[v]`.
5. After the rounds, `dist[dst]` or `-1`.
6. Time `O((k+1) · E)`, space `O(n)` (two arrays). Heap Dijkstra on `(cost, node, hops)` is also fine; first time you pop `dst` is optimal if you key on cost.

## Sketch (layer copy)

```
INF = 10**15
dist = [INF] * n
dist[src] = 0
for _ in range(k + 1):
  nxt = dist[:]
  for u, v, w in flights:
    if dist[u] + w < nxt[v]:
      nxt[v] = dist[u] + w
  dist = nxt
return -1 if dist[dst] >= INF else dist[dst]
```

`n=4, flights=[[0,1,200],[1,2,100],[1,3,300],[2,3,100]], src=0, dst=3, k=1` → **500** (the 400 path uses 2 stops).

## Mock narration (30 sec)

> “I need cheapest src→dst with at most k+1 edges. Plain Dijkstra forgets the hop cap. Bellman–Ford: each round relaxes every flight using only distances from the previous round, so after i rounds I have best paths with ≤ i edges. k+1 rounds, then read dst. Copy the array so a cheap 2-edge path cannot sneak into the same round.”

## Common mistakes

- In-place relax without a copy — a path can grow more than one edge per round.
- Dijkstra that marks a node visited **once** (later fewer-hop / different-cost state needed).
- Off-by-one: `k` rounds instead of `k+1` (stops vs edges).
- Returning `0` when `dst` is unreachable.
- Using undirected edges.

## Follow-ups

- **Network Delay Time (743)** — no hop cap; Dijkstra, answer is `max(dist)`.
- **Negative prices** — same BF; extra round detects a negative cycle if they ask.
- **Count paths / reconstruct** — parent per `(node, hops)` or predecessor on last improve.

## Sources

- [Bellman–Ford algorithm — Wikipedia](https://en.wikipedia.org/wiki/Bellman%E2%80%93Ford_algorithm) — accessed 2026-09-28
- [Cheapest Flights Within K Stops — NeetCode](https://neetcode.io/solutions/cheapest-flights-within-k-stops) — accessed 2026-09-28
- [Cheapest Flights Within K Stops — LeetCode 787](https://leetcode.com/problems/cheapest-flights-within-k-stops/) — accessed 2026-09-28
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-09-28
- Classic LeetCode #787 — hop-capped shortest path via layered relaxation
