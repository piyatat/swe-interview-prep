# Min Stack — answer outline

**Prompt:** Design a stack that supports `push`, `pop`, `top`, and `getMin` in **O(1)** time. (LeetCode 155)

Wikipedia [stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)): LIFO, O(1) push/pop at one end. The extra contract is **running minimum of the current contents**, not of the historical stream. Distinct from [coding-median-stream.md](coding-median-stream.md) (two heaps) and [coding-sliding-window-max.md](coding-sliding-window-max.md) (deque of a window). NeetCode 150 stack box.

## Probes

- `pop` / `top` / `getMin` on empty — they usually guarantee they will not, or you throw.
- Duplicates: two copies of the current min must both survive until both are popped.
- Integers can be negative. `getMin` after pop must restore the **previous** min.
- O(1) **worst-case**, not amortized. A heap of live values is O(log n) — they will reject it.

## Strong answer skeleton — parallel min stack

1. **Clarify:** same element can be pushed twice; min of **what is still in the stack**.
2. Stack `vals`. Stack `mins`: when pushing `x`, push `min(x, mins.top() if mins else x)` onto `mins`.
3. `pop` both. `top` reads `vals`. `getMin` reads `mins.top()`.
4. Each op O(1); extra memory O(n).

## Sketch (two stacks)

```
vals, mins = [], []
push(x):
  vals.append(x)
  mins.append(x if not mins else min(x, mins[-1]))
pop():
  vals.pop(); mins.pop()
top():    return vals[-1]
getMin(): return mins[-1]
```

Push `3, 5, 2, 2, 4` → mins `3, 3, 2, 2, 2`. Pop → min still `2`. Pop → min still `2`. Pop → min `3`.

**Space trim:** push onto `mins` only when `x <= mins.top()` (use `<=` so a **second** copy of the min is recorded). Pop from `mins` only when `vals.top() == mins.top()`. Same O(1); be careful with the equality.

**Pairs:** store `(value, min_so_far)` on one stack — same invariant, one allocation.

## Mock narration (30 sec)

> “getMin has to be O(1), so I keep the running min beside each value. On push I store min(x, current min). Pop both stacks together. The previous min is sitting on the new top — no scan.”

## Common mistakes

- Scanning the stack in `getMin` (O(n)) and calling it “fine.”
- Pushing to `mins` only when `x < min` and forgetting a **duplicate** min — after one pop, min is wrong.
- Using a heap / sorted set (O(log n) and a pain on duplicate pops).
- Updating a single `min` field on pop without knowing the previous min.
- Off-by-one empty checks when they allow `pop` on a one-element stack.

## Follow-ups

- **Max stack:** same pattern with `max`.
- **Min + max:** two aux stacks, or store a pair `(mn, mx)`.
- **O(1) extra memory:** encode diffs vs current min (overflow / signed-int landmines — mention, do not lead with it).
- **Queue with getMin:** need a deque of candidates (different structure).
- **Freq stack / set stack:** different design problems; do not reuse this aux-min trick blindly.

## Sources

- [Min Stack — NeetCode](https://neetcode.io/solutions/min-stack) — accessed 2026-09-20
- [Min Stack — LeetCode 155](https://leetcode.com/problems/min-stack/) — accessed 2026-09-20
- [Stack (abstract data type) — Wikipedia](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) — accessed 2026-09-20
- Classic LeetCode #155 — LIFO plus running-min aux stack
