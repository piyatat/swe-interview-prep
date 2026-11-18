# Evaluate Division — answer outline

**Prompt:** Equations `equations[i] = [Ai, Bi]` with `values[i] = Ai / Bi`. Answer each query `Cj / Dj`. Unknown or disconnected → `-1.0`. Input is consistent; no ÷0. (LeetCode 399)

This is a **weighted graph**: edge `A→B` weight `v`, reverse `1/v`; a query is the **product along any path**. Cousin of [coding-clone-graph.md](coding-clone-graph.md) (same walk, multiply instead of copy) and **not** [coding-connected-components.md](coding-connected-components.md) (unweighted count). NeetCode 250 graphs. Wikipedia [breadth-first search](https://en.wikipedia.org/wiki/Breadth-first_search) / [disjoint-set](https://en.wikipedia.org/wiki/Disjoint-set_data_structure).

## Probes

- Variables are **strings**, not `0…n-1`. Missing node → `-1`, including `x/x` when `x` never appeared.
- `a/a` is `1.0` **only if** `a` is in the graph.
- Reverse edges are mandatory (`b/a = 1/v`).
- Graph is tiny (`≤ 20` equations) — BFS per query is enough; weighted UF is the flex.

## Strong answer skeleton — BFS per query

1. **Clarify:** directed weights; reverse `1/v`; undefined vars; `a/a`.
2. Build `g[u] = [(v, w), …]` both ways.
3. For each `[c, d]`: if `c` or `d` missing → `-1`. If `c == d` → `1.0`.
4. BFS from `c` carrying the running product. Skip visited. Hit `d` → that product.
5. **Complexity:** build O(E); each query O(V + E). V, E ≤ ~40.

Weighted-UF twin: `w[x]` = `x / root(x)`. Path compression multiplies weights. Union `a/b=v` links roots so `w[pa] = w[b]*v/w[a]`. Query `w[c]/w[d]` if same root. Same answers; code BFS unless they ask UF.

## Sketch (BFS)

```
g = defaultdict(list)
for (a, b), v in zip(equations, values):
  g[a].append((b, v)); g[b].append((a, 1 / v))

def ask(c, d):
  if c not in g or d not in g: return -1.0
  if c == d: return 1.0
  q, seen = deque([(c, 1.0)]), {c}
  while q:
    x, prod = q.popleft()
    for y, w in g[x]:
      if y in seen: continue
      if y == d: return prod * w
      seen.add(y); q.append((y, prod * w))
  return -1.0

return [ask(c, d) for c, d in queries]
```

`a/b=2`, `b/c=3` → `a/c=6`, `b/a=0.5`, `a/e=-1`, `a/a=1`, `x/x=-1`.

## Mock narration (30 sec)

> “Each equation is a weighted edge and its reciprocal. A query is a path product. I BFS from the numerator carrying the running product and stop at the denominator. If either name is missing, including x/x for an unknown x, I return -1.”

## Common mistakes

- Forgetting reverse edges.
- Returning `1.0` for `x/x` when `x` is undefined (LC statement forbids it).
- DFS without a visited set (cycles).
- Adding weights instead of **multiplying**.
- Union-find that stores parents but not **ratios** (then same-component is not enough).

## Follow-ups

- **Weighted UF** (doocs / NeetCode alternate): O(α(n)) per union/query after build.
- **Floyd–Warshall** on variable ids: `g[i][j] = g[i][k] * g[k][j]` — fine at this n; overkill to code.
- **Connected components:** [coding-connected-components.md](coding-connected-components.md) — drop the weights.
- **Clone graph:** [coding-clone-graph.md](coding-clone-graph.md).

## Sources

- [399. Evaluate Division — LeetCode](https://leetcode.com/problems/evaluate-division/) — accessed 2026-11-18
- [Evaluate Division — NeetCode](https://neetcode.io/solutions/evaluate-division) — accessed 2026-11-18
- [399. Evaluate Division — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/399/) — accessed 2026-11-18
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-11-18
- [Disjoint-set data structure — Wikipedia](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) — accessed 2026-11-18
