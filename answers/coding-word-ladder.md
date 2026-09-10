# Word Ladder — answer outline

**Prompt:** `beginWord`, `endWord`, dictionary `wordList` (same length, lowercase, distinct). A step changes **exactly one** letter; every intermediate (and `endWord`) must be in `wordList`. Return the **number of words** in the shortest transformation, or `0` if none. (LeetCode 127)

This is **unweighted shortest path** on an implicit word graph — Wikipedia [BFS](https://en.wikipedia.org/wiki/Breadth-first_search). Cousin of [coding-rotting-oranges.md](coding-rotting-oranges.md) (level = distance) and [coding-clone-graph.md](coding-clone-graph.md) (neighbors via a map). Named in [../general/coding-patterns.md](../general/coding-patterns.md). **Not** [coding-word-search.md](coding-word-search.md) (grid DFS + undo).

## Probes

- Length includes `beginWord` (`hit → … → cog` classic = `5`, not `4` edges).
- `endWord` missing from the list → `0`. `beginWord` need **not** be in the list.
- Pairwise “differ by one?” is O(n²·m). Interview upgrade: **wildcard buckets** or 26·m mutations.
- Bidirectional BFS is the usual follow-up, not the first code.

## Strong answer skeleton

1. **Clarify:** return length vs the path; all words length `m`; no `endWord` → `0`.
2. **Graph:** node = word; edge iff Hamming distance 1. BFS from `beginWord`; first hit on `endWord` is shortest.
3. **Neighbors (preferred):** for each word, `m` patterns with one `*` (`hot` → `*ot`, `h*t`, `ho*`). Map pattern → words. From `w`, walk its patterns’ lists. Mark visited **on enqueue**.
4. **Alt:** for each position try `a–z` and test set membership — O(26·m) per word, fine when `m` is small.
5. **Complexity:** O(n · m²) typical (pattern key build + BFS); space O(n · m).

## Sketch (pattern map + BFS)

```
if endWord not in wordList: return 0
bucket[pattern].append(word) for every word and each * slot
q = deque([(beginWord, 1)]); seen = {beginWord}
while q:
  w, dist = popleft
  if w == endWord: return dist
  for each pattern of w:
    for nei in bucket[pattern]:
      if nei not in seen:
        seen.add(nei); q.append((nei, dist + 1))
return 0
```

`beginWord = "hit"`, `endWord = "cog"`, list `hot, dot, dog, lot, log, cog` → `5`. Drop `cog` from the list → `0`.

## Mock narration (30 sec)

> “Words are nodes; one-letter neighbors are edges. I BFS for the shortest ladder and count words, not hops. I bucket by wildcard patterns so I do not compare every pair. If the end word is absent, I return zero immediately.”

## Common mistakes

- Returning **edge count** (off by one vs the LeetCode length).
- Forgetting `endWord ∉ wordList` → `0`.
- DFS / recursion — not shortest; easy TLE.
- Visiting on pop, not enqueue — same word queued many times.
- Building the full n² adjacency when n is thousands.

## Follow-ups

- **Word Ladder II:** all shortest paths — BFS distances, then DFS/BFS only along parent edges.
- **Bidirectional BFS:** expand the smaller frontier; meet in the middle.
- **Generic word-graph:** mutation distance in a dictionary (same BFS).

## Sources

- [Word Ladder — NeetCode](https://neetcode.io/solutions/word-ladder) — accessed 2026-09-10
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-09-10
- [Word Ladder (BFS / bidirectional) — DTDucas](https://dtducas.com/blog/word-ladder) — accessed 2026-09-10
- [LeetCode 127 Word Ladder — JZLeetCode](https://jzleetcode.github.io/posts/leet-0127-word-ladder/) — accessed 2026-09-10
- Classic LeetCode #127 / #126 — implicit word-graph BFS
