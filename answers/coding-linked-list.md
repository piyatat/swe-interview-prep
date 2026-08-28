# Linked list (reverse + cycle) — answer outline

**Prompt A:** Reverse a singly linked list in place; return the new head. (LeetCode 206)

**Prompt B:** Return whether the list contains a cycle. Follow-up: return the **entry** node of the cycle, or null. (LeetCode 141 / 142)

Listed as phone-screen warm-ups in [../general/coding-patterns.md](../general/coding-patterns.md). Cousin: [coding-merge-k-lists.md](coding-merge-k-lists.md) (k-way merge, not pointer rewiring).

## Probes

- Iterative reverse: three pointers; **save `next` before you flip**.
- Recursive reverse: O(n) stack — say it; interviewers often want iterative.
- Cycle: hash set of **nodes** (not values) vs Floyd O(1) space.
- Why fast cannot skip slow: gap shrinks by **exactly one** per step.
- 142: after they meet, reset one pointer to head; both walk one step.

## Strong answer skeleton — reverse (206)

1. **Clarify:** singly vs doubly; empty / one node; in-place vs new list.
2. **Iterative:** `prev = null`, `curr = head`. Loop: `nxt = curr.next`; `curr.next = prev`; `prev = curr`; `curr = nxt`. Return **`prev`** (`curr` is null).
3. **Complexity:** O(n) time, O(1) extra space.

## Reverse sketch

```
prev, curr = None, head
while curr:
  nxt = curr.next
  curr.next = prev
  prev, curr = curr, nxt
return prev
```

Walk `1 → 2 → 3` → `3 → 2 → 1`. Loop must be `while curr`, not `while curr.next` (drops the last node).

## Strong answer skeleton — cycle (141 / 142)

1. Empty or single node with `next is None` → no cycle. Self-loop is a cycle.
2. **Baseline:** set of node identities while walking; second visit → cycle. O(n) space.
3. **Floyd:** `slow` + `fast` from head. While `fast` and `fast.next`: slow += 1, fast += 2; equal → cycle. Fast hits null → acyclic.
4. **Entry (142):** from the meeting node, put one pointer at head; advance **both by 1** until they meet — that node is μ (start of the loop). Wikipedia / Floyd: meeting implies a multiple of the period; walking from the start finds the first repeat.

## Cycle sketch (141)

```
slow = fast = head
while fast and fast.next:
  slow = slow.next
  fast = fast.next.next
  if slow is fast: return True
return False
```

Guard **`fast` then `fast.next`** before `fast.next.next`. Compare **references**, not `.val`.

## Mock narration (30 sec)

> “Reverse is three pointers: stash next, point back, slide. Return prev. For a cycle I’ll mention a node-set first, then Floyd — tortoise one step, hare two. If they meet, there is a loop; if hare hits null, there isn’t. Fast gains one node per iteration so it cannot hop over slow. Entry node: reset one pointer to head and walk together.”

## Common mistakes

- Reverse: not saving `next`; returning `curr` (always null).
- Cycle: storing values in the set; `fast.next.next` without null checks.
- Claiming Floyd without the “gap −1” justification.
- Mutating the list to detect a cycle (destroys the input).

## Follow-ups

- **Middle of list (876)** — same fast/slow; even length → usually the second middle.
- **Palindrome list (234)** — middle + reverse second half + compare.
- **Duplicate number (287)** — treat the array as a functional graph; Floyd again.

## Sources

- [Linked list — Wikipedia](https://en.wikipedia.org/wiki/Linked_list) — accessed 2026-08-28
- [Cycle detection (Floyd) — Wikipedia](https://en.wikipedia.org/wiki/Cycle_detection) — accessed 2026-08-28
- [Reverse Linked List walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/reverse-linked-list-interview-walkthrough/) — accessed 2026-08-28
- [Linked List Cycle walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/linked-list-cycle-interview-walkthrough/) — accessed 2026-08-28
- [Detect a cycle / cycle entry — techinterview.org](https://www.techinterview.org/post/3233459674/find-out-if-a-linked-list-has-a-cycle/) — accessed 2026-08-28
- Classic LeetCode #206 / #141 / #142 — pointer-rewire + tortoise-hare family
