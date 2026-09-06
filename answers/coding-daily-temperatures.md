# Daily Temperatures — answer outline

**Prompt:** Given `temperatures[i]`, return `answer[i]` = days until a **strictly warmer** day; `0` if none. (LeetCode 739)

This is **next greater element to the right**, distances not values. Named as the monotonic-stack example in [../general/coding-patterns.md](../general/coding-patterns.md). Sibling of [coding-valid-parentheses.md](coding-valid-parentheses.md) (stack of chars) and [coding-trapping-rain.md](coding-trapping-rain.md) (another stack / two-pointer height problem).

## Probes

- **Strictly** warmer — equal temps do **not** resolve.
- Last day and a strictly decreasing suffix stay `0`.
- Brute force is O(n²) nested scans; they want **O(n)** amortized.
- Stack stores **indices** (need `i - j`), not raw temperatures.

## Strong answer skeleton

1. **Clarify:** empty → `[]`; singles → `[0]`; ties wait for a higher value.
2. **Why a stack:** unresolved days are a **decreasing** sequence; a new high resolves a suffix of them.
3. **Init** `answer = [0]*n`. Stack = indices with **no warmer yet**, temps decreasing topward.
4. **For each `i`:** while stack and `temps[i] > temps[stack[-1]]`, pop `j`, set `answer[j] = i - j`. Then push `i`.
5. **Leftovers** stay `0` — already initialized.
6. **Complexity:** each index push + pop ≤ once → O(n) time, O(n) space.

## Sketch (monotonic decreasing indices)

```
ans = [0] * n
st = []                          # indices, temps[st] decreasing
for i, t in enumerate(temps):
  while st and temps[st[-1]] < t:
    j = st.pop()
    ans[j] = i - j
  st.append(i)
return ans
```

`[73,74,75,71,69,72,76,73]` → `[1,1,4,2,1,1,0,0]`. At `76`, pop `72,69,71,75` in that order.

## Mock narration (30 sec)

> “I keep a decreasing stack of days still waiting. When today is warmer than the top, that top just found its answer — the gap in indices. Equals stay on the stack. Everyone is pushed and popped at most once, so it is linear.”

## Common mistakes

- Storing values without indices — cannot compute **days**.
- Using `>=` and resolving on equal temps (wrong) or never popping equals (correct) — say it.
- Right-to-left stack of *answers* is a valid twin; still O(n). Do not mix the two mid-code.
- Returning the next **value** (Next Greater Element) instead of the **distance**.
- Claiming O(n²) because of the inner `while` — amortized O(n).

## Follow-ups

- **Next Greater Element I / II:** values, circular array (scan `2n` or prepend).
- **Online stock span:** same decreasing stack, span not days-to-warmer.
- **Largest rectangle in histogram:** increasing stack of indices.
- **Trapping rain water:** [coding-trapping-rain.md](coding-trapping-rain.md).

## Sources

- [Daily Temperatures — NeetCode](https://neetcode.io/solutions/daily-temperatures) — accessed 2026-09-06
- [LC 739 Daily Temperatures — LearningTree](https://winaykumar.com/tech/dsa/leetcode/solutions/739-daily-temperatures/) — accessed 2026-09-06
- [Stack (abstract data type) — Wikipedia](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) — accessed 2026-09-06
- Classic LeetCode #739 — next greater (distance)
