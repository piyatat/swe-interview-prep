# LRU Cache — answer outline

**Prompt:** Design a structure with `get(key)` and `put(key, value)` with O(1) average time; evict least recently used when at capacity.

## Probes

- Why not just a hash map?
- Thread safety? (mention locks or concurrent LRU if senior)
- What defines “use” — get and put both refresh?

## Strong answer skeleton

1. **Clarify:** capacity ≥ 1? get/put on missing key behavior?
2. **Data structures:** `HashMap<key, Node>` + **doubly linked list** (MRU at head, LRU at tail).
3. **get(key):** if missing return -1/null; else move node to head; return value.
4. **put(key, val):** if exists update + move to head; else insert at head, map put; if size > cap remove tail node + map delete.
5. **Complexity:** O(1) get/put average.

## Pseudocode structure

```
class LRU {
  map, head, tail, capacity
  moveToHead(node)
  removeNode(node)
  evictTail()
}
```

## Common mistakes

- Using singly linked list (can't remove middle in O(1))
- Forgetting to update on get (LRU semantics)
- Storing keys only in list without map

## Follow-ups

- LFU cache — different structure (freq buckets)
- Persistent cache — add TTL layer

## Sources

- LeetCode #146 — classic FAANG medium
