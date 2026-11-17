# Best Time to Buy and Sell Stock II — answer outline

**Prompt:** `prices[i]` is the price on day `i`. Complete as many transactions as you like; hold **at most one** share. Same-day sell-then-buy is allowed on the usual statement. Return max profit. (LeetCode 122)

This is **sum every uptick**, cousin of [coding-buy-sell-stock.md](coding-buy-sell-stock.md) (one trade) and **not** [coding-stock-cooldown.md](coding-stock-cooldown.md) (forced idle day after a sell). NeetCode 250 arrays / greedy. Wikipedia [greedy algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm): take every adjacent positive diff; it equals buy-at-valley / sell-at-peak.

## Probes

- Unlimited trades — not 121 (one) and not 188 (at most k).
- Cannot hold two shares; must sell before the next buy.
- Strictly decreasing → `0`. Strictly increasing → `prices[-1] - prices[0]` (one climb, or the same number as summed steps).
- O(n) time, O(1) space — nested “every pair of days” is the brute they want named.

## Strong answer skeleton — greedy

1. **Clarify:** prices ≥ 0; same-day buy+sell OK; no fee / cooldown unless they add it.
2. **Why greedy is safe:** any profitable climb `a < b < c` yields `(b-a)+(c-b) = c-a`. Skipping a mid-day cannot beat taking both steps.
3. **Code:** `ans += max(0, prices[i] - prices[i-1])` for `i in 1..n-1`.
4. **DP twin (say it, usually do not code):** `hold` / `cash`; `hold = max(hold, cash - p)`; `cash = max(cash, hold + p)`. Same answer; this form extends to cooldown / fee / k.
5. **Complexity:** O(n) time, O(1) space.

## Sketch

```
ans = 0
for i in range(1, len(prices)):
  ans += max(0, prices[i] - prices[i-1])
return ans
```

`[7,1,5,3,6,4]` → `7` (`1→5` and `3→6`). `[1,2,3,4,5]` → `4`. `[7,6,4,3,1]` → `0`.

Valley/peak pointer is the same math with more branches — prefer the one-line sum.

## Mock narration (30 sec)

> “Unlimited trades means I should take every uptick. Adding adjacent positive diffs equals buying each valley and selling the next peak, because a three-day climb telescopes. Linear, one accumulator. If they add a cooldown I switch to hold/cash DP.”

## Common mistakes

- Reusing **121** (one global min / max) — misses a second climb.
- Forbidding same-day sell+buy when the statement allows it (the sum-of-upticks view needs that).
- Returning a **negative**.
- Coding full k-transaction DP for unlimited k.
- Subtracting `prices[0]` from the last price on a **non-monotone** series.

## Follow-ups

- **I (121):** one transaction — [coding-buy-sell-stock.md](coding-buy-sell-stock.md).
- **Cooldown (309):** [coding-stock-cooldown.md](coding-stock-cooldown.md).
- **Fee (714) / at most k (188):** extra DP state; say it, do not code unless asked.
- **Maximum subarray:** [coding-maximum-subarray.md](coding-maximum-subarray.md) on adjacent diffs **with a different combine** (Kadane, not sum-of-positives).

## Sources

- [122. Best Time to Buy and Sell Stock II — LeetCode](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/) — accessed 2026-11-17
- [Best Time to Buy and Sell Stock II — NeetCode](https://neetcode.io/solutions/best-time-to-buy-and-sell-stock-ii) — accessed 2026-11-17
- [122. Best Time to Buy and Sell Stock II — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/122/) — accessed 2026-11-17
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-11-17
- [NeetCode 250 list — DSA Prep](https://www.dsaprep.dev/sheets/neetcode-250) — accessed 2026-11-17
