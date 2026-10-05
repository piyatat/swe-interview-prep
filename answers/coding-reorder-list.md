# Reorder List — answer outline

**Prompt:** Given the head of a singly linked list `L0 → L1 → … → Ln`, reorder **in place** to `L0 → Ln → L1 → Ln-1 → …`. Do not change node **values**. (LeetCode 143)

Sibling of [coding-linked-list.md](coding-linked-list.md) (reverse) and [coding-palindrome-list.md](coding-palindrome-list.md) (mid + reverse). Wikipedia [Linked list](https://en.wikipedia.org/wiki/Linked_list). NeetCode 150 / Blind 75 linked-list box.

## Probes

- Return type is **void** — mutate `head`; empty / one node is already done.
- Array of pointers is O(n) space; they usually want **O(1)** extra.
- Three linear passes: **mid → cut → reverse second half → weave**.
- Even vs odd length: second half is shorter or equal; weave until the reversed half is exhausted.
- Do not leave a cycle: **cut** `slow.next` before reverse, and stop the weave correctly.

## Strong answer skeleton — mid + reverse + merge

1. **Clarify:** singly; in-place; n ≥ 1 on LeetCode; even and odd examples.
2. **O(n) space (say first):** copy nodes to an array; two-pointer weave into a new chain. Fine if they allow extra space.
3. **O(1):** slow/fast to the end of the **first** half (`while fast.next and fast.next.next`).
4. `second = slow.next`; `slow.next = None` (split). Reverse `second`.
5. Weave: while `second`: save both nexts; `first.next = second`; `second.next = first_next`; advance.
6. **Complexity:** O(n) time, O(1) extra.

## Sketch

```
# split: slow ends on last node of first half
slow = fast = head
while fast.next and fast.next.next:
  slow, fast = slow.next, fast.next.next

second, slow.next = slow.next, None

prev, cur = None, second
while cur:
  cur.next, prev, cur = prev, cur, cur.next
second = prev

# weave first (longer) with reversed second
a, b = head, second
while b:
  a.next, b.next, a, b = b, a.next, a.next, b.next
```

`[1,2,3,4]` → `1 → 4 → 2 → 3`. `[1,2,3,4,5]` → `1 → 5 → 2 → 4 → 3`.

If you walk slow/fast with `while fast and fast.next`, slow can land on the **first** node of the second half — then reverse includes a node that should stay in the first half. Pick **one** mid convention and split on the correct side.

## Mock narration (30 sec)

> “I cannot index the tail without extra storage, so I find the midpoint, detach the second half, reverse it, and merge alternately. Cutting before the reverse is what keeps the list acyclic.”

## Common mistakes

- Forgetting to null the mid link → cycle when you weave.
- Reversing the **wrong** half (odd-length off-by-one).
- Weaving until `a` is null — second half is already exhausted first on even length if you split well; still save **both** next pointers.
- Copying values into nodes (violates the statement).

## Follow-ups

- **Palindrome list:** same mid+reverse; compare instead of weave.
- **Reverse nodes in k-group:** reverse by windows, not half.
- **O(n) array:** acceptable if they drop the space constraint; say it.

## Sources

- [Reorder List — NeetCode](https://neetcode.io/solutions/reorder-list) — accessed 2026-10-05
- [143. Reorder List — LeetCode Wiki](https://leetcode.doocs.org/en/lc/143/) — accessed 2026-10-05
- [Reorder List — LeetCode 143](https://leetcode.com/problems/reorder-list/) — accessed 2026-10-05
- [Linked list — Wikipedia](https://en.wikipedia.org/wiki/Linked_list) — accessed 2026-10-05
