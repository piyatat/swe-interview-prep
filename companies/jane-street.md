# Jane Street engineering track

Sits beside [quant.md](quant.md) and [twosigma.md](twosigma.md): **collaborative pair-coding SWE (NYC / London / Hong Kong / …)**, not Citadel Securities’ official one-problem four-stage day and not a Blind-75 silent pad. Official [Preparing for a Software Engineering Interview](https://www.janestreet.com/preparing-for-a-software-engineering-interview/): they want to know **whether they want to work with you**. Recruiter confirms **SWE vs trading vs research vs ML**, language, office, and AI (usually **off** unless they say otherwise).

Typical official path: human-reviewed application → Zoom technical → **in-person** finals that are **mostly collaborative coding**. Pair: [../general/pair-programming.md](../general/pair-programming.md). LLD: [../general/low-level-design.md](../general/low-level-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (work-with, not invented LPs)

Do **not** invent Amazon-style principles. Official prep page scores **someone they want to work with**. Map **your** stories.

| Official signal | Prep one-liner |
| --- | --- |
| **Be nice** | Collaboration, not a puzzle exam |
| **Be clear** | Narrate; the **journey** beats the final snapshot |
| **Know your language** | Real code, not pseudocode; containers and costs cold |
| **Know what you don’t know** | Say the gap; take the nudge |

“Why Jane Street?” that only says “OCaml / HFT / I like puzzles” fails. Name a **progressive-constraint, correctness, or abstraction** problem you have lived. Official [Interviewing](https://www.janestreet.com/join-jane-street/interviewing/): **no OCaml bonus**; **do not** try OCaml for the first time in the interview. Most hires learn it on the job. No advanced-degree requirement. Casual office; they cover travel for onsites.

## Official process

Official SWE structure (prep page + interviewing FAQ). Recruiter still wins on the week-of slate.

| Stage | Official |
| --- | --- |
| Application | **Human** review; they try to reply in about a week; they may suggest another role |
| Zoom technical | Coding in a **real language** you know; one problem that can grow |
| Finals | **In person** in an office; mostly / exclusively **collaborative coding** |
| After | Hear back **within a week**; follow up if not |
| Reapply | Allowed; campus ~**a year**; experienced hires when the resume actually changed |

Official: they consider you for **every open role**, not only the req you clicked. SWE ≠ trader: **no** mental math, olympiad, or logic puzzles on the engineering track. Exploding offer elsewhere — **tell them**; they will try to expedite. Weekend interviews: **no**.

Guides (getcracked 2026; treat round *counts* as **reported**): ~45–60 min Zoom with follow-ups, then several long pair hours + lunch/Q&A. Interviewers **nudge**; treat hints as collaboration.

## How this track differs

| vs Citadel Sec / Two Sigma | vs FAANG |
| --- | --- |
| Official **open-ended pair**, not one-problem four-stage or three 60s | Little standalone “design Twitter”; design is **types in code** |
| Official **no LeetCode bingo / no mental math** for SWE | “I only grind hards silently” misses the journey score |
| OCaml is **post-hire**, not a filter | Strong first abstractions beat a clever one-liner that cannot extend |

## Coding and design flavor

Official: prefer problems with **several attacks** and maybe **no single best answer**. Practice “v1 works → interviewer adds a constraint.” Interval / tree / nested structure / small state machine, then overlaps, cycles, or a performance twist. Related: [../answers/coding-merge-intervals.md](../answers/coding-merge-intervals.md), [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Jane Street SWE seat (core systems vs trading-adjacent tools) — portable “I like trading” is weak.
2. Zoom: one open-ended coding problem; narrate; ask what you don’t know.
3. Finals pair: working solution, then a new constraint that breaks the first abstraction.
4. Language: pick the one you are fastest in; switch if the problem wants different tools.
5. Questions: office, AI-off, SWE vs research vs ML, mock video they publish.

## Prep checklist

- [ ] Read [Preparing for a SWE interview](https://www.janestreet.com/preparing-for-a-software-engineering-interview/) + [Interviewing](https://www.janestreet.com/join-jane-street/interviewing/) + their mock / old walkthrough **for process**, not to memorize the question
- [ ] Recruiter: track, language, city, AI, Zoom vs in-person finals
- [ ] Two **progressive** pair mocks (constraint lands after v1) with **no** assistant
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Preparing for a Software Engineering Interview — Jane Street](https://www.janestreet.com/preparing-for-a-software-engineering-interview/) — accessed 2026-10-28
- [Interviewing — Jane Street](https://www.janestreet.com/join-jane-street/interviewing/) — accessed 2026-10-28
- [What a Jane Street software engineering interview is like — Jane Street Blog](https://blog.janestreet.com/what-a-jane-street-dev-interview-is-like/) — accessed 2026-10-28
- [The Jane Street Interview Process — 2020 Edition — Jane Street Blog](https://blog.janestreet.com/jane-street-interview-process-2020/) — accessed 2026-10-28
- [Jane Street Interview Process for Software Engineers (2026) — getcracked](https://getcracked.io/blog/navigating-the-jane-street-interview-swe) — accessed 2026-10-28
