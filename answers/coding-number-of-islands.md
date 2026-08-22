# Number of Islands — answer outline

**Prompt:** 2D grid `'1'` land / `'0'` water — count connected land regions (4-directional).

## Probes

- DFS vs BFS?
- Mutate grid vs visited set?
- What about 8-directional or largest island?

## Strong answer skeleton

1. **Clarify:** grid dimensions, empty grid, all water?
2. **Approach:** iterate cells; on `'1'` run DFS/BFS flood-fill, increment count, mark visited.
3. **Mark visited:** mutate to `'0'` or `visited[][]` — discuss tradeoff (mutate saves space if allowed).
4. **Complexity:** O(m×n) time and space (worst-case recursion/stack).

## DFS template

```
for each cell:
  if grid[r][c] == '1':
    count++
    dfs(r,c) // mark neighbors
```

## Common mistakes

- Double-counting — forget to mark visited
- Stack overflow on huge grid — prefer iterative BFS or increase stack (mention)
- Off-by-one bounds checks

## Follow-ups

- Max area island
- Number of distinct islands (hash shape)

## Sources

- LeetCode #200 — graph/grid pattern
