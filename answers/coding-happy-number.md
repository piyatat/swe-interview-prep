# Happy Number — answer outline

**Prompt:** Positive integer `n`. Replace it by the **sum of the squares of its digits**. Repeat. Return whether you eventually reach **1** (happy) rather than looping in a cycle that never hits 1. (LeetCode 202)

This is **cycle detection on a number-theory map**, not a graph you are given. Wikipedia [Happy number](https://en.wikipedia.org/wiki/Happy_number): in base 10 every trajectory reaches 1 or the 8-cycle `4 → 16 → 37 → 58 → 89 → 145 → 42 → 20 → 4`. Same Floyd idea as [coding-linked-list.md](coding-linked-list.md) (cycle) and [coding-find-duplicate.md](coding-find-duplicate.md) (index graph). NeetCode 150 math box.

## Probes

- `1` is happy (already there). `n` can be large; you only ever square **digits**, so values collapse quickly.
- Hash set of seen `n` is the clear solution; **Floyd** (slow/fast) is the O(1)-space follow-up.
- Digit extract: `n % 10` then `n // 10` — do not convert to a string unless they allow it.
- Unhappy numbers are not “timeout” — they **cycle**. Detect the repeat; do not cap iterations and guess.

## Strong answer skeleton

1. **Clarify:** happy ⇔ the process hits 1; otherwise a cycle (not 1).
2. Helper `next(x)`: sum of `d*d` for each decimal digit.
3. **Set:** while `n != 1`: if `n` in `seen` → false; add; `n = next(n)`. True if you exit at 1.
4. **Floyd:** `slow = n`, `fast = next(n)`; while `slow != fast`: slow once, fast twice. Happy iff the meeting point is 1.
5. **Complexity:** each `next` is O(log n) digits at first, then O(1) once values are small. Set uses O(1) extra in practice (bounded range); Floyd is O(1) extra.

## Sketch (set)

```
def next(x):
  s = 0
  while x:
    x, d = divmod(x, 10)
    s += d * d
  return s

seen = set()
while n != 1 and n not in seen:
  seen.add(n)
  n = next(n)
return n == 1
```

`19` → 82 → 68 → 100 → 1 (true). `2` falls into the 4-cycle (false). Floyd: same `next`; meet at 1 vs meet in the cycle.

## Mock narration (30 sec)

> “Squaring digits is a function from integers to integers, so I either hit 1 or a cycle. I’ll keep a set of values I’ve seen and return false on a repeat. If they want constant extra memory, Floyd’s two pointers on the same function: they meet at 1 if it’s happy.”

## Common mistakes

- Stringifying every step in a language where that hides the digit loop they wanted.
- Infinite loop with no seen-set / Floyd.
- Treating a cap like “100 steps” as a proof.
- Floyd: comparing after unequal step counts, or returning `slow == fast` without checking **1**.
- Summing digits **without** squaring (that's digital root / divisibility).

## Follow-ups

- **Linked List Cycle:** [coding-linked-list.md](coding-linked-list.md) — same Floyd, real nodes.
- **Find the Duplicate Number:** [coding-find-duplicate.md](coding-find-duplicate.md) — Floyd on `i → nums[i]`.
- Why the unhappy cycle always includes 4 (base 10): say the map is finite below 3×81 for three-digit sums, so a cycle must exist; naming the eight-number loop is enough.

## Sources

- [202. Happy Number — LeetCode](https://leetcode.com/problems/happy-number/) — accessed 2026-11-10
- [Happy Number — NeetCode](https://neetcode.io/solutions/happy-number) — accessed 2026-11-10
- [202. Happy Number — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/202/) — accessed 2026-11-10
- [Happy number — Wikipedia](https://en.wikipedia.org/wiki/Happy_number) — accessed 2026-11-10
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-10
