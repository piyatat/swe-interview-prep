# Valid Palindrome — answer outline

**Prompt:** Given string `s`, return whether it is a palindrome **after** ignoring non-alphanumeric characters and treating letters as **case-insensitive**. (LeetCode 125)

This is the **two-pointer skip** problem in the NeetCode 150 / Blind 75 two-pointers box. Sibling of [coding-two-sum-ii.md](coding-two-sum-ii.md) (inward pointers on a **sorted array**) — here the “sorted” gift is the palindrome definition itself. Different from [coding-longest-palindrome.md](coding-longest-palindrome.md) (longest **substring**, expand centers) and [coding-palindrome-list.md](coding-palindrome-list.md) (linked-list reverse-half). Wikipedia [palindrome](https://en.wikipedia.org/wiki/Palindrome): reads the same forward and backward.

## Probes

- Empty / single character / all punctuation → **true** (cleaned string is empty or length 1).
- Digits count (`0-9`); `isalnum` vs “letters only.”
- Extra-space reverse of a cleaned copy is O(n) memory — they will ask O(1).
- Unicode / non-ASCII: classic prompt is **printable ASCII**; say `isascii` if they widen it.

## Strong answer skeleton — two pointers

1. **Clarify:** skip spaces and punctuation; case-insensitive; digits stay; empty cleaned string is a palindrome.
2. **Brute:** filter to lowercase alnum, reverse, compare — O(n) time, O(n) space.
3. **Optimal:** `l = 0`, `r = n - 1`. While `l < r`:
   - Advance `l` while `l < r` and not alnum.
   - Retreat `r` while `r > l` and not alnum.
   - If `lower(s[l]) != lower(s[r])` → false.
   - `l += 1`; `r -= 1`.
4. **Complexity:** O(n) time, O(1) extra (no cleaned copy).

Write your own `isAlnum` from ranges if the language’s helper is banned: `A–Z`, `a–z`, `0–9`.

## Sketch

```
l, r = 0, n-1
while l < r:
  while l < r and not alnum(s[l]): l += 1
  while r > l and not alnum(s[r]): r -= 1
  if lower(s[l]) != lower(s[r]): return False
  l += 1; r -= 1
return True
```

`"A man, a plan, a canal: Panama"` → true. `"tab a cat"` → false. `s = ".,"` → true.

## Mock narration (30 sec)

> “I only compare letters and digits, case-insensitive. Two pointers walk in from the ends and skip junk. If a pair mismatches, it is not a palindrome; if they meet, it is. Linear time, constant extra space — no reversed copy.”

## Common mistakes

- Comparing `'A'` to `'a'` without folding case.
- Counting spaces / commas in the palindrome.
- Inner skip loops **without** `l < r` (pointers cross on `"ab@"`).
- Using a cleaned string after they asked O(1) space.
- Unicode `isalpha` that treats more than ASCII if the prompt did not.

## Follow-ups

- **Valid Palindrome II (680):** skip **at most one** char — try both deletions on the first mismatch.
- **Palindrome linked list:** [coding-palindrome-list.md](coding-palindrome-list.md).
- **Longest palindromic substring:** [coding-longest-palindrome.md](coding-longest-palindrome.md).
- **Palindromic subsequences / substrings count:** [coding-palindromic-substrings.md](coding-palindromic-substrings.md).

## Sources

- [125. Valid Palindrome — LeetCode](https://leetcode.com/problems/valid-palindrome/) — accessed 2026-11-08
- [Valid Palindrome — NeetCode](https://neetcode.io/solutions/valid-palindrome) — accessed 2026-11-08
- [125. Valid Palindrome — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/125/) — accessed 2026-11-08
- [Palindrome — Wikipedia](https://en.wikipedia.org/wiki/Palindrome) — accessed 2026-11-08
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-08
