# Course Schedule — answer outline

**Prompt:** `numCourses` labeled `0 … n-1`. `prerequisites[i] = [a, b]` means take `b` before `a`. Return whether you can finish all courses (no cyclic deps). Variant: return a valid order (Course Schedule II).

## Probes

- Graph model: edge direction (`b → a` vs `a → b`) — pick one and stay consistent.
- Kahn (BFS / indegree) vs DFS cycle detect?
- Disconnected components? Multiple valid orders?

## Strong answer skeleton

1. **Clarify:** empty prereq list → true; self-loop → false; n = 1.
2. **Model:** directed graph. Edge `b → a` (“b unlocks a”). Cycle ⇒ impossible.
3. **Kahn’s algorithm:** indegree[]; queue of indegree 0; repeatedly pop, decrement neighbors; if processed count `< n` → cycle.
4. **DFS alt:** three colors / recursion-stack mark; back-edge ⇒ cycle. II: append on exit (reverse postorder).
5. **Complexity:** O(V + E) = O(n + p) time and space.

## Kahn sketch

```
build adj, indegree
q ← all nodes with indegree 0
taken = 0
while q:
  u = pop; taken++
  for v in adj[u]:
    indegree[v]--; if 0: push v
return taken == numCourses
```

## Mock narration (30 sec)

> “Prereqs are a directed graph. I can finish iff it’s a DAG. I’ll count indegrees and peel sources — Kahn. If I can’t peel n nodes, there’s a cycle.”

## Common mistakes

- Reversed edges (order becomes nonsense; cycle test may still work if consistent — II will be wrong).
- Forgetting nodes with no edges (they must start in the queue).
- Recursion DFS without a “visiting” state (misses back-edges vs cross-edges).

## Follow-ups

- Course Schedule II — return any topo order or `[]`.
- Alien dictionary — same pattern, letters as nodes.
- Parallel semesters — longest path in the DAG (level count), not just “can finish.”

## Sources

- [Topological sorting — Wikipedia](https://en.wikipedia.org/wiki/Topological_sorting) — accessed 2026-08-22
- [Coding Interview Patterns 2026 — intervu.dev](https://intervu.dev/blog/coding-interview-patterns/) — accessed 2026-08-22
- [LeetCode patterns — Interview Coder](https://www.interviewcoder.co/blog/leetcode-patterns) — accessed 2026-08-22
- Classic LeetCode #207 / #210 — graph / topo-sort pattern
