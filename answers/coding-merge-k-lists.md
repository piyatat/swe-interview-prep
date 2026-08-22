# Merge K Sorted Lists — answer outline

**Prompt:** Merge `k` sorted linked lists into one sorted list.

## Probes

- Heap vs divide-and-conquer?
- Complexity in terms of N (total nodes) and k?
- Linked list vs array?

## Strong answer skeleton

1. **Clarify:** empty lists, single list, compare by value?
2. **Approach A — min-heap:** push head of each list; pop min, append to result, push next from that list.
   - Time O(N log k), space O(k).
3. **Approach B — divide & conquer:** merge pairs recursively — same complexity, different constants.
4. **Avoid:** merging one-by-one into growing list — O(kN).

## Heap narration

> “I keep a heap of size k with the current smallest head from each list. Each extraction attaches one node — N extractions, log k per step.”

## Common mistakes

- O(kN) sequential merge
- Forgetting dummy head for simpler pointer juggling
- Not handling null lists in input array

## Follow-ups

- Merge k sorted **arrays** — same heap trick
- External sort on disk — k-way merge intuition

## Sources

- LeetCode #23 — senior FAANG favorite
