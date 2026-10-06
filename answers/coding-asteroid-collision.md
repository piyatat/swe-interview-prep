# Asteroid Collision — answer outline

**Prompt:** `asteroids[i]` is size (abs) and direction (sign: `+` right, `-` left). Same speed. When two meet, the **smaller** explodes; **equal** sizes both explode. Same-direction rocks never meet. Return survivors in order. (LeetCode 735)

This is **stack simulation of pairwise cancel**, cousin of [coding-valid-parentheses.md](coding-valid-parentheses.md) (match/pop) and [coding-daily-temperatures.md](coding-daily-temperatures.md) (monotonic stack). Wikipedia [Stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)). NeetCode 150 stack box.

## Probes

- Collision **only** when a **right-mover already on the stack** meets a **new left-mover** (`top > 0` and `x < 0`). `[-2, 5]` never hits (they separate).
- Chain reactions: one `-10` can pop several smaller `+` rocks, then die on a larger `+` — or empty the right-moving prefix and survive.
- Zeros are out of spec on LeetCode 735 (`!= 0`). Still say what you would do.
- Each rock is pushed and popped **at most once** → O(n), not O(n²) pairwise rescan.

## Strong answer skeleton — stack of survivors

1. **Clarify:** same speed; only opposite headings that **close** collide; return remaining left-to-right.
2. **Naive:** rescan pairs until stable — correct, too slow, signals you missed the stack.
3. **Stack:** scan left to right. `+` always push (cannot hit anything already kept). `-` fights the `+` top while `stk[-1] > 0` and `stk[-1] < -x` (pop smaller rights). Then: equal → pop and drop `x`; empty or top `< 0` → push `x`; else top is larger → drop `x`.
4. **Complexity:** O(n) time, O(n) space.

## Sketch

```
stk = []
for x in asteroids:
  if x > 0:
    stk.append(x)
    continue
  while stk and stk[-1] > 0 and stk[-1] < -x:
    stk.pop()
  if stk and stk[-1] == -x:
    stk.pop()          # both explode
  elif not stk or stk[-1] < 0:
    stk.append(x)      # survives (left-movers only, or empty)
return stk
```

`[5,10,-5]` → `[5,10]`. `[8,-8]` → `[]`. `[10,2,-5]` → `[10]`. `[3,5,-6,2,-1,4]` → `[-6,2,4]`.

## Mock narration (30 sec)

> “Only a right-moving survivor can hit a new left-mover. I keep the still-alive prefix on a stack. A positive just pushes. A negative pops smaller positives, ties both die, and a larger positive eats it. Same-direction rocks stay. Each asteroid enters and leaves the stack at most once.”

## Common mistakes

- Colliding `[-2, 5]` or two negatives — they never meet.
- Forgetting the **equal** case (both gone).
- Comparing signed values instead of **size** (`-x` vs `stk[-1]`).
- Nested O(n) rescans after each hit instead of the while-pop.
- Mutating the input as an implicit stack without a clear top index.

## Follow-ups

- **Count collisions** or return the last winner only.
- **Different speeds** — no longer a single stack scan; need events / sweep.
- **Asteroid Collision II** (LC 2126, planet + remaining) is a different prompt — do not mix.

## Sources

- [Asteroid Collision — NeetCode](https://neetcode.io/solutions/asteroid-collision) — accessed 2026-10-06
- [735. Asteroid Collision — LeetCode Wiki](https://leetcode.doocs.org/en/lc/735/) — accessed 2026-10-06
- [Asteroid Collision — LeetCode 735](https://leetcode.com/problems/asteroid-collision/) — accessed 2026-10-06
- [Stack (abstract data type) — Wikipedia](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) — accessed 2026-10-06
