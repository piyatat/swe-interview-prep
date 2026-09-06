# Reddit engineering track

Sits beside [product-companies.md](product-companies.md) and [snap.md](snap.md): **community + ranking + threaded comments + moderation**, not a generic social-feed FAANG slate. Official [Careers](https://www.redditinc.com/careers): mission is to **empower communities and make their knowledge accessible**. Recruiter confirms **CoderPad language**, **AI policy**, hub vs remote, and the **level the loop is graded at**.

Typical timeline **3–5 weeks** (guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Feed-adjacent design: [../answers/system-design-news-feed.md](../answers/system-design-news-feed.md). Ranking flavor: [../answers/system-design-recommendation.md](../answers/system-design-recommendation.md).

## Official culture (careers + values)

Do **not** recite both tables. Map **your** stories to the set the recruiter names.

Official [Careers](https://www.redditinc.com/careers) employee values:

| Official value | What the page scores |
| --- | --- |
| **Reddit's mission first** | Shared north star over local initiative theater |
| **Make something people love** | User love, not activity |
| **Evolve** | Improve and learn on purpose |
| **Add value** | Hard work ≠ value; evaluate the work |
| **Default open** | Ideas and feedback flow; no hoarding context |

Official [Values](https://www.redditinc.com/values) (platform / user-facing): **Remember the human**, **Start with community**, **Keep Reddit real**, **Privacy is a right**, **Believe in the good**. Guides sometimes invent a 2026 six-value list — prefer these two **live** pages.

“Why Reddit?” that only says “I use the site” fails. Name a real **community, ranking, safety, or privacy** problem you have lived.

## Official + reported process

Official careers do **not** publish a fixed SWE stage list. Guides (2026):

| Stage | What they score |
| --- | --- |
| Recruiter (30 min) | Motivation, **level**, hub / remote, why Reddit |
| Technical screen (60 min, CoderPad) | One clean medium + follow-ups (stream, memory, 10×) |
| Onsite coding ×2 | Medium–hard; sometimes a small **comment-tree / vote** API |
| System design (mid+) | Ranking, comment tree, voting, or moderation |
| Behavioral / values | Careers values + human / community stories |
| Sometimes XFN | PM / design / ML partner — collaboration, not trivia |

Guides: the screen is a **LeetCode-medium filter**; signal lives in narration and extensions. Design is **disproportionately Reddit-shaped** (trees, votes, abuse) vs “design Twitter.” Ask which IC level the loop is calibrated to **before** technical rounds.

## How this track differs

| vs FAANG | vs Snap / TikTok |
| --- | --- |
| Practical judgment + **community / ranking** design | Snap is S.A.I.L. + ephemeral media; TikTok is ByteStyle + OA |
| Comment **trees** and **vote / mod** constraints | Not only home-feed fan-out |
| Official culture is **mission + default open** | Confirm AI — careers do not publish a loop-wide AI rule |

## Coding and design flavor

Live problems look like **hash / window / heap / graph**, then “now it is a stream.” Sometimes implement a small **comment tree** (add, sort roots, walk children) — API + edges over an unpublished trick. Design: home vs subreddit feed, **fan-out vs pull** for comment pages, vote tallies under abuse, or a moderation queue. Related: [../answers/coding-top-k.md](../answers/coding-top-k.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why a community platform — not a generic social app.”
2. Medium + “input is a stream / does not fit in memory.”
3. Design comment threads: write path, sort, collapse, hot children.
4. Votes: idempotent cast, late arrivals, brigading.
5. Values: a time you **defaulted open** or remembered the human on a safety call.

## Prep checklist

- [ ] Read [Careers](https://www.redditinc.com/careers) + [Values](https://www.redditinc.com/values)
- [ ] Recruiter: **graded level**, AI, design yes/no, language
- [ ] 2 narrated mediums with a 10× / stream follow-up
- [ ] One comment-tree or ranking design mock
- [ ] One community / privacy STAR (not “I browse r/…” )
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Reddit Inc](https://www.redditinc.com/careers) — accessed 2026-09-06
- [Values — Reddit Inc](https://www.redditinc.com/values) — accessed 2026-09-06
- [The Reddit Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/reddit-technical-interview-process-2026) — accessed 2026-09-06
- [What Reddit’s engineering interview actually tests — techinterview.org](https://www.techinterview.org/post/3233476855/reddit-engineering-interview/) — accessed 2026-09-06
- [How to Prepare for a Reddit Interview in 2026 — Jobs by Culture](https://jobsbyculture.com/blog/reddit-interview-prep-2026) — accessed 2026-09-06
