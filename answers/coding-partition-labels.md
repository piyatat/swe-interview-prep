# Partition Labels — answer outline

**Prompt:** Split string `s` (lowercase letters) into as many parts as possible so **each letter appears in at most one part**. Return the **sizes** of those parts in order. (LeetCode 763)

This is a **greedy last-index sweep**, cousin of [coding-merge-intervals.md](coding-merge-intervals.md) (overlap → extend) and [coding-jump-game-ii.md](coding-jump-game-ii.md) (grow a window until you must cut). NeetCode 150 greedy box. Wikipedia [Greedy algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm).

## Probes

- A letter’s **first and last** index must sit in the **same** part. If `a` appears at 0 and 8, nothing between can be a cut.
- Maximize **count of parts** (equivalently: cut as soon as the current farthest last-index is reached).
- Parts are contiguous substrings — you may not rearrange.
- `n` up to a few hundred on some statements; the live bar is still **O(n)** after one last-index pass, not O(n²) rescans.

## Strong answer skeleton — last index + running end

1. **Clarify:** return lengths, not the slices; alphabet is 26 lowercase unless they say otherwise.
2. **Precompute** `last[c] =` rightmost index of `c` (map or size-26 array).
3. Scan `i = 0 … n-1` with `end = 0`, `size = 0`:
   - `size += 1`
   - `end = max(end, last[s[i]])`
   - if `i == end`: emit `size`, reset `size = 0`
4. The cut is safe: every letter seen in the part has its last occurrence `≤ end`, and we took the **earliest** such `end`.
5. **Complexity:** O(n) time, O(Σ) extra space (26).

Interval view: each letter is `[first, last]`; merge overlaps left-to-right; emit merged widths. Same algorithm.

## Sketch

```
def partitionLabels(s):
  last = {c: i for i, c in enumerate(s)}
  res, size, end = [], 0, 0
  for i, c in enumerate(s):
    size += 1
    end = max(end, last[c])
    if i == end:
      res.append(size)
      size = 0
  return res
```

`"ababcbacadefegdehijhklij"` → `[9,7,8]`. `"eccbbbbdec"` → `[10]`. `"a"` → `[1]`.

## Mock narration (30 sec)

> “I record each letter’s last index. Walking left to right I stretch the current part to the farthest last-seen letter. When I land on that index, every letter in the part is finished, so I cut and start a new size. Two passes, constant alphabet space.”

## Common mistakes

- Looking up last-index **inside** the scan without a first pass — hidden O(n²).
- Forgetting to reset `size` after a cut (sizes accumulate).
- Cutting when `i > end` or `i >= end` with a fencepost that merges or splits wrong.
- Sorting unique letters and packing greedily — order in `s` is fixed.
- Returning the slices as strings when they asked for **ints**.

## Follow-ups

- **Merge Intervals (56):** same extend-on-overlap — [coding-merge-intervals.md](coding-merge-intervals.md).
- **Partition labels on a general alphabet** — hash map instead of 26.
- **Minimum number of partitions** with an extra constraint (e.g. max part length) — different DP.
- Return the slices themselves — keep `start` and emit `s[start:end+1]`.

## Sources

- [Partition Labels — NeetCode](https://neetcode.io/solutions/partition-labels) — accessed 2026-10-14
- [763. Partition Labels — LeetCode Wiki](https://leetcode.doocs.org/en/lc/763/) — accessed 2026-10-14
- [Partition Labels — LeetCode 763](https://leetcode.com/problems/partition-labels/) — accessed 2026-10-14
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-10-14
