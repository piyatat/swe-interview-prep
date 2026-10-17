# Design Add and Search Words — answer outline

**Prompt:** `WordDictionary` with `addWord(word)` and `search(word)`. Search may include `.`, which matches **any one letter**. (LeetCode 211)

Wildcard sibling of [coding-trie.md](coding-trie.md) (same spine; DFS when you see `.`). Not regex in general (`.*`, `+`) and not [coding-word-search-ii.md](coding-word-search-ii.md) (board + many words). NeetCode 150. Wikipedia [Trie](https://en.wikipedia.org/wiki/Trie).

## Probes

- `.` is **one** character, not a Kleene star. `"b.."` matches `"bad"`; it does not skip.
- Exact search is a trie walk. A hash set of words fails when `.` appears (scan-all is the brute they want you to reject).
- LC: lowercase add; search is letters or `.`; **at most two dots**; `n ≤ 25`; ≤ 10⁴ calls. That caps DFS branching: O(26² · L), not “exponential in L”.
- `search` must land on `isEnd`, not merely a prefix (`add "bad"` then `search "ba"` is false).

## Strong answer skeleton — trie + DFS on dot

1. **Clarify:** alphabet; multiple `.`; empty word; add vs search mixed.
2. **Brute:** store a list; on search scan every same-length word. O(#words · L) per query.
3. **Trie:** `children` map or `array[26]`, `isEnd`. `addWord` is ordinary insert.
4. **search:** recursive `dfs(i, node)`. Letter → one child. `.` → try every non-null child. At `i == len` return `node.isEnd`.
5. **Complexity:** add O(L). Search O(L) with no dots; with ≤2 dots, O(26² · L) as they constrain. Space O(total characters).

Do not compile a regex per query. Do not copy the whole remaining suffix into a new string on each recursive call if you can pass an index.

## Sketch (index DFS)

```
class Node:
  children = {}
  isEnd = False

class WordDictionary:
  def __init__(self):
    self.root = Node()
  def addWord(self, word):
    cur = self.root
    for ch in word:
      if ch not in cur.children: cur.children[ch] = Node()
      cur = cur.children[ch]
    cur.isEnd = True
  def search(self, word):
    def dfs(i, node):
      if i == len(word): return node.isEnd
      ch = word[i]
      if ch == '.':
        return any(dfs(i + 1, c) for c in node.children.values())
      if ch not in node.children: return False
      return dfs(i + 1, node.children[ch])
    return dfs(0, self.root)
```

`add "bad","dad","mad"` → `search "pad"` false, `"bad"` true, `".ad"` true, `"b.."` true.

## Mock narration (30 sec)

> “I store words in a trie. Add is a normal spine. Search walks with an index; a letter follows one edge, a dot fans out to every child. I only return true if some path consumes the whole pattern and ends on a word flag. With at most two dots the fan-out stays bounded.”

## Common mistakes

- Treating `.` as “any remaining suffix” (regex `.*`).
- Returning true on a prefix (`isEnd` forgotten).
- Scanning a list and calling it O(1).
- Recursing on `.` even when `children` is empty (should be false).
- Mutating a shared node pointer across sibling `.` branches.

## Follow-ups

- **Implement Trie (208):** no wildcard — [coding-trie.md](coding-trie.md).
- **Word Search II (212):** trie of words + board DFS — [coding-word-search-ii.md](coding-word-search-ii.md).
- **More than two dots / Unicode:** map children; quote the blow-up.
- **Delete / prefix count:** extra fields on the node.

## Sources

- [Design Add and Search Words — NeetCode](https://neetcode.io/solutions/design-add-and-search-words-data-structure) — accessed 2026-10-17
- [211. Design Add and Search Words Data Structure — LeetCode Wiki](https://leetcode.doocs.org/en/lc/211/) — accessed 2026-10-17
- [Design Add and Search Words Data Structure — LeetCode 211](https://leetcode.com/problems/design-add-and-search-words-data-structure/) — accessed 2026-10-17
- [Trie — Wikipedia](https://en.wikipedia.org/wiki/Trie) — accessed 2026-10-17
