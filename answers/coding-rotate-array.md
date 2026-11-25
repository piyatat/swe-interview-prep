# Rotate Array — answer outline

**Prompt:** Integer array `nums`. Rotate **right** by `k` steps (`k ≥ 0`). Mutate in place; return type is `void`. (LeetCode 189)

This is a **block move**, not [coding-rotate-image.md](coding-rotate-image.md) (matrix 90°) and not [coding-find-min-rotated.md](coding-find-min-rotated.md) (search a rotated **sorted** array). NeetCode 150 arrays box. Wikipedia [circular shift](https://en.wikipedia.org/wiki/Circular_shift): each index `i` maps to `(i + k) mod n`.

## Probes

- `k` may be **larger than `n`** — always `k %= n` first (`k == 0` is identity).
- Follow-up: **O(1) extra** (no second array of size n).
- Left rotate by `k` is right rotate by `n - k`.
- Empty / `n == 1` / `k == 0` must be no-ops.

## Strong answer skeleton — three reversals

1. **Clarify:** right vs left; in-place; `k` unbounded; negatives allowed as values.
2. **Extra array:** `out[(i + k) % n] = nums[i]`, then copy back — O(n) time, O(n) space. Fine as a warmup.
3. **In-place:** `k %= n`. Reverse **all**, then reverse `[0, k)`, then reverse `[k, n)`. The tail block lands in front; the two inner reverses restore order.
4. **Cycle follow-up:** jump `i → (i + k) % n` and swap along cycles; also O(n)/O(1), easier to get wrong.
5. **Complexity:** O(n) time, O(1) extra. Each index is swapped a constant number of times.

## Sketch (three reverse)

```
k %= n
reverse(0, n-1)
reverse(0, k-1)
reverse(k, n-1)
```

`[1,2,3,4,5,6,7]`, `k = 3` → full reverse `[7,6,5,4,3,2,1]` → first 3 `[5,6,7,4,3,2,1]` → rest `[5,6,7,1,2,3,4]`.

`k %= n` **before** the reverses. If `n` is 0 the problem constraints already forbid it; still guard in an interview.

## Mock narration (30 sec)

> “Right rotate by k is ‘last k elements move to the front.’ I take k mod n, reverse the whole array so those k sit up front backwards, then reverse each block so order is restored. Linear time, constant extra memory.”

## Common mistakes

- Forgetting `k %= n` (index error or a needless O(n k) loop).
- Off-by-one on reverse bounds (`[0, k]` vs `[0, k-1]`).
- Building a new list after they asked in-place.
- Rotating **left** (pop front) when the prompt said right.
- Confusing this with rotating a **matrix**.

## Follow-ups

- **Reverse words in a string:** reverse all, then reverse each word — same primitive.
- **Rotate List (61):** linked-list version; find length, join ring, cut at `n - k`.
- **Block swap / juggling:** cycle decomposition when they ban reverse.

## Sources

- [189. Rotate Array — LeetCode](https://leetcode.com/problems/rotate-array/) — accessed 2026-11-25
- [Rotate Array — NeetCode](https://neetcode.io/solutions/rotate-array) — accessed 2026-11-25
- [189. Rotate Array — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/189/) — accessed 2026-11-25
- [Circular shift — Wikipedia](https://en.wikipedia.org/wiki/Circular_shift) — accessed 2026-11-25
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-25
