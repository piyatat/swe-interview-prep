# Implement Trie — answer outline

**Prompt:** Implement a prefix tree supporting `insert(word)`, `search(word)` (full word), and `startsWith(prefix)`. (LeetCode 208)

Wikipedia: a **trie** (re**trie**val) stores strings by sharing prefixes; a node at depth *d* is a unique prefix of length *d*. Listed as a core pattern in [../general/coding-patterns.md](../general/coding-patterns.md). System-design cousin: [system-design-autocomplete.md](system-design-autocomplete.md).

## Probes

- Node layout: children **map** vs **array[26]** — Unicode vs lowercase a–z.
- `search` vs `startsWith` — only `search` checks **end-of-word**.
- Empty string: is it a word? Usually no unless they insert `""`.
- Complexity in **word length L**, not number of keys (that is the point).

## Strong answer skeleton

1. **Clarify:** alphabet, case, delete?, counts vs boolean.
2. **Node:** `children: Map<char, Node>`, `isEnd: bool`. Root is an empty node (no character).
3. **insert:** walk/create one node per character; set `isEnd` on the last.
4. **search:** walk; missing child → false; at end return `isEnd`.
5. **startsWith:** same walk; return true if the path exists.
6. **Complexity:** O(L) time per op. Space O(total characters) worst case; shared prefixes save nodes.

Helper `_walk(s) -> Node | null` keeps search/startsWith from drifting.

## Sketch

```
class Node:
  children = {}   # or [None]*26
  isEnd = False

insert(word):
  cur = root
  for ch in word:
    if ch not in cur.children: cur.children[ch] = Node()
    cur = cur.children[ch]
  cur.isEnd = True

search(word):
  cur = walk(word)
  return cur is not None and cur.isEnd

startsWith(prefix):
  return walk(prefix) is not None
```

Array[26]: index `ord(ch) - ord('a')`. Faster constant, wastes slots, ASCII-only.

## Mock narration (30 sec)

> “A trie is a tree of characters. Shared prefixes share nodes. Insert creates the missing spine and marks the last node as a word. Search is the same walk plus the end flag — otherwise `'app'` would match after inserting only `'apple'`. StartsWith is the walk without the flag.”

## Common mistakes

- Using `isEnd` in `startsWith` (or forgetting it in `search`).
- Storing the full string on every node (defeats sharing).
- Null root / not creating children on insert.
- Claiming O(1) search like a hash map of whole words — prefix query is why you built this.

## Follow-ups

- **Add and Search Word (211):** `.` wildcard — DFS children at that step.
- **Word Search II (212):** trie of words + board DFS; prune `isEnd` / delete leaves.
- **Delete:** unmark `isEnd`; prune nodes with no children and not `isEnd`.
- Compressed / radix trie if they mention memory (IP tables, long keys).

## Sources

- [Trie — Wikipedia](https://en.wikipedia.org/wiki/Trie) — accessed 2026-08-29
- [Implement Trie walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/implement-trie-interview-walkthrough/) — accessed 2026-08-29
- [LLD: Trie data structure — techinterview.org](https://www.techinterview.org/post/3233472900/lld-trie-data-structure/) — accessed 2026-08-29
- [Trie interview problems — TheCodeForge](https://thecodeforge.io/interview/trie-interview-problems/) — accessed 2026-08-29
- Classic LeetCode #208 / #211 / #212 — prefix-tree family
