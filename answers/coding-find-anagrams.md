# Find All Anagrams in a String — answer outline

**Prompt:** Strings `s` and `p` (lowercase). Return **every start index** where `s[i : i+|p|)` is an **anagram** of `p`. Order of indices does not matter. (LeetCode 438)

This is the **collect-starts** twin of [coding-permutation-string.md](coding-permutation-string.md) (bool “does any window match”). Same **fixed-width** window as that problem; not the variable coverage of [coding-min-window.md](coding-min-window.md). Grind 75 week-7 staple. Wikipedia [anagram](https://en.wikipedia.org/wiki/Anagram).

## Probes

- Anagram ⇔ same **multiset** — length must equal `|p|`.
- `|p| > |s|` → `[]`. Overlapping hits are required (`s = "abab"`, `p = "ab"` → `[0,1,2]`).
- Sorting every window is correct and **O(n · k log k)**. Beat it with counts.
- Comparing two 26-int arrays each step is O(Σ) and fine; a `need` / `matches` counter avoids the scan.

## Strong answer skeleton — fixed window

1. **Clarify:** contiguous substring (not subsequence); charset `a–z`; return starts, not the slices.
2. **Brute:** every `i`, sort `s[i:i+k]` vs sorted `p`.
3. **Fixed window:** `k = |p|`. Load `p` counts. Slide on `s`: add `s[r]`, drop `s[r-k]` once `r ≥ k`.
4. When the window matches, append `r-k+1` (or `r-k+1` after the add). Continue — do **not** stop at the first hit.
5. **Complexity:** O(|s| + |p|) time, O(Σ) = O(1) extra for lowercase.

Quota-shrink variant: add right; while any letter **exceeds** `p`’s count, drop left. If `right-left+1 == k`, the window is an anagram (every letter is within quota **and** the length is exact).

## Sketch (`need` of distinct letters)

```
cnt = Counter(p); need = len(cnt); out = []
for i, c in enumerate(s):
  cnt[c] -= 1
  if cnt[c] == 0: need -= 1
  if i >= len(p):
    left = s[i - len(p)]
    cnt[left] += 1
    if cnt[left] == 1: need += 1
  if need == 0:
    out.append(i - len(p) + 1)
return out
```

`s = "cbaebabacd"`, `p = "abc"` → `[0, 6]` (`cba`, `bac`). Extra `a`/`b` in the middle never hits `need == 0` at width 3.

## Mock narration (30 sec)

> “I need every window the length of p whose counts match. I load p, slide a fixed window across s, and track how many distinct letters are still off. Each time that hits zero I record the start. Same template as permutation-in-string; I just keep going.”

## Common mistakes

- Returning a bool (567) instead of **all** starts.
- Variable min-window instincts — width must stay `|p|`.
- Forgetting to **pop the left** character, so the window grows.
- Off-by-one start: `i` vs `i-k+1` after the add.
- Treating extra copies as still valid (`need` goes negative — keep the `== 0` / `== 1` gates).

## Follow-ups

- **Permutation in String (567)** — [coding-permutation-string.md](coding-permutation-string.md): same window, return bool.
- **Minimum window substring (76)** — [coding-min-window.md](coding-min-window.md): coverage, not fixed width.
- **Valid Anagram (242)** — [coding-valid-anagram.md](coding-valid-anagram.md): one pair, no slide.
- **Group Anagrams (49)** — [coding-group-anagrams.md](coding-group-anagrams.md): many strings, canonical key.

## Sources

- [438. Find All Anagrams in a String — LeetCode](https://leetcode.com/problems/find-all-anagrams-in-a-string/) — accessed 2026-11-21
- [438. Find All Anagrams in a String — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/438/) — accessed 2026-11-21
- [Anagram — Wikipedia](https://en.wikipedia.org/wiki/Anagram) — accessed 2026-11-21
- [Sliding window protocol — Wikipedia](https://en.wikipedia.org/wiki/Sliding_window_protocol) — accessed 2026-11-21
- [Grind 75 — Tech Interview Handbook](https://www.techinterviewhandbook.org/grind75) — accessed 2026-11-21
