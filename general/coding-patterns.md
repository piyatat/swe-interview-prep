# Coding patterns & DSA

Coding rounds score **decomposition, correct data structures, complexity awareness, edge cases, and communication** — not memorized solutions.

## Core patterns (learn ~15 deeply)

| Pattern | Typical signals | Examples |
| --- | --- | --- |
| Hash map / set | O(1) lookup, frequency, dedupe | Two Sum, group anagrams |
| Two pointers | Sorted array, pair constraints | 3Sum, container with most water |
| Sliding window | Subarray/substring with constraint | Longest substring without repeat |
| Stack / queue | Matching, monotonic, BFS order | Valid parentheses, daily temperatures |
| Binary search | Sorted data, answer space | Search rotated array, min in window |
| BFS / DFS | Graphs, trees, islands | Number of islands, word ladder |
| Heap | Top-K, streaming median | K closest points |
| Intervals | Merge, overlap, scheduling | Meeting rooms, insert interval |
| Backtracking | Combinations, permutations | Subsets, N-Queens |
| Dynamic programming | Optimal substructure | Coin change, LIS, grid paths |
| Trie | Prefix queries | Autocomplete, word search II |
| Union-find | Connected components | Redundant connection |

Structured lists: **NeetCode 150**, **Grind 75**, **Blind 75** (see [../resources/practice-platforms.md](../resources/practice-platforms.md)).

**Mock answer outlines:** [../answers/](../answers/) (Two Sum, LRU Cache, Islands, Merge K Lists, …)

## Sample questions by difficulty

### Easy (warm-up / phone screen)

1. **Valid anagram** — hash map counts or sort; discuss Unicode if asked.
2. **Merge two sorted lists** — dummy head pointer; O(n+m) time.
3. **Maximum subarray** — Kadane’s; tie to real metrics pipelines.
4. **Binary search** — implement iteratively; off-by-one invariants.
5. **Reverse linked list** — iterative vs recursive; stack depth.

### Medium (onsite bread-and-butter)

1. **LRU cache** — hash map + doubly linked list; O(1) get/put.
2. **Number of islands** — DFS/BFS on grid; visit marking.
3. **Course schedule** — topological sort; cycle detection.
4. **Decode ways** — DP; handle leading zeros.
5. **Kth largest element** — heap vs quickselect tradeoffs.
6. **Longest consecutive sequence** — hash set; O(n) without sorting.
7. **Product of array except self** — prefix/suffix without division.
8. **Word break** — DP or BFS on indices.
9. **Meeting rooms II** — min-heap on end times.
10. **Implement Trie** — prefix tree for search products.

### Hard (stretch / senior signal)

1. **Median finder** — two heaps balancing.
2. **Serialize/deserialize binary tree** — BFS/DFS encoding choices.
3. **Alien dictionary** — topo sort from partial order.
4. **Trapping rain water** — two pointers or stack.

## How to answer (scoring rubric)

1. **Clarify** — inputs, outputs, constraints, edge cases (empty, duplicates, overflow).
2. **Brute force** — state complexity; why it’s insufficient.
3. **Optimize** — name pattern; prove complexity.
4. **Code** — clean names; handle edges.
5. **Test** — walk through example + one edge case.
6. **Follow-ups** — streaming input, persistence, multithreading (conceptual).

## Practice ratio (typical SWE loop)

Rough blend from interview-prep guides: **~50% coding**, **~30% system design**, **~20% behavioral** — shift toward design + behavioral for senior roles.

## Sources

- [Software Engineer Interview Questions — EduAvenues](https://www.eduavenues.com/blog/software-engineer-interview-questions) — accessed 2026-08-22
- [Software Engineer Interview Guide — Interview Pilot](https://www.interviewpilot.app/interview-guides/software-engineer) — accessed 2026-08-22
- [Interview Question Bank — Beyz AI](https://beyz.ai/blog/interview-question-bank-complete-practical-guide) — accessed 2026-08-22
