# Two Sum — answer outline

**Prompt:** Given an array of integers `nums` and integer `target`, return indices of two numbers that add to `target`. Exactly one solution; no reuse same element twice.

## Probes

- Can you beat O(n²)?
- What if array is sorted?
- Hash map vs two pointers — when which?

## Strong answer skeleton

1. **Clarify:** duplicates allowed? negative numbers? return any valid pair?
2. **Brute force:** nested loops O(n²) time, O(1) space — baseline.
3. **Optimal:** one pass hash map storing `value → index`.
   - For each `x`, check if `target - x` in map; else store `x`.
4. **Complexity:** O(n) time, O(n) space.
5. **Sorted variant:** two pointers at ends; move based on sum vs target — O(n log n) if sort needed.

## Mock narration (30 sec)

> “I'll use a hash map of seen values to indices. One pass: for each number I check if complement exists; if not I insert. That gives linear time.”

## Common mistakes

- Returning values instead of indices
- Using same element twice (check index)
- Forgetting empty / single-element edge (problem usually guarantees solution)

## Follow-ups

- Return all pairs (different problem)
- Three sum — sort + two pointers outer loop

## Sources

- Classic LeetCode #1 — pattern: hash map complement
