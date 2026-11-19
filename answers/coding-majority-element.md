# Majority Element — answer outline

**Prompt:** Array `nums` of length `n`. Return the **majority** element — the value that appears **more than** `⌊n / 2⌋` times. A majority is **guaranteed**. (LeetCode 169)

This is [Boyer–Moore majority vote](https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_majority_vote_algorithm): pair-cancel distinct values; the majority cannot be fully cancelled. Sibling of [coding-single-number.md](coding-single-number.md) (XOR-cancel **pairs**) and [coding-top-k.md](coding-top-k.md) (heap / count, not a guaranteed > n/2). NeetCode 150 arrays box.

## Probes

- “Majority” means **strictly more than n/2**, not “most frequent” (mode can be ≤ n/2).
- Hash map is O(n) space — follow-up wants **O(1)** extra.
- Sort and pick `nums[n//2]` is correct (majority occupies the middle) but O(n log n).
- If they **drop** the “majority exists” guarantee, you **must** count the candidate in a second pass.

## Strong answer skeleton — Boyer–Moore

1. **Clarify:** guaranteed majority; duplicates; negatives; “more than n/2,” not ≥.
2. **Count map** O(n) time / space — name it, then drop the map.
3. **Vote:** `cand, cnt = 0, 0`. For each `x`: if `cnt == 0`, `cand = x`. Then `cnt += 1 if x == cand else -1`.
4. Return `cand`. No second pass **on this prompt**.
5. **Complexity:** O(n) time, O(1) extra space.

## Sketch (vote)

```
cand = cnt = 0
for x in nums:
  if cnt == 0:
    cand = x
  cnt += 1 if x == cand else -1
return cand
```

`[2,2,1,1,1,2,2]` → **2**. Walk a cancellation: two `2`s vs one `1` leaves a `2` in the lead.

Sort form: `sort`; return `nums[n // 2]`. Bit form (flex): for each bit, if more than n/2 numbers have it set, set it on the answer — works because majority contributes that bit.

## Mock narration (30 sec)

> “Majority is more than half, so pairing unlike values cannot wipe it out. I keep one candidate and a count: same value increments, anything else decrements, and I adopt a new candidate when the count hits zero. After one pass the candidate is the majority. If they did not guarantee it, I would count that candidate once more.”

## Common mistakes

- Returning the **mode** without checking `> n/2`.
- Off-by-one: `>= n/2` (even n: a 50/50 split is **not** a majority).
- Hash map after they asked O(1) space.
- Skipping the verify pass when the prompt **does not** guarantee a majority (LC 229-style).
- Resetting `cand` every time `x != cand` instead of only when `cnt == 0`.

## Follow-ups

- **Majority Element II (229):** elements `> n/3` — at most two candidates; **must** verify counts.
- **Single Number (136):** cancel pairs with XOR, not votes — [coding-single-number.md](coding-single-number.md).
- **Top-K frequent (347):** no > n/2 promise — [coding-top-k.md](coding-top-k.md).
- **Find the duplicate (287):** n+1 values in `1…n` — cycle, not vote — [coding-find-duplicate.md](coding-find-duplicate.md).

## Sources

- [169. Majority Element — LeetCode](https://leetcode.com/problems/majority-element/) — accessed 2026-11-19
- [Majority Element — NeetCode](https://neetcode.io/solutions/majority-element) — accessed 2026-11-19
- [169. Majority Element — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/169/) — accessed 2026-11-19
- [Boyer–Moore majority vote algorithm — Wikipedia](https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_majority_vote_algorithm) — accessed 2026-11-19
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-19
