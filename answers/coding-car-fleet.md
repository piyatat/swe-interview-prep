# Car Fleet — answer outline

**Prompt:** `n` cars on a line drive toward `target`. `position[i]` and `speed[i]` are unique starting miles and speeds. A car **cannot pass**; if it catches the car ahead, it **slows** and they become one **fleet** (speed = min of the group). Catching up **at** `target` still counts as the same fleet. Return how many fleets arrive. (LeetCode 853)

This is **sort + monotonic arrival times**, cousin of [coding-asteroid-collision.md](coding-asteroid-collision.md) (stack cancel) and [coding-daily-temperatures.md](coding-daily-temperatures.md) (next-greater). Wikipedia [Stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)). NeetCode 150 stack box.

## Probes

- Why you **sort from the target backward** (the car closest to `target` can never be blocked by anyone behind).
- Arrival time `(target - position) / speed` — use **floats**; integer divide is a trap.
- A behind car joins the fleet ahead **iff** its time `<=` that fleet’s time (it arrives no later, so it catches before or at `target`).
- Stack vs a single `prev` time — same idea; you only need the **slowest leader so far**.

## Strong answer skeleton — leaders from the front

1. **Clarify:** unique positions; no passing; merge at `target` counts; `n = 1` → `1`.
2. **Naive:** simulate each mile / event — correct, too slow (`n ≤ 1e5`).
3. **Sort** cars by position **descending** (closest to target first).
4. Scan that order. Compute `t`. If `t > prev`, this car is **slower than every fleet ahead** → new fleet, `prev = t`. Else it **merges** (do not update `prev`; the leader still governs).
5. **Complexity:** O(n log n) sort, O(1) extra if you sort indices; O(n) if you pair and stack times.

## Sketch

```
cars = sorted(zip(position, speed), reverse=True)  # closest to target first
fleets, prev = 0, 0.0
for pos, spd in cars:
  t = (target - pos) / spd
  if t > prev:          # cannot catch the fleet ahead
    fleets += 1
    prev = t            # this car is the new bottleneck
return fleets
```

`target=12`, `pos=[10,8,0,5,3]`, `spd=[2,4,1,1,3]` → fleets **3**. Single car → **1**. `[0,2,4]` at 100 with speeds `[4,2,1]` → **1**.

## Mock narration (30 sec)

> “I’ll sort from the destination backward. Each car’s arrival time tells me if it catches the fleet in front. If it’s slower, it starts a new fleet; if faster or equal, it merges and I keep the slower leader’s time. The number of times I start a new fleet is the answer.”

## Common mistakes

- Sorting **ascending** and comparing the wrong neighbor.
- Integer division (`//`) — two cars that should merge look distinct.
- Updating `prev` on a **merge** (the behind car is not the bottleneck).
- Forgetting “meet at `target` still same fleet” (`t` equal → merge).
- Simulating pairwise overtakes after the sort — back to O(n²).

## Follow-ups

- **Car Fleet II** (LC 1776): collision *times* for cars going the same way — need a monotonic stack of *next* crash events, not just a count.
- **Asteroid Collision:** opposite headings; different merge rule.
- Return the **fleet speeds** or the set of leaders instead of a count.

## Sources

- [Car Fleet — NeetCode](https://neetcode.io/solutions/car-fleet) — accessed 2026-10-07
- [853. Car Fleet — LeetCode Wiki](https://leetcode.doocs.org/en/lc/853/) — accessed 2026-10-07
- [Car Fleet — LeetCode 853](https://leetcode.com/problems/car-fleet/) — accessed 2026-10-07
- [Stack (abstract data type) — Wikipedia](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) — accessed 2026-10-07
