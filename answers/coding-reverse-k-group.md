# Reverse Nodes in k-Group — answer outline

**Prompt:** Given `head` and `k`, reverse the list **k nodes at a time**. If a trailing group has fewer than `k` nodes, **leave it**. You may change `next` pointers only — not node values. (LeetCode 25; NeetCode 150 hard.) Follow-up: **O(1)** extra memory.

This is the grouped form of [coding-linked-list.md](coding-linked-list.md) (reverse whole list) and [coding-reorder-list.md](coding-reorder-list.md) (mid + reverse + weave). Probe a full group **before** you reverse it.

## Probes

- `k == 1` or `n < k` → identity.
- Tail shorter than `k` stays in **original** order — do not reverse a leftover 2 when `k == 3`.
- Recursion is O(n/k) stack; they usually want iterative O(1) space.
- Dummy node so the first group has a stable predecessor.

## Strong answer skeleton

1. **Clarify:** singly linked; `1 ≤ k ≤ n`; values stay on nodes.
2. Dummy → `head`. `pre` = dummy (node **before** the group).
3. **Probe:** from `pre`, walk `k` steps. If you hit null, return `dummy.next` (leftover stays).
4. Let `start = pre.next`, `end` = the k-th node, `nxt = end.next`. Cut `end.next = None`.
5. Reverse `[start … end]` with the usual three-pointer flip. New head is old `end`; old `start` is the new tail.
6. `pre.next =` new head; `start.next = nxt`; `pre = start`. Repeat.
7. **Complexity:** each node reversed at most once → O(n) time, O(1) extra space.

Helper `reverse(head)` that returns the new head is fine if you isolate the group first.

## Sketch

```
def reverseKGroup(head, k):
  dummy = ListNode(0, head)
  pre = dummy
  while True:
    cur = pre
    for _ in range(k):
      cur = cur.next
      if not cur:
        return dummy.next
    start, nxt = pre.next, cur.next
    cur.next = None
    pre.next = reverse(start)   # start is now tail
    start.next = nxt
    pre = start
```

`[1,2,3,4,5], k=2` → `[2,1,4,3,5]`. `k=3` → `[3,2,1,4,5]`.

## Mock narration (30 sec)

> “I only reverse a group after I can see k nodes ahead. Dummy holds the first link. I detach the k-run, reverse it in place, splice it back, and slide the predecessor to the old head — now the tail. Leftover shorter than k stays.”

## Common mistakes

- Reversing the leftover tail.
- Losing `nxt` (the node after the group) or forgetting to reconnect the old head.
- Counting `k` from `pre` inclusive (off-by-one; group is too short).
- Recursing without stating the stack.
- Swapping values instead of pointers (violates the prompt).

## Follow-ups

- **Reverse Linked List (206):** one group, `k = n` — [coding-linked-list.md](coding-linked-list.md).
- **Swap Nodes in Pairs (24):** `k = 2` special case.
- **Rotate List / Reverse just [L, R]:** same splice, one group.
- Recursive “reverse k, recurse rest, attach” — mention, then do iterative.

## Sources

- [Reverse Nodes in k-Group — NeetCode](https://neetcode.io/solutions/reverse-nodes-in-k-group) — accessed 2026-10-19
- [25. Reverse Nodes in k-Group — LeetCode Wiki](https://leetcode.doocs.org/en/lc/25/) — accessed 2026-10-19
- [Reverse Nodes in k-Group — LeetCode 25](https://leetcode.com/problems/reverse-nodes-in-k-group/) — accessed 2026-10-19
- [Linked list — Wikipedia](https://en.wikipedia.org/wiki/Linked_list) — accessed 2026-10-19
