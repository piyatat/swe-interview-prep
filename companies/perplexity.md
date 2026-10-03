# Perplexity engineering track

Sits beside [ai-labs.md](ai-labs.md) and [scale-ai.md](scale-ai.md): **answer-engine / agent product**, not a foundation-model lab or a labeling/eval shop. Official [Interview Guide](https://www.perplexity.ai/hub/careers/interview-guide) + [Technical Interviewing Portal](https://interviewresources.perplexity.ai/) are the process source of truth. One title for technical staff: **Member of Technical Staff**. Recruiter confirms **which subset of rounds** (they do **not** let you swap types), language, and AI-in-pad.

Typical timeline: hear back within **two weeks** of apply; offer or update within **a week** of the final interview (official careers). Coding flavor: [../general/low-level-design.md](../general/low-level-design.md). AI-on rounds: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official interviewing philosophy

Do **not** invent Amazon-style LPs. Official portal: strong candidates **think rigorously**, **control complexity**, **make principled tradeoffs**, **learn with high sample efficiency**, and **communicate clearly** (words and code). Official Interview Guide: all roles are **hands-on**; team match is **during the onsite**, not after a pool.

“Why Perplexity?” that only says “I use the search bar / AI is hot” fails. Name a **retrieval, citation, agent-state, or latency** problem you have lived.

## Official process

Official Interview Guide + portal. Recruiter names **your** mix.

| Stage | Official note |
| --- | --- |
| Application | Closest-fit role; reply within **two weeks** if they move |
| Recruiter phone screen | Fit, logistics |
| Technical assessment | Engineers: usually a **programming** interview |
| Onsite (4–5) | Includes a **hiring-manager deep dive** on past work |
| Founder / leader | After the onsite block |
| Offer | Within **a week** of the final interview |

Official technical types (subset per role — **no substitutions**):

| Type | Official shape |
| --- | --- |
| Practical Assessment | Online practical exercise |
| Hands-on Coding | Live 30–60 min CoderPad; **in-house** parts; **no LeetCode bank** |
| Spike Round | Async: **you** propose and ship a project (stack of choice) |
| Agentic Coding | **Must** use frontier agents; ~**3 h** async or **60–120 min** live |
| System Design | Live 45–60 min whiteboard; Perplexity-shaped domains |
| Core Expertise | Mastery of a named discipline |

Official Hands-on: **no AI / internet / other humans** except language docs or asking a tool about **library usage** (not “write my answer”). Official language list: Python (**strongly recommended**), C++, Go, TypeScript; **Java strongly discouraged**. Official design scores framing, high-order requirements, architecture-fit (not a memorized template), scale, tradeoffs, adaptability.

Official: no prior AI-product experience required; **how to use AI** is required. Virtual Hands-on: full-screen share on Google Meet — fix screenshare **before** the slot.

## How this track differs

| vs OpenAI / Anthropic | vs FAANG |
| --- | --- |
| Official **Spike** + **Agentic Coding** (agents **required** on that hour) | Hands-on is **practical abstractions**, not Blind-75 |
| One **MTS** title; match during onsite | Official: finishing every part is **not** required |
| Founder / leader closer | Guides add a Python-heavy screen — treat extra hours as **reported** |

## Coding and design flavor

Official Hands-on example (retired 2025–2026): agent **todo list** with dependencies and an LLM-readable render — state machine + graph, not DP recipes. Official: they **disfavor** LCS / edit-distance drills and esoteric heaps. Design: retrieval, citations, streaming answers, agent orchestration. Related: [../answers/system-design-search.md](../answers/system-design-search.md), [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** answer engine — a citation / freshness call you owned.
2. Hands-on: a multi-part state machine; plan before typing; do not invent wishlist features.
3. Spike: a scoped project you can **finish and defend**, not a weekend rewrite of the product.
4. Agentic: you steer the agent; you own the bugs it ships.
5. Questions for them: Spike vs Agentic vs Hands-on, language, AI policy **per hour**, team match.

## Prep checklist

- [ ] Read [Interview Guide](https://www.perplexity.ai/hub/careers/interview-guide) + [portal](https://interviewresources.perplexity.ai/) (Hands-on / Spike / Agentic / Design)
- [ ] Recruiter: exact rounds, Python vs other, screenshare, AI-per-hour
- [ ] One timed practical (state + dependencies), not a LeetCode grind-only week
- [ ] HM deep-dive stories with code-level detail
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Perplexity Interview Guide](https://www.perplexity.ai/hub/careers/interview-guide) — accessed 2026-10-03
- [Technical Interviews at Perplexity](https://interviewresources.perplexity.ai/) — accessed 2026-10-03
- [Hands-on Coding — Perplexity](https://interviewresources.perplexity.ai/hands-on-coding/) — accessed 2026-10-03
- [Spike Round — Perplexity](https://interviewresources.perplexity.ai/spike-round/) — accessed 2026-10-03
- [Agentic Coding — Perplexity](https://interviewresources.perplexity.ai/agentic-coding/) — accessed 2026-10-03
- [System Design — Perplexity](https://interviewresources.perplexity.ai/system-design/) — accessed 2026-10-03
- [Careers hub — Perplexity](https://www.perplexity.ai/hub/careers) — accessed 2026-10-03
