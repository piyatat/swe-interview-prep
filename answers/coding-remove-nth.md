# Remove Nth Node From End of List — answer outline

**Prompt:** Given `head` and integer `n`, remove the **n-th node from the end** and return the (possibly new) head. (LeetCode 19)

Two-pass is fine to say first: count length `L`, delete index `L-n`. The follow-up is **one pass**: a dummy + two pointers with a gap of `n`. Sibling of [coding-linked-list.md](coding-linked-list.md) (rewire, do not copy) and [coding-merge-two-lists.md](coding-merge-two-lists.md) (dummy head). Wikipedia [Linked list](https://en.wikipedia.org/wiki/Linked_list). NeetCode 150 linked-list box.

## Probes

- `n` is in `1..len` on the usual statement — still handle **delete head**.
- One node, `n = 1` → empty list.
- You need the **predecessor** to delete; a dummy makes head-delete the same as mid-delete.
- One pass: after `fast` is `n` ahead of `slow` (both from dummy), walk until `fast.next` is null; `slow.next` is the victim.
- Do not leak / keep a pointer to the removed node unless they ask.

## Strong answer skeleton — dummy + gap

1. **Clarify:** singly; `n` valid; return new head; one pass preferred.
2. **Two-pass (say first):** count `L`; walk `L-n-1` from head; splice. Head case is `L-n == 0`.
3. **One pass:** `dummy.next = head`; `fast = slow = dummy`.
4. Advance `fast` by `n` steps. Then `while fast.next`: move both.
5. `slow.next = slow.next.next`. Return `dummy.next`.
6. **Complexity:** O(n) time, O(1) space.

## Sketch

```
dummy = ListNode(0, head)
fast = slow = dummy
for _ in range(n):
  fast = fast.next          # n valid ⇒ fast is never None here

while fast.next:
  slow, fast = slow.next, fast.next

slow.next = slow.next.next
return dummy.next
```

`[1,2,3,4,5], n=2` → delete `4`. `[1], n=1` → `[]`. `[1,2], n=2` → `[2]` (head).

If you advance `fast` by `n+1` from dummy, the stop condition is `fast is None` instead of `fast.next is None` — pick **one** convention and stick to it.

## Mock narration (30 sec)

> “I don’t know the length until I hit the tail, but I still need the node *before* the victim. A dummy absorbs the head-delete case. I walk a leader n steps ahead, then move both until the leader is on the last node. The trailer’s next is the n-th from the end.”

## Common mistakes

- No dummy — off-by-one or crash when `n == length`.
- Advancing `n` vs `n+1` and using the wrong stop (`fast` vs `fast.next`).
- Starting `fast` at `head` and `slow` at dummy without adjusting the gap.
- Two-pass but walking `L-n` instead of `L-n-1`, so you land on the victim and cannot splice.
- Assuming `n` is 1-based from the front.

## Follow-ups

- **Remove n-th from front:** walk `n-1` with a dummy; same splice.
- **Remove every n-th (Josephus):** different loop; do not reuse the gap blindly.
- **Doubly linked / indexable:** array of nodes is allowed if they drop O(1) space.
- **k from end in a stream:** need a window of k+1; same idea.

## Sources

- [Remove Nth Node From End of List — NeetCode](https://neetcode.io/solutions/remove-nth-node-from-end-of-list) — accessed 2026-10-04
- [19. Remove Nth Node From End of List — LeetCode Wiki](https://leetcode.doocs.org/en/lc/19/) — accessed 2026-10-04
- [Remove Nth Node From End of List — LeetCode 19](https://leetcode.com/problems/remove-nth-node-from-end-of-list/) — accessed 2026-10-04
- [Linked list — Wikipedia](https://en.wikipedia.org/wiki/Linked_list) — accessed 2026-10-04
