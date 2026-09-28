# Jump Game II — answer outline

**Prompt:** `nums[i]` is the **max** jump length from index `i`. Start at `0`. Return the **minimum number of jumps** to reach the last index. You may assume a path exists. (LeetCode 45)

This is **BFS layers on an array** — greedy windows — not the yes/no reach of [coding-jump-game.md](coding-jump-game.md). NeetCode 150 greedy box. Aim for O(n) time, O(1) extra space.

## Probes

- `nums[i]` is a **ceiling**, not a forced hop of that exact length.
- Yes/no (55) is “does any path exist?”; this is “shortest hop-count.”
- Greedy “always jump `i + nums[i]`” is **wrong** — that local max can force extra jumps.
- DP `minJumps[i]` is O(n²); they want the linear window.

## Strong answer skeleton — greedy BFS windows

1. **Clarify:** `n == 1` → `0`; a path is guaranteed; negatives excluded.
2. **Layer idea:** from the current interval `[l, r]`, the next interval is everything those indices can reach.
3. Track `farthest` while scanning `[l, r]`. When the scan finishes, one jump is spent: `jumps += 1`, `l = r + 1`, `r = farthest`.
4. Stop when `r >= n - 1`.
5. Each index is visited once → O(n) time, O(1) space (`jumps`, `l`, `r`, `farthest`).

## Sketch (window / BFS layer)

```
if n <= 1: return 0
jumps = l = r = 0
while r < n - 1:
  farthest = 0
  for i in range(l, r + 1):
    farthest = max(farthest, i + nums[i])
  l, r = r + 1, farthest
  jumps += 1
return jumps
```

`[2,3,1,1,4]` → window `0..0` farthest `2`; then `1..2` farthest `4` → **2** jumps. `[2,4,1,1,1,1]` → **2**.

## Mock narration (30 sec)

> “Minimum jumps is BFS hop-count on a line. The current jump covers a contiguous window. I scan that window for the farthest index the next jump can reach, then the next window starts just after this one. Each layer is one jump. Linear, four integers.”

## Common mistakes

- Jumping to `i + nums[i]` every time (local greedy; not min hops).
- Reusing the yes/no `reach` loop and incrementing on every index (over-counts).
- Off-by-one: `l = r` instead of `r + 1` (re-scan / infinite loop).
- Forgetting `n == 1` → `0`.
- Claiming O(n²) because of the inner `for` — windows are disjoint, amortized O(n).

## Follow-ups

- **Jump Game (55)** — same frontier, boolean instead of hop count.
- **Jump Game III (1306)** — graph `i ± nums[i]`; visited set.
- **Video / frog jump** — DP on reachable stones, not a line window.

## Sources

- [Jump Game II — NeetCode](https://neetcode.io/solutions/jump-game-ii) — accessed 2026-09-28
- [Jump Game II — LeetCode 45](https://leetcode.com/problems/jump-game-ii/) — accessed 2026-09-28
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-09-28
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-09-28
- Classic LeetCode #45 — min hops via BFS layers / greedy windows
