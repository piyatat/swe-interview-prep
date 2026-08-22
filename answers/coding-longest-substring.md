# Longest substring without repeating characters — answer outline

**Prompt:** Given string `s`, return the **length** of the longest **substring** (contiguous) with all unique characters. Classic LeetCode #3; phone-screen staple for the variable sliding window.

Examples: `"abcabcbb"` → 3 (`"abc"`); `"bbbbb"` → 1; `"pwwkew"` → 3 (`"wke"`, not `"pwke"` — that is a subsequence).

## Probes

- Substring vs subsequence?
- Alphabet (ASCII vs Unicode) — map vs `int[128]`?
- Return the slice, not just length?
- Why is the inner shrink loop still O(n)?

## Strong answer skeleton

1. **Clarify:** empty → 0; all unique → `n`; charset.
2. **Brute:** all `i..j` uniqueness → O(n²) with a set, worse if you rescan.
3. **Window invariant:** `s[left..right]` has distinct chars. Advance `right`; shrink `left` until the new char is unique again; track max width `right - left + 1`.
4. **Complexity:** each index enters/leaves at most once → O(n) time, O(min(n, Σ)) space.

## Set + shrink (easiest to narrate)

```
seen = {}
left = best = 0
for right, ch in enumerate(s):
  while ch in seen:
    seen.remove(s[left]); left += 1
  seen.add(ch)
  best = max(best, right - left + 1)
```

Trace `"pwwkew"`: grow `pw` → second `w` drops `p` then first `w` → grow `wke` (3) → …

## Map + jump (same O(n); one foot-gun)

Map `ch → last index`. On repeat, set `left = last[ch] + 1` **only if** `last[ch] >= left`. Update `last[ch] = right` **every** time.

Without the `>= left` guard, `"abba"` jumps `left` **backwards** on the final `a` and inflates the answer.

## Common mistakes

- `right - left` instead of `+ 1`
- Resetting the set instead of shrinking (back to O(n²))
- Updating last-seen only on duplicates
- Treating `"pwke"` as valid for `"pwwkew"`

## Follow-ups

- Return the substring — store `best_left` when `best` updates.
- At most **k distinct** (LC 340 family) — shrink when distinct count > k.
- Fixed window: anagram / permutation in a string (different template).

## Sources

- [How the sliding window solves Longest Substring Without Repeats — techinterview.org](https://www.techinterview.org/post/3233476081/sliding-window-longest-substring-without-repeats/) — accessed 2026-08-22
- [Longest Substring Without Repeating Characters editorial — DSA Handbook](https://dsa.handbook.academy/editorials/lc-003-longest-substring-without-repeating-characters/) — accessed 2026-08-22
- [String sliding window interview patterns — techinterview.org](https://www.techinterview.org/post/3233464822/string-sliding-window-interview-patterns/) — accessed 2026-08-22
- Classic LeetCode #3 — variable sliding-window pattern
