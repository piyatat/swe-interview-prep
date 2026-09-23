# Word Search II — answer outline

**Prompt:** `m × n` board of letters and a list `words`. Return **all** words that can be spelled by walking **4-adjacent** cells, **using each cell at most once** on that path. Order of the answer does not matter; each word at most once. (LeetCode 212)

This is **one board DFS + a trie of the dictionary**, not a separate [coding-word-search.md](coding-word-search.md) (LC 79) per word. Cousin of [coding-trie.md](coding-trie.md) (prefix prune). Named with the trie family in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150; Wikipedia [trie](https://en.wikipedia.org/wiki/Trie).

## Probes

- 4-dir only; no diagonal; no wrap. Same letter may appear many times; **the cell** cannot be reused on **this** path.
- Duplicate `words` → return the word once. A word can be found from more than one start — still once.
- Empty `words` → `[]`. `1×1` board / length-1 words.
- Why not run LC 79 per word? Shared prefixes repeat the same walks; the trie shares that work and **prunes** dead prefixes.
- Constraints (typical LC): board ≤ 12×12, words ≤ ~3×10⁴, length ≤ 10 — `O(m n · 4 · 3^{L-1})` plus trie build is the intended bound.

## Strong answer skeleton — trie + DFS

1. **Clarify:** case; mutate-and-restore OK; they want the list, not paths.
2. **Insert** every word into a trie. Store the **full word** (or its index) on the terminal node so you do not rebuild the string.
3. From **every** cell, DFS with a pointer at the **root**. Child missing → prune.
4. On a terminal, append the word and **clear the terminal** (`word = None` / `ref = -1`) so a second path cannot duplicate it.
5. Mark the cell (`#` or a visit set), recurse 4-neighbors, **undo**.
6. Optional: if a node has no children left after a find, **delete** it from the parent — later starts prune earlier.
7. **Complexity:** build O(total characters). Search O(m n · 4 · 3^{L-1}) in the usual “first step 4, then 3” bound (NeetCode); extra space O(trie + path).

Per-word DFS is the same idea and TLE on the large dictionary.

## Sketch (word on terminal)

```
# TrieNode: children {}, word = None
for w in words: insert w; terminal.word = w
ans = []

def dfs(r, c, node):
  ch = board[r][c]
  if ch not in node.children: return
  nxt = node.children[ch]
  if nxt.word:
    ans.append(nxt.word); nxt.word = None
  board[r][c] = "#"
  for nr, nc in neighbors:
    if in_bounds and board[nr][nc] != "#":
      dfs(nr, nc, nxt)
  board[r][c] = ch
  if not nxt.children and not nxt.word:
    del node.children[ch]

for each cell: dfs(r, c, root)
return ans
```

Walk a 1×2 board `o a` with `words = ["oath","oa"]`: both can hit; clearing `word` prevents a second report of `"oa"`.

## Mock narration (30 sec)

> “I put the dictionary in a trie so one board walk answers every word. From each cell I only step onto a child. When I land on a stored word I emit it and clear the flag. I mark the cell, recurse, then restore. Dead leaves I delete so later starts prune. That is Word Search plus prefix sharing.”

## Common mistakes

- Running LC 79 in a loop — shared prefixes redo the same DFS.
- Forgetting to **undo** the `#` (or leaving `word` set → duplicates).
- Checking `isEnd` but continuing without allowing **a word that is a prefix** of another (`oa` then `oath`).
- A global visit set across starts — each start needs its own path mark.
- Reconstructing the string with a shared list and forgetting to pop.

## Follow-ups

- **Word Search (79):** no trie; one target string — see [coding-word-search.md](coding-word-search.md).
- **Prune empty branches:** delete the child when `children` and `word` are empty after a find.
- **Unicode / mixed case:** map children, not `ord(c) - 'a'`.
- **Stream of words / huge board:** mention inverted index of cells per letter, still DFS + trie.

## Sources

- [Word Search II — NeetCode](https://neetcode.io/solutions/word-search-ii) — accessed 2026-09-23
- [Word Search II — LeetCode 212](https://leetcode.com/problems/word-search-ii/) — accessed 2026-09-23
- [Trie — Wikipedia](https://en.wikipedia.org/wiki/Trie) — accessed 2026-09-23
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-09-23
