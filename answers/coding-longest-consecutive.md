# Longest Consecutive Sequence — answer outline

**Prompt:** Unsorted `nums`. Return the length of the longest **consecutive** run you can form (order in `nums` does not matter). Must be **O(n)**. (LeetCode 128)

This is the hash-set “only walk from **run starts**” trick. Listed as a medium sample in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- Consecutive means `x, x+1, x+2, …` as **values**, not indices.
- Duplicates do not extend a run (`[1,2,2,3]` → 3).
- Sort-and-scan is correct and **O(n log n)** — they asked for linear.
- Nested `while` is O(n) **amortized** only if you skip non-starts.

## Strong answer skeleton

1. **Clarify:** empty → `0`; negatives OK; duplicates OK; they want **length**, not the run itself.
2. **Sort trap:** sort, unique, scan adjacent diffs of 1. Fine if they drop the O(n) constraint.
3. **Set:** `seen = set(nums)` — O(1) membership, dedupes.
4. **Gate:** `x` starts a run iff `x-1 ∉ seen`. Only then walk `x, x+1, …` while present.
5. **Why O(n):** each value is an outer-loop check once and an inner-loop visit **at most once** (it belongs to one run). Without the gate, `[1..n]` is O(n²).
6. **Complexity:** O(n) time average (hash), O(n) space. `TreeSet` is O(n log n) — same as sort.

## Sketch

```
seen = set(nums)
best = 0
for x in seen:
  if x - 1 in seen:
    continue
  length = 1
  while x + length in seen:
    length += 1
  best = max(best, length)
return best
```

`[100,4,200,1,3,2]` → starts 100, 200, 1 → walk `1..4` → 4.

Iterate **`seen`**, not `nums`, so duplicates do not pay a second inner walk.

## Mock narration (30 sec)

> “I’ll only start a walk at a number that has no predecessor in the set. That makes each run counted once, so the nested loop is linear. Hash set for membership; track the max length.”

## Common mistakes

- Walking forward from **every** `x` → quadratic on a single long run.
- Using a list/`in` on `nums` (O(n) membership) instead of a set.
- Sorting first and still claiming O(n).
- Returning the run as a list when they asked for a length.
- Off-by-one: counting gaps (`[1,2,4]` is 2, not 3).

## Follow-ups

- Return the **actual sequence** (any one longest) — same walk, keep start + length.
- Stream / too big for memory — external sort or shard by value range.
- Union-find: union `x` with `x+1` when both exist; track component sizes — more code, same O(n) idea.
- Longest consecutive **in the array order** — different problem (sliding window / DP).

## Sources

- [Longest Consecutive Sequence — NeetCode](https://neetcode.io/solutions/longest-consecutive-sequence) — accessed 2026-09-02
- [Longest Consecutive Sequence (O(n) hash set) — DSA Prep](https://www.dsaprep.dev/blog/longest-consecutive-sequence-leetcode-solution) — accessed 2026-09-02
- [Longest Consecutive Sequence — InterviewLoop](https://interviewloop.app/learn/code/arrays-and-hashing/302-longest-consecutive-sequence-leetcode-interview-questions-explained) — accessed 2026-09-02
- [LeetCode 128 explanation — Sharooq](https://www.sharooq.com/leetcode-128-longest-consecutive-sequence-explanation) — accessed 2026-09-02
- Classic LeetCode #128 — hash set + run-start gate
