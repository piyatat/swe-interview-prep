# Hand of Straights — answer outline

**Prompt:** Array `hand` of card values and integer `groupSize`. Split **every** card into groups of length `groupSize` whose values are **consecutive** (`x, x+1, …, x+groupSize-1`). Return whether it is possible. (LeetCode 846; same as Divide Array in Sets of K Consecutive Numbers, 1296)

This is **greedy from the current minimum**, not “sort and chunk.” Wikipedia [greedy algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm): once you leave a leftover `x`, a later group cannot start below `x`. NeetCode 150 greedy box. Cousin of [coding-task-scheduler.md](coding-task-scheduler.md) (counts + greedy consume) and [coding-partition-labels.md](coding-partition-labels.md) (must take a whole span).

## Probes

- `len(hand) % groupSize != 0` → immediate `false` (cards must all be used).
- Always start a group at the **smallest remaining** value. If `x` remains, some group must include it as its minimum.
- Duplicates: frequency map, not a set. `[1,2,3,6,2,3,4,7,8]`, `groupSize=3` → `true` (`123`, `234`, `678`).
- `groupSize == 1` → always `true`. Gaps (`1,2,4` with size 3) fail.

## Strong answer skeleton

1. **Clarify:** consecutive means `+1` each step, not same suit; every card used once; values can repeat.
2. **Count** with a map (or sorted dict / min-heap of keys).
3. While cards remain: let `x` be the smallest key with `count[x] > 0`. Try to consume one of each `x, x+1, …, x+w-1`. If any count is 0, `false`. Decrement; drop keys that hit 0.
4. Repeat until empty → `true`.
5. **Complexity:** O(n log n) if you sort unique keys or heapify; O(n) extra space. n ≤ 10^4 on LC — log n is the intended bar.

## Sketch (sorted keys + counts)

```
if len(hand) % groupSize: return False
count = Counter(hand)
for x in sorted(count):
  while count[x] > 0:
    for d in range(groupSize):
      if count[x + d] == 0: return False
      count[x + d] -= 1
return True
```

`[1,2,3,3,4,5,6,7]`, `groupSize=4` → start at 1 needs `1,2,3,4` (ok), leftover `3,5,6,7` is not consecutive → `false`.

Heap twin: min-heap of keys that still have count; after a group, push back keys that remain.

## Mock narration (30 sec)

> “If the length is not a multiple of group size it is impossible. I count frequencies and always open a group at the smallest leftover card, then demand the next groupSize-1 values. If any is missing I fail; if I drain the map I succeed.”

## Common mistakes

- Sorting and taking slices `[0:w], [w:2w], …` — groups are not contiguous in the sorted unique list when duplicates exist.
- Starting groups at an arbitrary `x` instead of the current minimum (you can strand a small leftover).
- Using a set (collapses duplicates) or forgetting to `continue` when `count[x]` is already 0 after earlier groups.
- Treating consecutive as “same remainder” (that is partition-labels / hashing, not this).

## Follow-ups

- **Divide Array in Sets of K Consecutive (1296):** identical; `k` is `groupSize`.
- **Task Scheduler:** [coding-task-scheduler.md](coding-task-scheduler.md) — greedy on **max** frequency, not min key.
- **Hand of Straights with wrap-around / circular:** not this problem; ask before assuming modulo.

## Sources

- [846. Hand of Straights — LeetCode](https://leetcode.com/problems/hand-of-straights/) — accessed 2026-11-12
- [Hand of Straights — NeetCode](https://neetcode.io/solutions/hand-of-straights) — accessed 2026-11-12
- [846. Hand of Straights — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/846/) — accessed 2026-11-12
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-11-12
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-12
