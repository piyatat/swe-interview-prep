# Jump Game — answer outline

**Prompt:** `nums[i]` is the **max** jump length from index `i`. Start at `0`. Return whether you can reach the last index. (LeetCode 55)

This is the usual **greedy reach** intro. NeetCode 150 puts it under Greedy; Blind 75 omitted the whole greedy bucket — so it is a common hole. Listed in [../general/coding-patterns.md](../general/coding-patterns.md).

## Probes

- `nums[i]` is a **ceiling**, not a forced jump of that exact length.
- Zeros are traps only if you cannot **land past** them.
- DP `can[i]` is correct and **O(n²)**; they want the O(n) farthest-reach argument.
- Follow-up: **minimum jumps** (45), not only yes/no.

## Strong answer skeleton

1. **Clarify:** empty / single element → `true`; negatives usually excluded.
2. **Search trap:** try every jump length from every index — exponential without memo; memo/DP is O(n²).
3. **Greedy invariant:** `reach` = farthest index you can land on using positions `≤ i` that you could already reach.
4. **Scan left → right:** if `i > reach`, that cell is dead — `false`. Else `reach = max(reach, i + nums[i])`. Early `true` when `reach >= n-1`.
5. **Why it is enough:** the reachable set is a **prefix**. You never need an earlier unused jump once a later index is already inside `reach` (monotonic frontier).
6. **Backward dual:** `goal` starts at `n-1`; walk left; if `i + nums[i] >= goal`, set `goal = i`. Success iff `goal == 0`.
7. **Complexity:** O(n) time, O(1) space either way.

## Sketch (forward)

```
reach = 0
for i, step in enumerate(nums):
  if i > reach: return False
  reach = max(reach, i + step)
  if reach >= n - 1: return True
return True
```

Walk `[2,3,1,1,4]` → reach grows to 4 → `true`. `[3,2,1,0,4]` → stuck at 3 with `reach == 3` → `false`.

## Mock narration (30 sec)

> “I only need the farthest index I can already reach. As I walk, if I step past that frontier I’m stuck. Otherwise I extend the frontier by i + nums[i]. If it ever covers the last index, yes. Linear, one integer.”

## Common mistakes

- Treating `nums[i]` as “must jump exactly that far.”
- DP first and never mentioning greedy (partial credit at many shops).
- Off-by-one: `i == reach` is still **reachable** (you are standing there).
- Early `return False` when `nums[i] == 0` even if `i` is the last index.
- Jump Game II: counting jumps with the same reach idea, **not** a second full search.

## Follow-ups

- **Jump Game II (45)** — min jumps: BFS layers on the array, or greedy windows (`end` of current jump, `farthest` in window).
- **Jump Game III (1306)** — graph from `i ± nums[i]`; visited set.
- **Gas Station (134)** — another “can I complete a circuit” greedy.

## Sources

- [Jump Game: greedy optimization gateway — techinterview.org](https://www.techinterview.org/post/3233474790/jump-game-greedy-optimization-gateway/) — accessed 2026-09-01
- [LeetCode 55 Jump Game — JZLeetCode](https://jzleetcode.github.io/posts/leet-0055-jump-game/) — accessed 2026-09-01
- [55. Jump Game — Algo.Monster](https://algo.monster/liteproblems/55) — accessed 2026-09-01
- [Greedy vs Blind 75 gap — LastRound AI](https://lastroundai.com/blog/neetcode-150-vs-blind-75) — accessed 2026-09-01
- Classic LeetCode #55 / #45 — greedy reach / min jumps
