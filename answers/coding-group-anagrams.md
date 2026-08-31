# Group Anagrams — answer outline

**Prompt:** Given strings `strs`, group **anagrams** together. Order of groups and order inside a group do not matter. (LeetCode 49)

## Probes

- What is the **canonical key**? Sorted string vs count tuple.
- Time: O(n · k log k) vs O(n · k) — when the count key wins.
- Unicode / case / empty strings.
- Why a **list** of counts is not a dict key (must be a tuple or delimited string).

## Strong answer skeleton

1. **Clarify:** lowercase only? empty string is its own group; duplicates of the same word stay in the group.
2. **Insight:** anagrams share a fingerprint. Bucket originals by that key in a hash map; return the buckets.
3. **Key A (simple):** `key = sorted(s)` as a string/tuple. Per word O(k log k).
4. **Key B (linear in k):** 26-length count; `tuple(counts)` or join with a **delimiter** (`#1#0#12…`) so `1,23` ≠ `12,3`.
5. **Complexity:** n words, max length k → A: O(n k log k) time; B: O(n k) time; space O(n k) for output.
6. Say both keys; implement one cleanly.

Listed under hash-map patterns in [../general/coding-patterns.md](../general/coding-patterns.md). Same “normalize then group” move as Valid Anagram (242).

## Sketch (count key)

```
groups = defaultdict(list)
for w in strs:
  cnt = [0] * 26
  for ch in w:
    cnt[ord(ch) - ord('a')] += 1
  groups[tuple(cnt)].append(w)
return list(groups.values())
```

Sorted-key version is shorter and **Unicode-safer**. Count key assumes a fixed alphabet.

## Mock narration (30 sec)

> “I’ll fingerprint each word so anagrams collide. Sorted characters is the obvious key; a 26-count tuple is faster on long strings. Hash map of key → list, then dump the lists.”

## Common mistakes

- Pairwise `sorted(a) == sorted(b)` → O(n² k log k).
- Using the count **list** as a key (unhashable) or joining counts **without** a separator.
- Sorting the **array of words** instead of characters inside each word.
- Dropping empty strings or assuming unique inputs.

## Follow-ups

- **Valid Anagram (242)** — one pair; counts or sort.
- Case-insensitive / strip punctuation — normalize in a helper; grouping logic unchanged.
- Stream / too big for memory — shard by canonical key (MapReduce-shaped).
- Top-K largest groups — heap on bucket sizes ([coding-top-k.md](coding-top-k.md)).

## Sources

- [Anagram — Wikipedia](https://en.wikipedia.org/wiki/Anagram) — accessed 2026-08-31
- [Group anagrams: canonical key — FDEInterviews](https://fdeinterviews.com/q/group-anagrams-canonical-key) — accessed 2026-08-31
- [49. Group Anagrams — Codinginterview.com](https://www.codinginterview.com/problems/49-group-anagrams/) — accessed 2026-08-31
- [Group Anagrams — AlgoMaster](https://algomaster.io/learn/dsa/group-anagrams) — accessed 2026-08-31
- Classic LeetCode #49 — hash map + canonical key
