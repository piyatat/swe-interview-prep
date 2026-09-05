# Recommendation system — system design outline

**Prompt:** Design recommendations (YouTube / Netflix / Discover Weekly / TikTok FYP): given a user and context, return a short ranked list from a huge catalog in ~100–200 ms. Named as a 2025–2026 add-on in [../general/system-design.md](../general/system-design.md) and [../roles/data-ml.md](../roles/data-ml.md). Spotify-flavored loops expect this domain — [../companies/spotify.md](../companies/spotify.md).

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Personalized list (home / next-item / similar) | p99 ~100–200 ms end-to-end |
| Implicit feedback (play, skip, like, hide) | Catalog 10^7–10^9; cannot score all items |
| Freshness (hours, not months) | Eventual consistency OK on features |
| Filters: already seen, blocked, policy | Offline + online training; A/B is the real metric |

**Out of v1:** ads auction, full search, creator tools. Wikipedia: recommenders are **collaborative**, **content-based**, or **hybrid**. Interview default: **hybrid funnel**.

Ask: **next-item** (session) vs **home feed** (many slots); optimize **watch time / listen time**, not raw CTR (YouTube 2016 lesson).

## Estimation sketch (example)

- 100M DAU × 20 home opens/day → ~20k recs QPS avg, 10× peak
- Catalog 100M items — a 50 ms ranker at 1 µs/item still cannot touch the corpus
- Funnel: **10^8 → ~10^3 candidates → ~10^2 L2 → ~20 shown**

## High-level components

```
Events (play/skip) → stream → labels + online features
Item tower (offline) → embeddings → ANN index (HNSW / FAISS)
Request → user tower + feature store → retrieve (multi-source)
       → L1 cheap rank → L2 cross-feature rank → re-rank / diversity
       → filter seen / policy → hydrate + log for A/B
```

YouTube RecSys 2016 (Covington et al., Google Research): classic **two-stage IR** — **candidate generation** then **ranking**. Retrieval is coarse and separable (user vector · item vector) so items can be **precomputed and indexed**. Ranking uses richer **user–item cross features** and, in that paper, predicted **watch time**.

## Deep dives

### Candidate generation (recall)

Parallel sources, union ~1k ids:

- **Two-tower / ANN** — user embedding online; item index offline
- **Item-to-item CF** — co-watch / co-listen neighbors (Amazon-style)
- **Trending / popularity** — cold-start users; language / geo slice

Do **not** put cross features in the towers — that breaks ANN.

### Ranking + re-rank (precision)

L1: cheap model (GBDT / small net) on 1k. L2: heavier net on ~100–200 with cross features. Re-rank: diversity, freshness, business rules, “seen” bloom. Feature store must match **train vs serve** (same keys, or you silently train on a different world).

### Cold start + eval

New user: popularity + onboarding + session signals. New item: content embedding until enough interactions. Offline AUC/NDCG is a **gate**, not the ship decision — A/B on the product metric. Position bias: users click slot 1; correct in the ranker (later YouTube multitask work).

## Failure / ops

- ANN stale after a catalog dump → dual-write index, dark query
- Feature store timeout → degrade to CF + popularity, do not 500 the home
- Feedback loop (only show what you already rank) → exploration / bandits (name it)
- Metrics: retrieval recall@K, ranker AUC, p99, empty-list rate, A/B delta

## Startup vs FAANG angle

| FAANG / Spotify-scale | Startup |
| --- | --- |
| Multi-source retrieve + L1/L2 + feature platform | Co-visit table + popularity + one ranker |
| Dedicated eval / A/B stack | Weekly batch retrain, log-and-pray |

## Common mistakes

- “Fine-tune an LLM over the catalog” as v1 — latency and cost.
- Scoring the **whole** corpus with a deep net.
- CTR-only objective on long-form (clickbait).
- No seen-filter; no train/serve sketch; no cold-start path.

## Sources

- [Deep Neural Networks for YouTube Recommendations — Google Research](https://research.google.com/pubs/pub45530.html) — accessed 2026-09-05
- [Recommender system — Wikipedia](https://en.wikipedia.org/wiki/Recommender_system) — accessed 2026-09-05
- [Recommendation System Design Interview — System Design Academy](https://www.systemdesign.academy/interview/design-recommendation-system) — accessed 2026-09-05
- [Design a Recommendation System — HLD Handbook](https://hld.handbook.academy/curriculum/case-studies/recommendation-system/) — accessed 2026-09-05
