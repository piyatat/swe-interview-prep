# Palindrome Linked List — answer outline

**Prompt:** Given the `head` of a singly linked list, return whether it is a palindrome. (LeetCode 234)

Copying values into an array is correct and easy to say first. The follow-up is **O(1) extra space**: find the middle, reverse the second half, compare. Sibling of [coding-linked-list.md](coding-linked-list.md) (reverse + Floyd) and [coding-longest-palindrome.md](coding-longest-palindrome.md) (string centers, not list rewiring). Wikipedia [Palindrome](https://en.wikipedia.org/wiki/Palindrome). NeetCode 150 linked-list box.

## Probes

- Singly linked: you cannot walk backward without reverse or extra storage.
- Odd vs even length: slow/fast landing must leave a clean second-half start.
- Follow-up: **restore** the list after the check (re-reverse the second half).
- Values are digits `0–9` on the usual statement — do not overfit; the algorithm is value-agnostic.
- Recursive two-pointer uses **O(n) stack** — say it; they usually want iterative O(1).

## Strong answer skeleton — reverse second half

1. **Clarify:** empty / one node are palindromes; singly; mutate OK unless they forbid it.
2. **O(n) space (say first):** push values into an array, two-index compare.
3. **O(1) space:** slow/fast to the middle; reverse from mid (or `slow.next`) to tail.
4. Compare `head` with the reversed half until the reversed pointer is null (odd middle is skipped).
5. Optional: reverse again to restore before returning.
6. **Complexity:** O(n) time; O(1) extra space (iterative).

## Sketch

```
# mid: when fast can't take two steps, slow is at mid
slow, fast = head, head
while fast and fast.next:
  slow = slow.next
  fast = fast.next.next

# reverse second half starting at slow
prev, cur = None, slow
while cur:
  nxt = cur.next
  cur.next = prev
  prev, cur = cur, nxt

left, right = head, prev
while right:
  if left.val != right.val: return False
  left, right = left.next, right.next
return True
```

`[1,2,2,1]` → mid at second `2`; reversed half `1 → 2`; compare matches. `[1,2]` → false.

## Mock narration (30 sec)

> “A palindrome is symmetric about the midpoint. I find mid with slow/fast, reverse the second half in place — same three-pointer reverse as 206 — then walk both halves. I only need the reversed half to finish; the odd middle sits in the first half and never gets compared.”

## Common mistakes

- Starting reverse at the wrong node so the middle is compared twice or a tail is dropped.
- Forgetting that after reverse, `prev` is the new head of the second half.
- Using Floyd `fast = head.next` vs `fast = head` without checking odd/even on an example.
- Returning after the first mismatch without saying you could restore the list.
- Recursing for O(1) space — the call stack is O(n).

## Follow-ups

- **Restore the list:** reverse the second half again and relink `mid.next`.
- **Doubly linked:** walk tail inward; no reverse needed.
- **Palindrome permutation:** different problem (counts); do not reuse this.
- **Cycle:** 234 assumes an acyclic list; run Floyd first if they allow a loop.

## Sources

- [Palindrome Linked List — NeetCode](https://neetcode.io/solutions/palindrome-linked-list) — accessed 2026-10-04
- [234. Palindrome Linked List — LeetCode Wiki](https://leetcode.doocs.org/en/lc/234/) — accessed 2026-10-04
- [Palindrome Linked List — LeetCode 234](https://leetcode.com/problems/palindrome-linked-list/) — accessed 2026-10-04
- [Palindrome — Wikipedia](https://en.wikipedia.org/wiki/Palindrome) — accessed 2026-10-04
