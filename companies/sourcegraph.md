# Sourcegraph engineering track

Sits beside [github.md](github.md) and [gitlab.md](gitlab.md): **code intelligence (search / Cody / large-repo understanding)**, not a git-host loop. Official [About](https://sourcegraph.com/about): bring insights from the **entire codebase** into the editor; **all-remote**, async. Official candidate handbook: [Engineering interview process](https://github.com/sourcegraph/handbook/blob/main/content/departments/people-talent/talent/process/engineering_interview_process_candidates.md). Recruiter confirms **search / Cody / platform vs frontend**, pairing vs walkthrough vs take-home, and recording preference (official: opt-out has **no** weight).

Typical timeline **varies by JD** (handbook: hiring managers compose the plan). Pair: [../general/pair-programming.md](../general/pair-programming.md). Review: [../general/code-review-rounds.md](../general/code-review-rounds.md). Search design: [../answers/system-design-search.md](../answers/system-design-search.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hire bar (do not invent extra pillars)

Official [values](https://github.com/sourcegraph/handbook/blob/main/content/company-info-and-process/values/index.md). Mission: **make it so everyone codes**. Values interview is **mandatory** for every role — two teammates **outside** the hiring department; **not** a skills hour ([evaluating values](https://github.com/sourcegraph/handbook/blob/main/content/departments/people-talent/talent/process/evaluating_values.md)).

| Official value | What they score |
| --- | --- |
| **Dev love** | You built for people who code — not “I use grep” |
| **High agency** | Unblocked yourself; owner when the playbook was missing |
| **Win together** | Collaboration **and** ownership; spoke up when it was hard |
| **Direct & transparent** | Candid feedback given **and** received; disagree-and-commit |

Handbook day-to-day they want interviews to proxy: reading **unfamiliar** code, async clarity, teaching as the domain expert. “Why Sourcegraph?” that only says “Cody / I like search” fails. Name a **code-nav, index, or permissions-at-scale** problem you have lived.

## Official process (handbook)

Official [candidate process](https://github.com/sourcegraph/handbook/blob/main/content/departments/people-talent/talent/process/engineering_interview_process_candidates.md) + [types of interviews](https://github.com/sourcegraph/handbook/blob/main/content/departments/people-talent/talent/process/types_of_interviews.md). **Your JD** lists which technical seats you get.

| Stage | Official |
| --- | --- |
| Recruiter screen (~30m) | Background, interest, process, comp / benefits |
| Hiring manager (~30–60m) | Role fit |
| Resume deep dive (~60m) | Motivation behind decisions; strengths / gaps; values skim |
| Team technical (2 × 45–60m) | Menu: architecture discussion, **code walkthrough**, pairing, API-client coding, complex-problem dive, frontend CodeSandbox + Figma |
| Cross-functional (~60m) | **1 PM + 1 designer** — scope, tradeoffs, audience |
| Values (~30m) | Four values only; structured behavioral |
| Leadership (~30m) + references | Then offer |

Walkthrough: **you** pick a repo / library you know; they zoom layers and ask “what would change if…”. Pairing: two engineers (one may shadow). Coding skills hour: implement an **API client together**. Ask which seats **your** loop uses.

## How this track differs

| vs GitHub / GitLab | vs FAANG web |
| --- | --- |
| Official **handbook-first** loop + out-of-dept values hour | Design is **code graph / search / Cody**, not “design Twitter” |
| You often **drive your own code**, not a surprise puzzle | Cross-functional hour with PM **and** design is published |
| All-remote async is the default (About) | “I only grind Blind 75” misses walkthrough + values |

## Coding and design flavor

Applied TypeScript / Go more than contest DSA. Search: inverted index, permissions, ranking. Cody / agents: context windows, evals. Related: [../answers/system-design-search.md](../answers/system-design-search.md), [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** code-intel product — portable “I like developer tools” is weak.
2. Walkthrough: pick a library; start at init or a test; narrate tradeoffs they did not write.
3. Architecture: search over a multi-GB monorepo — what you drop when the index is stale.
4. Values: high agency — a problem **outside your scope** you still closed.
5. Questions for them: walkthrough vs pair vs take-home, Cody vs search team, AI-in-pad.

## Prep checklist

- [ ] Read [values](https://github.com/sourcegraph/handbook/blob/main/content/company-info-and-process/values/index.md) + [candidate process](https://github.com/sourcegraph/handbook/blob/main/content/departments/people-talent/talent/process/engineering_interview_process_candidates.md) + the JD
- [ ] Recruiter: which technical seats, language, recording, AI policy
- [ ] One repo you can drive for 45 min + one search / Cody sketch
- [ ] Four value stories (initiative + candid feedback at minimum)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Resources for Candidates — Engineering Interview Process](https://github.com/sourcegraph/handbook/blob/main/content/departments/people-talent/talent/process/engineering_interview_process_candidates.md) — accessed 2026-10-10
- [Types of interviews — Sourcegraph handbook](https://github.com/sourcegraph/handbook/blob/main/content/departments/people-talent/talent/process/types_of_interviews.md) — accessed 2026-10-10
- [Evaluating values — Sourcegraph handbook](https://github.com/sourcegraph/handbook/blob/main/content/departments/people-talent/talent/process/evaluating_values.md) — accessed 2026-10-10
- [Sourcegraph values](https://github.com/sourcegraph/handbook/blob/main/content/company-info-and-process/values/index.md) — accessed 2026-10-10
- [About — Sourcegraph](https://sourcegraph.com/about) — accessed 2026-10-10
- [Careers — Sourcegraph](https://sourcegraph.com/jobs) — accessed 2026-10-10
