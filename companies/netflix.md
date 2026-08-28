# Netflix engineering track

Sits beside [faang-big-tech.md](faang-big-tech.md) and [product-companies.md](product-companies.md): **senior-shaped, conversational, culture-weighted**. Netflix is often lumped into “FAANG,” but the loop grades **judgment and autonomy** as a primary axis, not as a side behavioral panel. Confirm level and AI policy with the recruiter — public reports say they hire almost exclusively at **Senior+** and skip a junior pipeline.

Typical timeline **4–8 weeks**. Coding still exists; it is usually **practical**, not puzzle-bait.

## How this track differs

| vs classic FAANG | vs late-stage product (Stripe / Uber) |
| --- | --- |
| Culture memo is homework, not flavor text | Less “bug-squash a repo,” more peer design talk |
| Team + hiring manager decide; no Google-style HC packet | Still a half-day loop with a high bar |
| Keeper-test framing in every debrief | Comp is **personal top of market**, not band theater |

Read the official [Culture Memo](https://jobs.netflix.com/culture) before the recruiter call. Interviewers notice summaries vs first-hand reading.

## Official culture (summarize, don’t recite)

Four principles from the memo: **Dream Team**, **People over process**, **Uncomfortably exciting**, **Great and always better**.

Signals they name in public:

| Phrase | Interview implication |
| --- | --- |
| Sports team, not a family | Performance + position fit, not tenure loyalty |
| **Keeper test** | “Would I fight to keep you / hire you again knowing what I know?” |
| **Context not control** | You decide with context; you do not wait for a committee |
| **Informed captain** + farm for dissent, then **disagree and commit** | One owner, solicited dissent, no lingering sabotage |
| Personal top of market | They will ask what you could make elsewhere; have a number |

Keeper test is a **management heuristic**, not a quiz you pass. In the loop it shows up as: would this interviewer still want you on the team in 18 months?

## Reported 2026 loop (guides; confirm)

1. Recruiter / culture pre-screen (~45 min) — memo alignment, level, comp expectations
2. Hiring manager (~45–60 min) — past work depth; first judgment read
3. Technical screen (~60 min) — one practical coding problem, sometimes a short design aside
4. Virtual / onsite **4–5 rounds**: coding, system design / architecture, **2 culture-or-judgment**, sometimes a director “bar” chat
5. Team decides; HM is the decision-maker (unlike Google HC)

Design probes: failure modes, blast radius, cost, “what the dashboard looks like when this breaks.” Reverse-design a system **you** shipped. Streaming vocabulary (CDN, ABR) helps for media teams — see [../answers/system-design-video-streaming.md](../answers/system-design-video-streaming.md) — but do not dump Open Connect trivia unprompted.

## Sample prompts (shapes, not leaked puzzles)

1. Walk through a decision you made with incomplete data. What did you bet, and were you right?
2. You have context but not permission. When do you act vs escalate?
3. Disagreed with a leader; they went the other way. What did you do after?
4. Design a catalog-streaming control plane: health of caches, failover, cost of a miss storm.
5. Practical coding: parse / model a small system; extend it when a constraint lands.

## Prep checklist

- [ ] Read the memo (Dream Team, keeper test, context not control, informed captain)
- [ ] 6–8 STAR stories framed as **judgment under freedom**, not process compliance
- [ ] One **practical** coding mock + one design with explicit failure/cost
- [ ] Recruiter: Senior vs Staff bar, AI tools, onsite vs virtual, team vs generalist loop

## Sources

- [Netflix Culture Memo — Careers at Netflix](https://jobs.netflix.com/culture) — accessed 2026-08-28
- [Netflix Culture Memo PDF](https://www.jobs.netflix.com/netflix-culture.pdf) — accessed 2026-08-28
- [Netflix Engineering Interview Guide — PhantomCodeAI](https://www.phantomcodeai.com/blogs/netflix-engineering-culture-interview-guide) — accessed 2026-08-28
- [Netflix Interview Guide 2026 — LastRound AI](https://lastroundai.com/blog/netflix-interview-guide) — accessed 2026-08-28
- [Inside the Netflix 2026 Engineering Loop — dglearning](https://dglearning.substack.com/p/inside-the-netflix-2026-engineering) — accessed 2026-08-28
