# Quant / trading-firm SWE track

Sits beside [faang-big-tech.md](faang-big-tech.md): **collaborative coding that grows under you**, not “design Twitter” plus Blind 75 in silence. **SWE ≠ trader/researcher** — those loops still use probability and mental math. Confirm the **engineering** track with the recruiter.

Typical timeline **2–6 weeks**. Onsites are often **in-person** (NYC / London) even when the screen is Zoom.

## How this track differs

| vs FAANG | vs Seed startup |
| --- | --- |
| Problems **layer**: working v1, then overlaps / cycles / deletion | Still a long, structured day — not a founder chat |
| **Journey > final snapshot**; talking is the signal | Bar is FAANG-hard or harder on correctness + edges |
| Little standalone HLD; design is **types and extensibility in code** | Domain is markets/infra, but SWE prompts are CS, not “price this option” |

Related practice: [../general/pair-programming.md](../general/pair-programming.md) (collaboration) and [../general/low-level-design.md](../general/low-level-design.md) (abstractions). AI tools: **usually off** unless they say otherwise.

## Jane Street (official SWE process)

**Official:** human reviews every application; Zoom technical → **in-person** finals that are **mostly collaborative coding**. Write **real code** in the language you know best — **not** pseudocode. They **do not** ask SWE candidates mental math, olympiad puzzles, or logic games (those belong to other roles). **No bonus for OCaml**; they tell you **not** to use it unless it is already your strongest language. Most hires learn OCaml on the job. No advanced-degree requirement.

**What they score:** someone they want to work with. Prefer **open-ended** problems with several attacks, not algorithm bingo. Journey through the interview matters more than the snapshot at the end. Be nice, be clear, know your language, know what you don’t know.

**Reported shape:** ~30 min recruiter → ~60 min Zoom (one problem, parts escalate) → super-day of several **long** pair-coding rounds. Interviewers **nudge**; treat hints as collaboration. Strong first abstractions beat a clever one-liner that cannot extend.

**Prep:** fewer LeetCode hards, **more narration**. Practice “solution works → interviewer adds a constraint.” Read their mock video / old “Memo” write-up for **process**, not to memorize the question.

## Citadel Securities (official experienced-eng onsite)

**Official (Jul 2026):** recruiter → coding screen → onsite **one real problem, four stages, same engineer**: requirements/design → implement → **code review / extend** → discussion. **4–5 hours**. Shared editor (CoderPad-class). They watch incomplete specs, what you cut, whether another engineer would inherit the code, and how you react when an assumption dies. Business context (what the system is *for*) matters alongside correctness.

Do not confuse this with a Citadel **OA + three disconnected 45s** report on another entity — **ask which firm and which loop**.

## Two Sigma (SWE vs research)

Guides describe a **more FAANG-shaped** SWE path: timed OA (medium–hard) → live coding → onsite with coding **and** often **system design** (pipelines, realtime). Research/quant tracks add stats. Recruiter **triage between tracks** is real — do not prep the wrong one.

## Shared prep checklist

- [ ] Recruiter: SWE vs trader vs research; OCaml/C++/Python; AI; onsite city
- [ ] One **progressive** coding mock (interval / tree / state machine, then a twist)
- [ ] Language **containers and costs** cold — no syntax stalls
- [ ] Edges **before** they ask (empty, one element, cycle vs DAG)
- [ ] Jane Street: official prep page + mock; Citadel Securities: official four-stage page

## Sample questions (shapes, not leaked puzzles)

1. Scheduler / intervals: insert, then overlaps, then delete.
2. Nested structure: recurse, then sharing / cycles.
3. Small state machine or tick-based sim; then a performance constraint.
4. Citadel-style: design a component, implement a slice, then a new SLO.

## Sources

- [Preparing for a Software Engineering Interview — Jane Street](https://www.janestreet.com/preparing-for-a-software-engineering-interview/) — accessed 2026-08-27
- [Interviewing — Jane Street](https://www.janestreet.com/join-jane-street/interviewing/) — accessed 2026-08-27
- [What a Jane Street software engineering interview is like — Jane Street Blog](https://blog.janestreet.com/what-a-jane-street-dev-interview-is-like/) — accessed 2026-08-27
- [Experienced Professionals: Engineering Interview Process — Citadel Securities](https://www.citadelsecurities.com/careers/career-perspectives/our-engineering-interview-process/) — accessed 2026-08-27
- [What Jane Street’s SWE interview really tests — techinterview.org](https://www.techinterview.org/post/3233476389/jane-street-software-engineer-interview/) — accessed 2026-08-27
- [Jane Street SWE interview — Exponent](https://www.tryexponent.com/guides/jane-street-software-engineer-interview) — accessed 2026-08-27
