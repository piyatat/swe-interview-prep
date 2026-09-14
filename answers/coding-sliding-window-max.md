# Sliding Window Maximum — answer outline

**Prompt:** Array `nums`, window size `k`. Return the **maximum** of each contiguous window of length `k` as the window slides right. (LeetCode 239)

This is a **fixed-size** window, but vanilla “track a max and rescan when it leaves” is still O(nk). Cousin of [coding-min-window.md](coding-min-window.md) (variable coverage window) and [coding-daily-temperatures.md](coding-daily-temperatures.md) (monotonic **stack** — next greater). Here you need both ends: drop **expired** indices from the front and **dominated** (smaller) candidates from the back → a [deque](https://en.wikipedia.org/wiki/Double-ended_queue) / monotonic queue. NeetCode 150 / hard box; shows up as the sliding-window finisher after LC 3 / 76.

## Probes

- `k == 1` → copy of `nums`. `k == n` → one value.
- Empty / `k < 1` — clarify; classic constraints: `1 ≤ k ≤ n`.
- Negatives and duplicates are allowed — **strictly decreasing** deque of **values** still works if you store **indices** (ties: keep the later index or pop equals — either is fine if you expire by index).
- Heap with lazy delete is O(n log k) and easy to get wrong; they usually want **O(n)**.

## Strong answer skeleton — monotonic deque

1. **Clarify:** inclusive windows; return length `n - k + 1`.
2. **Why deque:** front = index of current max; back = newest. Values of stored indices are **decreasing**.
3. For each `i`:
   - Pop front while `dq[0] ≤ i - k` (left the window).
   - Pop back while `nums[dq[-1]] ≤ nums[i]` (cannot be max while `i` is in the window).
   - Append `i`.
   - If `i ≥ k - 1`, append `nums[dq[0]]` to the answer.
4. **Complexity:** each index is pushed and popped **at most once** → O(n) time, O(k) extra space.

## Sketch (decreasing indices)

```
dq, out = deque(), []
for i, x in enumerate(nums):
  if dq and dq[0] <= i - k:
    dq.popleft()
  while dq and nums[dq[-1]] <= x:
    dq.pop()
  dq.append(i)
  if i >= k - 1:
    out.append(nums[dq[0]])
return out
```

`[1,3,-1,-3,5,3,6,7]`, `k = 3` → `[3,3,5,5,6,7]`. After `5` enters, `-1` and `-3` are gone from the deque.

## Mock narration (30 sec)

> “I keep a decreasing deque of indices. The front is the window max. When a larger value arrives I drop smaller ones from the back — they can never win while this value is still inside. When the front index is older than `i - k + 1`, I pop it. Each index enters and leaves once, so it is linear.”

## Common mistakes

- Storing **values** not indices — you cannot tell when the max expired.
- Using a stack only (no `popleft`) — expired max is stuck.
- Forgetting to emit until the first full window (`i >= k - 1`).
- Off-by-one: expire with `i - k` vs `i - k + 1` — walk one example.
- Nested `max(nums[i:i+k])` — they will ask complexity.

## Follow-ups

- **Window minimum:** increasing deque (pop back while `≥`).
- **Both min and max:** two deques.
- **Heap:** `(value, index)` max-heap; skip stale tops. Fine if they accept O(n log k).
- **Sparse table / RMQ:** overkill unless they ban extra structures.

## Sources

- [Sliding Window Maximum — NeetCode](https://neetcode.io/solutions/sliding-window-maximum) — accessed 2026-09-14
- [Sliding Window Maximum — LeetCode 239](https://leetcode.com/problems/sliding-window-maximum/) — accessed 2026-09-14
- [Double-ended queue (monotonic queue) — Wikipedia](https://en.wikipedia.org/wiki/Double-ended_queue) — accessed 2026-09-14
- [Introduction to Monotonic Queues — GeeksforGeeks](https://www.geeksforgeeks.org/dsa/introduction-to-monotonic-queues/) — accessed 2026-09-14
- Classic LeetCode #239 — fixed window max via decreasing deque
