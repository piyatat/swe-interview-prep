# Clone Graph — answer outline

**Prompt:** Given a node in a **connected undirected** graph, return a **deep copy**. Each node has `val` and a `neighbors` list. (LeetCode 133)

Graph BFS/DFS cousin of [coding-number-of-islands.md](coding-number-of-islands.md) (grid flood-fill). Traversal cost is the usual [BFS](https://en.wikipedia.org/wiki/Breadth-first_search) bound: **O(V + E)**.

## Probes

- Cycles: undirected edge A—B means A lists B and B lists A — **infinite recursion** without a map.
- Deep vs shallow: new `Node` objects; neighbor lists must point at **clones**.
- Key the map by **node identity** (object), not `val` (vals are unique in the classic problem; say why that is fragile).
- `node is None` → `None`. Connected from the given start (classic).

## Strong answer skeleton

1. **Clarify:** undirected, cycles, connected, unique vals?, empty.
2. **Registry:** `cloned: original → new Node`. Does **two jobs**: visited + wire-up.
3. **Register before walking neighbors** — otherwise a back-edge re-enters and stacks forever.
4. **DFS:** if already cloned, return it; else create, store, append `dfs(nei)` to `clone.neighbors`.
5. **BFS:** seed `cloned[start] = Node(start.val)` + queue; for each dequeued node, for each neighbor: create+enqueue if new; **always** append `cloned[nei]` to `cloned[cur].neighbors`.
6. **Complexity:** time O(V + E); space O(V) for the map (+ recursion stack or queue).

## Sketch (BFS)

```
if not node: return None
cloned = {node: Node(node.val)}
q = deque([node])
while q:
  cur = q.popleft()
  for nei in cur.neighbors:
    if nei not in cloned:
      cloned[nei] = Node(nei.val)
      q.append(nei)
    cloned[cur].neighbors.append(cloned[nei])
return cloned[node]
```

Register-before-recurse is the DFS equivalent of “label explored **before** enqueue” in Wikipedia BFS (avoid repeat work / loops).

## Mock narration (30 sec)

> “Deep copy with cycles needs a map from original to clone. I create the clone and put it in the map **before** I walk neighbors. A back-edge then reuses the cached clone instead of allocating again or recursing forever. BFS or DFS, same map. Linear in vertices and edges.”

## Common mistakes

- Registering the clone **after** the neighbor loop (cycle → stack overflow).
- Appending **original** neighbor objects (shallow copy; shared graph).
- Keying only on `val` when the follow-up allows duplicate labels.
- Forgetting `None`.
- Cloning each edge twice incorrectly (in undirected graphs you **do** append both directions — once from each endpoint — that is correct).

## Follow-ups

- **Copy List with Random Pointer (138):** same registry idea on a linked list.
- **Clone with disconnected components:** iterate all nodes, not one BFS from `node`.
- **Serialize / deserialize graph:** assign ids, emit adj list, rebuild with the same map pattern.

## Sources

- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-08-30
- [Clone Graph walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/clone-graph-interview-walkthrough/) — accessed 2026-08-30
- [Depth-first search — Wikipedia](https://en.wikipedia.org/wiki/Depth-first_search) — accessed 2026-08-30
- Classic LeetCode #133 / #138 — clone-with-map family
