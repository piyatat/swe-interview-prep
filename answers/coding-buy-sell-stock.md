# Best Time to Buy and Sell Stock — answer outline

**Prompt:** `prices[i]` is the price on day `i`. Choose **one** buy day and a **later** sell day to maximize `sell - buy`. If no profit, return `0`. (LeetCode 121)

This is **one-pass min-so-far**. Listed conceptually with Kadane in [coding-maximum-subarray.md](coding-maximum-subarray.md) (profit = max of `price[j] - price[i]` is Kadane on **adjacent diffs**). Greedy in the Wikipedia sense: keep the locally best buy, never revisit it.

## Probes

- **One** transaction — not II (unlimited) or cooldown / fee variants.
- Sell **after** buy; same-day trade is illegal on the usual statement.
- Strictly decreasing → `0`, not a negative.
- O(n) time, O(1) space — nested all pairs is the brute they want named.

## Strong answer skeleton

1. **Clarify:** empty / single day → `0`; negatives? (classic prices are ≥ 0).
2. **Brute:** every `i < j`, track `prices[j] - prices[i]` — O(n²).
3. **Invariant:** scan left → right as **sell day**. Best buy is the **minimum to the left**.
4. **Update:** `best = max(best, price - min_buy)`; then `min_buy = min(min_buy, price)`.
5. **Why it is safe:** a cheaper later price can only help **future** sells; you already recorded profit against the old min. [Greedy algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm) — local min, no backtrack.
6. **Complexity:** O(n) time, O(1) space.

Two-pointer twin: `l` = buy, `r` = sell; if `prices[r] > prices[l]` update profit; else move `l` to `r` (new cheaper buy). Same O(n).

## Sketch

```
best = 0
min_buy = prices[0]
for p in prices:
  best = max(best, p - min_buy)
  min_buy = min(min_buy, p)
return best
```

`[7,1,5,3,6,4]` → `5` (buy `1`, sell `6`). `[7,6,4,3,1]` → `0`.

## Mock narration (30 sec)

> “I walk once, treating today as the sell. The best buy is the cheapest day I have already seen. I update max profit, then maybe lower the min. If the array only falls, profit stays zero. Linear, two scalars.”

## Common mistakes

- Tracking global max and min **without order** — max may be **before** min.
- Returning a **negative** when prices only drop.
- Allowing two buys (that is II) or selling on the buy day.
- Claiming you need a segment tree / prefix array — overkill for one transaction.

## Follow-ups

- **II (122):** sum every uptick (or DP hold/cash).
- **With cooldown (309) / fee (714):** extra DP states.
- **At most k (188):** k layers of hold/cash — say it, do not code unless asked.
- **Maximum subarray:** [coding-maximum-subarray.md](coding-maximum-subarray.md) on `diff[i] = prices[i+1] - prices[i]`.

## Sources

- [Best Time to Buy and Sell Stock — NeetCode](https://neetcode.io/solutions/best-time-to-buy-and-sell-stock) — accessed 2026-09-07
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-09-07
- [Maximum subarray problem — Wikipedia](https://en.wikipedia.org/wiki/Maximum_subarray_problem) — accessed 2026-09-07
- Classic LeetCode #121 / #122 / #123 / #188 / #309 / #714 — stock DP family
