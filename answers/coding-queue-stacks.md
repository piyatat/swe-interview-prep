# Implement Queue using Stacks — answer outline

**Prompt:** Implement a FIFO queue with **only stack operations** (`push`/`pop`/`peek`/`empty` on a LIFO). Support `push`, `pop`, `peek`, `empty`. Follow-up: **amortized O(1)** per op. (LeetCode 232)

Wikipedia [stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) is LIFO; [queue](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)) is FIFO. One stack cannot expose both ends. Cousin of [coding-min-stack.md](coding-min-stack.md) (aux structure, different contract). Grind 75 / NeetCode stack box.

## Probes

- Only stack ops — no `list.insert(0)` / `deque.popleft()` disguised as a stack.
- `pop` / `peek` are valid (they say so) — still mention empty.
- `empty()` must look at **both** stacks in the amortized design.
- Follow-up: worst-case O(n) on one `pop` is OK if **n ops are O(n)** total.

## Strong answer skeleton — inbox / outbox

1. **Clarify:** FIFO; stacks only; amortized vs worst-case O(1).
2. **Naive:** on every `pop`, dump `in` → `out`, pop, dump **back**. Correct, every `pop` is O(n).
3. **Keep the reversal:** `in` = enqueue; `out` = dequeue order. When `out` is empty, pour **all** of `in` into `out` once. Do **not** pour back.
4. Each element moves **in → out at most once**, then is popped. Amortized O(1); space O(n).

Wikipedia [amortized analysis](https://en.wikipedia.org/wiki/Amortized_analysis) uses this exact two-list queue as the textbook example (charge the reverse to the earlier enqueues).

## Sketch (amortized)

```
in, out = [], []          # both used as stacks (append / pop)

push(x):
  in.append(x)

_move():
  if not out:
    while in:
      out.append(in.pop())

pop():
  _move(); return out.pop()

peek():
  _move(); return out[-1]

empty():
  return not in and not out
```

`push(1), push(2), peek → 1, pop → 1, empty → false`. After the first `_move`, `out = [2, 1]` with `1` on top; later `push(3)` stays on `in` until `out` drains.

## Mock narration (30 sec)

> “A stack reverses; a second stack reverses again, which is FIFO. I enqueue on `in` and dequeue from `out`. I only pour `in` into `out` when `out` is empty, so each value moves at most once — amortized O(1).”

## Common mistakes

- Pouring **back** after every pop (the O(n) version) and calling it amortized.
- `empty()` checking only `in` while `out` still holds the front.
- Using `insert(0)` / `pop(0)` — that is a deque, not a stack.
- Peek that `pop`s and forgets to push back (or that skips `_move`).
- Transferring one element at a time from `in` without emptying `in` — order breaks on the next pour.

## Follow-ups

- **Stack using queues (225):** two queues, or one queue + rotations — different cost model.
- **Worst-case O(1):** Okasaki / Hood–Melville real-time queue (lazy reverse). Name it; do not implement in 20 minutes.
- **Min-queue:** not this aux-stack trick — need a deque of candidates ([coding-sliding-window-max.md](coding-sliding-window-max.md)).
- **Thread safety:** two stacks still need a lock or a concurrent queue; pouring is a critical section.

## Sources

- [232. Implement Queue using Stacks — LeetCode](https://leetcode.com/problems/implement-queue-using-stacks/) — accessed 2026-11-22
- [232. Implement Queue using Stacks — LeetCode Wiki (doocs)](https://leetcode.doocs.org/en/lc/232/) — accessed 2026-11-22
- [Implement Queue using Stacks — NeetCode](https://neetcode.io/solutions/implement-queue-using-stacks) — accessed 2026-11-22
- [Stack (abstract data type) — Wikipedia](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) — accessed 2026-11-22
- [Queue (abstract data type) — Wikipedia](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)) — accessed 2026-11-22
- [Amortized analysis — Wikipedia](https://en.wikipedia.org/wiki/Amortized_analysis) — accessed 2026-11-22
