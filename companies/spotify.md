# Spotify engineering track

Sits beside [product-companies.md](product-companies.md) and [../roles/data-ml.md](../roles/data-ml.md): **audio platform + recommendations + an incident-style case study**, not a generic FAANG slate. Official [Life at Spotify](https://lifeatspotify.com/): join the band; Engineering builds for **500M+** listeners with **trust and aligned autonomy** (squads own missions, share code and failures). Recruiter confirms **CoderPad vs Mural**, **AI policy**, and whether the **case study** is in the loop.

Typical timeline **2–5 weeks** (guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Incident hour: [../general/debugging-rounds.md](../general/debugging-rounds.md). Recs design: [../answers/system-design-recommendation.md](../answers/system-design-recommendation.md).

## Official culture (Bassline)

Do **not** recite a values table. Map **your** stories.

Official [careers](https://lifeatspotify.com/) **Bassline** (three values):

| Official value | What it means on the page |
| --- | --- |
| **One Team** | Break silos, share context, win together |
| **Human Judgment** | Thoughtful risk; learn from mistakes; trust people to decide |
| **Make It Happen** | Bias to action; create conditions; deliver results that matter |

Official Engineering: squads + **aligned autonomy**; Data names the **recommendation engine** as a core asset. 2026 eng-blog themes (agents, evals, incidents) are useful color — not a script. Older “Band Manifesto” five-value lists still appear in some guides; prefer the **live Bassline** unless the recruiter names the older set.

“Why Spotify?” that only says “I love music” fails. Name a real audio / personalization / client-playback problem you have lived.

## Official + reported process

Official careers do **not** publish a fixed SWE stage list. Guides (2026):

| Stage | What they score |
| --- | --- |
| Recruiter (30–45 min) | Motivation, level, genuine product knowledge |
| Technical screen (45–60 min, CoderPad) | Clean medium + narration; structure over speed |
| Onsite coding | Same bar; sometimes domain-framed (playlist, events, retries) |
| System design (mid+) | Streaming, recs, CDN / playback, billing, real-time aggregates |
| **Case study** | Simulated **production incident** — hypothesis, metrics, rollback |
| Values / Bassline | Collaboration, judgment, how you ship with a squad |

Guides: a clean, tested **medium** beats a messy hard. The case study is the surprise gate — interviewer reveals dashboards / logs as you ask; they score **investigation**, not a coding race.

## How this track differs

| vs FAANG | vs Netflix / Datadog |
| --- | --- |
| Named **incident case study** in the loop | Netflix is keeper / culture-memo; Datadog is TSDB / on-call |
| Design is **audio + recs + clients**, not “design Twitter” | Playback, catalog, personalization, creator ingest |
| Official culture is **squad autonomy + Bassline** | Ask AI policy — jobs mention AI-assisted workflows; loop rules vary |

## Coding and design flavor

Live problems look like **dedupe a playlist, aggregate events, retry/backoff** — correct, named, tested. Design: home / Discover funnel ([../answers/system-design-recommendation.md](../answers/system-design-recommendation.md)), playback + CDN ([../answers/system-design-video-streaming.md](../answers/system-design-video-streaming.md)), or ingest / fan-out. Official Data/ML pages exist so you can talk **candidate generation vs ranking** without inventing a paper.

## Sample prompts (shapes, not leaked puzzles)

1. “Why Spotify — a listening, recs, or playback problem you actually hit.”
2. Implement playlist dedupe / session aggregator; then “10× events.”
3. Design Discover Weekly–shaped recs: cold start, latency budget, eval.
4. Case: buffering spike in one region — what you pull first, what you roll back.
5. Project deep-dive: a call you owned, a metric, what you would change.

## Prep checklist

- [ ] Read [Life at Spotify](https://lifeatspotify.com/) + [Engineering](https://lifeatspotify.com/find-your-team/job-categories/engineering) + one [eng-blog](https://engineering.atspotify.com/) post
- [ ] Recruiter: AI policy, case-study yes/no, CoderPad language, team match
- [ ] One **narrated** medium with tests
- [ ] One recs or streaming design mock
- [ ] One incident STAR ([../answers/behavioral-failure.md](../answers/behavioral-failure.md)) said as a **debug loop**
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Join the Band — Life at Spotify](https://lifeatspotify.com/) — accessed 2026-09-05
- [Engineering — Life at Spotify](https://lifeatspotify.com/find-your-team/job-categories/engineering) — accessed 2026-09-05
- [Spotify Engineering blog](https://engineering.atspotify.com/) — accessed 2026-09-05
- [Spotify technical interview process 2026 — TechScreen](https://techscreen.app/articles/spotify-technical-interview-process-2026) — accessed 2026-09-05
- [Spotify Interview Prep 2026 — Jobs by Culture](https://jobsbyculture.com/blog/spotify-interview-prep-2026) — accessed 2026-09-05
- [What is the Spotify interview process like — Design Gurus](https://www.designgurus.io/answers/detail/what-is-the-spotify-interview-process-like-round-by-round) — accessed 2026-09-05
