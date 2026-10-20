# Reconstruct Itinerary — answer outline

**Prompt:** `tickets[i] = [from, to]` are one-way flights. Start at `"JFK"`. Use **every ticket exactly once**. Return the itinerary (airports). If several Eulerian paths exist, return the **lexicographically smallest** sequence when read as one string. A valid tour is guaranteed. (LeetCode 332)

This is **Hierholzer’s Eulerian path**, not “DFS all permutations.” Cousin of [coding-alien-dictionary.md](coding-alien-dictionary.md) (graph from pairs) but you consume **edges**, not emit a topo order. NeetCode 150 advanced-graphs box.

## Probes

- Tickets are **directed multiedges**. Two `JFK → ATL` tickets are two edges.
- Lex-smallest means: at each airport, try unused destinations in **sorted** order — but a greedy “always pop the smallest unused” **without post-order** can strand unused tickets (dead-end first is required).
- Hierholzer: recurse on unused out-edges; **append the airport after** the loop (post-order), then reverse.
- Start is always `JFK`. Disconnected leftover tickets will not happen if the input is valid.
- You cannot “sort the tickets globally and concatenate” — the path constraint is local.

## Strong answer skeleton — Hierholzer + reverse-sorted bags

1. **Clarify:** IATA codes; duplicates allowed; use every ticket; start `JFK`; lex-smallest full path.
2. Build `from → min-heap / reverse-sorted stack` of destinations so `pop()` yields the **smallest** remaining hop.
3. `dfs(airport)`: while the bag is non-empty, pop a dest and recurse. Then `route.append(airport)`.
4. Reverse `route`. That is the itinerary.
5. **Complexity:** let `E` be tickets. Sort / heapify O(E log E); each edge popped once → O(E log E) time, O(E) space.

Backtracking “try each unused ticket, prune” is correct but exponential; they want Hierholzer.

## Sketch (post-order + reverse)

```
g = defaultdict(list)
for f, t in sorted(tickets, reverse=True):  # last pop = smallest dest
  g[f].append(t)

route = []
def dfs(f):
  while g[f]:
    dfs(g[f].pop())
  route.append(f)

dfs("JFK")
return route[::-1]
```

`[["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]` → `JFK MUC LHR SFO SJC`.  
`[["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]` → `JFK ATL JFK SFO ATL SFO` (not the `SFO`-first tour).

## Mock narration (30 sec)

> “Every ticket is a directed edge. I need an Eulerian path from JFK, and the lex-smallest one. I keep a min-ordered bag of unused destinations, walk unused edges first, and record the airport only when it is a dead end. Reverse that post-order. That is Hierholzer — not a permutation search.”

## Common mistakes

- Greedy “always fly to the smallest unused dest” **without** postponing the node — stuck with leftover tickets.
- Treating tickets as a simple graph (a `set`) and dropping duplicate flights.
- Forgetting to reverse the post-order list.
- Sorting airports once and ignoring leftover unused edges.
- Starting DFS from the lex-smallest airport instead of `JFK`.

## Follow-ups

- **Undirected Euler tour:** same algorithm; store undirected edges with an id so you mark used once.
- **Chinese Postman / unused edges allowed:** different problem (add duplicate edges).
- **Course Schedule:** topo on **nodes**; this consumes **edges**.
- **Reconstruct itinerary with a forced start other than JFK** — same, change the root.

## Sources

- [Reconstruct Itinerary — NeetCode](https://neetcode.io/solutions/reconstruct-itinerary) — accessed 2026-10-20
- [332. Reconstruct Itinerary — LeetCode Wiki](https://leetcode.doocs.org/en/lc/332/) — accessed 2026-10-20
- [Reconstruct Itinerary — LeetCode 332](https://leetcode.com/problems/reconstruct-itinerary/) — accessed 2026-10-20
- [Eulerian path — Wikipedia](https://en.wikipedia.org/wiki/Eulerian_path) — accessed 2026-10-20
- [Hierholzer's algorithm — Wikipedia](https://en.wikipedia.org/wiki/Eulerian_path#Hierholzer's_algorithm) — accessed 2026-10-20
