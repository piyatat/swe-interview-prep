# Design Twitter — answer outline

**Prompt:** Implement a tiny Twitter: `postTweet(userId, tweetId)`, `getNewsFeed(userId)` → up to **10** most-recent tweet IDs from the user **and** who they follow (newest first), `follow` / `unfollow`. IDs are ints; each `tweetId` is unique. (LeetCode 355)

This is a **k-way merge of newest-first lists**, not [system-design-news-feed.md](system-design-news-feed.md) (fan-out, ranking, storage). Heap cousin of [coding-merge-k-lists.md](coding-merge-k-lists.md). NeetCode 150 heap / design box.

## Probes

- Does a user see **their own** tweets? Yes — include `userId` in the source set even if they do not follow themselves.
- `follow(u, u)` — ignore. Unfollow a missing edge — no-op.
- Feed size **10** is load-bearing: do not sort every tweet in history if you can merge heads.
- Order is **time**, not tweetId. You need a monotonic clock (or decreasing counter).

## Strong answer skeleton

1. **Clarify:** new users appear on first post/follow; unfollow does not delete tweets; feed can be shorter than 10.
2. **Maps:** `tweets[u] = list of (time, tweetId)` appended newest-last (or newest-first — pick one and stick). `follows[u] = set of followees`.
3. **postTweet:** append `(time++, tweetId)`; O(1).
4. **follow / unfollow:** set add/discard; O(1) average.
5. **getNewsFeed — naive:** concat self + followee lists, sort by time desc, take 10. Correct; O(T log T) if T is all tweets in the union.
6. **getNewsFeed — heap:** k-way merge. Seed a **max-heap** with the newest tweet of self and each followee. Pop; if that user has an older tweet, push it. Stop at 10. Heap size ≤ number of sources (usually ≪ T).
7. **Complexity:** post/follow O(1); feed O(k log k) to seed + O(10 log k) pops if each source list is newest-sorted (`k` = 1 + followees).

## Sketch (heap merge)

```
tweets = defaultdict(list)    # user -> [(time, tweetId), ...] newest last
follows = defaultdict(set)
t = 0

def postTweet(u, id):
  tweets[u].append((t, id)); t += 1

def getNewsFeed(u):
  src = follows[u] | {u}
  h = []  # max-heap of (-time, tweetId, user, idx)
  for v in src:
    if tweets[v]:
      i = len(tweets[v]) - 1
      time, tid = tweets[v][i]
      heappush(h, (-time, tid, v, i))
  out = []
  while h and len(out) < 10:
    neg, tid, v, i = heappop(h)
    out.append(tid)
    if i - 1 >= 0:
      time, tid2 = tweets[v][i - 1]
      heappush(h, (-time, tid2, v, i - 1))
  return out
```

User 1 posts 10, user 2 posts 20, 1 follows 2 → feed `[20, 10]`. Unfollow → `[10]`.

## Mock narration (30 sec)

> “I’ll keep each user’s tweets in time order and followees in a set. The feed is merge-k of those lists: heap of current heads, pop 10. I always include the user themselves. Follow is a set add; I ignore self-follow.”

## Common mistakes

- Forgetting **self** in the feed.
- Sorting tweetIds instead of **time** (IDs are not chronological).
- Pulling whole histories into a list “because n is small” after claiming a heap.
- Storing follows both ways and mixing follower vs followee.
- Mutating a user’s tweet list while iterating it.

## Follow-ups

- **O(1) post, faster feed:** keep a per-user recency heap / cached feed (fan-out on write) — that is the [news-feed](system-design-news-feed.md) discussion.
- **Merge k sorted lists** — [coding-merge-k-lists.md](coding-merge-k-lists.md).
- **Top-K** — [coding-top-k.md](coding-top-k.md).

## Sources

- [Design Twitter — NeetCode](https://neetcode.io/solutions/design-twitter) — accessed 2026-10-28
- [355. Design Twitter — LeetCode](https://leetcode.com/problems/design-twitter/) — accessed 2026-10-28
- [k-way merge — Wikipedia](https://en.wikipedia.org/wiki/K-way_merge_algorithm) — accessed 2026-10-28
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-28
