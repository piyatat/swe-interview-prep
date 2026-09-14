# Copy List with Random Pointer — answer outline

**Prompt:** Each node has `val`, `next`, and `random` (`random` → any node or `null`). Return a **deep copy**: new nodes only; `next` / `random` must point at copies, never originals. (LeetCode 138)

Same **registry** idea as [coding-clone-graph.md](coding-clone-graph.md) (map original → clone before walking neighbors). Graph edges here are two named pointers, not a list. Vals are **not** unique — key the map by **node identity**. Cousin of [coding-linked-list.md](coding-linked-list.md) (rewiring `next` only). NeetCode 150 linked-list box; common Meta-style follow-up: copy a tree with random pointers (same map).

## Probes

- Empty list → `None`. Single node with `random` to self.
- `random` can form cycles; `next` is a linear list (classic) — still copy `random` even if it points backward.
- Deep vs shallow: `copy.random is orig.random` is a fail.
- Two-pass vs one-pass map; O(1)-extra **weave** follow-up (they may not require it).

## Strong answer skeleton — hashmap

1. **Clarify:** `random` may be null; n up to ~10³ in the classic; identity ≠ value.
2. **Pass 1:** walk `next`; for each node `cloned[node] = Node(node.val)` (or create on demand).
3. **Pass 2:** `cloned[node].next = cloned.get(node.next)`; same for `random` (`None` stays `None`).
4. **One-pass / recursion:** `copy(node)`: if in map return it; else allocate, store, then set `next`/`random` via `copy(...)`. Same O(n) map.
5. **Complexity:** O(n) time and O(n) extra for the map.

## Sketch (two-pass map)

```
if not head: return None
cloned = {}
cur = head
while cur:
  cloned[cur] = Node(cur.val)
  cur = cur.next
cur = head
while cur:
  cloned[cur].next = cloned.get(cur.next)
  cloned[cur].random = cloned.get(cur.random)
  cur = cur.next
return cloned[head]
```

`[[7,null],[13,0],[11,4],[10,2],[1,0]]` — node `13.random` → first node; copies must not alias.

## Strong answer skeleton — weave (O(1) extra)

LeetCode editorial pattern: insert `copy` after each original (`A → A' → B → B'`). Second walk: `A'.random = A.random.next` if `A.random`. Third: unweave originals vs copies. Do **not** start here unless they ban the map — easy to corrupt the input if you forget to restore `next`.

## Mock narration (30 sec)

> “Random edges mean I cannot copy `next` and `random` in one naive walk — the target may not exist yet. I allocate every clone first, keyed by the original object, then wire both pointers through the map. If they want constant extra space I can interleave copies on `next` and read `random` as `orig.random.next`.”

## Common mistakes

- Keying the map by `val` (duplicates).
- Setting `copy.next = orig.next` (shallow).
- Forgetting `random is None`.
- Recursing on `next` and `random` **without** registering the clone first (cycles / diamonds).
- Weave: leaving the original list tangled.

## Follow-ups

- **Clone graph (133):** neighbor list instead of two fields — [coding-clone-graph.md](coding-clone-graph.md).
- **Random on a tree:** same hashmap; BFS/DFS both work.
- **Serialize:** include random as an index; round-trip is a separate problem.

## Sources

- [Copy List with Random Pointer — NeetCode](https://neetcode.io/solutions/copy-list-with-random-pointer) — accessed 2026-09-14
- [Copy List with Random Pointer — LeetCode 138](https://leetcode.com/problems/copy-list-with-random-pointer/) — accessed 2026-09-14
- [Object copying — Wikipedia](https://en.wikipedia.org/wiki/Object_copying) — accessed 2026-09-14
- [Clone a linked list with next and random pointer — GeeksforGeeks](https://www.geeksforgeeks.org/dsa/a-linked-list-with-next-and-arbit-pointer/) — accessed 2026-09-14
- Classic LeetCode #138 — identity map, then optional weave
