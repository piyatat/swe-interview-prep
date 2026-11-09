# Valid Anagram — answer outline

**Prompt:** Strings `s` and `t` (lowercase). Return whether `t` is an **anagram** of `s` — same characters with the same counts, any order. (LeetCode 242)

This is the **one-pair fingerprint** problem in the NeetCode 150 / Blind 75 arrays-and-hashing box. Listed as a sample easy in [../general/coding-patterns.md](../general/coding-patterns.md). Sibling of [coding-group-anagrams.md](coding-group-anagrams.md) (many words, bucket by the same key) and [coding-permutation-string.md](coding-permutation-string.md) (anagram as a **window** inside a longer string). Wikipedia [Anagram](https://en.wikipedia.org/wiki/Anagram).

## Probes

- Unequal lengths → false immediately.
- Sorting both is correct and **O(n log n)**. Beat it with counts.
- Lowercase `a–z` in the classic prompt → 26-int array is O(1) space. Unicode follow-up → hash map.
- Empty strings: `""` vs `""` is true; ask if they allow it.

## Strong answer skeleton

1. **Clarify:** exact anagram (not subsequence); charset; case.
2. **Brute:** sort both, compare. Early-out on `len(s) != len(t)`.
3. **Count:** 26-array (or `Counter`). Increment on `s`, decrement on `t` (or build two maps and compare). Any leftover ≠ 0 → false.
4. **One-map variant:** count `s`, walk `t` and decrement; if a count goes **negative**, fail (needs the length check so leftovers cannot hide).
5. **Complexity:** O(n) time, O(Σ) space — O(1) for `a–z`.

## Sketch (`inc` / `dec` array)

```
if len(s) != len(t): return False
cnt = [0] * 26
for a, b in zip(s, t):
  cnt[ord(a) - ord('a')] += 1
  cnt[ord(b) - ord('a')] -= 1
return all(v == 0 for v in cnt)
```

`s = "anagram"`, `t = "nagaram"` → true. `"rat"` / `"car"` → false.

## Mock narration (30 sec)

> “Anagrams are the same multiset. I’ll reject unequal lengths, then count letters in one 26-slot array — plus on s, minus on t. If every slot lands on zero, they match. Linear time, constant space for lowercase.”

## Common mistakes

- Skipping the **length** check and comparing maps that can still look equal with leftovers.
- Sorting every time after claiming O(n).
- Using `sorted(s) == sorted(t)` without mentioning the n log n cost.
- Unicode / case they did not specify — ask; `ord(c) - ord('a')` **breaks** off `a–z`.
- Treating permutation-in-a-string (567) as this problem — that needs a **window**.

## Follow-ups

- **Group Anagrams (49)** — same fingerprint, many buckets — [coding-group-anagrams.md](coding-group-anagrams.md).
- **Permutation in String (567)** — [coding-permutation-string.md](coding-permutation-string.md).
- **Find All Anagrams (438)** — same window; collect starts.
- Unicode: `Counter` / hash map; do not assume 26.

## Sources

- [242. Valid Anagram — LeetCode](https://leetcode.com/problems/valid-anagram/) — accessed 2026-11-09
- [Valid Anagram — NeetCode](https://neetcode.io/solutions/valid-anagram) — accessed 2026-11-09
- [242. Valid Anagram — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/242/) — accessed 2026-11-09
- [Anagram — Wikipedia](https://en.wikipedia.org/wiki/Anagram) — accessed 2026-11-09
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-11-09
