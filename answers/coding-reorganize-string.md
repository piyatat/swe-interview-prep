# Reorganize String — answer outline

**Prompt:** Rearrange string `s` so **no two adjacent** characters are the same. Return **any** valid string, or `""` if impossible. Lowercase letters; `n ≤ 500`. (LeetCode 767)

This is **greedy placement**, not [coding-task-scheduler.md](coding-task-scheduler.md) (cooldown **frames** / idle count) and not [coding-partition-labels.md](coding-partition-labels.md) (last-index cuts). NeetCode 250 heap box. Wikipedia [greedy algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm).

## Probes

- Impossible iff one letter appears more than `⌈n/2⌉` times (`maxf > (n + 1) // 2`).
- Any valid order is fine — do not search for lexicographically smallest unless they change the prompt.
- Follow-up: **k distance** (LeetCode 358, premium) — same heap + cooldown queue with `k` instead of 2.
- Empty / `n == 1` is already valid.

## Strong answer skeleton

1. **Clarify:** adjacent means index `i` and `i+1`; return `""` vs throw; only `a–z`?
2. **Count** 26 buckets. If `max(count) > (n + 1) // 2`, return `""`.
3. **Even-slot fill (usual O(n) pitch):** place the most frequent letter on indices `0, 2, 4, …`; when the even lane fills, wrap to `1`. Remaining letters fill the leftover even/odd slots the same way. Adjacent copies cannot meet because you skip one index.
4. **Heap + cooldown (same as “rearrange k apart” with `k = 2`):** max-heap of remaining counts; pop, append, stash as `prev`; after the next pop, push `prev` back if count remains. If the heap is empty while `prev` still has leftover, fail.
5. **Complexity:** count O(n); heap is O(n log 26). Even-slot is O(n) after the count.

## Sketch (even indices)

```
count[26]; if max > (n+1)//2: return ""
ans = [None]*n; i = 0
for ch, f in most_common(count):
    while f:
        ans[i] = ch; f -= 1; i += 2
        if i >= n: i = 1
return join(ans)
```

`"aab"` → even: `a _ a`, wrap: `a b a`. `"aaab"` → `maxf = 3 > 2` → `""`.

Heap twin: always emit the currently most frequent letter that is **not** the one you just wrote.

## Mock narration (30 sec)

> “If any letter is more than half the string, rounded up, it is impossible. Otherwise I drop the most frequent letter on even indices so copies cannot sit next to each other, then fill the rest. Same idea as a max-heap that refuses to reuse the last character.”

## Common mistakes

- Checking `maxf > n/2` with truncating integer divide (`n=3`, `maxf=2` is **possible** — need `(n+1)//2`).
- Filling sequentially (`aaa…`) then swapping — easy to miss a stuck pair.
- Returning the frequency map or a boolean instead of a string.
- Sorting the string and hoping (`aabb` is already invalid as sorted).
- Confusing this with Task Scheduler (there you **may idle**; here you **cannot** insert fillers — fail instead).

## Follow-ups

- **Task Scheduler (621):** [coding-task-scheduler.md](coding-task-scheduler.md) — idle frames allowed; formula vs heap.
- **Longest Happy String (1405):** same greedy, three letters, no three-in-a-row.
- **Rearrange String k Distance Apart (358):** cooldown queue of length `k`.

## Sources

- [767. Reorganize String — LeetCode](https://leetcode.com/problems/reorganize-string/) — accessed 2026-11-26
- [Reorganize String — NeetCode](https://neetcode.io/solutions/reorganize-string) — accessed 2026-11-26
- [767. Reorganize String — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/767/) — accessed 2026-11-26
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-11-26
- [NeetCode 250 list by topic — Thita](https://thita.ai/blog/dsa/neetcode-250-complete-list-by-topic) — accessed 2026-11-26
