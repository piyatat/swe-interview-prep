# Gas Station — answer outline

**Prompt:** `n` stations on a **circle**. `gas[i]` fill, `cost[i]` to reach `i+1` (last wraps to 0). Start with empty tank, unlimited capacity. Return a start index that completes one clockwise lap, or `-1`. At most one solution. (LeetCode 134)

This is the circular cousin of [coding-jump-game.md](coding-jump-game.md): a **greedy reset**, not DP. NeetCode 150 greedy box; Blind 75 skipped the whole bucket.

## Probes

- If `sum(gas) < sum(cost)` → impossible (`-1`). Otherwise a start **exists** (problem + conservation).
- Tank must stay **≥ 0** after every hop, not only at the end.
- Unique start (guaranteed) — do not collect all starts.
- Clockwise only; no reversing.

## Strong answer skeleton

1. **Clarify:** `n ≥ 1`; zeros allowed; unique answer.
2. **Brute force:** try each start, simulate up to n hops — O(n²). Too slow at 1e5.
3. **Total gas:** one pass `net = gas[i] - cost[i]`. If `sum(net) < 0` return `-1`.
4. **Greedy start:** walk `i = 0 … n-1` with running `tank`. If `tank + net[i] < 0`, **no** valid start in `[current_start, i]` — set `start = i+1`, `tank = 0`. Else add `net[i]`.
5. **Why discard a prefix:** if you entered `i` with `tank ≥ 0` from `start` and still went negative, any start **inside** that prefix had a **smaller** prefix sum, so it would have failed earlier or at `i`.
6. **Complexity:** O(n) time, O(1) extra. No second lap needed once the total is non-negative.

## Sketch

```
if sum(gas) < sum(cost): return -1
tank, start = 0, 0
for i in range(n):
  tank += gas[i] - cost[i]
  if tank < 0:
    start = i + 1
    tank = 0
return start
```

Walk `gas=[1,2,3,4], cost=[2,2,4,1]` → fail 0..2, `start=3`. `gas=[1,2,3], cost=[2,3,2]` → total −1 → `-1`.

Same shape as **Kadane’s reset**, but you track the **index after the worst prefix**, not the max subarray.

## Mock narration (30 sec)

> “If total gas is short, impossible. Otherwise I scan once: when the running tank goes negative, no start in that prefix works, so I restart at the next station. The leftover tank at the end is the surplus that covers the opening. Linear, one integer.”

## Common mistakes

- Simulating a full circle from every index (TLE / messy modulo).
- Checking only `sum(gas) >= sum(cost)` and returning `0` (wrong start).
- Resetting `start` but forgetting to zero `tank`.
- Using two pointers / deque without the prefix-sum argument (overkill).
- Claiming O(n) without explaining **why** skipped starts cannot succeed.

## Follow-ups

- **Jump Game (55):** reachable prefix on a line — [coding-jump-game.md](coding-jump-game.md).
- **Kadane (53):** max subarray reset — [coding-maximum-subarray.md](coding-maximum-subarray.md).
- **Circuit with two directions** or unique capacity — drop the “at most one start” gift; you may need extra bookkeeping.

## Sources

- [Gas Station — NeetCode](https://neetcode.io/solutions/gas-station) — accessed 2026-09-16
- [Gas Station — LeetCode 134](https://leetcode.com/problems/gas-station/) — accessed 2026-09-16
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-09-16
- [Maximum subarray problem (Kadane) — Wikipedia](https://en.wikipedia.org/wiki/Maximum_subarray_problem) — accessed 2026-09-16
- Classic LeetCode #134 — circular greedy reset
