# Snap engineering track

Sits beside [product-companies.md](product-companies.md) and [tiktok.md](tiktok.md): **camera company + ephemeral / AR / media systems**, not a generic social-feed FAANG slate. Official [Careers](https://careers.snap.com/): Snap Inc. is a **technology / camera** company (Snapchat, SPECS, Snap AR, Bitmoji) — improve how people live and communicate. Official [How We Interview](https://careers.snap.com/how-we-interview) is the process source of truth. Recruiter confirms **editor**, **AI policy**, virtual vs split days, and team.

Typical timeline **3–6 weeks** (guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Media design: [../answers/system-design-video-streaming.md](../answers/system-design-video-streaming.md). Feed-adjacent: [../answers/system-design-news-feed.md](../answers/system-design-news-feed.md).

## Official culture (Kind, Smart, Creative)

Do **not** recite the table. Map **your** stories to **Craft & Value** competencies.

Official values in action ([How We Interview](https://careers.snap.com/how-we-interview) + [Careers](https://careers.snap.com/)):

| Official value | Named behaviors on the page |
| --- | --- |
| **Kind** | Courage, empathy, instills trust |
| **Smart** | Action-oriented, decision quality, strategic mind |
| **Creative** | Manages ambiguity, cultivates innovation, insatiable learning |

Official behavioral frame is **S.A.I.L.** — Situation, Action, Impact, **Learning** — not a canned STAR. Every interview includes **at least one Snap value and one craft** competency. Craft is scored with behavioral questions **or** a skill demo.

Official FAQ (same page): **camera on** for virtual; dress casually; you **do not** need to be a Snapchat user (but know the products); interviews are two-way. **External resources including AI are not allowed unless they explicitly say so.**

“Why Snap?” that only says “stories / Gen Z” fails. Name a real-time media, mobile-constraint, privacy, or AR problem you have lived.

## Official + reported process

Official How We Interview is **competency-based**, not a published round list. Guides (2026 SWE):

| Stage | What they score |
| --- | --- |
| Recruiter (30–45 min) | Motivation, level, stack (Java / Go / C++ / Kotlin) |
| Technical screen (45–60 min) | One–two coding problems + short project dive |
| Onsite coding ×2 | Medium–hard; quality + edges; sometimes applied / mobile |
| System design (mid+) | Real-time, media, ranking, or stories-shaped backend |
| Behavioral / values | Kind / Smart / Creative via S.A.I.L. |
| Sometimes XFN | Product / design partner — collaboration, not a trivia hour |

Official: days may be **grouped or split**. ML reqs add theory + applied + ML system design — see [../roles/data-ml.md](../roles/data-ml.md).

## How this track differs

| vs FAANG | vs TikTok / Instagram-shaped loops |
| --- | --- |
| Official **AI-off** default unless told | TikTok is ByteStyle + OA; Snap is competency + S.A.I.L. |
| Design is **ephemeral media / AR / mobile**, not generic feed | Expiration, client compute, Spectacles / Lens — not only ranking |
| Camera-company product family (AR, SPECS) | “I use Snapchat” is **not** required |

## Coding and design flavor

Live problems look like **graphs, windows, interval / cache design** — correct, then talk mobile or media constraints if they add them. Design: Stories-shaped store (object + TTL + privacy), image/filter pipeline on-device vs server, or ranking for Discover. Related: [../answers/coding-lru-cache.md](../answers/coding-lru-cache.md), [../answers/system-design-file-storage.md](../answers/system-design-file-storage.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why a camera company — not a generic social app.”
2. Graph / window / LRU-style implement; then a mobile or TTL constraint.
3. Design Stories: write path, 24h expiry, friends-only read, fan-out vs pull.
4. On-device filter vs server: battery, latency, privacy.
5. S.A.I.L. story: ambiguity + what you **learned** (the L is scored).

## Prep checklist

- [ ] Read [How We Interview](https://careers.snap.com/how-we-interview) + [Careers](https://careers.snap.com/)
- [ ] Recruiter: AI (default **off**), camera-on, design yes/no, language
- [ ] Practice **S.A.I.L.** out loud (Learning last, specific)
- [ ] 2 narrated mediums (graph + window or design-a-structure)
- [ ] One media / ephemeral design mock
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How We Interview — Snap Inc. Careers](https://careers.snap.com/how-we-interview) — accessed 2026-09-05
- [Snap Inc. Careers](https://careers.snap.com/) — accessed 2026-09-05
- [The Snap Inc. Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/snap-technical-interview-process-2026) — accessed 2026-09-05
- [Snap — techinterview.org](https://www.techinterview.org/companies/snap/) — accessed 2026-09-05
