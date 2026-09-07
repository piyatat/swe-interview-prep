# Rotting Oranges — answer outline

**Prompt:** Grid cells are `0` empty, `1` fresh, `2` rotten. Each minute, every rotten orange rots **4-adjacent** fresh ones. Return **minutes** until no fresh remain, or `-1` if some fresh can never rot. (LeetCode 994)

This is **multi-source BFS**: all initial `2`s start together; each queue **level** is one minute. Cousin of [coding-number-of-islands.md](coding-number-of-islands.md) (single-source flood-fill counts components — here you need **shortest time**, so DFS is the wrong shape). Wikipedia [BFS](https://en.wikipedia.org/wiki/Breadth-first_search): unweighted shortest path; label explored **before** enqueue.

## Probes

- All start rotting **in parallel** — do not BFS from one `2` then another (that serializes time).
- No fresh → `0` (already done), even if the grid is empty or all empty/`2`.
- Fresh walled off by `0`s → `-1`.
- Mutate `1 → 2` as you enqueue (visited) so you do not re-queue.

## Strong answer skeleton

1. **Clarify:** 4-dir only; diagonal no; empty grid size (classic ≥ 1×1).
2. **Count** fresh; **enqueue every** initial rotten `(r, c)`.
3. If `fresh == 0`: return `0`.
4. **Level BFS:** for each minute, process `len(q)` cells; for each 4-neighbor that is fresh: rot it, `fresh -= 1`, enqueue.
5. After the loop: `0 if fresh == 0 else -1`. Minutes = levels you actually processed (do not count a trailing empty level).
6. **Complexity:** each cell enqueued ≤ once → O(mn) time and O(mn) queue.

## Sketch

```
q, fresh = deque(), 0
for r,c in cells:
  if grid[r][c] == 2: q.append((r,c))
  elif grid[r][c] == 1: fresh += 1
if fresh == 0: return 0
minutes = 0
while q and fresh:
  for _ in range(len(q)):
    r,c = q.popleft()
    for nr,nc in neighbors:
      if in_bounds and grid[nr][nc] == 1:
        grid[nr][nc] = 2
        fresh -= 1
        q.append((nr,nc))
  minutes += 1
return minutes if fresh == 0 else -1
```

`[[2,1,1],[1,1,0],[0,1,1]]` → `4`. A fresh with no 4-path to any `2` → `-1`.

## Mock narration (30 sec)

> “Every rotten orange is a source at time zero. I multi-source BFS so the frontier is ‘just rotted this minute.’ Each layer is one minute. I count leftover fresh at the end — if any could not be reached, impossible. Linear in cells.”

## Common mistakes

- DFS / one BFS per rotten — times are **max**, not sum; easy to get the clock wrong.
- Returning queue size or “levels including the last empty wave.”
- Forgetting `fresh == 0` → `0` when there were never any `1`s.
- 8-directional rot; or treating `0` as passable.
- Not marking on enqueue → the same fresh enters the queue many times.

## Follow-ups

- **Walls and Gates / 01 Matrix:** same multi-source BFS from all gates / zeros.
- **Shortest path in a grid with obstacles:** single-source BFS (or 0-1 BFS if two edge weights).
- **Pacific Atlantic:** two reverse multi-source BFS from oceans; intersect.
- In-place vs copy — mutate is fine if they allow destroying the grid.

## Sources

- [Rotting Oranges — NeetCode](https://neetcode.io/solutions/rotting-oranges) — accessed 2026-09-07
- [Breadth-first search — Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search) — accessed 2026-09-07
- Classic LeetCode #994 / #286 / #542 — multi-source grid BFS family
