# Merge Two Sorted Lists — answer outline

**Prompt:** Heads of two singly linked lists `list1` and `list2`, each **already sorted** non-decreasing. Splice the existing nodes into one sorted list; return the new head. (LeetCode 21)

This is the **two-list merge** that [coding-merge-k-lists.md](coding-merge-k-lists.md) uses as a subroutine — dummy head + pick the smaller front, not [coding-linked-list.md](coding-linked-list.md) (reverse / Floyd). Named as a phone-screen warm-up in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150; Wikipedia [merge algorithm](https://en.wikipedia.org/wiki/Merge_algorithm): when inputs are linked lists, pointers can be reused so extra space is **O(1)**.

## Probes

- Empty / one-empty: return the other head (`[]` + `[1,2]` → `[1,2]`). Both empty → `None`.
- **Splice nodes**, do not allocate a value-copy list (unless they say you may).
- Duplicates stay; `<=` vs `<` only changes stability of equal keys (either is fine if you are consistent).
- Sorted **non-decreasing** is given — do not re-sort.
- Recursive vs iterative: both O(n+m) time; recursive uses O(n+m) stack — interview default is **iterative dummy**.

## Strong answer skeleton — dummy + tail

1. **Clarify:** singly; reuse nodes; stable-enough on ties; empty lists.
2. `dummy = ListNode(0)`, `tail = dummy`.
3. While **both** heads are non-null: attach the smaller node to `tail.next`, advance **that** list and `tail`.
4. Attach the leftover: `tail.next = list1 or list2` (one of them is null).
5. Return **`dummy.next`** — never `dummy`.
6. **Complexity:** O(n+m) time, O(1) extra (iterative). Wikipedia: leftover walk is just linking the remaining chain, not an element-wise copy.

Collecting values into an array, sorting, and rebuilding is the brute they want you to reject (loses the “already sorted” gift; extra memory).

## Sketch (iterative)

```
dummy = ListNode(0)
tail = dummy
while list1 and list2:
  if list1.val <= list2.val:
    tail.next = list1
    list1 = list1.next
  else:
    tail.next = list2
    list2 = list2.next
  tail = tail.next
tail.next = list1 if list1 else list2
return dummy.next
```

`[1,2,4]` + `[1,3,5]` → `[1,1,2,3,4,5]`. Dummy avoids a special-case first attachment.

## Recursive one-liner shape

```
if not list1: return list2
if not list2: return list1
if list1.val <= list2.val:
  list1.next = merge(list1.next, list2); return list1
list2.next = merge(list1, list2.next); return list2
```

Say the stack. Prefer iterative unless they ask for the recursive form.

## Mock narration (30 sec)

> “Both lists are already sorted, so the next node is always the smaller head. I keep a dummy and a tail so the first attach is not a special case. While both lists have nodes I link the smaller and slide that pointer. Then I hang the remaining chain on tail and return dummy.next. Linear, constant extra space.”

## Common mistakes

- Forgetting the leftover attach — result truncates when one list ends first.
- Returning `dummy` (leading 0) or losing the head by moving `dummy` itself.
- Advancing `tail` but not the chosen list (or the reverse) — infinite loop or skip.
- Allocating new nodes for every value when they asked to splice.
- Using `while list1 or list2` and then dereferencing a null head.

## Follow-ups

- **Merge k lists (23):** heap or pairwise merge — [coding-merge-k-lists.md](coding-merge-k-lists.md).
- **Merge sorted arrays (88):** write from the **back** so you do not overwrite.
- **Sort list (148):** split + this merge (merge sort on a list).
- **In-place array merge:** different problem; lists get O(1) extra “for free.”

## Sources

- [Merge Two Sorted Lists — NeetCode](https://neetcode.io/solutions/merge-two-sorted-lists) — accessed 2026-09-23
- [Merge Two Sorted Lists — LeetCode 21](https://leetcode.com/problems/merge-two-sorted-lists/) — accessed 2026-09-23
- [Merge algorithm — Wikipedia](https://en.wikipedia.org/wiki/Merge_algorithm) — accessed 2026-09-23
- [Linked list — Wikipedia](https://en.wikipedia.org/wiki/Linked_list) — accessed 2026-09-23
- [Merge Two Sorted Lists walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/merge-two-sorted-lists-interview-walkthrough/) — accessed 2026-09-23
