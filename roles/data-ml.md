# Data / ML / AI engineer

Focus: **data pipelines, SQL, statistics, ML lifecycle, and increasingly LLM/RAG system design**.

## Track variants

| Track | Emphasis |
| --- | --- |
| **Data engineer** | ETL/ELT, warehousing, Airflow/dbt, data quality |
| **ML engineer** | Training, deployment, monitoring, feature stores |
| **AI / LLM engineer** | RAG, evals, serving, cost, safety |

## Sample questions

### Data engineering

1. Design a batch + streaming pipeline for click analytics.
2. Slowly changing dimensions — Type 1 vs 2 vs 3.
3. Idempotent backfills; handling late-arriving data.
4. Data quality checks in CI for pipelines.
5. Star vs snowflake schema — when which?

### SQL (almost always)

1. Window functions — rank, running total, dedupe rows.
2. Optimize a query with EXPLAIN; indexes for joins.
3. Handle skew in a large GROUP BY.

### ML fundamentals

1. Bias-variance tradeoff; regularization purpose.
2. Precision vs recall — choose for fraud detection.
3. Train/validation/test leakage examples.
4. A/B test design — power, duration, guardrails.

### ML system design

1. Design a **recommendation system** (candidate generation + ranking).
2. Design **model serving** at scale (batch vs online, caching embeddings).
3. Design **feature store** for training/serving consistency.
4. Model monitoring — drift, data skew, performance decay.

### LLM / AI system design (2025–2026)

1. Design **RAG** for internal docs — chunking, retrieval, eval.
2. Design **LLM serving** — batching, KV cache, fallbacks.
3. Eval harness for agent tools — golden sets, regression gates.
4. Cost controls — routing small/large models.

### Coding

- SQL on LeetCode / Mode / StrataScratch
- Python pandas transformations
- Sometimes medium DSA depending on company

## Also study

- [../general/system-design.md](../general/system-design.md)
- [System Design 2025 AI/ML section — youngju.dev](https://www.youngju.dev/blog/culture/2026-03-22-system-design-interview-2025-complete-guide.en)

## Sources

- [System Design Interview 2025 — youngju.dev](https://www.youngju.dev/blog/culture/2026-03-22-system-design-interview-2025-complete-guide.en) — accessed 2026-08-22
- [Software Engineer Interview Questions — TalentVP](https://talentvp.com/en/blog/software-engineer-interview-questions) — accessed 2026-08-22
