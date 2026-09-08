# Minimum Window Substring — answer outline

**Prompt:** Strings `s` and `t`. Return the **shortest substring of `s`** that covers **every character of `t` including duplicates**. If none, `""`. (LeetCode 76)

This is the **coverage-counter** sliding window. Cousin of [coding-longest-substring.md](coding-longest-substring.md) (variable window) — here validity is “`t` is covered,” not “all unique.” Interviewers use it after a lighter window because the bookkeeping is where people fail.

## Probes

- `t` has **duplicates**? `t = "AA"` needs two `A`s — a **set** of `t` is wrong.
- Case-sensitive? Usually yes (`A` ≠ `a`).
- Window must be **contiguous**. No match → `""` (not `None`).
- Why is “rescan `t` inside the loop” too slow?

## Strong answer skeleton

1. **Clarify:** empty `t` / `len(s) < len(t)` → `""`; unique answer guaranteed on LeetCode if one exists.
2. **Need map:** frequencies in `t`. `need =` number of **distinct** keys (or use a `missing` counter over **all** owed chars — both work if you are consistent).
3. **Expand `right`:** add `s[right]` to the window map. When a needed char’s window count **hits** its required count, increment `have`.
4. **While `have == need`:** record best `[left, right]` if shorter; then pop `s[left]` and move `left`. If that char was needed and the window count **falls below** required, decrement `have`.
5. **Complexity:** each index enters/leaves once → `O(|s| + |t|)` time, `O(Σ)` space.

## Sketch (`have` / `need` on distinct keys)

```
need = Counter(t)
have, required = 0, len(need)
window = Counter()
best, best_len = (0, 0), inf
left = 0
for right, ch in enumerate(s):
  window[ch] += 1
  if ch in need and window[ch] == need[ch]:
    have += 1
  while have == required:
    if right - left + 1 < best_len:
      best, best_len = (left, right + 1), right - left + 1
    drop = s[left]
    window[drop] -= 1
    if drop in need and window[drop] < need[drop]:
      have -= 1
    left += 1
return s[best[0]:best[1]] if best_len < inf else ""
```

`"ADOBECODEBANC"`, `t = "ABC"` → `"BANC"`. Extra copies in the window are slack the shrink phase trims.

## Mock narration (30 sec)

> “I count what `t` owes me. I grow a right pointer until every owed character is satisfied — I track that with a single `have` counter so I do not rescan. Then I shrink left as far as I can and remember the shortest valid slice. Each index moves at most twice.”

## Common mistakes

- Using a **set** for `t` (duplicates).
- Incrementing `have` on **every** extra copy, not only when count **becomes equal** to required.
- Returning indices or the window map instead of the slice.
- `O(n²)` “for each left, grow right and recount.”
- Forgetting `""` when `s` never covers `t`.

## Follow-ups

- **Permutation in String / Find All Anagrams:** same maps; window length **fixed** at `|t|`.
- **Longest repeating character replacement / healthiest window:** different invariant, same two pointers.
- Return **start index only**, or count how many minimal windows.

## Sources

- [Minimum Window Substring — NeetCode](https://neetcode.io/solutions/minimum-window-substring) — accessed 2026-09-08
- [Minimum Window Substring — intervu.dev](https://intervu.dev/blog/walkthroughs/minimum-window-substring-interview-walkthrough/) — accessed 2026-09-08
- [The coverage counter behind Minimum Window Substring — techinterview.org](https://www.techinterview.org/post/3233476884/coverage-counter-minimum-window-substring/) — accessed 2026-09-08
- [Sliding window protocol — Wikipedia](https://en.wikipedia.org/wiki/Sliding_window_protocol) — accessed 2026-09-08
