# Longest Repeating Character Replacement — answer outline

**Prompt:** String `s` (uppercase) and integer `k`. You may replace **at most `k`** characters. Return the length of the longest substring that can become **one** character. (LeetCode 424)

This is a **variable window + frequency**, not “longest unique substring.” Sibling of [coding-longest-substring.md](coding-longest-substring.md) (shrink on *any* repeat) and [coding-min-window.md](coding-min-window.md) (coverage). Named under sliding window in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150; Wikipedia [algorithmic technique](https://en.wikipedia.org/wiki/Algorithmic_technique) (sliding window / two pointers).

## Probes

- Optimal replacement in a window is **to the current mode** — replacements needed = `width - maxf`.
- Valid while `right - left + 1 - maxf <= k`.
- `k = 0` → longest run of one char. `k >= n` → `n`.
- Alphabet is 26 — `int[26]` is enough; say Unicode if they change the spec.

## Strong answer skeleton

1. **Clarify:** return length (not the slice); charset; `k` can be 0.
2. **Brute:** every `i..j`, count mode, check `len - mode <= k` → O(n²).
3. **Window:** expand `right`; bump `count[s[right]]`; keep `maxf` = best count seen in the window.
4. While `width - maxf > k`, decrement `count[s[left]]` and `left += 1`.
5. Track max `width`. Each index enters/leaves once → **O(n)** time, **O(Σ)** space.
6. **`maxf` trick:** you may **not** decrement `maxf` on shrink. A stale `maxf` only makes the window look *harder* to keep, so you shrink extra; you never accept an invalid longer answer. Recomputing `max` each shrink is also correct and still O(n) with Σ = 26.

## Sketch

```
count = [0]*26
left = maxf = best = 0
for right, ch in enumerate(s):
  count[ord(ch)-65] += 1
  maxf = max(maxf, count[ord(ch)-65])
  while (right - left + 1) - maxf > k:
    count[ord(s[left])-65] -= 1
    left += 1
  best = max(best, right - left + 1)
return best
```

`"AAABABB"`, `k = 1` → window can hold five (`AAABA` or `AABBB`).

## Mock narration (30 sec)

> “I want the longest window I can make monochromatic with at most k edits. Edits equal width minus the most frequent character. I slide right, update that frequency, and only move left when edits would exceed k. Linear because each index crosses the window once.”

## Common mistakes

- Shrinking when `count[ch] > k` instead of `width - maxf > k` (wrong character).
- Resetting the map instead of decrementing `left` (back to O(n²)).
- Forgetting `k = 0` / all-same / all-distinct cases.
- Treating this as “at most k distinct” (that is LC 340 / 159).

## Follow-ups

- **Longest substring with at most K distinct** — shrink on distinct count, not `width - maxf`.
- **Max consecutive ones III (1004)** — same template on a binary array.
- **Min window / permutation in string** — coverage / fixed need, different invariant.

## Sources

- [Longest Repeating Character Replacement — NeetCode](https://neetcode.io/solutions/longest-repeating-character-replacement) — accessed 2026-09-25
- [Longest Repeating Character Replacement — LeetCode 424](https://leetcode.com/problems/longest-repeating-character-replacement/) — accessed 2026-09-25
- [Algorithmic technique — Wikipedia](https://en.wikipedia.org/wiki/Algorithmic_technique) — accessed 2026-09-25
- [String sliding window interview patterns — techinterview.org](https://www.techinterview.org/post/3233464822/string-sliding-window-interview-patterns/) — accessed 2026-09-25
- Classic LeetCode #424 — sliding-window / frequency family
