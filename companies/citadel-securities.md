# Citadel Securities engineering track

Sits beside [quant.md](quant.md) and [jane-street.md](jane-street.md): **market-making SWE (NYC / Miami / London / …)**, not Jane Street’s official open-ended pair loop and not Two Sigma’s three 60-minute codepair block. Official experienced page (Jul 2026): **one real problem, four stages, same engineer**. Recruiter confirms **Citadel vs Citadel Securities**, **SWE vs quant**, language (**C++ required on some reqs**), city, and AI.

Typical path: recruiter → coding screen → **4–5 hour** onsite (experienced) **or** ~eight-week campus loop. Pair / LLD: [../general/low-level-design.md](../general/low-level-design.md), [../general/code-review-rounds.md](../general/code-review-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (six values)

Do **not** invent Amazon LPs. Official [Our Culture](https://www.citadelsecurities.com/who-we-are/our-culture/): **evidence, not ego**. Map **your** stories.

| Official value | Careers one-liner |
| --- | --- |
| **Integrity** | Direct, accountable; compliance is not optional |
| **Winning** | Hard problems others walk away from |
| **Meritocracy** | Career and pay on delivered results |
| **Learning** | New ideas that strengthen the edge |
| **Extraordinary Colleagues** | Collaboration; more together than solo |
| **Mutuality** | Client success is the win |

“Why Citadel Securities?” that only says “HFT / I like C++” fails. Name a **latency, correctness, or incomplete-spec** problem you have lived. Official: Citadel (multi-strategy manager) and Citadel Securities (market maker) are **two firms**; campus loops interview **both**. Ask which entity and which loop.

## Official process — experienced (Jul 2026)

Official [Engineering Interview Process](https://www.citadelsecurities.com/careers/career-perspectives/our-engineering-interview-process/) + [onsite walkthrough](https://www.citadelsecurities.com/careers/career-perspectives/what-to-expect-at-an-engineering-onsite/).

| Stage | Official |
| --- | --- |
| Recruiter | Conversation |
| Technical screen | Coding |
| Onsite | **4–5 hours**, one problem: design → implement → **code review / extend** → discussion |
| Tools | Shared editor (CoderPad-class); many roles: **your** editor/language; some **C++** (they tell you) |
| Problem flavor | Drawn from systems they run (order book / matching / market-data) — **no** domain knowledge required |

Official: spec is **deliberately incomplete**; ask and name assumptions in the first minutes. They are **less interested in finishing** than in how thinking holds as constraints land. A partial system you can extend beats a finished one you cannot defend. Interviewers are **collaborators**, not silent observers. Breaks are built in.

## Official process — intern / new grad

Official [Internship and New Graduates](https://www.citadelsecurities.com/careers/career-perspectives/internship-and-new-graduates-engineering-interview-process/) (~eight weeks). **Not** team-matched until late.

| Stage | Official |
| --- | --- |
| First round | **45 min** video; coding + behavioral; Python/C++ core, any language welcome; CoderPad |
| Second round | Usually **three 45s**; tech + behavioral; next steps within **two weeks** |
| Leadership | Senior engineer **for a specific team** if a manager wants you (can be multiple teams) |
| Final review | Team fit; if several teams, recruiter helps you choose |

Official: one role at a time (eng vs quant); competing offer — **tell them**. Interviews Mon–Fri business hours only.

## How this track differs

| vs Jane Street / Two Sigma | vs FAANG |
| --- | --- |
| Official **one problem all day** (experienced) | Design is **order book / matching / pipeline**, not a social feed |
| Campus: Citadel **and** Citadel Securities in one process | “I only grind Blind 75” misses incomplete-spec + review |
| C++ locked on some experienced reqs | Finish is **not** the bar |

## Coding and design flavor

Experienced: scope out loud, write code another engineer would inherit, absorb a new SLO. Campus: DS/algo + “how you think” + why this firm. Related: [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md), [../general/cs-fundamentals.md](../general/cs-fundamentals.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** firm (Securities vs Citadel LLC) and this eng seat.
2. Screen: medium coding; narrate tests and what you would cut.
3. Experienced onsite: sketch a matching-shaped component, implement a slice, then a new constraint in review.
4. Values: a time the **best idea was not yours** (meritocracy / colleagues).
5. Questions: C++ vs flexible language, AI, NYC vs Miami, campus vs experienced slate.

## Prep checklist

- [ ] Read [experienced process](https://www.citadelsecurities.com/careers/career-perspectives/our-engineering-interview-process/) + [onsite](https://www.citadelsecurities.com/careers/career-perspectives/what-to-expect-at-an-engineering-onsite/) + [campus process](https://www.citadelsecurities.com/careers/career-perspectives/internship-and-new-graduates-engineering-interview-process/) + [culture](https://www.citadelsecurities.com/who-we-are/our-culture/)
- [ ] Recruiter: which firm, C++ lock, AI, onsite city, intern vs experienced
- [ ] One **progressive** design-then-implement mock (constraint in hour three) + STAR vs the **six** values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Experienced Professionals: Engineering Interview Process — Citadel Securities](https://www.citadelsecurities.com/careers/career-perspectives/our-engineering-interview-process/) — accessed 2026-10-28
- [What to Expect at an Engineering Onsite — Citadel Securities](https://www.citadelsecurities.com/careers/career-perspectives/what-to-expect-at-an-engineering-onsite/) — accessed 2026-10-28
- [Internship and New Graduates: Engineering Interview Process — Citadel Securities](https://www.citadelsecurities.com/careers/career-perspectives/internship-and-new-graduates-engineering-interview-process/) — accessed 2026-10-28
- [Our Culture — Citadel Securities](https://www.citadelsecurities.com/who-we-are/our-culture/) — accessed 2026-10-28
- [What We Look for in Experienced Engineers — Citadel Securities](https://www.citadelsecurities.com/careers/career-perspectives/what-we-look-for-in-experienced-engineers/) — accessed 2026-10-28
