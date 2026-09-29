# Add Two Numbers — answer outline

**Prompt:** Two non-empty singly linked lists `l1` and `l2` store non-negative integers **in reverse order**, one digit per node (no leading zeros except `0` itself). Return the sum as a linked list in the same digit order. (LeetCode 2)

This is **schoolbook addition with a carry**, not [coding-linked-list.md](coding-linked-list.md) (reverse / Floyd) and not [coding-merge-two-lists.md](coding-merge-two-lists.md) (ordered splice). Dummy + walk while **either list or carry** remains. NeetCode 150 linked-list box.

## Probes

- Unequal lengths: missing digit is `0`, do not pad a new list first.
- Final carry: `5 + 5` → `[0,1]`. Stopping when both lists are null **drops** that `1`.
- Single-node zeros: `[0] + [0]` → `[0]`.
- Digits are `0–9`; they will reject concatenating into a big integer (overflow + “not the point”).
- Follow-up **Add Two Numbers II (445)** stores **most-significant digit first** — reverse both, or two stacks; do not start there.

## Strong answer skeleton — dummy + carry

1. **Clarify:** reverse-order digits; share no nodes with the inputs; leading zeros only for value `0`.
2. `dummy = ListNode(0)`, `tail = dummy`, `carry = 0`.
3. While `l1` or `l2` or `carry`:
   - `s = carry + (l1.val if l1 else 0) + (l2.val if l2 else 0)`
   - `tail.next = ListNode(s % 10)`; `carry = s // 10`; advance `tail`
   - Advance each input pointer if it exists
4. Return **`dummy.next`**.
5. **Complexity:** Θ(max(m, n)) time; O(1) extra besides the output list. Recursion is the same math with O(max(m, n)) stack — interview default is iterative.

## Sketch (iterative)

```
dummy = ListNode(0)
tail, carry = dummy, 0
while l1 or l2 or carry:
  v1 = l1.val if l1 else 0
  v2 = l2.val if l2 else 0
  s = v1 + v2 + carry
  tail.next = ListNode(s % 10)
  carry = s // 10
  tail = tail.next
  l1 = l1.next if l1 else None
  l2 = l2.next if l2 else None
return dummy.next
```

`[2,4,3] + [5,6,4]` (342 + 465) → `[7,0,8]`. `[9,9] + [1]` → `[0,0,1]`.

## Mock narration (30 sec)

> “Digits are already least-significant first, so I add like paper: digit plus digit plus carry, write `s % 10`, keep `s // 10`. The loop continues while either list or a leftover carry is alive. Dummy head so I never special-case the first node.”

## Common mistakes

- `while l1 and l2` then a messy leftover block that **forgets carry**.
- Writing `s / 10` as float; use integer `//`.
- Mutating `l1` in place when they asked for a new list (ask; default is new nodes).
- Assuming equal length.
- For 445: adding from the heads without reversing/stacking (MSD first).

## Follow-ups

- **Add Two Numbers II (445):** reverse both → this problem → reverse the result; or push digits onto stacks.
- **Plus one on a list / array:** same carry walk from the tail.
- **Merge two lists (21):** ordered pointers, no carry — [coding-merge-two-lists.md](coding-merge-two-lists.md).

## Sources

- [Add Two Numbers — NeetCode](https://neetcode.io/solutions/add-two-numbers) — accessed 2026-09-29
- [Add Two Numbers — LeetCode 2](https://leetcode.com/problems/add-two-numbers/) — accessed 2026-09-29
- [Linked list — Wikipedia](https://en.wikipedia.org/wiki/Linked_list) — accessed 2026-09-29
- [Addition — Wikipedia](https://en.wikipedia.org/wiki/Addition) — accessed 2026-09-29
