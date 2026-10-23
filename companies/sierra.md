# Sierra engineering track

Sits beside [intercom.md](intercom.md) and [ai-labs.md](ai-labs.md): **enterprise customer AI agents** (Bret Taylor / Clay Bavor), not Intercom’s Fin messenger loop and not an OpenAI work-trial. Official [About](https://sierra.ai/about): help businesses build **more human customer experiences with AI**. Official [Careers](https://sierra.ai/careers): **in-person, in-office** culture (SF HQ + NY / Atlanta / London / Singapore / Tokyo / Paris / Madrid / Toronto); interviews happen **at an office**. Recruiter confirms **Agent SWE vs SRE / security / infra**, office, early-career vs experienced, and which AI-native hours are on **your** loop.

Typical timeline **~3–6 weeks** (ask). AI-native build: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Debug / PR review: [../general/debugging-rounds.md](../general/debugging-rounds.md) and [../general/code-review-rounds.md](../general/code-review-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Do **not** invent extra LPs. Use the five on [About](https://sierra.ai/about). Map **your** stories.

| Official value | What they score |
| --- | --- |
| **Trust** | Accountability + quality with customers; safe, useful AI; you showed up for teammates |
| **Customer Obsession** | Outcomes, not tech milestones; you have sat with the customer; dropped work to fix an issue |
| **Craftsmanship** | Taste — words, architecture, the thing that was “fine” and you still fixed it |
| **Intensity** | Play to win; fail openly, no blame, then ship the next version |
| **Family** | Intensity **and** balance; you supported someone else’s life or win |

Careers: hiring scores **capabilities plus values alignment**. “Why Sierra?” that only says “I like agents / Bret / Salesforce” fails. Name a **handoff, eval, or production-agent** problem you have lived.

## Official process (Apr 2026 blog + careers)

Official [AI-native interview](https://sierra.ai/blog/the-ai-native-interview) (22 Apr 2026) replaced coding + algorithms onsites. Careers: interviews are **in office**. Early-career page: apply → **technical assessment** → meet the team → decision. Experienced mix — **ask**.

| Stage | Official |
| --- | --- |
| Recruiter / values | Capabilities + the five values; office you will interview in |
| System-design screen | Official: **replaced** the no-AI coding phone screen. Production / 1→N more than “vibe an app” |
| AI-native onsite | **Plan** (candidate drives a product in their domain) → **Build** (~**2 hours**, interviewer steps out, **any** AI tools / frameworks) → **Review** (demo, data model / abstractions, path to production, **how you used AI**) |
| Debug / PR pilot | Medium repo + a draft cross-cutting PR; review, run, iterate. Official: AI level **still TBD** |
| Early career (APX / new-grad) | Official: technical assessment, then collaborate on real-world scenarios |

Official scoring attributes for the new loop: **representative, high signal, positive experience**. They hire for **spikes**, not “no weaknesses.” OK to **cut scope** and skip CRUD/auth to show the unique piece. Pairs of interviewers + build-agnostic rubric (they say the format is hard to standardize). Infra loops are the **same shape**, slightly amended.

## How this track differs

| vs Intercom / Fin | vs FAANG / DoorDash AI hour |
| --- | --- |
| Official **2-hour solo build** after a plan conversation — not Minicom pair | DoorDash’s official hour is **60 min on a provided project**; Sierra lets **you** pick the product |
| In-office; values are Trust / Craft / Intensity / Family | System-design **screen**, not a Blind-75 phone |
| Customer-agent production path in the review | “I only grind LeetCode” is the wrong sport |

## Coding and design flavor

Official product: customer-facing agents with a human handoff. Live work: tool-use, evals, latency, policy, “the model was confidently wrong.” Related: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md), [../answers/system-design-chat.md](../answers/system-design-chat.md).

Design screen: how an agent reaches production — identity, tools, fallback, observability — not “design Twitter.” Build hour: pick a domain you actually know; narrate pivots.

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Sierra team — a customer-outcome story, not “agents are the future.”
2. Design screen: take a flaky agent from demo to a multi-brand SLA.
3. Plan/build: a product in **your** domain; skip boilerplate; leave a demo path.
4. Review: defend the data model; what you would not ship; how the agent was used.
5. Values: a time you dropped everything for a customer; a craft fix nobody asked for.

## Prep checklist

- [ ] Read [About](https://sierra.ai/about) + [Careers](https://sierra.ai/careers) + [AI-native interview](https://sierra.ai/blog/the-ai-native-interview)
- [ ] Recruiter: office, Agent vs infra, design-screen vs OA, debug-pilot, AI rules
- [ ] One **2-hour** scoped build with an agent + a 15-min production-path review
- [ ] One messy-repo PR review ([../general/code-review-rounds.md](../general/code-review-rounds.md))
- [ ] STAR vs the **five** values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [The AI-native interview — Sierra](https://sierra.ai/blog/the-ai-native-interview) — accessed 2026-10-23
- [About Sierra](https://sierra.ai/about) — accessed 2026-10-23
- [Careers — Sierra](https://sierra.ai/careers) — accessed 2026-10-23
- [Early Career Program — Sierra](https://sierra.ai/early-career-program) — accessed 2026-10-23
