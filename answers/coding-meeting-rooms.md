# Meeting Rooms II — answer outline

**Prompt:** Given `intervals[i] = [start_i, end_i]`, return the **minimum number of rooms** so no two overlapping meetings share a room. A meeting may start at the exact instant another ends (reuse that room). (LeetCode 253)

This is **max concurrency**, not a merge. Sibling of [coding-merge-intervals.md](coding-merge-intervals.md) (sweep after sort) and the heap family in [../general/coding-patterns.md](../general/coding-patterns.md) (medium #9).

## Probes

- Answer = **peak** number of meetings open at once — not “how many intervals exist.”
- Touching `[1,2][2,3]` → **1** room if half-open / `start >= end` reuses.
- Empty → `0`; one interval → `1`.
- Two equivalent algorithms: **min-heap of end times**, or **two sorted arrays + two pointers**.

## Strong answer skeleton

1. **Clarify:** inclusive ends? `start < end` guaranteed? same-room reuse when `start == previous end`?
2. **Why not merge:** merge collapses overlaps into one interval; here overlaps **need extra rooms**.
3. **Sort by start.** Heap holds **end** times of rooms currently busy. Earliest free room is `heap[0]`.
4. **For each meeting:** if `start >= heap[0]`, pop (reuse). Always push this meeting’s `end`.
5. **Answer:** heap size at the end (equals the max rooms you ever allocated if you only pop on reuse).
6. **Complexity:** O(n log n) time (sort + n heap ops); O(n) space.

## Sketch (min-heap)

```
sort intervals by start
heap = []                    # end times of busy rooms
for start, end in intervals:
  if heap and start >= heap[0]:
    heappop(heap)            # reuse earliest-free room
  heappush(heap, end)
return len(heap)
```

`[[0,30],[5,10],[15,20]]` → 2. Walk: push 30; 5 < 30 → push 10; 15 ≥ 10 → pop 10, push 20; heap `[20,30]`.

Two-pointer twin: sort `starts` and `ends`. Scan starts; if `starts[i] < ends[j]` increment rooms, else `j++` (a room freed). Track `max(rooms)`.

## Mock narration (30 sec)

> “Minimum rooms is peak overlap. I process meetings in start order and keep a min-heap of end times so I always know the room that frees first. If this start is at or after that end, I reuse; otherwise I open a room. Heap size is the answer.”

## Common mistakes

- Merging intervals and returning `len(merged)` — that is coverage count, not concurrency.
- Heap of **starts**, or sorting by end and then assigning greedily without a free-room check.
- Using `>` instead of `>=` and opening a room when one meeting ends as the next starts.
- Returning heap size **without** popping reusable rooms (over-count).
- Meeting Rooms I (252): only “any overlap?” — sort and check `start < previous end`.

## Follow-ups

- **Meeting Rooms (252):** boolean conflict; no heap.
- **Merge Intervals (56):** collapse, do not count rooms — [coding-merge-intervals.md](coding-merge-intervals.md).
- **Min meeting rooms / car pooling / meeting rooms III:** same sweep; III adds delayed reuse + heap of room ids.
- **Employee Free Time:** merge all calendars, then emit gaps.

## Sources

- [Meeting Rooms II — NeetCode](https://neetcode.io/solutions/meeting-rooms-ii) — accessed 2026-09-05
- [Meeting Rooms II — InterviewLoop](https://interviewloop.app/learn/code/heap/meeting-rooms-ii) — accessed 2026-09-05
- [Interval scheduling — Wikipedia](https://en.wikipedia.org/wiki/Interval_scheduling) — accessed 2026-09-05
- Classic LeetCode #252 / #253 — overlap test vs min rooms
