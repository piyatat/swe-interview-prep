# Alien Dictionary — answer outline

**Prompt:** `words` is a list of strings **already sorted** in an alien language’s lex order. Return a string of the unique letters in **any** valid alien alphabet order. If the order is **impossible**, return `""`. (LeetCode 269)

This is **constraint graph + topological sort**, not “sort the letters.” Cousin of [coding-course-schedule.md](coding-course-schedule.md) (prereq edges are given; here you **extract** them). Named as a hard graph prompt in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150 graphs box.

## Probes

- Only **adjacent** pairs `words[i]`, `words[i+1]` are needed — transitivity is the topo.
- First index where the two words differ: letter in the **earlier** word comes **before** the later one (`c1 → c2` or the reverse — pick a direction and stick to it).
- Invalid prefix: `["apple","app"]` — a longer word cannot precede its own prefix. Return `""`.
- Cycle (`a` before `b` and `b` before `a`) → `""`.
- Letters that never appear in a differing position still belong in the alphabet if they appear in `words`.
- Multiple valid orders: any one is fine (Kahn’s queue order is enough; do not sort unless they ask for the lexicographically smallest).

## Strong answer skeleton — edges then Kahn

1. **Clarify:** lowercase? only the letters that appear? `""` on conflict; any valid order otherwise.
2. Collect the character set. Compare each adjacent pair:
   - Walk `j` while characters match.
   - If the first word is **longer** and the second is a prefix of it → invalid.
   - Else if `j` is in range for both, add a **unique** edge from the earlier letter to the later.
3. Kahn: indegree, queue of indegree 0, append as you pop, decrement neighbors.
4. If `len(order) != |charset|` → cycle → `""`. Else join.
5. **Complexity:** let `C ≤ 26` (classic) and `L` be total characters. Build edges O(L); topo O(C + E).

DFS / three-color is the same graph: post-order then reverse; a back-edge is a cycle.

## Sketch (Kahn)

```
# edge: earlier letter must appear before later
chars = set of all letters in words
adj, indeg = {c: set() for c in chars}, {c: 0 for c in chars}

for w1, w2 in adjacent pairs:
  n = min(len(w1), len(w2))
  j = 0
  while j < n and w1[j] == w2[j]: j += 1
  if j == n:
    if len(w1) > len(w2): return ""   # prefix violation
  else:
    a, b = w1[j], w2[j]              # a before b
    if b not in adj[a]:
      adj[a].add(b); indeg[b] += 1

q = [c for c in chars if indeg[c] == 0]
out = []
while q:
  c = q.pop(0)
  out.append(c)
  for n in adj[c]:
    indeg[n] -= 1
    if indeg[n] == 0: q.append(n)
return "".join(out) if len(out) == len(chars) else ""
```

`["wrt","wrf","er","ett","rftt"]` → one valid order is `"wertf"`. `["z","x","z"]` → `""`.

## Mock narration (30 sec)

> “The list is already sorted, so each adjacent pair gives at most one letter-order edge at the first mismatch. I also reject a longer word that sits before its own prefix. Then Kahn on that DAG — if I cannot emit every letter, there is a cycle and the dictionary is impossible.”

## Common mistakes

- Comparing every pair of words, not only adjacent — same edges, wasted work; still OK if you keep unique edges.
- Using **string** sort order of Earth-English instead of the given list.
- Forgetting the prefix rule (`["abc","ab"]`).
- Dropping letters that never start an edge.
- Treating a **partial** unique order as failure — unused letters can sit anywhere the edges allow.

## Follow-ups

- **Smallest alphabet string:** Kahn with a **min-heap** instead of a FIFO (only if they ask).
- **Course Schedule II:** same Kahn; edges are input, not inferred.
- **Verify an order:** check every adjacent pair against the permutation — O(L).
- **Unicode / large alphabet:** same algorithm; `C` is unique symbols, not 26.

## Sources

- [Alien Dictionary — NeetCode](https://neetcode.io/solutions/alien-dictionary) — accessed 2026-09-22
- [Alien Dictionary — LeetCode 269](https://leetcode.com/problems/alien-dictionary/) — accessed 2026-09-22
- [Topological sorting — Wikipedia](https://en.wikipedia.org/wiki/Topological_sorting) — accessed 2026-09-22
- [Directed acyclic graph — Wikipedia](https://en.wikipedia.org/wiki/Directed_acyclic_graph) — accessed 2026-09-22
