# Merge Triplets to Form Target Triplet — answer outline

**Prompt:** Array of triplets `triplets[i] = [ai, bi, ci]` and a `target = [x, y, z]`. You may repeatedly pick two triplets `i ≠ j` and replace `triplets[j]` with the **coordinate-wise max**. Return whether `target` can appear in the array. (LeetCode 1899)

This is **greedy filter + component-wise max**, not “simulate every merge.” Wikipedia [greedy algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm): once a coordinate **exceeds** the target, no later max can shrink it, so that triplet is dead. NeetCode 150 greedy box. Cousin of [coding-hand-of-straights.md](coding-hand-of-straights.md) (discard what cannot start a valid group) and [coding-partition-labels.md](coding-partition-labels.md) (independent coverage of each slice).

## Probes

- Merge only **increases** values. Any `ai > x` or `bi > y` or `ci > z` can never join a merge toward `target`.
- You do **not** need one triplet equal to `target`. Three **safe** triplets can each donate one coordinate.
- A triplet that matches `x` but overshoots `y` is still unusable (the overshoot poisons the merge).
- `n` up to 10^5 — O(n) one pass, O(1) extra space.

## Strong answer skeleton

1. **Clarify:** operation is max, not min or sum; order of merges does not matter; zeros never appear (values ≥ 1).
2. Keep a running max `(d, e, f)` among triplets **dominated** by `target` (all three coords `≤`).
3. Skip any triplet that exceeds in any coordinate.
4. After one pass, return whether `(d, e, f) == target`. Equivalent: three bools “saw a safe donor for x / y / z.”
5. **Complexity:** O(n) time, O(1) space.

## Sketch

```
x, y, z = target
d = e = f = 0
for a, b, c in triplets:
  if a <= x and b <= y and c <= z:
    d, e, f = max(d, a), max(e, b), max(f, c)
return [d, e, f] == target
```

`[[2,5,3],[1,8,4],[1,7,5]]`, target `[2,7,5]`: `[1,8,4]` is skipped (`8 > 7`); the other two max to `[2,7,5]` → `true`. `[[3,4,5],[4,5,6]]`, target `[3,2,5]`: nothing is dominated (`4>2`, `4>2`) → `false`.

Bool form: a safe triplet with `a == x` sets the x-flag; same for y and z; all three flags → `true`.

## Mock narration (30 sec)

> “Maxes only grow, so I throw away any triplet that already overshoots a target coordinate. Among the rest I take the component-wise max. If that equals the target, each coordinate had a donor and the merges can form it.”

## Common mistakes

- Using a triplet that matches one coordinate but exceeds another.
- Requiring a single exact `target` row (the merge exists so you can **assemble** it).
- Simulating pairwise merges (O(n²) and unnecessary; max is associative).
- Taking max over **all** triplets, including the overshooting ones.

## Follow-ups

- **Hand of Straights:** [coding-hand-of-straights.md](coding-hand-of-straights.md) — greedy consume from the current min, not max-merge.
- **Partition Labels:** [coding-partition-labels.md](coding-partition-labels.md) — last-index coverage, still “can this piece stand alone?”
- **If the op were min:** invert the filter (cannot go **below** target) — ask before coding.

## Sources

- [1899. Merge Triplets to Form Target Triplet — LeetCode](https://leetcode.com/problems/merge-triplets-to-form-target-triplet/) — accessed 2026-11-14
- [Merge Triplets to Form Target Triplet — NeetCode](https://neetcode.io/solutions/merge-triplets-to-form-target-triplet) — accessed 2026-11-14
- [1899. Merge Triplets to Form Target Triplet — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/1899/) — accessed 2026-11-14
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-11-14
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-14
