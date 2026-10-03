# Insert Delete GetRandom O(1) — answer outline

**Prompt:** Implement `RandomizedSet`: `insert`, `remove` (both bool, no-ops if already / not present), and `getRandom` (uniform over **current** members). Average **O(1)** per op. (LeetCode 380)

A hash set alone cannot pick uniformly in O(1) without an indexable store. An array alone deletes in O(n). Sibling of [coding-min-stack.md](coding-min-stack.md) (aux structure for an extra contract) and [coding-lru-cache.md](coding-lru-cache.md) (map + list). Wikipedia [Hash table](https://en.wikipedia.org/wiki/Hash_table). NeetCode 150 design box.

## Probes

- `getRandom` is guaranteed only when the set is **non-empty**.
- Duplicates: `insert` returns false; this is a **set**, not a multiset (380, not 381).
- Average O(1) — hash + append / pop. Worst-case hash spikes are accepted.
- Uniform: each **live** value, not historical inserts. Do not sample a sparse array with holes.

## Strong answer skeleton — array + index map

1. **Clarify:** values are ints; at most ~2e5 ops; `getRandom` never on empty in the usual statement.
2. `vals` — compact list of members. `idx` — `val → index in vals`.
3. **insert:** if `val in idx` → false. Else append and record `idx[val] = len-1`.
4. **remove:** if missing → false. Else **swap-with-last**, pop, repair the moved key’s index, delete `val` from `idx`.
5. **getRandom:** `vals[rand() % len]`.
6. **Complexity:** average O(1) time; O(n) space.

## Sketch

```
idx, vals = {}, []

insert(x):
  if x in idx: return False
  idx[x] = len(vals); vals.append(x); return True

remove(x):
  if x not in idx: return False
  i = idx[x]; last = vals[-1]
  vals[i] = last; idx[last] = i
  vals.pop(); del idx[x]
  return True

getRandom():
  return choice(vals)
```

Remove last element: swap is a no-op if you **update `idx[last]` before `del idx[x]`** — when `x` is last, write `idx[x] = i` then delete `x`. Order: copy last into `i`, set `idx[last] = i`, pop, then `del idx[x]`.

## Mock narration (30 sec)

> “Uniform random needs an array. Deletes in an array are O(n) unless I swap the victim with the last slot and pop. The hash map stores each value’s index so I can find the hole in O(1) and fix the element I moved.”

## Common mistakes

- Deleting from the middle of the array (O(n)) or leaving a hole (biased / crashy random).
- Forgetting to update the **moved** element’s index after the swap.
- `del idx[x]` **before** using `idx[last] = i` when `x` is last — or the reverse bug that leaves a stale index.
- Sampling a set iterator (O(n) in many languages) and calling it O(1).
- Building 381 (duplicates) with this map — need a map to a **collection** of indexes.

## Follow-ups

- **Duplicates allowed (381):** `val → set of indexes`; remove any one index, then swap-pop.
- **RandomizedCollection / weighted random:** prefix sums + fenwick, or alias method — not this.
- **O(1) getRandom + range queries:** different structure; say you would not bolt it on.
- **Thread safety:** this is single-threaded; a lock around the pair of structures if they escalate.

## Sources

- [Insert Delete GetRandom O(1) — NeetCode](https://neetcode.io/solutions/insert-delete-getrandom-o1) — accessed 2026-10-03
- [380. Insert Delete GetRandom O(1) — LeetCode Wiki](https://leetcode.doocs.org/en/lc/380/) — accessed 2026-10-03
- [Insert Delete GetRandom O(1) — LeetCode 380](https://leetcode.com/problems/insert-delete-getrandom-o1/) — accessed 2026-10-03
- [Hash table — Wikipedia](https://en.wikipedia.org/wiki/Hash_table) — accessed 2026-10-03
