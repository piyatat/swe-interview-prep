# Word Break — answer outline

**Prompt:** Given string `s` and a word list `wordDict`, return whether `s` can be segmented into a sequence of dictionary words (reuse allowed). (LeetCode 139)

Listed as a medium staple in [../general/coding-patterns.md](../general/coding-patterns.md) and a senior favorite (Word Break II) in [../companies/faang-big-tech.md](../companies/faang-big-tech.md). Same “unbounded reuse” family as [coding-coin-change.md](coding-coin-change.md), but the state is a **string prefix**, not an integer amount.

## Probes

- Naive recursion on every prefix is exponential — overlapping suffixes.
- `wordDict` as a **set** (and optionally max word length) vs scanning the list each time.
- `dp[i]` = first `i` chars breakable? Off-by-one: size `n+1`, return `dp[n]`.
- Empty `s` → true. Empty dict + nonempty `s` → false.

## Strong answer skeleton

1. **Clarify:** reuse; whole string must be consumed; case-sensitive unless they say otherwise.
2. **Brute:** try every dict word as a prefix of the remaining suffix — tree of splits.
3. **State:** `dp[i] == true` iff `s[0:i]` is a concatenation of dict words. `dp[0] = true` (empty prefix).
4. **Transition:** `dp[i]` if some `j < i` has `dp[j]` and `s[j:i] ∈ wordSet`.
5. **Prune:** only try `j` in `[i - maxLen, i)` so you never slice longer than any word.
6. **Complexity:** O(n² · L) naive substring/hash, often quoted O(n²) with bounded word length / rolling hash. Space O(n + |dict|).

BFS on start indices (queue positions that are reachable) is the same DAG.

## Bottom-up sketch

```
wordSet = set(wordDict); maxLen = max length in dict
dp[0] = True; dp[1..n] = False
for i in 1..n:
  for j in max(0, i-maxLen) .. i-1:
    if dp[j] and s[j:i] in wordSet:
      dp[i] = True; break
return dp[n]
```

Top-down: `can(i)` memoized on start index; try words that match `s[i:]`.

## Mock narration (30 sec)

> “This is coin-change on prefixes. I’ll mark which prefixes are breakable, starting with the empty prefix. At each end index I look back at most the longest dictionary word and ask whether that slice is in the set and the left prefix was already good. If `dp[n]` is true, the whole string segments.”

## Common mistakes

- Forgetting `dp[0] = true` (nothing ever becomes reachable).
- Returning `dp[n-1]` (last character unused).
- `in list` instead of a set → extra |dict| factor.
- Treating it as “contains each word once” (order / unused words do not matter; reuse does).

## Follow-ups

- **Word Break II (140):** return all sentences. Memo lists of suffixes; **run 139 first** or memo empty on dead suffixes — `"aaa…ab"` vs `{a, aa}` explodes without a feasibility cut.
- **Concatenated Words (472):** same DP per word against the rest of the list.
- Trie of the dictionary if they want prefix pruning ([coding-trie.md](coding-trie.md)).

## Sources

- [Word Break walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/word-break-interview-walkthrough/) — accessed 2026-08-29
- [Word Break DP — techinterview.org](https://www.techinterview.org/post/3233460131/word-break-problem-dynamic-programming-solution/) — accessed 2026-08-29
- [Word Break memo / II pruning — techinterview.org](https://www.techinterview.org/post/3233476084/word-break-memoized-recursion-dp/) — accessed 2026-08-29
- [Word Break — InterviewLoop](https://interviewloop.app/learn/code/dynamic-programming/259-word-break-leetcode-interview-questions-explained) — accessed 2026-08-29
- Classic LeetCode #139 / #140 — prefix DP / segmentation
