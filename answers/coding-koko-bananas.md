# Koko Eating Bananas — answer outline

**Prompt:** `piles[i]` bananas in pile `i`. Speed `k` bananas/hour; each hour Koko eats from **one** pile (`min(k, pile)`), then stops that hour. Return the **minimum** `k` so all piles finish in `h` hours. (LeetCode 875)

This is **search-on-answer**, not “binary search in a sorted array.” Sibling of [coding-binary-search.md](coding-binary-search.md) Prompt B. Feasibility is monotone: if `k` works, `k+1` works. Wikipedia [binary search](https://en.wikipedia.org/wiki/Binary_search_algorithm). NeetCode 150 binary-search box.

## Probes

- `h >= n` (constraint): even `k = max(piles)` always works (one pile per hour).
- `k = 1` is the lower bound (not `0` — division by zero).
- Upper bound is `max(piles)`, not `sum` or `h`.
- `ceil(pile / k)` hours per pile; integer form `(x + k - 1) // k`.
- `h` and pile sizes hit `1e9` — a linear scan of `k` is too slow.

## Strong answer skeleton

1. **Clarify:** one pile per hour; leftover pile still costs a full hour; minimize `k`.
2. **Name the check:** `hours(k) = sum(ceil(p / k) for p in piles)`; feasible iff `hours(k) <= h`.
3. **Monotone:** larger `k` → fewer or equal hours → binary search the **smallest** feasible `k`.
4. **Bounds:** `lo = 1`, `hi = max(piles)`.
5. **Loop:** `mid`; if feasible, `hi = mid`; else `lo = mid + 1`. Invariant: answer in `[lo, hi]`.
6. **Complexity:** O(n log M) time, O(1) extra (`M = max(piles)`).

## Sketch

```
def ok(k):
  return sum((p + k - 1) // k for p in piles) <= h

lo, hi = 1, max(piles)
while lo < hi:
  mid = lo + (hi - lo) // 2
  if ok(mid): hi = mid
  else: lo = mid + 1
return lo
```

`piles = [3,6,7,11]`, `h = 8` → `4`. Check `k=4`: `1+2+2+3 = 8`.

## Mock narration (30 sec)

> “I need the slowest speed that still finishes in h hours. Time needed drops as k grows, so I binary-search k from 1 to the biggest pile. The check sums ceil(pile/k). First feasible mid is the answer. That’s n log M, not a scan of every speed.”

## Common mistakes

- Searching the **array** (piles are not the sorted space).
- `lo = 0` or `hi = sum(piles)` / `h`.
- Using `//` without the ceil bump (`p // k` under-counts).
- `lo <= hi` with `hi = mid-1` off-by-one (empty the feasible side).
- Overflow if they use 32-bit `p * h` in a different formulation — say 64-bit.

## Follow-ups

- **Capacity To Ship Packages (1011)** — same template; check is days to ship.
- **Split Array Largest Sum (410)** — minimize the max bucket; still monotone.
- **Minimum time to eat with cooldown** — usually not monotone in the same 1-D way; do not force it.
- **Return hours at optimal k** — already computed in `ok`.

## Sources

- [Koko Eating Bananas — NeetCode](https://neetcode.io/solutions/koko-eating-bananas) — accessed 2026-10-01
- [875. Koko Eating Bananas — LeetCode Wiki](https://leetcode.doocs.org/en/lc/875/) — accessed 2026-10-01
- [Koko Eating Bananas — LeetCode 875](https://leetcode.com/problems/koko-eating-bananas/) — accessed 2026-10-01
- [Binary search algorithm — Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm) — accessed 2026-10-01
