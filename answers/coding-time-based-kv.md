# Time Based Key-Value Store — answer outline

**Prompt:** Implement `TimeMap`: `set(key, value, timestamp)` stores a value; `get(key, timestamp)` returns the value with the **largest** `timestamp_prev ≤ timestamp`, or `""` if none. All `set` timestamps for a key are **strictly increasing**. (LeetCode 981)

This is **hash map + binary search for a floor**, not [coding-lru-cache.md](coding-lru-cache.md) (eviction) and not exact-match search. Cousin of [coding-binary-search.md](coding-binary-search.md) (monotone space). NeetCode 150 design/binary-search box. Mentioned as a build-from-scratch flavor in [../companies/ai-labs.md](../companies/ai-labs.md) and [../companies/instacart.md](../companies/instacart.md).

## Probes

- `get` is a **floor**, not equality — missing exact timestamp still returns an earlier set.
- Why the list stays sorted: the problem **guarantees** increasing timestamps on `set` (say if they drop the guarantee).
- Empty key / `get` before first `set` → `""`.
- Do not binary-search a shared global timeline unless they ask; per-key lists are enough.

## Strong answer skeleton

1. **Clarify:** timestamps unique and increasing per key; values are strings; `get` may precede any `set`.
2. **Store:** `map[key] → list of (timestamp, value)` appended in order. `set` is O(1) append.
3. **get:** binary search the list for the rightmost index with `t ≤ timestamp` (upper_bound then step left).
4. **Complexity:** `set` O(1); `get` O(log n) per key’s history; space O(total sets).

## Sketch (per-key list + floor)

```
# set
store[key].append((timestamp, value))

# get — lo, hi = 0, len(arr)
# find last i with arr[i].t <= timestamp
ans = ""
while lo <= hi:
  mid = lo + (hi-lo)//2
  if arr[mid].t <= timestamp:
    ans = arr[mid].v
    lo = mid+1
  else:
    hi = mid-1
return ans
```

`set("foo","bar",1)` then `get("foo",1)` → `"bar"`; `get("foo",0)` → `""`. Later `set("foo","bar2",4)`: `get("foo",3)` still `"bar"`.

## Strong answer skeleton — tree map

`map[key] → TreeMap<timestamp, value>`: `set` is O(log n); `get` is `floorEntry`. Same asymptotics if you cannot assume append-only order. Interview default is the list + bisect because of the increasing-timestamp constraint.

## Mock narration (30 sec)

> “Each key has a history that only grows forward in time, so I append and binary-search for the last stamp that is still ≤ the query. That is a floor, not an exact match — if nothing is early enough I return empty.”

## Common mistakes

- Returning `""` when the exact stamp is missing but an earlier one exists.
- Using `bisect_right` / `upper_bound` and then **not** stepping back one index.
- Linear scan on every `get` after saying O(log n).
- One global list of all keys (then `get` must filter — worse constants, easy bugs).
- Mutating timestamps out of order without switching to a tree.

## Follow-ups

- **No increasing guarantee:** insert with bisect or a tree; `set` becomes O(log n).
- **TTL / eviction:** drop prefix stamps (cousin of LRU + time).
- **Concurrent sets:** per-key lock or copy-on-write history.
- **Memory:** store deltas or mmap if histories are huge — usually out of scope.

## Sources

- [Time Based Key-Value Store — NeetCode](https://neetcode.io/solutions/time-based-key-value-store) — accessed 2026-09-13
- [Time Based Key-Value Store — LeetCode 981](https://leetcode.com/problems/time-based-key-value-store/) — accessed 2026-09-13
- [981. Time Based Key-Value Store — LeetCode Wiki](https://leetcode.doocs.org/en/lc/981/) — accessed 2026-09-13
- [Binary search algorithm — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm) — accessed 2026-09-13
- Classic LeetCode #981 — map of sorted (timestamp, value) lists + floor query
