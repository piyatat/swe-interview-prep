# LFU Cache — answer outline

**Prompt:** Design `LFUCache`: `get(key)` and `put(key, value)` in **O(1)** average time. Evict the **least frequently used** key at capacity. Tie: evict the **least recently used** among that frequency. New keys start at frequency **1**; `get` and `put` both count as a use. Capacity ≥ 1. (LeetCode 460)

Wikipedia [cache replacement](https://en.wikipedia.org/wiki/Cache_replacement_policies): LFU discards the item needed **fewest times**, not the one seen longest ago. That is the follow-up to [coding-lru-cache.md](coding-lru-cache.md) (one recency list). NeetCode hard / design box.

## Probes

- Why not “hash map + scan for min freq”? (O(n) put — they asked O(1).)
- Tie-break is **LRU inside the LFU bucket**, not random / FIFO of insertion into the cache.
- `put` on an **existing** key updates value **and** bumps freq (it is a use).
- `capacity == 0` is out of LC constraints; still mention you would no-op.

## Strong answer skeleton — freq buckets

1. **Clarify:** O(1) get/put; LFU then LRU; get miss → `-1`.
2. **One list is not enough.** Recency ≠ frequency. Need:
   - `key → node` (value, freq, list pointers)
   - `freq → doubly linked list` of nodes at that freq, **MRU at the tail / LRU at the head**
   - `minFreq` scalar so eviction does not scan
3. **touch(node):** detach from `freq` list; if that list is empty **and** `freq == minFreq`, `minFreq++`; append to `freq+1`.
4. **get:** miss → `-1`; else `touch`, return value.
5. **put:** existing → set value, `touch`. New and full → pop **head** of `minFreq` list, delete from key map. Insert at freq 1; **`minFreq = 1`**.
6. **Complexity:** O(1) get/put; O(capacity) space.

Do **not** store timestamps and scan. Do **not** use `OrderedDict` per freq unless you can `popitem(last=False)` in O(1) (Python can; say it).

## Sketch

```
key_to_node: key → {key, val, freq, prev, next}
freq_to_list: freq → DLL (dummy head/tail; LRU = head.next)
minFreq: int

touch(node):
  old = node.freq
  freq_to_list[old].detach(node)
  if freq_to_list[old] empty and old == minFreq: minFreq += 1
  node.freq += 1
  freq_to_list[node.freq].append(node)   # MRU

get(key):
  if key missing: return -1
  touch(key_to_node[key]); return node.val

put(key, val):
  if key present: node.val = val; touch(node); return
  if at capacity: evict = freq_to_list[minFreq].pop_lru(); delete key
  insert node freq=1; minFreq = 1
```

LC sample, cap 2: `put(1), put(2), get(1), put(3)` evicts **2** (freq 1 vs 1’s freq 2). Later `put(4)` with 1 and 3 both at freq 2 evicts **1** (LRU of that bucket).

## Mock narration (30 sec)

> “LFU needs a freq counter; ties need LRU. I keep a map from key to node and a map from frequency to a doubly linked list. `minFreq` points at the eviction bucket. Every hit moves the node to freq+1; a new key always lands at 1 and resets `minFreq`.”

## Common mistakes

- Evicting global LRU (you built 146 again) or FIFO among all keys.
- Forgetting to bump `minFreq` when the old min bucket empties — next evict scans / crashes.
- Inserting a new key **without** setting `minFreq = 1` (a survivor at freq 5 is not LFU).
- `put` overwrite that does **not** count as a use.
- Singly linked lists (cannot detach a middle node in O(1)).

## Follow-ups

- **Thread safety:** one lock around touch + evict, or a concurrent LFU (hard).
- **Aging (LFUDA):** Wikipedia — add a cache-age so old popular keys can die. Name it; do not code it.
- **Redis:** `allkeys-lfu` is a **sampled approximation**, not this exact structure ([coding-lru-cache.md](coding-lru-cache.md) production note).
- **TTL + LFU:** expire independently; eviction policy only runs at capacity.

## Sources

- [460. LFU Cache — LeetCode](https://leetcode.com/problems/lfu-cache/) — accessed 2026-11-23
- [460. LFU Cache — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/460/) — accessed 2026-11-23
- [LFU Cache — NeetCode](https://neetcode.io/solutions/lfu-cache) — accessed 2026-11-23
- [Cache replacement policies (LFU) — Wikipedia](https://en.wikipedia.org/wiki/Cache_replacement_policies) — accessed 2026-11-23
- [Eviction — Redis](https://redis.io/docs/latest/develop/reference/eviction/) — accessed 2026-11-23
