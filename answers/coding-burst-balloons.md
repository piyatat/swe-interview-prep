# Burst Balloons — answer outline

**Prompt:** `nums[i]` is a balloon. Burst every balloon. Bursting `i` scores `nums[left] * nums[i] * nums[right]` using the **current** neighbors (missing ends count as `1`). Return the **maximum** coins. (LeetCode 312)

This is **interval DP**, not a greedy “burst smallest first.” Cousin of [coding-palindrome-partitioning.md](coding-palindrome-partitioning.md) (enumerate a cut) but here the cut is the **last** balloon in an open interval. NeetCode 150 hard DP box. Wikipedia [Interval scheduling](https://en.wikipedia.org/wiki/Interval_scheduling) is the wrong cousin — say **interval DP / matrix-chain** instead.

## Probes

- Order **changes neighbors** — first-burst recursion is exponential and messy.
- Flip: pick `k` as the **last** burst in `(L, R)`. Then the two sides never see each other, and the multipliers are the **still-alive** sentinels `arr[L]` and `arr[R]`.
- Pad `arr = [1] + nums + [1]`. `n ≤ 300` → `O(n³)` is the intended bar.
- Zeros are legal; bursting a `0` can still score `0` and change neighbors.

## Strong answer skeleton

1. **Clarify:** empty → `0`; single `x` → `x` (the two `1` pads); they want a **max**, not a sequence.
2. `dp[L][R]` = best coins from bursting **open** interval `(L, R)` (balloons `L+1 … R-1`).
3. For width, for each `k` in `(L, R)`:  
   `dp[L][R] = max(dp[L][k] + dp[k][R] + arr[L] * arr[k] * arr[R])`.
4. Fill **increasing width** (or `L` down, `R` up) so the two subintervals already exist.
5. Answer `dp[0][n+1]`. Time `O(n³)`, space `O(n²)`.

## Sketch

```
arr = [1] + nums + [1]
n = len(arr)
dp = [[0] * n for _ in range(n)]
for w in range(2, n):          # R = L + w
  for L in range(0, n - w):
    R = L + w
    for k in range(L + 1, R):
      dp[L][R] = max(dp[L][R],
        dp[L][k] + dp[k][R] + arr[L] * arr[k] * arr[R])
return dp[0][n - 1]
```

`[3,1,5,8]` → **167**. `[1,5]` → **10**.

## Mock narration (30 sec)

> “Neighbors change, so I do not recurse on ‘burst this now.’ I pad ones, then for each open interval I try which balloon dies last. The two sides are independent, and the last burst always multiplies the two sentinels that are still up. Cubic interval DP; answer is the full padded span.”

## Common mistakes

- Last vs **first** burst — using current neighbors of `k` instead of the sentinels.
- Closed-interval off-by-one (`k` from `L` to `R` inclusive of pads).
- Greedy by value — `[3,1,5,8]` punishes “burst 1 first” as the only story; you still need the DP.
- Forgetting the pads, then special-casing ends in every transition.
- `O(n²)` “two pointers” — the third loop over `k` is required.

## Follow-ups

- **Matrix-chain multiplication** — same last-cut recurrence, different score.
- **Minimum cost to cut a stick** — cuts as last events; same interval table.
- **Burst Balloons II / coins on burst of adjacent pair** — different recurrence; ask.
- Reconstruct the order: store `arg max k` per `(L, R)`.

## Sources

- [Burst Balloons — NeetCode](https://neetcode.io/solutions/burst-balloons) — accessed 2026-10-22
- [312. Burst Balloons — LeetCode Wiki](https://leetcode.doocs.org/en/lc/312/) — accessed 2026-10-22
- [Burst Balloons — LeetCode 312](https://leetcode.com/problems/burst-balloons/) — accessed 2026-10-22
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-22
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-22
