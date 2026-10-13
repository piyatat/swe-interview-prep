# Best Time to Buy and Sell Stock with Cooldown — answer outline

**Prompt:** `prices[i]` is the price on day `i`. Complete as many transactions as you like, but after you **sell** you must wait **one** day before buying again. Hold at most one share. Return max profit. (LeetCode 309)

This is **state-machine DP**, cousin of [coding-buy-sell-stock.md](coding-buy-sell-stock.md) (one trade) and [coding-house-robber.md](coding-house-robber.md) (take vs skip with a gap). NeetCode 150 1D-DP box. Wikipedia [finite-state machine](https://en.wikipedia.org/wiki/Finite-state_machine) + [dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming).

## Probes

- Cooldown is **after a sell**, not after a buy. Same-day buy+sell is allowed on the usual statement; next buy is blocked only the day after a sell.
- Unlimited trades — not 121 (one) and not 188 (k).
- `n = 1` → `0`. Strictly decreasing → `0`.
- O(n) time, O(1) space is the live target; a 2-D memo is fine to start.

## Strong answer skeleton — three rolling states

1. **Clarify:** prices ≥ 0; must sell before buying again; cooldown = one full day.
2. **States after considering day `i`:**
   - `hold` — you own a share (bought today or earlier).
   - `sold` — you sold **today**.
   - `rest` — no share, and you **may** buy tomorrow (rested or never bought).
3. **Transitions** (use yesterday’s copies):
   - `hold' = max(hold, rest - price)`
   - `sold' = hold + price`
   - `rest' = max(rest, sold)`  — entering rest from yesterday’s sale **or** staying flat
4. **Init:** `hold = -inf` (or `-prices[0]` after day 0), `sold = 0`, `rest = 0`.
5. **Answer:** `max(sold, rest)` — you would not hold a leftover share for profit.
6. **Complexity:** O(n) time, O(1) extra space.

DFS+memo twin: `dfs(i, holding)`; on sell jump to `i+2`. Same recurrence, O(n) states.

## Sketch

```
def maxProfit(prices):
  hold, sold, rest = float('-inf'), 0, 0
  for p in prices:
    hold, sold, rest = (
      max(hold, rest - p),
      hold + p,
      max(rest, sold),
    )
  return max(sold, rest)
```

`[1,2,3,0,2]` → **3** (buy 1 / sell 2, cooldown, buy 0 / sell 2). `[1]` → **0**.

## Mock narration (30 sec)

> “Three accounts: holding, just-sold, and free-to-buy. Each price I either buy from rest, sell from hold (and go into cooldown), or sit. Tomorrow’s rest can absorb today’s sale. I never need more than three integers.”

## Common mistakes

- Applying 122 (sum every uptick) — cooldown can make a skip **better**.
- Blocking the day after a **buy** instead of after a **sell**.
- Updating `rest` from the **new** `sold` in the same iteration (uses today’s sale as if cooldown already finished).
- Returning `hold` (unrealized) or allowing two shares.
- O(n²) “try every sell day” without naming the state machine.

## Follow-ups

- **I (121)** — one transaction: [coding-buy-sell-stock.md](coding-buy-sell-stock.md).
- **II (122):** drop cooldown; `rest` absorbs `sold` the same day.
- **With fee (714):** subtract fee on sell.
- **At most k (188):** k layers of hold/cash — say it, do not code unless asked.

## Sources

- [Best Time to Buy and Sell Stock with Cooldown — NeetCode](https://neetcode.io/solutions/best-time-to-buy-and-sell-stock-with-cooldown) — accessed 2026-10-13
- [309. Best Time to Buy and Sell Stock with Cooldown — LeetCode Wiki](https://leetcode.doocs.org/en/lc/309/) — accessed 2026-10-13
- [Best Time to Buy and Sell Stock with Cooldown — LeetCode 309](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/) — accessed 2026-10-13
- [Finite-state machine — Wikipedia](https://en.wikipedia.org/wiki/Finite-state_machine) — accessed 2026-10-13
- [Dynamic programming — Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming) — accessed 2026-10-13
