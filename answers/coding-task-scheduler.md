# Task Scheduler — answer outline

**Prompt:** CPU tasks labeled `A`–`Z`, and cooldown `n`. Each interval runs **one** task or **idle**. The same label needs at least `n` intervals between runs. Return the **minimum** intervals to finish every task. (LeetCode 621)

This is **greedy cooldown**, not a calendar. Sibling of [coding-meeting-rooms.md](coding-meeting-rooms.md) (heap of end times) and [coding-top-k.md](coding-top-k.md) (frequency heap). Named with the heap family in [../general/coding-patterns.md](../general/coding-patterns.md). NeetCode 150; Wikipedia [greedy algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm).

## Probes

- Tasks may be reordered. Idle is allowed and often **required**.
- `n = 0` → answer is `len(tasks)` (no gaps).
- One label only → `(maxf - 1) * (n + 1) + 1`.
- Many distinct labels can **fill** the gaps; then answer is just `len(tasks)` (no idle).
- Two equivalent pitches: **simulate** with a max-heap + cooldown queue, or the **idle-slot formula**.

## Strong answer skeleton

1. **Clarify:** labels are A–Z only? `n` can be 0? return length, not the schedule?
2. **Count** frequencies (`26` buckets is enough).
3. **Formula (usual optimal):** let `maxf` be the highest count, `maxCount` how many labels share `maxf`.
   - Frame: `(maxf - 1)` full cycles of length `n + 1`, then `maxCount` tasks on the last row.
   - `frames = (maxf - 1) * (n + 1) + maxCount`
   - Answer: `max(len(tasks), frames)` — leftover tasks fill idle slots; you never finish before you have executed every task.
4. **Simulation (if they want the schedule or a walk-through):** max-heap of remaining counts; queue of `(readyTime, count)`; tick time; push back when cooldown ends.
5. **Complexity:** count is O(T); heap simulate is O(T log 26). Formula is O(T).

## Sketch (formula)

```
count[26] from tasks
maxf = max(count)
maxCount = how many labels equal maxf
frames = (maxf - 1) * (n + 1) + maxCount
return max(len(tasks), frames)
```

`tasks = [A,A,A,B,B,B], n = 2` → `A B _ A B _ A B` → 8. `maxf=3`, `maxCount=2`, frames `(3-1)*3+2=8`.

Heap twin: always pick the currently most frequent **ready** task; if none are ready, idle.

## Mock narration (30 sec)

> “Minimum time is dominated by the most frequent task: it needs `n` gaps between its copies. I lay down `(maxf-1)` frames of size `n+1`, put the other max-frequency labels on the last row, then take max with `len(tasks)` because extra tasks fill idle slots and you still have to run everything.”

## Common mistakes

- Returning `frames` without `max(len(tasks), …)` — under-count when the cooldown is small and tasks fill every slot.
- Building the actual string when they only asked for the length.
- Off-by-one on cycle length (`n` vs `n+1`).
- Heap that re-inserts immediately (violates cooldown) or that idles forever when a task is sitting in the wait queue.
- Confusing this with **Task Scheduler II** (per-task next-available index, different prompt).

## Follow-ups

- **Emit the schedule** — heap + queue; the formula does not name *which* idle goes where.
- **Different cooldown per task** — formula breaks; simulate.
- **Meeting Rooms II** — peak concurrency, not cooldown gaps — [coding-meeting-rooms.md](coding-meeting-rooms.md).
- **Rearrange String k Distance Apart** — same greedy “space the frequent letters.”

## Sources

- [Task Scheduler — NeetCode](https://neetcode.io/solutions/task-scheduler) — accessed 2026-09-24
- [Task Scheduler — LeetCode 621](https://leetcode.com/problems/task-scheduler/) — accessed 2026-09-24
- [Greedy algorithm — Wikipedia](https://en.wikipedia.org/wiki/Greedy_algorithm) — accessed 2026-09-24
- Classic LeetCode #621 — frequency greedy / idle frames
