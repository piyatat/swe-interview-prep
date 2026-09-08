# Word Search — answer outline

**Prompt:** `m × n` board of letters and a string `word`. Return whether `word` can be spelled by walking **4-adjacent** cells, **using each cell at most once** on that path. (LeetCode 79)

This is **grid DFS + undo**, not flood-fill. Cousin of [coding-subsets.md](coding-subsets.md) (choose / explore / unchoose) and [coding-number-of-islands.md](coding-number-of-islands.md) (grid neighbors) — here you **restore** the cell because another start or branch may need it. Wikipedia [backtracking](https://en.wikipedia.org/wiki/Backtracking): abandon a partial path the moment it cannot work. Word Search II is the trie follow-up on [coding-trie.md](coding-trie.md).

## Probes

- 4-dir only; no diagonal; no wrapping.
- Same letter may appear many times; **the cell** cannot be reused on **this** path.
- Empty `word` / `1×1` board?
- Why `O(m · n · 3^L)` not `4^L`? After the first step you do not walk back to the parent.

## Strong answer skeleton

1. **Clarify:** case-sensitive; board may be mutated if you restore; they want `bool`, not the path.
2. **Try every start** where `board[r][c] == word[0]`.
3. **DFS `(r, c, i)`:** `i` is the index in `word` you are matching now.
4. **Fail fast:** out of bounds, mismatch, or already on this path.
5. **Success:** `i == len(word)` (or you just matched the last char).
6. **Mark / recurse / unmark:** sentinel `'#'` on the board, or a `visited` set; **always restore** after the four neighbors (even if one of them returned true — ancestors still unwind).
7. **Complexity:** `O(m n · 3^L)` time, `O(L)` stack (in-place) or `O(mn)` if you keep a visited grid.

## Sketch (in-place sentinel)

```
def exist(board, word):
  m, n = len(board), len(board[0])
  def dfs(r, c, i):
    if i == len(word): return True
    if not (0 <= r < m and 0 <= c < n) or board[r][c] != word[i]:
      return False
    ch = board[r][c]
    board[r][c] = '#'
    found = (dfs(r+1,c,i+1) or dfs(r-1,c,i+1)
          or dfs(r,c+1,i+1) or dfs(r,c-1,i+1))
    board[r][c] = ch
    return found
  return any(dfs(r, c, 0) for r in range(m) for c in range(n))
```

Classic: `[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]`, `"ABCCED"` → true; `"ABCB"` → false (the only `B` cannot be reused).

## Mock narration (30 sec)

> “I start DFS from every cell that matches the first letter. The state is position plus how much of the word I have. I mark the cell so this path cannot reuse it, recurse to four neighbors, then unmark. First full match wins. Linear in starts times a small branching factor in the word length.”

## Common mistakes

- Forgetting **undo** — a later start sees `'#'` and you return false on a solvable board.
- 8-directional moves, or wrapping the grid.
- Checking visited **before** matching the character in a way that skips the success base case.
- Treating it like islands: mark forever instead of per-path.

## Follow-ups

- **Word Search II (212):** insert all words in a trie; DFS once; prune dead prefixes.
- Rare-letter / reverse-word prune when `L` is long and the last char is rarer than the first.
- Return the path coordinates, not only `bool`.

## Sources

- [Word Search — NeetCode](https://neetcode.io/solutions/word-search) — accessed 2026-09-08
- [Word search and grid backtracking — The DSA Handbook](https://dsa.handbook.academy/curriculum/recursion-backtracking/word-search/) — accessed 2026-09-08
- [Word Search (LeetCode #79) — DSA Prep](https://www.dsaprep.dev/blog/word-search-leetcode-solution) — accessed 2026-09-08
- [Backtracking — Wikipedia](https://en.wikipedia.org/wiki/Backtracking) — accessed 2026-09-08
