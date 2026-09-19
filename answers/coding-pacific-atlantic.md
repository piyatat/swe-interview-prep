# Pacific Atlantic water flow — answer outline

**Prompt:** `m × n` height grid. Pacific touches **top + left**; Atlantic touches **bottom + right**. Water flows 4-adjacent to a neighbor with height **≤** current (downhill or flat), and from an ocean-adjacent cell into that ocean. Return every cell that can reach **both** oceans. (LeetCode 417)

This is **reverse multi-source flood-fill**, not “DFS downhill from every cell.” Cousin of [coding-rotting-oranges.md](coding-rotting-oranges.md) (multi-source BFS) and [coding-number-of-islands.md](coding-number-of-islands.md) (visit a component once). Forward search from each cell is O((mn)²).

## Probes

- Flow is to **equal or lower** height. Reverse search walks to **equal or higher**.
- A cell on a corner / edge can be an ocean source (Pacific and Atlantic **share** the four corners).
- Return coordinates in any order. 1×1 grid: that cell reaches both.
- Mark visited **per ocean** (two sets / two boolean grids), not one global visit.

## Strong answer skeleton

1. **Clarify:** 4-dir only; “reach ocean” means a path of downhill/flat steps to that border.
2. **Brute:** from each cell, DFS/BFS downhill; see if both borders appear — too slow.
3. **Invert:** cells the Pacific can “climb” to are exactly cells that can flow to the Pacific.
4. Seed Pacific with every top-row and left-column cell; Atlantic with bottom + right. BFS or DFS; step to a neighbor if `heights[nr][nc] >= heights[r][c]` and unseen for that ocean.
5. Intersection of the two reachable sets.
6. **Complexity:** each cell enqueued ≤ once per ocean → O(mn) time and space.

## Sketch

```
pac, atl = set(), set()
qP = all (0, c) and (r, 0)
qA = all (m-1, c) and (r, n-1)
flood(q, seen):  # BFS/DFS
  while q:
    r,c = pop
    for nr,nc in 4-neighbors:
      if in_bounds and (nr,nc) not in seen
         and heights[nr][nc] >= heights[r][c]:
        seen.add((nr,nc)); q.push((nr,nc))
return cells in pac & atl
```

Seed cells must be in `seen` **before** the walk. Classic 5×5 NeetCode island: several ridge cells hit both sets.

## Mock narration (30 sec)

> “If I start inland I repeat work. I start from both oceans and walk uphill — anywhere I can climb, water could have flowed down. Two visited sets, then the intersection. Linear in cells.”

## Common mistakes

- Forward DFS from every cell (TLE on 100×100).
- Reverse walk requiring **strictly lower** (blocks flats).
- One visited set for both oceans (second flood cannot reuse a ridge).
- Forgetting to enqueue the **entire** border, including corners, once each.
- 8-directional flow.

## Follow-ups

- **Walls and Gates / 01 Matrix:** multi-source BFS for **distance**, not a boolean reach set — [coding-rotting-oranges.md](coding-rotting-oranges.md).
- **Surrounded regions:** flood from borders, flip the rest.
- If they ask DFS vs BFS: same complexity; BFS avoids recursion depth on a 100×100 snake.

## Sources

- [Pacific Atlantic Water Flow — NeetCode](https://neetcode.io/solutions/pacific-atlantic-water-flow) — accessed 2026-09-19
- [Pacific Atlantic Water Flow — LeetCode 417](https://leetcode.com/problems/pacific-atlantic-water-flow/) — accessed 2026-09-19
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-09-19
- [Flood fill — Wikipedia](https://en.wikipedia.org/wiki/Flood_fill) — accessed 2026-09-19
