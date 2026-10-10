# Permutation in String — answer outline

**Prompt:** Strings `s1` and `s2` (lowercase). Return whether `s2` contains a **permutation of `s1` as a contiguous substring**. (LeetCode 567)

This is a **fixed-width anagram window**, not “longest unique.” Sibling of [coding-min-window.md](coding-min-window.md) (variable coverage) and [coding-character-replacement.md](coding-character-replacement.md) (`width − maxf`). Named under sliding window in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150. Wikipedia [Anagram](https://en.wikipedia.org/wiki/Anagram).

## Probes

- Permutation ⇔ same **multiset** as `s1` in some `s2[i : i+|s1|)`.
- `|s1| > |s2|` → false. Empty `s1` is usually true (ask).
- Sorting every window is correct and **O(n · k log k)**. Beat it with counts.
- Same template as **Find All Anagrams (438)** — return starts instead of a bool.

## Strong answer skeleton

1. **Clarify:** contiguous (substring, not subsequence); charset `a–z`.
2. **Brute:** every start `i`, sort `s2[i:i+k]` vs sorted `s1`.
3. **Fixed window:** `k = |s1|`. Count `s1`. Slide on `s2`: add `s2[r]`, drop `s2[r-k]` once `r ≥ k`.
4. **Match:** 26-int arrays equal, **or** a `need` / `matches` counter so you do not compare 26 every step.
5. **Complexity:** O(|s1| + |s2|) time, O(Σ) = O(1) space for lowercase.

## Sketch (`need` of distinct letters)

```
cnt = Counter(s1); need = len(cnt)
for i, c in enumerate(s2):
  cnt[c] -= 1
  if cnt[c] == 0: need -= 1
  if i >= len(s1):
    left = s2[i - len(s1)]
    cnt[left] += 1
    if cnt[left] == 1: need += 1
  if need == 0: return True
return False
```

`s1 = "ab"`, `s2 = "eidbaooo"` → window `"ba"` matches. `"eidboaoo"` never does.

## Mock narration (30 sec)

> “I need a window exactly the length of s1 whose counts match. I’ll load s1’s frequencies, slide a fixed window across s2, and track how many distinct letters are still off. When that hits zero, the window is a permutation.”

## Common mistakes

- Variable window (min-window instincts) instead of **fixed** `|s1|`.
- Comparing sorted strings every step after claiming O(n).
- Forgetting to **pop the left** char, so the window grows.
- Treating extra copies of a needed letter as still valid (`need` goes negative — keep the `== 0` / `== 1` gates).
- Unicode / case they did not specify — ask.

## Follow-ups

- **Find All Anagrams (438)** — same window; collect `i-k+1`.
- **Minimum window substring** — [coding-min-window.md](coding-min-window.md).
- **Longest repeating character replacement** — [coding-character-replacement.md](coding-character-replacement.md).

## Sources

- [Permutation in String — NeetCode](https://neetcode.io/solutions/permutation-in-string) — accessed 2026-10-10
- [567. Permutation in String — LeetCode Wiki](https://leetcode.doocs.org/en/lc/567/) — accessed 2026-10-10
- [Permutation in String — LeetCode 567](https://leetcode.com/problems/permutation-in-string/) — accessed 2026-10-10
- [Anagram — Wikipedia](https://en.wikipedia.org/wiki/Anagram) — accessed 2026-10-10
- [Algorithmic technique — Wikipedia](https://en.wikipedia.org/wiki/Algorithmic_technique) — accessed 2026-10-10
