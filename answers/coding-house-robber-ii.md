# House Robber II — answer outline

**Prompt:** Houses on a **circle**: `nums[i]` is cash in house `i`, and house `0` neighbors house `n-1`. Adjacent houses alarm. Return the maximum you can rob. (LeetCode 213)

This is **two linear House Robber runs**, cousin of [coding-house-robber.md](coding-house-robber.md) (the inner DP) and [coding-partition-subset.md](coding-partition-subset.md) (another 0/1 split). Wikipedia [Dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming). NeetCode 150 1D-DP box.

## Probes

- Why the linear recurrence **fails** on a ring (taking both ends double-counts the wrap).
- Split: you may rob the first **or** the last, never both — so drop one end in each subproblem.
- `n = 1` is a trap: both slices would be empty if you naively drop an end.
- O(1) extra space: reuse the two-variable 198 helper; do not allocate two `dp` arrays unless they ask.

## Strong answer skeleton — drop an endpoint

1. **Clarify:** `n ≥ 1`; zeros allowed; no negatives in the usual constraints.
2. **n = 1:** return `nums[0]`. (`n = 2` is `max(nums[0], nums[1])` — both linear ranges still work.)
3. **Helper `rob_linear(lo, hi)`:** House Robber 198 on the closed range; `skip` vs `take + prev2`.
4. **Answer:** `max(rob_linear(0, n-2), rob_linear(1, n-1))` — first range **excludes last**, second **excludes first**.
5. **Complexity:** O(n) time (two passes), O(1) extra space.

The two ranges **overlap** in the middle; that is fine. You are not partitioning the street into disjoint sets — you are taking the better of two **feasible** linear worlds.

## Sketch

```
def rob_linear(a):
  prev2 = prev1 = 0
  for x in a:
    prev2, prev1 = prev1, max(prev1, prev2 + x)
  return prev1

def rob(nums):
  n = len(nums)
  if n == 1: return nums[0]
  return max(rob_linear(nums[:-1]), rob_linear(nums[1:]))
```

`[2,3,2]` → **3** (cannot take both 2s). `[1,2,3,1]` → **4** (`1+3` or `2+1`). `[1,2,3]` → **3**.

## Mock narration (30 sec)

> “First and last sit on the same alarm. I’ll run the linear robber twice: once on everything but the last house, once on everything but the first, and take the max. One house is just that house.”

## Common mistakes

- Running 198 on the whole array (wrap adjacency ignored).
- `n = 1` falling into empty slices → `0`.
- Using `nums[1:n-1]` only (drops **both** ends) — under-robs `[1,2,3,1]`.
- Integer overflow stories in C++ if they bump constraints; Python is fine.
- Claiming the two passes are independent-set on a cycle in one DP without the split — harder to get right live.

## Follow-ups

- **House Robber (198)** — the helper; already outlined.
- **House Robber III (337)** — tree; pair `(rob, skip)` per node.
- Circle of **k** forbidden neighbors, or a cycle graph DP.
- Print one optimal index set, not only the sum (need prev pointers or a second pass).

## Sources

- [House Robber II — NeetCode](https://neetcode.io/solutions/house-robber-ii) — accessed 2026-10-08
- [213. House Robber II — LeetCode Wiki](https://leetcode.doocs.org/en/lc/213/) — accessed 2026-10-08
- [House Robber II — LeetCode 213](https://leetcode.com/problems/house-robber-ii/) — accessed 2026-10-08
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-08
- [House Robber — NeetCode](https://neetcode.io/solutions/house-robber) — accessed 2026-10-08
