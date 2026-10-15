# Course Schedule II — answer outline

**Prompt:** `numCourses` labeled `0 … n-1`. `prerequisites[i] = [a, b]` means take `b` before `a`. Return **any** valid order of all courses, or `[]` if it is impossible. (LeetCode 210)

This is the **ordering** sibling of [coding-course-schedule.md](coding-course-schedule.md) (the boolean “can you finish”). Same DAG. Kahn’s dequeue order **is** a topo sort; DFS reverse-postorder is the other interview default. Named with graphs in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150. Wikipedia [Topological sorting](https://en.wikipedia.org/wiki/Topological_sorting).

## Probes

- Edge direction: `b → a` (“b unlocks a”). Reverse it and the order is wrong even if the cycle test still works.
- Many valid orders — return **any**. Isolated courses (indegree 0, no edges) still appear.
- Cycle → `[]`, not a partial prefix. Self-loop is a cycle.
- `n` up to a few thousand; target **O(n + p)**.

## Strong answer skeleton — Kahn (BFS)

1. **Clarify:** empty `prerequisites` → `[0, 1, …, n-1]` in any order; `n = 1` → `[0]`.
2. Build `adj[b].append(a)` and `indeg[a]++` for each `[a, b]`.
3. Queue every `i` with `indeg[i] == 0` (include nodes the map never saw).
4. While the queue is live: pop `u`, append to `order`, decrement neighbors, push when indegree hits 0.
5. If `len(order) != n`, a cycle remains → return `[]`.
6. **Complexity:** O(n + p) time and space.

DFS alt: three colors. Recurse on unmarked neighbors; **append `u` after children** (postorder), then **reverse** the list — or insert at the front. Gray back-edge → cycle → abort to `[]`. Do not mix “append on entry” with Kahn’s mental model.

## Sketch (Kahn)

```
g, indeg = [[] for _ in range(n)], [0] * n
for a, b in prerequisites:
  g[b].append(a); indeg[a] += 1
q = deque(i for i, d in enumerate(indeg) if d == 0)
order = []
while q:
  u = q.popleft()
  order.append(u)
  for v in g[u]:
    indeg[v] -= 1
    if indeg[v] == 0:
      q.append(v)
return order if len(order) == n else []
```

`n = 4, [[1,0],[2,0],[3,1],[3,2]]` → `[0,1,2,3]` or `[0,2,1,3]`. `[[0,1],[1,0]]` → `[]`.

## Mock narration (30 sec)

> “Prereqs are a directed graph; I need a topo order. I peel indegree-zero sources with Kahn and record the pop order. If I cannot place n courses, there is a cycle and I return an empty list.”

## Common mistakes

- Returning the partial `order` when a cycle exists.
- Forgetting zero-edge courses — they must start in the queue.
- DFS that appends on **entry** (preorder) without reversing.
- Treating it as [coding-alien-dictionary.md](coding-alien-dictionary.md) (you are **given** edges here; there you **infer** them).

## Follow-ups

- **Course Schedule (207):** only the boolean — [coding-course-schedule.md](coding-course-schedule.md).
- **Parallel semesters:** longest path / level count in the DAG, not just one order.
- **Minimum height trees / alien dictionary:** same peel, different graphs.

## Sources

- [Course Schedule II — NeetCode](https://neetcode.io/solutions/course-schedule-ii) — accessed 2026-10-15
- [210. Course Schedule II — LeetCode Wiki](https://leetcode.doocs.org/en/lc/210/) — accessed 2026-10-15
- [Course Schedule II — LeetCode 210](https://leetcode.com/problems/course-schedule-ii/) — accessed 2026-10-15
- [Topological sorting — Wikipedia](https://en.wikipedia.org/wiki/Topological_sorting) — accessed 2026-10-15
