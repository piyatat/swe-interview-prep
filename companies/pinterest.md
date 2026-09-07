# Pinterest engineering track

Sits beside [product-companies.md](product-companies.md) and [reddit.md](reddit.md): **visual discovery + ranking + shopping**, not a generic social-feed FAANG slate. Official [Life at Pinterest](https://www.pinterestcareers.com/inside-pinterest/): mission is to **bring everyone the inspiration to create a life they love**. Recruiter confirms **PinFlex hub / remote**, **CoderPad language**, **AI policy**, and whether you get a **domain** hour (ML / FE / ads).

Typical timeline **3–5 weeks** (guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Ranking / retrieve+rank: [../answers/system-design-recommendation.md](../answers/system-design-recommendation.md). Feed bones: [../answers/system-design-news-feed.md](../answers/system-design-news-feed.md).

## Official culture (careers values)

Do **not** recite the list. Map **your** stories.

Official [Life at Pinterest](https://www.pinterestcareers.com/inside-pinterest/) five core values (order is intentional; “Put Pinners first” is the oldest):

| Official value | What the page scores |
| --- | --- |
| **Put Pinners first** | Wellbeing and “with them, not just for them” — not vanity metrics |
| **Aim for extraordinary** | Courage, craft, execution bar |
| **Create belonging** | Debate + real-time feedback; include divergent views |
| **Act as one** | Kill silos; rally after the decision |
| **Win or learn** | Smart bets; harvest the lesson either way |

2026 prep guides still say **“PinFundamentals”** and sometimes a four-item list (owner / win-together). Prefer the **live careers page**. “Why Pinterest?” that only says “I use the app for recipes” fails. Name a real **ranking, visual search, shopping, or trust** problem you have lived.

Official [Labs — Recommender Systems](https://labs.pinterest.com/research-and-innovation/recommender-systems): lifelong **user sequences**, **unified multi-task** models, **budget-aware** infra. Eng blog (PinSage / visual embeddings): Pins + boards are a **bipartite graph**; visual search is embeddings + ANN, not keyword-only.

## Official + reported process

Official careers do **not** publish a fixed SWE stage list. Guides (2026):

| Stage | What they score |
| --- | --- |
| Recruiter (30–45 min) | Why Pinterest, **level**, PinFlex location |
| Screen (45–60 min, CoderPad) | One clean medium; early finish → second mini |
| New-grad / intern variant | Async **CodeSignal** instead of (or before) live |
| Onsite coding ×2 | Medium–hard; graphs / hash / window; **stream / 100×** follow-up |
| System design (mid+) | Home feed rank, **visual search / Lens**, related Pins, ads auction |
| Behavioral / values | Five official values (guides may still say PinFundamentals) |
| Optional domain | ML rank, React/UI, or ads marketplace |

Guides: the screen is a **LeetCode-medium filter**; signal is narration, helpers, and extensions. Design is **disproportionately ranking / visual** vs “design Twitter.” Even generalist SWE loops expect you to talk **retrieve → rank → diversity / policy**, not only CRUD + cache.

## How this track differs

| vs FAANG | vs Reddit / Snap |
| --- | --- |
| Design is **visual graph + rank**, not only fan-out | Reddit is comment trees / mod; Snap is ephemeral / AR |
| Graph problems show up more (pins, boards, follows) | Not a bug-bash / integration loop (that is Stripe) |
| Official culture is **Pinner-first + win-or-learn** | Confirm AI — careers do not publish a loop-wide rule |

## Coding and design flavor

Live problems look like **BFS/DFS with a twist, hash counts, windows, heaps**, then “input is a stream.” Design: two-stage **candidate gen + rank**, image **embedding + ANN**, cold start, freshness vs relevance, or a **policy / safety** filter after the model. Related: [../answers/coding-number-of-islands.md](../answers/coding-number-of-islands.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why a visual inspiration graph — not a generic social feed.”
2. Medium graph / window; then “does not fit in memory.”
3. Design home feed: retrieve, rank, diversity, mute, ads slot.
4. Design visual search: crop / camera → embedding → ANN → rerank.
5. Values: a time you **put the Pinner first** over a team metric, or **won or learned** from a failed bet.

## Prep checklist

- [ ] Read [Life at Pinterest](https://www.pinterestcareers.com/inside-pinterest/) + [Labs recommenders](https://labs.pinterest.com/research-and-innovation/recommender-systems)
- [ ] Recruiter: **graded level**, PinFlex, AI, design yes/no, domain extra
- [ ] 2 narrated mediums with a 10× / stream follow-up (practice a **graph**)
- [ ] One retrieve+rank or visual-search design mock
- [ ] STAR bank mapped to the **five official** values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Life at Pinterest — Pinterest Careers](https://www.pinterestcareers.com/inside-pinterest/) — accessed 2026-09-07
- [Inspired to evolve: Pinterest’s values reimagined — Pinterest Careers](https://www.pinterestcareers.com/life-at-pinterest-blog/pinterest-life/inspired-to-evolve-pinterest-s-values-reimagined/) — accessed 2026-09-07
- [Recommender Systems — Pinterest Labs](https://labs.pinterest.com/research-and-innovation/recommender-systems) — accessed 2026-09-07
- [The Pinterest Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/pinterest-technical-interview-process-2026) — accessed 2026-09-07
- [Pinterest's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/pinterest-interview-process) — accessed 2026-09-07
